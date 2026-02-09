Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLccF7zziWnGEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:48:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4CC110FFF
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225517.1532040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSYf-00060M-Ed; Mon, 09 Feb 2026 14:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225517.1532040; Mon, 09 Feb 2026 14:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSYf-0005xI-Bg; Mon, 09 Feb 2026 14:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1225517;
 Mon, 09 Feb 2026 14:48:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSYd-0005vo-Mu
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:48:11 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59997e0f-05c6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:48:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4834826e555so4963265e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:48:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2ba61sm506797225e9.1.2026.02.09.06.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:48:08 -0800 (PST)
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
X-Inumbo-ID: 59997e0f-05c6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770648488; x=1771253288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v453STh1OLvxFiocJmEuLGSjWmbLxTLcAgwEQxOmP4I=;
        b=gLW5McMZXGCR3lc5eThrqMChvoNC/UJsmcMPer3UJas8tpw7S+N5niNr5jbErOU4Vs
         RwrIuSio7Fj0OHeV8820wax9p1/ggq7Yc5/o88Bzd1pt/lA0xxZCPVMyPgHiUjTmO/mC
         MOoPRozx1xI9jiSqpr+7T2YvLugjNMsNXIAEfUInzNleJllVe7EXLs42zurIgMfHGCZ2
         ZCs6DkLj90v1lLLKdvGlHaQ4+0wppRBUAqkNM7Afz/DGlVsb6Nu/wwjQ8kg4kvKEdePq
         XuNsy56PJYbrrNNvwYBlTvfhkKcjVZUkQV4X/3/aKxiMxvn/roOcKshbyupN3Ffdtw94
         Jb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648488; x=1771253288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v453STh1OLvxFiocJmEuLGSjWmbLxTLcAgwEQxOmP4I=;
        b=pbJyUxyNiPYSqs/N+xSBS5gDEbKNbIZcPM8AnSqEK3P7cCeAoVE6tkZKYKls4QZ18q
         ynif1WJ7nQIa8wAx+8Wmz9NBiqeLG/WrISM4indaoHOE2mIOwOSvvDP7FkK8VT+K3Lk/
         5QIjUFaoY5c+iskLL6ZnuvVJJNW/zM4jwxD2e484vo0l4tYXG2bfFLwfgXE7PAOSoby3
         JumtSfPpeVVjGz40k0BQBmPMJ7dnFsA6xiUqHAHnFNzLW0UGOjQu5rRQxup9Ef3mY8xk
         40Z8FA7224p+0ueHf6/1/ewrMfNjc24IgZKNBZUuTSmCXJG+cg66bELjOJ1pki5sf+w6
         2ikg==
X-Forwarded-Encrypted: i=1; AJvYcCW3TuTQdgBnS/zIe+6S7vlywv6xPd2RRoiw8BfhciJNCyKVc6En4dHWgysFIMk5O8kloPM84ZAu/uQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJw3pKT/HN5vwXRXHtc4mdcgsN5b0WzMfqQ3qHLwP4wJjgXtlY
	mSI86Tkima7UPQodKvWc7PirzMHnrQl/Dye1GWXg/0fbwyt2tS5ADj+CPRkGGqgdDw==
X-Gm-Gg: AZuq6aJFHDbk7xNY75bB9hpG0hJXGviOsrRS5Su/oE94dPwHo5WPKG2hxH4EZoUHhEf
	I/knqVLYhoAJwQvc8frWKU8HzVftemoKdoxubyiwG92VxWboGl/qyJJpssdDwBfAGBg13O8lEEv
	wG8plhELTlV7lEI6f9DW3BLeEzVnk+LEbp7oJh0caEWCYs6bfkVScO1Z+aJlARVET9/g6S9dlTK
	5AvGbrgq9g4x595sqxlxkSAQ3/E8xNQX7YVWRh+FnWDCzzWTIKftiBHDOFq4QcmjJPHd6n6cPXR
	ICqVOgnzcwbDhW5wvAO2IIUmoJ75iPHp+ZI3CYMibQtl80tChuJwbuR8eEaCmoIJVZEj134McFk
	YTj9gN8gcWi+7FJ8dixvLKQxXix3+9HPrsLYL2q8aVY0u0Mv5acfrIa5wX2hjNAXmZx9UOy9bAx
	DFyZhd5zytACFFIRg9KOXIhMV+iEUqKCquuNvg7DsATiNxf3WD+sbX2pYrmUUHrBzIb3rN5i3Zo
	w5K4cZUOGW5Jg==
X-Received: by 2002:a05:600c:468b:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-48320229220mr169266295e9.31.1770648488437;
        Mon, 09 Feb 2026 06:48:08 -0800 (PST)
Message-ID: <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
Date: Mon, 9 Feb 2026 15:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE4CC110FFF
X-Rspamd-Action: no action

On 09.02.2026 11:31, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -146,6 +146,7 @@ config XEN_IBT
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
>  	default !PV_SHIM_EXCLUSIVE
> +	select LOG_DIRTY
>  	depends on PV || HVM
>  	help

Why would this be? IOW why would shadow imply log-dirty, but HAP wouldn't?

> @@ -166,6 +167,14 @@ config SHADOW_PAGING
>  config PAGING
>  	def_bool HVM || SHADOW_PAGING
>  
> +config LOG_DIRTY

PAGING_LOG_DIRTY?

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -220,15 +220,15 @@ long arch_do_domctl(
>      {
>  
>      case XEN_DOMCTL_shadow_op:
> -#ifdef CONFIG_PAGING
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
> +            break;
> +
>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>          if ( ret == -ERESTART )
>              return hypercall_create_continuation(
>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
>          copyback = true;
> -#else
> -        ret = -EOPNOTSUPP;
> -#endif
>          break;

Can a HVM-only hypervisor create any guests with this? I simply fail to
see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it through to
hap_domctl().

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -226,7 +226,9 @@ struct paging_domain {
>      unsigned int            p2m_pages;    /* number of pages allocated to p2m */
>  
>      /* log dirty support */
> +#ifdef CONFIG_LOG_DIRTY
>      struct log_dirty_domain log_dirty;
> +#endif /* CONFIG_LOG_DIRTY */

Such an #ifdef can likely replace the comment? Or else the comment would
better also live inside the #ifdef?

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,12 +55,9 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  /* Enable log dirty mode */
> -#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
> -#else
> -#define PG_log_dirty   0
> -#endif
> +#define PG_log_dirty   IS_ENABLED(CONFIG_LOG_DIRTY) * \
> +                       (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)

Need wrapping in parentheses then.

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -50,7 +50,7 @@ struct hap_dirty_vram {
>   * calling p2m_log_dirty_range(), which interrogates each vram
>   * page's p2m type looking for pages that have been made writable.
>   */
> -
> +#ifdef CONFIG_LOG_DIRTY

This wants to move further up.

> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -194,7 +194,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  #ifdef CONFIG_SYSCTL
>  sysctl(xen_sysctl_t *u_sysctl)
>  #endif
> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +#if defined(CONFIG_LOG_DIRTY)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> @@ -292,7 +292,7 @@ dm_op                              compat   do       compat   do       do
>  hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +#if defined(CONFIG_LOG_DIRTY)
>  paging_domctl_cont                 do       do       do       do       -
>  #endif

The CONFIG_X86 part of the checking wants to remain: Another port may also gain
a setting of this name, without necessarily having this auxiliary hypercall.

Jan

