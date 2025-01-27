Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACDA1D63B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877864.1288017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOb6-0005rV-Tl; Mon, 27 Jan 2025 12:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877864.1288017; Mon, 27 Jan 2025 12:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOb6-0005p7-QR; Mon, 27 Jan 2025 12:52:12 +0000
Received: by outflank-mailman (input) for mailman id 877864;
 Mon, 27 Jan 2025 12:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcOb5-0005oj-5p
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:52:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85574f1f-dcad-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 13:52:09 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so703869166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:52:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6914e56a2sm353398366b.94.2025.01.27.04.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:52:08 -0800 (PST)
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
X-Inumbo-ID: 85574f1f-dcad-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737982329; x=1738587129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XkCpdyV8NVkI5a1J2Q3wsVE9S43lR8cz8V/RXeohAQw=;
        b=KTZA2YqIKV+Tg5VwN61/+dR94CY3GVu732aeQADm16fk2MltKXhHy+fEWooGJfFjDY
         zbcoxzhuTBbvObhDqg2NxxSCAEY47L14uXyzDwJYoEIC+SalhwQY8EdQehYgHPnTvBbT
         2qw8qzurcOCP3YgXw5Lc4gbhej/H90+QEVtU7JvgDtRYgWMVXshUCEsZwC4rSYalqYuT
         A+3imbeCf+hFipZbHJBmI42XO2zMMc0cOQxBMn52v+yKEuZgYyhqGJVsZ6vCI3HbUyHR
         cNPkoYbQr7bvc+m4AVvMiVVXv8h9SGRrq+obwqfW2/2VFvONIbrNtnVmlJUUf72oDSyE
         qmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982329; x=1738587129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkCpdyV8NVkI5a1J2Q3wsVE9S43lR8cz8V/RXeohAQw=;
        b=E+nnJuW2IO+r4ZC4kK9sBbmkqqzu+8/voMKfc9GtsrGmSwua44tOTugCx++EZ0yUnk
         mbsChdX1k+zb7g/SIkSRWYc6Sn4Whsx7OKVdrJa+ueQKbjSlWJ/EYOSL7Im9LAYwTqBA
         O+ICtQGdjksweXLm1jmsxpAQPjn5AG5pgBQ0Y/oT9xhCo68llDZx2boUchal5lKakpZX
         EnPyov1mKqesQ1ZI1WRLMLb9tUXzAl8yOd7xCmd4dpj87yqe+g+2z8vGhvFvRikkMlmt
         U6AYATs+gpKwbpuMMAUcpDufhXTlWPnkoIMxmtQ5ORrvnOpDivteV2uHzTPM4HF1zmEg
         JMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUNH5z5TXYy5NB6u1Iae+MThLpodIBU88sfn0VZ59DyfXaqi5b/hozG4j2WgPW7XxynvF2nCKgJ5aM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCXnXRWdb7pYEzJoia8FMkdqAUJN0cenHJXi1VT+4kCssBLwCN
	S8BaYOsPDUjSDFoI86AKh8DaCBjLTnvZCNutpyH/vwu8qjsValBtu1smzMqYJA==
X-Gm-Gg: ASbGncs007rLL/5iELvehBpm+2CPYlLHJxPvfPinP6j9yHrTwy3w0lO6iGBwVMaKiXo
	CljNkKADg2uQRqAhxORR5jdLXlhk/8Be73yB0aEWIuY2KHsXRWjVSbI5m7WkYxHQYorVyHeC4lh
	W5tiIsJ+dGEJlB+L5lYhpqJYOAIVO+rRr2srs/oqTKnLDvINv58/osOLLorzyLu3PlMfjA5TPNu
	Ik4B9wsVUE+WVW1LaECGNMI2IohEOfIRrjQQj745g+yY58tfvuTqcUgKZYAQM45ZA0AL3tJEbIy
	PZLYmtfsoc0ZvbJZRLz3jq7kZpqq4a9V3HPghxrDdH9blynTvMJj7fwYBEXmzvSdAg==
X-Google-Smtp-Source: AGHT+IGQJbPCqTpRCuBhPuDdpu3G9o3PvkpXd6egHoRZJeP74h8BeEHGQx3eQa+XnL5Hl/eXLXlmvQ==
X-Received: by 2002:a17:907:706:b0:aa6:5201:7ae3 with SMTP id a640c23a62f3a-ab38b3b23e1mr4327358266b.40.1737982328994;
        Mon, 27 Jan 2025 04:52:08 -0800 (PST)
