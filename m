Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E82B13F3B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061731.1427322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQ9A-0001Yh-Qg; Mon, 28 Jul 2025 15:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061731.1427322; Mon, 28 Jul 2025 15:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQ9A-0001Vn-Nu; Mon, 28 Jul 2025 15:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1061731;
 Mon, 28 Jul 2025 15:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugQ98-0001Vh-HG
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:52:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3fcff29-6bca-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 17:52:13 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so183923f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:52:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfbfb7sm5890946b3a.77.2025.07.28.08.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:52:12 -0700 (PDT)
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
X-Inumbo-ID: d3fcff29-6bca-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753717933; x=1754322733; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz2sGYye0tAxITJdUtC0eC8ET52KXfx6yJviEsl/wVU=;
        b=IkpJcByS0SE+xsuQ5LeEd0Q27KXwbT5VPVSL+9NVdUshMg3Ly7t4QeFkYwCDIOaMCY
         cWArNCrgjQQTDZQSf9/eswMuDNtwObMiPzB/Tns/6j+FGKu2YCxcOMO7AJwfJDJFzeIy
         /z8SH1x5xj233nkS5UyI/ZcR+lJkWH0aKu4xSyM1tstEowuFGW0j6/AGwrpZ7d3Dt8ZB
         6uzgHIxe9rk11RXm0IDf4q16o4Wc0DznclBhcCNujjMlZ4o8RubCauuCBq8Wn4ek/Sme
         zCAr7TsuqX2rjBQg6Mg/hkHG9UYR1m1vzFFC71n0VdYtrciFdGhtHHNhk6dDZb7yIlyL
         TkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717933; x=1754322733;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz2sGYye0tAxITJdUtC0eC8ET52KXfx6yJviEsl/wVU=;
        b=ZR6vnGhGOengxwGR0dtYtnHlyEZ9J+PpxFn2e7lzy8E4TGlJspY33gB1FLXcMlpkJr
         nKFz+WRbc+mpz5NKJiN3yLhQCuChxBcijQ1H3a0qrNnKZPsQ+ifUaY3Vsah1KH3c25fA
         MmOtOG3IZdHegHEduGy+x1Fsl+n62D3J7uq0uyWMq/r6uDy7kXYItMxPgOr+XKj+aCSY
         32TdpxPAMZI+H3rbBbY8ASIJVO3Frtuz2CnBzubQQQ8L/lpL0Sh4AWi0Cd++bRqOeNmQ
         2SBtYpnicS6YrmeEq0Y2kOWR1eelRtQNDhGdi2wUEgdtyRfBioDXnEigT23mDrkoXmRN
         z1pg==
X-Gm-Message-State: AOJu0Yww1YQHTXh9OubDRXfrxIdlwHQ+ezXVIIFx68LKUgVmmzrfloPK
	22RgE8XP3ol53U2BSl6JTw1SzmzgNow0Z/s+DW9VKSsGcmvAer7+Hm9NWiWUWFdzzjpBGHqtHp9
	c2tk=
X-Gm-Gg: ASbGncu+O1OtYHuW6VBHAAdQlKuYD1vZcDRgO6qrdcwWqSZWkiD5NZ9sDHiHzIpEM4k
	KX1IuYRn7nwkngY5fV3TRFBk3OJWCTen6UJYkss8IA/kZkra85LjJsbLTZcAjs+6r6nKSWsmbwD
	cGg91OWW1Uk8Rm9Vnbt8lJd54Ku7xugcV0PFZNFdehMcbhINxOxBAPk4aovi5kpPslDyapqAls/
	3Vf4DYNihm/qTX0RgQcWEMD9feVe8GlQywtvrZRmGHGIGc+BDOwL6WTeAtqjGMYIUdfpvpgYQYI
	NGZuh+1kbPh1WyXCe5ptxVXk2dwP4dQuTbjEkNab4jl9Qq7zw2v4HYKcUPxGXg7SC6/m4YjMEON
	dQrWl9KhRv+K3ZyDFcAwYKk7a6z8CLniT/+TUesqxN8M/MI1UhuGzEQXSnRiyZuqrHJNTTfcdrR
	3YlvjrhJU=
X-Google-Smtp-Source: AGHT+IHpfHk3vqOnyqedDKudaiBMz7hE0GtZtb6C6fYslSc03JgFuu5td5xQNDYF3/9McGiu9D8oRg==
X-Received: by 2002:a05:6000:18a7:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3b77678b79cmr9112440f8f.56.1753717932676;
        Mon, 28 Jul 2025 08:52:12 -0700 (PDT)
Message-ID: <72218fb5-92f2-481d-9754-e6069f945c8e@suse.com>
Date: Mon, 28 Jul 2025 17:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenalyze: correct symbol name length fscanf() specifier
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

SYMBOL_NAME_SIZE is 124, not 128. Use the symbolic name there as well,
to avoid any disconnect.

While there correct indentation on the following line as well.

Coverity ID: 1659391
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's no useful Fixes: tag; the code was imported from HG this way
about 10 years ago.

--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -321,11 +321,10 @@ void parse_symbol_file(char *fn) {
             (*p)->next=NULL;
         }
 
-        /* FIXME -- use SYMBOL_NAME_SIZE */
         /* FIXME -- use regexp.  This won't work for symbols with spaces (yes they exist) */
         (*p)->symbols[(*p)->count].addr = 0xDEADBEEF;
-        if ( fscanf(symbol_file, "%llx %128s",
-               &(*p)->symbols[(*p)->count].addr,
+        if ( fscanf(symbol_file, "%llx %" STR(SYMBOL_NAME_SIZE) "s",
+                    &(*p)->symbols[(*p)->count].addr,
                     (*p)->symbols[(*p)->count].name) == 0 )
             break;
 

