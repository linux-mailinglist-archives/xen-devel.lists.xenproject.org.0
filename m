Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEUeAQ6Dy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:17:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D0365F8F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268636.1557870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UHX-0004AG-Tk; Tue, 31 Mar 2026 08:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268636.1557870; Tue, 31 Mar 2026 08:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UHX-00047l-QW; Tue, 31 Mar 2026 08:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1268636;
 Tue, 31 Mar 2026 08:17:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UHW-00047Z-Ef
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UHV-006T45-87
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:17:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb82f4-5cb7-0a2a0a5109dd-0a2a450aaf6e-38
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:17:01 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb82f9-1772-0a2a450a0019-d155802be4f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:16:58 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-487012ce896so33126885e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:16:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a5e2sm20711285e9.1.2026.03.31.01.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:16:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1774945017; x=1775549817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PBJwQ5MiKBkB9o5MYJymYZf0Y7+6mxEfCq+WAoPQ3hc=;
        b=PKQ8MgKV2Pt9TVQJi6CqJwyeK0CVifHLoN7OY37bHH/wHq8+HEdOSiL3xS/r/0YR/S
         Z3/VLwp7K59Vq8ipFctET1nBV6c6LdHErC7B2Xwe8WrxGExRAh+Co3Xq64f0DW29m47c
         FNJ1C5xMiRuK49h945oiDaZuBEddvWeRGV371jWppFOXUPeyFgfkJC2YlpOxpStcUh1p
         I7I7ziedeJe79R+7RyxfZMwgcv8QiJPS8QoX8POB6fdL6+fNsCZMwiOa2iMFNLg+H+Lj
         Va1OREJmvdjZ03fyHXzZ69uYZdFdem/A5cuc4Ni0LWcgf3MxdXEkE8PlZjbR+Wt5iB5x
         +DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945017; x=1775549817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBJwQ5MiKBkB9o5MYJymYZf0Y7+6mxEfCq+WAoPQ3hc=;
        b=Ic5NWeBch5uu/SrK9ijY5y9I/L3CRxhhbFERlhoZgF2s4vvGexS/LEVfGFjGJDHgza
         hFACW7eF2A0Djbt6PuathKCky3DGO/uCaG2Z3uyLv5N/OlxHaCxfH8q4hzF14rd4z5XI
         EKPxQwmpSQIAn8MbcJDfPzlkwo7kfcUGNUjfZ4Fv1w67C6KnKlYt+Y5E+vnGnjiyPkhP
         B6Yu/f1gGyOYYNodmyhzj7XioQCmTYo2DTdPwTBZw9+mRuW/dKQaDuZL6v234oiWSze4
         zCSQxeRu9/lnwIJDCGJ5pDLJ13Otn/6Clpb+F5rYD0zbWKUCThVBQA2/V+lJL4H1f3pa
         nogQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP2bGwgzBWHltctSS+G9um2aPvhCl7moMIoYLyxYYk2V80LYDYPcz0k6iYeSnCd6rW+w4/A+Izet0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsoUXOdYAG3HpPF+YIQyPmnmY9niJJxEy8Sb+q9jKmqwLSIkOZ
	H94qIpVynvyOcFd6X72GffeZrKWHkJUzo0cO75L9c0zjmgayuGd+raFqq+lRPqRnbA==
X-Gm-Gg: ATEYQzx3PQRenu070jGubm8TRy1LeJ8VUlG2V6aty6cotoxw+8x0S4J4vGV86h94kh1
	+jwuETtqDeZwMh3V/BQ3NvqvbfI7r0svgjEj8lzRvasPnr6dSwapwn+6400Uf6V1hD0qfTxf1D6
	+bTYm/GKNqAUUaLElhWXYWFj3gwrmSGd+v6Xj9oJaQF7sQSqSY1Rq4a2k7Lp6ci9Q1UKYyDOS80
	C5BduI35vQky8vph1I1L+PnECj3++0raAP/yQDZsIDW56se9v6Yt7U1/YILT2msR6j5dizp5o5W
	ixV1VhY31S9pznmhcCp8IYVhgPHzrITtZiB4PvEZ+aR8xY36zKTaTxSljUqMZq6Q0hSa/OI829i
	HpVLqL3lGDHsql0WndzvRac3EmR9ofD56xGl3YWC3k4a3K41TvgiqR1mGQeX7kAkvj/EHmF2nb6
	uMrIjD7YKIAni7AD/FodP6Nz4M72gUpz0fBSWnUjrBd0srgcb6CLbpMalzeB2khEeyKkQ2ZIrT6
	kcP14tqg+YX82c0FHfIllZTJg==
X-Received: by 2002:a05:600c:1f11:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-48727d5a31emr281094895e9.7.1774945017440;
        Tue, 31 Mar 2026 01:16:57 -0700 (PDT)
Message-ID: <10bc1904-06e6-4656-bfbd-e8e0f429dc4c@suse.com>
Date: Tue, 31 Mar 2026 10:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
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
In-Reply-To: <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774945018-BCA83900-C8CCB659/0/0
X-purgate-type: clean
X-purgate-size: 1097
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 688D0365F8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 03:52, Milan Djokic wrote:
> @@ -550,6 +551,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    /* Check config structure padding */
> +    if ( config->arch.pad )
> +    {
> +        dprintk(XENLOG_INFO,
> +            "Invalid input config, padding must be zero\n");

Nit (since I had to look here): Bad indentation. In fact there's no reason
to wrap the statement in the first place.

> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>  	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>  	  translation table format and is able to use CPU's P2M table as is.
>  
> +config ARM_VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	help
> +	 Support virtual IOMMU infrastructure to implement vIOMMU.

Nit: Bad indentation. Kconfig help text is to be indented by a hard tab and
two blanks. (Sorry, should have noticed already on the earlier version.)

Jan