Message-ID: <a159353b-cd3c-418b-9102-f00ed2098d64@suse.com>
Date: Mon, 27 Jan 2025 13:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gnttab: make grant table v2 support configurable
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
Cc: openxt@googlegroups.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
 <20250110133711.3958202-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20250110133711.3958202-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:37, Daniel P. Smith wrote:
> If the v2 interface support is not required, disabling this option will remove
> substantial amounts of unused code in a critical subsystem.
> 
> Disables the v2-only GNTTABOP_get_status_frames grant table op.

Why's this explicitly mentioned, but not e.g. GNTTABOP_{get,set}_version,
which ought to disappear altogether as well is you mean to truly limit
functionality to a pre-v2 hypervisor? Even a post-v2 addition like
GNTTABOP_swap_grant_ref might arguably need disabling then.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1278,8 +1278,8 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
>  
>  Control various aspects of the grant table behaviour available to guests.
>  
> -* `max-ver` Select the maximum grant table version to offer to guests.  Valid
> -version are 1 and 2.
> +* `max-ver` Select the maximum grant table version to offer to guests. Only
> +available when CONFIG_GRANT_TABLE_V2 is set. Valid version are 1 and 2.

No, the option ought to still be legitimate to use with value 1.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -23,6 +23,24 @@ config GRANT_TABLE
>  
>  	  If unsure, say Y.
>  
> +config GRANT_TABLE_V2
> +	bool "Grant table version 2 support" if EXPERT

While often I'm a proponent of using EXPERT, here I'm uncertain it
really takes an expert to turn this off. Or wait, it's "to turn
this on", as you have no default at all (see also below). This
means a non-expert has no way to configure a hypervisor compatible
with the previous version; that's a no-go imo.

> +	depends on GRANT_TABLE && X86
> +	help
> +	  Grant table interface version 2 is not the default. It has never
> +	  been implemented for ARM.
> +
> +	  The version 2 interface enables support for systems with large amounts
> +	  of memory and some exotic grant primitives that are not in use by the
> +	  supported PV drivers.
> +
> +	  Disabling this option reduces the amount of complex security-critical
> +	  hypervisor code in a subsystem of Xen responsible for approximately
> +	  5% of Xen Security Advisories.
> +
> +	  If you do not require large memory support, say N.
> +	  If you are paranoid, say N. If unsure, say Y.

Should this therefore perhaps have "default BIGMEM"?

> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -296,6 +296,9 @@ int compat_grant_table_op(
>              break;
>  
>          case GNTTABOP_get_status_frames:
> +#ifndef CONFIG_GRANT_TABLE_V2
> +            rc = -ENOSYS;

I understand ENOSYS is abused elsewhere like this, but can we please not
widen the issue and use EOPNOTSUPP instead?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -59,11 +59,13 @@ struct grant_table {
>      /* Lock protecting the maptrack limit */
>      spinlock_t            maptrack_lock;
>      unsigned int          max_version;
> +#ifdef CONFIG_GRANT_TABLE_V2
>      /*
>       * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
>       * values are invalid.
>       */
>      unsigned int          gt_version;
> +#endif
>      /* Resource limits of the domain. */
>      unsigned int          max_grant_frames;
>      unsigned int          max_maptrack_frames;

Between this and the following hunk there's also nr_status_frames, which
is v2-only too.

> @@ -178,11 +182,20 @@ static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
>                                opt_max_maptrack_frames_val);
>  }
>  
> +#ifdef CONFIG_GRANT_TABLE_V2
> +
>  #ifndef GNTTAB_MAX_VERSION
>  #define GNTTAB_MAX_VERSION 2
>  #endif
>  #define get_gt_version(gt) ((gt)->gt_version)
>  
> +#else
> +
> +#define GNTTAB_MAX_VERSION 1
> +#define get_gt_version(gt) 1

What about mem_sharing_gref_to_gfn(), which checks for the version not
having been set yet? gnttab_get_shared_frame_mfn() also has an assertion
to this effect.

