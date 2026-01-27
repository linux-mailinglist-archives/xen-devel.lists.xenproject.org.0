Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDikDFzGeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:06:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F899552C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214814.1525054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjhk-0004yT-Up; Tue, 27 Jan 2026 14:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214814.1525054; Tue, 27 Jan 2026 14:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjhk-0004wo-RD; Tue, 27 Jan 2026 14:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1214814;
 Tue, 27 Jan 2026 14:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkjhj-0004wf-C3
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:06:03 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5029afd6-fb89-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:06:02 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so41560685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 06:06:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066beeaf9sm67002025e9.6.2026.01.27.06.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:06:00 -0800 (PST)
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
X-Inumbo-ID: 5029afd6-fb89-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769522762; x=1770127562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3MkI+kGAAt3Eic2/B2zed/7gnJSWVeLiwL2nZsE1uMw=;
        b=Lc9mHN+jDvHRAC+WznfELHifUZgJQVlh0AxACKOou2USu4Ow4XNSDmv8bIf/CvBtsO
         jop8N5YEYFNDbKdafMh7a2JRLTkaqmkuZO9rSHkdN79TiXGVM53qepiu9NJRjgAEc/h0
         nN39UkL4ygutoi8DJMk2vWbtVF4wB+B5oii5OdZZBS9Jl6oj/nseaCfHM8a+zbeEIVvq
         AkoTfnD51uVvraWAHfDGkxENgycmXrAk93EjKTbstHNpQrR5iPTD0+7ibqxGGcuNcgjD
         GwB/R/hM1CRjimcZlnWyKn00Yo/b+p417dhtDlW4bbUO78WXspaOTEF8XyA1Osy74fhw
         nTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522762; x=1770127562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MkI+kGAAt3Eic2/B2zed/7gnJSWVeLiwL2nZsE1uMw=;
        b=QZBWO8qMwzfOSw4DL5wIHBQMtFMqAh2jj3vseK1QknMxQ2xduTGRRsSCHgzWxH60kI
         UGTcwCvAHDZ1fCDRFeqLnDWY+9ERYLxqfdL/BLs4o443UpryDVIN8nGVa+9j5IRW6VEq
         UYpVamkG5tj7hn85tLHu0xkw3zsy9O2F3FIcQIl5YHhou+J03qeN4m4J1082vJ5gRztt
         ChIdbPwcVQBZifCJko7dtjMUGe7pquUz/NUp9JCd4fAWeeHZ73dAVqhtLuMU1h6qQFvm
         1wNCa3oupC/OXKTTNh3pmaLCjbLGe++8IZj98V6vbRwK0Tz5phIb7Mp82EudttsOHRL2
         /VoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXItofrWjtL4YeTAYOMaSch1SvOmkVNcz9hC3nK4kkJSTud26GoN5KPwmQklNgd4zQk019HRjq2XS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnsLcr+H3JEVUEWQgbP/F4XAj4dHl5X5lXm6UeqsB/PeHNuIoe
	6UT96WIZ4jNJy7lFGWY1ayj3Vaa5sL3HNdpSJTjqefkzFwxj5dS7D0/xryaxpq91Hw==
X-Gm-Gg: AZuq6aJxKoqyk5smzR0s4ye34/QrjnFZQCaXQlpGPx0SL1vnfUxINQwQxQt0O9lTxzi
	abLgoaIkrN8BfgksTU5Vg2OzVHrsx6M6+eIt0kF6QOiyZ58zZWUn4gd5BlglaFLAUB0kggUnpMU
	UUjsEut16W8uaKI3Iip4jyuSPjXn9+iawvX+XZxA3ZOc+CkAQW+FN04FfaKtJBbT/G5IY5/f9rd
	6FGJDzE+dWvMVLxLIOkXJSgv2v81MpkNVM21mr6+7k32WyLMQDqPNV2dadQ1iYFUjQ0Us4sqUDS
	kEqK+FL96ZEcjfJvdEQl5kDyRhVSLBjXtrjKArZkr3QTpqImycaAj/7QVGDcmwEv+9+7mZMnJFa
	egxBTbZ9StRFJ7yj1Ox8pBzPHqmuCmC2VLe4Ycp0lxytJPbm8H3T5uh0Lrx2I9xxPFXbEBVKLJR
	wCMI6Bx3852VohLAukqlN2QaYpXlDMGNunpPG1lqSLZ/4JA9OvCMMlJ2bTIbfgbRNyVIi28yc10
	6I=
X-Received: by 2002:a05:600c:35cb:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48069c7c492mr30353985e9.25.1769522761657;
        Tue, 27 Jan 2026 06:06:01 -0800 (PST)
Message-ID: <810d31df-f69d-49ad-bb1a-ece5f3e75049@suse.com>
Date: Tue, 27 Jan 2026 15:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] x86/cpu: Rework the vendor early_init() hooks to be
 __init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-7-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 92F899552C
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -503,8 +503,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	if (c->extended_cpuid_level >= 0x80000021)
>  		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
>  
> -	if (actual_cpu.c_early_init)
> -		alternative_vcall(actual_cpu.c_early_init, c);
> +	if (c == &boot_cpu_data && actual_cpu.c_early_init)
> +		alternative_vcall(actual_cpu.c_early_init);

Using alternative_vcall() then doesn't make any sense anymore, does it?
With it replaced by an ordinary call:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

