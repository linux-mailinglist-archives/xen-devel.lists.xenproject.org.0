Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FN/iCbCuOmq1DggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:05:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651B6B88CB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Txp1g8Xr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344396.1603470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3cE-0001QI-T1; Tue, 23 Jun 2026 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344396.1603470; Tue, 23 Jun 2026 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3cE-0001NX-PT; Tue, 23 Jun 2026 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1344396;
 Tue, 23 Jun 2026 16:04:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc3cC-0001NQ-QA
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc3cC-0088ae-6r
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 18:04:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3aae9b-e002-0a2a0a5209dd-0a2a4509e16a-4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:04:44 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3aae95-4999-0a2a45090019-d155802de977-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:04:38 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49241a577d8so242565e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 09:04:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240eef2basm408505085e9.2.2026.06.23.09.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 09:04:36 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782230677; x=1782835477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4mM4tKbVAWYBKip2H5BTmnV7j4iHZpqw1h+XXQs2/8o=;
        b=Txp1g8XrDptDvShz/VsHb679UqYHCl2OLxLmmTgr0qgP4vZkv/9lVgGTB3k9KqMkof
         cutPSw5eUpmJJT5+GOMSsA0yikVbdNfM+HgLyh8xTqBTJPRW6h+S21j/hB9ZEDO3dJGU
         WiZEzs5gskvq5oWyrIbASYRIIoC2r7mGvRTa4FH+eDpDBv9wGUe5Qc6QfdBFlG3AzJ9v
         zJAwTCqkg3CfqZY5uIsaBNkRb6B93LnjGrB7bn5C/+yRUSOcZallJ5rdsO5tKOjNyfgb
         mD4y4psa/e0dnRaeJ0panMKAek1qRlAjpIBY7uWSTjfnR3HaezWgGxh5U1IjC4joiv3P
         +wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230677; x=1782835477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mM4tKbVAWYBKip2H5BTmnV7j4iHZpqw1h+XXQs2/8o=;
        b=WeablyKea60HjrqykBunlFXak19pfQlG7Zfm8Njcohssg8SbT9ZZUIXs5WSlXnL4Ot
         ZNTTZCq88Kx51VqNqyMo6TUSy9lpUWCpc4fd5JmP8mbv4gH2PuJa/5NSYCX3Ton7YXpw
         J9Yf2+jCg0b6r2XZQPYdARjpmfmi/FTvFaHdBMdvR/ZbiRr1aX/qMr8RBnzENQdiTU5A
         Bx5Qs9SHG4dCriWcJBW3/rAkHRrGz4QRoinhwP4PbQ1Oh5NEGIEUePK/zwdxwmRsRE7I
         UfEZMfrB1ogLR9C5VhUfmKXO66aj1m7eU3WE4o2r3yZisbERbr+//rdpj/JK3xuXPb9X
         USOg==
X-Forwarded-Encrypted: i=1; AFNElJ9XD8jeUKD7dWaQiOBfhkMKhH+FDgOEHaPSCe+zODb9l7WoItMc6vdTsRsCpmOUlWFRzAIk5+V0MDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4iUK8qmIoQTvCTQEmRjCjFBur08DkRV8gTPX+lokbYca95Gu4
	p9RUfeCgptrFb75R4j43Uib5uf17i319Bi/DnRy4L2RbzzFTzCwsoqWPMvOn6Wq+XA==
X-Gm-Gg: AfdE7clZudGjxdURpO2e1R2gSTOOJtSSeh7etDXr9bzfhIq3IkmOS/+ALOrourLt6bo
	7Oy/H0+ZGEaeK4N3r+qTpadJoJNGs/1LwELvq9jpJgOuCOm8niwheYMiiTWZg1c+gir6XeEJ/Dv
	jn6w70KzNK1ZXrUW5ydt6ky0T7nUhJl9tKmpRKgORl4sQYs6TMaOeeZ30Tcq6lcMcERJ7TV6FhB
	9EkEHeSVwLMPveCMNWFZBbE7FKTy92JkHkBIyU9OD42LndhfgzOf4ZmQupapXe98HM+v2PAHpri
	gXb/I81IRuxB6wWWgcb+KNWpIQEgzKtnKHNJRz0UWuigsb0jBrn0FKa4oJKSxkth6YMeJuLeAcL
	O3kosO3KVF3Z289kuMHeAsdT8Fy1pnD6jv5gacccoUY8jMjVZgJ3ztEBEHl/BQdM/IhNYxuZxuu
	5pEYB/bFS3viSwMdpSRhbVQLCChm7gfZ+B4NkplFKLzynhNlVfnbmh4z7J5/OCuotv2rqQnfR2c
	v35HPL33+FojdY=
X-Received: by 2002:a05:600c:8716:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-49240ea89fdmr306608885e9.34.1782230677401;
        Tue, 23 Jun 2026 09:04:37 -0700 (PDT)
Message-ID: <63766e74-aaf8-48b4-8ffd-321f150132a4@suse.com>
Date: Tue, 23 Jun 2026 18:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/kexec: Zero GPRs before entering new kernel
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-8-kevin.lampis@citrix.com>
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
In-Reply-To: <20260622151833.3397692-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782230678-F71E3744-AB1061C1/0/0
X-purgate-type: clean
X-purgate-size: 1457
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7651B6B88CB

On 22.06.2026 17:18, Kevin Lampis wrote:
> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
>          jnz     .L_call_32_bit
>  
> +        xor     %edi, %edi
> +        xor     %eax, %eax
> +        xor     %ebx, %ebx
> +        xor     %ecx, %ecx
> +        xor     %edx, %edx
> +        xor     %r8d, %r8d
> +        xor     %r9d, %r9d
> +        xor     %r10d, %r10d
> +        xor     %r11d, %r11d
> +        xor     %r12d, %r12d
> +        xor     %r13d, %r13d
> +        xor     %r14d, %r14d
> +        xor     %r15d, %r15d
> +
>          /* Jump to the image entry point */
>          jmp     *%rbp

Why is %rsi not cleared here? And why is keeping %rbp non-zero okay?

> @@ -94,6 +108,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          lea     compatibility_mode(%rip), %rax
>          push    $0x10
>          push    %rax
> +
>          lretq
>  END(kexec_reloc)

Stray change?

> @@ -171,6 +186,11 @@ FUNC_LOCAL(compatibility_mode)
>          xorl    %eax, %eax
>          movl    %eax, %cr4
>  
> +        xor     %edi, %edi
> +        xor     %ebx, %ebx
> +        xor     %ecx, %ecx
> +        xor     %edx, %edx
> +
>          /* Jump to the image entry point. */
>          jmp     *%ebp
>  END(compatibility_mode)

Same question here as to %esi and %ebp.

Jan

