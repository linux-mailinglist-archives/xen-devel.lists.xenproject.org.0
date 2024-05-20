Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD398C9E5E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 15:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726139.1130398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s93Mi-0003ak-Ea; Mon, 20 May 2024 13:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726139.1130398; Mon, 20 May 2024 13:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s93Mi-0003Xr-BB; Mon, 20 May 2024 13:47:48 +0000
Received: by outflank-mailman (input) for mailman id 726139;
 Mon, 20 May 2024 13:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s93Mh-0003Xl-3u
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 13:47:47 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 892bd2ad-16af-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 15:47:45 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6f054c567e2so2072135a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 06:47:45 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1d7040sm111823476d6.107.2024.05.20.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 06:47:43 -0700 (PDT)
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
X-Inumbo-ID: 892bd2ad-16af-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716212864; x=1716817664; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbOtBl8kjp1FlMIjczDv0NWOu6HXg6n8obSgX1DIgCQ=;
        b=XJPO5DtgjFGZkXs3CAsvv/fpx7LEkamzjqVQ8SG9Qgsx3aHRx2iJ744mqAMt9pZbWq
         19O0fqeJma078bOyfQnN4isDNy26DD6xyglcYAMsb4j/fW0+8ZqIq2Y5AJ+yC7I0+AWN
         EiBV3ATzPFn3NRt6QYYHzJNyk8MzgFw9Y/IRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212864; x=1716817664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbOtBl8kjp1FlMIjczDv0NWOu6HXg6n8obSgX1DIgCQ=;
        b=twLzEiWAPQ6d7D5HURosgE+fYbROjoWEONrW9tTrwy+nnJtDmBy+vr8lApnCUPmWB4
         Mky15aZwyhJgAYe3HnjlKIOFt3atSsO4WEapgofXQhGNQAYtmrWYW6JP/8OeHZqRpQmN
         I/Rx78WT64IqyXFuH47TMYu10yp1Qa96inRv6NyQGnphXF/A0rBYnjyB18PDxh0xZ70V
         aN+83vln0iafTq+lxye4StFG67e/UwpNsIG62D/4hvk4qpu/gop/b69KA8FSuLiYN9SH
         g4qnYiK6CJvIl+nC2vyWpW7scw/WOrErph6WDkIEy97+oYre14v8Z92uzZDztNmONSQ6
         UnHw==
X-Gm-Message-State: AOJu0YwYGZCQLZ0mQh3ra3IkmQIwe5mxNl9/7fKXiRMeQkcgr6Exv55u
	H0akLNhIBicHfZA7tpcCIxciaB5W7wflz6J1U0iZxDWR7D9ec3v3wy5Z5nJEtcn32GlD2srNXqA
	x
X-Google-Smtp-Source: AGHT+IGgmnJtSPXrZR+Yd7Xuagma0e7UBjML7B7DHQRqNtNBzfWMyG3td+P5ohyP1mgB0VYdJfeDdQ==
X-Received: by 2002:a05:6830:1e57:b0:6f1:2ca5:4d08 with SMTP id 46e09a7af769-6f12ca55035mr12907677a34.24.1716212864195;
        Mon, 20 May 2024 06:47:44 -0700 (PDT)
Date: Mon, 20 May 2024 15:47:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
Message-ID: <ZktUfWZD67zkvaeJ@macbook>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
 <c6c89012d189a2c3077b3e224942b33028e29336.1715954111.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6c89012d189a2c3077b3e224942b33028e29336.1715954111.git.alejandro.vallejo@cloud.com>

On Fri, May 17, 2024 at 05:08:34PM +0100, Alejandro Vallejo wrote:
> The idea is to use xc_cpu_policy_t as a single object containing both the
> serialised and deserialised forms of the policy. Note that we need lengths
> for the arrays, as the serialised policies may be shorter than the array
> capacities.
> 
> * Add the serialised lengths to the struct so we can distinguish
>   between length and capacity of the serialisation buffers.
> * Remove explicit buffer+lengths in serialise/deserialise calls
>   and use the internal buffer inside xc_cpu_policy_t instead.
> * Refactor everything to use the new serialisation functions.
> * Remove redundant serialization calls and avoid allocating dynamic
>   memory aside from the policy objects in xen-cpuid. Also minor cleanup
>   in the policy print call sites.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * Removed v1/patch1.
>   * Added the accessors suggested in feedback.
> ---
>  tools/include/xenguest.h            |  8 ++-
>  tools/libs/guest/xg_cpuid_x86.c     | 98 ++++++++++++++++++++---------
>  tools/libs/guest/xg_private.h       |  2 +
>  tools/libs/guest/xg_sr_common_x86.c | 54 ++++++----------
>  tools/misc/xen-cpuid.c              | 43 ++++---------
>  5 files changed, 104 insertions(+), 101 deletions(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b772a..563811cd8dde 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -799,14 +799,16 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
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
> +int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
> +int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                           const xen_msr_entry_t **msrs, uint32_t *nr);
>  
>  /* Compatibility calculations. */
>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4453178100ad..4f4b86b59470 100644
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

I would be tempted to just pass the policy to
xc_set_domain_cpu_policy() and get rid of the separate cpuid and msrs
serialized arrays, but that hides (or makes it less obvious) that the
policy needs to be serialized before providing to
xc_set_domain_cpu_policy().  Just a rant, no need to change it here.

