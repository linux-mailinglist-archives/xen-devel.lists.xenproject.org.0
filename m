Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBeBKek2zWlwawYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:16:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104BB37CDDD
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270630.1559249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7xJ9-0001fV-Ho; Wed, 01 Apr 2026 15:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270630.1559249; Wed, 01 Apr 2026 15:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7xJ9-0001dY-EX; Wed, 01 Apr 2026 15:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1270630;
 Wed, 01 Apr 2026 15:16:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7xJ7-0001dS-NO
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:16:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7xJ6-0053IJ-UW
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 17:16:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd36c0-2eae-0a2a0a5409dd-0a2a4502c88e-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:16:36 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd36d4-42fa-0a2a45020019-d155da36e0b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:16:36 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b982b0889d8so859745566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:16:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f13sm570264f8f.3.2026.04.01.08.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 08:16:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1775056596; x=1775661396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QmAa9ky8MH+ew0LJxnDQPff8r9p6/FG1sNdb8AFPXHI=;
        b=CjWzBmPfQzQOmYyNjljDsot0kJiib01IHagMgSSvwSMY/yKewOCCDtq/WnicBvMIJi
         YULNfKbpI3PaaJOjodS2hASm3t4pCOyKVuYfIYLw3R+6Gau8Qc9v7mJvaL6IlErKIpiH
         TyNklP4hBuMs8MZYmlARr2WRuwwkQHS8ZFcU9qCOXSZM1rDL/ZzC8xej2FdKCM+8gNjR
         6ilLi+NLFLYYGBYA4sQLWLzNDT/0f09eCKY21Ej9m/ph1wsXkbv/vASuCfzZ+fvUeqjt
         ORdOCjmJrlIRtn9S2DlZ77MrUCH1DBxUcKov7gE4bj0LBcnf8bQRCx+4IZrk/DKawjIl
         ehZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056596; x=1775661396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmAa9ky8MH+ew0LJxnDQPff8r9p6/FG1sNdb8AFPXHI=;
        b=I+w4HJccihaYxWphSAxB7w+KwfMO2/3z0WWjuuhKJUZeh1DnIoYOWRkjQIE7nCnyer
         ueTx42UUdKBuHnLMwM7UCPRpJijDsQTbjLRKyG7v4N6VBL78+5A3z54WDwOn3rSsJE0S
         bNAfgKp2Ys8spk5E5ThFHEd3n3TQwYC/B3gIlMC/s9DCMVWsNJwsBpy04meSjPB6tJpL
         /o8I5yAi76mE/frDlJPNBm4hOTs06qgmL/iDLP9cPFFV6Cdv26a3K7S6LOsO3u8dxuIs
         6p0c6CmlkeGvwx45T5sDC1XToTzEAmI9+rLNzOUWjgxpj8tOIePmj2LRBgIczxMsjoKP
         A1tw==
X-Forwarded-Encrypted: i=1; AJvYcCW3ktR10qij7mWURTJ/2hsZCFF5HpnX/bm55BWRLzLukzXfIHKY/CEGY7xYR9ZFnNTeE2oknaGw5Bw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznYiNfnJIlf8Se4t0DxPqGEyVduu5SioklZfP8+tC4ZtNhCdCa
	bB9y27uhvY7BVqj/ergcS717lA3OVo573m0uUQ4BI9nR4fuV6ARREkv5yVEc2E1Xvg==
X-Gm-Gg: ATEYQzzz/5YLEScoxcYCnxnFEl4BGp6tQ0AwSAtiULsty8/etax0sWUgfZ2KrBfFEQr
	vzvvJqtobfBw2Tg+yG4hmFwUprRBo00JbmNsAsDtKwZtNURkUTjZ3iYqov7640XQcZvdMQZcFdd
	YtdXgzfloGPZQi6q/yut5NlzNNLn12FxBw7U3Uh5vULK1S1XyeC1QVlSuP1YBh6nnAK75B4TJG7
	2xWxfCqoPqIEFxOpf49rw5tLJLO6dWRW3n60LzlrI3XnwJ9FM31hwEj55kh8nipGW1Bq98raWSJ
	+A+DIkzUkiPhzwXYCi5Wurx76+oHSIdE3JOoz5eCby5yQ4SI83XyxMrLoV4t8Xhc0+KHhlWVgZj
	W31llW103wfx6dPwkdQOpOEWgOLtHdMT0u6Y+hbdQagj4lh51YNad4Ip1EmYW0Jt4ay1XbRs5eA
	9+hj37OIRECpBzLnqjwg6RbtfTmPSc8ptTcgZeAd1Ildim0jSoe/RAVnqAA0IXn7umKsqO2vQvZ
	MW1h5fq8hNQ1dM=
X-Received: by 2002:a17:906:c24d:b0:b98:36cd:7e14 with SMTP id a640c23a62f3a-b9c13cac9eemr244965066b.42.1775056596167;
        Wed, 01 Apr 2026 08:16:36 -0700 (PDT)
Message-ID: <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
Date: Wed, 1 Apr 2026 17:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775056596-4CBF5CD1-819FB2AD/0/0
X-purgate-type: clean
X-purgate-size: 2195
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 104BB37CDDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> @@ -295,6 +297,85 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
>      spin_unlock(&aplic.lock);
>  }
>  
> +static int __init cf_check aplic_make_dom_dt_node(
> +                                    const struct kernel_info *kinfo,
> +                                    const struct dt_device_node *aplic_node)

Nit: Entirely bogus indentation.

> +{
> +    uint32_t len;
> +    const __be32 *regs;
> +    const void *data = NULL;

Again, why the initializer?

> +    int res = 0;
> +    void *fdt = kinfo->fdt;
> +
> +    res = imsic_make_dt_node(kinfo);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_begin_node(fdt, aplic_node->full_name);
> +    if (res)

Nit: Style.

> +        return res;
> +
> +    data = dt_get_property(aplic_node, "#interrupt-cells", &len);
> +    if ( !data )
> +    {
> +        printk("%s: Can't find '#interrupt-cells' property\n",
> +               aplic_node->full_name);
> +        return -FDT_ERR_XEN(ENOENT);
> +    }

Again, pull this up to be first in the function?

> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
> +    if ( res )
> +        return res;

So host properties are again directly handed through to the guest?
Shouldn't the number of interrupts (aiui that's the "number of cells"
here) a guest gets be independent from the host it runs one?

> +    regs = dt_get_property(aplic_node, "reg", &len);
> +    if ( !regs )
> +    {
> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
> +        return -FDT_ERR_XEN(ENOENT);
> +    }
> +
> +    res = fdt_property(fdt, "reg", regs, len);
> +    if ( res )
> +        return res;
> +
> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
> +    if ( !data )
> +    {
> +        printk("%s: Can't find 'riscv,num-sources' property\n",
> +                aplic_node->full_name);
> +        return -FDT_ERR_XEN(ENOENT);
> +    }
> +
> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
> +    if ( res )
> +        return res;

Or maybe this is the number of interrupts?

Jan

