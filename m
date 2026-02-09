Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M3XKgPxiWnGEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:36:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195E11085B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225486.1531999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSMx-0002CC-Im; Mon, 09 Feb 2026 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225486.1531999; Mon, 09 Feb 2026 14:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSMx-0002AJ-F2; Mon, 09 Feb 2026 14:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1225486;
 Mon, 09 Feb 2026 14:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSMw-0002AD-FP
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:36:06 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e8a6a5-05c4-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:36:05 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso13880295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:36:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206b8ebbsm376976065e9.1.2026.02.09.06.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:36:03 -0800 (PST)
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
X-Inumbo-ID: a9e8a6a5-05c4-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770647764; x=1771252564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GjE24oHJ7+3c5LwLALaEgJB0mosYzNvS+FXm5WKJaYM=;
        b=I3o7m5nrhLWy5x7ZaQSNQL1GKHPWfTdzXK1gBcL8hsmIpJq0PSBUUUdng27+jTABjg
         EK+jTRq6cPPlxwy3iVvkW91H3A/8wI4bU7t0LObBW3KtWb2eBz5TF3KHEAAj9J2zWzRE
         nK31nDhnJB7k/1xhNfJY7DSwP5XXz2GJc/DTNndgWeNGeaW5JvQsKqQ1ix9EyiEKi8za
         s0+4qOXe2VDjfImh7QDzGRNBTZ26WWUnE4KY2VkiYnAcfwmRqAA6VZXTvfE+D2zr5WJv
         yV+8MqkBvHXIiuSfI8bG+InKCT2dfXjiYGmzI/+MaWjP1qv+S91b0jAkFjW4TtXpoVdC
         BIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647764; x=1771252564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjE24oHJ7+3c5LwLALaEgJB0mosYzNvS+FXm5WKJaYM=;
        b=r3agk674gyzgvA3PggMG1JQIMbFnRSvLYz+Zza8pQyiTWBg+/QwCAIFHObGu4Rj9Yx
         1DBwSUoaHNcgQk78BWDLSZceBBfJOTwJ509L4nqnw92pKmLBVlYlAwDX1hwzGDPQFtze
         tVLqG83RCMOL5BcJF4MDorM/2Aj/LwDwzsgVhQ3Zgl9HQuS7QH5zVNNfRUwtaexCCrc1
         UbIgxzF+aPFnai9YXrGEMamKVEPemgM7QaKAB/Dq8JmcmpXly4kLnWx4eyeSrmbOgp/u
         hyxRdr+gjxzxnVlRS22ImVTAnNwjom6xq4G2piZF0EnzhpGlVMGATz+O47PVVq/P8WrC
         0Vtg==
X-Forwarded-Encrypted: i=1; AJvYcCX5TBO4PdK62RPfyqjpB+bhLFA5iFQL5Ye+c4jBP+9dX3jxW9UkfuFidkrV9T6AKzC/OmNfX4Zbxvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwikYxUxd8Ef8FUEdFjxN2oGfY8EenQNopJZ3ukVt5qGuubuaNu
	/82MTuoOfTx9Ub4Xzq6NU6MezRZBepMZ+Pqs0FUSwEpnFkWAnfJ++k5pIXFJdXp8KA==
X-Gm-Gg: AZuq6aLIJYlwKRblYDKqy+mJSV3z+0slTVkMAaWft4E4gll20zPvlX3iLwuXK5ac46h
	MyNNjAhW/8RBY6wciTECJCgAuUfJn3LHOINyiHCJQAS7al3OXIUkUYsdxSlG2VPo3adDShjMvXg
	zJEtED3SQN12D86X6zNFnoGde7Quaoy6EbKBMMLW/++MNze8nKmhzl/GjJdKPM8MUoLe1x6sDIW
	17/RC0excVb/hqjQV/CopvEkjrvj+/QKYrnjC5edp9vbAe65+hOdTIehL0Cfc7z3KBffp6RSw1H
	iV/15zVFfS9VRLn/hAABw1o57O6Uha4+c4OpO3xHrZdVWbnY/YyjAMyEIq6t2EHUAJLiDbBE7Z5
	uKpw8eAeTVwbkGLRrnBSgmknV6cJvHQyajUooh8xsEpuE2p3CRLiv+xTGas5DF4/dphbI847C+/
	39XhVDDD+LzZATKRMtUoM+reinspze5NQJjXCGY7jK4nzopOs6giDflFm7GRqD/3PgLjaXiUxy8
	ZoZteUnoHrRhA==
