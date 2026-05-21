Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hp4DycJD2rREQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:31:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA365A5D1B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315227.1585072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3U8-0002MF-JO; Thu, 21 May 2026 13:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315227.1585072; Thu, 21 May 2026 13:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3U8-0002JP-GY; Thu, 21 May 2026 13:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1315227;
 Thu, 21 May 2026 13:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ3U7-0002JJ-GD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3U6-007lSm-OF
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:30:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f08fc-bab6-0a2a0a5309dd-0a2a4502bf3c-38
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:30:46 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f0906-af86-0a2a45020019-d155dd32acaa-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:30:46 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso3960332f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 06:30:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7cdcc3sm3212213f8f.8.2026.05.21.06.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 06:30:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1779370246; x=1779975046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KNqRKJumI/43DKGi3J/KgJAOZc3VimHLh1ukKr3IdIs=;
        b=anxhiXrdVZeHEXp0zHFPrO5VBWPosaZS7PU8itVKNOVwTHwO3xP3s1p6ewdPLQGRLW
         /TERDETJJQ4FHLeMXNp0+afmL5vhVMVBKpMNIP130pp3TSpGDZNZjlelJX6omtulmffS
         d4zwlHYdeYiPHSUULEEKedV2RHfuXbCON3Lqr7r9hJsV3JFoLnoyXkeAzJqUud+DL7ji
         FVrKXqwab6qF+n9oRccm0LoLPGkg8VfO8j12UCAAFK/1hxmJF2H3VJY6QR1ixpFsjk83
         KoJkU2uJlwkOUoSKPymS11mdQWAX/Sm1DzYnyRDsnP62mHQUAoMjAOhVtRK0o1+64CqS
         BHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370246; x=1779975046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNqRKJumI/43DKGi3J/KgJAOZc3VimHLh1ukKr3IdIs=;
        b=IkNKHLpMO5psgFNWTq7nBV2YMdEs2p2QTBTBe2Nawdu5mjnxe+NhbsK2CA/pgpwPkH
         Aj1EhqaGpNX2nzyejoFh8ly4u4iSF4uWqJvhAtlu9HF5qtFyTZldQfEJm/ZvTEP31beF
         GXu9t1mWgHjtnFGQ4PhyIb7G4ZchPEvuXP2g3JDiv1PnJYOvtyWp9gAjwkubU0f8SY2O
         vKy3vObUQSUUUo2HlxLK5iPlrpwxCb7vh8xGWQafpuQwV1QR2najA1+mHtkXaDy7rmfr
         o7TB2+H7UOfwhXX4tZ9mYE+GaLBEIvUBBr/8dHvpKrUVZK2bDT3ObuDW+FQQoY8OoL7j
         LNPw==
X-Forwarded-Encrypted: i=1; AFNElJ+qjL1eF4O9VGy3BXVM0+V8IEwZo4LID+CUBe7rK+Iog1ZvDlN416Dhrq4QV9WeugPuLH0xs9D+Ipk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLaqBu494ieGnOV02PRUxwQ8I4CLGRct18WmFU7b+XseWiiiSB
	hLwcH9wnhTCZdf61nIY6WeZGrXC5Aj6KX4ksvMee+bxG0eB+wATpCzbcCucPW8NhIw==
X-Gm-Gg: Acq92OHqjW32jefL2iDXPUee3Kp9bpyw7MhmHwQxkqvfiqGtuJsankFvGS8Wx9G7AAZ
	ItlRozix8jtjiaCkdTKPAWeN7Td0xKS9KCzZT54lKhepDTCLKlP7705bg34KVpU5HWC0eqGINTS
	ZemVnErwZhaZPwNVHCdjXfeJRPBk9pGpruEUxaenPtDjg98tYA6b0uGVqLbBdrPVTjLl/HPQVkm
	7QvU3I93h58gB820jhr5WZYKjkFcqckGrcawVCP8lYRo5mgYwA8DT0p0BjeYYH1A5e2nFUUqLEv
	rs4QkFSkEJZxK5bAZWJKG79yhH994nPOUAHEbkEApxDlDBMO8aziBE0BO/WZONA6Y/ew0JIu63h
	Ib/ZzdcJKFmF/THkluxGjDLPWjQ1Qa9WYfXAhf8ZIgdXa5OZ4dhtwpiMI3Il/pvohQkbv6S3/Im
	JQXY9UJPsTYZEneN7gG0sPhSdaFxU4NuqPIhs0iX360pSxa3FFEuL798FnFlPtR2sTU7amA6ep+
	lwZ8PdfqlwOHZ4JZRr93tkQ6Q==
X-Received: by 2002:a05:6000:601:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-45ea4126a81mr4918655f8f.27.1779370245531;
        Thu, 21 May 2026 06:30:45 -0700 (PDT)
Message-ID: <ea7d6009-8494-4510-a5eb-b07fa6b8d6cc@suse.com>
Date: Thu, 21 May 2026 15:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/26] xen/riscv: implement make_intc_domU_node()
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
 <425157c3414ca95665288fa3788430e96a99e3cd.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <425157c3414ca95665288fa3788430e96a99e3cd.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779370246-82B68161-BE5DE662/0/0
X-purgate-type: clean
X-purgate-size: 1105
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 9EA365A5D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> @@ -46,6 +45,15 @@ struct intc_hw_init_ops {
>      int (*init)(void);
>  };
>  
> +struct vintc_init_ops {
> +    /* Create interrupt controller node for domain */
> +    int (*make_domu_dt_node)(struct kernel_info *kinfo);
> +};
> +
> +struct vintc {
> +    struct vintc_init_ops *init_ops;

Pointer-to-const?

> @@ -73,3 +74,13 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>      intc_set_irq_type(desc, desc->arch.type);
>      intc_set_irq_priority(desc, priority);
>  }
> +
> +int __init make_intc_domU_node(struct kernel_info *kinfo)
> +{
> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
> +
> +    if ( intc_hw_ops && vintc->init_ops && vintc->init_ops->make_domu_dt_node )

Why the intc_hw_ops check? The variable isn't otherwise used here.

As to the other two checks: Is it plausible for either of the two pointers
to be NULL? If not, merely ASSERT() or even build upon ...

> +        return vintc->init_ops->make_domu_dt_node(kinfo);

... NULL derefs to fault anyway?

Jan

