Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711D8495B9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 09:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675699.1051076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWunV-0007B7-Lg; Mon, 05 Feb 2024 08:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675699.1051076; Mon, 05 Feb 2024 08:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWunV-00079A-Ik; Mon, 05 Feb 2024 08:57:49 +0000
Received: by outflank-mailman (input) for mailman id 675699;
 Mon, 05 Feb 2024 08:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWunT-000794-VC
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 08:57:47 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ce1dd0-c404-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 09:57:47 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fdd11475aso2794435e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 00:57:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b0040fc56712e8sm7855258wmq.17.2024.02.05.00.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 00:57:46 -0800 (PST)
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
X-Inumbo-ID: a1ce1dd0-c404-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707123466; x=1707728266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFg9otBeA8ysHfCQq1m6m0GEFd8ZAtUS1+v10mm+WXc=;
        b=LMK7touVsiP0X03Mr2Cp72Ftvppf8ZJAtfT9hWA789m+Jb4Rr9KnsMLqLDkCTAuYOG
         5oV2m+3qktcN/ycPz5iR98UeLQC1QUqFzJLV9mf7qTIAs8uFaXIHRNpwB13UWLa0RsMd
         2W0ZCCaNLZKb5s/6Q3b0e6VziSE9cAJmOrdaMh+Z7MqCwLriLDb9fe3Q61E5cJKSL54J
         q9zTt6V/VN+4BlGN7vpr3oDTXBPlwmKa7dgUpaVL3vBQaWHk9tK8j40xQ+8UpqIpJfTJ
         P2aVdbmf2WT5J6ouR5A5tO5t5yT1MM0aA7eXHsRdMZxzEL5+2MJ2C+7hS/0wdAZS7hon
         pphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707123466; x=1707728266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFg9otBeA8ysHfCQq1m6m0GEFd8ZAtUS1+v10mm+WXc=;
        b=ZI2OULSdFVWjfrrKt/VR+IOh1OrsFXe56pJSznh1o0LoSvdnF81Xd1w1xg1x6NcFD9
         718h+fk936Ea6T7xTR4XZxyDxfl88ByRr2K5Lib0jdseAJzbw4izZKPcLF81m/+S/7Qf
         P7t8bQLT5nkCBGSU873ddaBIb8aEvyDt9k7oJqUpYn+Xf6Tuo7D/D9qBZvWbW6TYUkds
         x/ISAePllVA+/Jzy4K/Bw9uOyUOyivM7ZhN9aFappwianegG4+kSyFySyChl5TYpw/eG
         mvzr3u00JsYTmsQsO8IwiDQEmA5pvEGfGt+J0S3rGgmlZJLpiWP0JqWJC9RPBFQGNzm9
         PcGw==
X-Gm-Message-State: AOJu0YzDfbquSOXyQaryRJxsCoHdGk0MlZPx2HXO3FT3AYg5Bw5a8SZq
	RWucsM/q5YcJ4WCYHe/kpNOa5TNvPmQUjdttwt2B9gBZMoWckwtbsVeR11qmig==
X-Google-Smtp-Source: AGHT+IEBE+poTjfDzcz8CM8zzsE1Etore0Rh9JzoWw0NLBTK5r2+VRgNuenyaE1rDtWZ68LhUa6p0Q==
X-Received: by 2002:a7b:cb8c:0:b0:40f:afe1:c9f8 with SMTP id m12-20020a7bcb8c000000b0040fafe1c9f8mr4233297wmi.12.1707123466546;
        Mon, 05 Feb 2024 00:57:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUvxx7yh3O/gQTAspWRu/wbVDbqLOQai3dxS4/GUgh9ClbN3BWz5QpCA+fJNgslONHm7XxiqOZQ0lI3JsVtuSknjOZQFMqtN0wad0McfIy36m1Cn0Gw+ehfb58=
Message-ID: <ed5ab7f6-1b5a-4953-8add-8a2df41b748c@suse.com>
Date: Mon, 5 Feb 2024 09:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Remove accidentally introduced tabs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240202180003.1295735-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240202180003.1295735-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 19:00, Andrew Cooper wrote:
> Fixes: cf7fe8b72dea ("x86/ucode: Fix stability of the raw CPU Policy rescan")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I had spotted those as odd while backporting, but didn't consider the
issue bad enough to raise it when the change had gone in already anyway.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