X-Received: by 2002:a05:600c:5253:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483201ee7f4mr163094455e9.15.1770647764172;
        Mon, 09 Feb 2026 06:36:04 -0800 (PST)
Message-ID: <fcbdc4bf-249a-4495-b0fb-434c0e793484@suse.com>
Date: Mon, 9 Feb 2026 15:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 1195E11085B
X-Rspamd-Action: no action

On 09.02.2026 11:41, Alejandro Vallejo wrote:
> It only has 2 callers, both of which can be conditionally removed.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> I'd be ok conditionalising the else branch on...
> 
>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
> 
> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
> 
> ... to avoid the danger of stale pointers, with required changes elsewhere so
> none.c is only compiled out in that case.

I'm not sure I understand this remark. Is this about something in the other
patch (which I haven't looked at yet), or ...

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>       */
>      if ( hap_enabled(d) )
>          hap_domain_init(d);
> -    else
> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          rc = shadow_domain_init(d);
>  
>      return rc;
> @@ -645,7 +645,7 @@ void paging_vcpu_init(struct vcpu *v)
>  {
>      if ( hap_enabled(v->domain) )
>          hap_vcpu_init(v);
> -    else
> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          shadow_vcpu_init(v);
>  }

... these two hunks? In this latter case, I don't think the bigger conditional
would be correct.

> --- a/xen/arch/x86/mm/shadow/none.c
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -#include <xen/mm.h>
> -#include <asm/shadow.h>
> -
> -static int cf_check _toggle_log_dirty(struct domain *d)
> -{
> -    ASSERT(is_pv_domain(d));
> -    return -EOPNOTSUPP;
> -}
> -
> -static void cf_check _clean_dirty_bitmap(struct domain *d)
> -{
> -    ASSERT(is_pv_domain(d));
> -}
> -
> -static void cf_check _update_paging_modes(struct vcpu *v)
> -{
> -    ASSERT_UNREACHABLE();
> -}
> -
> -int shadow_domain_init(struct domain *d)
> -{
> -    /* For HVM set up pointers for safety, then fail. */
> -    static const struct log_dirty_ops sh_none_ops = {
> -        .enable  = _toggle_log_dirty,
> -        .disable = _toggle_log_dirty,
> -        .clean   = _clean_dirty_bitmap,
> -    };
> -
> -    paging_log_dirty_init(d, &sh_none_ops);

How do you avoid d->arch.paging.log_dirty.ops remaining NULL with this
removed?

> -    d->arch.paging.update_paging_modes = _update_paging_modes;

Same question for this function pointer.

> -    return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
> -}
> -
> -static int cf_check _page_fault(
> -    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
> -{
> -    ASSERT_UNREACHABLE();
> -    return 0;
> -}
> -
> -static bool cf_check _invlpg(struct vcpu *v, unsigned long linear)
> -{
> -    ASSERT_UNREACHABLE();
> -    return true;
> -}
> -
> -#ifdef CONFIG_HVM
> -static unsigned long cf_check _gva_to_gfn(
> -    struct vcpu *v, struct p2m_domain *p2m, unsigned long va, uint32_t *pfec)
> -{
> -    ASSERT_UNREACHABLE();
> -    return gfn_x(INVALID_GFN);
> -}
> -#endif
> -
> -static pagetable_t cf_check _update_cr3(struct vcpu *v, bool noflush)
> -{
> -    ASSERT_UNREACHABLE();
> -    return pagetable_null();
> -}
> -
> -static const struct paging_mode sh_paging_none = {
> -    .page_fault                    = _page_fault,
> -    .invlpg                        = _invlpg,
> -#ifdef CONFIG_HVM
> -    .gva_to_gfn                    = _gva_to_gfn,
> -#endif
> -    .update_cr3                    = _update_cr3,
> -};
> -
> -void shadow_vcpu_init(struct vcpu *v)
> -{
> -    ASSERT(is_pv_vcpu(v));
> -    v->arch.paging.mode = &sh_paging_none;

And the same question yet again for this pointer.

Jan

