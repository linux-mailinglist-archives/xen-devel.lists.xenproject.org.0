Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Zl3IkeKQmq59QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:07:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E247B6DC760
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gElVrpmp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347710.1605540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDZm-0007by-Hf; Mon, 29 Jun 2026 15:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347710.1605540; Mon, 29 Jun 2026 15:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDZm-0007ZD-Eq; Mon, 29 Jun 2026 15:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1347710;
 Mon, 29 Jun 2026 15:07:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weDZl-0007Z7-9O
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:07:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDZk-00Erj4-9B
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:07:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428a08-2eae-0a2a0a5409dd-0a2a45049e42-40
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:07:08 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428a1c-a01d-0a2a45040019-d155802ff0fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:07:08 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso1531675e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:07:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f700c0sm369612795e9.0.2026.06.29.08.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:07:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1782745628; x=1783350428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R2V9CMcmk1ARDaK12sFrY7dX9Bf9VmVM7N7G+2O3K24=;
        b=gElVrpmplFTdBcsiYtF5P/Ou6I2opjtXjf3BFY8deWpy5pR3XxIlCZgta+Z37RFgV9
         Apo685k6um/VvkLh0xx4AIVsNQgkUJ3db0tSadut1lvP1aoeoSFMu1hUsRz0edwNdHbm
         A/2/U9+eVy1NlGBLOqTzUnuL/4cTQMPKGYKBQinVArpE4k9dwVOoThS99YeHOWm01u2n
         2kSlQmG+VQIBTueMxsux4wkelamlZkL00bJsBASTdrWsaioNN262GiwqXfA9fNDNoA3q
         sZA60Yj/15PLYlsqIOvPS7LqfX2KpZl6XK29VetgSpCG13937Ub/ludFFgqUlHVn5blD
         RANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745628; x=1783350428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2V9CMcmk1ARDaK12sFrY7dX9Bf9VmVM7N7G+2O3K24=;
        b=HVCBQLoXuakUXZlAEjZnlIfnxHTLNHxv0AhR96Zt4ZB33R+nNbvWeqGd36o+rDDW36
         03n2sJl6mSDh9YzYZBQarHpqzHUmhfixdT443Ajp5d8Fd7Zco8rRYEhy3Kt1BJBcO4GU
         8h/VstOLDqF9v2YvnmXekHOMgVQi1B9uAy1ctdIpQUKb/Pi8WIECv7qEPthdbvt0tqNU
         nrqae0MitMwwaMMKzJtv1GeKk4Clwq/ffQd1C2iXmieahGYoGYWgPEGrbw5h5k99KHBf
         hSIyH0wnppVO73P1wERHGMPOciwy1Bxu835/PFofhuULsRGHZmZKsM23oMehpKaJyaZb
         r/uw==
X-Forwarded-Encrypted: i=1; AFNElJ9e9ywgLTT7IfewJDzQXMF4SM8nKh3j5aNvsp5yeaPl8j9EYIo6WxL7BIQCLABeohVXME7nq9rvkGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI4zCvwZA2bjdD6HzBDRSyHnjpvYNCsKYPzd4HPcBgYcRRh2Ax
	jSx0kPt4oGWmEcQt+UljAAZp47DaOTiJBQg+10XRyueIXCrkmAxP1CMJDSXnj0B0gQ==
X-Gm-Gg: AfdE7clD/emZ8FOtBXfoTYVlVA2hE0ee1MxQqNTbRU9suWphCZiHLsyabyyB7o+Y7KY
	OxN3GZsRwQ055+BL9fmX7rWXomgULJyIkhJqcapOyGqPISanjCSUBRG83ZSAxd5LunR2zYGwOXD
	m55ffoH0ANvxSRzgIJai6Q8tkhQEwOqPHmM8qR/4eU1umyVOR1r/OjGS/w8B6mzRbEVRcq+/PO4
	ihyFNWSGFIExYGH7BhtxuHtqBPKBniATgrDsgV4F1FCs1eyOc9Bk1/h0VO7fcSbRbqBRA2XCLRS
	9lLRRsV+hjsoctcbvfW0JtDdnVjdt7TwYbWzXss3tqM0Puk5s6s3V2kWYmUJYAD2eZpPz0gePs/
	Tle3wn5FCNhRRJFk9AibJQy2mje9SvD7WfOaeHZW/rjsRjgTisT2fyrYCSx1VKHQAgAAw2KtRba
	wk2qdoDeGE+bp4w4A+N2a1XqNTMK3yWOqxT61zmW+mWqOgvv2loZRZCo0+Ic1JPx5kraFrkry56
	aUP
X-Received: by 2002:a05:600c:630f:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493b8289d8amr1308825e9.11.1782745627585;
        Mon, 29 Jun 2026 08:07:07 -0700 (PDT)
Message-ID: <109135cb-7ad6-49f4-88c7-49ffb33e0068@suse.com>
Date: Mon, 29 Jun 2026 17:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/25] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <ac0b9a985afc35023822150062b4f14f5a583bea.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ac0b9a985afc35023822150062b4f14f5a583bea.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782745628-2FB501CC-900A9486/10/73395122804
X-purgate-type: spam
X-purgate-size: 1080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E247B6DC760

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Add common helpers domain_vintc_init() and domain_vintc_deinit() to
> allocate and deallocate a virtual interrupt controller (vINTC)
> structure and initialize basic virtual interrupt controller registers.
> 
> domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
> is implemented as stub at the moment.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one more suggestion:

> @@ -83,3 +84,37 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>  
>      return vintc->init_ops->make_domu_dt_node(kinfo);
>  }
> +
> +int domain_vintc_init(struct domain *d)
> +{
> +    int ret = -EOPNOTSUPP;
> +    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
> +
> +    switch ( variant )
> +    {
> +    case INTC_APLIC:
> +        ret = domain_vaplic_init(d);
> +        break;
> +
> +    default:
> +        printk("vintc (variant:%d) isn't implemented\n", variant);

printk_once() maybe?

Jan

