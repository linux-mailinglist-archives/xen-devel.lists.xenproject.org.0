Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJyAFGnJ4GkdmAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:35:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B480640D757
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283247.1565524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDKzg-0005YH-EN; Thu, 16 Apr 2026 11:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283247.1565524; Thu, 16 Apr 2026 11:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDKzg-0005WH-Bo; Thu, 16 Apr 2026 11:34:48 +0000
Received: by outflank-mailman (input) for mailman id 1283247;
 Thu, 16 Apr 2026 11:34:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDKze-0005WB-8n
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:34:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDKzd-009YzA-Lx
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:34:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0c951-2eae-0a2a0a5409dd-0a2a4509adcc-12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:34:45 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0c955-2497-0a2a45090019-d1558034dddb-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:34:45 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso95174345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 04:34:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818e51sm75485165e9.5.2026.04.16.04.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 04:34:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1776339285; x=1776944085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=13Wj72+CXNoHN2+XjRIkYIM+IwijmA4CRXlKdh1f6Y0=;
        b=Ag5NXEhyOb0Lj00zf1DxfflMazbAKlTQsl17Haq8rqja1bcY31Yl/mBTSWh1RiGXwB
         QUUzOATTYRDmXttn5oYSYrevD42pNYVMM1DLpxDpKehQ7xMw4pZ8VpZIH/zRUOfxk/31
         HRN0Hui7Kd/36tJmTwPw6atE1K6AOhTi2XSL0le4CKI2FJDHevoyEvb51HrYKPVZA/en
         sJgG59Us1tMILJ+oZk57dA31M2aHpZvOMpbZ714Zzb9ZzqrbVowwU6TfU6zYdiahlX6j
         eYvnLybN6RT9rkauS0my820Cqwy3Wh7oA+/vgpuOBzWy0HQJ+5nO2KAhoKLBjGudK7JL
         2yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339285; x=1776944085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13Wj72+CXNoHN2+XjRIkYIM+IwijmA4CRXlKdh1f6Y0=;
        b=G/CDtk2v22Xyu+9YQ0q7gsIGKgNTvX6H3kskqaz2Kjs+XNoWM7685NRlAsIV8d+s/J
         0IKdP1Nm53W9IVQDdfqfNHqI68VQvGWZ3+9zBgAQw0CMsNlC8jfvOZMTr82D5fHRHdgB
         TNvaepHN2NrLZG6+1UM60s27H1OZbHMM134F3G7lTpsXLcKwdNX2RrKWjDc8BxR7ZWOK
         AUcsf0r1Q2eIc6b1ZO/Z/qPbZZzpghx2W/8+fbalCn22TUUM5OqOwHdqJRZtyLVIlHAw
         EhmCV1uqF1OYL5uE/DQ+tT8ERVU+i/pYo2QS1pRTi1drv3NDeRlY36Cuwvb67o1nY0ad
         6PQw==
X-Forwarded-Encrypted: i=1; AFNElJ/cj8nez11AasRm5q8Zhw+beAxA4gsAG8FQMeojqFkdJwUg4dhC/WkRNu2DMRz4ue24uZM9gy0nHr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwWCVKHqihbrb6bLjapGoU3irD2EONh34469GbIOXEVPxUlrcA
	6YYWD4rZte/jJEPbJdhrX9c9Z24eR0UDztVQZ2zU1NYB25ugeXUL4eUv2wdkw2LvtQ==
X-Gm-Gg: AeBDies3mYq4NQlXS2KSvsyCsWZwf2om+0um+d5YHySTY2pAp1OKelzek6bLZvfU1uS
	61HASGmBrsYaWZ9QiUIZTtQ+OQxd15Nz550v+VOOpiRwZbbKACAc6DlqOjm/M5ugGvThmWzpky7
	M24HKIramcHQrkLlrU/wvwXtiVUGXAgQ9Ti+MHWO8p+9slCPsbl//LKw7A/rZzBHJkmqNz/SFAm
	p/+Dw9CYciPMXWD3O4/BBHbCn1lc9uSSOz7WpYuF3Wa4zahws8iWx5SNgwhWzqFN2bF0S6w31fg
	4ucKaaS3jyrwYQFGEN/0rc4CVueVezIzYpA4VaPriQ2CibhmP82eqA4BICiZGcwKKdoxQ2+KTXU
	L6lrIc9xTiyofd83IF8iINDm9OVHVT1eUKWVanJ0sGBMSF3tBS8fsfQHjS4RgdvoeE7EBSAZ0tP
	hhw3S9Fh3eyxO5OLu9C7DcW3YD812lmtzwLWHSpG7kXMBlFRyfXiQwhz9cnl7Ycq4qY03bw7+lu
	8pZs/d1vb8vMlYjLO/ezgQz8A==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr367159565e9.9.1776339284903;
        Thu, 16 Apr 2026 04:34:44 -0700 (PDT)
Message-ID: <c48562eb-e22c-480d-a736-9037a8c6c2ca@suse.com>
Date: Thu, 16 Apr 2026 13:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776339285-9377AA53-4F344BFD/0/0
X-purgate-type: clean
X-purgate-size: 405
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
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
X-Rspamd-Queue-Id: B480640D757
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:45, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -396,6 +396,8 @@
>  #define CSR_VSTVAL			0x243
>  #define CSR_VSIP			0x244
>  #define CSR_VSATP			0x280
> +#define CSR_VSTIMECMP		0x24d
> +#define CSR_VSTIMECMPH		0x25d

This list looks to be sorted numerically, which you now break.

Jan

