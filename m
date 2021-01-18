Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A632F9CFD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69572.124621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1S26-0006VN-Iz; Mon, 18 Jan 2021 10:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69572.124621; Mon, 18 Jan 2021 10:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1S26-0006Uy-FW; Mon, 18 Jan 2021 10:45:14 +0000
Received: by outflank-mailman (input) for mailman id 69572;
 Mon, 18 Jan 2021 10:45:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l1S25-0006Us-Hb
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:45:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1S24-0007mM-K5; Mon, 18 Jan 2021 10:45:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1S24-0008S3-9h; Mon, 18 Jan 2021 10:45:12 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PcJ3AMeK+g/vGDeMb33tbpirMIharxuT7BBsdMtYA44=; b=N+kuoALt4+AeB8s0HITCpkgYxl
	WIttqWiT5Bd/nRa0hpC1WjZobEFH7+h+Vx95xGZwsrGrFO/X0DtL7T3dRtf+9w0VRpHpqEcMpl8Xp
	xCwdm/62UWp9ta5u9qC2apDe7WYxURxYCWt4gC+q+AY4wk99Lg7d1opeweZ07tW8ib7Q=;
Subject: Re: [PATCH 1/3] introduce unaligned.h
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 M A Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
 <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
 <78ecd61e-bdfb-169c-1db3-b9914fca7f3d@suse.com>
 <6afa47a8-aa63-f8aa-c648-e5e8e51b845a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <70ad73e4-c9d2-ec55-dc40-14567a0838af@xen.org>
Date: Mon, 18 Jan 2021 10:45:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6afa47a8-aa63-f8aa-c648-e5e8e51b845a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 18/01/2021 09:33, Jan Beulich wrote:
> On 15.01.2021 12:27, Jan Beulich wrote:
>> On 15.01.2021 12:13, Andrew Cooper wrote:
>>> On 15/01/2021 10:05, Jan Beulich wrote:
>>>> Rather than open-coding commonly used constructs in yet more places when
>>>> pulling in zstd decompression support (and its xxhash prereq), pull out
>>>> the custom bits into a commonly used header (for the hypervisor build;
>>>> the tool stack and stubdom builds of libxenguest will still remain in
>>>> need of similarly taking care of). For now this is limited to x86, where
>>>> custom logic isn't needed (considering this is going to be used in init
>>>> code only, even using alternatives patching to use MOVBE doesn't seem
>>>> worthwhile).
>>>>
>>>> No change in generated code.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Iirc use of include/asm-generic/ was disliked, hence the generic header
>>>> goes into include/xen/.
>>>
>>> Really?  I think its going to be the only sane way of fixing up some of
>>> our header tangle.
>>>
>>> This series probably isn't the right place to fix this argument, so
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Thanks.
>>
>>> However, presumably we're going to want an ARM side of this imminently?
>>
>> Why? It's only used (and going to be further used) by code not
>> built for Arm. So while it certainly would be nice for such a
>> header to also appear there (and the x86-special casing going
>> away in patch 2), it's not a strict requirement at this point.
>> Therefore I'd prefer to leave this to the Arm maintainers (and
>> probably for 4.16).
> 
> I was wrong here, when it comes to an Arm64 build with ACPI
> support enabled. xen/arch/arm/efi/efi-dom0.c has
> 
> #define XZ_EXTERN STATIC
> #include "../../../common/xz/crc32.c"
> 
> in order to later do
> 
>      xz_crc32_init();
>      efi_sys_tbl->Hdr.CRC32 = xz_crc32((uint8_t *)efi_sys_tbl,
>                                        efi_sys_tbl->Hdr.HeaderSize, 0);
> 
> Urgh. Why in the world does xz code get re-used like this?
> If we need generic crc32 support, such should imo live in
> xen/lib/.

I suspect this was in order to make the EFI stub completely independent 
to Xen (this is the case for Linux Arm). It turns out we now have an 
hybrid model as we re-use pass some information in the DT and other via 
variables.

> 
> So we have two possible courses of action: Eliminate this
> unsuitable re-use of code, or introduce asm/unaligned.h
> for Arm (or at least Arm64, in case it makes a difference)
> right away.

EFI stub is only supported for Arm64. So it should be sufficient to 
introduce the asm/unaligned.h on Arm64.

Note that on Arm32 we forbid unaligned access. So we may need two set of 
helpers (I haven't looked at what the header does).

Cheers,

-- 
Julien Grall

