Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E688ACDC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 19:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697848.1089027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rood2-0002Nc-8l; Mon, 25 Mar 2024 18:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697848.1089027; Mon, 25 Mar 2024 18:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rood2-0002L6-55; Mon, 25 Mar 2024 18:01:00 +0000
Received: by outflank-mailman (input) for mailman id 697848;
 Mon, 25 Mar 2024 18:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O34W=K7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rood0-0002L0-CU
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 18:00:58 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1682e65-ead1-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 19:00:57 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56a2bb1d84eso8259612a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 11:00:57 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a9-20020a50ff09000000b0056c0a3d91easm1795741edu.12.2024.03.25.11.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 11:00:56 -0700 (PDT)
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
X-Inumbo-ID: a1682e65-ead1-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711389657; x=1711994457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aP0ZpNKtKlAkByp1dzhjCpHP/UfIO209SVVumQjZthQ=;
        b=PDZseObbhfOaQ9ecSa9s9ipwc5hnkVyii76jOpi0pF6naWtcwq2cvfSTXaV/z72RJ3
         8OiPY/2xT9jMqbY1yJuy/uzb2jE79t/lUusKXLI+wI0XEGuNZ9vsN8ddcXl7gcW0NsFS
         /WTwddxbPn6XPT+Fh3Ys8B7zcSIhwgvE/Xtrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389657; x=1711994457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP0ZpNKtKlAkByp1dzhjCpHP/UfIO209SVVumQjZthQ=;
        b=kiRhBwLYLwKjHz0XMp30JwlZI0uZi4c1efNr0iEQMV/G4/FZV2JlnboOOHSlVt4D60
         GmR4KrO73VQHkWKLME+Z12PFYTSIIteYzGfp7FiinYFQffjUuyxlt7NguobJkU6jnQSj
         qotB0M6icE526KIo9aDdet5RL/OVqi/UiCTJ5M7Xf4Vc+qu0g4SDvJzow8fh44kB+VqD
         L7mMoua5ljczQfLP2Fte+7ijxmnfgsyjohUSb6Lip+RCgIj2fZkm9814Yx+6h01YRHiE
         gSFyUfVV11U/35YiGu/AzFZjsOJBRPutfPjudfWg3/x15ZKodNIXlr/k3v2dha3brJCr
         Mfvw==
X-Forwarded-Encrypted: i=1; AJvYcCVpzqMSjJufnDXbaRwEbQsm6Psxpnm6Ut7Duptva5O9V8ux37ETydlyPsauJdVMl5ZuPsbBADDvNeogXEm8vebnZX1PlSBR/HkptWFrUCY=
X-Gm-Message-State: AOJu0YwgiVhNggi3d8NduKZ9gGDtGLNz8WTRTq9iEunVd3y9LQHAdMt9
	L3p4m+/2lQw9rVKQxu7yiVrqQgAAiqcS9AcUzzKpXKVuNQS9mJnzc1LPvb1R2YQ=
X-Google-Smtp-Source: AGHT+IFphpmizD55FcDLpcGO4ioU0kmMwR79jG7qC40hdh2nP2zAPy0EmgJoZMRju3EVE5gg79RZtQ==
X-Received: by 2002:a50:9fcf:0:b0:566:72b0:286a with SMTP id c73-20020a509fcf000000b0056672b0286amr7147639edf.2.1711389656756;
        Mon, 25 Mar 2024 11:00:56 -0700 (PDT)
Message-ID: <19a4cf14-92c9-47e5-b8f0-f07a92a1ffd8@cloud.com>
Date: Mon, 25 Mar 2024 18:00:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save
 area
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
 <2e7fe91e-b483-4d61-9783-0cfa3753911f@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <2e7fe91e-b483-4d61-9783-0cfa3753911f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25/03/2024 16:45, Jan Beulich wrote:
> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -288,7 +288,10 @@ void update_guest_memory_policy(struct vcpu *v,
>>  static void cpu_policy_updated(struct vcpu *v)
>>  {
>>      if ( is_hvm_vcpu(v) )
>> +    {
>>          hvm_cpuid_policy_changed(v);
>> +        vlapic_cpu_policy_changed(v);
>> +    }
>>  }
> 
> This is a layering violation imo; hvm_cpuid_policy_changed() wants
> to call vlapic_cpu_policy_changed().

Sure.

> 
>> @@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
>>      vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>>  }
>>  
>> +void vlapic_cpu_policy_changed(struct vcpu *v)
>> +{
>> +    struct vlapic *vlapic = vcpu_vlapic(v);
>> +    struct cpu_policy *cp = v->domain->arch.cpu_policy;
> 
> const please

Ack

> 
>> @@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>>      const struct vcpu *v = vlapic_vcpu(vlapic);
>>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>  
>> +    /*
>> +     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
>> +     * mappings. Recreate the mapping it used to have in old host.
>> +     */
>> +    if ( !vlapic->hw.x2apic_id )
>> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
> 
> This looks to depend upon it only ever being vCPU which may get a (new
> style) APIC ID of 0. I think such at least wants mentioning in the
> comment.

I don't quite follow you, I'm afraid. There is an implicit control flow
assumption that I can extract into a comment (I assume you were going
for that angle?). The implicit assumption that "vCPU0 always has
APIC_ID=0", which makes vCPU0 go through that path even when no
corrections are necessary. It's benign because it resolves to APIC_ID 0.

Is that what you meant? If so, I'll add it to v2.

> 
>> --- a/xen/include/public/arch-x86/hvm/save.h
>> +++ b/xen/include/public/arch-x86/hvm/save.h
>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>      uint32_t             timer_divisor;
>>      uint64_t             tdt_msr;
>> +    uint32_t             x2apic_id;
>> +    uint32_t             rsvd_zero;
>>  };
> 
> I can't spot any checking of this last field indeed being zero.
> 
> Jan

Huh. I was sure I zeroed that on vlapic_init(), but it must've been on a
previous discarded series. Good catch.

Do we also want a check on migrate so a migration from a future Xen in
which it's not zero fails?

Cheers,
Alejandro

