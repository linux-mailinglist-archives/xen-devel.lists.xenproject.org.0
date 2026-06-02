Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PLaF4alHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:42:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6262BBFF
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324665.1590149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULdP-0006Y8-Pl; Tue, 02 Jun 2026 09:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324665.1590149; Tue, 02 Jun 2026 09:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULdP-0006Wi-Ms; Tue, 02 Jun 2026 09:42:07 +0000
Received: by outflank-mailman (input) for mailman id 1324665;
 Tue, 02 Jun 2026 09:42:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULdO-0006Vq-HR
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:42:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULdN-00326T-N0
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:42:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea568-5cb7-0a2a0a5109dd-0a2a45019ef8-22
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:42:05 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea56d-c1f2-0a2a45010019-d155802be9a3-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:42:05 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so8421725e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:42:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12f4d0sm100338275e9.34.2026.06.02.02.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 02:42:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1780393325; x=1780998125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sQUBr7gLcSE861t7//OdqYC4g9shYop6EeNwy4Ywyeo=;
        b=dsvuvAr/lGW7InDm+n44pHVTmNJVyStTqRPLJm1bsMD6h6rjpmWTuHqr6B3pVbOXFO
         WMLv0cfNKm0MaDLh819IXnXK/oVLsgmLAmzf0SGSNrFOIA6iiNuoWD5LPRnoe5Z7jAcf
         iT2W5qfJHeSIBnaNYYAv1rEjlLddAceFwMwsQNKmUXvfkBndvzrsKj3sI6lcHd3zPdOX
         47l8ama2PXMiyYHFXUg7dtmSa7rR0dme2kkzdihE1YfMvL0aQXamdpmrTTt/xBukTi2D
         HOLn8r/5Bohp7H7XBXobVs7wo4kRsXB/+lo/zWdtnxq8roIXao9Bvk1kRnhoQjx9RnvZ
         U4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393325; x=1780998125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQUBr7gLcSE861t7//OdqYC4g9shYop6EeNwy4Ywyeo=;
        b=gy8wd6afQ79W5DaDfATOVf7iRXDZoPY32klGvve2HkfHEaqnByuDPEjqvBdpj5bfSt
         AjrpayUjlfVVRw2ZzDAu3xFN9QPfyT2PLN2fA43Z42foceYZjsQIr+YAHqQBPIAzaL/r
         kTfPg6l+83Vrxa+2W0P+TLHTbDnmpoS6gRl2cHg9WHYzDZVsGtMJS6u/oPAUALcNnb9U
         1gnyhoEnwq5+DrKWcJUPCCTjhEN6cN9o0KXe/SYmltwzeFFh7+v473qXJdT6xsBVq3nG
         IXIO257nH4u0VjsEDzmra9ymAAYOFgEMIkzaU0I7O3PZ2dhbD559KYpyiCKXkZMgGvrQ
         lAcg==
X-Forwarded-Encrypted: i=1; AFNElJ9v1wc7jjETNW1d5V5H5P9VlwCG3FCOiTszyKBIfEc3vwyxa95zOlYKKegd/KrTxJ4HBOeQM0wwIkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWRnkqjHwx0z9+6UPNxSJ5TdfJkOOx1zNAJEPxcjGa+JL6+E3x
	CVnlbfD5RIIkJQ6Qrh0aZgwTJWkyeNZvOBwdiZCHNVsbBub2ZkHWPa+NzUj0TN2d9A==
X-Gm-Gg: Acq92OH65PSwMBjiKYQeQwIoQBr+6qGdre1Ip41Pf6d9uej5jrZPipv+Cm96xkA1Nkv
	Zg+FD8PMWdb6VphyJ/0Ybpf1ChDfxpCQdQWr3i1A7rxc1RgaG6of9Mj8ObB3MpzI9+tMeTy2x2e
	Jy6Jx4AvAmzs2yGdIWqR0ywi9Hif5VBgH6UDFwPc+B4x0Zm4puKEghPtFCSzKzSaUf7m2NW2POV
	PPQCssrnoFm2AkSn1Dgb8bcXk1XciIO9izjSfl9u5+UXasbdvWZMPsg1cYXXfFaTFWoIBnHLUYv
	VtRKswcjUK58jnYOv9tQGxKxXtsFf/NKjkdgeYT8jddEj9HqaS8DMG7Tco7iyD0yMi3WFng53gt
	dZHxp7muiVQ/prwsElrna+YKQ8qD8YzRMwxL7Z+XkAMM8pz3AAoc4ZM/m0En4nWzkPHmlm+8h8t
	DkzCPRnadwkfiyYt3BIkNScW2kCV30FNT/VUncgLEwHv3k+TMBM+on/1Ep+zgj2l/MqTqA8km9h
	Jhru3iHEk3Cus86DP2gzo05+g==
X-Received: by 2002:a05:600c:3b10:b0:490:b0df:9ea8 with SMTP id 5b1f17b1804b1-490b0dfa594mr54241985e9.1.1780393324921;
        Tue, 02 Jun 2026 02:42:04 -0700 (PDT)
Message-ID: <accbb6c7-3681-41ae-a712-5f481bea9a5a@suse.com>
Date: Tue, 2 Jun 2026 11:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/24] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-4-taka@valinux.co.jp>
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
In-Reply-To: <20260531224755.9481-4-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1780393325-B474CFF4-A0B09E5A/0/0
X-purgate-type: clean
X-purgate-size: 642
X-Rspamd-Queue-Id: B7E6262BBFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 01.06.2026 00:47, Hirokazu Takahashi wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -99,6 +99,14 @@ config MPU
>  	  systems supporting EL2. (UNSUPPORTED)
>  endchoice
>  
> +config ARM_NUMA
> +	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED
> +    select DEVICE_TREE_NUMA

Nit: Indentation.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -188,6 +188,10 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config DEVICE_TREE_NUMA
> +	select NUMA
> +	bool

Nit: Can we have type ("bool") first, with "select" (or "depends on") coming
afterwards?

Jan

