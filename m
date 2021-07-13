Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C33C6FFB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 13:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155333.286751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3GxE-0007VS-Hg; Tue, 13 Jul 2021 11:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155333.286751; Tue, 13 Jul 2021 11:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3GxE-0007T2-Eo; Tue, 13 Jul 2021 11:52:00 +0000
Received: by outflank-mailman (input) for mailman id 155333;
 Tue, 13 Jul 2021 11:51:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPIt=MF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1m3GxC-0007Sw-Eh
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 11:51:58 +0000
Received: from mx.upb.ro (unknown [141.85.13.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4df6a12-17ab-4e9e-932a-aef0a6d5958b;
 Tue, 13 Jul 2021 11:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 197C5B56007F;
 Tue, 13 Jul 2021 14:51:54 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id As47PXx6yl0A; Tue, 13 Jul 2021 14:51:50 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 44382B56008E;
 Tue, 13 Jul 2021 14:51:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YxEouSP46Lan; Tue, 13 Jul 2021 14:51:50 +0300 (EEST)
Received: from [192.168.1.35] (unknown [82.78.48.206])
 by mx.upb.ro (Postfix) with ESMTPSA id AE319B56007F;
 Tue, 13 Jul 2021 14:51:49 +0300 (EEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a4df6a12-17ab-4e9e-932a-aef0a6d5958b
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v4 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE
 redefinition error
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, julien Grall <julien@xen.org>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
 <83beb95e3633b1aca7801fd8592406e2057f9bdc.1623155575.git.costin.lupu@cs.pub.ro>
 <bcc8d8c6-f9d2-6fdc-4533-398b7f261126@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <9e20b180-a122-6a0c-fa13-249a8279547c@cs.pub.ro>
Date: Tue, 13 Jul 2021 14:51:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bcc8d8c6-f9d2-6fdc-4533-398b7f261126@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

First of all sorry for breaking the stubdom build. Please see inline.

On 7/13/21 9:47 AM, Jan Beulich wrote:
> On 08.06.2021 14:35, Costin Lupu wrote:
>> --- a/tools/libs/foreignmemory/private.h
>> +++ b/tools/libs/foreignmemory/private.h
>> @@ -1,6 +1,7 @@
>>  #ifndef XENFOREIGNMEMORY_PRIVATE_H
>>  #define XENFOREIGNMEMORY_PRIVATE_H
>>  
>> +#include <xenctrl.h>
>>  #include <xentoollog.h>
>>  
>>  #include <xenforeignmemory.h>
> 
> At the risk of repeating what may have been discussed on irc already yesterday
> (which I would not have seen), this is the cause for the present smoke test
> failure:
> 
> In file included from /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:39,
>                  from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:36,
>                  from private.h:4,
>                  from minios.c:29:
> /home/osstest/build.163627.build-amd64/xen/xen/include/public/memory.h:407:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(const_uint8) buffer;
>      ^~~~~~~~~~~~~~~~~~~
> In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:36,
>                  from private.h:4,
>                  from minios.c:29:
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:101:34: error: field 'arch' has incomplete type
>      struct xen_arch_domainconfig arch;
>                                   ^~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:152:34: error: field 'arch_config' has incomplete type
>      struct xen_arch_domainconfig arch_config;
>                                   ^~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:182:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_pfn_t) array;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:263:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint8) dirty_bitmap;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:280:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(vcpu_guest_context_t) ctxt; /* IN/OUT */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:301:26: error: field 'nodemap' has incomplete type
>      struct xenctl_bitmap nodemap;/* IN */
>                           ^~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:337:26: error: field 'cpumap_hard' has incomplete type
>      struct xenctl_bitmap cpumap_hard;
>                           ^~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:338:26: error: field 'cpumap_soft' has incomplete type
>      struct xenctl_bitmap cpumap_soft;
>                           ^~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:418:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>              XEN_GUEST_HANDLE_64(xen_domctl_schedparam_vcpu_t) vcpus;
>              ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:473:5: error: unknown type name 'int64_aligned_t'
>      int64_aligned_t time_offset_seconds; /* applied to domain wallclock time */
>      ^~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:480:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint8) buffer; /* IN/OUT: data, or call
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:533:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>              XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
>              ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:544:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint32)  sdev_array;   /* OUT */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:685:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* IN/OUT */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:735:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint8) buffer;  /* OUT: buffer to write record into */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:909:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint64) buffer;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:963:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_domctl_vcpu_msr_t) msrs; /* IN/OUT */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:984:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint) vdistance;
>      ^~~~~~~~~~~~~~~~~~~
> In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:38,
>                  from private.h:4,
>                  from minios.c:29:
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:56:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(char) buffer;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:73:26: error: field 'cpu_mask' has incomplete type
>      struct xenctl_bitmap cpu_mask;
>                           ^~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:155:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_sysctl_perfc_desc_t) desc;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:165:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_domctl_getdomaininfo_t) buffer;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:174:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(const_char) keys;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:188:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_sysctl_cpuinfo_t) info;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:217:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:225:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:317:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint32) affected_cpus;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:474:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_sysctl_lockprof_data_t) data;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:504:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_sysctl_cputopo_t) cputopo;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:537:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_sysctl_meminfo_t) meminfo;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:563:26: error: field 'cpumap' has incomplete type
>      struct xenctl_bitmap cpumap; /*     OUT: IF */
>                           ^~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:665:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>              XEN_GUEST_HANDLE_64(xen_sysctl_arinc653_schedule_t) schedule;
>              ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:707:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(char) buffer; /* OUT */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:738:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(physdev_pci_device_t) devs;
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:814:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint32) features; /* OUT: */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:887:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(char) name;         /* IN: pointer to name. */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:912:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(uint8) payload;     /* IN, the ELF file. */
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:975:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_livepatch_status_t) status;  /* OUT. Must have enough
>      ^~~~~~~~~~~~~~~~~~~
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:1059:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
>      XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* OUT */
>      ^~~~~~~~~~~~~~~~~~~
> In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:55,
>                  from private.h:4,
>                  from minios.c:29:
> /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/arch-x86/xen-mca.h:431:5: error: unknown type name 'xenctl_bitmap_t'
>      xenctl_bitmap_t cpumap;
>      ^~~~~~~~~~~~~~~
> In file included from private.h:4,
>                  from minios.c:29:
> /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:468:34: error: field 'arch_config' has incomplete type
>      struct xen_arch_domainconfig arch_config;
>                                   ^~~~~~~~~~~
> 
> Clearly xenctrl.h cannot be included freely right now; it expects other
> header to have been included first. Question is whether that's what needs
> fixing, or whether the new #include wants prefixing by whatever prereq
> headers that are needed. Or whether, considering that libxenforeignmemory.so
> doesn't depend on libxc.so, including xenctrl.h is inappropriate here in the
> first place, meaning that the tool stack's PAGE_SIZE abstraction may want to
> move to a separate header which is not tied to any particular library.
> 

XEN_GUEST_HANDLE_64 is defined in xen.h. The xenctrl.h header does
include xen.h before including memory.h, where XEN_GUEST_HANDLE_64 is
used. However, xen.h is also included before that inclusion by
mini-os/os.h (included by minios.c) without defining __XEN_TOOLS__ and
thus disabling the definition of XEN_GUEST_HANDLE_64 from xen.h.

Although moving the PAGE_SIZE abstraction definitions in a header of its
own would fix this build issue, we would still have the problem
described above, i.e. we include xen.h without defining __XEN_TOOLS__,
but we would need toolstack definitions. This is a bit unclear for me,
shouldn't __XEN_TOOLS__ be defined for a stubdom?

Having said that, I can create a new header for the toolstack PAGE_SIZE
abstraction, but I would need some name suggestions. Would
xenctrl_page.h be ok? Would we keep the XC_PAGE_* names if we consider
that they will be toolstack specific (and not tied to xenctrl lib)?.


Cheers,
Costin

