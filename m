Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD78D56AD
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733130.1139228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCpfq-00019u-7y; Thu, 30 May 2024 23:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733130.1139228; Thu, 30 May 2024 23:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCpfq-00017B-3q; Thu, 30 May 2024 23:59:10 +0000
Received: by outflank-mailman (input) for mailman id 733130;
 Thu, 30 May 2024 23:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCpfp-000175-Dk
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 23:59:09 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c18c1e-1ee0-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 01:59:08 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-43fdf8a6437so2289171cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 16:59:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43ff23bfa2dsm2872701cf.22.2024.05.30.16.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 16:59:05 -0700 (PDT)
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
X-Inumbo-ID: 99c18c1e-1ee0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717113547; x=1717718347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AT2rc5LODno5TFOto2QjQ8ousrDMjzLxgKW1mhEZVuo=;
        b=io0c44K4d5jcWMTVA4zqbZj/te0n2nNr4zakVi9Q/K3LZ3+0bMStUDYKVdclcoho1i
         2uhdHu6nn1tL+ldU/68igsDR2VqUBp8q6ba3OQUmf+5iZ4D5zWsChpvsXiKVIUPqJmVl
         we6Ncmj224vZixLIEH8wzzJ0IPCzXlfLMN9oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113547; x=1717718347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT2rc5LODno5TFOto2QjQ8ousrDMjzLxgKW1mhEZVuo=;
        b=laTeyB3dP2ctLn5TvM4IzXci7NogKDuJimgtB8wSfIGzXJ3Mnoyg6dIJ3Yuv5rRp3A
         FxYwd/+ObqHpMcJVfJgQCa6c2vacwlzeLuDstXZac6ivEF5PuqiNHdpy0MBGyE4WpJYI
         y1FsuoEg05SpiiCzp/iJAF3BPUb+FyThZzqulh8nL1a6kNDsPvn98gVmyFSzmIISZQ+M
         EZVEzRGbV8DZVQsnpXcTjVGrAIvTe2wxI66ogISysDPCjq7uh5164qHWPcGoNsclQ38G
         yHDFUmGFHMubljtHHgRLdzdDbmi1oExhV3WHHqCsXl0Mjjt6IVnUeokw9LJLplWHVnzg
         lJZA==
X-Forwarded-Encrypted: i=1; AJvYcCVIwSVx6Eg/v6wwXYEhBgOCRzBPPWj4WbZsPsWvYmqgeh5xcMsvhx0dyp7b3L+S6BDvmPcGG6XrLxWewBlO4Qix1LwbKvOnrwwIMbEOzRw=
X-Gm-Message-State: AOJu0YzcZOjoVn5gEHy/urXNwxl7wVp6F2W7UGt1eR4qlaAtmQnTj+T9
	/rEUBAwT9WjEGJb8eaMiLp3hrfaWC3Swj6+8ofNHDnvzkP+bcJkmOmtqMJc7wuc=
X-Google-Smtp-Source: AGHT+IGWztHCZH+bZwACsZuBGkg0Kz9R39QrzM2O7itMqQF8NTIKbFpFbmro2+iLP7zJEIj5Cg8snw==
X-Received: by 2002:a05:622a:164c:b0:43f:e7c7:a4e2 with SMTP id d75a77b69052e-43ff522d242mr3280341cf.5.1717113546244;
        Thu, 30 May 2024 16:59:06 -0700 (PDT)
Message-ID: <497624e9-053a-407e-86f0-e3d2c8883cd7@citrix.com>
Date: Fri, 31 May 2024 00:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
 <f456bfb8996bb1fd4b965755622cda6fcb61b297.1716992707.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f456bfb8996bb1fd4b965755622cda6fcb61b297.1716992707.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 3:30 pm, Alejandro Vallejo wrote:
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b772a..85d56f26537b 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -799,15 +799,23 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>                               xc_cpu_policy_t *policy);
>  
>  /* Manipulate a policy via architectural representations. */
> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *policy);
>  int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
>                                 const xen_cpuid_leaf_t *leaves,
>                                 uint32_t nr);
>  int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>                                const xen_msr_entry_t *msrs, uint32_t nr);
>  
> +/*
> + * Accessors for the serialised forms of the policy. The outputs are pointers
> + * into the policy object and not fresh allocations, so their lifetimes are tied
> + * to the policy object itself.

This is far more complicated.  See below.

> + */
> +int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
> +int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                           const xen_msr_entry_t **msrs, uint32_t *nr);
> +
>  /* Compatibility calculations. */
>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>                                   xc_cpu_policy_t *guest);
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4453178100ad..6cab5c60bb41 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -834,14 +834,13 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
>      }
>  }
>  
> -static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
> -                              unsigned int nr_leaves, unsigned int nr_entries)
> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
>  {
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      int rc;
>  
>      rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
> -                                    nr_leaves, &err_leaf, &err_subleaf);
> +                                    policy->nr_leaves, &err_leaf, &err_subleaf);
>      if ( rc )
>      {
>          if ( err_leaf != -1 )

Urgh - this is a mess.  (Not your fault, but we really need to think
twice before continuing.)

xc_cpu_policy_serialise() is an exported function and, prior to this
series, used by external entities to get at the content inside the
opaque object.

deserialize_policy()  (Clearly not written by me - Roger?) is a local
helper.  Also it looks wonky in the next patch, although I think that's
just code movement to avoid a forward declaration?

By the end of the series, xc_cpu_policy_serialise() isn't used
externally, but it's still exported.

But, besides the visibility, there's a second difference...


> @@ -851,7 +850,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
>      }
>  
>      rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
> -                                  nr_entries, &err_msr);
> +                                  policy->nr_msrs, &err_msr);
>      if ( rc )
>      {
>          if ( err_msr != -1 )
> @@ -878,7 +877,10 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
>          return rc;
>      }
>  
> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
> +    policy->nr_leaves = nr_leaves;
> +    policy->nr_msrs = nr_msrs;
> +
> +    rc = deserialize_policy(xch, policy);