>                                    &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
> @@ -942,34 +944,32 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>      return rc;
>  }
>  
> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
>  {
> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves);
> +    unsigned int nr_msrs = ARRAY_SIZE(p->msrs);
>      int rc;
>  
> -    if ( leaves )
> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
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
> +    p->nr_leaves = nr_leaves;
> +
> +    rc = x86_msr_copy_to_buffer(&p->policy, p->msrs, &nr_msrs);
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
> +    p->nr_msrs = nr_msrs;
> +
>      errno = 0;
>      return 0;
>  }
> @@ -1012,6 +1012,42 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
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

My preference would probably be to return NULL or
xen_{leaf,msr}_entry_t * from those, as we can then avoid an extra
leaves/msrs parameter.  Again I'm fine with leaving it like this.

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
>  };
>  #endif /* x86 */
>  
> diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
> index 563b4f016877..832047756e58 100644
> --- a/tools/libs/guest/xg_sr_common_x86.c
> +++ b/tools/libs/guest/xg_sr_common_x86.c
> @@ -1,4 +1,5 @@
>  #include "xg_sr_common_x86.h"
> +#include "xg_sr_stream_format.h"
>  
>  int write_x86_tsc_info(struct xc_sr_context *ctx)
>  {
> @@ -45,54 +46,37 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
>  int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>  {
>      xc_interface *xch = ctx->xch;
> -    struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
> -    struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
> -    uint32_t nr_leaves = 0, nr_msrs = 0;
> -    xc_cpu_policy_t *policy = NULL;
> +    struct xc_sr_record record;
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
>  
> -    cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
> -    if ( cpuid.length )
> +    record = (struct xc_sr_record) {
> +        .type = REC_TYPE_X86_CPUID_POLICY,
> +        .data = policy->leaves,
> +        .length = policy->nr_leaves * sizeof(*policy->leaves),
> +    };
> +    if ( record.length )
>      {
> -        rc = write_record(ctx, &cpuid);
> +        rc = write_record(ctx, &record);
>          if ( rc )
>              goto out;
>      }


You could maybe write this as:

if ( policy->nr_leaves )
{
    const struct xc_sr_record r = {
        .type = REC_TYPE_X86_CPUID_POLICY,
        .data = policy->leaves,
        .length = policy->nr_leaves * sizeof(*policy->leaves),
    };

    rc = write_record(ctx, &record);
}

(same for the msr record)

>  
> -    msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
> -    if ( msrs.length )
> +    record = (struct xc_sr_record) {
> +        .type = REC_TYPE_X86_MSR_POLICY,
> +        .data = policy->msrs,
> +        .length = policy->nr_msrs * sizeof(*policy->msrs),
> +    };
> +    if ( record.length )
>      {
> -        rc = write_record(ctx, &msrs);
> +        rc = write_record(ctx, &record);
>          if ( rc )
>              goto out;
>      }
> @@ -100,8 +84,6 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
>      rc = 0;
>  
>   out:
> -    free(cpuid.data);
> -    free(msrs.data);
>      xc_cpu_policy_destroy(policy);
>  
>      return rc;
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 8893547bebce..1c9ba6d32060 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -409,17 +409,21 @@ static void dump_info(xc_interface *xch, bool detail)
>      free(fs);
>  }
>  
> -static void print_policy(const char *name,
> -                         xen_cpuid_leaf_t *leaves, uint32_t nr_leaves,
> -                         xen_msr_entry_t *msrs, uint32_t nr_msrs)
> +static void print_policy(xc_interface *xch, const char *name, const xc_cpu_policy_t *policy)

Line length.

>  {
> -    unsigned int l;
> +    const xen_cpuid_leaf_t *leaves;
> +    const xen_msr_entry_t *msrs;
> +    uint32_t nr_leaves, nr_msrs;
> +
> +    if ( xc_cpu_policy_get_leaves(xch, policy, &leaves, &nr_leaves) ||
> +         xc_cpu_policy_get_msrs(xch, policy, &msrs, &nr_msrs) )
> +        err(1, "print_policy()");

Shouldn't the error message be "xc_cpu_policy_get_{leaves,msrs}()"
instead, as one of those is the cause of the error?

Other err() usages do print the function triggering the error, not the
function context name.

>  
>      printf("%s policy: %u leaves, %u MSRs\n", name, nr_leaves, nr_msrs);
>      printf(" CPUID:\n");
>      printf("  %-8s %-8s -> %-8s %-8s %-8s %-8s\n",
>             "leaf", "subleaf", "eax", "ebx", "ecx", "edx");
> -    for ( l = 0; l < nr_leaves; ++l )
> +    for ( uint32_t l = 0; l < nr_leaves; ++l )
>      {
>          /* Skip empty leaves. */
>          if ( !leaves[l].a && !leaves[l].b && !leaves[l].c && !leaves[l].d )
> @@ -432,7 +436,7 @@ static void print_policy(const char *name,
>  
>      printf(" MSRs:\n");
>      printf("  %-8s -> %-16s\n", "index", "value");
> -    for ( l = 0; l < nr_msrs; ++l )
> +    for ( uint32_t l = 0; l < nr_msrs; ++l )

I would be tempted to leave `l` as-is, seeing as there's no real need
to modify it in the patch context, and the patch is already fairly
long.

Thanks, Roger.

