Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMhiJIzET2ploAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:55:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E27332DE
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LlGTyUCJ;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358310.1612502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr6D-0006WB-4U; Thu, 09 Jul 2026 15:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358310.1612502; Thu, 09 Jul 2026 15:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr6D-0006Ti-0i; Thu, 09 Jul 2026 15:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1358310;
 Thu, 09 Jul 2026 15:55:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whr6B-0006Tc-Py
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:55:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whr6A-0047kb-GY
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:55:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc465-5cb7-0a2a0a5109dd-0a2a450bd978-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:55:38 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc47a-b7da-0a2a450b0019-d155dd2fedf8-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:55:38 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so44779f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:55:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm52536411f8f.27.2026.07.09.08.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 08:55:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1783612538; x=1784217338; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8xWBnkSePbziAQkgHTv0FserXOdVKtuK+1JM5O/GXI=;
        b=LlGTyUCJjOrw8UI8quW+NURhebPoGFlNFW5bQn7YbYLhy20bo09/6GxbgSE2Ae3+Qa
         zUcvVNgD0FG6UbhtsJJ5Sf2EQMxeWwfmBC4aIlPDrarEZdsKPLcysuqEfNhMZvx7cFqp
         j5YEBPZO7SCCCUjt3n1D/ZgSBV/wMA6yMcgz7RpC7fP4ADt+vOUDJzFJYwuZnMrzVHso
         dEJ+c50kqkVioly87ruCTwOKI/0HI+9gW/S6TbEaOfYnXxC9y1L2F9QRVJBj4uiDeiQg
         nWNVyCVA6eTaDwQQ59s1N482/dudhR18AC2/wWa1x9YnEo46qG4aEmFfPMdwtc84lKWD
         dacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612538; x=1784217338;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8xWBnkSePbziAQkgHTv0FserXOdVKtuK+1JM5O/GXI=;
        b=rfnBS3jQ9d4e0Glzvjgq1rSO2zAsyq0QCMm8afayNG/4m3Pzt+N28zj8V6u+YfFECH
         WUQDisKD7CDItw7CORDuEeRD7O++tK3XjG2YO/LQS6KmI1PFZI1FmngB3ddgIwUTyG3q
         1DcYiN7BiM8eVVWDn3q3zH0GQwWnEx/30/3eNiGV+FXBrNRmWI3rjlK4ffrGaCh6xZ8c
         ageAiHI3eDvPFEvzuJAUMdJl7Aa8Eh0x/FCSVcthWk/PcDtXqdgMPY8rIM0k02pfb2Tu
         NCb9I43vuSQM1DLp8QUgv9zfx7dETa9FVnnRF29tj83AYoOU6K29O6nYoi+5TaroP82b
         XWSg==
X-Forwarded-Encrypted: i=1; AHgh+RoXWOK4ugDJ/zigvax60DriGeg7HKVwC/c4//hWSR3QucMcl5GBhMSFpgdi913hYvZXDV+eB5FvTt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZtwRqnkRFOicI1h5tWXxk88Ky9lekdKPr8aXPda942+NUtQSJ
	H+GsRnIzqjMmOwbAPQokZVCdd/kLkRUTcvkzscRSxjOfHfourtVHMPysV2FncwqDTA==
X-Gm-Gg: AfdE7cnfggcEopfW2js82slGasdX3Tmhn7VxhuFR5XVlUiCTDrzLko5SQP9LpHjdO26
	yYuS7yamvKyh7g3ylsp/3G+ivil1sB8jFm881XmOi1hxDXJZIR/5wcgYSA8sLSKE0UqG+YonF6t
	QSOAXBea/Fff5XKbu2+bfWmFUH9Tv1pJ6JO5/o0yVIzYyNSlV7mlf0r/BWRjLPCKOvRG1cogtxu
	TiBeorHIjDbQ5VF9KlXcmIL1rGPUHbJQItufHVYhB23Ssxa8hTwhFn8ENTdgUut84Bxg6WmfQs/
	1DC7TnM4yC8+NiIwEJMTlnrt5aDv+12OM28VUNmevh9ITZGaJfWj71Ki2CwdJiqjCVgEm4qYVnC
	7lMGL01uO+P20dW7YyUX2mtH5Sbt0mZX5wb0E0AHRqmYp2ayp+pl1gsIul1l5C1eUPjjWYE9nGj
	hjAj4l3EUHiKwxv0MnKgGC8uTcSvlRIuX2rk5mPkYJGW+FrkjP/dtow/EqFvLQDx736t3vJYPWK
	PRF
X-Received: by 2002:a05:6000:26cd:b0:461:a16c:a5f4 with SMTP id ffacd0b85a97d-47df075bfbemr8452936f8f.33.1783612537798;
        Thu, 09 Jul 2026 08:55:37 -0700 (PDT)
Message-ID: <7e6916cb-52a8-4397-ad0e-b08bc18409c5@suse.com>
Date: Thu, 9 Jul 2026 17:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/26] xen/riscv: create APLIC DT node for guest
 domains
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
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <c05403d44a8c98eef2b7e399672158b40ff4a2fe.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c05403d44a8c98eef2b7e399672158b40ff4a2fe.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783612538-4937C9ED-C4BA1C1D/0/0
X-purgate-type: clean
X-purgate-size: 855
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: DE7E27332DE

On 06.07.2026 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -34,4 +34,18 @@ struct aplic_priv {
>      const struct imsic_config *imsic_cfg;
>  };
>  
> +/*
> + * Value is inspired by what QEMU is using for riscv,num-sources property for
> + * APLIC node.
> + */
> +#define GUEST_APLIC_MAX_SOURCES 96
> +
> +/*
> + * Specifies the number of wired interrupt sources supported by guest APLIC
> + * domain.
> + * Could be limited by host interrupt controller and is identical for every
> + * domain.
> + */
> +extern unsigned int guest_num_sources;

If I saw this identifier in use somewhere, I wouldn't know at all what kind of
sources this is about. Insert "aplic" or some other suitable infix?

Otherwise comments on the previous patch look to also apply here.

Jan

