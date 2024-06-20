Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B629109F3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 17:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744805.1151923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJob-0006fJ-Dh; Thu, 20 Jun 2024 15:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744805.1151923; Thu, 20 Jun 2024 15:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJob-0006d0-Ai; Thu, 20 Jun 2024 15:35:09 +0000
Received: by outflank-mailman (input) for mailman id 744805;
 Thu, 20 Jun 2024 15:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKJoa-0006cu-3k
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 15:35:08 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aad41696-2f1a-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 17:35:05 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso10402831fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 08:35:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f5e72asm138794955ad.308.2024.06.20.08.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:35:03 -0700 (PDT)
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
X-Inumbo-ID: aad41696-2f1a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718897705; x=1719502505; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nS3y0u2v2G9v2vb2glO+/ToJqD5MnEVtbXcCrJlbUio=;
        b=Rlt+5RIVaGRFdzGrKNWgqdT28RIuKq01YN/kZJQ4gTAZXaw7pwAPHdIP4nWc2LpPyw
         K0DIPbXg//qarqJqq9uOTtLm7V8ZhBbdHAfMxxCeGgeLm46QhsxFlw7Uiy1lDOn26hmt
         1f7UXPxLGnzlAPqAHxu5NjLVuj4gPRpyTnN+s54iZ9gFXkWOlnTlz179y5IX4znz9zng
         Nm1DF398psvmnLZwdw1M1ngs4bbG36NJaoVifHeHZsDUKmXn6IBbX1zYQQQSsK4l/5YG
         Sgivd3schJFqrRzDDEurH3AYCT6VPnQHKzt8arAqVxGS+A8QkTm0mhWd8MJq/4zYaRAc
         IzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897705; x=1719502505;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS3y0u2v2G9v2vb2glO+/ToJqD5MnEVtbXcCrJlbUio=;
        b=Ny3v+VPA2jUHPsZYqSjDsDJvmMg4NKrLrIaUv/tpgnoIA7lRVQvfoDjhVlUqPpMSFg
         N8EvjmLhNYmvOp9nmSyMcM/0ZSqc/zVpPKMUH1qsNoN8QCrZRGn+FmurkeJz8dN6V5nU
         QJdFzWUam9LA+InxoVkFC+6epJ2HUOfCwYN/T/Vw3oQwNYLYLtYelBas29KQTqfLPqtW
         2nyui3PWg6RSddwELhy7CveUNoKZI6RzgfcZX+YNmFv27sufXKCcPQGq0M4bcHXmFz6+
         i4G83DnBHqBQs2K20dEc30J4cnG44rLKwO5Kl001lXvfrwiOBR2zDe/2lMtPf22eGXuQ
         DhTQ==
X-Gm-Message-State: AOJu0YzUgVSr9nYzzRel9HStvNuE1d+ZrdZDqmznYV7fbBX5QbivsaJa
	5pr9flbLXLnjkept+ETMwyGBuyDsTVUWFDi0ia1YIwMORJFoc1LW07QncY4Mj/wMgrMIx0hFzo4
	=
X-Google-Smtp-Source: AGHT+IFHmOYUEx3G4c0dOgxnahi33m0pyZI/jTd8xDMaXHGGk1dPsv6aXViFuTOy9NMHD6sCxpmVrg==
X-Received: by 2002:a2e:9e91:0:b0:2ec:4aac:8fd6 with SMTP id 38308e7fff4ca-2ec4aac928fmr5503741fa.10.1718897704877;
        Thu, 20 Jun 2024 08:35:04 -0700 (PDT)
Message-ID: <42a8061a-b626-443a-ad42-0e05b043c6c7@suse.com>
Date: Thu, 20 Jun 2024 17:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19?] libelf: avoid UB in elf_xen_feature_{get,set}()
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

When the left shift amount is up to 31, the shifted quantity wants to be
of unsigned int (or wider) type.

While there also adjust types: get doesn't alter the array and returns a
boolean, while both don't really accept negative "nr". Drop a stray
blank each as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I wonder why these exist at all; they're effectively test_bit()
and __set_bit() in hypervisor terms, and iirc something like that exists
in the tool stack as well.

--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -445,13 +445,13 @@ struct elf_dom_parms {
     uint64_t virt_kend;
 };
 
-static inline void elf_xen_feature_set(int nr, uint32_t * addr)
+static inline void elf_xen_feature_set(unsigned int nr, uint32_t *addr)
 {
-    addr[nr >> 5] |= 1 << (nr & 31);
+    addr[nr >> 5] |= 1U << (nr & 31);
 }
-static inline int elf_xen_feature_get(int nr, uint32_t * addr)
+static inline bool elf_xen_feature_get(unsigned int nr, const uint32_t *addr)
 {
-    return !!(addr[nr >> 5] & (1 << (nr & 31)));
+    return addr[nr >> 5] & (1U << (nr & 31));
 }
 
 elf_errorstatus elf_xen_parse_features(const char *features,

