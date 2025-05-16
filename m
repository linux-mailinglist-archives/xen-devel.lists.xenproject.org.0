Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E63AB975F
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986516.1372060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqH9-0000vU-Mu; Fri, 16 May 2025 08:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986516.1372060; Fri, 16 May 2025 08:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqH9-0000t8-JO; Fri, 16 May 2025 08:18:39 +0000
Received: by outflank-mailman (input) for mailman id 986516;
 Fri, 16 May 2025 08:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFqH8-0000t2-0S
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:18:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da24937-322e-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:18:37 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6000f2f217dso2543185a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:18:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4e8afdsm113574666b.176.2025.05.16.01.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:18:36 -0700 (PDT)
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
X-Inumbo-ID: 5da24937-322e-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747383516; x=1747988316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RLdynXKe20zcP5Gfv3cqwl+P6cxNHLI/U7xpxxCsYfw=;
        b=ONKSQlYbcSgsAEF84Cx8pNS/rPco0opUknq+rfxCFDLtCACqv6f1qlGFR/6QapHrJK
         GWC3mThilmCH8f22Yl4WIE7uMqf3diRLj6YmGA3caGUwVMKUqzKc5dM1t8nBUHmSHh6s
         lT4rX7nMvhq4QWsOp2bF35GS4xOmaCzevhIwZ3RxaOOTu9rvnmN+WWELyBBdwg0JKYj1
         hynr9y/5Rk8GsUs2i6T0bGzdZ1aalOpK3EGK8xcP+ez5ffTF+MwQISLARNU7eu1xO06o
         MpKs7nQ2EYR7TJX/AE7/y6fqVJKiF2027H3eIlQsoeJ87bNU88cB1lMJWOT07yoWH/se
         Yexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383516; x=1747988316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLdynXKe20zcP5Gfv3cqwl+P6cxNHLI/U7xpxxCsYfw=;
        b=HmWaYfAUebdKlcFdwLMZL9Vuuzpy0hrVLrbOlenEDFVgdpucxgtVIilWwQp/tLMQLv
         JA9RJzqWo2+aV6ufLFmCGtvXpDeo8F1eaTQNx5yltN8gy/IyyVbpTvH8MJr2sEJWrbVI
         u+KRCDpXrlXyfsITsQiaQu05x+VTOHpU6tu6Kw7TFTZs3uXxmKwhvdczg5g3grw3WxFy
         NJZeIHMTPNaCI5BOdrsLVcolGJ+6doAT9g6L6UEFhFZbiyINhKufYRgWecXUIq2lLC6y
         aGSVE1F8B0pO9hIvpV+Pc1nb2QdZFkfkGqCRu3ETkHj/AS77T2YqTxje7JRxeQ8MlsFS
         h8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWGXtxwjvveM2cUwa5AfO0h1L/4ZMDi+yC3SrT9P6SM2RifOQv6P7RgKCKUdmqW+o9BWOU134UPP4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg53AyYgJK72QW6SGsOTSucNewfvxC/A7qHHaRezwkj+tqdBTa
	JKLCp7Bt7wkqNaYd5Dl4PRYXab5Dke18b/gpL6ALtO23cISxQGn5t4XPEOi1krtuGw==
X-Gm-Gg: ASbGncvM+wxDNF3vbUMMV+eVXMS8qmBQb7xILNJ2watAeU4OszJlx1eFC9EmybenexR
	WSPntZpR3atlDps+mJoaLxJT1sLl5xFJQEa3xJYSPsZAZdIXFO77ySGo7Hh8dsSH0FoGqeYRbvv
	BOJ8vemYTWkD34vo795CS5o7YVF8S+P+XANbmPoRFNosFXOingD9KCaHaTI2t+Q3c6pD9SfQk//
	lyuzbIIcKUaB40XJOp3OGRZWW71UotUGqJlM3pV6H8SoOG+BcGD5qpbbSTk2ilVjlcmB+SYjuEo
	+H43zxniv1GqqCffqgpCyGJMXevmvL8B6meqMSisOaRGELlZeKGsPK6BYibl0XoAuHrvjowRwjv
	LVLlPmZwzgAMrgEZ22WdNqFbSN03rxu5YItjZ
X-Google-Smtp-Source: AGHT+IGSFg1Txe+2hLHN5G30As69oenAqX1emXbCBFcP1Ib4t05rSF2vnOn20jUuUISOHGGhkb6n4A==
X-Received: by 2002:a17:907:9308:b0:ad5:2b74:da86 with SMTP id a640c23a62f3a-ad52d608aadmr230142566b.55.1747383516543;
        Fri, 16 May 2025 01:18:36 -0700 (PDT)
Message-ID: <70508277-6841-4cea-aecc-614834d8fe62@suse.com>
Date: Fri, 16 May 2025 10:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86: Use asm_inline for ALTERNATIVE() and EXTABLE
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
 <20250515195549.3703017-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250515195549.3703017-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 21:55, Andrew Cooper wrote:
> ... when there really are only a few instructions in line.
> 
> In some cases, reformat to reduce left-hand margine space.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


