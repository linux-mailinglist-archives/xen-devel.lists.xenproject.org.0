Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CCA7654B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 14:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932424.1334551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzDpu-0005iM-6q; Mon, 31 Mar 2025 12:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932424.1334551; Mon, 31 Mar 2025 12:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzDpu-0005gG-3f; Mon, 31 Mar 2025 12:01:50 +0000
Received: by outflank-mailman (input) for mailman id 932424;
 Mon, 31 Mar 2025 12:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzDps-0005Tw-VF
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 12:01:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec14b0c9-0e27-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 14:01:47 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso45303905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 05:01:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a42a3sm11251662f8f.91.2025.03.31.05.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 05:01:46 -0700 (PDT)
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
X-Inumbo-ID: ec14b0c9-0e27-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743422507; x=1744027307; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfuQddb+PyMew2eqQBBtECV4Ps+rVk9z1LijNlqeAJ4=;
        b=U2t38NYev5rDJBRQ8+aPwwv08B2/JUNET4tROhLQnkcbHaSnkdtFALmMkNe6LSOTGL
         gZBMybv4nvcm4XXM37UcjIROAhI1lD9kqoIZwDS8FN5usNx/2lOqki75X1UAcTjF25Ym
         wBXjkATE66ZvLxTysMLtLe36Sbitm4zbkJhbawZDc5bKAlwGI5LC12LgkQoy5HGBI5Oq
         ynqoUA1FBgJdInefvH6GP3q48tifjr9ZE5zFdWqRTuHL6I2knBbO2DXU9llj1YylysLu
         56NpFXmieac3bA1M2k1PUabOAvj5mzHbtdyhhpg76LNwPH3lVPdsMiHsLAVFt3pic679
         QSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422507; x=1744027307;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfuQddb+PyMew2eqQBBtECV4Ps+rVk9z1LijNlqeAJ4=;
        b=myArukIT6r5LQdHgCYsofXOCHjejOYW8e+5SHX3VNrs4tzHhsboUw+XYj8+mcOj/xr
         9mMiDRrfORuRLPeEGGqLmMMDwVx5YRa4h8kMBRbRopFzqIA1LtqoGcn0wJFJwOSfLnEX
         aeZ05jofXaGutUA/0aiGArB5010n/cytWILzIFNyLlMjlTJz8Qcog0W+1verrouHE0rX
         hefk6gKTJC+5KR+Fd4ZG3x8yjEzbiPPvhj7efuxKEFg5tXLTmc5c3vLircdXMz/C5nXb
         lbvaK9yMBxFSX/kwVvl7L7i9L85l6JPml/AR8lBcB4HYj7NLsR2f1ewgmsNPtc3lpVf6
         jIeg==
X-Gm-Message-State: AOJu0YzhS0eM5Za8lWVQyOFXW9hheTeRJuX6aSgViEQ0o5TLkW8nBOnn
	HG9kRxP1qcjwNiWNfhXX3nSP6rnqGPeUXaY2JEZmzVJPbuXXyO2sC4XK1Fo7zKWdUeplMpcHf3c
	=
X-Gm-Gg: ASbGnctG8uh1JWoD+U3zgJ5TlRViwrvxnLI0KWJTNrUos1w/XnFgBSY0/V41BWKcykQ
	q1VRtzBy7l+w6AEIfMYqw8WClRBMb50dMQl5FIXUXastW9PUceBobiwift1DZdfArrWVKIfRq1D
	1SZuA04gl3I2MM/MaSjG9PrzKBD6mp1vFLx9IS6J8EmpQ7mioCgxvguiW+Bc988APVgiFGYcL6A
	aNMbDIgTA/gMJUGOGvNiCdGrd+o+ay8VvmNwBLhF8TOxg3iBI1ACoUDu7/oNsqXAUmliOYyaoXR
	zf5vehvCT5oFrvRquGNFjDn+d38oM+hB9eJR1aJvqtWDovJ0Dh9uYltiFru7L9CuFh0NJbUcSqe
	X7YWuKvJf+eYWnGL6/E8ZUt8/r1IcAA==
X-Google-Smtp-Source: AGHT+IF487W4FOh5MPtn2POPHQVHa5dw4ujF1P5FkgLi/WxoXxQp4YYuY8uzHw4/fDmwXkUpm/wYtQ==
X-Received: by 2002:a05:6000:42ca:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39c12117a99mr5260433f8f.42.1743422506952;
        Mon, 31 Mar 2025 05:01:46 -0700 (PDT)
Message-ID: <03f284a2-cc9b-4950-89b7-f9feaac0e129@suse.com>
Date: Mon, 31 Mar 2025 14:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Config.mk: correct gcc5 check
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

Passing the -dumpversion option to gcc may only print the major version
(for 4.x.y it printed major and minor, which in nowaday's scheme is then
indeed just 5 for 5.x).

Fixes: 40458f752550 ("Xen: Update compiler baseline checks")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -125,9 +125,9 @@ define cc-ver-check-closure
     endif
 endef
 
-# Require GCC v5.1 as the project global baseline
-check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
+# Require GCC v5 as the project global baseline
+check-$(gcc) = $(call cc-ver-check,CC,0x050000,"Xen requires at least GCC 5")
 $(eval $(check-y))
 
 ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
 					grep -q build-id && echo n || echo y)

