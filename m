Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h3I9OxFHOWoopwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:30:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509796B0536
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TFqwBis2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343802.1603022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbffK-00038l-P2; Mon, 22 Jun 2026 14:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343802.1603022; Mon, 22 Jun 2026 14:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbffK-00036Z-LZ; Mon, 22 Jun 2026 14:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1343802;
 Mon, 22 Jun 2026 14:30:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbffJ-00036T-5J
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:30:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbffH-00AUOB-U7
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:30:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3946f3-2eae-0a2a0a5409dd-0a2a450ae70a-24
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:30:19 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3946fb-93a5-0a2a450a0019-d1558032b1bb-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:30:19 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso36986795e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:30:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd33dafsm331318315e9.8.2026.06.22.07.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 07:30:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1782138619; x=1782743419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hLNk1BTqJffL9M8h1wsxT0JHYN0fLNP+FxiIZesVZls=;
        b=TFqwBis2+2rIrHBs4ZWl3PA/o65UVUc6EFATkEUlaZNRqN5lhfTSYppmpf2AkaD1EK
         UmyIxke7DoRXLUA5cFFC4/BueBvUUlXLQLsZkg/d07hUBGz5836eAU51fxIBChrhWQkg
         QvEyY3r/bFtBmdDpWLK8vXnNmoP43+qanfN82/BkHp7/FedzN2e5xWo7PibPeC9xCZm9
         WI04hNglnxZ7g2NeOclhtbqcPdR5LpH6PZ1QjqLKiDYDVtDLrE/Nykf6iOEEwSEWGKT9
         gXBaxV33oQm0vpyUfrtZueyViU7dVFYei0/dALoyWHmHDjEL9MczsVQ5NADKGXtzaZ0a
         I1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138619; x=1782743419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLNk1BTqJffL9M8h1wsxT0JHYN0fLNP+FxiIZesVZls=;
        b=rjvll9ZFQWE9ju0AcFMQR+SodlUyVY3+yraGCAAxIH6xT2YIO7WFgqjeECpOHesAVp
         P5NLZUJpAnYCFbAXqqRfnFD1WcBqDyP9tcNgdr/I6Db2kXLx9+pGTAB0BQxVKwHe2rBb
         3EhPK7uKdvIRO9ujQGBze2XYZAIjTJPsvby2rxdDZSkcWkf9mlJQz50OPorvTdX22N6b
         z+SG6ZNHFGWQI1Wmj7MvWPSiDVKRNfiG5+hJW9Bi6DV0dXF+1KltRWW10LTfWV1Kw+vz
         DWV7gKO8cDSbdlUKc8+wS9Oe6Lk75R+fDabsAXQg1LgCtNiv+Qq4yEiRz0oAcZYfJteB
         5+6g==
X-Forwarded-Encrypted: i=1; AFNElJ8h31ZgX+QHaO5eC1sOnjDERZTWRhWeMe7hs93tzctTQhfzrnSvS5bmItUJytADowgeRklfT49g4CE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjcMIiwaFsC+AvcGWmTqmCi75BKpDV7LBxcQwvv7X+QLkAyDuv
	3wvD/J59Qxf7JzXHVkw22k9awoEgULT+wP+V+stPBR4IV2ohbXkhkyEwH2gVxMQeUQ==
X-Gm-Gg: AfdE7ckEqmLcxgYPPsMhpJsgrjPjULXhslzZVYu7zWGzFV0SBR0sPEnN7633jyEWUfF
	VVuehhbYOZQxCh6VNVjnXRV2xDkGXJYf/lw2hCQBFkAXX1iXTCUcdKhsib8YH+U78BmGvTw0cwg
	gcmLe3YL8I+IyCK1eGl8xY4PETG6ogG6hr+bOwWqI9mnf6NMi11LsU2K1To6S4wpdGiUu7IgPYH
	G+S+D5g5KlSwRI4CXXiUogeis4XtHDdEuOZG8++E11NDvdkdTQCZc3A1xD/xa25sP87uJOaApvQ
	dkgoSm03ZIoPdlGoezDJW/BlHeJt3RIvDvzrkfqdIuk3IZF38CZrsM9ce9Jv+22jhvD4rRcLE4z
	Fleb+XW90xWcVuLBesC2wnE7HZooI+Jci31zG85LqtPVyMPGQHuUtieadRBNu5l6pURI7kcCAQN
	uIIXR+FqDG9aOx6oYJ6D1RS9jfI3RmyYJImF2L8AmnbPABGn/TR+FabnDM8kSW/TmuQwjvULfeg
	Y7P
X-Received: by 2002:a05:600c:4694:b0:492:4717:59fb with SMTP id 5b1f17b1804b1-492490a77a4mr172241975e9.17.1782138617715;
        Mon, 22 Jun 2026 07:30:17 -0700 (PDT)
Message-ID: <1bb1a400-ed4f-470e-8f20-779d2c09c03d@suse.com>
Date: Mon, 22 Jun 2026 16:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] xen/riscv: introduce init interrupt controller
 operations
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
 <da217bc51799d46666a740f38e00efc6de554ffc.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <da217bc51799d46666a740f38e00efc6de554ffc.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782138619-C84FEDB8-27D8DA92/10/73395122804
X-purgate-type: spam
X-purgate-size: 1031
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 509796B0536

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Introduce intc_hw_init_ops structure to avoid risky mix of init
> function and non-init function.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Strictly speaking ...

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -306,12 +306,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
>  
>  static const struct intc_hw_operations aplic_ops = {
>      .info                = &aplic_info,
> -    .init                = aplic_init,
>      .host_irq_type       = &aplic_xen_irq_type,
>      .handle_interrupt    = aplic_handle_interrupt,
>      .set_irq_type        = aplic_set_irq_type,
>  };
>  
> +static const struct intc_hw_init_ops __initconst aplic_init_ops = {

... I think this needs to use __initconstrel, as ...

> +    .ops                 = &aplic_ops,
> +    .init                = aplic_init,
> +};

... both initialized fields incur a relocation.

Jan

