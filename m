Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858E9B605B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828036.1242827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t666m-0007md-Tn; Wed, 30 Oct 2024 10:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828036.1242827; Wed, 30 Oct 2024 10:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t666m-0007kK-R1; Wed, 30 Oct 2024 10:39:24 +0000
Received: by outflank-mailman (input) for mailman id 828036;
 Wed, 30 Oct 2024 10:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t666l-0007kE-CV
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:39:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3583c8b9-96ab-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 11:39:15 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso790683666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:39:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f29a430sm561386166b.139.2024.10.30.03.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:39:14 -0700 (PDT)
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
X-Inumbo-ID: 3583c8b9-96ab-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1ODNjOGI5LTk2YWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg0NzU1LjUzOTQ0Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730284755; x=1730889555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ux4G/wWBIypqhbwYzb16HUEr9cFByYtihO4URxFZkvA=;
        b=EhDh6Ll89BVjWlzMp3xlc3WxiuOIjxO/m89h/Yv9t4tscj84ta2JPBKqiB+2/j9mZg
         j/mka/0RFXX19YXen4eqh75X86apMcyNAh09gsmhbDYy//gbw3kb0R0GcuKTv1+d1eD6
         1LfmOYtrpb91w3IF5wXesNUr7YHZnD3r0QDfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284755; x=1730889555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux4G/wWBIypqhbwYzb16HUEr9cFByYtihO4URxFZkvA=;
        b=A/6vmLuvGUPw31lPox5gAhyX5sy/4186lEe0cgMwQb57e02mF7hSWH/nKUbpsM2hKW
         T06f6xwV0VTbY4CXyA4ZSU0oDfQRW6f4Er3vCYPSRARe7Q5sIE3qjISRbk8sJLb7xhUD
         iLKrYC2nj/HXhfYUnrSxLmE8PM5gBlTJ2r/jME8EyRMj3NeCg6Rtfz0E6f7dzXJeIUXr
         vWC9KLKT6F7Gtfc/dmL631GFA4nyy8b+2qq6J1pdcU2NnBNZTpLyOBPZfW+isRtITwAq
         hlLuRCjjss46ANV9YUhyLGBvvtM7XjH9/C6ePya+HMUJMr23ceHiwJUGvVf2iQ+RieE1
         Uzog==
X-Gm-Message-State: AOJu0YyaycT2bLXKKNjfGRqNCJGcyenxX4UvZuCjNa222yz8itd+/xi0
	+grTIZLnL18Jiclxw+GtunDEYSerOUMBhd62Qy2UXscQT9tSPze1H3LvNWAm84k=
X-Google-Smtp-Source: AGHT+IG7gwS0IEJc8r6EO2IP6Th2XI6GpaD7XgF9VYZ68ktNAjN5uP15CwiT8hDmK7o+2/nJq7ps4g==
X-Received: by 2002:a17:907:3ea6:b0:a9a:d52:9e79 with SMTP id a640c23a62f3a-a9de632e87cmr1467906166b.60.1730284754815;
        Wed, 30 Oct 2024 03:39:14 -0700 (PDT)
Message-ID: <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
Date: Wed, 30 Oct 2024 10:39:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZyH1az6sb2wnVxgu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 8:59 am, Roger Pau Monné wrote:
> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index b6d9fad56773..78bc9872b09a 100644
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
> I think this what I'm going to ask is future work.  After the
> modifications done to the host policy by max functions
> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
> better be done taking into account the contents of the policy, rather
> than capping to the host values?
>
> (note this comment is strictly for guest_common_default_leaves(), the
> max version is fine using ARRAY_SIZE).

I'm afraid I don't follow.

calculate_{pv,hvm}_max_policy() don't modify the host policy.

~Andrew

