Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwcUOBu4IWq4MQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 19:38:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3764258C
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 19:38:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VVmaNpge;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1328323.1592851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVC0b-0006vq-Py; Thu, 04 Jun 2026 17:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328323.1592851; Thu, 04 Jun 2026 17:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVC0b-0006tj-NG; Thu, 04 Jun 2026 17:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1328323;
 Thu, 04 Jun 2026 17:37:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVC0a-0006td-3e
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:37:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVC0Z-00AsAf-GU
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 19:37:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a21b7ce-2eae-0a2a0a5409dd-0a2a4507e370-26
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 19:37:31 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a21b7da-229c-0a2a45070019-d155802ad877-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 19:37:30 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b9318997so7531015e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 10:37:30 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:308e:3155:8a4b:4216:92be?
 (p200300cab70d308e31558a4b421692be.dip0.t-ipconnect.de.
 [2003:ca:b70d:308e:3155:8a4b:4216:92be])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm18347851f8f.33.2026.06.04.10.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 10:37:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1780594650; x=1781199450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MdP50khVa6wThE2mHxlZaqZqL9TAV0Eh8bSJD0Kp4JQ=;
        b=VVmaNpgeP+zBNrXrd3GXOd5uNOzGz+VqQphQ5KCZQVo5jhdIHfbd70mDgp2cKjiTc7
         /kkC7q9fLbmsG3+isyU5HUmSdV62x77F6Y8SHq1g77njARRMbQkJueXBnUygR4qKImn5
         irnQbqh6sU3aApoFak0e+NqaoaeFnE3t3blRr5Cb4Dr+D517ezyG6lITXaofx24ZhOPO
         Lvl/zpSPpiqHQSyVB9cJfrhGAIzQkaIUaVaG3zMKrO3IDA5MlAO//i+THVa8nt+Psvfr
         2iomklw89YAfarDxP0A/j5/tW2pZE7XZuGtcqX52AQU3J/Mlac0ICRsO3pMs1g3MAK50
         c9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594650; x=1781199450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdP50khVa6wThE2mHxlZaqZqL9TAV0Eh8bSJD0Kp4JQ=;
        b=mDC763IEzUJFCVih+58EDnCb4seUbHZjmQmRU9UaJKwYt8FuiSixC1Ip2R8MZt8P9I
         JxouHiyp6a/9LSL8YPgfebXzQNCQMyv4vx0P1RnOnI+h8LEUKzIfVPKJE7hW5U0HRoCu
         psslXhl869mA0p00w+CU2OoBQo7PbCnEFDTll8dOfBe6y2TEU3/6YOw20qZ7Mi5GLnfF
         yx+X5Ai8KjbkgXJomzW+cJ8c7pwnRe9KoCbLo4VRLO5JRmh+vQt7L76Gr+he2OaOuEdw
         CiWFXkrQCBud3OWlojeIe/1EwkgAT2Ja6tQMB/O/ZmOUV641WZiRWdMT0wx2vCek7hyG
         apNg==
X-Forwarded-Encrypted: i=1; AFNElJ/p3GcugAT+c7Ahi1LPhm1aJUeLjvv0Ai3FtUQfrcfYbjw1tl0XNVt+5/6P6BjYhf2OZY9Ka+4ybS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoxZnpHin6CpY4MEGA51ixZA69BDhNnXAXtGArcB3YHvD3YOz1
	6pk3jbfusbZeGYC6fWfdALjv1Q87PzmDRwCWP/x3zakwxROTuqXtEyweJhmiVq6XCw==
X-Gm-Gg: Acq92OH+em/TKPwncttVteo31sQx/UawrOPiKzdD7EcJMMxj1aZrcVfPTko7Kv6R2cS
	PSZYjy/CzooPLHZvQyRupobWxihnWv3g4rbNE5rOWmSGYL6Dwvzc73UPOlBuJZa/M474CyiKk19
	SKXFYzagFuXHmcthWR/xsYPtD43WloCIWCo68K7Ueu54jRLx4wWA+c2qrSI5RMHRGX3NmjIGJcf
	5s1W/ydLJbEsWmv/jDpPFrYu4sqjC38ixdsQ1DESBtAP4miHuRuaPSoU6qRkKu3+q9ve9/tXjrG
	2cufQFEXerzxwq+l4wKeOPBUn/d0l10trdEMOHOIydkhmT83hDtrlDi7oNomJtbwOT+0oh4KRiQ
	+bT45po5zKnS56VN9rQa94V9dlwlm6hJMhNFD3OY77TT5noTMpHnvH5YjdwtlOkKs9fyciAfSE1
	sVxlKvg04ct+Ajv0ZJgBR1bKoiv03qGmxlmYTqitX+TeRUlubW4yVyKMifoo0gUKVY7nFvJ2S/M
	a0LpOpVjNWjUw5qRdgwlUZI6u1h47+IS7kOUu2f9oFabpOrlZduh2PSOEDuEg1t9Aj5+pM=
X-Received: by 2002:a05:600c:458b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490b5fda3c3mr160175635e9.23.1780594650203;
        Thu, 04 Jun 2026 10:37:30 -0700 (PDT)
Message-ID: <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
Date: Thu, 4 Jun 2026 19:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] argo: introduce CONFIG_ARGO_DEBUG
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-6-dmukhin@ford.com>
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
In-Reply-To: <20260603194131.1468654-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780594651-23F7EC48-A832AA0C/0/0
X-purgate-type: clean
X-purgate-size: 1039
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EA3764258C

On 03.06.2026 21:41, dmukhin@ford.com wrote:
> Add Kconfig knob to enable traces for Argo debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - fixed dependency on a new Kconfig knob on ARGO
> 
> Changes since v3:
> - dropped uneeded "If unsure, say N." from new Kconfig description
> ---
>  xen/common/Kconfig | 6 ++++++
>  xen/common/argo.c  | 3 +--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5ff71480eebe..7676a78dca71 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -491,6 +491,12 @@ config ARGO
>  
>  	  If unsure, say N.
>  
> +config ARGO_DEBUG
> +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO

Why is the "if ARGO" still there? That's fully redundant with ...

> +	depends on ARGO

... this. I said the v4 issue could be fixed while committing. Now you've
posted another version (adding to overall mail volume) and an adjustment
still needs doing.

Jan

