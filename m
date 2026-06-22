Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZfJaIqUfOWqznAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:42:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22A6AF2EB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=T9Mva6Zj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343674.1602918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbd2h-0001MZ-8m; Mon, 22 Jun 2026 11:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343674.1602918; Mon, 22 Jun 2026 11:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbd2h-0001L9-5q; Mon, 22 Jun 2026 11:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1343674;
 Mon, 22 Jun 2026 11:42:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbd2f-0001L3-0w
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:42:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbd2d-005uQS-UL
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:42:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a391f83-e002-0a2a0a5209dd-0a2a450c92d8-36
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:42:15 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a391f97-94a4-0a2a450c0019-d1558031b8a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:42:15 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b7866869so42395715e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 04:42:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494496d8sm209262435e9.9.2026.06.22.04.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 04:42:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1782128535; x=1782733335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cMMmSbn0/igSU8GklAAu9xL88UUccHdAK3axehZF634=;
        b=T9Mva6ZjWYAAgjhxmmrcrgxzmUnxuOwTPi/MCL+1hSRxMW8J9eI7DIrd/FU2oCnvnV
         JDd54TJn8i6xL1OlCR1dWzlgV80oFpE5ekf1EY0q8UByFSlSzzad9TTUfPix9i1W1ExM
         +1+oPh+Bd8p7ZWQdBjNP/U0n4ekdgFKqAorGNEE9bIiqkMhmMm3akPjGWZPdEbdsUavw
         IXfWc02iVfH1NXyR/Say/J/fWq1l9cZJHBiPrRXsSGlw7qbbY/ysOSudFzm0uWgEXgAJ
         suf/efaaTQ67L9BqqjqNjqAuW5gMYVA0iO4lieuYtR291IUuq1LLYmRuRBRwULVgw4FQ
         nc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128535; x=1782733335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMMmSbn0/igSU8GklAAu9xL88UUccHdAK3axehZF634=;
        b=pw4rMu+ypHot9lOKs0JECtDKHmseEJk2S7UU75SQ2l4QCXa32gccVooiSrBzH43Le6
         SZ7dkN7RPAgefVdMB1xOonbRYLEWiuvC+hZ4KGJG0H37plaubGBuOm00OuuKhM9eb6ol
         Cl/k9WPjJBNm3K0f5/aAaNyqRjZeSlF2jEW31F3T/xf7S96nIzfnBgaeQOSIIYRC7bKr
         4o3b1GEB+GgWkSJ2rxz5vM4pwpBKN5UDDoOP+jAgN1+xJGLdE/xUqn+uM9ByyuK43XAT
         A2iWmHaZwnYOqnRxxdq2iODFJdAWoDv8T38eEj0uC0yMblCd8lF+GvC6FgvGfL9d3FGh
         YxbA==
X-Forwarded-Encrypted: i=1; AFNElJ8pjefehSjx9bDHpKcQj/o5wFrNP8ardvjdsX0017WHrS0vk196/PxD2mTzziD9D9II7efccH86rYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUloF6VezyLB4sZjrFaSrnYlMRZ7MSo/+9ZK7OcaibmLr2R8/C
	uqfugEujaC92GMskySW+cxRBK91kmL1CNdKbfcZXCmkdjQu+oUswQZvY4orWeI19Jw==
X-Gm-Gg: AfdE7clmkD/OTX81GyW+GTz7DCzF6WqM7JSwSH53GZe634m2zlaI1UIl9Vkd1yRUj6C
	jwemzbMoKQCm/W6TmDUKMKnGxN8/0Y2xavcfFSf4A2qaNR9iMVASLyY8/HAry6QA1yrisDuoeV6
	MEYUwIYnjXyGHqshUXDeBOFSPy0twsN1KtZjU2dHAL67ls7cB2gnR8INhKmBchtDyVjFzsEs28v
	AY4Kx4I1U0xaXLGL4UMGeLN+IgxZJsg3Ml24CV3GDgl0IZzuZZzPPIgYshNrWTKuhWOyzRKKX7n
	Ug9sQmUzr0q9BcAPvjOsZrvKqAJJM8htFrvQUy2cCk4RjztWFm0MI5vz991l7VrIAJ5bm06OARk
	e15aEl/EvovbbcRVOzQkO6kbe4tb1KR5g3Efw8RnI66Qxz92lB9jrjKypdnroWVv0EjBUzOXRTu
	KGcKbzGh2nX1okTHGxZ/KBPvZP8t7tFREBwDm+bTLmVmd9yqDTNQO64wCEPTVBt0gkZAz3FiUat
	AKgv0En/vUcvjA=
X-Received: by 2002:a05:600c:190f:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-4924257073dmr218876805e9.18.1782128535394;
        Mon, 22 Jun 2026 04:42:15 -0700 (PDT)
Message-ID: <cdbf8c8a-e926-40ac-b751-9f13b7f762ef@suse.com>
Date: Mon, 22 Jun 2026 13:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] ehci-dbgp: Use pci_sbdf_t instead of (bus, slot,
 func)
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5af5000701b@vates.tech>
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
In-Reply-To: <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5af5000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782128535-D9BF3ABF-82F39BDE/0/0
X-purgate-type: clean
X-purgate-size: 1408
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE22A6AF2EB

On 18.06.2026 16:50, Teddy Astie wrote:
> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -335,7 +335,8 @@ struct ehci_dbgp {
>      struct timer timer;
>      spinlock_t *lock;
>      bool reset_run;
> -    u8 bus, slot, func, bar;
> +    u8 bar;

Please switch to uint8_t while touching the line.

> @@ -1009,20 +1008,18 @@ static set_debug_port_t __read_mostly set_debug_port = default_set_debug_port;
>  static void cf_check nvidia_set_debug_port(
>      struct ehci_dbgp *dbgp, unsigned int port)
>  {
> -    uint32_t dword = pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot,
> -                                              dbgp->func), 0x74);
> +    uint32_t dword = pci_conf_read32(dbgp->sbdf, 0x74);
>  
>      dword &= ~(0x0f << 12);
>      dword |= (port & 0x0f) << 12;
> -    pci_conf_write32(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func), 0x74,
> +    pci_conf_write32(dbgp->sbdf, 0x74,
>                       dword);
>      dbgp_printk("set debug port to %u\n", port);
>  }
>  
>  static void __init detect_set_debug_port(struct ehci_dbgp *dbgp)
>  {
> -    if ( pci_conf_read16(PCI_SBDF(0, dbgp->bus, dbgp->slot, dbgp->func),
> -                         PCI_VENDOR_ID) == 0x10de )
> +    if ( pci_conf_read16(dbgp->sbdf, PCI_VENDOR_ID) == 0x10de )

This could also do with using PCI_VENDOR_ID_NVIDIA while touching it.

Jan

