Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2148CC3EC
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727759.1132415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ngE-0003zO-G1; Wed, 22 May 2024 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727759.1132415; Wed, 22 May 2024 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ngE-0003x4-CK; Wed, 22 May 2024 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 727759;
 Wed, 22 May 2024 15:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEN6=MZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s9ngD-0003wy-31
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:15:01 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db1c897-184e-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 17:14:58 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-351b683f2d8so751139f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 08:14:58 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbca98sm34581412f8f.112.2024.05.22.08.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 08:14:57 -0700 (PDT)
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
X-Inumbo-ID: 0db1c897-184e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716390898; x=1716995698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kKdNh+rZiON7ptffywUHyNxYVSfVBM2j7BRr65fCRY=;
        b=FofK+Vh46ZvyCEvkozPgALswji7pM6FxkzGih1AjuVT48tBc4BhQ/JFYTseFq/lUs7
         rvaEvRkBim4LnyHQRKOPGRmolpButDGV9xrbhm1CUwwyA9GrPaOrK1l1PiX6wrhj1DXv
         QAE5MO3II/qHwIF8cdqhTN2ED+LnVMyejppC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716390898; x=1716995698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kKdNh+rZiON7ptffywUHyNxYVSfVBM2j7BRr65fCRY=;
        b=LZdjjkV+sG23t86W59gL+BU40ywDE39UOMCiOzdj1fwVCc3ZTXrz4+yLg3bMPkZrGe
         iBmPmUcrZtkrUBX+TPp2GKcbwgBJWGbVQ/UrKPFRATLSR8t8meqIv+DBViZGPFzchHav
         terhKQJkwuKt8dv01KL8Ye73kI7gS4txIT9rv7Wha/L+lcLRujPAAyYGXO4xhswfTkrA
         sAqOfu3mASl0yatMKeNGKClHSNidRnMjSXz1F+PUrwgjjpyEWfqBx6MecxEzaRxpY7sS
         I+3MdNzeO+3mo+KnNdyUP1r/ZtY0Ml2a8m9KkQLE8s0ZzvFynvJHxasJLFjtiNn1Xxc0
         BpOw==
X-Gm-Message-State: AOJu0YwVWN9TJoYqVZP4jHtIcG24VjvLFurhp2xpyb4p0cU7cba0yOH2
	mvX2AZhsyWSK9xdHHSfYhVmBedDSZRZ5/nfCdN88uldRnOmOssWUjqb9lejIoes=
X-Google-Smtp-Source: AGHT+IG6oWA2Y3q/5TeHJdjPaFvHHHarkj3yId8ntGvmVgxu9DGx66VHuREBWLFhVf8wR2arvc6VdQ==
X-Received: by 2002:adf:e745:0:b0:354:f1de:33e7 with SMTP id ffacd0b85a97d-354f1de3617mr1051687f8f.2.1716390898327;
        Wed, 22 May 2024 08:14:58 -0700 (PDT)
Message-ID: <f0efee18-54f5-4caa-a4ab-d82ceeea64bb@cloud.com>
Date: Wed, 22 May 2024 16:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
 <c6c89012d189a2c3077b3e224942b33028e29336.1715954111.git.alejandro.vallejo@cloud.com>
 <ZktUfWZD67zkvaeJ@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZktUfWZD67zkvaeJ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2024 14:47, Roger Pau Monné wrote:
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
> 
> I would be tempted to just pass the policy to
> xc_set_domain_cpu_policy() and get rid of the separate cpuid and msrs
> serialized arrays, but that hides (or makes it less obvious) that the
> policy needs to be serialized before providing to
> xc_set_domain_cpu_policy().  Just a rant, no need to change it here.

I'm still pondering what to do about that. I'd like to refactor all that
faff away as well, but I'm not sure how to do it cleanly yet. The
biggest danger I see is modifying one side of the policy and then wiping
those changes by mistake reserializing or deserializing at the wrong time.

Not for this series, I reckon.


>> +int xc_cpu_policy_get_msrs(xc_interface *xch,
>> +                           const xc_cpu_policy_t *policy,
>> +                           const xen_msr_entry_t **msrs,
>> +                           uint32_t *nr)
>> +{
>> +    if ( !policy )
>> +    {
>> +        ERROR("Failed to fetch MSRs from policy object");
>> +        errno = -EINVAL;
>> +        return -1;
>> +    }
>> +
>> +    *msrs = policy->msrs;
>> +    *nr = policy->nr_msrs;
>> +
>> +    return 0;
>> +}
> 
> My preference would probably be to return NULL or
> xen_{leaf,msr}_entry_t * from those, as we can then avoid an extra
> leaves/msrs parameter.  Again I'm fine with leaving it like this.
> 

