Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC49B6021
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828015.1242807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65yT-00064A-Pe; Wed, 30 Oct 2024 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828015.1242807; Wed, 30 Oct 2024 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65yT-00062M-Mw; Wed, 30 Oct 2024 10:30:49 +0000
Received: by outflank-mailman (input) for mailman id 828015;
 Wed, 30 Oct 2024 10:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t65yS-00062G-LO
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:30:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 047ededf-96aa-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:30:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso853803066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:30:43 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec81adsm560680666b.27.2024.10.30.03.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:30:42 -0700 (PDT)
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
X-Inumbo-ID: 047ededf-96aa-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA0N2VkZWRmLTk2YWEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg0MjQzLjc0NjEyLCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730284243; x=1730889043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz5i/mNb7GRhZ+FQr8OH8hwL6Ideulocn0iYNfi2EEw=;
        b=p42hGVOJMDG/Y9j9lSAKA+0pSLczoyNZwRU/675zstQzMLaHV68Q2KyD2yJjJYxKUL
         2xtUOkKBA+z0+flvxXGRMp16UCEER6V+VYc3GntwGxU8846/y7ZjtvJNmFUcyOB0JFJx
         kCQN+XJq+bbuUi6sIP8y7sRj3oTBQNrFkpVLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284243; x=1730889043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tz5i/mNb7GRhZ+FQr8OH8hwL6Ideulocn0iYNfi2EEw=;
        b=tsnP8Zjn79hiMtc4QlKM1d1ly7UiyUuUf4Nwirvs6JOfmoTUz9nH74hdU/my1yoW8+
         GRuuruPMsFEk4NH7r9p5xVfym+7zxdjYW+1ivCEkxjOluVIYxzGzwiaE75XuOKa6vtmF
         jjRBcWTA5HMVAUdmyv4owoBrURC/db1EW7CmLt6fGnIp7PViQh/0jJlhQtxxc64GqyKG
         bD7ccOObYflB14/OGcv6kLujayBP2emZafpXQjbc3zpw5OoZx8c2WG/hDiGwozkuP6cJ
         kxHkhB6jaTmdPkT3YowGiE37LG8WVDNKJg2e7fX2rG8NaXEnUEO57024mRgnR9xvijAd
         WihA==
X-Forwarded-Encrypted: i=1; AJvYcCVlfqtCAKVEA+MKDvhPOwKfZ8lw5Vj9sRxIkwPjRw4SJyTeWc7ALZCEBbKB/QFaDFxZSWhPxz3eQxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyejFa0ID8hLKjIupnBYB8SaGTEY2Uwv5PWJ8Z37/SuLA6K4xMk
	VimrP3Yxbj2j2l7y3056IYjwfeqS9mzgWRS7AdQV4JIQuLh2IH6RodIDsSPDB6Q=
X-Google-Smtp-Source: AGHT+IFfXfWqoS5NBpyRNpy6DCSDEwgabSAeDW+s4v8eQ4rJErjCrawthy6hKKjihx7mr2NcczOVDw==
X-Received: by 2002:a17:907:6d21:b0:a9a:80f9:d4e0 with SMTP id a640c23a62f3a-a9de5ee1056mr1561430566b.34.1730284243053;
        Wed, 30 Oct 2024 03:30:43 -0700 (PDT)
Message-ID: <eae9a653-eb8f-45fd-bce2-495c50f0abde@citrix.com>
Date: Wed, 30 Oct 2024 10:30:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <14173e8a-ec20-455a-87bf-ae6d3d9a9051@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14173e8a-ec20-455a-87bf-ae6d3d9a9051@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 6:51 am, Jan Beulich wrote:
> On 29.10.2024 18:55, Andrew Cooper wrote:
>> We already have one migration case opencoded (feat.max_subleaf).  A more
>> recent discovery is that we advertise x2APIC to guests without ensuring that
>> we provide max_leaf >= 0xb.
>>
>> In general, any leaf known to Xen can be safely configured by the toolstack if
>> it doesn't violate other constraints.
>>
>> Therefore, introduce guest_common_{max,default}_leaves() to generalise the
>> special case we currently have for feat.max_subleaf, in preparation to be able
>> to provide x2APIC topology in leaf 0xb even on older hardware.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I'll have to update the AMX logic accordingly (maybe also the AVX10 one).

Yeah - I need to get back to your shrinking series too.

> I'd like to point out that this highlights a naming anomaly in
> x86_cpu_policies_are_compatible(): update_domain_cpu_policy() passes in
> the respective max policy as first argument. Imo the first parameter of
> the function would better be named "max" there.

That's covered in the documentation.  It made sense when I first planned
things, but that was many many iterations ago.

>
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>  }
>>  
>> +/*
>> + * Guest max policies can have any max leaf/subleaf within bounds.
>> + *
>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
>> + * - Some VMs we'd like to synthesise leaves not present on the host.
>> + */
>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
>> +{
>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
>> +}
>> +
>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
>> +{
>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
>> +}
> Which sadly still leaves open how to suitably shrink the max values,
> when they're larger than necessary (for the guest).

Only the toolstack can do the shrinking, and only as the about the final
step after optional features have been activated.

~Andrew

