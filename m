Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZmzAI7MTGqxpwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 11:53:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40370719FDA
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 11:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CIa70EUT;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356137.1610790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2TW-0008Cu-9s; Tue, 07 Jul 2026 09:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356137.1610790; Tue, 07 Jul 2026 09:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2TW-0008AR-6w; Tue, 07 Jul 2026 09:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1356137;
 Tue, 07 Jul 2026 09:52:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh2TV-0008AL-8H
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 09:52:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh2TU-005ZAh-HN
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 11:52:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ccc50-5cb7-0a2a0a5109dd-0a2a4501a742-6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 11:52:20 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ccc54-400f-0a2a45010019-d155dd2ddd2a-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 11:52:20 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso3839360f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 02:52:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm35066734f8f.1.2026.07.07.02.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:52:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1783417940; x=1784022740; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+j0vE0cfENYoGHL2s5VYtAE87n8Wp8Kq+hbXHrdLLyM=;
        b=CIa70EUTJTkWQt5jhRBmDc4zwAz7oPZKwTN3rNLAw/ORBhU+T3UlSMlLbIZ8PRdWn3
         UoxyQIK3pW//3WTTXH3/VWDTAGJm3i09YiccyiFedM/VXvR06BabJpUMdCAGJMa1PAeU
         003EwN1kvTP7IO1M+JhqmpnKZ7fIZNntSVuQDcplSU+ECnLosxFF84kOoSKrGL8hAnd0
         URnyAvyd7leT0A8tpGjFhbVbLLD+I08ciCdHYoaUFE6rqoSdkzrVXRN0rZ9GFqQ1jFKM
         avprSR7W+ZuDGTcm67rcDFAM/otAJdj0keOrurhgaY8iBfkGIIAH+Qy9eHtmXPfO+U+M
         Ge8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417940; x=1784022740;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+j0vE0cfENYoGHL2s5VYtAE87n8Wp8Kq+hbXHrdLLyM=;
        b=L5rjJjrDr/FajJfvd3ZEfch5bLvveBX+qprKpcervl3FHHgJ/LdMDEX7COqF3GcOUP
         G9uI5MIU+f2IjcgIdMkXombA7FZjM2RhK2wjZn7ibI7FbMereZXpLMnxrxPZEC6Smr05
         20uEhGV9i9Z72cUtmwqFWmpm2WknKbdJtAZz3/GAgb8U27agyWXaR+5IFvDlsb8mSKEE
         4iRj56ynqh/6qiJbJLHyEuyY8uTwc/sqz4SB3Q8b4BVrqhZhZ+3Oh6zLVYYDeN4DGYck
         EjBBI/ux+kDIRDu7BlgnYfEeRyFHA8AuX1Yi55BAfaoTzNnk4XujRAztiIh4U5+CZjK0
         fciA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9vaDMLk5ILsKlff83OJwBQWYzbIt2cf42VWNkNj2xXhIxOGaqhSFe25OL157OE0CTcuEzy3QFv4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygIBERiCwWnXQq9bXyo/WH9I5stsDEYfu8ZkG70DmAdzzT0FEl
	wXRAbxVx+0JxUc5Y27kzbOZ376gef58Pp9r6vDPYwBtNpLBue30xlOV2u7VQ5av2qA==
X-Gm-Gg: AfdE7cmKXEXgZDy4L0Sc3hpm5Hw5MYXTTygwtgG6BQx1hZ5YvCM9rA5znF3yf0A+KQA
	aOWFx0qBzvv2ZnvzdY09GCHUXzgdzNvPqZ+Kz49CxHSvLFndYzQLbVrf6gMxH1TTLw7N0Iidckx
	z/cpuy+zrYooChBQXOSfZ1IecIUMbl7T/QQtM2kajM404SqG6v1gMfYbWvKftUA77Jpt3zRSkQc
	Xelb+2SnIrvj3QsYioCPMWAh92jBBRP+2Kh8ZfNPmgqD2YMM3WJT6P1E2YrtFYBYLIfO+/JcU7h
	u7isEmhX0DxFG1FRFsF/Nqk1EChRGTsrciXaCqqGCLfkyLx+CDrieDSDXhIRiD0UIFBsBGvHWcC
	gBps80nUyQIKG3Og2rWpygMWf9XTd3VhaapzUospLWdpHEsOG1N2GlDdjyiw1n1XMLv2rJXBkJR
	DLpuGTFTG5eCVMP0+u4E0Q53f0VBpk1LBiaGBwsXyPN8xCfHBQh9ycXm+ro8+LpNIliFJw8tHZA
	hhp
X-Received: by 2002:a5d:6541:0:b0:478:3cb6:cc7f with SMTP id ffacd0b85a97d-47de66e3b45mr3676477f8f.54.1783417939745;
        Tue, 07 Jul 2026 02:52:19 -0700 (PDT)
Message-ID: <04360a50-4ed9-4d65-ace4-deb302bb2c28@suse.com>
Date: Tue, 7 Jul 2026 11:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/26] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <39f6e7414696acad4a1257afaf067a832b165cc4.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <39f6e7414696acad4a1257afaf067a832b165cc4.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783417940-D12D81E0-106FC8DF/0/0
X-purgate-type: clean
X-purgate-size: 788
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40370719FDA

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -22,6 +22,7 @@ config ARM
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_SHARED_INFO
>  	select HAS_STACK_PROTECTOR
> +	select HAS_STATIC_MEMORY
>  	select HAS_UBSAN

Both here and ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
>  config HAS_SHARED_INFO
>  	bool
>  
> +config HAS_STATIC_MEMORY
> +	bool
> +

... here it is clearly visible from context that this patch is assumed
to go on top of "xen: introduce CONFIG_HAS_SHARED_INFO for archs without
a shared page", yet that's not said anywhere. Perhaps that other patch
would better have been part of this series?

Jan

