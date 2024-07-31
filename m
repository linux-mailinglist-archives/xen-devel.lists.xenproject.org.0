Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA27943204
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768861.1179746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAJE-0004h2-6a; Wed, 31 Jul 2024 14:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768861.1179746; Wed, 31 Jul 2024 14:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAJE-0004fT-3U; Wed, 31 Jul 2024 14:28:08 +0000
Received: by outflank-mailman (input) for mailman id 768861;
 Wed, 31 Jul 2024 14:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZAJC-0004f0-Ke
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:28:06 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 193b185c-4f49-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 16:28:04 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso655104866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:28:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab52c95sm774594066b.76.2024.07.31.07.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 07:28:03 -0700 (PDT)
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
X-Inumbo-ID: 193b185c-4f49-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722436084; x=1723040884; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEJQNnvugDIBbizdVNG78IQrq1DoSEm7TicYeRhT4V8=;
        b=MJT0/j5Tu0xLjuhvZitcZH0P/zMZi4ze9Yrfz1nEaBDGq0qBkpxlaEEIHNDQsPS6gI
         mE3WW24XXaiF8nx6hspRHPOm6h884iAeo1pEKb1cva/7maLsU3VT2Hmd9K762Vj2hZGx
         FMoR5YAaOw1WfDtx5XudxirUCFgI6WDRmf8arPkURYm6vmaO3VH2A+6kTS+KAG/+7P+J
         8E9+JmmngLzoVS5aF1QuYXOtiGLV7vFl6nFEiXvNQBFMW5BkgLgfXITt/TQJ/BJcQN7u
         qAPMhn0od+0NDTIEDsSa6XdO7KNqZPngO6sb4ytu8KtPZreytzQajPrcWrEorXuk0QeW
         P8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722436084; x=1723040884;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEJQNnvugDIBbizdVNG78IQrq1DoSEm7TicYeRhT4V8=;
        b=h6CfCXaSI7bsCW1OK8oETvR555xRkuB3E0pJW83avOHhF2BI0M3zYD3Xx/e6o3MjOH
         /BbGNvLoP6Mqy7xnxg/Oil4W0z38x/e324r90LIhH3ZYI8XrKNtLjcDzvPu3Xhz84/HF
         TRV4hKMZFN4+0OYyWpidfbkv47kJpZNLeczy42xNNp3dZh5AjnSuHUQGB9wQmucuNmOe
         7ZaGzZt6FrnLI+W3iRR+vmG03NqpPAk30nAxL6bUoGYm/ZUnz0DxbpRT/J51gCKgD5gE
         LODExoUDULR2Kimys5ieoDvV76ZK3YEl8TspD30JHFefan+JWSlAx15V3iGZoBeXG8tY
         c5BQ==
X-Gm-Message-State: AOJu0YzTGeD1IUKvbPnu7wF4uicnuoLX1MDI8qYcqUiOJVuEN8dvpPc4
	R6+Flo92pPkbzQ+rVyuCSnOSfi/PUT7jPmM/rjKnpIzNBF7Kk+uq6mM9ZG8zO6O1yDp+25L66go
	=
X-Google-Smtp-Source: AGHT+IEeI/4nFxu5/v/TDoKV1giWwgu8vj21rwCEXgrVu6+Up32Hjx100MSq6hvtsyi3Ddwp9dju5g==
X-Received: by 2002:a17:907:940e:b0:a77:cc6f:e791 with SMTP id a640c23a62f3a-a7d400ad907mr972663766b.38.1722436084099;
        Wed, 31 Jul 2024 07:28:04 -0700 (PDT)
Message-ID: <121c2612-c255-4051-8d7c-315df6b3d348@suse.com>
Date: Wed, 31 Jul 2024 16:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] SUPPORT.md: split XSM from Flask
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
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

XSM is a generic framework, which in particular is also used by SILO.
With this it can't really be experimental: Arm mandates SILO for having
a security supported configuration.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Terminology adjustments. Stronger description.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -768,13 +768,20 @@ Compile time disabled for ARM by default
 
     Status, x86: Supported, not security supported
 
-### XSM & FLASK
+### XSM (Xen Security Module)
+
+    Status: Supported
+
+See below for use with FLASK and SILO.  The dummy implementation is covered here
+as well.
+
+### FLASK XSM Module
 
     Status: Experimental
 
 Compile time disabled by default.
 
-Also note that using XSM
+Also note that using FLASK
 to delegate various domain control hypercalls
 to particular other domains, rather than only permitting use by dom0,
 is also specifically excluded from security support for many hypercalls.
@@ -787,6 +794,10 @@ Please see XSA-77 for more details.
 The default policy includes FLASK labels and roles for a "typical" Xen-based system
 with dom0, driver domains, stub domains, domUs, and so on.
 
+### SILO XSM Module
+
+    Status: Supported
+
 ## Virtual Hardware, Hypervisor
 
 ### x86/Nested PV

