Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DE9076EB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 17:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740075.1147081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmXQ-0001Xx-Ix; Thu, 13 Jun 2024 15:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740075.1147081; Thu, 13 Jun 2024 15:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmXQ-0001VV-F7; Thu, 13 Jun 2024 15:38:56 +0000
Received: by outflank-mailman (input) for mailman id 740075;
 Thu, 13 Jun 2024 15:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6Wr=NP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sHmXP-0001VK-2T
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 15:38:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09ca034f-299b-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 17:38:53 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ca342d6f3so700886e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 08:38:53 -0700 (PDT)
Received: from [192.168.1.132] (cm-93-156-201-199.telecable.es.
 [93.156.201.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f641a6c1sm28939125e9.40.2024.06.13.08.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 08:38:52 -0700 (PDT)
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
X-Inumbo-ID: 09ca034f-299b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718293133; x=1718897933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=28c2zISvgcTW8QUWfgyLBiP9vbBrRAxGiXJK9ylRM2c=;
        b=bg79w/Kzg0g/84v2ydZFkR+6wZ19YTeTFh2fZyrdgCFffxjNogciIVmTVQVBz+ZUUe
         Mqj+NgKay+w7onuzawS9jbt6oGJBRQmpkjlg+6xoe5hpg7jAQXqCz+CVfVh+9HF7Ba4d
         eb5OS5UxHiJeq/hl+g5wavFqfm18KUShFWetA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718293133; x=1718897933;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28c2zISvgcTW8QUWfgyLBiP9vbBrRAxGiXJK9ylRM2c=;
        b=bbaB+6NzIi4rC2Cgw0F/cUXFCa9Meu35Ax2jhtM9bRiZt9vUGwumnS7xe2SAqRKCyL
         PK+wNTE9EnGsPM0Hz7JpKz8sK4wvyAXN0Sop4jTrkt9fc/fkqLG3vTac4klurupCgwRD
         VD+2z3xGUH2XDGaVKCA302sK8yhH7iHJb4RXDr7rNVmt7Fx2NCXhtlbe7ItUq9LufiIw
         UBGoD+1esok0PawBs0ydOGkKF1wc0a2PrmJkIhjN7W8rpOZfHYJkY4h6uEMphe5DpNTH
         H8ilynXYI1RgAY0S7xFAQm/Xw8huABHHWCaSSBC8w9gE8swRVep9NOQ0um62nNA42UxW
         N2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUV8CxGS5WQ4sV78jw8bHCl6NUg9niIBs2SDuqGymS12SSjEQNYu3+qgdlty84NbljLgU/PzidbLyOIahDzA7mna4mENltnHjg1DsbqeMA=
X-Gm-Message-State: AOJu0YzHP3Gg95+dAr/vT/TDCg/WaavK9/WTL7U1q76jj7mahzgz61Yx
	zZhCWevg5sksiDF1UzoBGdndN1Iq23NssHYn7o6mnGWHTR9nEXctTMBbx3/e4g0=
X-Google-Smtp-Source: AGHT+IHpGlqOG2pF26ZxPjRXtw33gbzAef1/iHN+Ijew0cqKIsfohNj0jcyc7eCJPj9BGI03u7Sb0w==
X-Received: by 2002:a19:f618:0:b0:52c:8023:e021 with SMTP id 2adb3069b0e04-52ca6e6b22bmr90988e87.33.1718293132574;
        Thu, 13 Jun 2024 08:38:52 -0700 (PDT)
Message-ID: <5d00914f-f43c-4e3e-885c-7a9d3fa48411@cloud.com>
Date: Thu, 13 Jun 2024 16:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH v4 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
 <f456bfb8996bb1fd4b965755622cda6fcb61b297.1716992707.git.alejandro.vallejo@cloud.com>
 <497624e9-053a-407e-86f0-e3d2c8883cd7@citrix.com>
Content-Language: en-GB
In-Reply-To: <497624e9-053a-407e-86f0-e3d2c8883cd7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2024 00:59, Andrew Cooper wrote:
> On 29/05/2024 3:30 pm, Alejandro Vallejo wrote:
>> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
>> index e01f494b772a..85d56f26537b 100644
>> --- a/tools/include/xenguest.h
>> +++ b/tools/include/xenguest.h
>> @@ -799,15 +799,23 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
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
>>  
>> +/*
>> + * Accessors for the serialised forms of the policy. The outputs are pointers
>> + * into the policy object and not fresh allocations, so their lifetimes are tied
>> + * to the policy object itself.
> 
> This is far more complicated.  See below.
> 
>> + */
>> +int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
>> +                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
>> +int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
>> +                           const xen_msr_entry_t **msrs, uint32_t *nr);
>> +
>>  /* Compatibility calculations. */
>>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>>                                   xc_cpu_policy_t *guest);
>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>> index 4453178100ad..6cab5c60bb41 100644
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
> 
> Urgh - this is a mess.

