Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hTdzLP3EHmqoUwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:56:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24762DC0F
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:56:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=a5CI56rG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324817.1590332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNjU-0000sq-JL; Tue, 02 Jun 2026 11:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324817.1590332; Tue, 02 Jun 2026 11:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNjU-0000qz-G0; Tue, 02 Jun 2026 11:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1324817;
 Tue, 02 Jun 2026 11:56:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNjT-0000qt-43
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:56:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNjS-0038Fx-Cs
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:56:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec4e5-2eae-0a2a0a5409dd-0a2a4503d1ca-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:56:30 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec4ee-672d-0a2a45030019-d155dd30f053-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:56:30 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so3833175f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:56:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef357635fsm31283139f8f.33.2026.06.02.04.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:56:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1780401390; x=1781006190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u7d5hoaTT5kCZriGDUOrVhon70o0KtUYRMLLHyMVi90=;
        b=a5CI56rGTQlBcjfBhSKyOz2JAjDcLllxdJljBLUFn8jjFEXaKxIwKTZXpQbLFV/tE3
         iqcsP7JfEL6rTz6aQA+QNW98RV6MDKCZ3Q0Hqv1CsnTJBVtBA+Pk2tBzh2uMfSNC4aVI
         10oJfclmudhu+VYPgY+SouDolygAtc3CKcWAJb0j5g9QYfNZqI78RphGydDJO+65ZFMp
         CIaOW5Xon4iDbaiv1wqpg/vWhvuhkF6HTBDu+cSClc8R8L0CRBxwV6D49i4x3p5zpAdg
         kUzOcztlcbfKlEOfABrd1LbGjgt/a94gJehQ5yuBhdVz0AzYlF7gLNtd2pRwKm+yFxjK
         ngpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401390; x=1781006190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7d5hoaTT5kCZriGDUOrVhon70o0KtUYRMLLHyMVi90=;
        b=jMabS9nm0xARMktL2kKKte8pe7e145VCUhRqXA3gnUJyZL0GUqkUs6/g6k0pIH40dR
         kMac35zMfOEisPPuAQeQL8zYOaxkEqiUb/8R/HyBgulEFGffp/VC7Zwg3EkdSryKuphI
         c+K19YbHscDJP9nGijlSE8kB8Vik11JeIERBqACb67J0m0MR5ggsXknOYpguz5kz0F7Y
         JgiwoHgm1SEYqphFmRq1pujYpCTyMiyGkvZb03Vg53KB3G5XT3LJEyGpLLzqKo/lYL7B
         UrBsf1BOjbkj99z5wqlVH2bV23i7a0uZyVL2upOdV4yf+t2qYX0FEaGzCt+2lBvpuicv
         qJyg==
X-Forwarded-Encrypted: i=1; AFNElJ8PX7wyIwIKxG7No/r/wz2GnV5YrezEMqVCSXT7mJNRtMtJPj398mET2XtrgvLhHOAgXfifEHn7Tkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMcf4SScCDdNnRzKJDkcAjRphKZ5FMvhnzrykksf4T/iI1pUmI
	2wLIf0FTMEUiF5DU0jwu0SMIxYwa0goyQrMYKu4pLOqFMcITPARxQjbN8Qax0+s5Cg==
X-Gm-Gg: Acq92OFfCBUl4B6wSaA58Bj9aMsCftUTYmstatqqvWCHwlxcP6hkGyyhGor6f2OqbOM
	i2YPiRbO0fb5LremKK356oq6vsV02oFS7p2tRAbytW5CzkaNQAQ5gtB8ndaBACzsHLx0OS3xdiW
	0CO3A29XKVbzAZ8wp8vNtMlmwapeUiFTZgs8Dz6OXI9ToghH0BBeSno1N3yrClxjyr5UmwWClhU
	MW7VFhy1WrCmnYFskSbPV6/KoehvJoQ56/g5OqACC2Ml9lyHGs/X/bt4Qr1kiEMAQp3YYrfo3Ka
	Xhpn3BffnKFyvikCwGRWOt8HpXmC8FykLSkkNhQDjrhehGhyEk3cvjVqd0WWWA98hzC7hzaX3zC
	k7qD+Lhd9UVL67fyZEhNFHQ94pldA3IV5oj0mp2zkDB9umnM0HIsU9QViSe7WdYGTPdopWmv+oe
	jGuXiP1TZLYjGi5dkp611FS1EPAiabS3ERH/9/+2qIPivvpMlLa6e03CwiumRduFZ0+tEGp6ue6
	/HJ8CZXYzzHAkLnC0n2GurOiVBzjFGsRaOx
X-Received: by 2002:adf:e684:0:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-45ef6b8f12cmr5668763f8f.35.1780401389649;
        Tue, 02 Jun 2026 04:56:29 -0700 (PDT)
Message-ID: <b9b9a4bc-ac55-47b9-8d05-17ad6d44ef73@suse.com>
Date: Tue, 2 Jun 2026 13:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG
To: dmukhin@ford.com, sstabellini@kernel.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, christopher.w.clark@gmail.com,
 dpsmith@apertussolutions.com, xen-devel@lists.xenproject.org
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-6-dmukhin@ford.com>
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
In-Reply-To: <20260526215823.1452619-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780401390-41595938-BEE67379/0/0
X-purgate-type: clean
X-purgate-size: 494
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,xen.org,amd.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D24762DC0F

On 26.05.2026 23:58, dmukhin@ford.com wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -491,6 +491,13 @@ config ARGO
>  
>  	  If unsure, say N.
>  
> +config ARGO_DEBUG
> +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> +	help
> +	  Enables extra debug traces for Argo debugging.
> +
> +	  If unsure, say N.

I thought we had agreed to no longer add this kind of sentence. The
default (implicit here) is what people should pick when "unsure".

Jan

