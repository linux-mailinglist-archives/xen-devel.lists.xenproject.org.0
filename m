Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDlUD543C2qgEgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:00:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A149B5707B4
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312122.1582294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0O7-0005Ui-SJ; Mon, 18 May 2026 16:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312122.1582294; Mon, 18 May 2026 16:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0O7-0005S2-P2; Mon, 18 May 2026 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1312122;
 Mon, 18 May 2026 16:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wP0O6-0005Rv-5Z
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP0O5-0090YI-EK
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:00:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b378b-bab6-0a2a0a5309dd-0a2a4504e72a-24
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:00:13 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b378d-1dec-0a2a45040019-d1558033ed46-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:00:13 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso33670535e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:00:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf81970sm118375315e9.8.2026.05.18.09.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 09:00:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1779120013; x=1779724813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS0F4Q4a37PChXIgi7DKC5iYO2nLobBUU4nfJAGybw8=;
        b=H0qhhhVYqVyqL5sny7aj7xmf6djz0OTNgBau84+0codB2OETvBRkPzkkL10ohPsjH2
         hBoJaBZGY/wpOJw88XMWcL+F6G0GBswhSO6C9awE4ZJZLAYHrUJP51ElZJ7I4nbsvzV8
         JJ5Pg/6gQRIRX251qjWVKK4hQ3HBIUcDmVRY/Uck7Nj0urAF6Vw/IfnqED6aiWYwVpJX
         qBd6ubrVzWkCjgIhHUy/YscOmpfxsBgRNrGCXq6o7Bc8o26F9KmFuGjVDAQwxnLmh7OX
         h++jx23VykSSwe9Y4lc6hVXfkFLr9GzFcvTJ9Gstp1A4dFC51zGWcOLeyftnh6pUHyzo
         40ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120013; x=1779724813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS0F4Q4a37PChXIgi7DKC5iYO2nLobBUU4nfJAGybw8=;
        b=ig/qzLRC1TOpLCL9gRNMJB23ZSlK3/kj35wC0ncP3peS2OC4SwVgl+CTNkRr8ix3BG
         gIuUAwgrAaZEYalXDYHnrqg20OGlUcDvNjbowfW6Gt3STJwEpPMF7+pqyw/xzKdElsIp
         Ach8q1hDvjIdK3q8/5VcKJMxc6gLDyjdWU5z90pTnk8pmlxlB8mb8Gt59gxc+3Hb+rzr
         RF9WEtlf6q1URRy88HTLrcMy4fXA/sYlmX+y7pKLnzrD/qHdJ84Mkx7W20u2dlCQQ1Bk
         uwQeQWYiHcen5M4ij4PfYtZ5LUSvXgahzd547xYlCR3Ws0ssL6ZgoT+TllfNYMOCHEB1
         N4ag==
X-Forwarded-Encrypted: i=1; AFNElJ9hsX+w1hYwt920rxJvG8pwSxN5P7+chsyjhKnR17VIn7M2D6sEzuiDmjc4Ka1eIUByawE1vdv+CGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzCWsVKxoxNkSPaI3+19v4DRYVlT/4T5scUSH45TwgHEamaCCC
	Rs5nfWDc1/FQCrKtvZBm9EHt3uvcGso1wMgiV21h7VALy7S/bKjHTBV9OnJkgjesUw==
X-Gm-Gg: Acq92OHW6eDlRkrRJGVmz9WrmYLtpA9SjfhL3dbLKMMNOJZ2TBAwyJZQZCez7/DGSuI
	0zmgkoR3mHPzC5CBT8PumTqwRQt2Pe0soiuN68n1hfa9MzRFZdF6J8veR6L/34zIkIbrPHLORgI
	H4tKnAQWCbcHX7cbu0H/JaVPZogmWvURDdkFLmu2W08txghkJieGseW/F2Ts3qEkkP/iBxaHDPR
	lzceveBsgsMrcNrT4WUGZk6tYg6psg39pgtVJXiCnTsIoPXbkjN+OZbv33/i1p8WWPTn76Dgq/d
	UaqUl1zffiTr/0WawB8c8rQ4ov3HadfKKGeFxPerHU6Z/ZrnoWFJQFy6llVjGPymvUVauVtfGgD
	NFkNJyo5seiSweEazesr3IWt/svBti/FEKadOzioDu7FFAtP7vEE4KMwif7E2XExanqJfhKMegD
	C9ZO8pCC5zpQcK/kUZrogCbILFWlwrZ+enii6HLHfMZNv0/oto+4cGjewdcd0UI+QuppdbMZOEY
	OMmvGY42NhtO+Y=
X-Received: by 2002:a05:600c:c10b:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-48fe60eb0f6mr166812605e9.9.1779120012634;
        Mon, 18 May 2026 09:00:12 -0700 (PDT)
Message-ID: <3c0e5b33-d3bb-41ea-ba13-43add1d64617@suse.com>
Date: Mon, 18 May 2026 18:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] xen/riscv: implement make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <69d2dd26b7c2d00c9d28f898f041f6d1be145e0d.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <69d2dd26b7c2d00c9d28f898f041f6d1be145e0d.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779120013-2997A3FF-FD8DDBA0/0/0
X-purgate-type: clean
X-purgate-size: 3825
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A149B5707B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> @@ -50,3 +52,107 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>  
>      return 0;
>  }
> +int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)

Nit: Blank line above here, please.

> +{
> +    int res;
> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    unsigned int cpu;
> +    uint32_t timebase_frequency;
> +    bool frequency_valid;
> +    void *fdt = kinfo->fdt;
> +
> +    dt_dprintk("Create cpus node\n");
> +
> +    if ( !cpus )
> +    {
> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
> +        return -ENOENT;
> +    }
> +
> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
> +                                           &timebase_frequency);
> +
> +    res = fdt_begin_node(fdt, "cpus");
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 1);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 0);
> +    if ( res )
> +        return res;
> +
> +    if ( frequency_valid )
> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
> +
> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )

Limit cpu's scope to this loop?

> +    {
> +        char buf[64];
> +        uint32_t reg = cpu_to_fdt32(cpu);

Isn't this a byte-order adjustment? If so, how come ...

> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);

... the result is passed to an entirely non-FDT function? (Most pre-existing uses
of the function that I can spot store something in memory, i.e. adjusting byte-
order makes sense there.)

> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "status", "okay");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "riscv");
> +        if ( res )
> +            return res;
> +
> +        BUILD_BUG_ON((sizeof("riscv,") +
> +                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
> +        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
> +        res = fdt_property_string(fdt, "mmu-type", buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "riscv,isa", d->arch.guest_isa_str);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "device_type", "cpu");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_begin_node(fdt, "interrupt-controller");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
> +        if ( res )
> +            return res;
> +
> +        /* end of interrupt-controller */

Nit: Comment style. Also such a comment pretty clearly calls for a counterpart
at the start.

> +        res = fdt_end_node(fdt);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +        if ( res )
> +            return res;
> +    }
> +
> +    return fdt_end_node(fdt);
> +}