It didn't feel right to have an output parameter as the return value
doubling as status code when another output is in the parameter list. I
can perfectly imagine someone grabbing "nr" and ignoring "msrs" because
"msrs" doesn't happen to be needed for them.

I think there's extra safety in making it harder to ignore the error.

>> -    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
>> -    if ( cpuid.length )
>> +    record = (struct xc_sr_record) {
>> +        .type = REC_TYPE_X86_CPUID_POLICY,
>> +        .data = policy->leaves,
>> +        .length = policy->nr_leaves * sizeof(*policy->leaves),
>> +    };
>> +    if ( record.length )
>>      {
>> -        rc = write_record(ctx, &cpuid);
>> +        rc = write_record(ctx, &record);
>>          if ( rc )
>>              goto out;
>>      }
> 
> 
> You could maybe write this as:
> 
> if ( policy->nr_leaves )
> {
>     const struct xc_sr_record r = {
>         .type = REC_TYPE_X86_CPUID_POLICY,
>         .data = policy->leaves,
>         .length = policy->nr_leaves * sizeof(*policy->leaves),
>     };
> 
>     rc = write_record(ctx, &record);
> }
> 
> (same for the msr record)
> 

Ack. Looks nicer that way.

>>  
>> -    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
>> -    if ( msrs.length )
>> +    record = (struct xc_sr_record) {
>> +        .type = REC_TYPE_X86_MSR_POLICY,
>> +        .data = policy->msrs,
>> +        .length = policy->nr_msrs * sizeof(*policy->msrs),
>> +    };
>> +    if ( record.length )
>>      {
>> -        rc = write_record(ctx, &msrs);
>> +        rc = write_record(ctx, &record);
>>          if ( rc )
>>              goto out;
>>      }
>> @@ -100,8 +84,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>>      rc = 0;
>>  
>>   out:
>> -    free(cpuid.data);
>> -    free(msrs.data);
>>      xc_cpu_policy_destroy(policy);
>>  
>>      return rc;
>> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
>> index 8893547bebce..1c9ba6d32060 100644
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -409,17 +409,21 @@ static void dump_info(xc_interface *xch, bool detail)
>>      free(fs);
>>  }
>>  
>> -static void print_policy(const char *name,
>> -                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
>> -                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
>> +static void print_policy(xc_interface *xch, const char *name, const xc_cpu_policy_t *policy)
> 
> Line length.

Ack

> 
>>  {
>> -    unsigned int l;
>> +    const xen_cpuid_leaf_t *leaves;
>> +    const xen_msr_entry_t *msrs;
>> +    uint32_t nr_leaves, nr_msrs;
>> +
>> +    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) ||
>> +         xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
>> +        err(1, "print_policy()");
> 
> Shouldn't the error message be "xc_cpu_policy_get_{leaves,msrs}()"
> instead, as one of those is the cause of the error?
> 
> Other err() usages do print the function triggering the error, not the
> function context name.
> 

Sure. I've demultiplexed them into separate conditionals as well now.

>>  
>>      printf("%s policy: %u leaves, %u MSRs\n", name, nr_leaves, nr_msrs);
>>      printf(" CPUID:\n");
>>      printf("  %-8s %-8s -> %-8s %-8s %-8s %-8s\n",
>>             "leaf", "subleaf", "eax", "ebx", "ecx", "edx");
>> -    for ( l = 0; l < nr_leaves; ++l )
>> +    for ( uint32_t l = 0; l < nr_leaves; ++l )
>>      {
>>          /* Skip empty leaves. */
>>          if ( !leaves[l].a && !leaves[l].b && !leaves[l].c && !leaves[l].d )
>> @@ -432,7 +436,7 @@ static void print_policy(const char *name,
>>  
>>      printf(" MSRs:\n");
>>      printf("  %-8s -> %-16s\n", "index", "value");
>> -    for ( l = 0; l < nr_msrs; ++l )
>> +    for ( uint32_t l = 0; l < nr_msrs; ++l )
> 
> I would be tempted to leave `l` as-is, seeing as there's no real need
> to modify it in the patch context, and the patch is already fairly
> long.

done

Cheers,
Alejandro