That's a fair assessment, yes :)

> (Not your fault, but we really need to think
> twice before continuing.)>
> xc_cpu_policy_serialise() is an exported function and, prior to this
> series, used by external entities to get at the content inside the
> opaque object.>
> deserialize_policy()  (Clearly not written by me - Roger?) is a local
> helper.  Also it looks wonky in the next patch, although I think that's
> just code movement to avoid a forward declaration?

Correct.

> 
> By the end of the series, xc_cpu_policy_serialise() isn't used
> externally, but it's still exported.

Because it's external and I didn't want to break the ABI should it be
used somewhere downstream. Happy to change that though.

> 
> But, besides the visibility, there's a second difference...
> 
> 
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
> 
> ... they're asymmetric as to whether the caller or the callee preloads
> policy->nr_*.>
> Both of these need rationalising, one way or another.
> 


I'm not sure I follow. Neither the why nor the how.

nr_* assignments are not arbitrary. Deserialising doesn't involve
modifying the number of leaves/MSRs. The cases in which they are set are:

1. New policy is loaded from the hypervisor
    * Must be reset to maximum values before hypercall and set to the
outputs of the hypercall after.
2. Policy is serialised
    * Number of leaves could increase/decrease

Case (1) must be handled in the hypercall wrappers themselves because
the policy is effectively an output object as a whole then. On case (2)
they must be set by the serialiser itself, as that's the one that knows
the end result.

Could you elaborate in what you mean?

> 
> But, there's a related problem.
> 
> Previously there was only one canonical form (the deserialised form),
> and anything operating on state was responsible for getting it back to
> being the deserialised form.

That's true. But this tension exists regardless of this patch. Some
parts of the code want to operate on raw data and others on structured
data; and then others on featuresets because 3 forms are better than 2.

The roundtrip through featuresets already breaks apart the idea of a
"canonical" form. Truth is, users of this framework operate on a "I know
what form I'm operating on and what form I must restore it to", if not
by design then by accident.

I don't have a good argument about the fragility of the whole thing
besides it being silly, convoluted and visually noisy to dynamically
allocate a fixed-sized array in order to deserialize things. Plus it's
yet another source of errors when callers have to keep track of their
own dynamic buffers.

> 
> Now, there are two forms which are coexist side by side.  The buffer
> exposed by get_{cpuid,msr}() is only good until the next operation which
> uses what were (previously) the internal staging buffer(s).
> 
> And that makes it a fragile and error prone interface.

3, including the featuresets. And note that dynamically allocating
buffers outside the policy object is very error prone as well. It's a
matter of where we want to have fragility.

Unrelated for what you mean, but I'll put my Rust hat for this and start
preaching; This is the sort of thing Rust's borrow checker can be abused
to avoid lifetime related pitfalls.

