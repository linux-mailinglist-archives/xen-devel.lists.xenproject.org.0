Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16609DB8A4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 14:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845472.1260879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGeZI-0007s2-DJ; Thu, 28 Nov 2024 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845472.1260879; Thu, 28 Nov 2024 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGeZI-0007q7-Ad; Thu, 28 Nov 2024 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 845472;
 Thu, 28 Nov 2024 13:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGeZH-0007oU-7N
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 13:28:27 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d1bcf3-ad8c-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 14:28:22 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so13593201fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 05:28:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996dc902sm66443066b.50.2024.11.28.05.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 05:28:22 -0800 (PST)
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
X-Inumbo-ID: a3d1bcf3-ad8c-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzYiLCJoZWxvIjoibWFpbC1sajEteDIzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEzZDFiY2YzLWFkOGMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODAwNTAyLjg3NDc4Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732800502; x=1733405302; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc6CxV+Au/rDyeZydkilxu4YRix6akNJo/gf7FIn3DE=;
        b=X0jckQZIiQvjUqFdvL6DvaDK9818WBa3nQ44EDVjwhvMYUxrAf3qM4+/fjPXXYyWHG
         uDGrYNDmC9lPDLjPqe9qDO33gatiDEvyQTxzF1N6bqPR6kv/xkyBQaexoavojREZQHtj
         tDqCj11OvhYlkgMlvan/Ofq9ClIvTd+n/jCMLJUpVi+UjYHhsgkKSNRGZ1+TCAw/S11+
         5d4vUovKwhVQM0uCtWCaafrHSebq/uCP01XxfVMGh1XUE/ubDXztHj86KbwPmroRYedm
         6lYQ4RM75VZ/7OCceQqbHcZYElYWidP/433+C3tF/AeF2luQnjGRUDlfcMXfwsWRA3s0
         E+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800502; x=1733405302;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hc6CxV+Au/rDyeZydkilxu4YRix6akNJo/gf7FIn3DE=;
        b=MDlkYnMKYBkaq3J3R/RDR1Yqq+PqC55q4mA34RFO1kjgtCYjf+7ZlYr4omHevphy1Q
         4BR2Fz3K0E+YZ/7yaFBZik+Pf391M2ptOBd+mjRg+RjH6cwFNa43jNMX4AXKVWL2B4+u
         oGz3APtA2wYBtNYvGqxixoCDO9PR5b5lus3rsYbV1H38Ag8wayt2+/EUG9Hsx0uHfvW9
         Tef5hWGt9Zr6pzdojSp2ZmeMkmjKHBuWz1mSLiWUKLAzTHYYKkSxIYpTCKZknvWeHfmi
         th2bZPa/ZKmacGMzuoWCQvOZ2MvEnTGoHMFvFwgrFY8mOIM3ylKJruwRhKj05K9GuHBO
         Tonw==
X-Gm-Message-State: AOJu0YxZf7HzGQudbIsOKC4w6HaDNkHaSJR15+4aO8O44e+sHtSbEZ7l
	/E3jvvq/h6xmOSIuvyc6xL0jNXNQ25+udsBQizkyhWqzub9ix1aYFpVKA5dRqey3iF5aDVkZuVU
	=
X-Gm-Gg: ASbGnctwAoExFdeA0IitnAla0KsQO2S5+YIXy6U411UMH7dgkn86vt1xu7pRhPRRcM3
	thR2ONzNqqG0HHwGdFLqFgXZh6rkMJveacrHXr+KPgPZPEoiCE8WIYi8c1yb0qsnEiF6Fx55bIA
	r4rLYf7JnunuouakLi/nyKyarkbRIeHBtB1FYqNe7ancjnQ1AAIc+Ps0uUIgiPwspEUJ94217+Y
	/Jkr8Sy/Z+TfKqIjphQmyVqK99bvt8d4pCJj3p3PcM69TaoWXYuftxYYhW1BnvkA68bkFE6vkdT
	j56uzsk4zsNVx1QukzdT1lBlKea5d/dvv6o=
X-Google-Smtp-Source: AGHT+IGrLkihSmZgL/m3TejMjaTzrUVcRmbfp8F8AMMr2gAqHJP3ozzKgs02Lfc9Z4NOfig5nmEP8Q==
X-Received: by 2002:a05:651c:210f:b0:2fb:5014:aad4 with SMTP id 38308e7fff4ca-2ffd5ffd348mr56981011fa.9.1732800502473;
        Thu, 28 Nov 2024 05:28:22 -0800 (PST)
Message-ID: <d06c56c5-f67a-435b-af26-ed5d6a472ddd@suse.com>
Date: Thu, 28 Nov 2024 14:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct VPBROADCASTMW2D predicate testing
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

Due to presumably a copy-and-paste mistake VPBROADCASTMB2Q was tested
twice instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1889,7 +1889,7 @@ static const struct evex {
     { { 0x39 }, 2, T, R, pfx_66, Wn, Ln }, /* vpmins{d,q} */
     { { 0x39, 0xc0 }, 2, F, N, pfx_f3, Wn, Ln }, /* vpmov{d,q}2m */
     { { 0x3a }, 2, T, R, pfx_66, WIG, Ln }, /* vpminuw */
-    { { 0x2a, 0xc0 }, 2, F, N, pfx_f3, W0, Ln }, /* vpbroadcastmw2d */
+    { { 0x3a, 0xc0 }, 2, F, N, pfx_f3, W0, Ln }, /* vpbroadcastmw2d */
     { { 0x3b }, 2, T, R, pfx_66, Wn, Ln }, /* vpminu{d,q} */
     { { 0x3c }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsb */
     { { 0x3d }, 2, T, R, pfx_66, Wn, Ln }, /* vpmaxs{d,q} */

