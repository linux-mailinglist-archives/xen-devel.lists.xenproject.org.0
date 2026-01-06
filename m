Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB2CF8A15
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196126.1514008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Yg-0008AK-6y; Tue, 06 Jan 2026 13:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196126.1514008; Tue, 06 Jan 2026 13:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Yg-00087K-4C; Tue, 06 Jan 2026 13:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1196126;
 Tue, 06 Jan 2026 13:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Yf-000879-2Q
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:57:13 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9889a982-eb07-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 14:57:10 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so7656895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:57:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7faecaccsm18788265e9.2.2026.01.06.05.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:57:09 -0800 (PST)
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
X-Inumbo-ID: 9889a982-eb07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707830; x=1768312630; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VaFiZnCalOwuRAXOcJsU/zkWwQmDiViHYDLlWhgQwGU=;
        b=DWp660djlvcD3xNxA4WYg7M1nuPuAONw4OVcyyaNrHRDnMXO3K2wJvQTdJIzGKpWHK
         R5euuy++wq0w0eMVj1S/qDXduGKia4YmpwngZjTgLhg3HmLiMVQXiPPsltWd0/6HgkZT
         glB7jFRIFv9+ozZq3g3MceBeRPr9Yak/WnrW+WHH7ruDmdTX7s4lxnMCPAtrDIuDEkNY
         UlFTW43Gmq4Oo3J4PMluK2k1FA8/M9i2yrI1/mmj4PqevWN8BO9VKL65nUI951C1u2ST
         uIgBbTb/Foajdff+OH0TuYC/qIivZFk0yAvummKUecxya6JNMXVCTXBa6kR7ijxTR0Zv
         FX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707830; x=1768312630;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaFiZnCalOwuRAXOcJsU/zkWwQmDiViHYDLlWhgQwGU=;
        b=Qtz1xdGtA8a2TpgPDeJWkW/zyotqlbbd8Vs7M99zyvNo+AnchnlXRTOs3SApHD09LG
         cgn2RPLj4D7W8wXNO/c9TEA3IOgxZhZQd1+10ax/OheUM50GOt9X+4qksMwoFnaDWic8
         Gvhx4HmL3uV/yzJPLzhVhz7GGPkwq0PNSVWGWpN4BMrIBYnoRzR0yYTAe3UnFMK4uwae
         RDj2C8IgBwTxBw9Wm/dI2VWVbzgJGvi/MmSWqk+Q3R42pGen5xUCX0TW1x3faIquhE6S
         xH+d1Z/DF39VaDSaMiLjeWucFcNSLHjQW9BSiUL7GEQcR5fvPJftXEaON3k0SVkdMLOv
         SZUQ==
X-Gm-Message-State: AOJu0YyRsBYag0DxaGjR7ZW3lI+sITeivAa2uOM7208TDT+tiq0Ljban
	KQelTL8NwUMVjIQ+wcdfEHbxnX7dAfvUMMhbl88S4D5bfgVqWrVDceOjsEy7cRrKC8sgVAgMtnq
	/PGM5rw==
X-Gm-Gg: AY/fxX4kYF35yaDoq7p1Mm/KjucVb5EGLoo0ELhCi7SpMDInviqiAvoVSGWC36p5rcZ
	mVIEUcnsW/MTUXoz79pAFgWW25b30EahQV9RALBu/Z5iCcG9lFDvLfDyTvsQOrQd7NqwJma01S3
	Vh/VjDS1/2saiRVoenzoaGoKKfokg2ZemXci6U7G86IrYCgBbGnZjDhGzD0paCKa4Xbe67z4ULl
	pxYQg8ah0RP9y42RXz1sWLXgb5pYXG2gxrPJOX0Tu4OMrTdDc2LxLrTP3cYwCqCc+ea2Y+ReqvY
	g6UIeGy/YY77KIa7hKaVNwJewznoiJ6SrKfSybXh6c7O9SE7Hj14NQ+hYMJpyiB41Y9gY+Y3nOx
	t/nUeTCrpQFA0uTUg06BPMbJLSU8U5ZHgtumhORv2ZIYrKobS8r7M4jW9f8my4vRfQvmsmq6PEE
	Ms2nZmwTU6XKE7k6WGrQ94zQe5y1/w7jgfcQUC2MLj7IW1jIRT2ydFYpo+Ju0qW+Pxw25WmKcZl
	jk=
X-Google-Smtp-Source: AGHT+IEaQPMWyAssGz3slEpzDLOocVu6RT281QRSSOxTO6UGuVlKdQSrvfs0L3MzEhonYzG4WxcMUA==
X-Received: by 2002:a05:600c:8485:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-47d7f090008mr35948495e9.22.1767707829995;
        Tue, 06 Jan 2026 05:57:09 -0800 (PST)
Message-ID: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Date: Tue, 6 Jan 2026 14:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: assorted time handling adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The first patch aims at addressing a recent bug report, but may also point
out further more or less related issues. The other patches do some tidying
found desirable while doing the investigation.

1: time: deal with negative deltas in get_s_time_fixed()
2: time: scale_delta() can be static
3: HVM: drop at_tsc parameter from ->set_tsc_offset() hook
4: time: gtsc_to_gtime() is HVM-only
5: time: pv_soft_rdtsc() is PV-only

Jan

