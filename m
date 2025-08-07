Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA9B1D9B5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 16:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073123.1436043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1Jv-0005wT-3i; Thu, 07 Aug 2025 14:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073123.1436043; Thu, 07 Aug 2025 14:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1Ju-0005tM-Vj; Thu, 07 Aug 2025 14:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1073123;
 Thu, 07 Aug 2025 14:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uk1Jt-0005tG-7s
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 14:10:13 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38871493-7398-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 16:10:07 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so1851994a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 07:10:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7ac0sm11716313a12.35.2025.08.07.07.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 07:10:05 -0700 (PDT)
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
X-Inumbo-ID: 38871493-7398-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754575806; x=1755180606; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:cc:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qcWRDASZvWnS76y/EF4UrLjGb0SZE4/xgnO6tscPnUY=;
        b=Ki8hraSwoADRHVGJmXqdhb8o4cfUAdylLA2JAvj4LbbhBMG7M3uYh1yblBuvwKYmcQ
         2ngC+gREEwS66jUGL5vXrdlb4xMsLfFlGbi6DP8JSN9hmTjqzeA1tV8wovkh8RCnHGf9
         JDDcsYt8rSR0ShrFXBUq0GZKrIXcwioOwtuhxC56nTay+iBcJt5hpkyVmONCVYDYw6n/
         k5DVh+1hGz/48Kv3J5j52cP9sZGlajod2Zv9Hz66ThVj1TFJAci7K2Anvi5Jo96qBGff
         SmgbJXST2374ga/ofEB3eTPObEtgv0sfwkQGzgb5qI0TdXKgFeK86Vbf5sl4euE7KDnQ
         xt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754575806; x=1755180606;
        h=content-transfer-encoding:autocrypt:cc:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcWRDASZvWnS76y/EF4UrLjGb0SZE4/xgnO6tscPnUY=;
        b=QA/QdeuISne024TJ6fd1ABOXcnlrAG5cOu4x3YyM+fTqJ9I0HtVmikW8jED+5uaCGo
         s/sOoS1GSzpaNkgDptaeERyr5USwHRVcfDJCP8/dQOjrwbIP1/uJH1yBNdv0vDeIq5Lp
         A/hkk08kmHzB7Tjf1yD9E0M9gTVLv0tCPscRJa0jBXT2Ie6vczFdVsGG3+lUMh4sroOi
         fG9lsbUN3eH6mxm4dvadDZjUBHCrkNmbCS49KpX/HXgyiYKeT+WYgUCS6+nv3QZCVd3k
         xFZOZ7KrOvCJ2c1Eg9G23ZCQzXBGv4A5PC9/hICYoMDCCNo/ujGRfcti+qwda5CNIPcZ
         Hu0A==
X-Gm-Message-State: AOJu0YxJ6vgmSegAxBatgxICMIfWUAMllU7XONiRtLUhtgZ0xIMl0hKm
	TM1ZYTywRwuGn9JXcqMQuT/9LP6URlRFpdk/bFCxTICfdkdqDZ0uXRWMtZt30O1daEcYp2B5LTJ
	gFp4=
X-Gm-Gg: ASbGncuC+ea5fnG/Yp69gHVgXBSC7W5hlEn+qAW9QQANCE1JH1cUG5zPUDQU31BsJnv
	7e81Ibv5oVpZjDIa0HqDX6ILOgoaZEsQZanoQFhMRiCU/KXVcNQpTs0/goJFTZqFddhXU3wTAwo
	jFVB5HVVhVPuPmDiBTaJrXrZGwsRVOUVFi1CjVpc8Rf5gJOo0nGLQFELEbxBZU90/fnpgazuJpu
	gZkchPjJp79uWdTsC2JDB1WkC2hBmXmzt02p4ahynpQBUnGFmHEXvWND2uTcc8KXXN9CGbfAl4t
	wfFJRA3Oucs/o8n7TrNH/AmTreejhtD7Y3KIRVL8wOTXduMlMbnFAtsZ5Euoly4fJk2YCfFFZh3
	ES3nep3nPXO2mJHCClg727b7F1gyzuk/QEIqlIzTlQfCBH165tK9QMvisSli4sNaT+5amaQYsG8
	HRuAcfWzQ=
X-Google-Smtp-Source: AGHT+IFxaIGaT+GwUZ/iUH9kD/9Jaf8riy+xHQAkoP26K7bro5cZuJxOtBxCjp9iwjy/Z5cTbkCFbA==
X-Received: by 2002:a05:6402:4409:b0:615:aeb8:e4da with SMTP id 4fb4d7f45d1cf-61795fb97e8mr5140832a12.0.1754575806292;
        Thu, 07 Aug 2025 07:10:06 -0700 (PDT)
Message-ID: <28cadeda-613c-471d-b0d3-1709004a75f8@suse.com>
Date: Thu, 7 Aug 2025 16:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: check bus_to_context_maddr()'s return value
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

The function returning zero is an error indication; we shouldn't try to
map MFN 0 and then treat that page as a context table.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Whether to really have the ASSERT_UNREACHABLE() on the unmap path I'm
not quite sure about: According to my checking, the early bailing from
intel_iommu_remove_device() is what covers the case where an earlier
mapping attempt may have failed; in all other cases a mapping was
previously established. IOW while it should indeed be impossible to
hit that path, there's not really a problem if it was taken: It would
then be no different from finding a non-present context entry.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1499,6 +1499,11 @@ int domain_context_mapping_one(
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
     maddr = bus_to_context_maddr(iommu, bus);
+    if ( !maddr )
+    {
+        spin_unlock(&iommu->lock);
+        return -ENOMEM;
+    }
     context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
     context = &context_entries[devfn];
     old = (lctxt = *context).full;
@@ -1853,6 +1858,12 @@ int domain_context_unmap_one(
     spin_lock(&iommu->lock);
 
     maddr = bus_to_context_maddr(iommu, bus);
+    if ( !maddr )
+    {
+        ASSERT_UNREACHABLE();
+        spin_unlock(&iommu->lock);
+        return 0;
+    }
     context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
     context = &context_entries[devfn];
 

