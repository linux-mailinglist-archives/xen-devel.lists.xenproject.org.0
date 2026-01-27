Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDtBHH3FeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97D954BA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214789.1525034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjeF-0003ky-8F; Tue, 27 Jan 2026 14:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214789.1525034; Tue, 27 Jan 2026 14:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjeF-0003it-4s; Tue, 27 Jan 2026 14:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1214789;
 Tue, 27 Jan 2026 14:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkjeD-0003IG-T1
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:02:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea2a17a-fb88-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:02:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so83799405e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 06:02:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804f5ad4c1sm124498335e9.12.2026.01.27.06.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:02:23 -0800 (PST)
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
X-Inumbo-ID: cea2a17a-fb88-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769522544; x=1770127344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wdkgSk9yEOQzPLgkJHl7ghgyYgN3oMtlla+2s5yxm3M=;
        b=JoWsImr7eRwMuRJG6ZfSIstFoW2Ih7V5LEv+VU2hojKV4eGHypal8XcvO+qCRvUgSh
         bqSQg3y+jIIO1iA9Q8vu5FH3RvN9zLvD8eJi0PqTvM2Y7CRzztzet3ceibfKpAOu/12q
         7VIhFlC5KF9/U1ObeQi1MQSNePUXk+kCI81Y6cIybpQ1FLMBWxYa+4OZk9A2BFarFXwC
         Dj4c/pG+RWrU1OvjarqtturZSeWkMiHFyuPQd26EcdGeIfuliABl6OELrrYbOcw/AmzN
         gcoC0q9DplEiHCMw8LupIprM+fwlD2nhbINQOhZDbUj5QJxE3zk5hR1eHJ0KvMemrfsp
         xxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522544; x=1770127344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdkgSk9yEOQzPLgkJHl7ghgyYgN3oMtlla+2s5yxm3M=;
        b=vu410/SzN0xZqhVWI14Vtj8WZmUhTpclLQ8O6m5uN7bMilIRaseFZK2C05ZA3PUt1K
         Yj218u/Bg3p0R76qgHp/4pyHBafRMLxiKFfoFre8nGofFGY4udmbyp57C7LeB7WhXmzW
         ji/pOIiSmD/XJwBPrg9PpMRSmzxYwVoRgla+Pl8dzGMWNh1u9v2OLUm1hj+hBbBCPfWs
         g1Pe9w7BSmSQ4osiG1Le1+Q3vFI+tdB2nmDYrRraYEojTvY6Uc8NyPze/NxDzNxBSR5Q
         CUTDeZkq2O2lkxXwan9ZQiKBeZFPylTkTmyRcK3VwiZls0PNZ8UPv9MMzUIrecxMz2hQ
         v0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/c5WQtKz8oqVvkPX40i6p5xqXWRPfddlVS39YInsd885w3quwG8GpoI2XAU48ZGrcEDLkoLqHdpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+4T+Zr/sOYJOjQVttRPTFiXvaSUyhaOxAuUbylGQlPdxvV0LI
	Y55OZFdJ10kkSFuHbshzp7SKmw22qTAALl7DrrHmRsjhrtWua9Df6m0d1/aw75SOuQ==
X-Gm-Gg: AZuq6aI81xXoFKJtuFV+FA8860RrY6rp1zaMXyhF+m4mhjYnKnlmEmH8f2OKcTKZ2Vi
	7xeoPdylIgksl8liyEg0c+3rcPZu4jx7qvK6T3hL563GanclSlsnlSyGDdvNX++TUGtleo6Jq0q
	cNDPv7xkrnR96YpLnR1yJakDG+rdwprm4bolOVlUE5692H4AMP5oA5DlM3KFrWQl2ArtsSftraE
	E/Y4WCR52zKcR7FII/8noUUP8etQz+4Us7GSTwnEzJYO9OhgBt/Us3+ika6TUw7u2xsfrW+EPH+
	72WUKLcBa/DAr3MMiF8kqm3LNHnUaAsRQTDQ5b+bies/dr5kA1nJCLfcTqMxLqC6UDra4sgUyXx
	zlaWkkSPS7gx0IOZ6tmYUhuNIbD2Hsiu9nqdwgTGyQ8ZStmppuYAd9WN3xPLQMhZ4pxf7ScFm/T
	Kzn4lcIbz21JUottruUcNliDYvq+bC+ryqEkngQbwUYO8MAA/gv/0P152VP2ejyeECznor93NHV
	6Q=
X-Received: by 2002:a05:600c:8b24:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-48069c20e88mr27034135e9.10.1769522544447;
        Tue, 27 Jan 2026 06:02:24 -0800 (PST)
Message-ID: <e1c899c5-53ea-44e5-b74e-e3c214576d8c@suse.com>
Date: Tue, 27 Jan 2026 15:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] x86/cpu: Fold generic_identify() into its single
 caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-5-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: EE97D954BA
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -455,10 +455,13 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
>      CPU_DATA_INIT((*c));
>  }
>  
> -static void generic_identify(struct cpuinfo_x86 *c)
> +void identify_cpu(struct cpuinfo_x86 *c)
>  {
>  	uint64_t val;
>  	u32 eax, ebx, ecx, edx, tmp;
> +	int i;
> +
> +	reset_cpuinfo(c, false);
>  
>  	/* Get vendor name */
>  	cpuid(0, &c->cpuid_level, &ebx, &ecx, &edx);
> @@ -550,17 +553,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
>  		c->x86_capability[FEATURESET_m10Al] = val;
>  		c->x86_capability[FEATURESET_m10Ah] = val >> 32;
>  	}
> -}
> -
> -/*
> - * This does the hard work of actually picking apart the CPU stuff...
> - */
> -void identify_cpu(struct cpuinfo_x86 *c)
> -{
> -	int i;
> -
> -	reset_cpuinfo(c, false);
> -	generic_identify(c);
>  
>  #ifdef NOISY_CAPS
>  	printk(KERN_DEBUG "CPU: After vendor identify, caps:");

To aid reducing the gap between the calls of .c_early_init() and .c_init()
(that the next patch's description talks about), wouldn't it make sense to
also drop this NOISY_CAPS thingy right here? The log message saying "After
vendor identify" isn't quite accurate anyway.

Jan