Can you think of another way that doesn't involve a copyout?

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
>> @@ -942,32 +944,26 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>>      return rc;
>>  }
>>  
>> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
>> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
>> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
>> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
>>  {
>>      int rc;
>> +    p->nr_leaves = ARRAY_SIZE(p->leaves);
>> +    p->nr_msrs = ARRAY_SIZE(p->msrs);
>>  
>> -    if ( leaves )
>> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &p->nr_leaves);
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
>> +    rc = x86_msr_copy_to_buffer(&p->policy, p->msrs, &p->nr_msrs);
>> +    if ( rc )
>>      {
>> -        rc = x86_msr_copy_to_buffer(&p->policy, msrs, nr_msrs);
>> -        if ( rc )
>> -        {
>> -            ERROR("Failed to serialize MSR policy");
>> -            errno = -rc;
>> -            return -1;
>> -        }
>> +        ERROR("Failed to serialize MSR policy");
>> +        errno = -rc;
>> +        return -1;
>>      }
>>  
>>      errno = 0;
>> @@ -1012,6 +1008,42 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>>      return rc;
>>  }
>>  
>> +int xc_cpu_policy_get_leaves(xc_interface *xch,
>> +                             const xc_cpu_policy_t *policy,
>> +                             const xen_cpuid_leaf_t **leaves,
>> +                             uint32_t *nr)
>> +{
>> +    if ( !policy )
>> +    {
>> +        ERROR("Failed to fetch CPUID leaves from policy object");
>> +        errno = -EINVAL;
>> +        return -1;
>> +    }
> 
> This check isn't useful, and it's making the interface inconsistent. 
> There's no case ever where a NULL policy is meaningful, except for the
> very initial failure to allocate, and there it's the return value not an
> input parameter.>
> More importantly however, the error message is misleading as a consequence.

Pretty sure I've been asked before to validate trivial preconditions so
I'm guessing various maintainers have conflicting opinions on how
aggresively to validate?

TL;DR: Sure, happy to rip that out.

> 
>> +
>> +    *leaves = policy->leaves;
>> +    *nr = policy->nr_leaves;
>> +
>> +    return 0;
>> +}
>> +
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
>> +
>>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>>                                   xc_cpu_policy_t *guest)
>>  {
>> diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
>> index d73947094f2e..a65dae818f3d 100644
>> --- a/tools/libs/guest/xg_private.h
>> +++ b/tools/libs/guest/xg_private.h
>> @@ -177,6 +177,8 @@ struct xc_cpu_policy {
>>      struct cpu_policy policy;
>>      xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
>>      xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
>> +    uint32_t nr_leaves;
>> +    uint32_t nr_msrs;
> 
> These need a comment explaining how they're used, and sadly they have no
> relationship to the lengths of the array.  There's a corner case where
> they can end up larger.

The may end up smaller, but they must absolutely never end up larger. If
such a corner case exists, please elaborate because it's a bug I'd like
to have fixed.

>  
>>  };
>>  #endif /* x86 */
>>  
>> diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
>> index 563b4f016877..a0d67c3211c6 100644
>> --- a/tools/libs/guest/xg_sr_common_x86.c
>> +++ b/tools/libs/guest/xg_sr_common_x86.c
>> @@ -1,4 +1,5 @@
>>  #include "xg_sr_common_x86.h"
>> +#include "xg_sr_stream_format.h"
> 
> I'm pretty sure this shouldn't be necessary.  Is it?

Indeed. Leftover from previous version

> 
>>  
>>  int write_x86_tsc_info(struct xc_sr_context *ctx)
>>  {
>> @@ -45,54 +46,39 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
>>  int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>>  {
>>      xc_interface *xch = ctx->xch;
>> -    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
>> -    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
>> -    uint32_t nr_leaves = 0, nr_msrs = 0;
>> -    xc_cpu_policy_t *policy = NULL;
>> +    xc_cpu_policy_t *policy = xc_cpu_policy_init();
>>      int rc;
>>  
>> -    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
>> -    {
>> -        PERROR("Unable to get CPU Policy size");
>> -        return -1;
>> -    }
>> -
>> -    cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
>> -    msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
>> -    policy = xc_cpu_policy_init();
>> -    if ( !cpuid.data || !msrs.data || !policy )
>> -    {
>> -        ERROR("Cannot allocate memory for CPU Policy");
>> -        rc = -1;
>> -        goto out;
>> -    }
>> -
>> -    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
>> +    if ( !policy || xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
>>      {
>>          PERROR("Unable to get d%d CPU Policy", ctx->domid);
>>          rc = -1;
>>          goto out;
>>      }
>> -    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
>> -                                 msrs.data, &nr_msrs) )
>> -    {
>> -        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
>> -        rc = -1;
>> -        goto out;
>> -    }
> 
> Wow, the old code here was especially daft.

Can confirm.

> 
> We're having Xen serialise the policy, copying (double buffering) into
> the policy object then desensitising.  And vs the old copy, we've got
> rid of the re-serialise into yet another buffer.
> 
> But we should still be using a plain XEN_DOMCTL_get_cpu_policy here. 
> Literally all we want to do is take the array(s) Xen gave us and feed
> them straight into the fd.
> 
> deserialising is already a reasonably expensive operation (every
> individual leaf coordinate needs re-range checking), and is only ever
> going to get worse.

I wouldn't go that far. It's definitely on the "don't do it every other
operation", but it's a tiny fraction of the (current) cost of a single
hypercall.

> 
> It will probably help to split the changes to
> write_x86_cpu_policy_records() out into a separate patch.  It's more
> clear cut and also addresses one of the local vs external issues
> discussed above.
> 
> 
>>  
>> -    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
>> -    if ( cpuid.length )
>> +
>> +    if ( policy->nr_leaves )
>>      {
>> -        rc = write_record(ctx, &cpuid);
>> +        struct xc_sr_record record = {
>> +            .type = REC_TYPE_X86_CPUID_POLICY,
>> +            .data = policy->leaves,
>> +            .length = policy->nr_leaves * sizeof(*policy->leaves),
>> +        };
>> +
>> +        rc = write_record(ctx, &record);
> 
> Please keep this name being cpuid.  It's more helpful when grepping, and
> it also shrinks the diff.

Ack

> 
>>          if ( rc )
>>              goto out;
>>      }
>>  
>> -    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
>> -    if ( msrs.length )
>> +    if ( policy->nr_msrs )
>>      {
>> -        rc = write_record(ctx, &msrs);
>> +        struct xc_sr_record record = {
>> +            .type = REC_TYPE_X86_MSR_POLICY,
>> +            .data = policy->msrs,
>> +            .length = policy->nr_msrs * sizeof(*policy->msrs),
>> +        };
>> +
>> +        rc = write_record(ctx, &record);
>>          if ( rc )
>>              goto out;
>>      }
>> @@ -100,8 +86,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>>      rc = 0;
>>  
>>   out:
>> -    free(cpuid.data);
>> -    free(msrs.data);
>>      xc_cpu_policy_destroy(policy);
>>  
>>      return rc;
>> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
>> index 4c4593528dfe..488f43378406 100644
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -156,12 +156,18 @@ static void dump_info(xc_interface *xch, bool detail)
>>  
>>      free(fs);
>>  }
>> -
> 
> Stray (deleted) whitespace.

Ack

> 
>> -static void print_policy(const char *name,
>> -                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
>> -                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
>> +static void print_policy(xc_interface *xch, const char *name,
>> +                         const xc_cpu_policy_t *policy)
>>  {
>>      unsigned int l;
>> +    const xen_cpuid_leaf_t *leaves;
>> +    const xen_msr_entry_t *msrs;
>> +    uint32_t nr_leaves, nr_msrs;
>> +
>> +    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) )
>> +        err(1, "xc_cpu_policy_get_leaves()");
>> +    if ( xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
>> +        err(1, "xc_cpu_policy_get_msrs()");
> 
> Not an issue with here per say, but to drive home the main problem.
> 
> This doesn't return the current leaves/msrs.  It gives you whatever's
> stale in the staging buffer, which happens to be ok in xen-cpuid because
> it only ever reads a policy...
> 
> ~Andrew

It's not stale if the deserialized policy is not dirty. The alternative
is a copyout (what happened before) which was way more brittle and
involved more hypercalls.

As I mentioned before, I you can think of a better scheme, I'm happy to
consider it.

Cheers,
Alejandro

