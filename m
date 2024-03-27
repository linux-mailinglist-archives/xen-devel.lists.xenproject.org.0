Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8388E496
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698569.1090401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTvG-00043V-Bv; Wed, 27 Mar 2024 14:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698569.1090401; Wed, 27 Mar 2024 14:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTvG-00040T-8M; Wed, 27 Mar 2024 14:06:34 +0000
Received: by outflank-mailman (input) for mailman id 698569;
 Wed, 27 Mar 2024 14:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpTvE-00040I-7j
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:06:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3666170d-ec43-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 15:06:31 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a466e53f8c0so893652966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 07:06:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l19-20020a17090612d300b00a46cffe6d06sm5474178ejb.42.2024.03.27.07.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 07:06:30 -0700 (PDT)
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
X-Inumbo-ID: 3666170d-ec43-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711548391; x=1712153191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f73oZlgdllswJBuQF5UqdDjTwnm18l+lGggS39yExJE=;
        b=YEuM4sZucV6/qo1Erodjb7I9koc1wpo2DfqFzVATHrt08bfvliD41X0XeHNz6yqWrR
         pPkw8k7+WjYqtXqE34BjKAaSQlNJNdg4TMXN4XbOTFbrtyPDNMhE9JTW0vr/mx0/ftlx
         mRRzIf7IWOJMPXH1x0F7Q/MEpEtgmbyk52j6BuYzv/BB6r939Ct3FDs54UU4NN7a1wfk
         Cp7VcbdqWO61GjbmgZxV6paL2F42LQoM3Yrm2Lv872TVGUuGCSlwJXgOF7HgY3wEAyDU
         Bd+l+M8Jng9+f6dZTaHtgawJH0EwZqiqckhYLJZZrMwgVnZM36hpj5vrSOE7H88sce9J
         Mu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711548391; x=1712153191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f73oZlgdllswJBuQF5UqdDjTwnm18l+lGggS39yExJE=;
        b=RYTDfodAweXnG8CkzCtbkeJoAstt8/BvPYbEzM3KenohlXMT2dytmeXSsolexmvRWo
         0JBwsaD2X+qe11Mpn0jNZKiKJc5We3wR0HwJHdjfsWz4ZiShg95uC8JgzdAbLO/Dz+SO
         0x70/7a4/dtQmK7vPnjFoPpsQCpZthVl3R+aDzK/rH2U1NY2p3skuM3kBbmqpayMWKw1
         kNE1Vyj+OZf2gCO+kZjMDjQjiQuEL64LUsSY0rBHauw1GLmiT5m7QQ5wGBSab1Z1IBsu
         HxkcrD6Bv1Cr/IpsZBOVSbBawvXDfjeJbw+jr/Viu3nHJOndMNpX4K82dUeVpJMRev20
         7yHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqVuE93dj3x5LGptiVwm2k7HL1llZMRZKvhRpZgDt/e2xD2S14WbqrIRtTyIgfkR2nUK8ZSf2JESflpQWh2NPAzFr8eL1IF0ld7iddxUE=
X-Gm-Message-State: AOJu0Yyr9cL+r8w7uh/6p/dcFF1tAbpzZ4KfCuQTjymQ5QXFtz57op0J
	BveZJ1SbdqFYzS+QhKsr85Jd4z4qf/LhEC4sRjDq2X3iawtPX4uiVOSJ9uauVw==
X-Google-Smtp-Source: AGHT+IHwK41ZnSn+dxrbQAbP4J9PCKczpB3M4GgS9d0LK3jvUBvBeVs1M8v/VjKDfBmh2m6x+lnXJQ==
X-Received: by 2002:a17:906:f2c3:b0:a4a:850f:28fd with SMTP id gz3-20020a170906f2c300b00a4a850f28fdmr1093071ejb.29.1711548391036;
        Wed, 27 Mar 2024 07:06:31 -0700 (PDT)
Message-ID: <c08666ad-2baa-407f-943a-a47d1aba345f@suse.com>
Date: Wed, 27 Mar 2024 15:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
 <93172b11-c737-400e-9d2e-daafee8f1cbc@citrix.com>
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
In-Reply-To: <93172b11-c737-400e-9d2e-daafee8f1cbc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 15:01, Andrew Cooper wrote:
> It occurs to me that these want considering:
> 
> b6cf604207fd - tools/oxenstored: Use Map instead of Hashtbl for quotas
> 098d868e52ac - tools/oxenstored: Make Quota.t pure
> 
> while 4.17 is still in general support.  These came from a performance
> regression we investigated.
> 
> I've done the backport to 4.17 and they're not entirely trivial (owing
> to the major source reformat in 4.18) so can commit them if you'd prefer.

Didn't you bring these up for 4.18.1 already, and I said that I'd leave
this for the maintainers to decide? Same here, in any event. Cc-ing them
both, just in case.

Jan

