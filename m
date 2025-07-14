Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBADB04516
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042977.1413090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLkI-0001wS-DL; Mon, 14 Jul 2025 16:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042977.1413090; Mon, 14 Jul 2025 16:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLkI-0001tj-9t; Mon, 14 Jul 2025 16:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1042977;
 Mon, 14 Jul 2025 16:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubLkG-0001td-DQ
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:09:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef4c6bac-60cc-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 18:09:35 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so42554085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4d599sm10514588b3a.139.2025.07.14.09.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 09:09:34 -0700 (PDT)
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
X-Inumbo-ID: ef4c6bac-60cc-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752509375; x=1753114175; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mizCdwOOFhfSa/zrYX2pWjdfYq4/mCT9L7B0Zj0JE6Q=;
        b=aSUEDyLBjwCMNUbY2rzwaV4C8pUyQN9fTvADvR2wkcgUVzXMUWPbcltFU/amWPHyB+
         +VfTjZyDHgy5IPAMF49EEj6ODshtgl0ALC236NSuXhahx3SeYp74+yX3TO/AcjoxdrC3
         eqFwVU6TOW9cT3PtPOL+kkmK0eQGsH59tC8qpcYosX+2cYMtwCLi876kBPG79SPCwf+Y
         tD5GyUevwXowoaFSC2t5HpQDxAEI9bn6LS2w6p06vhn8RqmM/i7cyasxBYJyT/7ESZkv
         Mjx1wegbnwHEco/G+hMJObpj+fU3xilVwpMeXnTYBohBFI/nYMXlo5nVkXKL4ZXtBYfe
         iHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509375; x=1753114175;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mizCdwOOFhfSa/zrYX2pWjdfYq4/mCT9L7B0Zj0JE6Q=;
        b=h+SfKeeX+/yi7JOGTGPLuDM5BK6XpicdCRbdkxmS+Av3DuKVBsaE0d17pk8xaVTIPL
         O6PWyoSJA4M7809xipzoJWm32hF6VdHLKnOwHSjt1/nI5h/KCouAlARfvWq38jD2WPaU
         mw1VQM39fuhBhaHPCM4byJh2nf+SBhukxKuz1P1Jyi1IfXb4OsE7RenulsX8Yp/u6/2n
         MsNuLYR8m+L3wLu5sZWuw888Y4MXAA5OqOFZkaThuzg4e7O7iWBakToVjwkoz8ormC0K
         kvdL+jk0TWvvPiaW//Sq7jJUmzV2fVLvL3jqKAnNDJKvj5vM+uNgb7fVZxhk1qCVQAoN
         /QVQ==
X-Gm-Message-State: AOJu0YyIsQrCkugOPAYL0FpKuKOFuHX6f0kMf5EwLtdTrYonm0yQP404
	zzuGWm8n6hij+Z6k2iHuZhGvWNJ+DZZSdsBHTuMMsGaDqq6eRcZvMs6K+jQI7ekJxcm0QcFgN2Q
	MlJQ=
X-Gm-Gg: ASbGncspvVYTzyvTqK3gHZmxUB+raK6JHJfsj4lvv8Ld2tmSz79+ibVChM+Es8e0k0q
	gUPLL5FEy4J0cgTVbnSRI8zZ6Ps8n+8YCmPNfAzO0G+dH237905Nq4xuwf4QWIbeuS9JqHZLOCU
	i+IFtLbPPmHpYYGj7dHiZd2pvO5lH38sGkDtMX14s1M3IubF/yL8lw1uJGvWxqqTcrHtSkgCRAZ
	peac18hSXPKJ6+btNc2RNgClnZi4VKmtMcMew9ChjEHLArcX006SVa+EB/meJgeYdyvA+PVkQWy
	DG+8b7Z+kUXrxUNPFtYwPruVcP4VrRmSknbM3nJ0WRKjz7FyejyYyMufsClUsvARRlOWpXkwLlA
	Ln/yZrFe2D1BOwjOwEBHgj2pFyLqKTl1bbsiNDtOfTaMUO/YBnxYe2KBo2mz98Zt5CxIwVfl5rW
	1YzTfRl04=
X-Google-Smtp-Source: AGHT+IHLYjGlfw2H0WEZBZ5OYlzd+5bht8IB33VtONdkaaluZazoTWpCoK9ArgxIcHhc9DI4XgsuAg==
X-Received: by 2002:a05:6000:20c4:b0:3a6:f2d7:e22b with SMTP id ffacd0b85a97d-3b5f2dc0740mr6420752f8f.18.1752509374666;
        Mon, 14 Jul 2025 09:09:34 -0700 (PDT)
Message-ID: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>
Date: Mon, 14 Jul 2025 18:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PVH: modify permission checking in hwdom_fixup_p2m()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We're generally striving to minimize behavioral differences between PV
and PVH Dom0. Using is_memory_hole() in the PVH case looks quite a bit
weaker to me, compared to the page ownership check done in the PV case.
Change checking accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -176,13 +176,27 @@ static int hwdom_fixup_p2m(paddr_t addr)
     ASSERT(is_hardware_domain(currd));
     ASSERT(!altp2m_active(currd));
 
+    if ( !iomem_access_permitted(currd, gfn, gfn) )
+        return -EPERM;
+
     /*
      * Fixups are only applied for MMIO holes, and rely on the hardware domain
      * having identity mappings for non RAM regions (gfn == mfn).
+     *
+     * Much like get_page_from_l1e() for PV Dom0 does, check that the page
+     * accessed is actually an MMIO one: Either its MFN is out of range, or
+     * it's owned by DOM_IO.
      */
-    if ( !iomem_access_permitted(currd, gfn, gfn) ||
-         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
-        return -EPERM;
+    if ( mfn_valid(_mfn(gfn)) )
+    {
+        struct page_info *pg = mfn_to_page(_mfn(gfn));
+        const struct domain *owner = page_get_owner_and_reference(pg);
+
+        if ( owner )
+            put_page(pg);
+        if ( owner != dom_io )
+            return -EPERM;
+    }
 
     mfn = get_gfn(currd, gfn, &type);
     if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )

