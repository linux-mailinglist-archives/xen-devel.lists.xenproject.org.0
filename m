Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35863CCABDD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 08:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189273.1510084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW8s9-0003bb-L9; Thu, 18 Dec 2025 07:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189273.1510084; Thu, 18 Dec 2025 07:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW8s9-0003aA-IR; Thu, 18 Dec 2025 07:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1189273;
 Thu, 18 Dec 2025 07:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vW8s7-0003Zr-W7
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 07:56:28 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e112494-dbe7-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 08:56:27 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so136093f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 23:56:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244998ca0sm3397102f8f.32.2025.12.17.23.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 23:56:26 -0800 (PST)
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
X-Inumbo-ID: 0e112494-dbe7-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766044586; x=1766649386; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/819DSxskHvW6Dh9rErBDLF7kFwnJ3mm2P4u44VQT5s=;
        b=AVBAGi3oMvEPxXuadYz2jEd2hjncdbpMRgQD7hfv+sIOmhBJTe7b8WE0N2lyikj8LG
         LpKdeA8cxRaprmSb7miRtVFclh+PYlTad+GKpT+tmlW/R1bJx6UfMNh5ruwmeShXkggt
         ykTp60pk+5ZRA4SlDXLYgeAUTCvl7XVzvfA+aH4Xk3Xl089zvnugeSfulsXc2V/hSvld
         9VhjWN+uWZnAYSxy649VYc6QQTaFaHQ0pRmSEBNhMnX95hdniDPFJX9lFhz2vbTmkQFf
         RYKzv3YUi//qKQtxCzUsnN73WNaf1RKWYxLY4dHAH9ZZs0AiaVMl7szGhLVXMzBXBSpP
         e7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044586; x=1766649386;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/819DSxskHvW6Dh9rErBDLF7kFwnJ3mm2P4u44VQT5s=;
        b=Ci+oiL0ovNzItYgNs3Er0lp8h+7cABXCnBx2UKnA6x0wogp8NBYzp89MUOXwPqwQOZ
         iuQUsM+U4B6kwzMQRpYPXZR0Kw6yAPbZTp5utIyIQDXRUp7MXT8Q+uJyCPFkQ9Th/PVo
         CNS3IhfTLdlmInoPL5lFgp71DCOiNtPEtjdM/hnEZIfJOTHQvSDf9MxpO484XPQz7a8k
         sK4IBi7k2fEaFgA8crKDwvJojByAA9uYW2QOxgibvC6quoeF5/6eOKkCElEhvC0N+vX1
         sPpK/mfgTvIJo3drvYozNTDmGLCwA/dzljJ0ryHLkjMJvyh0IxQdC2D73FQLto263RlZ
         k0mw==
X-Gm-Message-State: AOJu0YwNk4WTeYypErKyM+rexHnu5yYmFQtbLGfoc6fx+glhx16eC+96
	qvxfW3Gn8e4foArrygI3AcHHNitGCYm+3GHOruYbK+9GLQ4fQ018Ons4qlxl22sS36glw+feWZF
	jk04=
X-Gm-Gg: AY/fxX52mlP63CLwcHOq7vlsIQ2bssTZ1ie7vfAU7rZYnzghYbl3GR+qrEwtusqEKBK
	kEUMxyjXd0xd073f0E/0dxQAF88yvTjwEF9AmAu20AW6EqMgF3k+/SoN+qqv3juGZkZqKH4+t/3
	gdUCwxjsKOMJ+VOegzwRmFM0yrQaU58HLEvnM5ZLfxDXyC9qH1KkpTBLLzX8jZ148MB/A1ZL150
	8/vjoB9fNs8H8iVNR/Ko09dgNEAA8H/gsx9b5WnNVGKYnsJTiewRmh0m3r1htAyVahbKqv9FzoD
	Nd1eKbaIQSJOEZZrC8Vl+WkbXafSHyVrmPSyRoUhIRYGQsaujr7zIZ9vCHTqj0YSovp6cnmkWGs
	HJ5dS61gLFJlXRdB3vfpFw56fYMjltMpJE9dyG8qqOAJGHTVojGZKyRNg903RRdvv0nZxnOg91O
	oduvkMrOuNZfw99FKnth/8800oUfxpP21RUxBWzUnmU7OZLyRTQ7Ey+5Nvh7JkelY/lmG/gzUBO
	BM=
X-Google-Smtp-Source: AGHT+IEJ/R1bhdowa6vmOAcvppKj7sS3TouoYj0keMc88ZyxiOZRt7fGasY56V5suKaGd1uo+g4exA==
X-Received: by 2002:a05:6000:2909:b0:42f:9f18:8f40 with SMTP id ffacd0b85a97d-42fb490cedemr22593402f8f.42.1766044586337;
        Wed, 17 Dec 2025 23:56:26 -0800 (PST)
Message-ID: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
Date: Thu, 18 Dec 2025 08:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
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

Legacy PCI devices don't have any extended config space. Reading any part
thereof may very well return all ones. That then necessarily means we
would think we found a "loop", when there simply is nothing.

Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the minimalistic change to get rid of "overlap in extended cap
list" warnings I'm observing. We may want to avoid any attempt to access
extended config space when there is none - see Linux'es
pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
then also avoid us interpreting as an extended cap list what isn't one at
all (some legacy PCI devices don't decode register address bits 9-11, some
return other non-0, non-all-ones data). Including the risk of reading a
register with read side effects. Thoughts?

The DomU part of the function worries me as well. Rather than making it
"read 0, write ignore" for just the first 32 bits, shouldn't we make it so
for the entire extended config space, and shouldn't we also make it "read
all ones, write ignore" when there is no extended config space in the
first place (then in particular also for the first 32 bits)?

Should we perhaps also log a warning if we exit the loop with non-zero
"pos"?

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -839,6 +839,15 @@ static int vpci_init_ext_capability_list
         uint32_t header = pci_conf_read32(pdev->sbdf, pos);
         int rc;
 
+        if ( header == 0xffffffff )
+        {
+            if ( pos != PCI_CFG_SPACE_SIZE )
+                printk(XENLOG_WARNING
+                       "%pd %pp: broken extended cap list, offset %#x\n",
+                       pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                pos, 4, (void *)(uintptr_t)header);
         if ( rc == -EEXIST )

