Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6B96F1B3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791715.1201690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWNH-0005Dq-Gq; Fri, 06 Sep 2024 10:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791715.1201690; Fri, 06 Sep 2024 10:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWNH-0005CH-Cc; Fri, 06 Sep 2024 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 791715;
 Fri, 06 Sep 2024 10:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smWNG-0004c0-Un
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:39:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b81dcbe-6c3c-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 12:39:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c3d209da98so2593273a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 03:39:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc551397sm2309620a12.38.2024.09.06.03.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 03:39:28 -0700 (PDT)
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
X-Inumbo-ID: 4b81dcbe-6c3c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725619169; x=1726223969; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mACb5Ja+hcMpudt9GBDQcGpBiKzWgvR8kL15IKJ5Dk0=;
        b=J1uu+AEnMdnE+izHYl9fTXj9NAaT773q7eWWr5aViqR1S0ne7fZgL/5uNX6Rran3Wk
         eeZ33ZQ81dBdFqdWdTswtY1Xx+6C4s603TXbB9vo6hU1wZP89j9Gzy4gW8qjyzdqRa1O
         hjVknxOu83y/yLbzNhIfVbfLtjTTyNBE31bYfAj4LBryLX+wMpARS+Oln0TzrUgPsDMA
         2CTCxHUX45RLeGfgx7BohPQ+F6aDewhFS8ZsFdnfMMT1rvF8bY7CTHUmQYQ+IMDm7i1m
         Pc1WtPAt3dhpWJBi2pw3e6mbCjQhkkxgohfMHLPof/U+AdCMQjjfyYDJ8xOrk6wIcSxd
         tmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725619169; x=1726223969;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mACb5Ja+hcMpudt9GBDQcGpBiKzWgvR8kL15IKJ5Dk0=;
        b=bJeBVJ9kaXQCJ5D9D9okpOY9s9MNw9nWTAxPcdF6ObFGv5EMEmeEE2DS7bA3K/oK1F
         zg9Ap16O0EibCQAFdaWDovzgm8Ti4XgFHKKufrw3byE2JOdnL7HgVMkjEt0Pi3kKF84i
         OnooUtvWQi53DYfAMUKqY+IH80B56ccDyyhWlSTNYTQhpXPf1GkbceW9bHgdRAGxhSGa
         16+6BHs/m/HlMqGMcURJETLbSWTTZs038++3qcXsPNG989nDcUqT+Jugghf3glPggStC
         Amh7lpVqLum3QwuhAwMsbOuae5u5bb+kweKlChMZKpSMlcb5zS4UqR2ZKEnRgdzHXwJg
         97EQ==
X-Gm-Message-State: AOJu0YxicaxfNF6SawHQN3yrPLVB4evpDNPyx0JAP2l/qd0rz9Q1S+jM
	0wsNhn7Yf2ffeSctM0d9FLrtwyzg5vcRCQ0qzgNIrmgNIppSQbpjRaR41K4ig3zWkIjugF5WIV0
	=
X-Google-Smtp-Source: AGHT+IEiyjAHXB/NCXQcJzhznKZ/AG1X1Ux+18mBqvuqYYJNAR/qoM49T9yr9WROoKg5r8/r5ikB/g==
X-Received: by 2002:a05:6402:13cf:b0:5c0:c223:4875 with SMTP id 4fb4d7f45d1cf-5c3dbdc7628mr2571699a12.19.1725619168648;
        Fri, 06 Sep 2024 03:39:28 -0700 (PDT)
Message-ID: <73ab4821-c3e7-4d0a-84d0-f37f578be350@suse.com>
Date: Fri, 6 Sep 2024 12:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: use MSR constants
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

msr-index.h has been in use for a while, so use the identifiers it
provides in place of raw numbers plus comments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -689,11 +689,11 @@ static int read_msr(
 {
     switch ( reg )
     {
-    case 0xc0000080: /* EFER */
-        *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
+    case MSR_EFER:
+        *val = ctxt->addr_size > 32 ? EFER_LME | EFER_LMA : 0;
         return X86EMUL_OKAY;
 
-    case 0xc0000103: /* TSC_AUX */
+    case MSR_TSC_AUX:
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
         return X86EMUL_OKAY;

