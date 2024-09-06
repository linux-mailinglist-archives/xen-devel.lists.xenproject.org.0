Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22A96F1A7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791709.1201670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWMM-0004Ir-TJ; Fri, 06 Sep 2024 10:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791709.1201670; Fri, 06 Sep 2024 10:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWMM-0004HJ-QG; Fri, 06 Sep 2024 10:38:34 +0000
Received: by outflank-mailman (input) for mailman id 791709;
 Fri, 06 Sep 2024 10:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smWML-0004HD-8b
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:38:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 295d2800-6c3c-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 12:38:32 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3c34e3c39so2765292a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 03:38:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc698f69sm2305054a12.71.2024.09.06.03.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 03:38:31 -0700 (PDT)
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
X-Inumbo-ID: 295d2800-6c3c-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725619111; x=1726223911; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etMwq5Fwlf5FAmahbSIFeIv4jQ0dRX1z7sgTVhqsf1M=;
        b=WF+/EJbQYXD08xfVln12Tu3Mu5e56cyRcoM+bCdjM1ImOSuWYbkRPMzBGyWX4KbxNd
         y1riozcu4KmvcZg7G45DxRQ5awBEKH4qXHFFBupilC0c5vEjWgfLI8JI4DQwIPtbqkDx
         pINN0IRMReXQAJuLK7gLsqAtywihmedklUZCosNVjaANq6E8nSN/eAhExiyUBVBpRCve
         vIwTzuMyRd/QWS6n4df1F9k9EiGbZSbfGEdE9o9hYvOPLFqmH707C46WC+yIgDfGDSme
         xgo5EwROWfIgsSsgLHRQ5BOi9OcxzrGI9k80x3hsvyAn3o0hFfqmbfOgGyEwMScSZfIO
         upFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725619111; x=1726223911;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etMwq5Fwlf5FAmahbSIFeIv4jQ0dRX1z7sgTVhqsf1M=;
        b=MEhac48PNCtq7kQV2WdWNJJbv+q1UI3rdjTFLMrybL9eCvcrA7s3/Pr3NcnVbF14Yb
         MBY5WHOhamSlNvQa7KNHq1XkrmoY9ZdaaFwOVFfuI8RMH0wBTGU7jRCV2hFvqklHLcVN
         W8OOEf3ot4JtgfneWYqhM9W1VIZst/nen+W2DVqmB+x8sfB7fYhUZeCLcUDz9CWXTbkP
         9F/ZaU2RytfsLXLB2eH3IuM4zyHu5QwUFhzGGPKLkWLbxBuKPdo6O2M6GQ46eEV5HJ0R
         D3zI/qGGNuIyyPMOF7tl3UNzuknJiUT3zEUTqUbRWzo5d/eEJpJiHwb8js9WhW2/glbB
         jgLA==
X-Gm-Message-State: AOJu0YwQgsAx2sucIgZbzujwLJ1rQ7+3GyZAT8Q1f+Q94xBtlNRku//m
	hbhq5HzGuAoMwOBZZTpDv4/dM0R+8at5iLQ7bnJjIW0o4X0IYJgO4T/lasqJsRFqJP0TiV9IxkU
	=
X-Google-Smtp-Source: AGHT+IFaRL9cKCccaIXYRF7PVA+tfD+NSCwerFVgwTfapvv77qfHnvwOzq4UyTOvVkqojJj1A6Yytg==
X-Received: by 2002:a05:6402:5285:b0:5c0:c223:48a1 with SMTP id 4fb4d7f45d1cf-5c3dc799afamr1405716a12.21.1725619111391;
        Fri, 06 Sep 2024 03:38:31 -0700 (PDT)
Message-ID: <ab5060f0-488f-40ff-a726-bdece05b0866@suse.com>
Date: Fri, 6 Sep 2024 12:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: mark new "cp" local var maybe-unused
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

Just for the sake of the 32-bit build of the test harness. This wants
reverting once unconditional uses of the variable appear (AMX, AVX10).

Fixes: b20e3fbc3ec9 ("x86emul: introduce a struct cpu_policy * local in x86_emulate()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1233,7 +1233,7 @@ x86_emulate(
 {
     /* Shadow copy of register state. Committed on successful emulation. */
     struct cpu_user_regs _regs = *ctxt->regs;
-    const struct cpu_policy *cp = ctxt->cpu_policy;
+    const struct cpu_policy *__maybe_unused cp = ctxt->cpu_policy;
     struct x86_emulate_state state;
     int rc;
     uint8_t b, d, *opc = NULL;

