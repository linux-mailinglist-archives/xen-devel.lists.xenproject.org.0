Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C39DA2EF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 08:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844472.1259975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCHS-0008H4-US; Wed, 27 Nov 2024 07:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844472.1259975; Wed, 27 Nov 2024 07:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCHS-0008Fb-Rs; Wed, 27 Nov 2024 07:16:10 +0000
Received: by outflank-mailman (input) for mailman id 844472;
 Wed, 27 Nov 2024 07:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGCHQ-0008FS-SQ
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 07:16:08 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e99b3a-ac8f-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 08:15:58 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3824709ee03so4647279f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 23:15:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc3defsm16004605f8f.70.2024.11.26.23.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 23:15:57 -0800 (PST)
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
X-Inumbo-ID: 72e99b3a-ac8f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcyZTk5YjNhLWFjOGYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjkxNzU4LjI2MjQwMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732691757; x=1733296557; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9JJasHAmJqecPBIfCvHphvkGatt98NoYrxqBmhg7Sg=;
        b=NYG94KyXSle8IgZwreWgxzET5ZNX6yZnCt9kf2R93PTJpwVk6a0Ehu2rcOH+p80Lpl
         4O54yt/CJbTW7MSgfOhJiPkmJ/EMdrT/xBEgd+YSBMmUsEPil5beXVbTIvkljqBIe/Am
         C+2OnsrXPOdS0RFoJIRVUjsm076rNGeYeup6AUVsWqJcs6SVpogmGcomK5wzZicAm+oc
         hNBT76H8z2+imbCmAv8DWie7dM7pfToYJUJtao8iJfv82F/JHrwoH3FR2fCeNY9kutSS
         rMsGABYwby6K+XJdFw6qHHPDHsdk9WbzXfpbcKcwveDanhaFNueS9Cr6bxiCuaNDYZN/
         BCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732691757; x=1733296557;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9JJasHAmJqecPBIfCvHphvkGatt98NoYrxqBmhg7Sg=;
        b=lHhdEhBUi33WBS0a+QCntLjrTiKP0nHe/cMBmue9/PczKN8Jpke51JjLM0rbVbp+RE
         tRq7O3KdlysxeYI+e4SbGjAyJOcNoIjBKg7etGdE0v/RGWRYnbZX7NrlNNMQs6L8MKfZ
         rK3dv18teMjUNzCT+UakehUsmxRoSDKLYLsLmBOQKli+JZL8e+9hsgd8nFFLrpqV8Ph1
         BKFrE/Kn+bZd/KN4QpeYd0vEr9V3z2VJMesbUuqn79rj10WSaw3WV2CpealMt43mVNrR
         CTWBjHynnjJ9/pU0qjIac3kphcqn1Ta12WD1gvjhSOSMdJcm7Lbts2XZXQRBByWa1UMC
         iX0w==
X-Gm-Message-State: AOJu0YxGLQz/u27P7ezh4jKJHVjFgEZb2luQuZqXUv7HAmv/4ZLmwbwq
	pMMLahTnmYU1cg4W4/S4CdEIs77WGY8i6yyMXF2fAFfJw+4mxFaTeC+6W32jS4Nn6Z1jAm5W9lU
	=
X-Gm-Gg: ASbGncupL0qYI4p1Yqtc+8vdXZ83pST8xXoBL3NYypztRjj9Tj9p6IXkTv5GC3w/sme
	zYGcf+HY3k0AJWzsbwl1kxhfWRt/Pa5y5BFRFjJ4FMrlUpJjfUhQReAdjLy3DYtQfgfyuTUUHtu
	BaPNqQ6TSw+BBl7yJrthbihAyq9CG/yC2gpMNl/DQp2XAmipYlrNkh6av5ITY+1yjJqpvKyM/Bf
	+oVp6D++f5+QtTvMQY2ZZNYCeYb+HxKjvwTS5H6yuHZBFy7nf5fjfayF+5PdtrAg+SPwVo9IPH4
	Scu4rpZcPZ//TzHcAf1Aq42TobgLgoc50+0=
X-Google-Smtp-Source: AGHT+IFRlfNH6hANt8u1x5ACpHREiYdHyBp5PCA/dtYhOVCzb0WR0lt2whbupOgicUNuUj0+X8oWTA==
X-Received: by 2002:a05:6000:18a3:b0:382:5284:989 with SMTP id ffacd0b85a97d-385c6ed74d4mr1404238f8f.46.1732691757587;
        Tue, 26 Nov 2024 23:15:57 -0800 (PST)
Message-ID: <157a6ac0-6929-4e01-8588-7e5591427654@suse.com>
Date: Wed, 27 Nov 2024 08:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: MOVBE requires a memory operand
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

The reg-reg forms should cause #UD; they come into existence only with
APX, where MOVBE also extends BSWAP (for the latter not being "eligible"
to a REX2 prefix).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6824,6 +6824,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         vcpu_must_have(movbe);
         switch ( op_bytes )
         {

