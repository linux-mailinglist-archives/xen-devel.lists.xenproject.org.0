Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439267F613D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639756.997431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6AVl-0005Td-Jw; Thu, 23 Nov 2023 14:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639756.997431; Thu, 23 Nov 2023 14:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6AVl-0005R3-HG; Thu, 23 Nov 2023 14:16:57 +0000
Received: by outflank-mailman (input) for mailman id 639756;
 Thu, 23 Nov 2023 14:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6AVk-0005Qx-PU
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 14:16:56 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e337f6-8a0a-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 15:16:55 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso10983091fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 06:16:55 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b00332c0aace23sm1769672wrc.105.2023.11.23.06.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 06:16:55 -0800 (PST)
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
X-Inumbo-ID: f4e337f6-8a0a-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700749015; x=1701353815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VeyuOSS3Ok7p1BtL7wybFYD9ZnZlniBJMfODcYSU/w=;
        b=uASgIVLapAdWYTi4lZu8V4ZzvHArCIU8Y8ALBPYr5J2NjL7oQ/dkQMVWZePQ2rYomK
         YYdB/Y/fXFKZW57l9oQcWl8Sg6xVMJs1uMRObCGuBFOmn8cz3s/5nDsHqD8ydwFI5pTg
         MJHaXaaIv7UR8ZwNrt3qKDQmNeVEKYE2JE63o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749015; x=1701353815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VeyuOSS3Ok7p1BtL7wybFYD9ZnZlniBJMfODcYSU/w=;
        b=uP3mmTCtoVwkLBqwrwzEE4rqLFO1gvwhMgCVfeCGG2Mdz/aaI6CvxnS2jJp87w+Jho
         vIJDeYk9nD/993P47qEkW/VEr5v1+2oH+2ScPkrVp4Exd9ej1kjQUA3kXHZYzYnoMfDD
         2hr+08gOq19raEH6cdc5GW2dX51+ZyITRhlgQqvmXebdvXoBiqCoUrFASw+C42Ef/Z7J
         C4SWvwyowhh2ntgw2/Jd42sY1bJBx43ouR5xs6yX62wHfhLgd/oofMcMdimPDM0VAcEY
         4QH7bX9V/5/Fhosuh02gXH9E8SG+3tIcHwFCJfF0L3JOExKQ6gKd6imAnKITUNkAcf9u
         iwvA==
X-Gm-Message-State: AOJu0YyrNVYgh/bSIRY1tkxMa6N3l7wmv5e+nqRsBybs9ik7ZH+JTQaR
	RwgFqq0TdRHPnWSaJp5Bec6gvw==
X-Google-Smtp-Source: AGHT+IEHBWPes3Ee0STyhH7mvDg/ZJFDarsNzRbs/qzFsDSbfUDhIoHO3JMHBB49dID4WVowiInEIQ==
X-Received: by 2002:a2e:9b44:0:b0:2b9:f13b:6139 with SMTP id o4-20020a2e9b44000000b002b9f13b6139mr4592226ljj.20.1700749015372;
        Thu, 23 Nov 2023 06:16:55 -0800 (PST)
Message-ID: <e711e392-2c1a-440f-8206-f5125e38e7c6@citrix.com>
Date: Thu, 23 Nov 2023 14:16:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
 <ZV8VUFmNe30prv7_@macbook> <655f43d2.5d0a0220.afd7c.48b9@mx.google.com>
 <ZV9buKlgta4Gbn-a@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZV9buKlgta4Gbn-a@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2023 2:03 pm, Roger Pau Monné wrote:
> On Thu, Nov 23, 2023 at 12:21:36PM +0000, Alejandro Vallejo wrote:
>> On Thu, Nov 23, 2023 at 10:03:12AM +0100, Roger Pau Monné wrote:
>>> On Wed, Nov 22, 2023 at 04:08:17PM +0000, Alejandro Vallejo wrote:
>>>> +    if ( vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id )
>>>> +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
>>>>  
>>>> -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
>>>> -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
>>>> +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
>>>> +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>>>>  }
>>>>  
>>>>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>>>> @@ -1498,27 +1508,35 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>>>>   */
>>>>  static void lapic_load_fixup(struct vlapic *vlapic)
>>>>  {
>>>> -    uint32_t id = vlapic->loaded.id;
>>>> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>>>> +    if ( !vlapic_x2apic_mode(vlapic) ||
>>>> +         (vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)) )
>>>> +        return;
>>>>  
>>>> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
>>>> -    {
>>>> +    if ( vlapic->loaded.ldr == 1 )
>>>> +       /*
>>>> +        * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC
>>>> +        * mode got LDR = 1. We can't leave it as-is because it assigned the
>>>> +        * same LDR to every CPU.  We'll fix fix the bug now and assign an
>>>> +        * LDR value consistent with the APIC ID.
>>>> +        */
>>>> +        set_x2apic_id(vlapic);
>>>> +    else if ( vlapic->loaded.ldr ==
>>>> +              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
>>>>          /*
>>>> -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
>>>> -         * to aid in eventual debugging of issues arising from the fixup done
>>>> -         * here, but can be dropped as soon as it is found to conflict with
>>>> -         * other (future) changes.
>>>> +         * This is a migration from a broken Xen between 4.4 and 4.18 and
>>>> +         * we must _PRESERVE_ LDRs so new vCPUs use consistent derivations.
>>> Not sure if we should try to avoid mentioning specific versions in the
>>> comments, as I this fix will be backported to stable branches (I hope),
>>> and hence those will no longer be affected.
>> Hence the "broken Xen" part of the paragraphs. Not every 4.18 will have the
>> problem, but it shouldn't be seen in 4.19 onwards. I think there's value in
>> stating the versions that "may" exhibit problems, but this is all
>> subjective 
> FE.

This patch has a high chance of being backported.  Old version numbers
(4.4 in this case) are critical information.

For the new end, "to date (Nov 2023)" or similar tends to works better,
because it also doesn't go stale when backported.

If a version is necessary/preferred, then "4.19 dev window" also works well.

~Andrew

