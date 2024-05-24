Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA38CE43A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729298.1134410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASEJ-0001qv-GK; Fri, 24 May 2024 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729298.1134410; Fri, 24 May 2024 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASEJ-0001oi-DH; Fri, 24 May 2024 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 729298;
 Fri, 24 May 2024 10:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sASEI-0001HK-39
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:32:54 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f97dd3e6-19b8-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 12:32:52 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-354e0cc9c5cso2554692f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:32:52 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a0931c9sm1269766f8f.65.2024.05.24.03.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 03:32:51 -0700 (PDT)
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
X-Inumbo-ID: f97dd3e6-19b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716546772; x=1717151572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sC4hyVDtv8Dy6ruPjJsuJvbEvg/9VKuCLBxdu6Om/s=;
        b=IPAwYGatLJ3hCN9VKOetL2DgXzVby+d37CI9pa3oyy1+3mYPn5zshS5P+vKYDH8x83
         xalCPaCfl1gKX22zpzEAMbPnYpouaXTdUKxvOn9/s6u7d1dWbxep6INU3eVrhHUsIhC1
         GHtW+hxxg1eV0gCX+gnfgiM3uEPixKWsYOVvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546772; x=1717151572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sC4hyVDtv8Dy6ruPjJsuJvbEvg/9VKuCLBxdu6Om/s=;
        b=DKXV/bdDNAFVewKY7L4dVaB/qu8DRKe4obarwoP/MXeXyr0wSYpjBC9amHy0fZESMb
         DJWl9SvoadcdZECNL6lIGdNamPfUHsBZHcYL9EroICk4cBh6tiRzLCd2C5vyTcIwFDX+
         5OS04DCY+lVntM7SP2hTvN263gfOJtWuYUBrqp+jpFA9qn/M+Sluw7ySZKTZSA9c48Pw
         GcNVQF7mrP6lAf3kWHO6oh20v9WjUTWwRFIk/FQw21CxSmBCtJ/XM9NML7meFMUh9ESV
         ODqmBmFsO+m81cmEtSDKCbL0Iq9y0e7lK0WB/FuAXC/UNk4YS19CypoRjeklNThXvDem
         HkXw==
X-Gm-Message-State: AOJu0Yytu7i4yC7ZKxy8QWR4rYB1JDG4PM8MxyR/hJ8sB3xEQY3oX5Ow
	g3/5sN5HaeDdGHo26jM7EKIx18AqPvlrZL8WhWoQD183/I6F6//ZXJyyPNeS7uQ=
X-Google-Smtp-Source: AGHT+IF8Lbrj01EXtzdBE+xuUilIfxojctlcogSMfV5y6PYVLJqta20UIWoEe39z6tZvVBiybN2AAw==
X-Received: by 2002:adf:ce07:0:b0:354:f286:4f0f with SMTP id ffacd0b85a97d-35526c3a2e7mr1284687f8f.30.1716546771785;
        Fri, 24 May 2024 03:32:51 -0700 (PDT)
Message-ID: <de256e4b-fdc4-48a8-9173-38092ab90716@cloud.com>
Date: Fri, 24 May 2024 11:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1716457040.git.alejandro.vallejo@cloud.com>
 <5c6ee74b60bad4eb9cc8e17dbfcf7158d38bd32c.1716457040.git.alejandro.vallejo@cloud.com>
 <Zk8YucyA1ZwGU4Y-@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zk8YucyA1ZwGU4Y-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 11:21, Roger Pau Monné wrote:
