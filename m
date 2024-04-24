Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2A8B01B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711133.1110858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzW1j-00040J-ET; Wed, 24 Apr 2024 06:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711133.1110858; Wed, 24 Apr 2024 06:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzW1j-0003xu-BL; Wed, 24 Apr 2024 06:22:43 +0000
Received: by outflank-mailman (input) for mailman id 711133;
 Wed, 24 Apr 2024 06:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzW1i-0003xo-Fe
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:22:42 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d285549-0203-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:22:41 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34b66f0500aso1529539f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:22:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b00349cadc5024sm16225147wrp.61.2024.04.23.23.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:22:39 -0700 (PDT)
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
X-Inumbo-ID: 0d285549-0203-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713939759; x=1714544559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mwkCe7jRohrrZj4gIZx+L0/69plFQfhwQaewzjl71jc=;
        b=ej8EuSOE2jswo/X344t1H7TJ8MxEVhDeNMQvNvSvlpI8yVFflz4u/31ARpF3Xbumf2
         KEFHtvLRCb8zNSaENWUODvgb4qA4oe8sJNmZoY1z0jt6mEfzpkkBDF4IiGRYU2MbCAuD
         TradUdq0m1d4BmIFghmjKH5pNiJwNBBMlcAOdkIfnGxAizZ1c4je0l4jvVDlsYALQ81K
         i0dqGbaNYRZPJy1RH+1Cw41iABXZYVbMgjkT/5z33GelGYJdTN4bF+hW49/X3o9BaNfB
         Ju2wzFzDZRtbEZEunwhDeMIXZD6QlRM+sQGDdeb75d7khCe/BgYh7J72de6QM/1SXwVU
         fUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713939759; x=1714544559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwkCe7jRohrrZj4gIZx+L0/69plFQfhwQaewzjl71jc=;
        b=O4PT0JPMvyPZoABVHpnf6W/PerdMLdvf7WladS7ZPM9EViII0hzQl8XJCsBKqvX+wN
         bHljEo+QLlM9QSBOQv5ZvafMUDGV9pzhiXEesQia9uavCuCPakCTF6raYNj74wyzRjNK
         sfZGCrFN03zhCcXJkp3kuX+tvgKMwjro11IBZVkLH+/ev16c1wh3p+MF7+9XDUGqui06
         HEhlQzxc+mqSuD6xJGJfYqRK/MR/hCZk6zHpa2sP8cV9f87P1kNzZY3Ls/NBJgtRJXuq
         MKKQTiKMWMQKDT2/W0zU/olfyzYuzwXO0ZSf6/9HRzWOXYCQ+1pxg1/+meXhnjZkQp7o
         K6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUEkON7vTNq7dKL8BzK+0WZr+9nWTZfbS/4zlYCY2Yx0fzTk5IkHKPUtY4rshDspQbd7lo0gjtE6vBXLJDLVrltHDB0okWMN88Wub0mhI=
X-Gm-Message-State: AOJu0Yy74n4j+yKN8nYzbi5Rs9HDFTxoQ5Lbp7mqhkOF9kwMAuJoN+s0
	tkHCoFj+GOXmMj7mnx+/3kFF3W7ZOTpJo8QWjPoUOjioBNVHnAMa50Yk8NKCOg==
X-Google-Smtp-Source: AGHT+IGGqT6OVQcHu1zyYfpnbBLS5pDM2q7UfSsJIaW0aUrJ4yS5XNm+FfNmKBxvyW3tydY1uw/Llw==
X-Received: by 2002:adf:ed48:0:b0:349:7e8e:b29a with SMTP id u8-20020adfed48000000b003497e8eb29amr934673wro.62.1713939759669;
        Tue, 23 Apr 2024 23:22:39 -0700 (PDT)
Message-ID: <5bb872fb-9973-4ed9-a463-1b1a873d4a46@suse.com>
Date: Wed, 24 Apr 2024 08:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] rangeset: Move struct range and struct rangeset to
 headerfile
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-7-xin.wang2@amd.com>
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
In-Reply-To: <20240424033449.168398-7-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> From: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> Move struct range, rangeset and removed static from first_range and next_range().

NAK, for going against what we do elsewhere (limiting exposure of internals).
At least as long as the justification isn't any better than ...

> IRQs and IOMEMs for nodes are stored as rangeset in the dynamic node addition
> part. While removing the nodes we need to access every IRQ and IOMEM ranges to
> unmap IRQ and IOMEM from the domain.

... this. You're aware of rangeset_report_ranges() and rangeset_consume_ranges(),
aren't you? If neither is suitable for your purpose, can you explain what you
need in addition?

Jan

