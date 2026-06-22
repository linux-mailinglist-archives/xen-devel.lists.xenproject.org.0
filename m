Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OVGBJFdOOWpdqQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:01:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B26B08FF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CQLiWrRb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343864.1603080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbg9J-0001xz-6B; Mon, 22 Jun 2026 15:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343864.1603080; Mon, 22 Jun 2026 15:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbg9J-0001w0-2e; Mon, 22 Jun 2026 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1343864;
 Mon, 22 Jun 2026 15:01:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbg9G-0001vu-Tg
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:01:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbg9F-00F6aQ-Tv
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:01:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a394e3d-2eae-0a2a0a5409dd-0a2a4502b49e-2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:01:17 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a394e3d-fdf1-0a2a45020019-d155a736cc72-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:01:17 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5aa68d7d757so4936819e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 08:01:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7b359sm290178225e9.9.2026.06.22.08.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 08:01:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1782140477; x=1782745277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eRM5HGo4E73sxtozcyWmy11CCbL7pRFUQONyg9+E098=;
        b=CQLiWrRb2hjjyLNUEzQDgo7V1ldKKfKFKOTaWT5dgjFdBsMdhNlzWjQVXsmZMZp2DM
         DfFLUMgsrC1UriHUUjC63W8QkKk356ZfLTOA4stCNgIXdWWRMw86UE/O5FX2a7zLEL76
         gq7gDnWTDP6eKtkkMK9Y6sH2WOCzkrmCFV61qFpskWyNYGEZ5IDDUHiezK7G2YiC8EF7
         svTFJgIkRzKejafhdhNq34yA9vhmQGEcjSAyrzqj6I2apNR5/tgEr+9QPzabvL37cSFH
         SoUdTK90z+s06cHGIMg6az9thMKQS1GNJRmxvY7c6PLOaylcPzjekBr9Lmd7ZHASONxC
         2ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140477; x=1782745277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRM5HGo4E73sxtozcyWmy11CCbL7pRFUQONyg9+E098=;
        b=nso/tqGWhzmAmb22c5YBZsMuoVkKgPqv3/XvPQjvcTBmlPFxGMa91osGhswENw6DlO
         m7nC/JSMQPHTO35TLsi2y2/L2+R4YHrw1n+NlnLWlWcteevON5Nnen3FozqfASyq4Wp3
         J84a4lUIdw3icTcUax5CKGkMCz89giUgbo04px70hjAcaLBY3fC3Ckz6uTEDN8JFAVTt
         7m12Il+NEwjGGPywD1KdPqwuVflyOMFkVx1eLcGPbQ2/hgHIt0vaaIKuwc9vgYbgzUxQ
         NDaRwfV0aIZ6OdtRxngzojthGGdydnzJZctceZAEXm1nt3V8/BQx4yarY2Y/nN7ohB4Z
         zv3w==
X-Forwarded-Encrypted: i=1; AFNElJ/J8fvCoS9u5UruXWvesZ53GhBsbluHYHcDqX4VMt3boTYk2oBFTpmtJ5EHzx3vsQ8qQLa+Bg7nMP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZZ4FRtNoAbWyKkqXuTyim12A/k4fdeMlOf4CpDZrvetSRKrLM
	koG9Yi5yA6ZfIYF12MciXPlve+9bYEzw52dmJliyqppSyTialawGQbRYfXuXGBdDbfUi1HLMl9T
	YQGvp9g==
X-Gm-Gg: AfdE7cnr3X5+WqiW39NA0vdnRFWSdZ/aqk/c2nZ6CUVFJ2yQr7hJNfGhDE+mLbvamd3
	vxYKkcBdI5rVRvTHuAY1otDJpbUK9RctFNE1Umjuo3bp1+2/62sh23dE9ci/SJ12BijAIUFVGvn
	vzsfyMEyqFh0/aPc90y22G6tS6ujZQNeTL7e89XcpeqF8F/0pHIgQGTaAmtw5kKinzHrvJV7qwS
	PYgAXoeHYVa9uiLYERqk4P47mgXe6VV1BMRSNGZztBwaFdZG+cu6MMgCQtcSVJ14efHzY21X3/Y
	7+AJWHa9d+YJPp63WsXKyQn4VStJ2reA8fyiUMeMy8ygExVfSU6puQ4Zg4lOJUexknkDLZ/7UJi
	x4aPIiH3yOUcSAVKpSNscTLHjj7Xti+dKp+Ts6DqiowsczSD+ShpB8RP1w9IiIgB8/0Gn48svJ8
	bpu46GNNj9c7iQew9y0ddsTfO3Rgw023c/SVmcjszaBG9g1T8DKIJVYT+G2X07FAB66JBiW0/OW
	7G6
X-Received: by 2002:a05:600c:8b2b:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-4924a5669d3mr168486785e9.35.1782140466552;
        Mon, 22 Jun 2026 08:01:06 -0700 (PDT)
Message-ID: <063d38ba-8ead-4f69-bb28-752fd56f0b12@suse.com>
Date: Mon, 22 Jun 2026 17:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <8bb11b0d9c905dd3dd9f922a3f1d2e7f2b75c978.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8bb11b0d9c905dd3dd9f922a3f1d2e7f2b75c978.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782140477-47E773F3-CE347426/0/0
X-purgate-type: clean
X-purgate-size: 957
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F35B26B08FF

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> @@ -83,3 +84,42 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>  
>      return vintc->init_ops->make_domu_dt_node(kinfo);
>  }
> +
> +/*
> + * Guests are given a virtual interrupt controller that mirrors the host
> + * hardware: an AIA-capable host yields a virtual AIA for the guest, and
> + * so on for any future controller types.
> + */

This comment is worded as if it should be like this, when (as indicated before
at the very least for migration) there can (and eventually should) be
alternatives.

> +int domain_vintc_init(struct domain *d)
> +{
> +    int ret = -EOPNOTSUPP;
> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
> +
> +    switch ( ver )
> +    {
> +    case INTC_APLIC:

"version" to me means something different. Do you perhaps mean "variant" or
"flavor" or some such? (I realize this also affects pre-existing code.)

Jan

