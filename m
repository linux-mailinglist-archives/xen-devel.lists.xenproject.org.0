Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A259B7752
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828513.1243412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RMI-0001wi-Jc; Thu, 31 Oct 2024 09:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828513.1243412; Thu, 31 Oct 2024 09:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RMI-0001uT-Gb; Thu, 31 Oct 2024 09:20:50 +0000
Received: by outflank-mailman (input) for mailman id 828513;
 Thu, 31 Oct 2024 09:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RMH-0001uN-0v
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:20:49 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 683a9ec3-9769-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:20:44 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so525398f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:20:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e7a13sm18452935e9.22.2024.10.31.02.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:20:44 -0700 (PDT)
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
X-Inumbo-ID: 683a9ec3-9769-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY4M2E5ZWMzLTk3NjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY2NDQ0Ljk4OTY1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366444; x=1730971244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O4XG4HaRC3YF4RTfDVDxvjujivPPVXX8uXA9RnYso+w=;
        b=Hq75u+rtZeDqGW5IRb3WlCzNoGZZG3U/DWZO1fveGKs2SxDCAMIxvHVp2Aeniu1ISm
         cpyoAq60Bk8lRppoFzj3TZQBmLT6R44HrWiZ84cukbQBy1wLRbOwr9I8UrIlDX3XTjLZ
         Mh8GSbAR+k24w6Jpqjuk74doB0Jcf6rK6D9g/pfUoMxHrRe0A7I2UpqrMKWL+w5RP2xV
         djRrImuqrFwmbIC15E7/dhvmcGd+g+71jQ0nkTya5jgZFKLmMz/hwyLrvyxVIJ53TfG3
         ed646vJ8FK3hlh+60oPCSuFe61xnu2/M0af4IsA0vFSZcPA0gNzf6rL27VQMa+/b/MPk
         gNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366444; x=1730971244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4XG4HaRC3YF4RTfDVDxvjujivPPVXX8uXA9RnYso+w=;
        b=Wt8LQiOf/YahGo2KxVoP1oRqiEag8gAO0w45Z0lFKln/2l3fJb8HYKX8KrPuFcnOpF
         X4sp/xYNmU0pzAkeBgnSwf6mIvXKc+sucNgk909eUrWE0AtTqcZ0a8EfTji3heiwQFLQ
         0UoAhrIJRU0eBd7fLnUi3+uwrgndfYcQaQy8qWO4XSdus/dThC9k3yTDH9JYARag+lbp
         EUOsTTx1jZFqpe982xeWjwZDyuk/IL9KuNBXPOosAwrZtXyWwuaipsFdfMV+sMsAc+DE
         n2iRuJsDgZnYL1vz4aQ4GzhcprIlKMFmWsdik+MyApk7ieswDp19Jdy3VXmUVF1sjnaH
         MXeA==
X-Gm-Message-State: AOJu0YzxAct4FbjDEJZOsyopxDsxfZRGlEEWWm5Dg4IqIpdmWnIWkVE9
	yyKX39O+s75t6z2CusrjMgPoKPO3V4X/BKlqrjtdox7csBUATwbOTAcx14robg==
X-Google-Smtp-Source: AGHT+IElPof94xQEjT9uFMGltWcLgdjR1de6tKNiNHLMaUIKBmCVq4DQGH2N64q4tR2HUmr+ShOhMQ==
X-Received: by 2002:a5d:5988:0:b0:37d:30e7:3865 with SMTP id ffacd0b85a97d-381be7d63e0mr1997778f8f.34.1730366444312;
        Thu, 31 Oct 2024 02:20:44 -0700 (PDT)
Message-ID: <20b8e7be-4922-4f42-9a0d-176dcb1cb9a8@suse.com>
Date: Thu, 31 Oct 2024 10:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook> <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook> <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
 <ZyJM_DLUkqolD7mD@macbook> <e4d75dee-3cf6-4fc1-9277-ea16ed9e0319@citrix.com>
 <ZyJoowmf5_ast4X3@macbook>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZyJoowmf5_ast4X3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 18:10, Roger Pau Monné wrote:
