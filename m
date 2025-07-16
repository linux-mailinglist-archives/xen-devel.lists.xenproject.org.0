Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2CB07A2F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045397.1415505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Je-0005AE-K2; Wed, 16 Jul 2025 15:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045397.1415505; Wed, 16 Jul 2025 15:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4Je-00058i-Gl; Wed, 16 Jul 2025 15:45:06 +0000
Received: by outflank-mailman (input) for mailman id 1045397;
 Wed, 16 Jul 2025 15:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc4Jc-00058J-QZ
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:45:04 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71d4c7b-625b-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:45:04 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso4588625f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:45:04 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4cbsm18475309f8f.50.2025.07.16.08.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:45:02 -0700 (PDT)
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
X-Inumbo-ID: d71d4c7b-625b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752680703; x=1753285503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p8YCPjZD4M528sFrOIkM3wvEws3TgPogaTWPGX+h1xQ=;
        b=kCQAaM/fR7ddE01zOnc/KkvnuvhwSiQQhBI7asRSoZ911OkwXFNs5bZeaTAhtB3uew
         9Ohb3PBLCzsAt2stOcKmEld7/HYnBfoZxwiAuR3o7qKmONE9R19QwZ0Fm2DJfnCLGlrU
         5CpOkwIzPV1gTJ1srXnbHPfTdLLLMX5EYTx+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680703; x=1753285503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8YCPjZD4M528sFrOIkM3wvEws3TgPogaTWPGX+h1xQ=;
        b=Iu5U8V7uLk1WsnLe6FlHGBVdV/LrecEQakOevXjmaReSKI754c5ZETdyMkJ1U8r1nn
         Os7SawzUSYFMBJbGBwUG11voSnWi5SgFmPv3iFDZ21/gIh7m3O6EZDABJWtaiggfyYec
         PdiqBPNDcDmFSvztYSmRHRo/7NE13w+xOpsGZa2+vg/s1zNoF8GI4eLRoOAl9fF/HBha
         5dfVeSPavDMDOriJGSpmKajapjtL1pyAXz3ixyEA0zTgclILIA5Yb4tNTMrDDk73XkHw
         +xqrwT5VU5vzlTfDFoDzLShnPY1wCrfPegVVVY/IpYs+Yl7L/7aYmrM/gaFi2bj3yNJx
         nXiw==
X-Forwarded-Encrypted: i=1; AJvYcCXB9dWKbbb51Yo5hZibLToJ3njattGAZbhCmFyCrtPWRtSU1+LIa+BAnV1H7fiPSOLhail5h18q+mA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPEb/1tbNPwrmx9dXbjf/TDJ1RiZYT+kkAf5CHNOflVbZEFN4e
	Voue6I0Me+TSoTk/JX3hPrXQW2GPbes7kM/eRwa6XVgFWSSCU/s7EU2rMZ71fsDWr2M=
X-Gm-Gg: ASbGncvDbzEyCKacjZDo3dxiPWKIbgT3LY5kF2TAXyGRCC++c1sfZXM2+UV4LseLKdC
	2278E4G32/17RYAYhATFm/iv8UhIIZd3K30t4QZ9EASDJmfqIlbelojE8NkiH5cZWLxm7+JSqPS
	yqUWdw2ibESijKLIobbMuQrT17x/Uqv3/8sD2u6BHtrOs0U/0PTMQpVgUjt6AFpEuXIbZvxD/5P
	d7xlqS86Nly1ZedSrS09V9KCEILEqjdNhN3NKM0tZbQennlnM3/WTrYu87BImmb1gS4sdxEYJZm
	l9qJ71BWjSbOUik7Wz1J6qtRiGYzRxCjaHLPqpPGOAxWjcnvKgD28mTIuYL2HcwR9Dt8YN19l9u
	0iUVhIWlfS1qBXvisgwNY0JnXopQ00ERjaR1Kk4xdewjgkktiwaJDvXOpYdaVOgVMtywcqkxYMQ
	OUy5c=
X-Google-Smtp-Source: AGHT+IHOjQDoMCA8PuCZ78Q3PIFECRYIojGWddGiM5Qx4JBh+eBwe0xPR0XzgvNmofdEEHSDjeZqkA==
X-Received: by 2002:a05:6000:2388:b0:3b4:9721:2b13 with SMTP id ffacd0b85a97d-3b60e4d2559mr2944299f8f.14.1752680703343;
        Wed, 16 Jul 2025 08:45:03 -0700 (PDT)
Message-ID: <0c8e178e-434e-4620-a79b-08bb55b848bd@citrix.com>
Date: Wed, 16 Jul 2025 16:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86: Rearrange struct cpuinfo_x86 to introduce a vfm
 field
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-2-andrew.cooper3@citrix.com>
 <9feece5c-4ca7-42b5-b41f-6d9843e07c21@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9feece5c-4ca7-42b5-b41f-6d9843e07c21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2025 2:47 pm, Jan Beulich wrote:
> On 16.07.2025 15:28, Andrew Cooper wrote:
>> Intel have run out of model space in Family 6 and will start using Family 19
>> starting with Diamond Rapids.  Xen, like Linux, has model checking logic which
>> will malfunction owing to bad assumptions about the family field.
>>
>> Reorder the family, vendor and model fields so they can be accessed together
>> as a single vfm field.
>>
>> As we're cleaning up the logic, take the opportunity to introduce better
>> names, dropping the x86 prefix.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Two remarks, though:
>
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -20,10 +20,30 @@
>>  #ifndef __ASSEMBLY__
>>  
>>  struct cpuinfo_x86 {
>> -    unsigned char x86;                 /* CPU family */
>> -    unsigned char x86_vendor;          /* CPU vendor */
>> -    unsigned char x86_model;
>> -    unsigned char x86_mask;
>> +    /* TODO: Phase out the x86 prefixed names. */
>> +    union {
>> +        struct {
>> +            union {
>> +                uint8_t x86_model;
>> +                uint8_t model;
>> +            };
>> +            union {
>> +                uint8_t x86;
>> +                uint8_t family;
>> +            };
>> +            union {
>> +                uint8_t x86_vendor;
>> +                uint8_t vendor;
>> +            };
>> +            uint8_t _rsvd;
> Can we perhaps name this e.g. _zero, so it's clear that it cannot be
> repurposed?

It can be repurposed; it just must be done in coordination with VFM_MAKE().

I can add a comment to this effect, but it would need to be in the
subsequent patch when VFM_MAKE() is introduced.

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -178,7 +178,9 @@ void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
>>  /* Used by the boot asm and EFI to stash the multiboot_info paddr. */
>>  unsigned int __initdata multiboot_ptr;
>>  
>> -struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
>> +struct cpuinfo_x86 __read_mostly boot_cpu_data = {
>> +    .cpuid_level = -1,
>> +};
> So you retain the bogus setting of this field. Would you mind taking a
> look at [1], one of the many things that I never heard back on? I'm
> deliberately purging that non-sense there as a (side-)effect. Plus
> really I'm getting tired of having to re-base my long-pending changes
> over ones you are helped getting in pretty quickly. No matter that this
> one's going to be one of the easy ones (I hope).
>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00726.html

I can rebase.

~Andrew

