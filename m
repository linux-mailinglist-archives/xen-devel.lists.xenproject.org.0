Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08982212B58
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 19:35:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr36s-0000xw-I2; Thu, 02 Jul 2020 17:34:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpFn=AN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jr36r-0000xr-8L
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 17:34:53 +0000
X-Inumbo-ID: 560e87e0-bc8a-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560e87e0-bc8a-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q26iJJNm1J2GxnnFPGVie/uZdpJ0fBopyLEBAH0PjRI=; b=o5xV1fcf5oYACBK+NfLOGn/sMa
 x9rMVWXMxMu5hJrduzSpfe2EZPqhI3pOQ6HoqJlAS8jLJV1GYleTl5Ltw8dH/VzRehecaLiKpnTGF
 q8LedVTch6SCPlN9rGmJzhFSt/6PP3TRJcUQGB/Z3VXUbQsaK9qhabe5C/Vg01bmyCOE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr36p-0007Ao-M7; Thu, 02 Jul 2020 17:34:51 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr36p-0002P1-2Z; Thu, 02 Jul 2020 17:34:51 +0000
Subject: Re: Kexec and libxenctlr.so
To: Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <20200626110812.hxeoomagamkdceu7@liuwe-devbox-debian-v2>
From: Julien Grall <julien@xen.org>
Message-ID: <aa5ad259-5848-e8c4-61e8-6649bb65ece5@xen.org>
Date: Thu, 2 Jul 2020 18:34:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626110812.hxeoomagamkdceu7@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "paul@xen.org" <paul@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 daniel.kiper@oracle.com,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Wei,

On 26/06/2020 12:08, Wei Liu wrote:
> On Thu, Jun 11, 2020 at 03:57:37PM +0100, Julien Grall wrote:
>> Hi all,
>>
>> kexec-tools has an option to load dynamically libxenctlr.so (not .so.4.x)
>> (see [1]).
>>
>> Given that the library has never been considered stable, it is probably a
>> disaster that is waiting to happen.
>>
>> Looking at the tree kexec is using the follow libxc functions:
>>     - xc_kexec_get_range()
>>     - xc_kexec_load()
>>     - xc_kexec_unload()
>>     - xc_kexec_status()
>>     - xc_kexec_exec()
>>     - xc_version()
>>     - xc_interface_open()
>>     - xc_interface_close()
>>     - xc_get_max_cpus()
>>     - xc_get_machine_memory_map()
>>
>> I think it is uncontroversial that we want a new stable library for all the
>> xc_kexec_* functions (maybe libxenexec)?
> 
> That sounds fine to me.
> 
> Looking at the list of functions, all the xc_kexec_* ones are probably
> already rather stable.

That's my understanding as well.

Although, we may want to rethink some of the hypercalls (such as 
KEXEC_cmd_kexec_get_range) in the future as they have different layout 
between 32-bit and 64-bit. Thanksfully this wasn't exposed outside of 
libxc, so it shouldn't be an issue to have a stable library.

> 
> For xc_interface_open / close, they are perhaps used only to obtain an
> xc handle such that it can be used to make hypercalls. You new kexec
> library is going to expose its own handle with a xencall handle wrapped
> inside, so you can do away with an xc handle.

I have already a PoC for the new library. I had to tweak a bit the list 
of helpers as some use hypercalls arguments directly. Below, the 
proposed interface:

/* Callers who don't care don't need to #include <xentoollog.h> */
struct xentoollog_logger;

typedef struct xenkexec_handle xenkexec_handle;

typedef struct xenkexec_segments xenkexec_segments;

xenkexec_handle *xenkexec_open(struct xentoollog_logger *logger,
                                unsigned int open_flags);
int xenkexec_close(xenkexec_handle *khdl);

int xenkexec_exec(xenkexec_handle *khdl, int type);
int xenkexec_get_range(xenkexec_handle *khdl, int range, int nr,
                        uint64_t *size, uint64_t *start);
int xenkexec_load(xenkexec_handle *khdl, uint8_t type, uint16_t arch,
                   uint64_t entry_maddr, uint32_t nr_segments,
                   xenkexec_segments *segments);
int xenkexec_unload(xenkexec_handle *khdl, int type);
int xenkexec_status(xenkexec_handle *khdl, int type);

xenkexec_segments *xenkexec_allocate_segments(xenkexec_handle *khdl,
                                               unsigned int nr);
void xenkexec_free_segments(xenkexec_handle *khdl, xenkexec_segments *segs);

int xenkexec_update_segment(xenkexec_handle *khdl, xenkexec_segments *segs,
                             unsigned int idx, void *buffer, size_t 
buffer_size,
                             uint64_t dest_maddr, size_t dest_size);


> 
>>
>> However I am not entirely sure where to put the others.
>>
>> I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is a
>> XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() (despite
>> it is a XENMEM_).
>>
> 
> Introducing an libxensysctl before we stabilise sysctl interface seems
> wrong to me. We can bury the call inside libxenkexec itself for the time
> being.

That would work for me.

> 
>> For xc_version(), I am thinking to extend libxentoolcore to also include
>> "stable xen API".
>>
> 
> If you can do without an xc handle, do you still need to call
> xc_version?

Looking at kexec, xc_version() is used by crashdump to determine which 
architecture is used by Xen (in this case 32-bit x86 vs 64-bit x86).

The was introcuded by commit:

commit cdbc9b011fe43407908632d842e3a39e495e48d9
Author: Ian Campbell <ian.campbell@xensource.com>
Date:   Fri Mar 16 10:10:24 2007 +0000

     Set crash dump ELF header e_machine field based on underlying 
hypervisor architecture.

     This is necessary when running Xen with a 64 bit hypervisor and 32 bit
     domain 0 since the CPU crash notes will be 64 bit.

     Detecting the hypervisor archiecture requires libxenctrl and 
therefore this
     support is optional and disabled by default.

     Signed-off-by: Ian Campbell <ian.campbell@xensource.com>
     Acked-by: Magnus Damm <magnus@valinux.co.jp>
     Signed-off-by: Simon Horman <horms@verge.net.au>

As we drop support for 32-bit Xen quite a long time ago, we may be able 
to remove the call to xc_version().

Cheers,

-- 
Julien Grall

