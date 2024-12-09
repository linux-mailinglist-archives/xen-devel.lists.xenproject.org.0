Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402069E9A1E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851507.1265565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfSG-0003DC-W8; Mon, 09 Dec 2024 15:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851507.1265565; Mon, 09 Dec 2024 15:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfSG-0003BE-T9; Mon, 09 Dec 2024 15:13:48 +0000
Received: by outflank-mailman (input) for mailman id 851507;
 Mon, 09 Dec 2024 15:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKfSF-0003B8-DH
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:13:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ead4540-b640-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 16:13:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434e406a547so15348155e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:13:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216364e45d8sm32659085ad.175.2024.12.09.07.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:13:43 -0800 (PST)
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
X-Inumbo-ID: 2ead4540-b640-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733757224; x=1734362024; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzrfAF2Vxlh90FlTHEHNpTSTTNMD975Zjla/Sj45Vx8=;
        b=Z9neWs8oEGiMyd/CwVemSy32D0Z3C/pyHBwSL9L1tvkY8TpMGRecb1LbROLFjxre8O
         /ucoWzh3mLI8wZ7pe3fvpae3cdDv5Gi0dJHF3I00fdVOoj/U056FUGHuDLbOEqZfYA54
         Lhfz7tayhOYUVPBC7eV+JSa7scnVAcFoU3+shVrUtLGpxAr8eoFWRnHD+l4QZCC2PP3x
         buxRoL+NiRWYNau6CD84itnX0px+ZMl2n23XXtw4aeZmYg3+oN34UkNsmMP45wfo1bn6
         ucsVUTTiAIMARBiUpJV7fg84jEdOt7CyTpoR2le499Jv8mrKxgFuRiHoxu3KQiJhvm3m
         Xo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757224; x=1734362024;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzrfAF2Vxlh90FlTHEHNpTSTTNMD975Zjla/Sj45Vx8=;
        b=Ew3+QjOdYqLptFgvhwzvnOoHer+T5QLHHhc/t3PhnqJg6awl04VWwlyrjk901MX7E1
         0q/JKXcNUjyNs+IGC4htoPtKZGbgYVRaRYeSXssztukoKKLgmI89Ek4irc7g3552WWFt
         ifPVvxxysYJgtCTr6X3SoYPHeloZpGMEzO3FOE0mlCY9s33cqVHmMB7+Z15v1c/keDXo
         vbrvRfjHZH2Je3pffaYMQUYD+LKpcNNY4BA4SuwBY1tWp5tWb30iITtaVh4dNTtcwwaW
         7u4jxYG2g0PSejHZKzfMNZOsPDj/LJkPAVo14PLn01Y9P/9+OAH1G/2ZnKTIk5K63wt5
         2BjA==
X-Gm-Message-State: AOJu0Yzn6YwTVIbgeUSSRWznuR/QB+ezoIb2UU8OsfsyiT0Dzas7/3xW
	gLwGw3LLmMNVy+JhkEF91oihLwYqWXH3V9jnikZaSnyclTwEMihU5Nf+KEYjSuOaoNO+OSLfaCc
	=
X-Gm-Gg: ASbGncvydRZY5ztAPI07uAJjReGbc6uMjT+W4TOsxlD6GwA+XHcpx2CQuEdA/Mg14BE
	c67h2j/shav7U41MmQTReZBYJ21kA3WojwG7T8HG1v7xBfZt24F0XU+DTJZ6Vor3FUWWCc4lcqr
	PKs1x2HjfbhZ9wJwVJCt0zC+glcwBkkOuLWTaY1snBhPqKAFRQ/tfLWSX3R8IskQOo22TS2F7I8
	olDqt2QlUR5TUm0WA6Rp23XDe4jgD4Jy0uxFcsqJLSp3+9FFNZgFlzXeKQHII7Ivu6vkDDyXzno
	EfD/OyIz1Td98JImlpV7LDlhNR0w+pyyYHg=
X-Google-Smtp-Source: AGHT+IGI4hi7Ie3whTXBH1YT8k3O/KIJNSflyKUUSEIrPBl62b2ZbCsjyV7jRVZu9tOcT20HMvuM4A==
X-Received: by 2002:a5d:6daa:0:b0:385:fb34:d59f with SMTP id ffacd0b85a97d-386453d2acbmr839879f8f.11.1733757224478;
        Mon, 09 Dec 2024 07:13:44 -0800 (PST)
Message-ID: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
Date: Mon, 9 Dec 2024 16:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
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

Fields of anonymous structs/unions may not be part of an initializer for
rather old gcc.

Fixes: 49a068471d77 ("x86/fpu: Rework fpu_setup_fpu() uses to split it in two")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -306,13 +306,13 @@ void vcpu_reset_fpu(struct vcpu *v)
 {
     v->fpu_initialised = false;
     *v->arch.xsave_area = (struct xsave_struct) {
-        .fpu_sse = {
-            .mxcsr = MXCSR_DEFAULT,
-            .fcw = FCW_RESET,
-            .ftw = FXSAVE_FTW_RESET,
-        },
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
+
+    /* Old gcc doesn't permit these to be part of the initializer. */
+    v->arch.xsave_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
+    v->arch.xsave_area->fpu_sse.fcw = FCW_RESET;
+    v->arch.xsave_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
 }
 
 void vcpu_setup_fpu(struct vcpu *v, const void *data)

