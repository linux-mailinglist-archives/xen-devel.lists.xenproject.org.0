Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030BADD3B7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018323.1395229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYkh-0007pz-8Z; Tue, 17 Jun 2025 16:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018323.1395229; Tue, 17 Jun 2025 16:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYkh-0007oP-5x; Tue, 17 Jun 2025 16:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1018323;
 Tue, 17 Jun 2025 16:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRYkf-0007f6-TX
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:01:33 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b111d6-4b94-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 18:01:31 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54836cb7fso4139209f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 09:01:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe168a0c2sm7592910a12.60.2025.06.17.09.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 09:01:30 -0700 (PDT)
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
X-Inumbo-ID: 55b111d6-4b94-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750176091; x=1750780891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1gWmQLQxYAEESQC8axErZtnimL9IBwDep0Ap1Gsnze4=;
        b=OI5i2BN2KJr4N9JVzxlJA9fCZt46qUHTvyo+AQHJqrsYGzIcv0/WZu0dNiiDUSA5TN
         NS4cncvOBGbQKk5IhLWzxZJ+AJY3fDVinYEPL1wTKkS5kfnbL2QQPMrsNZp1kasPGG6S
         TCANY5RJEj4lSNwKzzwhTKzCHeIRtdmJugpCl2Myx7Da4TO2gyGFQ9kwmlnwylN/e2Iy
         eFm5I+t5sfraSvpEBBlt6fjUlQ/y6vORYkhGMEfLV4wcPrwnf61NpRoTh83SacQWvw5p
         bJfv9024LNkUT06eXcBAQnK5v6LbU0nusfwwiQGEU8X/U380pVnxDqMSHMYFaI6ScNuJ
         UDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176091; x=1750780891;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gWmQLQxYAEESQC8axErZtnimL9IBwDep0Ap1Gsnze4=;
        b=E7t4cZc12Ts4nOxqptA1aNU77U6u02QLD8ObYImibhnFMGhxYbuIbM+cRQW7mvEgy+
         uHGGqSGH42/0U2uZksy1gZP7EPUaO+ItvGFKgG4rbErWN5mtV2F1Z2mGrazYoiIbR0HZ
         +yjprDCXRZAS4Yi3Rg0Pz7xBbDH+Sc6M474U1qDU+6vK8qFEz3f+6je5YZ4OAauN8dE2
         IkFvjHKnm5offU9wfRzq+bZ2RP2nc3pUsuk7/VwCuWZlD8Vt3gXPRRwiEbav1ztgAhdz
         X51EtU6BJECIbEk7lB3UxQTC7n3MMp+wVYpCIVflWyJN9xhQYVd5lOFX152HH4AcpckP
         YABg==
X-Gm-Message-State: AOJu0YxqXypWYnulRBjYFS1d+XR8+7qNGoMCRljU9zy4aHUs+827zGAs
	JtiGmRzm2+ZS6m6DPXCBWrMslmThyCWh0iX2FZofguPShcaqkyljKe9qCcepMdtAKMMNzjG1o79
	MKdI=
X-Gm-Gg: ASbGncur02BNCIaRpROaZMQ+bV3Y5e3QCCSp3BXVxSa639u0xoy/L1/V/zk5N8FuPEy
	MXeQ3P+/oRwor7AL7mFuwKFhnMDxZF5hT0xsseiAx0j6NTP5kgVj8yx6xJ55dyV2FzQ5ZGWuNvV
	5LygggI8woUCO28wTC4qPixoSWX1o2ZpYuttMvLsSKqmPtNkEb+6nGD7JvrD/pkmfgXNEfXqwk6
	hZoq7KQ9qnN8zsMOSQESzGKgS+gHj9eX2mPTtRFiNrMpV9XUphNe7XrhCqr/2DRFK7vmJbGdKqP
	ZmjzShrrBptuHiMNgQZz84j+jiqrcTSphI74lLwlf/3v7GgLHr5PLXxNIb3mmmfdiTvhF6a0Ay6
	8Vo2melumMEHSH6SkjZpm8zdRMYg4Hag2CyDkeQZHjMgs9pM=
X-Google-Smtp-Source: AGHT+IEijHlGceymDYKDl6o4LnhCwxti4p6phzM8aOgYlCUv9bYiElLA/eBJVIACtiNFVUBe0QtYIw==
X-Received: by 2002:a5d:64e3:0:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a572367931mr11854548f8f.1.1750176090784;
        Tue, 17 Jun 2025 09:01:30 -0700 (PDT)
Message-ID: <808044df-5892-43e8-9a35-10f1d9a971c9@suse.com>
Date: Tue, 17 Jun 2025 18:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] vVMX: adjust reg_write() for 32-bit guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
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
In-Reply-To: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using the full 64-bit register values is slightly wrong in this case;
32-bit writes of registers would normally zero-extend the value to 64
bits. The difference may be observable after switching (back) to 64-bit
mode (even if as per the spec upper halves of registers are undefined
after a mode switch, in reality they retain their values).

Fixes: 33a7028fec44 ("Nexted VMX: Emulation of guest VMREAD")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the sole affected VMX insn (VMREAD) is invalid to use from
compatibility mode, and hence the more expensive vmx_guest_x86_mode()
doesn't need using here.
---
v2: Add code comment.

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -378,6 +378,14 @@ static void reg_write(struct cpu_user_re
                       unsigned int index,
                       unsigned long value)
 {
+    /*
+     * Outside of 64-bit mode, make sure we don't store non-zero upper halves
+     * in GPRs.
+     * NB: A long-mode check is sufficient here, as insns this logic is used
+     * for will #UD in compatibility mode (and hence not make it here).
+     */
+    if ( !hvm_long_mode_active(current) )
+        value = (uint32_t)value;
     *decode_gpr(regs, index) = value;
 }
 


