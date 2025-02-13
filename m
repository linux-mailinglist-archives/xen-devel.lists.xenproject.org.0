Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4B9A33D83
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 12:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887335.1296850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiX6f-00072z-G0; Thu, 13 Feb 2025 11:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887335.1296850; Thu, 13 Feb 2025 11:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiX6f-00071M-DI; Thu, 13 Feb 2025 11:10:09 +0000
Received: by outflank-mailman (input) for mailman id 887335;
 Thu, 13 Feb 2025 11:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiX6d-00071F-Bt
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 11:10:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1463f6a0-e9fb-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 12:10:06 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab7e3d0921bso141644366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 03:10:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d9cfsm109796566b.139.2025.02.13.03.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 03:10:05 -0800 (PST)
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
X-Inumbo-ID: 1463f6a0-e9fb-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739445005; x=1740049805; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liBKIgPvaIL6G58wmvOnPOKz4xvoQ2dDv1iqej8in2Q=;
        b=GoMMHJmBEoIysfy2nNSlzq2iAcugbS0p6Wr608D8OnOtTvfuNoxY1yp7u1jI3vHC93
         eTsPWFMFaacF8WG7XXM+IyCfOSQsynjuxMTRPNb7fDNVUYUts4RaXJ/puQKyOC+IY8Ec
         1Z06d2qS4q4DK9hq1wvTnueQDpbGF79jQ3w2BqTHsRL+AdoYGQvckMKfauL+V9GxVtP4
         Z7LyOo9iiWM/XytmMAehStELx2sYPqss0J4o19ULS002WvJT2yTQqCY7brT292CBaMZQ
         uBqN90xJ4Dxfw7fcpTuU4YcaVfMRfJ6EoNaeRjLcwwmh6DS5pAEZmRZrSmMP+hiqW54s
         kEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445005; x=1740049805;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liBKIgPvaIL6G58wmvOnPOKz4xvoQ2dDv1iqej8in2Q=;
        b=iTqQPD6n3tyPp/oqu7NPW3k1CHKEZUoxgooW47Dxpc+gzjGbMYnNUzs4q9+fA2wIeg
         R66Zj2FF3zG3j/4GlfLFrAF0wupmCn+tJQCm/dS9ray9inw7swrBUrd4ARNX4lMCnGCp
         vULqS2MtDI13g9nfgEb4eewHpEqyAyrCWMEq2jOwTH7EwZGJOHYIS+qIYnn5Dw1IxVSa
         ifGpu0YUvumrcY4jkbtZobGYH9XeuZpre2n9Q9keME7mICsgZGpZsEej/Y8L2KtVvWLC
         Nnqq39KUe6Vuo6HhEE9HzItQtAmGTahq8OPZYoGdH8TIV/yOFd6uB4frIjIKPODt3yG8
         VIsw==
X-Gm-Message-State: AOJu0YzksIrhQ9YfIjl9G/XcGLXKuNAXbxRHKsx6xLasK2IJ/c5mYWzn
	w0ypO98enC1wgVsQckeRS/45LWsf+wAx3UszvyU/DweBTZpH3cCfayTPe6Z8uSQueQnohzuFwGI
	=
X-Gm-Gg: ASbGncs1x4IwoD97uP2//JzLaZSLD1wMmyEFW9Tog/T+LunIpo59cC1xBfS2V11p2Co
	CYam1zES+HREdjsNgTXzK030Qrfb82TLMC2UXicfzkSV5osGYHtcucqS2gm81+sxIIp1nfjJKVO
	ZfL2VSv09XZtsWalTDanTx18zenoemUoV+uWSBBQ7KImZ0NSddE8gvrUiDL14jvZMHwM3Ne2vUc
	WM6toJGovKnpcmuPDS/Fd1XDBXAopvq/R0/aGmdKPQC+SZtxBB6njAkWMhnM32AWkQLLEDlXpDU
	l0zfUU6c3uEceVhMSiKE+J7cVHaTEnS8vsT3WvlROg1r49GQMWpBYqu7DIllflGBJ5RWC1iXAwU
	+
X-Google-Smtp-Source: AGHT+IFkMFN19WJ9dplXK+ZMsySlGeHLxavmQmaIPKEBdnMhAPniK1tujm0pTtFddavxk333YqXBFw==
X-Received: by 2002:a17:907:da8:b0:ab7:cedc:4b1e with SMTP id a640c23a62f3a-aba4eb88d96mr249926966b.3.1739445005330;
        Thu, 13 Feb 2025 03:10:05 -0800 (PST)
Message-ID: <96c4125e-1d40-4e79-838d-852517b9d5f4@suse.com>
Date: Thu, 13 Feb 2025 12:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.20] x86/HVM: use XVFREE() in hvmemul_cache_destroy()
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

My adjustments to move from xmalloc() et al to respective xvmalloc()
flavors was flawed - a freeing instance wasn't converted.

Fixes: 23d60dbb0493 ("x86/HVM: allocate emulation cache entries dynamically")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Noticed while backporting, where the conversion needs undoing.

--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -123,7 +123,7 @@ static inline void hvmemul_cache_destroy(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
-        XFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
+        XVFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
     XVFREE(v->arch.hvm.hvm_io.cache);
 }
 bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,

