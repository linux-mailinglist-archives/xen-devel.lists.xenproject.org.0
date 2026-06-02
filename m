Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIJdA83NHmpJVQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A462E0ED
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:34:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SVuuAidJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324922.1590431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOJu-00042Y-RJ; Tue, 02 Jun 2026 12:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324922.1590431; Tue, 02 Jun 2026 12:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOJu-00040P-Oa; Tue, 02 Jun 2026 12:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1324922;
 Tue, 02 Jun 2026 12:34:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOJt-00040J-N7
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:34:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOJs-003dD2-9h
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:34:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecdb6-bab6-0a2a0a5309dd-0a2a4501e892-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:34:08 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecdbf-c1f2-0a2a45010019-d1558032c885-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:34:07 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so19132405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:34:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354bb62sm31560900f8f.19.2026.06.02.05.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:34:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1780403647; x=1781008447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XxRAOdqncPw7XcxaRahzadj5xAHP7JVO+s9v1bLI3SY=;
        b=SVuuAidJhdcdNjXLI6t3MnT9Mp8GTA3jcVMYQr4in41oleJcJC4CNRN62Lzgwrrdio
         4M+06n98KgedqNMvOof6xhGJ3hP9c6//hT00jRkhgdfuV/rL23uHfrv6UvHsrPJcJWtj
         I2UFSwITc9aP7QZqeIE5q9d7sMoDUmurKaG6ILg5v8SVBSlkkcwCsaa8aFHDhKJ3cT7x
         ql+yJtU6aqBZ3FG0toIj5VlLTJucpqHWegeIg5bN6SC00xL1IP4oYAgjs6vXKV6gFQWn
         TN9hPFb5t3/3pH3MbpT8gYl+rJ3nKgSxlscvyJx+VNfVVmZ9A/fxoQeUY4Zk/h7xpQkU
         omsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403647; x=1781008447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxRAOdqncPw7XcxaRahzadj5xAHP7JVO+s9v1bLI3SY=;
        b=kQlE47w7+AhbeTGGlkzJAOnCEZqvxi2a2QvBg6d4DTtfr90f932JHMHtaegL3V6iu7
         LHEfoSHzYxC2vDXJ2bypKoGPDnmWku8UTNSKSqZ6zqh9dyx0no7y3xPmiH2WFAuPsegW
         o16iylClQNJWRML2JRoN5jL26UuARxOtbMLxHvLawJtSmHkQrNcUyHYZe3k6VuOZf4kw
         AECH7gyQfP5Z90lwnXcHR0hc4r6oTwH8zlUnv8uKoPTRgzcMHuxZpNoqKKIkesgkQUhk
         a4wbV3a/92seAUEYB5ZkBsJxSK1TxgNiwPB1ap1qwoRulkuiXp2AUQKyiuiVb7REEx3x
         ez8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+a4TTFBIZKK5wC3K5HsbM0iTbwuBPgoj2tUaIaSiMoNM396R0vy+cOeX6TFVM/PhnKGdY1978CSks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUkDjPgYoyDrrcbM5J38ECFJuA26NsLWmNF5nuiw9lWW7RgZvW
	+UbbeQaXox7E5S0n18FBhhE/jMRCkVH4D3I1FhLYKfyf61Z2p67d/ilt8zxZLbALuXneNwSIemS
	Hlfk=
X-Gm-Gg: Acq92OG0iWvquormFaz+LzINcey9V7mziw7kSrmNzVK1ZTHngNcarNi4GMzbiSPxoDQ
	h0MrDlgI8bXMfH9AdXlzOFpFl/+dT3FFC8iIgvvaPpfIZifF7lASGj9uTaVVG3LytOzUrpDiEr/
	vEmZfcKKZgnFgVP2OXaT0/1ogc+LG3ErqFo5ggS6R7lVfxSUI38l4WdzPnI1COn6eD9Nz+uZpch
	k1Iq8XxyJYM3wK3cAdWMGYR3N8Zjn8xqcKRJLaUsItz+NPO/YYyFUHI1ea0fI1oRKRUmiI0hZcT
	LZDuuB7K6FWQsd5iCBT64L6WDNwhROJXzma/J8ne7hOPcmgCqsQsAyrfqHFVTVfQYQgVlPg9ec2
	8JLfjKhkgjinWAxBfJ6STtlSTu1WjUXpHWim+CenPn7gKoiM74m7/quMIC9qSiTbNl/bt3xVym8
	1GSLmLGhK+iKj7bral1l+hr/68sYZ9TaYThyw/quSyxi5T0IhkPpsQnqRaijIaQZVat5eTUBP1s
	BDQYbxrEf1t++HCzx467nsvwQ==
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490a293b7c1mr219476425e9.27.1780403647145;
        Tue, 02 Jun 2026 05:34:07 -0700 (PDT)
Message-ID: <979ceb84-f254-4cbf-a33c-8d4557a12b11@suse.com>
Date: Tue, 2 Jun 2026 14:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Use blexit() instead of BUG_ON() in read_file()
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260602122441.2961974-1-accek@invisiblethingslab.com>
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
In-Reply-To: <20260602122441.2961974-1-accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780403647-AD1ADFF4-61F6180D/0/0
X-purgate-type: clean
X-purgate-size: 833
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,invisiblethingslab.com:email,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 635A462E0ED

On 02.06.2026 14:24, Szymon Acedański wrote:
> Follow-up to 880e40b187aa ("xen/efi: Fix boot from a device without
> a file system"), which added a BUG_ON() guard in read_file().
> 
> But as Jan pointed out, before ExitBootServices BUG_ON()
> is not functional. It results in a hang with no message.
> 
> On the other hand blexit() prints a message and returns back
> to the bootloader.
> 
> Link: https://lore.kernel.org/xen-devel/bb0f007e-697e-4501-97ea-3b59cf494ec6@suse.com/T/#m4725c8cbc0946a5533aea03fc240267ef139648d

While Linux uses Link:, as per sending-patches.pandoc we don't. It wants
to be Reported-by: instead, and there wants to be a Fixes: tag.

> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>

With the above properly sorted:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

