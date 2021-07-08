Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E63C16DB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 18:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153223.283080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WY2-0004av-8d; Thu, 08 Jul 2021 16:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153223.283080; Thu, 08 Jul 2021 16:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WY2-0004Xv-4N; Thu, 08 Jul 2021 16:06:46 +0000
Received: by outflank-mailman (input) for mailman id 153223;
 Thu, 08 Jul 2021 16:06:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1WY0-0004Xp-Vv
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 16:06:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1WY0-0001qt-Py; Thu, 08 Jul 2021 16:06:44 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1WY0-0006fh-JR; Thu, 08 Jul 2021 16:06:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=NMp5Iq+XPGr19gNXrSBf67+iNiC+S4afAtG15Bllq0E=; b=351+y2F7j8m0eBfvdoVdJUQpHE
	bxt/CKCgRa6PaeJPf3AIyesVVqrT7V0CsaXMlQ/CZk6xa+mEqYAyj2BKRJzf2avYzTecWKKT+3OFw
	E7kgFGuF6Pt04D+24kI6WiOMWRTCxNYlq5T6SYnTsdwvEHdVR9hhDDnOa1bpPhioMxr8=;
Subject: Re: Xen/ARM API issue (page size)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
 <8c7d9d21-d8be-d33f-6d37-dfb54f74c179@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2f27358a-e1d1-4627-3608-0c2fcd0754c0@xen.org>
Date: Thu, 8 Jul 2021 17:06:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8c7d9d21-d8be-d33f-6d37-dfb54f74c179@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

I will answer the two e-mails at the same time as my answer will be 
similar :).

On 08/07/2021 02:05, Andrew Cooper wrote:
> On 08/07/2021 01:32, Elliott Mitchell wrote:
>> Hopefully I'm not about to show the limits of my knowledge...
>>
>> Quite a few values passed to Xen via hypercalls include a page number.
>> This makes sense as that maps to the hardware.  Problem is, I cannot help
>> but notice aarch64 allows for 4KB, 16KB and 64KB pages.
> 
> Yes - page size is a know error through the ABI, seeing as Xen started
> on x86 and 4k is the only size considered at the time.
> 
> 32bit frame numbers were all the rage between the Pentum 2 (1997) and
> the advent of 64bit systems (~2006), because they let you efficiently
> reference up to 16T of physical memory, rather than being limited at 4G
> if you used byte addresses instead.
> 
> It will be addressed in ABIv2 design (if I ever get enough time to write
> everything down and make a start).

IIRC, ABIv2 will only focus on the interface between the hypervisor and 
the guests. However, I think we will also need to update the PV protocol 
so two domains agree on the page granularity used.

> 
>> I don't know how flexible aarch64 is.  I don't know whether an aarch64
>> core can support multiple page sizes.  My tentative reading of
>> information seemed to suggest a typical aarch64 core /could/ allow
>> multiple page sizes.

The Arm architecture allows the hypervisor and the kernel to chose its 
own granularity. IOW, a kernel may use 4KB when the hypervisor use 64KB.

Most of the arm64 cores supports all the page granularity. That said, 
this is not a requirement from the Arm Arm, so it may be possible to 
have cores only supporting a subset of the page granularity.

>>
>> What happens if a system (and Xen) is setup to support 64KB pages, but a
>> particular domain has been built strictly with 4KB page support?

If the processor only support 64KB, then you would not be able to boot a 
4KB kernel there.

>>
>> What if a particular domain wanted to use 64KB pages (4KB being too
>> granular), but Xen was set to use 4KB pages?
Today the hypercall ABI using the same page granularity as the 
hypervisor. IOW, the domain would need to break its page in 4KB chunk to 
talk to the hypervisor.

FWIW, this is how Linux with 64KB/16KB page granularity is able to run 
on current Xen.

>>
>> What if a system had two domains which were set for different page sizes,
>> but the two needed to interact?

They would need to agree on the page granularity used. At the moment, 
this is implicitely fixed to 4KB.

> 
> I'm afraid I'll have to defer to the arm folk to answer this, but my
> understanding is that it should be possible to support guests compiled
> with, and using, different page sizes (given a suitable ABI).
> 
>> Then you have things like VCPUOP_register_vcpu_info.  The structure is
>> setup as mfn and offset.  With the /actual/ page size being used there,
>> it is troublesome.  Several places might work better if pure 64-bit
>> addresses were used, but with alignment requirements specified.
> 
> The way to fix size problems is to mandate that all addresses in the ABI
> are full byte addresses, not frame numbers.  When alignment is required,
> and it frequently is, it is fine to use the lower bits for metadata.
> 
> Critically, what his means is that you don't need separate API/ABI's
> based on page size.  e.g. "please balloon out this page" operates "on
> the alignment the guest is using", rather than needing separate ops for
> 4k/2M/1G (to list the x86 page sizes only).

I think the full address is not sufficient here. The stage-2 page-table 
(aka EPT on x86) is using the page granularity of the hypervisor.

So for anything that requires change in the P2M, the domain needs to 
make sure the address is aligned to the page granularity of the hypervisor.

Cheers,

-- 
Julien Grall

