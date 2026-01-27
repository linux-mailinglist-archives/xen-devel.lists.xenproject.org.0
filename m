Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAbkD5/JeGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:20:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A507C9584E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214843.1525094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjv6-0007xM-Jj; Tue, 27 Jan 2026 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214843.1525094; Tue, 27 Jan 2026 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjv6-0007uF-Gu; Tue, 27 Jan 2026 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1214843;
 Tue, 27 Jan 2026 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkjv5-0007u9-Tt
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:19:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d03b60b-fb8b-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:19:49 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so4965273f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 06:19:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f742d6sm38053756f8f.30.2026.01.27.06.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:19:48 -0800 (PST)
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
X-Inumbo-ID: 3d03b60b-fb8b-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769523589; x=1770128389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Be56xY6AweT2tQ3v4e+g8TRH9iHTqw9bP+MMcr92Ls=;
        b=ZdqZLDz231mdIWc8pWCzsxno7DeWLQhJIFofGeUBbNzVR5Bt4b5b9bxJa+7gzuTiHO
         NgJYfaX1A0nDsCQ7q/71+rAYQo31tOsABsEunAOJeS+Yi61Yw+IAaic448chB3LdqUMg
         7xi/jn3w+v9En4IXtrO9BmcSi01LIIkVOw5va9rRE09jT3LUsge2GTJHzeYJmeA+F//e
         gf++GlDSPzoVwAMMZmbTKR2MkinFiB5iz6nu8glWuVBnnLZbEhF3O8/5kXrJzrbeymfu
         NyI6wIBAYWXOSvu5PXgeQ3lvkfQcB214tzzscmxhJs/lWmt+n63nVquWAXPYyiF7YFDp
         yrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523589; x=1770128389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Be56xY6AweT2tQ3v4e+g8TRH9iHTqw9bP+MMcr92Ls=;
        b=LjSSPrZwNli5ySDvJLFYnNViJlULrbI7J9Iql/uM4xOcOimK8icT8awRP7uMl5Vgtt
         JmJ6EJ+UshIO1b/w3+pxxCQKIfJ25wSEWDV1b2wH+xNT7/oe+TJs7j3U9Azxy8dq6nSy
         KtfSoDsKSWlVttYVsUx5hKwDnpP4CEfgPnXIMOEwiWVAscz8SKPHMr0EWZ6ciewVoBbR
         5J8giwy5Y0Oq89e/6VPhZ7+ZSySvnVc/SU4OkKbDFlM98TY6GTv/fkPQdYf8LIvLtVHd
         FU1lLzEd0Ct49hHHeq95zGafpOj7tt48j9+2EYV/21KNMkI3Fa5B7fBQzUJ+6gIoSOPZ
         JsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9a7NgMjyfvCyPkP64tkmLQ1mpE3AR9Mj35iooaiNGsSk9EZ5FXAz7wqie95B7/tG+Q3FhjYXepI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTr+iIANkNpHXjho3GdKNmLKUIt1STAFA/N5Ss2aidYpTFmQhe
	6YpoaA6EEtzi9Ps32E6YS/TBab0PnkMHz883YVyOOxar6zG6WMcwksv2xOOT2L/CDg==
X-Gm-Gg: AZuq6aKzGeAx1GEFjFwKB8T+wWPLEvbZ2rgM+EBJbWb8OxslZPmKoq97Efzcl7Z4gSP
	npXJ0McPGYNTKuY4BP3ZuQmGd5oWZe1FTD6DV4r9ZD9xk7A9n6XmatjRQlUcWC94kGvYc4pXz5t
	3mCAsV4/9DGMB2FcJggjMovVSKcTvbsMBwp9BqphWD5W1fMgN0mBiFnK1dPk/AI9FQJcPcopHnZ
	sH5AJL1PoNe+Rk31NWclSVKQHORL38HubviZMwEowFuXlLQA/al+Qni3SxfL+LzRPpcC3fEE5jH
	v8mvqO2nyKdDfqkhYWwobg/CpI1wnVcnPaUEL+UuCXNRWhF5EHia/YKFbCK3RRiAOzTMGlynDoa
	lXRvdaGVN5T7+ELUj1b/F5Ft4d8SZhznx9bqj1CZeVenoXBOzks3A7ZPvVZ/9vkY4QC2rn6YaSr
	Z/QSk/x7liir6Y06qMaYsbzqCfcS8QmyMbPFHqHo5BZij7eX7YwBSLAR/hjr9AhjHqE0rBA0fqx
	Uc=
X-Received: by 2002:a05:6000:2c0e:b0:430:fdc8:8bbf with SMTP id ffacd0b85a97d-435dd1d96f0mr2366965f8f.59.1769523588557;
        Tue, 27 Jan 2026 06:19:48 -0800 (PST)
Message-ID: <82258f46-4a65-47b8-87f7-ce548f45a8ce@suse.com>
Date: Tue, 27 Jan 2026 15:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] x86/cpu: Call the vendor early_init() hook in
 early_cpu_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-8-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A507C9584E
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> @@ -433,6 +437,19 @@ void __init early_cpu_init(bool verbose)
>  		paddr_bits -= (ebx >> 6) & 0x3f;
>  	}
>  
> +	if (c->extended_cpuid_level >= 0x80000021)
> +		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
> +
> +	/*
> +	 * Abuse 'verbose' to signal the first pass thought this function.
> +	 *
> +	 * Besides basic vendor, family and model information, the hooks need
> +	 * certain words of x86_capability[] already scanned, as they may take
> +	 * action to cause features to reappear.
> +	 */
> +	if (verbose && actual_cpu.c_early_init)
> +		actual_cpu.c_early_init();

There's one slight issue with this tying to the "first pass" only: 
early_init_intel() right now calls check_memory_type_self_snoop_errata(),
which in turn uses boot_cpu_has(X86_FEATURE_SS). The comment at the 2nd
pass call site is

        /* Rescan CPUID/MSR features, which may have changed after a load. */

That, in principle, can affect any features, i.e. also SS. While for the
particular feature it may be pretty unlikely that microcode might make it
change, the mere fact that such a feature check is okay to do there may
later lead to more such getting added, not realizing that ucode loads then
may break things.

At the same time I understand that everything else in the *_early_init()
really doesn't want doing twice.

Jan

