Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFCF95971A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 11:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780965.1190546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sghdO-0004yZ-SA; Wed, 21 Aug 2024 09:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780965.1190546; Wed, 21 Aug 2024 09:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sghdO-0004vM-Oq; Wed, 21 Aug 2024 09:28:06 +0000
Received: by outflank-mailman (input) for mailman id 780965;
 Wed, 21 Aug 2024 09:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sghdO-0004r2-5U
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 09:28:06 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aae88cca-5f9f-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 11:28:04 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bed83489c3so5258556a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 02:28:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081c59sm7941809a12.85.2024.08.21.02.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:28:03 -0700 (PDT)
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
X-Inumbo-ID: aae88cca-5f9f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724232484; x=1724837284; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9eXvc0/XNFWbfD1Y0YUXBJmDdyD8fskrF6ICMthJKc=;
        b=BjIzNdl1kpCOigeNDX1K3+Ky6Fz8OR9iSd6HQp+tz4Ru/QwSQMQKbivwl8DYkFg2zH
         2m0S3wVjKcKWyfbeHr4l7E4paNGiAlQL4WshVf4m1dtyTdGSLUUW+Jx/1RaIh3z0p1vb
         cn2I2KIbyFUmIco6UlbDOWIsv6PHvTqI3L/N3DTaXBmiof5fnemKimxYpkL1jseKqw/p
         NGtl45RRsjAgaeYzJYluOOf5bT4a5NqGTMnNVJDxD93i5UZjb9/TCLGS8kDni90VlWn0
         Bwkf2Xbej6c73ptdvT+4d+LhRgFGrf/A54y+P0TJn/0HwU32uPWq3t3TmtZAbl26QE3v
         E8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232484; x=1724837284;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9eXvc0/XNFWbfD1Y0YUXBJmDdyD8fskrF6ICMthJKc=;
        b=GRsCa4nfowEuy1mcWHC3tYEvaGCHXG0Jq21H0Vv7G4+QXrEMdUhCKPmXG6reSJDi4i
         +ZbPwrhEgoeOwl5PpfDykMVcYibNWa13U94Lee1S6c/ycTred62YNuYXMX0mX+va+p84
         BphiKFhTJVHN02OlOBLBBfA3Y2KfK35fFkKKsRyLpoKphnupLRY6V2NGtPCygouu7nJ9
         ydP9xDe9lKJQymYUZydeIhTTImodmYdCY8nyglwqBciTDkMeYvlX6Dat+bKnb+oIj5zY
         FEPVkzUN94JXBnrcNK9HFKM8zQPYt/DCqNc9ZXeKAndK4oyOo21+p+Togl1zy6iznb9y
         b3mg==
X-Gm-Message-State: AOJu0YxrSdCfdkbn8dhH0Grp9wGR0Ti8cS3aMLymNUuKtu3t0FEBAnGn
	WSUomYqDaGV9HGoqawerYtvsshDDqiZeEDeXR6FI2gdTfTQs5V+5ONj6FGx/Xjz8Cbb0Lxl4t1s
	=
X-Google-Smtp-Source: AGHT+IF915yDoTsaLhJfnahFcvuuoFHZLCoielCK5GVeFeQwUI+Duiz/8cUbtj0koGBD3Mu/4Q4S2g==
X-Received: by 2002:a05:6402:1ec3:b0:59e:a1a6:134d with SMTP id 4fb4d7f45d1cf-5bf1f25d267mr1182909a12.32.1724232483833;
        Wed, 21 Aug 2024 02:28:03 -0700 (PDT)
Message-ID: <fb917afb-62d1-42f0-83e6-276cae67569d@suse.com>
Date: Wed, 21 Aug 2024 11:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: set (fake) operand size for AVX512CD broadcast insns
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

Back at the time I failed to pay attention to op_bytes still being zero
when reaching the respective case block: With the ext0f38_table[]
entries having simd_packed_int, the defaulting at the bottom of
x86emul_decode() won't set the field to non-zero for F3-prefixed insns.

Fixes: 37ccca740c26 ("x86emul: support AVX512CD insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5929,6 +5929,7 @@ x86_emulate(
                                evex.w == ((b >> 4) & 1)),
                               X86_EXC_UD);
         d |= TwoOp;
+        op_bytes = 1; /* fake */
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xc4): /* vpconflict{d,q} [xyz]mm/mem,[xyz]mm{k} */
         fault_suppression = false;

