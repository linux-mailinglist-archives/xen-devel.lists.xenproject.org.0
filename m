Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3254A9049E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956165.1349653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u534I-0004Gp-1R; Wed, 16 Apr 2025 13:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956165.1349653; Wed, 16 Apr 2025 13:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u534H-0004E9-Uq; Wed, 16 Apr 2025 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 956165;
 Wed, 16 Apr 2025 13:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u534G-0004E1-J2
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:44:44 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32781db-1ac8-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:44:42 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3770119f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:44:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a98c3sm21248175e9.38.2025.04.16.06.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:44:40 -0700 (PDT)
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
X-Inumbo-ID: f32781db-1ac8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744811082; x=1745415882; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgT/jigPVbrf9+jjKoqLzjywt4b2xWEJhEWDyTrJeWU=;
        b=akakL/Trzktqpnnt7nyQ4JDQtAeyS4HOuTAvhblbhFawbXqvrMxztv8ZtDPel+3zHb
         j+6zIUAkW3IkgiWVd7JZtt890KlXZKhAZ44HWw0JB3m7AaJzWFQcxtojk0leD9jIiYib
         1XC2JKOHf/x+z4PaRjPS3OKoDfO7A9VQbh9jFCdyhxD/S3d3wKqZTTREtIwjL1l2Qx4b
         E24R0+qMEyspCBH59oJ3OlGgfaQm/niJOx+eBUaYoEtJBFc4pzFU2aIS/h3CHNYezcQj
         h0r9xQB67tugxRCDEY6xIwjQGQvvegcWsvBM9BOArMGirVTwZUqwjqc5xZnI8TqIVOkl
         xfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811082; x=1745415882;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgT/jigPVbrf9+jjKoqLzjywt4b2xWEJhEWDyTrJeWU=;
        b=mtLJ6ivC7A9dFpXr3f7uwFnnpMWcRQaXHVqJeKQV7TlbcRxE7E6Ch+3L2eckpAb/ZD
         01hMebU3LOnWqXCZx0Z3IZjtJzrSeJYKWJq7Trgysi/RQU6jTtfkBTAzPbd6WOB2Svlq
         iAJBSsriboP9JCUFaJiaQNqi8ZK6/URg6RMwyrIfjvZPmcDx5tAQGkAH+xz3omVloHCI
         /sjn7KW4LCbRFBxt1kErfmmd+ee5Rrrq27k6TX9sBb2tWgSDgD7BEoH7ZcNcocKqeFJ2
         ptUk/pg2tw3GNMLf41K+BoVDeXW1PdwNi2FtwtQaYrpr5Omw/0pRI7QIBVRrZt2rLD02
         Gv7w==
X-Gm-Message-State: AOJu0YxBiyoTOTSm9wku4cHwBoTkX5n69f/sTZMI94TkJBTdjbzSZLuQ
	nRmhJ+bWS74zpGR820yWFkJNm/Mcbw1F4rju/EarAscVH1at2bhueEP3oP4FwIH0DMjqIqEmNS4
	=
X-Gm-Gg: ASbGnctzNBHg26ahdLEkm+dccTDVTXsJMVcmJx8MdcFFIcBBY/p4eqteeWwA1N46vA6
	W0FCQirpJvmr3Tnsj/itvQzc8nBIHYALiqOZf04diX85qOzUEmNgzCSkMPNmV7G4aE6WMs8sB0o
	A0Qxbw5pm0okFKFZGK2RGw2xEXgyplhdVeeKAVP+S8AijCHBnrPo1JkLwef7YvWiAV+y21nm3jP
	QiHPqqZTTFE2rP6c359y4HAvi+RSaqp/9ghVPkzSBCrsntk7QWOnwgufDASGFS7O7yxArzpKyI2
	I7BnVcytnZnH/ETN7KCsNln4L0fEBPHW6vwGeK5P6z+i6QtHAmnjUwgcF3tSlLe730TH03JRO8+
	VdiWmIlvxNwAttO0ngr/VeiVwMQ==
X-Google-Smtp-Source: AGHT+IF8jjDY9CdAEwKdwUT9DLwgbtmU8pErAjV8I2MfFVy7lHxzSQfVYkqs16zn+zwfu2EIyYFzKQ==
X-Received: by 2002:a05:6000:40dc:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-39ee5b16f89mr1754056f8f.22.1744811080972;
        Wed, 16 Apr 2025 06:44:40 -0700 (PDT)
Message-ID: <793580d3-3fd8-4715-8a34-bf9965dd5938@suse.com>
Date: Wed, 16 Apr 2025 15:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: update repeat count upon nested lin->phys failure
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

For the X86EMUL_EXCEPTION case the repeat count must be correctly
propagated back. Since for the recursive invocation we use a local
helper variable, its value needs copying to the caller's one.

While there also correct the off-by-1 range in the comment ahead of the
function (strictly speaking for the "DF set" case we'd need to put
another, different range there as well).

Fixes: 53f87c03b4ea ("x86emul: generalize exception handling for rep_* hooks")
Reported-by: Manuel Andreas <manuel.andreas@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -825,7 +825,7 @@ static void hvmemul_unmap_linear_addr(
 
 /*
  * Convert addr from linear to physical form, valid over the range
- * [addr, addr + *reps * bytes_per_rep]. *reps is adjusted according to
+ * [addr, addr + *reps * bytes_per_rep). *reps is adjusted according to
  * the valid computed range. It is always >0 when X86EMUL_OKAY is returned.
  * @pfec indicates the access checks to be performed during page-table walks.
  */
@@ -865,7 +865,10 @@ static int hvmemul_linear_to_phys(
         int rc = hvmemul_linear_to_phys(
             addr, &_paddr, bytes_per_rep, &one_rep, pfec, hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
+        {
+            *reps = one_rep;
             return rc;
+        }
         pfn = _paddr >> PAGE_SHIFT;
     }
     else if ( (pfn = paging_gva_to_gfn(curr, addr, &pfec)) == gfn_x(INVALID_GFN) )

