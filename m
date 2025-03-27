Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6AA72EC2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929029.1331652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlI4-0004ZQ-Hd; Thu, 27 Mar 2025 11:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929029.1331652; Thu, 27 Mar 2025 11:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlI4-0004XG-F4; Thu, 27 Mar 2025 11:20:52 +0000
Received: by outflank-mailman (input) for mailman id 929029;
 Thu, 27 Mar 2025 11:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txlI2-0004Tu-Py
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:20:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8907f5db-0afd-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 12:20:49 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so6973325e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:20:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b4ce9sm19837735f8f.53.2025.03.27.04.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 04:20:48 -0700 (PDT)
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
X-Inumbo-ID: 8907f5db-0afd-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743074448; x=1743679248; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DERAtXp836KqIEYl0wfo2SWKXigwnSKvCZoX3oWHr7A=;
        b=dwUNjepxBVHcB1L3xa7uvt2wTfJN1AWl+si3vDBLzZRu+PoSjRAEdGBD2cX1RXQ9h9
         opHs4yOHCSpgde0xvhXqjPoB+uQM2oM7cqlpichJQdSYwGzB8cog3Lz84VCKV6+fV3oY
         iqwy7cMVZIv+HbUA1rSy7fAZ9iRop+CtzTXg5GVFvRSlX/qYO4Ns0N3NoOV1jaAzqSES
         9NEGfEj6o5XrBW0xVFlw4sQ/H5Xl001uGZr9ZWPCGpSsyoLb6JUwLfmqRSq70AR3S3JL
         A1G4s/bY6Uv7SMSayfixQtpIJGDrBGvsBq9VUCkrBOpsjYe7FB3ic3KEFVpG/ihgKWCP
         44+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074448; x=1743679248;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DERAtXp836KqIEYl0wfo2SWKXigwnSKvCZoX3oWHr7A=;
        b=WyH9WSDezuwvFt7T3ctdegGDgo6J7wZttK5djLQJA/R8GbyNhnRg9xAH8lw0smjZxv
         aVAjCk1hodfNNrB9w4DNzxOc9ehFpuLawZUmXDv2ywRdICvHu39aL1J9cT3XlCXx9Ewf
         AYE5ks18hGqMzJbLA2Ep7WlEd5xpeeBu3cZdegXSxJf5o0YPJ24MJ/TfLG1ixJo1BL98
         zRf+0VZJ0qzhtyCew6UI/QP/aJY68jLNOcdLJwItSEgmHgTvQvgnDp4LGGSPIojPy7kZ
         9VbGcK1iVRKx7MeHSx7luWBMiphUv39v/whh08Fo5VfrxrBHW8mWfjk6Fa3ik1NUHpbG
         nNsQ==
X-Gm-Message-State: AOJu0Yy/V5+S2hNW1VOeiHJI8uqwgnUuOwaY2I1Kag9iHRsvSObscVAk
	Y56Vzc0XTWmcfFIR1H40giCsnH4OyeiingZtsZyCm2vAATDEcmve3klrQbU/fCN4CwrTpU5oTEM
	=
X-Gm-Gg: ASbGncviGC/pkyGPkwKtaXoDrXtya3D7QrlH4Ao4T70OMHRseC6vqo26nj2a8IJ4u4P
	cPgPCevxJOdkbzbUyImj5Es//aRr8ai1gkcAr51A91L2STJvSeaj1JqkM0mMW0xc/S+ICVh+gGb
	KY2Peg11Q0QwxL9ffcRTqg8PnlwRM+2LTaNzXmzA3Rd6vxdvRj+oHbDfuW9KWrmHmVIjx0uqdgc
	b6xIiaMNCtIJsJ2fY6OixC7pIB6uwsn9LMm+4NeayBmgOlXMbztjJE47khmH9oL+R8rResHaxMB
	OfqwmAc/8tcm3eZZV5qLcxnrYaqJjoiE4JFOdDBB1dhzecHJf0xQZDtV5JUS9lbzZUNkFBPYnPp
	SRoXyrnnS0wWgePe15zOlUEbG4FNa9g==
X-Google-Smtp-Source: AGHT+IHPwpDdU9GlgJy6W1YxUhV9huIUcrUh0gBqB1QiafEQpVRpR/x6o3TpjqNdOMHRqDO6LVs0Cw==
X-Received: by 2002:a05:6000:400e:b0:391:487f:280b with SMTP id ffacd0b85a97d-39ad1754420mr2759388f8f.10.1743074448610;
        Thu, 27 Mar 2025 04:20:48 -0700 (PDT)
Message-ID: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
Date: Thu, 27 Mar 2025 12:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
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
Content-Transfer-Encoding: 8bit

Unlike stated in the offending commit's description,
load_system_tables() wasn't the only thing left to retain from the
earlier restore_rest_processor_state().

While there also do Misra-related tidying for the function itself: The
function being used from assembly only means it doesn't need to have a
declaration, but wants to be asmlinkage.

Fixes: 4304ff420e51 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Contextually assumed to go on top of "x86/MTRR: constrain AP sync and
BSP restore". Functionally there's no dependency.

--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -124,6 +124,8 @@ LABEL(s3_resume)
         mov     STACK_CPUINFO_FIELD(cr4)(%rbx), %rax
         mov     %rax, %cr4
 
+        call    mtrr_bp_restore
+
 .Lsuspend_err:
         pop     %r15
         pop     %r14
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -610,7 +610,7 @@ void mtrr_aps_sync_end(void)
 	hold_mtrr_updates_on_aps = 0;
 }
 
-void mtrr_bp_restore(void)
+void asmlinkage mtrr_bp_restore(void)
 {
 	if (mtrr_if)
 		mtrr_set_all();
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -66,7 +66,6 @@ extern uint8_t pat_type_2_pte_flags(uint
 extern int hold_mtrr_updates_on_aps;
 extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
-extern void mtrr_bp_restore(void);
 
 extern bool mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
                                    uint32_t msr, uint64_t msr_content);

