Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HsBFopLwmnvbAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:30:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F42304A18
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260116.1553479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4x91-0006t0-Qc; Tue, 24 Mar 2026 08:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260116.1553479; Tue, 24 Mar 2026 08:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4x91-0006rc-Mo; Tue, 24 Mar 2026 08:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1260116;
 Tue, 24 Mar 2026 08:29:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4x90-0006rW-Rb
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 08:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4x90-00DO9V-3p
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:29:46 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c24b6d-e002-0a2a0a5209dd-0a2a4507c43c-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:29:45 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c24b79-fd74-0a2a45070019-d155802dc1f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:29:45 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso41676645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:29:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48711702191sm32588985e9.5.2026.03.24.01.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 01:29:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774340985; x=1774945785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zAq/sr4F+fIBzxhIppu/zBHS2g5LYsP9hU02GiuSp9o=;
        b=COzZqUmPBB9uDiLg+ltvwIKM+pGFDqtVT1VOz827Ru5L1n57oh6j1eiqLNtc/V4vD1
         S4ox3TRrgeNl08hNBR93g70BJ0DR/TXSkwPNmYzxW5CHFIJfxVx7mgRMY8ECaiL+slb7
         wjmHooReyc7cUSjCrZZZBVHVMcv0iY/pn4MXIUMjNKae55FLpssLUTE2T8V+bAyWFmPl
         DQ+iZfDBeoPtNPF/e1Cuifz9BUmjixe9Sy93bH83VCCik0I4zbnuioagSH7bcwEECsKU
         F7jzB8tFKzDeUmIibCizkcwFVzufdCseylEw55RYbbiSkWu2T81jGpbY/Y6t6GrPrXDv
         laSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340985; x=1774945785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAq/sr4F+fIBzxhIppu/zBHS2g5LYsP9hU02GiuSp9o=;
        b=ejtz3UGhmcZ/b9BE4d9SjOgYHHtAI9FVHuKYfyUtnUfDumAQuzhVcSWJj9JpisNgEu
         sS9kCtXsRw9mEt7RagEjAnz8sBfrzPS8A03fLDZid+sTt4R6Qh0sQAjteCG7Zyq9AyNZ
         akc+IcFdIb7KAl4wYXYmieVaUGTDtw2ec3ZnbJkb5T3kMQV2nyeTVWSHT6eSItw/EiKC
         YA+iqNGXK4lPyJchQYmHdkTAOi9X+bVhqoJwFff/hahhiyKwcIYEpmWuTdMYXzlLc8Ok
         xy6CnqkME0W7B0Ffeeod4gK8kDYjv/lby7Xa0ljue2tdPy0fQTzFLNCajKmwutPYYtYZ
         otvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBbdtmwxqs5hibdfQQPqSDMi+BgvaRQqqksj11xCibo2Q/FsFYRJFgCSD15VJNUgcHXENePsDJK7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVNBsj0r/7zAiCDuCdYggshQuHaI4EAT0KCpPqFnLtqm+gYTIO
	99DjhRl1FfPjPu7jWw3KEo6vAT1BWs7YKMqhl+r9mdYDUdmZOBTwWN3osGAGLbetnQ==
X-Gm-Gg: ATEYQzzsCPjaG3f85FWddz8gTMfTSWvsX8CQehZdVQH+iT18YU9tm7yud3BQOK6VVvC
	kFa79ZY5ow7rpDgY4dtsx/VlEs/blPN2H77F3QFRRuS5l68N5e9UUB8Vprlynx19XkmiON2oXbL
	4M/cNbSER/r2nM33G5gHyHA+eymGZQ5u4/NNTWuoT1jOjRpQKSkuvABgGBpR2gFA6swHMx3Kt1p
	Pg1rfUpzWeMOSM++1DUI+ZPNPkrabGMAy4yu9WFR6WsnEGHTxu50jV4GkeQ0X5ntJSMtHy1qyFZ
	bd8D6isB4wNPf/yf88I+xz+JtCl++BR61J8K017xJz9qKFgs4NIX7aSe6eYhIvlfVPyV6qvB1yS
	EMT6Am4OeS3Pp2eBOw+5VCInNSaMcCjbTCFGVzNePevKoBP2hzdcgmh69UkdRu+lHr8qnrNlCRA
	LVaxEiJPzNIX/6btbmulGpZWsrkOAmkREknn/XxlCyrMT3bp49M0ARbm8k8lcmYZDzRsxwy1lAq
	mHoNBTlKccMUm0=
X-Received: by 2002:a05:600c:4610:b0:487:716:2fa2 with SMTP id 5b1f17b1804b1-4870716327cmr63799965e9.16.1774340985385;
        Tue, 24 Mar 2026 01:29:45 -0700 (PDT)
Message-ID: <adf41f9d-ceba-42ac-aab3-aebb12c2c0fb@suse.com>
Date: Tue, 24 Mar 2026 09:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <718e92355669dac42c682544c451e7cb417b4b1f.1774305918.git.milan_djokic@epam.com>
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
In-Reply-To: <718e92355669dac42c682544c451e7cb417b4b1f.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774340985-54EBB303-A4B4245F/0/0
X-purgate-type: clean
X-purgate-size: 516
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B9F42304A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 23:51, Milan Djokic wrote:
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -40,6 +40,14 @@ config VIRTUAL_IOMMU
>  	help
>  	 Support virtual IOMMU infrastructure to implement vIOMMU.
>  
> +config VIRTUAL_ARM_SMMU_V3
> +	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on ARM_SMMU_V3 && VIRTUAL_IOMMU

VIRTUAL_IOMMU already has its prompt conditional upon UNSUPPORTED. Does this
really need repeating here then?

Jan

