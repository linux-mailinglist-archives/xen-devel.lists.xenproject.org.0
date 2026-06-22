Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +mLvMfBMOWr8qAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:55:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D46B0857
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:55:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bg4Qo0yP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343855.1603070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbg3e-00007B-J4; Mon, 22 Jun 2026 14:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343855.1603070; Mon, 22 Jun 2026 14:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbg3e-0008WS-GU; Mon, 22 Jun 2026 14:55:30 +0000
Received: by outflank-mailman (input) for mailman id 1343855;
 Mon, 22 Jun 2026 14:55:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbg3c-0008WL-Op
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:55:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbg3c-006d6E-5Z
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:55:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a394cc8-5cb7-0a2a0a5109dd-0a2a4501d4ae-38
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:55:28 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a394cdf-e031-0a2a45010019-d1558030c5cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:55:28 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso28441045e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:55:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c4fd2sm26440379f8f.14.2026.06.22.07.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 07:55:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1782140127; x=1782744927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rBY8Mj3XcFb5beTOtOM7ytoF+zkhXTejw5PD1Q13eLY=;
        b=bg4Qo0yPHsy/HSicElmdIa4BvyJssHzfT7K7O5I12kTSaHqbGmKFRNrJfZs0xQLc2c
         6sNrmO96RYv/WMYkCBQHcduA6hlAlgrD5un1SfUWzK/YZoLlKA6qiTV18BS7/svcYSto
         BzUftVhVq/PBXLkKIwmf4R5nCn0MSXm7QciSXGqfc1z/q6e5X1DiGCFgHgf359e0fUq6
         hv3pnEBcZfP0s1z6VOpX4KygbdJ0saIQwDucL3ch1NgoK3Lkbij86eb17aHBm1RISU87
         AvZp+WMZ2LQCgFBprDu63tpAcxpchpJqndWUy9rKE0yGIc5tdzq9TKcCMYO45vToiPqs
         UZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140127; x=1782744927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBY8Mj3XcFb5beTOtOM7ytoF+zkhXTejw5PD1Q13eLY=;
        b=ozxOqew6drw4QWhbPB3Y2mP97Xfu/b/5liNoyKq3Ocuqj9izOQxjfLiKSCFETG+xZJ
         Lrj98rK6/DatHHEsUhi1MFjon17FSvCV5liEuU22CK2TZnMMVyvbDKKBJWmRCzteA6XS
         aq5EC4rmnm19A/cXOxvlgdy9uLT97DAtNLqP9zVtvi3pBN2rgm1ySwWv7hxnmBv22MVJ
         /he+Nln8x/Nz+PuKbcirjqzq66B7gAz4z18V6v4rP3FGMtxj0LgWCuD3gXDcZ1lAOeBt
         3Mmz2jwMUSdy7uX14xfdBpa5eHvfejtzfrUyNBPElTX0hggCRk8fm0ua2cuivc8wP7xt
         5Q6w==
X-Forwarded-Encrypted: i=1; AFNElJ+XVIt3QsnRxyK3+v0FAZBm3x3Zf8qoNIVEZ08Cjz95JjT7LobxKlcKFneSOZKeURaLB5IMDXDR0eM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjloPxr3EDdsfBZqxebjgQaGymUsTyVwTZexOVlmreoRHP3LiX
	mC3EfwZJl3Q5w5jIarEESZd2rhS3lSW6hpc9aKgcFfYECZbt2Z5rEGgJ92yRyo+zFw==
X-Gm-Gg: AfdE7cl9vt1YDsWqoF6WPzyNAiAsBwJ2vxCmg6HBvGlU324ib46OD0UCdk6sWokxOPF
	PM1hw0hugyGG031Z1opRUFrORd2nMYI35M1jiWTarPMTrl+tXH0d23nUl23hMkIO1T/9Bg/BIMi
	8XkJBjORt3NqoTm/z8G6e2lqdJRdOYG2Nr+QSdk74+6HTaMROCrUU0r9yaMgwqk/IxwCbRUm65c
	HTb29cJQJNna5dCHcjFVK2kNwuOfwAwKcRiA6piLCO7Kqe8ssjb5T77IP9a+I+mK9F22/stYopi
	aGpcZA9s+uey40xyNl7q09B2VKifjbqTvBTkcSefNJ1Fz9q6+2FdJbHd58eyBz3MKqu6MJsmQCz
	PVOLEnEHM+nlINrbSsgl/tX7JKUkf3qQnAagNw4x0Ne/IPyvs4LB0k061+umDP+vbhpAWqCs1wR
	RSTF9F2vQDonJEvCtgholbH2G4S+s8+GcpbDGydfbFqFYfP14pOgN2Q6MQ+ioHwYZ+wzx9xMKYJ
	HJh
X-Received: by 2002:a05:600c:8217:b0:492:3d05:5639 with SMTP id 5b1f17b1804b1-4923f6a949dmr226179435e9.36.1782140127547;
        Mon, 22 Jun 2026 07:55:27 -0700 (PDT)
Message-ID: <3fef3dcc-9fd2-4ccc-a3ec-36971aab1d28@suse.com>
Date: Mon, 22 Jun 2026 16:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
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
 <9dc992009d0c1f9d1c6b6e88c0ea8bceabcb4d72.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9dc992009d0c1f9d1c6b6e88c0ea8bceabcb4d72.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782140128-4B7A6E30-E9F80381/0/0
X-purgate-type: clean
X-purgate-size: 1088
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
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 295D46B0857

On 17.06.2026 13:17, Oleksii Kurochko wrote:

What does "very early" in the subject signify? This isn't about (very) early
boot at all, so it's not quite clear on what scale of time the "early" is to
be applied.

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -15,6 +15,7 @@
>  
>  #include <asm/imsic.h>
>  
> +#define APLIC_DOMAINCFG_RO80    (0x80U << 24)

Is the 80 in the identifier actually relevant? As the use site alll you care
about is that you make sure to set r/o bits which aren't 0. Which ones these
are can be entirely contained to the #define here.

> @@ -38,6 +39,7 @@ struct intc_hw_operations {
>  
>      /* handle external interrupt */
>      void (*handle_interrupt)(struct cpu_user_regs *regs);
> +
>  };
>  
>  struct intc_hw_init_ops {

Ehem.

> @@ -65,4 +76,5 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
>  
>  void intc_handle_external_irqs(struct cpu_user_regs *regs);
>  
> +
>  #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */

Ehem again.

Jan

