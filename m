Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPl8GkWjjGlhrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:41:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5404125C6C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227866.1534269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCLZ-0008L2-Ql; Wed, 11 Feb 2026 15:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227866.1534269; Wed, 11 Feb 2026 15:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCLZ-0008Ja-NH; Wed, 11 Feb 2026 15:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1227866;
 Wed, 11 Feb 2026 15:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqCLX-0008JE-Sg
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:41:43 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298f7307-0760-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 16:41:42 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so4451614f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:41:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc2b0sm5105423f8f.21.2026.02.11.07.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:41:41 -0800 (PST)
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
X-Inumbo-ID: 298f7307-0760-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770824502; x=1771429302; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zho2sPvM2XLY48r5wKdnYl/ks7Wtw7bJwUmQ2I4G+rA=;
        b=AC84uclCc5cpNRFL1C/oq42AhfdYHQNYohhFIxkmbYLLYDpgKFMfkCToX8HgLZNTJb
         RUYyhvW7TkIZlyAR0TiW111gDGPx7LFe3Mfc1nA2pfY3UiEwTrzfQnl8s5wZc1UYOSc+
         3tLQLMGO0wJ43xy2EyVIDuNDrNvdNyat98DegSqfuzpF/VwjHJ/GFx8GJSPfap4jlTvY
         j/g/J4uT0biits+rdNDnDitOv/6hNaT3tBxtRfy/IxqH9zm+immdXpLLvnkIfSKuoQrS
         qoEXuhP1lMl7IlfsJgbOLl7wVLOXaEl6Kg2FuDARsS6L0vd5TDl0Sb9n1GnHHuRICSLS
         yFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824502; x=1771429302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zho2sPvM2XLY48r5wKdnYl/ks7Wtw7bJwUmQ2I4G+rA=;
        b=VR7WOyA9FNyn1nzi8jsFU3pA51qoRK3vW9XIVOja5LDrGFfvcHAGnUK+WsV8pf10u0
         L9BxsyWc/9JfTyyGy+vcz/5ijMZw6BheUkqtyccdEZ1AQqbbdpWFqXXgmrxsZH36F3xu
         G7aDZSq1Hn8fZ137SUovVWFqqLsPH15OHBuIMXmy2U30txEi7k8l0CXLvQfVvbDFTDAc
         6qMM3M4Iayd78Z1+bbg6COock677Hv8g58ocHu2MztjNXr2vJvA8MnXmOWWBnTQjuQRO
         WenbsV37Yj0HtvZjKLr1wiL87B3Q1Pvd6KGzE+4ISDmtMNkYu9Zkhh8gHLXbhvuQjNdr
         lTPw==
X-Forwarded-Encrypted: i=1; AJvYcCXC81RsfElibeERq70GSkGNcHB/+fCEaDmLuNT/ZFDP7vLf7caQWiH4WLRj55kmXQmvaOV9JP4uIGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwagHjITs241aPmxqiFhsIknpA5+Jl9zqyiGz57TK+INpx4cBA6
	/wbVtWyMivhXXNAdg9/Siw0VNxsOVkXI5JBqPuCK52JtRxvfRCLbE0YRutK8c+aV5A==
X-Gm-Gg: AZuq6aJ+OI79N9X1wKBKOa0SX8t0s9m38DwBmUxmzOyeKXB+Zf+Jr7EMbraCTfftzhw
	Wn7hAHkgH4b8OIV2EWiqQhyXTPYJ5cvIhXcRngO+c0Y0DF01YdR257AH59otj+JnQBTOdFHMKas
	xwccDm+q+62AElw6aNEhvV/Lzqi1DcavIC9rg7BwJg0NsLzWd0QxcjNOR6izfk1nRPAZq5M7OGZ
	7Ns8PN5TRI5fQIKibtArW8T0iap3Vq5OKX31aGqxUMB5IGC+m7CbxkKNPo26r/JRITLPr3/jcQd
	eMxtPYYklC6RiGMukIwnH3PfAfuVEjUu0Hwqa3P9+GdQ9g5Z0NeATG6QxbSP0pYAelkbUy848wA
	+Al+hlzNok/5WsUSehYwACuXILZdfC80xmBRTDQ90pIVhfqhp08a8eA/bcqdnJtNTcxinpgocco
	rXfOwLVOGn/lljVNO1EZdNqRwvgfJfocmnymPqih/qkDMm9GBAte1BFOrNhO5vFGHj3ysTgYxfz
	Bg3TT+usBLATYs=
X-Received: by 2002:a5d:5d08:0:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-4378459167dmr4247135f8f.29.1770824501537;
        Wed, 11 Feb 2026 07:41:41 -0800 (PST)
Message-ID: <a20d3f93-2209-4035-bacd-8bd00fb12d77@suse.com>
Date: Wed, 11 Feb 2026 16:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] x86: Reject CPU policies with vendors other than
 the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: D5404125C6C
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  #define FAIL_MSR(m) \
>      do { e.msr = (m); goto out; } while ( 0 )
>  
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    if ( (guest->x86_vendor     != host->x86_vendor) ||

With the subsequent "unknown" discussion also in mind, I wonder: Should we
fail the request here when either side is "unknown"?

Jan

> +         (guest->basic.max_leaf >  host->basic.max_leaf) )
>          FAIL_CPUID(0, NA);
>  
>      if ( guest->feat.max_subleaf > host->feat.max_subleaf )