... they're asymmetric as to whether the caller or the callee preloads
policy->nr_*.

Both of these need rationalising, one way or another.


But, there's a related problem.

Previously there was only one canonical form (the deserialised form),
and anything operating on state was responsible for getting it back to
being the deserialised form.

Now, there are two forms which are coexist side by side.  The buffer
exposed by get_{cpuid,msr}() is only good until the next operation which
uses what were (previously) the internal staging buffer(s).

And that makes it a fragile and error prone interface.

>      if ( rc )
>      {
>          errno = -rc;
> @@ -903,7 +905,10 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
>          return rc;
>      }
>  
> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
> +    policy->nr_leaves = nr_leaves;
> +    policy->nr_msrs = nr_msrs;
> +
> +    rc = deserialize_policy(xch, policy);
>      if ( rc )
>      {
>          errno = -rc;
> @@ -917,17 +922,14 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>                               xc_cpu_policy_t *policy)
>  {
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
> -    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
>      int rc;
>  
> -    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
> -                                 policy->msrs, &nr_msrs);
> +    rc = xc_cpu_policy_serialise(xch, policy);
>      if ( rc )
>          return rc;
>  
> -    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
> -                                  nr_msrs, policy->msrs,
> +    rc = xc_set_domain_cpu_policy(xch, domid, policy->nr_leaves, policy->leaves,
> +                                  policy->nr_msrs, policy->msrs,
>                                    &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
> @@ -942,32 +944,26 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>      return rc;
>  }
>  
> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
>  {
>      int rc;
> +    p->nr_leaves = ARRAY_SIZE(p->leaves);
> +    p->nr_msrs = ARRAY_SIZE(p->msrs);
>  
> -    if ( leaves )
> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &p->nr_leaves);
> +    if ( rc )
>      {
> -        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
> -        if ( rc )
> -        {
> -            ERROR("Failed to serialize CPUID policy");
> -            errno = -rc;
> -            return -1;
> -        }
> +        ERROR("Failed to serialize CPUID policy");
> +        errno = -rc;
> +        return -1;
>      }
>  
> -    if ( msrs )
> +    rc = x86_msr_copy_to_buffer(&p->policy, p->msrs, &p->nr_msrs);
> +    if ( rc )
>      {
> -        rc = x86_msr_copy_to_buffer(&p->policy, msrs, nr_msrs);
> -        if ( rc )
> -        {
> -            ERROR("Failed to serialize MSR policy");
> -            errno = -rc;
> -            return -1;
> -        }
> +        ERROR("Failed to serialize MSR policy");
> +        errno = -rc;
> +        return -1;
>      }
>  
>      errno = 0;
> @@ -1012,6 +1008,42 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>      return rc;
>  }
>  
> +int xc_cpu_policy_get_leaves(xc_interface *xch,
> +                             const xc_cpu_policy_t *policy,
> +                             const xen_cpuid_leaf_t **leaves,
> +                             uint32_t *nr)
> +{
> +    if ( !policy )
> +    {
> +        ERROR("Failed to fetch CPUID leaves from policy object");
> +        errno = -EINVAL;
> +        return -1;
> +    }

This check isn't useful, and it's making the interface inconsistent. 
There's no case ever where a NULL policy is meaningful, except for the
very initial failure to allocate, and there it's the return value not an
input parameter.

More importantly however, the error message is misleading as a consequence.

> +
> +    *leaves = policy->leaves;
> +    *nr = policy->nr_leaves;
> +
> +    return 0;
> +}
> +
> +int xc_cpu_policy_get_msrs(xc_interface *xch,
> +                           const xc_cpu_policy_t *policy,
> +                           const xen_msr_entry_t **msrs,
> +                           uint32_t *nr)
> +{
> +    if ( !policy )
> +    {
> +        ERROR("Failed to fetch MSRs from policy object");
> +        errno = -EINVAL;
> +        return -1;
> +    }
> +
> +    *msrs = policy->msrs;
> +    *nr = policy->nr_msrs;
> +
> +    return 0;
> +}
> +
>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>                                   xc_cpu_policy_t *guest)
>  {
> diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
> index d73947094f2e..a65dae818f3d 100644
> --- a/tools/libs/guest/xg_private.h
> +++ b/tools/libs/guest/xg_private.h
> @@ -177,6 +177,8 @@ struct xc_cpu_policy {
>      struct cpu_policy policy;
>      xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
>      xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
> +    uint32_t nr_leaves;
> +    uint32_t nr_msrs;

These need a comment explaining how they're used, and sadly they have no
relationship to the lengths of the array.  There's a corner case where
they can end up larger.

>  };
>  #endif /* x86 */
>  
> diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
> index 563b4f016877..a0d67c3211c6 100644
> --- a/tools/libs/guest/xg_sr_common_x86.c
> +++ b/tools/libs/guest/xg_sr_common_x86.c
> @@ -1,4 +1,5 @@
>  #include "xg_sr_common_x86.h"
> +#include "xg_sr_stream_format.h"

I'm pretty sure this shouldn't be necessary.  Is it?

>  
>  int write_x86_tsc_info(struct xc_sr_context *ctx)
>  {
> @@ -45,54 +46,39 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
>  int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>  {
>      xc_interface *xch = ctx->xch;
> -    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
> -    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
> -    uint32_t nr_leaves = 0, nr_msrs = 0;
> -    xc_cpu_policy_t *policy = NULL;
> +    xc_cpu_policy_t *policy = xc_cpu_policy_init();
>      int rc;
>  
> -    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
> -    {
> -        PERROR("Unable to get CPU Policy size");
> -        return -1;
> -    }
> -
> -    cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
> -    msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
> -    policy = xc_cpu_policy_init();
> -    if ( !cpuid.data || !msrs.data || !policy )
> -    {
> -        ERROR("Cannot allocate memory for CPU Policy");
> -        rc = -1;
> -        goto out;
> -    }
> -
> -    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
> +    if ( !policy || xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
>      {
>          PERROR("Unable to get d%d CPU Policy", ctx->domid);
>          rc = -1;
>          goto out;
>      }
> -    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
> -                                 msrs.data, &nr_msrs) )
> -    {
> -        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
> -        rc = -1;
> -        goto out;
> -    }

Wow, the old code here was especially daft.

We're having Xen serialise the policy, copying (double buffering) into
the policy object then desensitising.  And vs the old copy, we've got
rid of the re-serialise into yet another buffer.

But we should still be using a plain XEN_DOMCTL_get_cpu_policy here. 
Literally all we want to do is take the array(s) Xen gave us and feed
them straight into the fd.

deserialising is already a reasonably expensive operation (every
individual leaf coordinate needs re-range checking), and is only ever
going to get worse.

It will probably help to split the changes to
write_x86_cpu_policy_records() out into a separate patch.  It's more
clear cut and also addresses one of the local vs external issues
discussed above.


>  
> -    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
> -    if ( cpuid.length )
> +
> +    if ( policy->nr_leaves )
>      {
> -        rc = write_record(ctx, &cpuid);
> +        struct xc_sr_record record = {
> +            .type = REC_TYPE_X86_CPUID_POLICY,
> +            .data = policy->leaves,
> +            .length = policy->nr_leaves * sizeof(*policy->leaves),
> +        };
> +
> +        rc = write_record(ctx, &record);

Please keep this name being cpuid.  It's more helpful when grepping, and
it also shrinks the diff.

>          if ( rc )
>              goto out;
>      }
>  
> -    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
> -    if ( msrs.length )
> +    if ( policy->nr_msrs )
>      {
> -        rc = write_record(ctx, &msrs);
> +        struct xc_sr_record record = {
> +            .type = REC_TYPE_X86_MSR_POLICY,
> +            .data = policy->msrs,
> +            .length = policy->nr_msrs * sizeof(*policy->msrs),
> +        };
> +
> +        rc = write_record(ctx, &record);
>          if ( rc )
>              goto out;
>      }
> @@ -100,8 +86,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>      rc = 0;
>  
>   out:
> -    free(cpuid.data);
> -    free(msrs.data);
>      xc_cpu_policy_destroy(policy);
>  
>      return rc;
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 4c4593528dfe..488f43378406 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -156,12 +156,18 @@ static void dump_info(xc_interface *xch, bool detail)
>  
>      free(fs);
>  }
> -

Stray (deleted) whitespace.

> -static void print_policy(const char *name,
> -                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
> -                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
> +static void print_policy(xc_interface *xch, const char *name,
> +                         const xc_cpu_policy_t *policy)
>  {
>      unsigned int l;
> +    const xen_cpuid_leaf_t *leaves;
> +    const xen_msr_entry_t *msrs;
> +    uint32_t nr_leaves, nr_msrs;
> +
> +    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) )
> +        err(1, "xc_cpu_policy_get_leaves()");
> +    if ( xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
> +        err(1, "xc_cpu_policy_get_msrs()");

Not an issue with here per say, but to drive home the main problem.

This doesn't return the current leaves/msrs.  It gives you whatever's
stale in the staging buffer, which happens to be ok in xen-cpuid because
it only ever reads a policy...

~Andrew

