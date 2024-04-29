Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9028B56BE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 13:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714009.1114960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PGE-0006j9-HR; Mon, 29 Apr 2024 11:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714009.1114960; Mon, 29 Apr 2024 11:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PGE-0006gV-ED; Mon, 29 Apr 2024 11:33:30 +0000
Received: by outflank-mailman (input) for mailman id 714009;
 Mon, 29 Apr 2024 11:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1PGD-0006gP-HM
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 11:33:29 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca1891e-061c-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 13:33:28 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34ce52fb920so1081902f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 04:33:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b0034c8b0354a6sm6633074wru.106.2024.04.29.04.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 04:33:28 -0700 (PDT)
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
X-Inumbo-ID: 4ca1891e-061c-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714390408; x=1714995208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3K9/aMqYsimNOv0RwWhDG4JKax3mItxgwGszAxVcr6o=;
        b=DnbcpY315us99nCXa+4QwZoWeSDCS6BM26TDlr0TGhkt/5yTxGVPYCSbn8S/yRj94F
         W7pk1OsV/xyfgJgfAsFOqTtxP3xBHSq1ULfpFKiIiQE7S47LumGzL1n6FT/u/JpWDNBo
         h6EVtl4+7T7edvmZ5Hg9QtV2e8ENb2rqGhquPV4gDA3thngzAEZ1omZ7BR115P+EEXuN
         5nrBJHw0FlmCa7CWGNPFuR0+c5wG6KfNhcAzITRVTGoVhBNgPFyhKk/HNrvYWViFKuh/
         CGdGwlBGOR2U7gmcmWULxY5XcAB3oW3H4k9h5hS2kSTQbB8ceDcqj+/BFY8FCBwpqvZO
         mB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390408; x=1714995208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3K9/aMqYsimNOv0RwWhDG4JKax3mItxgwGszAxVcr6o=;
        b=vIIy15Wk92UUdF20MZXIp78XZsT1NjgB1RcbOSEY+b+ZsLfCESLCtAjtGiOIGgl7N0
         SeKk+dIdmGZ2c6f06zHmITg6U97pkHDoLQdwFA33gV6Uh1f/aSj1T+QF1kKq6EBzS9kC
         ycHwQDBYiK4gLkDGTbY+NpYsq51+RnS8em33jX/MCNoqnLOmDZ1gb4NVSXEOm7xDbn96
         iCva8UEcReZdId2QarJs47uvjBKrS0ru2Z21wX+vBM3oL/47ocxj+lwPuFKm9op8oPif
         TpdyCE+OQBOqwa8/pK/e17xLYLy8F/+Ki7WnIqfks8/wyIzeKdMOzzRVRqoi4V3FY4y/
         /q7w==
X-Forwarded-Encrypted: i=1; AJvYcCWPcusT7LwHHr/cvLnR9dxMf90FeQ7zWTeQL9HBn6nvXGMl86Gn1TVVRsvGMu2TgdCt92Uo74hQlz0nns6P01bFeOrz++ngIt3dtCnjEtY=
X-Gm-Message-State: AOJu0Yw0mTvuJOFNbEjNEIchGd0ZlVhbbtbh2NeEZYCLj38qLKOkNucN
	1XuM5TWqAxl1vXcIzwyUc0aRugdDTW8haP7FjMuyslRRQtzUpOfIKyOE1Nh33w==
X-Google-Smtp-Source: AGHT+IEAU5p3Z4osotf37QHKDQXNni7j7cyYgDa4l8tPB8tjleM12eIWu1TW1kg0VB/sul+y3L8fyQ==
X-Received: by 2002:adf:e9c8:0:b0:34a:a754:eb48 with SMTP id l8-20020adfe9c8000000b0034aa754eb48mr6593348wrn.48.1714390408223;
        Mon, 29 Apr 2024 04:33:28 -0700 (PDT)
Message-ID: <de66a6cb-2636-475c-80df-e507bb70de39@suse.com>
Date: Mon, 29 Apr 2024 13:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Explain how moving mod[0] works
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
 <20240426140140.465506-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240426140140.465506-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 16:01, Andrew Cooper wrote:
> modules_headroom is a misleading name as it applies strictly to mod[0] only,
> and the movement loop is deeply unintuitive and completely undocumented.
> 
> Provide help to whomever needs to look at this code next.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



