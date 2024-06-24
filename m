Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B808A9151DE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746744.1153894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlTv-0006xd-SW; Mon, 24 Jun 2024 15:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746744.1153894; Mon, 24 Jun 2024 15:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlTv-0006vK-OG; Mon, 24 Jun 2024 15:19:47 +0000
Received: by outflank-mailman (input) for mailman id 746744;
 Mon, 24 Jun 2024 15:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlTu-0006vE-Sn
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:19:46 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb83c6a-323d-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 17:19:45 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so3412091f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:19:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb4ea7dbsm64444945ad.213.2024.06.24.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:19:43 -0700 (PDT)
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
X-Inumbo-ID: 2fb83c6a-323d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719242384; x=1719847184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jJlN7ibmNl7wFR/L26KVpjo0sifoq51IpEGRSZdvY3M=;
        b=GP7Lhra1zCcB5v1LfKQkgK8HB3lP7xKvgNy1Rp7Br6N3nhejHXbID4B0O4sM0ZhgD8
         eHfG295ZiLduZTVYycLFtTUlCj939QjwQu7rrpMK3bjzUYSsB8hC10dcR9/kHKJCcDbA
         CPAnDG5xESdSU+q1O1qLx897Sp/TY307noRxzqjt3dWq/Z9RDANw3w72DttHQUHXzCJ5
         /WH6iufGA5eeqXXzH0MioDl6WmsWZxw8SKSysdlMn26PPH5jmg1D5jm3yTldxw31nc1h
         XLYdMaUCJYcRr5lpLLxAjNehibOhhd6rV4Dj3mdfBdjgD2FEHKbbbxaq9DZBwI/qOl/f
         bujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242384; x=1719847184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJlN7ibmNl7wFR/L26KVpjo0sifoq51IpEGRSZdvY3M=;
        b=BbPagUIC3FC5beo0vpyuoGMRDIykaPypYzNTFftLAGYX90hISHpayN0xkV1fTKPw1t
         +oBB/oycCEJyqnHwCqNZ0c1cZPijol24xvzvb6R7laqed6XjrRitYBhlclRnSZB+2YvB
         4hG36sQdJ2Jl8YuyLI08IDQ7UUsDe6SyPvmmeEqEuSOu+ZYVVkHB+09iD4nf0jvWpiWB
         l2ieYTbtU2toyf8hHYjBaYOtWAVCmARQaKzW1u1dwi9BDyaOV4j6v0ToiZYbjC2iWTOS
         j+mYMT4EtgYwZ3t1OZq1tELaY7zDf6VQsSziFJGMPWWDC99N5ElRSsSr63iBASDDLC1W
         jrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbuyKoZhWMMAjRriqfRZcBHumTXIWlC/OOAXSSMMlOYnyoJXhXlZVVTBsz7FpIpucBG6C+E6J6zXTpt4zxy1TD7WRHCQ4qoTPss7MVyNU=
X-Gm-Message-State: AOJu0YxTEecw/HMyfhL94rhCeFQ6vWvgZKixUkTMcwQq9tvMDWXujPh8
	Iv8TJjenH14T+lsHomHEYUeGnDKdj06VUr56Z2LEmmKu1c5ELu64zyPHQRVHBw==
X-Google-Smtp-Source: AGHT+IHxAyXhfYY+NGmQZhdIRk7cOpVUreG17d+UBl8oL23FEozRIsJUUsH/WZ85cBX4Hwc6SW6ZoQ==
X-Received: by 2002:adf:f806:0:b0:362:56c2:adb4 with SMTP id ffacd0b85a97d-366e3294403mr4723450f8f.18.1719242384204;
        Mon, 24 Jun 2024 08:19:44 -0700 (PDT)
Message-ID: <84882119-b469-424b-b261-608c0c43b3f7@suse.com>
Date: Mon, 24 Jun 2024 17:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add break or pseudo keyword fallthrough to address violations of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Technically the change fulfills its purpose, yet:

> @@ -1748,6 +1749,7 @@ static void io_check_error(const struct cpu_user_regs *regs)
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_io_error);
> +        fallthrough;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */
> @@ -1768,6 +1770,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_unknown);
> +        fallthrough;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */

Falling through isn't really useful here. In such a case I think it would
be preferable to avoid the pseudo-keyword and use the shorter "break".

Jan

