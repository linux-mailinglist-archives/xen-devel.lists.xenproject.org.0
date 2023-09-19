Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72F7A5ECF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604528.941957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXQp-0007Cl-Qb; Tue, 19 Sep 2023 09:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604528.941957; Tue, 19 Sep 2023 09:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXQp-0007A1-NA; Tue, 19 Sep 2023 09:54:11 +0000
Received: by outflank-mailman (input) for mailman id 604528;
 Tue, 19 Sep 2023 09:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZx6=FD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qiXQo-00079v-5v
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:54:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 799d7c5f-56d2-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 11:54:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 680A64EE0737;
 Tue, 19 Sep 2023 11:54:07 +0200 (CEST)
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
X-Inumbo-ID: 799d7c5f-56d2-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 11:54:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
In-Reply-To: <9c43273a-cf20-73bf-96fb-f3095ce3a122@suse.com>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
 <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
 <ed1f468463841e7f3f5bb90de4d9a227@bugseng.com>
 <9c43273a-cf20-73bf-96fb-f3095ce3a122@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <efe4e781aeefb63b9ac3e1ceecb54f97@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2023 11:33, Jan Beulich wrote:
> On 19.09.2023 11:19, Nicola Vetrini wrote:
>> I just noticed one further issue with making BYTES_PER_LONG unsigned, 
>> in
>> that causes
>> several instances of (1U << 3) to appear inside the file
>> xen/arch/x86/xen.lds
>> produced by the build, which in turn causes ld to fail on that 'U'.
> 
> That should be avoidable if _AC() is used in the #define.
> 

I think all instances on x86 are caused  by
. = ALIGN(POINTER_ALIGN);
where, for all arches in xen/arch/<arch>/include/asm/config.h there is
#define POINTER_ALIGN BYTES_PER_LONG

$ grep -B 1 -A 1 "1U" xen.lds
        *(.data.rel.ro.*)
        . = ALIGN((1U << 3)); __start_vpci_array = .; 
*(SORT(.data.vpci.*)) __end_vpci_array = .;
   } :text
--
        *(.init.bss.stack_aligned)
        . = ALIGN((1U << 3));
        __initdata_cf_clobber_start = .;
--
        *(.init.rodata.*)
        . = ALIGN((1U << 3));
        __setup_start = .;
--
        *(.bss .bss.*)
        . = ALIGN((1U << 3));
        __bss_end = .;


Do you think changing the definition of POINTER_ALIGN will break 
something?

--
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

