Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF2FJF8tjGl8iwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:18:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E85121D3E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226987.1533322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4Tt-0000Vj-S5; Wed, 11 Feb 2026 07:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226987.1533322; Wed, 11 Feb 2026 07:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4Tt-0000Th-OG; Wed, 11 Feb 2026 07:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1226987;
 Wed, 11 Feb 2026 07:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq4Ts-0000Tb-IX
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 07:17:48 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1351032-0719-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 08:17:42 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso14438845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 23:17:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc54csm2605958f8f.25.2026.02.10.23.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 23:17:41 -0800 (PST)
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
X-Inumbo-ID: c1351032-0719-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770794262; x=1771399062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvqal51klsUTBxjgyP6fqRaFPMmTg1kO9Zzg0fsxOzg=;
        b=bVglWuhmxdyhR0DZJi0fadmFKmuRJrpbv1WLHJvQQSbimI3eHQg7RSvPK8cfZ/dO+K
         mOnGcMdBl80dYJNrvJqWGcNKa/mNtOt/lQU9jgZEHrMsXHfeQ9NXTP/a4jl1OGorMnjk
         xYx/4voppiplLueAEKibVEWobrDI6EEJwvgFhKyiTmmVOafEjP9oK3/eEEHC9t6VOjhh
         5Ra7dYEMQ7SYR/sODkdChlVAWGrLc+3cjiQRdSHgspueo4XyHaC8A3ZAfs3T3RLRbHKA
         oJcAti05NZBeniLhr7jQny9pAoAriCzRjqb67q7GKghiEj4OTUZsyEqN/teLfrSejuRw
         5QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794262; x=1771399062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kvqal51klsUTBxjgyP6fqRaFPMmTg1kO9Zzg0fsxOzg=;
        b=uGbifAffDmi+y1pD7aJfOwPuwncFTyI92z4c2IYjDeYR/iJeddw8M62bbptQmUGmyC
         ia0eHMss6J0bUIzFzy805pU2DktAgbdnU4dS62ezNAOPjKwh1NFegvPSS1bSYLzdjSLW
         hHV/EyDQ0DVFg7NXQB/LSSb9fJUxavbVGLoDp9sxWSiBIJYL/ll26bKD0z4KIpMVeTUQ
         0jOEfUpWXgCZGONnWUY+cXG495ccLlf6TNAti/YwbR0tmVe3xAH93SiYpqXfBYuzFVQ7
         6zalRWgeS5BEFzIggRwiJLknrvfX6PKbjvgG00/I1X4BrSqda8NVE1ZjevtE2mCGPioD
         9I0w==
X-Forwarded-Encrypted: i=1; AJvYcCVvey1JMnoTxsaMhLhJt4BmopFZUIVS8hACxz9xh4sdosIAjEku71vRrKqYHfBUVJU0cbbvELoxAsE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfNkX7eeymNMsaym+f7TEg07Nnrni0z79TAnM1WjU3q3MJm++4
	v0eWJLP1Q0aYWT+x3K42oiLRC39muqO8hPMo4W4XoF5cOqjawfPJnDUmfWXkYHruFg==
X-Gm-Gg: AZuq6aJoUQExYuo4eJgtzbOvj5Kih5d5/gQ5KxPZKIH0Mf4XNVUSgZ3L/s7aGBaA11T
	v1OjK6y+A/sKeafKjs/Qim3JPWjGog4ntz0e6jVBFhkvjqdTj8otyNGlOrlsg3CmA7dwLEdj84f
	iOqQ+8QJnez51djwxqaHeCj6oHQegQhjpkAy0TnGGQV/y4v4i8aKv+6aKRv492xoojedvBEKk+R
	oNxDUaEQlQ9mAalIST3s36/JrlX/N09BFELgmSb1znmBMo5+kg2nNRxAwuLMtO3Y8aaoU5oxqSz
	2i7+y2vcNt/uv/Aqm4wVTPGM01LuuXeUCEyKHFrtF9o5p7X6w9mpmq0wRMhtxuE48CKaqTZIQTi
	okUnHfLgNO5DfmYklvCNf3hiAWXEM2UzHBI3szwqpP9WXbsL1ryTqw2BPNQrhh0/qC3cQE1L3O/
	r5GlCWCYrdQKgq3251i9VGLtan0tVI5favfkNI4kjdLKgR2t13+M/n+CLX1KMS4xLAG+T7ikiGo
	1AvJJ/2zKKdcT0=
X-Received: by 2002:a05:600d:6405:10b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48320216155mr181204695e9.23.1770794261646;
        Tue, 10 Feb 2026 23:17:41 -0800 (PST)
Message-ID: <b210e7c0-ae2b-4d41-8690-b5af4261de3c@suse.com>
Date: Wed, 11 Feb 2026 08:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domctl: Conditionalise x86 domctl using DCE rather
 than ifdef
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
References: <20260210173022.257030-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260210173022.257030-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81E85121D3E
X-Rspamd-Action: no action

On 10.02.2026 18:30, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/mem_sharing.h
> +++ b/xen/arch/x86/include/asm/mem_sharing.h
> @@ -9,10 +9,12 @@
>  #ifndef __MEM_SHARING_H__
>  #define __MEM_SHARING_H__
>  
> -#include <public/domctl.h>
> -#include <public/memory.h>
> +struct xen_domctl_mem_sharing_op;
>  
>  #ifdef CONFIG_MEM_SHARING
> +#include <xen/sched.h>
> +
> +struct xen_mem_sharing_op;
>  
>  #define mem_sharing_enabled(d) ((d)->arch.hvm.mem_sharing.enabled)
>  
> @@ -92,8 +94,6 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
>  int mem_sharing_notify_enomem(struct domain *d, unsigned long gfn,
>                                bool allow_sleep);
>  int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg);
> -int mem_sharing_domctl(struct domain *d,
> -                       struct xen_domctl_mem_sharing_op *mec);
>  
>  /*
>   * Scans the p2m and relinquishes any shared pages, destroying
> @@ -103,6 +103,7 @@ int mem_sharing_domctl(struct domain *d,
>  int relinquish_shared_pages(struct domain *d);
>  
>  #else
> +struct domctl;

DYM struct domain? If so (can adjust while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Cc-ing Tamas at least for awareness; I think ./MAINTAINERS should enumerate
this file in the X86 MEMORY SHARING section.

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -806,12 +806,10 @@ static inline void p2m_pt_init(struct p2m_domain *p2m) {}
>  void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
>                       p2m_query_t q, uint32_t *pfec);
>  
> -#if P2M_AUDIT
> -extern void audit_p2m(struct domain *d,
> -                      uint64_t *orphans,
> -                      uint64_t *m2p_bad,
> -                      uint64_t *p2m_bad);
> -#endif /* P2M_AUDIT */
> +void audit_p2m(struct domain *d,
> +               uint64_t *orphans,
> +               uint64_t *m2p_bad,
> +               uint64_t *p2m_bad);

If already you adjust this beyond dropping the #ifdef, I think we also want to
make use of line length, to better match e.g. the other prototype in patch
context above. I'm likely to take the liberty of doing so while committing.

Jan

