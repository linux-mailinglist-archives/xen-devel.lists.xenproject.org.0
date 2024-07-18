Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4612934B7D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 12:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760339.1170154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO4m-0007J4-PT; Thu, 18 Jul 2024 10:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760339.1170154; Thu, 18 Jul 2024 10:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO4m-0007HO-Kg; Thu, 18 Jul 2024 10:09:28 +0000
Received: by outflank-mailman (input) for mailman id 760339;
 Thu, 18 Jul 2024 10:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUO4k-0007HE-HW
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 10:09:26 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf71500d-44ed-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 12:09:25 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so149069f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 03:09:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc6c35e3fesm3616075ad.226.2024.07.18.03.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 03:09:24 -0700 (PDT)
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
X-Inumbo-ID: cf71500d-44ed-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721297364; x=1721902164; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjY9ludigvyXvUHU4qLDGwaBXfQGaH7kqtj+jdk2E30=;
        b=MaAr5WqEVckFhuGswGPqKJdNYyot8ZmPEM13A6GkXyLqePd9xj+VPUZFUmpV1ydROc
         Lnh4LPrTItLXJPP2xHCHMTCC518CCNGgYU8l0dI0l77kDjoQrPOcqIobvmf3QrAX5wEr
         CwcFhnjzlCJdRzBzQsSxYbAgXwpPRv9ul6UnWvF4ti7uKjZ7pOJoQuJTX+JrxHrkVWKM
         8uiWcs5AuybbeSwuVvOYiNt7XvD5PNA9Cz3k96qqWkGpEbvXAsW6zOVChpSE3iAVfDeB
         resaeNaOPHwvEa7IyRnyIenLiwoeSFvz2ooZ0zBs2tA/r1UjGlEeN2ULSfXt/zydCsvf
         Iyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721297364; x=1721902164;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjY9ludigvyXvUHU4qLDGwaBXfQGaH7kqtj+jdk2E30=;
        b=X6ynF7pTlyz8Smq6joC9AH8ZnFACKSdNCOnn2Ed4nBAw0V46djKoy+Gy2QNBE16B2t
         EEBy4a/VeB97WalLRnA6BB+h0GotmD0ak2pLaZ/LbhwLJR9ehE+AGG6B4zoxcqNGP/ve
         kecb1gKINuDVWPhQLuVRL6ElK07MwuEyX1JgZ53PDqUZCFxgE42RNgYkkbyjpDMSx7CC
         VuyTajeUwZkEI1P78y03LIfS7dxPnpgrAXvV7K/Mr0IhWRC1EdM3vFlNIHsac2+8almB
         eIeZxZm5iXpiqhZI2tExBYonI8AY5TFoT1SPGe6ASMvL28taXtzM3zKFrVxItTyQHCQT
         GKGw==
X-Gm-Message-State: AOJu0YzPnXcPSqLTtHQP9kFgbg7IxTu/FcfKIT1TeymQtPL5PWfuBptb
	fYZfvwuGSHKGTbVhLuY4IDHzOj9PhkjbV4rzWeK7SPUnUQH5GW05PSVVba7CT88lPe4k+u8wvlE
	=
X-Google-Smtp-Source: AGHT+IFZZ5irNbFlke7Az39P2qNW18/Xnq3uUXrmOqWdHCMGvzKYknriSRs+Te/Q91MSf3ZPxDanOw==
X-Received: by 2002:a5d:62c5:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-368315f1eddmr3216708f8f.8.1721297364591;
        Thu, 18 Jul 2024 03:09:24 -0700 (PDT)
Message-ID: <9f56adbc-5e16-4b48-a7f0-e72c6b8f1999@suse.com>
Date: Thu, 18 Jul 2024 12:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: drop gfn_to_paddr()
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

This really is gfn_to_gaddr() in disguise; no need to have two variants
of the same logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -20,12 +20,6 @@
 #error GUEST_PAGING_LEVELS not defined
 #endif
 
-static inline paddr_t
-gfn_to_paddr(gfn_t gfn)
-{
-    return ((paddr_t)gfn_x(gfn)) << PAGE_SHIFT;
-}
-
 /* Override get_gfn to work with gfn_t */
 #undef get_gfn
 #define get_gfn(d, g, t) get_gfn_type((d), gfn_x(g), (t), P2M_ALLOC)
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -562,7 +562,7 @@ _sh_propagate(struct vcpu *v,
                 if ( p2mt == p2m_mmio_direct )
                     sflags |= get_pat_flags(v,
                             gflags,
-                            gfn_to_paddr(target_gfn),
+                            gfn_to_gaddr(target_gfn),
                             mfn_to_maddr(target_mfn),
                             X86_MT_UC);
                 else if ( is_iommu_enabled(d) && iommu_snoop )
@@ -570,7 +570,7 @@ _sh_propagate(struct vcpu *v,
                 else
                     sflags |= get_pat_flags(v,
                             gflags,
-                            gfn_to_paddr(target_gfn),
+                            gfn_to_gaddr(target_gfn),
                             mfn_to_maddr(target_mfn),
                             NO_HARDCODE_MEM_TYPE);
             }

