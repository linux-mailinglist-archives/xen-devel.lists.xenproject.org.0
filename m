Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56B82B1A3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666380.1036986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwso-0005IM-AA; Thu, 11 Jan 2024 15:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666380.1036986; Thu, 11 Jan 2024 15:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwso-0005Fd-73; Thu, 11 Jan 2024 15:22:14 +0000
Received: by outflank-mailman (input) for mailman id 666380;
 Thu, 11 Jan 2024 15:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwsm-0005FK-IY
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:22:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310eb6cc-b095-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 16:22:11 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e55c885d7so22774885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:22:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:22:10 -0800 (PST)
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
X-Inumbo-ID: 310eb6cc-b095-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986531; x=1705591331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=KQFvNwtc/UE89YBPxY89GP2ckf7DXHiC2VCkp8V5LkzpveKpbp3slVufYIpx8MAkKp
         MJEpYzp8jVQRNoVjK/5E2e0Gy3rL2Y7bRsPo1c5Te47g8TqztkyGArrQ3A79JJCbh42r
         a66IEGeo5+Ck2gSNUUQ/hnnAoC2S68LcH7KuJDyVcSyfMXkH6Vb+D1iZIGoWkzA8j11i
         yKGqFzhf3vU+wGAj52RWFueNEBFvbnjMorLVICMWUeAqDH/Ki8+SNMLuCcdqfL+WpRJE
         Vrh3gdlKtFqcFsMXFt6upfTjB0Tu6j7nShKuSmDN8R9Lfas0baZQEAjEq/0GvMDAXogR
         s6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986531; x=1705591331;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=Qjho3Ch+V6+LXpePR6HyCyHXYem9xVz9eAbsUvHvJaguB7cFvKTo3sFi+p8byq9ySd
         52XNMZ/A9VW6KHDxyYMA4spBTIKUOGQJBH8abnjFSCwlHeqc3GMfCL8fMwzZaq8CCFyN
         w5P4JRHvHdQNrhRksKfaFDUIWBMcTIdzsE9cekDyMPgl8O13Tj3qk7+5elYjSmPPtd3S
         fWoD0APOAP/OqVpUpswm3XtRi/aGXXU634U2ib4x6bKa7uMvHYj13zcCOKBtGZgmqoy7
         9WpQJHON4pgYHnIofhhMhcddgSMqxkX8DO0COnncF4oRd3nhN0kIOPGuSv2baQp17fbJ
         pDjw==
X-Gm-Message-State: AOJu0Yw5HsGmG3vRRdkkDJWX8FOi0gvfdOvJoe8sL7eQH2yE52eUdkku
	B4Gd83mQB60CHbVmSUepSkx6XU4Nk/68AnzYHkW7lxkvRg==
X-Google-Smtp-Source: AGHT+IEzL++dGMBUaXBsTL9iNFV3DktscG+XvFSst4IQStMlDWON/cU7xbdf2WsawJuVvzayiqm7dg==
X-Received: by 2002:a05:600c:3d95:b0:40e:4905:3fb with SMTP id bi21-20020a05600c3d9500b0040e490503fbmr466778wmb.32.1704986531094;
        Thu, 11 Jan 2024 07:22:11 -0800 (PST)
Message-ID: <837da45e-c5e2-4327-996a-13abf962adc8@suse.com>
Date: Thu, 11 Jan 2024 16:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] x86emul/test: engage AVX512VL via command line option
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that we have machinery in testcase.mk to set vector length dependent
flags for AVX512 tests, let's avoid using a pragma to enable AVX512VL
insns for the compiler. This way, correct settings are in place from the
very beginning of compilation.

No change to the generated test blobs, and hence no functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -215,10 +215,6 @@ DECL_OCTET(half);
 # define __builtin_ia32_shuf_i32x4_512_mask __builtin_ia32_shuf_i32x4_mask
 # define __builtin_ia32_shuf_i64x2_512_mask __builtin_ia32_shuf_i64x2_mask
 
-# if VEC_SIZE > ELEM_SIZE && (defined(VEC_MAX) ? VEC_MAX : VEC_SIZE) < 64
-#  pragma GCC target ( "avx512vl" )
-# endif
-
 # define REN(insn, old, new)                     \
     asm ( ".macro v" #insn #old " o:vararg \n\t" \
           "v" #insn #new " \\o             \n\t" \
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -7,8 +7,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDD
 ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
 
 cflags-vsz64 :=
-cflags-vsz32 := -mprefer-vector-width=256
-cflags-vsz16 := -mprefer-vector-width=128
+cflags-vsz32 := -mavx512vl -mprefer-vector-width=256
+cflags-vsz16 := -mavx512vl -mprefer-vector-width=128
 # Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
 cflags-vsz   := -mprefer-vector-width=128
 


