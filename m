Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uxwHF8ZDQmpN3AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:07:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D26D8A9F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=IbcKAyQo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347415.1605270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8t3-0001FT-HG; Mon, 29 Jun 2026 10:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347415.1605270; Mon, 29 Jun 2026 10:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8t3-0001Ci-EE; Mon, 29 Jun 2026 10:06:45 +0000
Received: by outflank-mailman (input) for mailman id 1347415;
 Mon, 29 Jun 2026 10:06:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we8t2-0001Cc-Dl
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:06:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8t1-00DjiQ-3O
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:06:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4243ab-e002-0a2a0a5209dd-0a2a45038ff6-36
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:06:43 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4243b2-ec1a-0a2a45030019-d155dd36b8f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:06:42 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47362928f65so753047f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:06:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4734df60acesm11299766f8f.25.2026.06.29.03.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:06:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1782727602; x=1783332402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+0LPUCMsNELWFiqO+K0qaDFOyYqoC27KrGUhLHIPdHo=;
        b=IbcKAyQob3Jk/A+kpUF0vWrugKW6/ovzSYvYrhKdmafsxBAJ9DZVoGTVe+yFIQNESq
         ZzBuw1Im/YpR7v08wm8Q6zkY+Rb/KdiZw3mWnqDDDWxsxxF43vxs7twQxjUKYFoLOabQ
         WKmCatDgkZPcJM5ERm77WEIVmlhRuGd91QaCyT0j8JYiNiYsPYuQLKPF0hentGUUcMf7
         01ewhw8PiyIhRu9YSz0jBN1C7BcGYu8Rk7cCQf+iR02XwpGyllgegnmGN+Vw35WHWv12
         0+eauWhoaeXcT96xoWUMRH4LJzKx7f33f/tCBjWsxtvnjhsmHcytqyGcUbhu5gkhNXUL
         MyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727602; x=1783332402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0LPUCMsNELWFiqO+K0qaDFOyYqoC27KrGUhLHIPdHo=;
        b=FG5eoYcRVxdhEBtOeuXmDlxUGlxUX2gVRgJDQTOeBGS708PgfkWP7mDPmVD/HwOxzd
         w6AoxOFNQ9rGKl5nVCqYGwe+xmwcoLLV4/joOkyvuw5zdTQ32C3jXX36vrIUvaKl4QnQ
         tB0crLtrAfbXErMVsjXDEgZH0w0pQ0EvJqXyLpzXPXGmiFx+bBoN3sF+OTXvk8Zf41Nc
         YrX9ryD2jDnfer73E/eXQUtHAx89xcpsxC3B9LXEB45x7/xJRJLiIWrCC2hHCaRzgJ5V
         tonHf/B2GVTzwktWkIsvHamquG+bzCiHaWV2L876xJuYZqH8PrgFRWJaJyKHYi/Nl6qv
         O+1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoScH5ZYTQ8YV7DfeFAAL2vA4WUJIOrhRrPHd8mTUB7Wsoeam8RHIizq3GyoNV1ZKUf6tyf8Ii1GBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPpzcC3GplfXOqAiQixh/xjjqiRWQNJewAPjfGncuO0r1P+UXv
	IFyatTURyp9cD2Y3BkFZYsroyDiuu54H+uKd5mYweDqabl6irrsG8gICBs/v+6mfjA==
X-Gm-Gg: AfdE7ckcgJO3TTouss6Zw5SUGZ91jz3Mi2MNpKMtb5/TfYQyttJrhF0tdLfv71LKIzY
	ckslQD7bADlDo+zkCJgr/tsLd0LnCBgGLVK4WuJUFWyes2DEuJcxaWNhvVzTd76Xvwu71PHS8il
	7qW0N5naKMWcL0uS6SRVgMcnibgdJLqTiTFEiuRFEQO3csFYMG4bnLKgy/gDSn+0D+aaq5g5chc
	7wlciYFVbht/KxinrbJc06DY5e5qZ1RZAnR4boDmEWBQoecnc75gEGgsQwGEuQE9wV2TfUCtw94
	7JCCLYFJLw0cEZzF5Mbfim0Xqry+m80ZQ/5f5T7O6M0AH4Q3Wtb9IcomuNkVl/y51QwLfZAGiiK
	/fQpryc/c55YAQqbQ/ttdq3s0XMhoIfGaHzZGBL7ErgViPql79sSXxuV04B/1vSFwkcVAei/Evz
	gYwHd3pHK5cg6ilCAXNDcI7QODUDK38gnUS9pqGt1GGskGOezihQKjkb1yX4HZdh/r5TfYvYBFo
	SLdpeem3hjmSsA=
X-Received: by 2002:a05:6000:220c:b0:472:d857:5d39 with SMTP id ffacd0b85a97d-472d8575f09mr7053518f8f.0.1782727602257;
        Mon, 29 Jun 2026 03:06:42 -0700 (PDT)
Message-ID: <679bd915-469e-4c86-aed1-aa4c7d658e83@suse.com>
Date: Mon, 29 Jun 2026 12:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/4] riscv/irq: define a per-arch
 irq_to_desc()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-2-roger.pau@citrix.com>
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
In-Reply-To: <20260629094531.55555-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782727602-B53815D1-4F96FD8D/0/0
X-purgate-type: clean
X-purgate-size: 792
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA6D26D8A9F

On 29.06.2026 11:45, Roger Pau Monne wrote:
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -35,6 +35,10 @@ struct arch_irq_desc {
>      unsigned int type;
>  };
>  
> +struct irq_desc;

Nit: You don't need this here, as ...

> +struct irq_desc *irq_to_desc(unsigned int irq);

... it's the function return type, not a parameter one.

> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -19,6 +19,11 @@
>  
>  static irq_desc_t irq_desc[NR_IRQS];
>  
> +struct irq_desc *irq_to_desc(unsigned int irq)
> +{
> +    return &irq_desc[irq];
> +}

Maybe better assert that the incoming number is in range? By this not
(possibly, in the current arrangements) being an inline function, the
compiler can't assist.

Jan