> On Wed, Oct 30, 2024 at 04:51:34PM +0000, Andrew Cooper wrote:
>> On 30/10/2024 3:13 pm, Roger Pau Monné wrote:
>>> On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
>>>> On 30/10/2024 11:03 am, Roger Pau Monné wrote:
>>>>> On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
>>>>>> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
>>>>>>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>>>>>>>> index b6d9fad56773..78bc9872b09a 100644
>>>>>>>> --- a/xen/arch/x86/cpu-policy.c
>>>>>>>> +++ b/xen/arch/x86/cpu-policy.c
>>>>>>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
>>>>>>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +/*
>>>>>>>> + * Guest max policies can have any max leaf/subleaf within bounds.
>>>>>>>> + *
>>>>>>>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
>>>>>>>> + * - Some VMs we'd like to synthesise leaves not present on the host.
>>>>>>>> + */
>>>>>>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
>>>>>>>> +{
>>>>>>>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
>>>>>>>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
>>>>>>>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
>>>>>>>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
>>>>>>>> +{
>>>>>>>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
>>>>>>>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
>>>>>>>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
>>>>>>>> +}
>>>>>>> I think this what I'm going to ask is future work.  After the
>>>>>>> modifications done to the host policy by max functions
>>>>>>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
>>>>>>> better be done taking into account the contents of the policy, rather
>>>>>>> than capping to the host values?
>>>>>>>
>>>>>>> (note this comment is strictly for guest_common_default_leaves(), the
>>>>>>> max version is fine using ARRAY_SIZE).
>>>>>> I'm afraid I don't follow.
>>>>>>
>>>>>> calculate_{pv,hvm}_max_policy() don't modify the host policy.
>>>>> Hm, I don't think I've expressed myself clearly, sorry.  Let me try
>>>>> again.
>>>>>
>>>>> calculate_{hvm,pv}_max_policy() extends the host policy by possibly
>>>>> setting new features, and such extended policy is then used as the
>>>>> base for the PV/HVM default policies.
>>>>>
>>>>> Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
>>>>> having bits set past the max {sub,}leaf in the host policy, as it's
>>>>> based in {hvm,pv}_def_cpu_policy that might have such bits set?
>>>> Oh, right.
>>>>
>>>> This patch doesn't change anything WRT that.
>>> Indeed, didn't intend my comment to block it, just that I think at
>>> some point the logic in guest_common_default_leaves() will need to be
>>> expanded.
>>>
>>>> But I think you're right that we do risk getting into that case (in
>>>> principle at least) because of how guest_common_*_feature_adjustment() work.
>>>>
>>>> Furthermore, the bug will typically get hidden because we serialise
>>>> based on the max_leaf/subleaf, and will discard feature words outside of
>>>> the max_leaf/subleaf bounds.
>>> Yes, once we serialize it for toolstack consumption the leafs will be
>>> implicitly zeroed.
>>>
>>>> I suppose we probably want a variation of x86_cpu_featureset_to_policy()
>>>> which extends the max_leaf/subleaf based on non-zero values in leaves. 
>>>> (This already feels like it's going to be an ugly algorithm.)
>>> Hm, I was thinking that we would need to adjust
>>> guest_common_default_leaves() to properly shrink the max {sub,}leaf
>>> fields from the max policies.
>>
>> Hmm.  What we'd do is have default inherit max's ARRAY_SIZES(), then do
>> all the existing logic, then as the final step, shrink the default
>> policies, vaguely per Jan's plan.
>>
>> i.e. we'd end up deleting guest_common_default_leaves()
>>
>> That way we don't need to encode any knowledge of which feature bit
>> means what WRT max_leaf/subleaf.
> 
> What about Alejandro's concern about runtime populated {sub,}leafs,
> won't we risk shrinking too much if the last leaf intended to be kept
> happens to be a fully runtime populated one?
> 
> Do we need some kind of special magic for fully run-time populated
> leafs (like the topology ones IIRC?) in order to account for them when
> doing those max calculations?

Contrary to Andrew's reply I think we will need to take runtime-populated
leaves into account specially, as you suggest. Just thinking of something
APIC-ID-like in a very high leaf, which (presumably) ought to be zero in
max/default. While keeping such fields at zero in max/default for external
exposure, filling them with a non-zero value at policy creation (maybe
simply their max value) might help keep the shrinking logic agnostic to
such special cases.

Jan

