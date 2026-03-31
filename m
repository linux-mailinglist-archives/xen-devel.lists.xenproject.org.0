Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNp/M82Dy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:20:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD6366015
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268659.1557887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UKc-0006Yb-LF; Tue, 31 Mar 2026 08:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268659.1557887; Tue, 31 Mar 2026 08:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UKc-0006Wq-Hw; Tue, 31 Mar 2026 08:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1268659;
 Tue, 31 Mar 2026 08:20:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UKb-0006Wk-Pf
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:20:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UKZ-00E9HZ-Jk
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:20:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb83bc-2eae-0a2a0a5409dd-0a2a4507edb6-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:20:13 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb83bc-fd74-0a2a45070019-d155dd31cd30-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:20:13 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso1304701f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:20:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e26basm23508817f8f.3.2026.03.31.01.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:20:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1774945212; x=1775550012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pTVostcTwWu2HMQOK1PA6hUPF5SvIUmBAPEMOzpII0I=;
        b=c8vKOROPzRmb906C4WVY1HQ4zmf5D3fsk7B91VBVz8PYy1FwzkMxxnzYYHYELpgzrD
         Ocz5tG3Xx0LqVYGUKg3OymJ07ByfhLd4019jq3SebKsZpi6jpuZL8mBsjmRX29QNpvgC
         VYeLNBuZ0seQjY+wHlxmxTA15nW8pw5ijngE0asshCc0F2iZoBa6KlcM8x9UWx9ng05W
         yFYyp/amou4v+cXi0YV7vEGsWQcDY6CwXjWS5bqr4beJXdAVeIgIiMp/Ao/BGb6QFMi+
         O8VVFoss01scIB8Q2imoRdUKpSEVvWiJI6OsJWMbrhb/mztsj8RZW2KrXMiXuFYWQIMa
         /K/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945212; x=1775550012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTVostcTwWu2HMQOK1PA6hUPF5SvIUmBAPEMOzpII0I=;
        b=Cv8be+08OzBvp0pojFKoEUAmCIrVK0jG6SCzPRuDKGTDqIkF703tOrw/OQHgMvopur
         rREcihZonFVT3BvMAUSA9dbj7djVXV+niFR/0WXtTi8doGqBy1QbkbFzBL9SYzcMNfhJ
         WvnQBJvAEXexvrIh/lNcwWPIlkUpECoe6E09FjdnIHNO8o+iNdn/c9bWSLla41eXh0CG
         e3FwfrMAHmqwcIN71Tt35xdaDpfwEAMHAXVq5K12FtkgHbT255Ck7kZEXQCCvZVcfryY
         dxMa3XyJww+D4R6PqPVlawF6FhKfI+Xrq7wjuslINz7TX8ZYsQ/CnVyP814FOVn0Qh7x
         z1PA==
X-Forwarded-Encrypted: i=1; AJvYcCW0TjkEWB+GRYEFCGBLz13aPz2SqjCujRMC+39vXH4BLIzwiG0m9V9h2XqsPZJsBAEuleN8C9Lui9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0vLEgQ8FG6Hoqua4lh42w6fRen3TPLOvsv97BUGACPMtVbjGB
	tBUfwSvyy94smx9LsOEzLbKy+aBXkXmbYerbhJFSLwLfnespYS+NUMxMJCHcXbvKYw==
X-Gm-Gg: ATEYQzzH/5citJf9Wcr10bz7Wzxih3ajY2DI+dGlaTK9lvm154hAFYJCsYcSbN7CG3T
	SnA2Rai1PIIfxcEdcgsALTuzRx96eXdUFi8LCWxGv0ZxI0Jz70GjX7sERk533rzgBr9AVqNwCdD
	ImYlJg4eJwfH0qUAiACre9aafB+58JB03oScZ3rwiuOXq4wnp/TK/AuAC759RoC7sWHGbYTD1Bi
	0t7SUcQVu6g2s9bxRc7jt8bFUDzEIgyBIx1/pShMQRMhKmi90j8TiR11AZEssfbTrFTCLc+9kZ9
	+cX87IXMr4G6Ul5fFnM9karYZeIjjnm4vrwej9H1sFRoImzMH42FWeV3GK4qNS8/MK0nhu8rcI0
	zt6oEK5ijWFRqs4dhZpLJZ+jzAww0uTs/ODi7dJH8np5Uso0i9enxM1CnWewp69KvhXzcOLqUsM
	Ublsx+s7yWD751jjYrZFkD5saL57d8dmi0KxHC1yojcxA8Q+dgn5ZsyzBc+9/sm6C1fXHCBWOkI
	D2RtqbJ9uTKZjs=
X-Received: by 2002:a05:6000:2003:b0:43d:127b:7e7e with SMTP id ffacd0b85a97d-43d127b81c6mr58001f8f.34.1774945212543;
        Tue, 31 Mar 2026 01:20:12 -0700 (PDT)
Message-ID: <dec4ddf0-833c-45d2-9aec-7a7b5ec94570@suse.com>
Date: Tue, 31 Mar 2026 10:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
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
In-Reply-To: <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774945213-572A9303-1D14C28B/0/0
X-purgate-type: clean
X-purgate-size: 839
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 41CD6366015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 03:52, Milan Djokic wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -312,6 +312,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>  #endif /* HAS_DEVICE_TREE_DISCOVERY */
>  
>  struct page_info;
> +struct iommu_guest_config;
>  
>  /*
>   * Any non-zero value returned from callbacks of this type will cause the
> @@ -387,6 +388,11 @@ struct iommu_ops {
>  #endif
>      /* Inhibit all interrupt generation, to be used at shutdown. */
>      void (*quiesce)(void);
> +
> +#ifdef CONFIG_ARM
> +    int (*attach_guest_config)(struct domain *d, u32 sid,

Nit: uint32_t please, provided a fixed-width type is actually warranted here
(see ./CODING_STYLE).

> +                               struct iommu_guest_config *cfg);

Pointer-to-const?

Jan