> On Thu, May 23, 2024 at 10:41:29AM +0100, Alejandro Vallejo wrote:
>> The idea is to use xc_cpu_policy_t as a single object containing both the
>> serialised and deserialised forms of the policy. Note that we need lengths
>> for the arrays, as the serialised policies may be shorter than the array
>> capacities.
>>
>> * Add the serialised lengths to the struct so we can distinguish
>>   between length and capacity of the serialisation buffers.
>> * Remove explicit buffer+lengths in serialise/deserialise calls
>>   and use the internal buffer inside xc_cpu_policy_t instead.
>> * Refactor everything to use the new serialisation functions.
>> * Remove redundant serialization calls and avoid allocating dynamic
>>   memory aside from the policy objects in xen-cpuid. Also minor cleanup
>>   in the policy print call sites.
>>
>> No functional change intended.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Just two comments.
> 
>> ---
>> v3:
>>   * Better context scoping in xg_sr_common_x86.
>>     * Can't be const because write_record() takes non-const.
>>   * Adjusted line length of xen-cpuid's print_policy.
>>   * Adjusted error messages in xen-cpuid's print_policy.
>>   * Reverted removal of overscoped loop indices.
>> ---
>>  tools/include/xenguest.h            |  8 ++-
>>  tools/libs/guest/xg_cpuid_x86.c     | 98 ++++++++++++++++++++---------
>>  tools/libs/guest/xg_private.h       |  2 +
>>  tools/libs/guest/xg_sr_common_x86.c | 56 ++++++-----------
>>  tools/misc/xen-cpuid.c              | 41 ++++--------
>>  5 files changed, 106 insertions(+), 99 deletions(-)
>>
>> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
>> index e01f494b772a..563811cd8dde 100644
>> --- a/tools/include/xenguest.h
>> +++ b/tools/include/xenguest.h
>> @@ -799,14 +799,16 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>>                               xc_cpu_policy_t *policy);
>>  
>>  /* Manipulate a policy via architectural representations. */
>> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
>> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
>> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
>> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *policy);
>>  int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
>>                                 const xen_cpuid_leaf_t *leaves,
>>                                 uint32_t nr);
>>  int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>>                                const xen_msr_entry_t *msrs, uint32_t nr);
>> +int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
>> +                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
>> +int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
>> +                           const xen_msr_entry_t **msrs, uint32_t *nr);
> 
> Maybe it would be helpful to have a comment clarifying that the return
> of xc_cpu_policy_get_{leaves,msrs}() is a reference to the content of
> the policy, not a copy of it (and hence is tied to the lifetime of
> policy, and doesn't require explicit freeing).

Sure.

> 
>>  
>>  /* Compatibility calculations. */
>>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>> index 4453178100ad..4f4b86b59470 100644
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -834,14 +834,13 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
>>      }
>>  }
>>  
>> -static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
>> -                              unsigned int nr_leaves, unsigned int nr_entries)
>> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
>>  {
>>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>>      int rc;
>>  
>>      rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
>> -                                    nr_leaves, &err_leaf, &err_subleaf);
>> +                                    policy->nr_leaves, &err_leaf, &err_subleaf);
>>      if ( rc )
>>      {
>>          if ( err_leaf != -1 )
>> @@ -851,7 +850,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
>>      }
>>  
>>      rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
>> -                                  nr_entries, &err_msr);
>> +                                  policy->nr_msrs, &err_msr);
>>      if ( rc )
>>      {
>>          if ( err_msr != -1 )
>> @@ -878,7 +877,10 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
>>          return rc;
>>      }
>>  
>> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
>> +    policy->nr_leaves = nr_leaves;
>> +    policy->nr_msrs = nr_msrs;
>> +
>> +    rc = deserialize_policy(xch, policy);
>>      if ( rc )
>>      {
>>          errno = -rc;
>> @@ -903,7 +905,10 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
>>          return rc;
>>      }
>>  
>> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
>> +    policy->nr_leaves = nr_leaves;
>> +    policy->nr_msrs = nr_msrs;
>> +
>> +    rc = deserialize_policy(xch, policy);
>>      if ( rc )
>>      {
>>          errno = -rc;
>> @@ -917,17 +922,14 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>>                               xc_cpu_policy_t *policy)
>>  {
>>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>> -    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
>> -    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
>>      int rc;
>>  
>> -    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
>> -                                 policy->msrs, &nr_msrs);
>> +    rc = xc_cpu_policy_serialise(xch, policy);
>>      if ( rc )
>>          return rc;
>>  
>> -    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
>> -                                  nr_msrs, policy->msrs,
>> +    rc = xc_set_domain_cpu_policy(xch, domid, policy->nr_leaves, policy->leaves,
>> +                                  policy->nr_msrs, policy->msrs,
>>                                    &err_leaf, &err_subleaf, &err_msr);
>>      if ( rc )
>>      {
>> @@ -942,34 +944,32 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>>      return rc;
>>  }
>>  
>> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
>> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
>> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
>> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
>>  {
>> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves);
>> +    unsigned int nr_msrs = ARRAY_SIZE(p->msrs);
>>      int rc;
>>  
>> -    if ( leaves )
>> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
>> +    if ( rc )
>>      {
>> -        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
>> -        if ( rc )
>> -        {
>> -            ERROR("Failed to serialize CPUID policy");
>> -            errno = -rc;
>> -            return -1;
>> -        }
>> +        ERROR("Failed to serialize CPUID policy");
>> +        errno = -rc;
>> +        return -1;
>>      }
>>  
>> -    if ( msrs )
>> +    p->nr_leaves = nr_leaves;
> 
> Nit: FWIW, I think you could avoid having to introduce local
> nr_{leaves,msrs} variables and just use p->nr_{leaves,msrs}?  By
> setting them to ARRAY_SIZE() at the top of the function and then
> letting x86_{cpuid,msr}_copy_to_buffer() adjust as necessary.
> 
> Thanks, Roger.

The intent was to avoid mutating the policy object in the error cases
during deserialise. Then I adjusted the serialise case to have symmetry.

It's true the preservation is not meaningful in the serialise case
because at that point the serialised form is already corrupted.

I don't mind either way. Seeing how I'm sending one final version with
the comments of patch2 I'll just adjust as you proposed.

Cheers,
Alejandro

