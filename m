Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z7P3JnTJHmpoVAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:15:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A762DE77
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eeQvYnL4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324872.1590367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO1r-0005z9-VN; Tue, 02 Jun 2026 12:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324872.1590367; Tue, 02 Jun 2026 12:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO1r-0005xN-SV; Tue, 02 Jun 2026 12:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1324872;
 Tue, 02 Jun 2026 12:15:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUO1r-0005xH-95
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:15:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUO1q-00H7xO-6o
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:15:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec94d-5cb7-0a2a0a5109dd-0a2a4509c914-42
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:15:30 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec961-2497-0a2a45090019-d155802fcd92-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:15:29 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so12943425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:15:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e823f7sm70034945e9.13.2026.06.02.05.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:15:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1780402529; x=1781007329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AfnRC8iRto3pStDWuCKCDDTKkXgJZ9bc3mzew8l6wow=;
        b=eeQvYnL4OEr8yB/xCApQFDte51b7p+qdydxJ52QNAOpe875Tr9hfb2ds5VjL7Su52e
         HGfXtIpRgWTTzhA3KYHz82EE5jJDPvryPuLASnm0Hp1intOWDdpt5XwdXvlfeEgja3eS
         xUuP7enjTx/LkwlGrOwekjqaCN75atElgX5BiB6BX04khdo5GpYuD1Zy7mQmSoN4vT7C
         t+M+hYiIXBP1zBm14/sLj8ZsGGZ2rDSsdgkgrwPtXzd165AnZudRQPOGXXM5oAlL8gee
         eXBdmYlIsN91nr8tsJxvtr3uyaQDpIgNR8mETvmY2PCOic1owdVXzdmjJUsTXgSY0ZsK
         d7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402529; x=1781007329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfnRC8iRto3pStDWuCKCDDTKkXgJZ9bc3mzew8l6wow=;
        b=OBza8HC+1oOv575Qt4pljnHGadVkgx9Rq0bHsUqgzvf68yfu2a6Pj39JIy8f2NrnsK
         1oKPKtuXEtNC00uq9Suffk9HBOGxrdhzLjjKXhc8UuFEJ7C20/c+zGeDcNxWhGSr3kam
         qIE+J5G6lVzk/BvAD+eXKA5MMVk1RxHo5319ZBHJWmhOifpH72o1DYvIAQDY+vMY58//
         lRHRvazl+HUiHo0I6PhzFfq1nfzjQGjjtZwkGuhnenIhhgxVnKSf5tG7UEd5PrCqnwKs
         eC+HYS9KsPNFlHU+9zXsW7smgrIq9fB9Rs8zV9ItP0fhRLjVWX5l8VFz/RBctNnJk1AG
         mSow==
X-Forwarded-Encrypted: i=1; AFNElJ/mn4VWg/LEBcbIXpW4OIDhvdzgZ7K09yBzV6DnXMuHKYGEHTI4DTLm96/6oj2B5TCvjybNqcXNQ4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcg7xN0bhA+xxEHz0xME6359urQgqmsmxXDhgw5IiDiBbCNV4Y
	a31ke1VpXmsxmtsObfMma9DVBEypoIW4jHF7QFRYGeZTvgfnOhSANmn+/LcmUO6/SQ==
X-Gm-Gg: Acq92OFDnHlSXVTVBJWHW0+t9vDJsnxSuMzqAuUueklWjORQStyfniVs/DKHU/KNalC
	gubtaZtoGl2Csek9/wZEh+cy5P9IUnMaNIdlMjbuW6h6s3xAtDyvtROSsLO8jP8TeQxsl1nbbpJ
	OxjI2NjktN2DgmxokGTtkEIfRBhWKs048gtVtp8yIBx/q18TGkmDdDDXH3DRf1FiV+QCFmTn74/
	2s7NrgeY5v9L3uCFOjbQ5bCpjzElhWAufcYefcbuc9bzNjBecyrYQ+GuZbTZdVrH7PZMibzaWUO
	DAalhGjV4syBLZyxDlQv8zsmWc8UgzElzcA9vMIq+/uzP0Nf32Xza9NBgVHl3Tk560KsP5bz9VJ
	r5cP/6i9nISeJMGBidxLFLLIlxHCtgdeblGIO2kU56r5qIGyWjGsM8Ou4yRnQhuSZdBUGdbZmzN
	uNlnheliEqX7cSbfScrTpm/4WwG4nV9i2CihgvOU70235dXbzY7lZ+yI7v7tj8iqx+Amt8E5bUu
	6t3egzmD5UYS1Pgn8ONwQx+JA==
X-Received: by 2002:a05:600d:644d:20b0:490:45bb:8dd8 with SMTP id 5b1f17b1804b1-490a2952d6emr201669065e9.25.1780402529230;
        Tue, 02 Jun 2026 05:15:29 -0700 (PDT)
Message-ID: <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
Date: Tue, 2 Jun 2026 14:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/efi: discard .text.header for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780402529-4176AA53-E88E6EA9/0/0
X-purgate-type: clean
X-purgate-size: 996
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F34A762DE77

On 29.05.2026 17:35, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> The multiboot headers are not consumed in the PE binary, hence discard them
> in the linker script when doing a PE build.

Yet weren't there plans to allow making use of those headers even in xen.efi?

> That removes some relocations that otherwise appear due to the usage of the
> start and __efi64_mb2_start symbols in the multiboot2 header.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/xen.lds.S | 3 +++
>  1 file changed, 3 insertions(+)

This is lacking your own S-o-b.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -57,6 +57,9 @@ SECTIONS
>    __image_base__ = .;
>  #else
>    . = __image_base__;
> +  /DISCARD/ : {
> +    *(.text.header)
> +  }
>  #endif

We already have DISCARD_SECTIONS, so I think it needs clarifying why that
can't be used / extended.

Jan

