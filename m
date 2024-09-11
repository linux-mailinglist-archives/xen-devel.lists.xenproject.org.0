Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17878975293
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796556.1206207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMb6-0001o5-6N; Wed, 11 Sep 2024 12:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796556.1206207; Wed, 11 Sep 2024 12:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMb6-0001mM-04; Wed, 11 Sep 2024 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 796556;
 Wed, 11 Sep 2024 12:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMUN-0005SW-4i
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:30:27 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f98a40c-7039-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:30:26 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so7362481a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:30:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76ef0sm5363597a12.63.2024.09.11.05.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:30:25 -0700 (PDT)
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
X-Inumbo-ID: 9f98a40c-7039-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057826; x=1726662626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E/VQYJObNEPJuFiaAletJaE9AeVmIbCDaMEcMMCWqBY=;
        b=IMQP/f+5X6bEi8aP5gUHuOfkirROK9CW/kxaKInqoOGb355MlSe4zA8eXdzR46PKOg
         Y+rJqNK6kw+6gs48//XO1dSiOtmeuCTLGgG6798QnDrsLoBOiHNrRH5vBqlD0O2BNBLi
         rxXtC6oR4mdCTGGpYsG7jTHn/V3OrqIkZC6wPU8OCxf3nRSX7ujy1FkJMxsxtylZH+aT
         rPEXYulVEoWG7u0Pwd3yr7+qgqRyJKLDKNNYvsMLm8zAH++NW+P+t2L6ItuQDXuj3Ob5
         kV4ljG9nczQw1Us20QN6gq3WiECN5CvEDvXdQD+1dcASUaBo/q9DiaZYco+rIt+gnlmh
         tpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057826; x=1726662626;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/VQYJObNEPJuFiaAletJaE9AeVmIbCDaMEcMMCWqBY=;
        b=A8rFNOJ4U5JYuxViZ+HjB3vdK2torImCaQAwHz8slt75mponceMOi2zKWk2c+6INl8
         Tw1amKsUZ2DX3JtXbpR3tZU8jQMjSM9biwV4J6BGkCbC9UbURVv48UM4qk3eP+CUud+C
         NgjmRtfAbwzA3dKtWO2TQAhZS0qgOeFCreM/BZw7grFl3h8WR7icRW1RYF09UVhIR1dB
         rUiIwtOMyPKWZnRppislic+uFV8umW0ZA2YHlcgEUa7ViWojmSeZqTD67iruqn2PVYrs
         r+cZFynsX3mOyYfColoKnbTDvtKW0eL+9JinHDfF4m+lNikcBjpBFEhK7UX2115yDpHO
         +Zew==
X-Gm-Message-State: AOJu0Yx6QxtK8/i5TD8j+S8VeX9m+0jmVx8A/zKF1L81rXxrgidO9Oyd
	Ndm/zo4hTamNp3eNxmTepHb+RwO4NVSacEW2H+q7ReluOopEQn2LhKkp3byE+dhmMjTK7EmstNM
	=
X-Google-Smtp-Source: AGHT+IGlT/+XpcVikT9tpnst1rfGQd3lCpyul4pBf+CxxFz5rfPGloVQ/YNZyBF6afxQLQGB8QC8MQ==
X-Received: by 2002:a05:6402:254a:b0:5c3:d1ce:261c with SMTP id 4fb4d7f45d1cf-5c3e9630f87mr9255606a12.13.1726057825990;
        Wed, 11 Sep 2024 05:30:25 -0700 (PDT)
Message-ID: <a20f9455-a26e-49d1-96aa-36efec6a563e@suse.com>
Date: Wed, 11 Sep 2024 14:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 9/9] x86/HVM: drop .complete hook for intercept handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
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
In-Reply-To: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No user of the hook exists anymore.

While touching hvm_mmio_internal() also make direction of the request
explicit - it only so happens that IOREQ_WRITE is zero. Yet it being a
write is imperative for stdvga.c to "accept" the request.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -240,21 +240,13 @@ static const struct hvm_io_handler *hvm_
 int hvm_io_intercept(ioreq_t *p)
 {
     const struct hvm_io_handler *handler;
-    const struct hvm_io_ops *ops;
-    int rc;
 
     handler = hvm_find_io_handler(p);
 
     if ( handler == NULL )
         return X86EMUL_UNHANDLEABLE;
 
-    rc = hvm_process_io_intercept(handler, p);
-
-    ops = handler->ops;
-    if ( ops->complete != NULL )
-        ops->complete(handler);
-
-    return rc;
+    return hvm_process_io_intercept(handler, p);
 }
 
 struct hvm_io_handler *hvm_next_io_handler(struct domain *d)
@@ -326,25 +318,15 @@ bool relocate_portio_handler(struct doma
 
 bool hvm_mmio_internal(paddr_t gpa)
 {
-    const struct hvm_io_handler *handler;
-    const struct hvm_io_ops *ops;
     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
         .addr = gpa,
         .count = 1,
         .size = 1,
+        .dir = IOREQ_WRITE, /* for stdvga */
     };
 
-    handler = hvm_find_io_handler(&p);
-
-    if ( handler == NULL )
-        return 0;
-
-    ops = handler->ops;
-    if ( ops->complete != NULL )
-        ops->complete(handler);
-
-    return 1;
+    return hvm_find_io_handler(&p);
 }
 
 /*
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -56,13 +56,11 @@ typedef int (*hvm_io_write_t)(const stru
                               uint64_t data);
 typedef bool (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
                                 const ioreq_t *p);
-typedef void (*hvm_io_complete_t)(const struct hvm_io_handler *handler);
 
 struct hvm_io_ops {
     hvm_io_accept_t   accept;
     hvm_io_read_t     read;
     hvm_io_write_t    write;
-    hvm_io_complete_t complete;
 };
 
 int hvm_process_io_intercept(const struct hvm_io_handler *handler,


