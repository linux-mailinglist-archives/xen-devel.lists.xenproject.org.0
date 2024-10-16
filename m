Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FE9A02F5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 09:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819580.1232963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0ykC-0000WW-4I; Wed, 16 Oct 2024 07:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819580.1232963; Wed, 16 Oct 2024 07:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0ykC-0000UG-1G; Wed, 16 Oct 2024 07:46:56 +0000
Received: by outflank-mailman (input) for mailman id 819580;
 Wed, 16 Oct 2024 07:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0ykA-0000GA-BE
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 07:46:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf188a8d-8b92-11ef-99a2-01e77a169b0f;
 Wed, 16 Oct 2024 09:46:52 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-431160cdbd0so3630145e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 00:46:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4314a829abbsm25322645e9.17.2024.10.16.00.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 00:46:51 -0700 (PDT)
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
X-Inumbo-ID: cf188a8d-8b92-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729064812; x=1729669612; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3nmJ+NcNu9hQuQyW0+LPP0IFM+slM6BFEyH7KGQkzQ=;
        b=TlPtK7fnvBbrL+8RnjqkN79qtu9raQK+Vk+Inf8SFjq6NaItVVzWsDXC8xR7Mjacfs
         OahbkF2gJOs6cFH0y5f2hBoxx1sAM9yU5KMDSlcWK+IOTj+Uj+9am3HL3HPYEngIhgCa
         1npqcbfiQG2tEpuspZvrOEcg++wWTlfO4v6vbA6tJ7PpRqOpf5PsQLfjlCwTlAH17tG6
         KlYUUeNgzBFzAMJsB1FFuRNVKZ/e7OQ1x7AWHDK48ZW4wEaZhzrObLx7uLGjfxmPRqH4
         oYk/Y5L/hKtZ8ArBZSleBjr0MKEvgDeS7Sh0HHoEX04pA3MdfRQfJbxmo3xhkT29ASJC
         Y9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064812; x=1729669612;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3nmJ+NcNu9hQuQyW0+LPP0IFM+slM6BFEyH7KGQkzQ=;
        b=Hb4iV9iqrfmzRo12D3p6Qo25gBn1HXagSq9vcrQOa5b385qFN8IU7rWpsPuu+qCKYf
         +UOcC3YCEExRwOJo63kLpGVbfxBJ4Qn9syRv1Wg92eEP/4ExuHwf1AGuFxkPTSk8R/fd
         KcSUFvIdb2S1DjDlPTiUULV4z7zTaBmIdA4TkTiDGj//SOQXlSt/awa9BeRALfN1j9ve
         tCba5tYUHGaovwiNT04nDMDOcmMD0qt79kdSFfW9nlZuAHDnzJfExFijjpj650ohb8dK
         72LstpdybT9jY9HKCL8Jv15s3i5dwMsM4e5uu3MjDrT2lp85PJEsA1O4sq2L7dodMirm
         ye7w==
X-Gm-Message-State: AOJu0YzxtOdv1zGyi24h2HRwZ8Tbb1qQoFppWoz8irEIF+i4IHpGUVvl
	TIYw6zmuJBeHYJXkKQSyhbTl2qSr71YP0zi84yRNWrRg7N7ME+8w/vh2hJ3VCqZ3nwWgo1wAe8k
	=
X-Google-Smtp-Source: AGHT+IGWxaQwMKonUM4oDt6/frG24bor0KnlTDoTEsB9vFJCgWmCTA/Y/YkLGAyHX4waSDKsIhXvdA==
X-Received: by 2002:a5d:5349:0:b0:379:5c8:33fa with SMTP id ffacd0b85a97d-37d8613ebc8mr2403813f8f.0.1729064812125;
        Wed, 16 Oct 2024 00:46:52 -0700 (PDT)
Message-ID: <a2dae57f-d166-4c99-8edd-11784abdecab@suse.com>
Date: Wed, 16 Oct 2024 09:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: drop Xeon Phi S/G prefetch special case
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

Another leftover from the dropping of Xeon Phi support.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note: I'm deliberately not switching to use of the conditional operator,
as the form as is resulting now is what we'll want for APX (which is
where I noticed this small piece of dead logic).

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -911,10 +911,8 @@ static void test_one(const struct test *
     n = test->scale == SC_vl ? vsz : esz;
     if ( !sg )
         n += vsz;
-    else if ( !strstr(test->mnemonic, "pf") )
-        n += esz;
     else
-        ++n;
+        n += esz;
 
     for ( ; i < n; ++i )
          if ( accessed[i] != (sg ? (vsz / esz) >> (test->opc & 1 & !evex.w)

