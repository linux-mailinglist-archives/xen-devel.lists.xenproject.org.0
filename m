Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE139A31CD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821497.1235339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1bFx-0004zI-SX; Fri, 18 Oct 2024 00:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821497.1235339; Fri, 18 Oct 2024 00:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1bFx-0004xA-Q1; Fri, 18 Oct 2024 00:54:17 +0000
Received: by outflank-mailman (input) for mailman id 821497;
 Fri, 18 Oct 2024 00:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu+L=RO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1bFw-0004x4-AM
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:54:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d977fb8-8ceb-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 02:54:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729212845451565.2493557416915;
 Thu, 17 Oct 2024 17:54:05 -0700 (PDT)
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
X-Inumbo-ID: 7d977fb8-8ceb-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729212846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YgvKeqDMw28AQLtdR+bF2r0Aa+Q86pmrZPMu9Nk0hZkb2sAW7scaeccJ+p7e6PyKxKyamZ+NjNMgyJ7ykvdUbtTZSWNkW310jBOFgbwMbjfS/mBeDSFJzetlHdpSGWllVKaB7m7VCp7nPxd24mPaHgY7wlnXPZzXkmscln+9bvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729212846; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KLF4GOTGKi39kyoT2GIHZ0az9UBYS+/DtaPYr71MTOA=; 
	b=RpkFJIuS+l+/bFpI2QrOV1FjbDV0bUu+765dCRitGoVvZs3RhpXuk8oaKoANqlC9FdP4OpcHA4RiQaMtyHGq7IN5HYLR9yuUDEcqB7arn8NEfvAzmoUuRN3rivxNjTn09HJ70R9qUPJTGq0NvewGEybDdMWl92ZuSsThv5AbEbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729212846;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KLF4GOTGKi39kyoT2GIHZ0az9UBYS+/DtaPYr71MTOA=;
	b=mSh5R7elT3mRXd2rMgeNiCGZDuFLBOJiqpUtllEJ4W3aDdFqCeTIaU9nW0pq2ENn
	9VY5/N2BA0QWcm2Xgl5Jn8+CeHW/GXyMMqOdvrYZAptCNIHcq/HU9ar+whg6jz+6Mb3
	VnH7pyRDMhg1JY9JAQhhHrO9DavclyU4Cx4PDass=
Message-ID: <590a07a2-3363-4aae-b06d-63148bc5e20a@apertussolutions.com>
Date: Thu, 17 Oct 2024 20:54:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/44] x86/boot: introduce boot module flags
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-11-dpsmith@apertussolutions.com>
 <5bc04cc7-b9ce-4d4a-9c69-62ae6ccc6acb@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5bc04cc7-b9ce-4d4a-9c69-62ae6ccc6acb@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 19:58, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index 18281d80fa97..e8ba9390a51f 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -39,6 +39,9 @@ struct boot_module {
>>        */
>>       unsigned long headroom;
>>       enum bootmod_type type;
>> +
>> +    uint32_t flags;
>> +#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
> 
> There are two parts to this request.  First, there's nothing X86
> specific about any of the flags added (in this series at least), and the
> FLAG infix doesn't feel as if it adds much.
> 
> But, looking over the code, I get the feeling it would be better as simply:
> 
>      /*
>       * Misc flags  XXX docs
>       */
>      bool relocated:1;
>      bool consumed:1;
> 
> (Possibly with an enclosing struct { ... } flags; but I don't think
> that's necessary either.)

I see no reason why not a bitfield, and as you state, will make code 
simpler (and possibly shorter) elsewhere.

> because flags is never operated on as a unit of multiple things, or
> passed around separately from a bm-> pointer.  For misc independent
> flags like this, bitfields lead to far more legible code because you're
> not having to express everything as binary operators in the logic.
> 
> I know this will be a moderately invasive change, but I suspect the
> improvement will speak for itself.  (Assuming there isn't a need to keep
> it as a plain flags field later.)

Yah it will be a bit painful, but I would rather have cleaner and easier 
to read code.

v/r,
dps


