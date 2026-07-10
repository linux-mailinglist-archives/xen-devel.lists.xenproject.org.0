Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcW3FYCeUGr92QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:25:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048873805A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:25:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gS7QJP78;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358804.1612700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5cE-0007zz-S2; Fri, 10 Jul 2026 07:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358804.1612700; Fri, 10 Jul 2026 07:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5cE-0007yb-OT; Fri, 10 Jul 2026 07:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1358804;
 Fri, 10 Jul 2026 07:25:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wi5cD-0007yV-1t
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi5cC-005SDy-01
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:25:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a509e70-e002-0a2a0a5209dd-0a2a4503cfec-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:25:39 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a509e73-f2d2-0a2a45030019-d155802db18c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:25:39 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b7612475so4309625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:25:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm14361485e9.6.2026.07.10.00.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 00:25:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1783668339; x=1784273139; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7W9gnPqQfoBJ2u+7VsDnH2TLrHRttdcWyybsSm+J8g=;
        b=gS7QJP78WVNuCrOz/fwmUYwK0p8mcHs+JCd9Bv7MtkCftTRfyywKX8PmxWtF9O76BG
         fiEeW9nd/DVPInPsVzxd8gLysw7LbY07FUmLJ+tgnPj8DCM/rQQrAi7S+hGjNBkH0KiT
         wgNFogw7DcpGpFXSeyVXxM1OmYMAVV0D0b2UVvsUCCFn1T6OrzWVWs7M4pkMVQ9Rp2xp
         VGuvaGtU8wPYwPkf2lj65S8hzVQ1BAE7s9EXSQMEsFZTi+87iUEAheAAxA5Pf7kYfw3x
         xY++SLlLDGTMKcq3Drt5/7qaQr5d5ednLOM5V4H3dt3eoiKMKOY5ypcVJB2A7sPR/SRk
         VL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668339; x=1784273139;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7W9gnPqQfoBJ2u+7VsDnH2TLrHRttdcWyybsSm+J8g=;
        b=nU8JzOCH/iqg5KpNTRMJTbg7qmMyfSRAG0TvWkW+WRL5fIKh1/DmYGGTKTRgygrPH7
         HQPuYv5MIsOpM5A1lQiO0RAdjJOK0WvTWHAx8wHPX42psNEetngdC96WvYPNXItukx7l
         TQjK7obf+wQKyVHq6V/1wVBrCIK1DMxNXEGB2cSXWaC6NdMqZs7UnPqt80/lSfQbHfa0
         fXOXQvwEN0vP3EHvs17aCBUfakxuyQ3Uo3FHaAlKbLNmHEPRmaZhgjiDRkAjhQmMxbF+
         OKz+TDB9ZAg9uLU2WRlAwJV/3Duo0gNpmdIkeYRNWlN3q1Bf13dRS/wM15CTQ/eYm4n8
         TR6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTJFUL2OwM4ZFhG09R9P/XBGuHm9jnmmjgPIoMkQnKMfU165qOnkYRHPm1gd4GTyaUx/h7oca1VbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzY6mfenUScyDnr1oFtTswgH4JFq/BXw1kyQrl5vhTSPgaBtWJ9
	48tuWH2C7LPWEh6qguYWXyG5L/uGUfjOOWik01f9mc3JuJEX1pL0dVrrLOXgVq2ndw==
X-Gm-Gg: AfdE7cmUdkXS/cjhZ6xhIyFyY0A8HFR4NkMkVC8j5RmW6ax5xlAJwIxDGhP/cDqJS/Y
	e9J6eiXAWil3KrvHckLqtz39ai9XWnSaRX0DmxRwflWI2lEViAOFIJX6XSo+hDFVbbms03D8Flk
	TdDT64woi2g1q3NPfGyImGtGRzkQWlAYX47U4eQ++dzYm+yNQiyCLsqgnIspU+kUHJLwTYhMjXq
	TX0NJkERUSpAWTJ54/IPOTcMtEuYAcdRN/ptkwu2nFkkCyfhPGxo764cRTisvsXoyuURe312NjH
	7gP1jr+WD3UuSmvK2gl98BRpT8fN6mbWE7/VSSh6K07rloMPlKGTFdwq8RVlJyrORajZMwOMRvj
	Ka4MrUsy+MBPmf5A/G6f36KLeYO5EaE/qMkVoCJyxnf4HGxHzIm9bFrB+cU+G9GcaRJOZjg7Xzd
	qK7ilNp7OhrtDFwuSZm2PEVrhgXceXe6Q7BCFCvaTSArTWu0y67hqCOw1s1vkqaO7Rjr8blJwyG
	dLKLjxaT+ZfFbk=
X-Received: by 2002:a05:600c:c3cf:10b0:493:f0f5:f2db with SMTP id 5b1f17b1804b1-493f0f5f3aemr26816315e9.22.1783668339195;
        Fri, 10 Jul 2026 00:25:39 -0700 (PDT)
Message-ID: <0fe60f59-ce48-4d0f-96f7-16bbae05a81f@suse.com>
Date: Fri, 10 Jul 2026 09:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <20260709220552.646462-2-taka@valinux.co.jp>
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
In-Reply-To: <20260709220552.646462-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783668339-F2B5CCF4-3D9CA095/0/0
X-purgate-type: clean
X-purgate-size: 1168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8048873805A

On 10.07.2026 00:05, Hirokazu Takahashi wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -23,6 +23,7 @@ config ARM
>  	select HAS_STACK_PROTECTOR
>  	select HAS_STATIC_MEMORY
>  	select HAS_UBSAN
> +	select HAS_GENERIC_CPU_TOPOLOGY

Please insert at the appropriate spot of this list, not at the bottom. We
try to keep such lists sorted (both for easier lookup and for reduced risk
of two patches colliding).

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -191,6 +191,21 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config HAS_GENERIC_CPU_TOPOLOGY
> +	bool
> +
> +config DT_CPU_TOPOLOGY
> +	bool
> +
> +config GENERIC_CPU_TOPOLOGY
> +	bool "CPU topology support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on HAS_GENERIC_CPU_TOPOLOGY
> +	select DT_CPU_TOPOLOGY if DEVICE_TREE_PARSE
> +	select ACPI_CPU_TOPOLOGY if ACPI
> +	help
> +	  Retrieve CPU topology information from the device tree or the
> +	  ACPI PPTT to optimize virtual CPU scheduling.
> +
>  config NUMA
>  	bool

I can't help the impression that none of my v4 comments were taken into
account. And not just here.

Jan

