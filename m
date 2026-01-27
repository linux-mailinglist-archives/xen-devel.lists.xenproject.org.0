Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP6KF5uVeGnmrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:38:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA992E71
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214204.1524575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgSH-00084e-3o; Tue, 27 Jan 2026 10:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214204.1524575; Tue, 27 Jan 2026 10:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgSH-00083C-1A; Tue, 27 Jan 2026 10:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1214204;
 Tue, 27 Jan 2026 10:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkgSG-000836-7y
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:37:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0ca0ff-fb6c-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 11:37:49 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso55637735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 02:37:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d3ac45bsm129359875e9.0.2026.01.27.02.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 02:37:48 -0800 (PST)
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
X-Inumbo-ID: 3a0ca0ff-fb6c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769510269; x=1770115069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCs8nzhL5+toIKmoyD+H4086OE2QwpIqGtymOs/bEew=;
        b=A4NhYoAr98/rHzdVAym5UXW13kTgzb8Apf3/yQ8jNOIyueXK5MieNc2Ba88Ik2Fxd3
         28PsBGQEvhZBJE8JSTZgAoLGT6TDyCmt85JTH3aORXSBtlG7xiLWLaH38au2GDO3hWdO
         urzQMap2Q9OBNvNv1/sBXzkxzf99fjQdVHrOY/RCetgr9vKM/M/lGJkMKsCvpB0sDJOh
         vkgIyh011bG1ZM95tvazAq+JKYEBLimbbvCLPC7ztd4wxza8l3O/YF57r63YtcegAL1F
         5Tfx03WLLOcpGetDaqGTmhEWE1hSGVCiqXHYb+8DXIUsWHOOrh2SnobVOmXWMaxid/a0
         +41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510269; x=1770115069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCs8nzhL5+toIKmoyD+H4086OE2QwpIqGtymOs/bEew=;
        b=Vu6v6e04W0RBUck3lhWKpVevtJwNvuQYuXvwUbK0qTXgp97IN+3uTslf7qTZabIJOy
         cdYUF/08EPHeROb/qVtBMcljO1TgxKn+HYLPLZJkQOKZgIYDqKMaTRpGHhpPuwf0f7Ic
         wLSSFTn+k7LzSQJpkxyk6u8jmAxAJpikKdT5KD3WjNAeDFGuKjQqlpehb7I2baQ6hJFw
         z/GB402oC66IIuJHkuNxO/XIPXorBkJgcANLHO7T5wYLmFptSc1QzJix2Qv575W058Ej
         TbuYiYI3fg6u5OrpfgyZDMZpOp++8BGxXNACwANmLczbnuARG2XnelB8VEN4njaWhPQM
         8hYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTSZT29U0tEep/o325uZRqSJO9/FlDayXDKfFulFPQdJpaekkfOzFELJiuLQAmW6rZ+0tjeIAQE18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzwy2SYH5sClzW/05SYw2vtTMc2n7U2Q753DNBRbHgHQNMXm3UF
	lQVYuCxOXH+mSYMhnpWKf7Va11UTacLVpQ5pDy2kQlSStrmb6xIpVAsjgKsBH+4DVQ==
X-Gm-Gg: AZuq6aKn94t8EUazkNeo5ho0Qh0sJ2suWm2SiyX46Q0nufFgaDhha7umAoNaP+mrPDF
	wMeZkjD+1MeP70Q0pquULwQiO/5D53oqEG/OS3HHMQa099EmWXGVNGvn5arjXFbdeZabUza1+u9
	Mn6R3b02RmDrkuTSEExrb8R2TSLDQUoFYU6FMZ3s2T1viZDEOegjjs9CqMgP+ssRZ818I/4O7oB
	zqOD9SnK8frHtkswazI/EXaH/MhKiEp1NniBskRCPUcOqL4A+7dtI9fMzW4InnSM5ri5FyAiBOB
	klYQlVinFx5EmOnT9zk+LelxR2Rhv7vX/f7AdIT7DCsIiPBoi+fvUxMHqIWXtbg+VdtR++baBIi
	iIugCXnTlULsstqE6QZ8LmgOPV0KheAkZk83DA14xtpmap5qe+2xYIRDV489uB8deSai86KFD0/
	gVpnaDHzFnc5fTuJ+baYjmTU8S2lnNJfdPqBCu87R53OQ4WP9veeHQKpzZAPs6yzeURJJ8inBfh
	2E=
X-Received: by 2002:a05:600c:608e:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-48069c167d2mr18327175e9.16.1769510269195;
        Tue, 27 Jan 2026 02:37:49 -0800 (PST)
Message-ID: <15978c88-5ea9-4159-951b-27c9fc004756@suse.com>
Date: Tue, 27 Jan 2026 11:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] x86/cpu: Fix boot time cache flushing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-2-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: C0AA992E71
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
>  	uint64_t val;
>  	u32 eax, ebx, ecx, edx;
>  
> -	c->x86_cache_alignment = 32;
> -
>  	/* Get vendor name */
>  	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
>  	*(u32 *)&c->x86_vendor_id[0] = ebx;
> @@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
>  	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
>  		unsigned int size = ((ebx >> 8) & 0xff) * 8;
>  
> +		c->x86_clflush_size = size;
>  		c->x86_cache_alignment = size;

With this change, can't the writing of the field in generic_identify()
go away? CPU_DATA_INIT() in particular doesn't invalidate it. Perferably
with that dropped (unless of course there is a reason not to):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Tangentially, "cpuid=no-clflush" didn't have any effect on any of this so
far, and also isn't going to have with the changes you make.

Jan

