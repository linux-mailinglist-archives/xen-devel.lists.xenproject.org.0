Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1BC8A16A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172761.1497863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFrw-0007cZ-Te; Wed, 26 Nov 2025 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172761.1497863; Wed, 26 Nov 2025 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFrw-0007ZU-Qk; Wed, 26 Nov 2025 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1172761;
 Wed, 26 Nov 2025 13:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFrv-0007ZM-Ig
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:47:39 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74198923-cace-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:47:31 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3ac40ae4so3831777f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:47:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052cfae0sm40760525e9.8.2025.11.26.05.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:47:30 -0800 (PST)
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
X-Inumbo-ID: 74198923-cace-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164850; x=1764769650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RbUNHWV6a/cCWWdmNgliwzpyWaes9TUdP1Z5dG5rKLg=;
        b=MmNA/qZZLP094AQ0nqIEJxZRbk9XYeA+JXCMJxZezMv7ESzXCdsAT5rsGF++82uTxb
         7Z384DIKNWU+1Ux6aoaNespyN+OWMOeMciQS2pWGy62yazfCttXoPp+lhnINv0HoN1/l
         sxicT/zyGJZ1qjjl3r90RKOfpPZcJic/D1CYyMPobFK19ztdV4b/lb4q/LUlpK0mS035
         5r0DhUVdVW4dVNCGyRoGP3W71Bu9sYfeMUbrOy+V/7ybGHbGunsV9HTxUqr4b9skwN7/
         NupM0cBt97ERyorSNUJ9OVlJbkBWtNMq8ocVg3RHEhYydJmN1k+UflHq3wkNKGfELgXc
         ZbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164850; x=1764769650;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbUNHWV6a/cCWWdmNgliwzpyWaes9TUdP1Z5dG5rKLg=;
        b=h6PccJmChsEEm4SuU/uFJ2SO7p0JMdWQJQgVmr5VB0bz5UXz9OfCxfruS6JUyUlPti
         Xrhyt/vNRxoJ62exhFwyTEDO0tyyBSdw/Fu6vKP9a1zf+OVjvvqPTWIjwKN/kpHxKzi3
         6ni9e2oFOeGvlqHaJuT1zYYA9M2mxIjpJ0Nd2hlxomN1YzOt+0EaMUL/RxbJMfXjOYdH
         USwJfonamFyThMxKKu3Yc+jsUOjnHmE356aBuv+1plug49ZBgPFJiMqma79VyuTh5wgf
         qn1kJpUTF2ifKte2zQxelM5CKRy9Di4YHBm1oJ1mF8Gm0rqQX1rwsfHbNtHZsWKeKd+J
         Kuow==
X-Gm-Message-State: AOJu0YzurO4R17a/RBCy2l0lPSHfXN3ToR6f50wEwwBWOzpiK8ZLGV5D
	mk8eO17RD34p3TwOaflj5vaHDmtnfeJsrcC5eyvlYD2J6tryV5/SP1DM3tuYNCakwlXsEPYUsoU
	djH0=
X-Gm-Gg: ASbGncupdib6/i2FEKf4C2rh07QxoBboJ8fhD5y6H8ji1NSGaBVPOQ4+P9PiB34DQM0
	hSfAK08gyAApmStTvQdK1JlLMLJNkV6Irxd3l2MHzvuad9LC//e+P1pi+BduMeKVd9YAsbeT5YL
	ZrsOBIx3ZkdEpyGL1ZqlUJ/jaMO3s8pHlU05rhoJz/eu+bccOlSVlPsimqcpq6Iqg/nJeX4Uuh2
	c7SDBL4uQa5ftIhr9LhAydTV9216jOh556zTTdq7v8z6mMBmGv20pmyHvlMYWys0QQ0aWVakahJ
	Z1a0hdPDO/AeOdvMGSdugicv+tOkV4LvfeW3NinvhgesmhD1F6BJrWs+HU6YNwXcaiMcJP7fcmY
	mijKR2OUG5IPCrA7aaTPB6GDR+wxZHFF9EzBqp8LLsAHtxSO1q1797KOE8ZT4XqlobXQURQQfyp
	WWTF/VeHBPRZwXvKJeVcDH7IRpLaxBL3ztADtb7VBkfS5kOgOD60/jr8omy09wy5Y69+k9Aw2Yn
	j4=
X-Google-Smtp-Source: AGHT+IEt+8mEiP50lkP30xm1DvjExe35wYgfvqpXvxvqzVmQ2pZMRV2o5ZJoCCgPm6Ems9C+f+WAHQ==
X-Received: by 2002:a5d:5c89:0:b0:42b:3ee9:4775 with SMTP id ffacd0b85a97d-42cc1abe271mr21852865f8f.11.1764164850419;
        Wed, 26 Nov 2025 05:47:30 -0800 (PST)
Message-ID: <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
Date: Wed, 26 Nov 2025 14:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] symbols: drop symbols-dummy.c
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
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
In-Reply-To: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No architecture using it anymore, we can as well get rid of it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should we also drop common/symbols.h again then, by moving its contents
back into common/symbols.c?

--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -74,8 +74,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 endif
 
-extra-y := symbols-dummy.o
-
 obj-$(CONFIG_COVERAGE) += coverage/
 obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
--- a/xen/common/symbols-dummy.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * symbols-dummy.c: dummy symbol-table definitions for the inital partial
- *                  link of the hypervisor image.
- */
-
-#include "symbols.h"
-
-#ifdef SYMBOLS_ORIGIN
-const unsigned int symbols_offsets[1];
-#else
-const unsigned long symbols_addresses[1];
-#endif
-const unsigned int symbols_num_addrs;
-const unsigned char symbols_names[1];
-
-#ifdef CONFIG_FAST_SYMBOL_LOOKUP
-const unsigned int symbols_num_names;
-const struct symbol_offset symbols_sorted_offsets[1];
-#endif
-
-const uint8_t symbols_token_table[1];
-const uint16_t symbols_token_index[1];
-
-const unsigned int symbols_markers[1];