> @@ -204,12 +217,17 @@ static int __init cf_check parse_gnttab(const char *s)
>          if ( !strncmp(s, "max-ver:", 8) ||
>               !strncmp(s, "max_ver:", 8) ) /* Alias for original XSA-226 patch */
>          {
> +#ifdef CONFIG_GRANT_TABLE_V2
> +            const char *e;
>              long ver = simple_strtol(s + 8, &e, 10);
>  
>              if ( e == ss && ver >= 1 && ver <= 2 )
>                  opt_gnttab_max_version = ver;
>              else
>                  rc = -EINVAL;
> +#else
> +            no_config_param("GRANT_TABLE_V2", "max_ver", s, ss);
> +#endif

See respective comment on the cmdline doc.

> @@ -330,6 +350,14 @@ nr_maptrack_frames(struct grant_table *t)
>  #define status_entry(t, e) \
>      ((t)->status[(e)/STGNT_PER_PAGE][(e)%STGNT_PER_PAGE])
>  
> +#else /* CONFIG_GRANT_TABLE_V2 */
> +
> +#define shared_entry_full_frame(gt, ref) ( shared_entry_v1((gt), (ref)).frame )
> +#define set_shared_entry(gt, ref, val) \
> +    ( shared_entry_v1((gt), (ref)).frame = (val) )
> +#define status_addr(gt, ref, flags_addr) (flags_addr)
> +
> +#endif /* CONFIG_GRANT_TABLE_V2 */

See style related comments on patch 1.

> @@ -734,7 +764,7 @@ static unsigned int nr_grant_entries(struct grant_table *gt)
>          /* Make sure we return a value independently of speculative execution */
>          block_speculation();
>          return f2e(nr_grant_frames(gt), 1);
> -
> +#ifdef CONFIG_GRANT_TABLE_V2
>      case 2:
>          BUILD_BUG_ON(f2e(INITIAL_NR_GRANT_FRAMES, 2) <
>                       GNTTAB_NR_RESERVED_ENTRIES);

Please don't remove blank lines like this.

> @@ -1796,6 +1828,12 @@ static int
>  gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
>                                unsigned int req_nr_frames)
>  {
> +#ifndef CONFIG_GRANT_TABLE_V2
> +    ASSERT_UNREACHABLE();
> +
> +    return 0;

For a release build you want to return an error here.

> +}

Hmm, the opening figure brace above then has two closing counterparts.
People may find this confusing, and since Misra is almost all about
confusion, I wonder whether they actually permit such (albeit I don't
recall any rule on this matter).

> +#else
>      unsigned int i;
>      unsigned int req_status_frames;
>  
> @@ -1898,6 +1936,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>  
>      return 0;
>  }
> +#endif

In fact, to add to the confusion the #else part then even extends across
function boundaries, if the hunk header are to be trusted.

> @@ -2518,12 +2559,14 @@ release_grant_for_copy(
>          td = rd;
>          trans_gref = gref;
>      }
> +#ifdef CONFIG_GRANT_TABLE_V2
>      else
>      {
>          td = (act->src_domid == rd->domain_id)
>               ? rd : knownalive_domain_from_domid(act->src_domid);
>          trans_gref = act->trans_gref;
>      }
> +#endif

Why's this needed? Can't leave it to the compiler's DCE?

> @@ -2748,7 +2792,9 @@ acquire_grant_for_copy(
>              act->is_sub_page = true;
>          }
>      }
> -    else if ( !old_pin ||
> +    else
> +#endif
> +    if ( !old_pin ||
>                (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
>      {

Hmm, this #if extending across multiple not really related constructs
looks to be the reason why patch 1 moves the assignment to old_pin.

Below from here is an assignment to act->trans_gref. That's another
field that probably better wouldn't exits in a v1-only build. Much
like is_sub_page and perhaps others.

> @@ -3165,6 +3211,17 @@ static long
>  gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
>  {
>      gnttab_set_version_t op;
> +#ifndef CONFIG_GRANT_TABLE_V2
> +
> +    if ( copy_from_guest(&op, uop, 1) )
> +        return -EFAULT;
> +
> +    if ( op.version == 1 )
> +        return 0;
> +
> +    /* Behave as before set_version was introduced. */
> +    return -ENOSYS;

Imo in a case like this one if ( !IS_ENABLED() ) would be preferable
to use, to keep as much code as possible exposed to the compiler,
thus reducing the chance of someone not noticing that it also needs
changing for whatever (perhaps) purely mechanical adjustment. I.e.
use #ifdef / #ifndef only in cases where lexical elements would be
missing, thus breaking the build.

> @@ -4080,6 +4146,9 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
>  static int gnttab_get_status_frame_mfn(struct domain *d,
>                                         unsigned int idx, mfn_t *mfn)
>  {
> +#ifndef CONFIG_GRANT_TABLE_V2
> +    ASSERT_UNREACHABLE();
> +#else
>      const struct grant_table *gt = d->grant_table;
>  
>      ASSERT(gt->gt_version == 2);
> @@ -4113,6 +4182,7 @@ static int gnttab_get_status_frame_mfn(struct domain *d,
>      /* Make sure idx is bounded wrt nr_status_frames */
>      *mfn = _mfn(virt_to_mfn(
>                  gt->status[array_index_nospec(idx, nr_status_frames(gt))]));
> +#endif
>      return 0;
>  }

As in the earlier case - the function ought to return an error in a
release build.

Jan

