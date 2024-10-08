Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587029953F5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813291.1226160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCdW-0006Og-8n; Tue, 08 Oct 2024 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813291.1226160; Tue, 08 Oct 2024 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCdW-0006LM-5W; Tue, 08 Oct 2024 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 813291;
 Tue, 08 Oct 2024 16:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syCdU-0006LG-MY
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:00:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7195a656-858e-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:00:31 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c882864d3aso6547123a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 09:00:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05eb7b7sm4462105a12.68.2024.10.08.09.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 09:00:30 -0700 (PDT)
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
X-Inumbo-ID: 7195a656-858e-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728403230; x=1729008030; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnUwlHV85d5fiLD3WDSQYdspkPTRoFlRMY42aE97+lU=;
        b=B+8Bf6LoLjWNEgcxjOLz0g+Dicq7eemxrTXNod5HDVh3BSUfq/DdrQbB2iXix5ImUf
         cTGeFntiHRAQKl8gci3Yzznu/QZu/DuIdEPKoKC+zKoyExZ4PTBypz6//QK/Yk2AqRPn
         rkFo1ldHZJZOo7m62ZcEJRtSm0hxfxkMql5mZcsvo06/WxKUbQ8SQ7/sffj6N65VPNck
         IayJcycJIrAG90JSLzR/1ZZA8HtQAylR8DTb4aRwUADaMYWkmCxo/amJBMq0lginFdT7
         ZQ0b+LNzzlAU4w2yGbeQK5ov3OZQEoVLjImA5wzlPPRl7RsWNY19p+VKFhUQqpY2Rvza
         LjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728403230; x=1729008030;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnUwlHV85d5fiLD3WDSQYdspkPTRoFlRMY42aE97+lU=;
        b=Qfi+iosVz9Hk8WAW5wHSFpg4XiRp5uj4CBeHdN/z3XdHRghQOEh8GOEpCG4AmJTbcc
         qsrRg9sVylxAE02i6kZvKh9/of7kuB3wDNK/G0hd/guQODptXF0P6qsczUxI7/KMc2u3
         cnT/JM1xgis9Cw4gngrZ+3cJKuipyD5xYglZj7X5g8loCXObKc0geJkOQOMuyg25NzrI
         ZECNQRWWhzuLBmTix1BbVYSbkbdbWUXCXWSmkhuLdawB3/mGl3lPwJrvJe6QWIr4FESX
         6qAO6La3c1sGByMBVADidHaxY1jz6Jy382iZNt+6ZA476idBXNqhEpzAd42oS4PNWE2v
         BfOA==
X-Gm-Message-State: AOJu0YzHUCIkwQYh9XessNEeBMtYga63o4noSq8ZitlkzkPno/Z1NvVL
	pX10/WclUjKxsKYTDoTZhvQtHothlIlZS3iXFDbrS27q5FjZR1HhxdcmIFw++kVxFY6rxGmUyCg
	=
X-Google-Smtp-Source: AGHT+IHqc9NTJzD2RqG2SQ/BvLDAOQZd17TXFjAceAUFvOJC2oW1OrP2iCDiK9hsu/+vR82J/BqeVg==
X-Received: by 2002:a05:6402:3714:b0:5c8:9668:45a6 with SMTP id 4fb4d7f45d1cf-5c8d2e262f6mr12691221a12.13.1728403230281;
        Tue, 08 Oct 2024 09:00:30 -0700 (PDT)
Message-ID: <cdf93d64-dcc0-4e01-88fe-71145ffff1ff@suse.com>
Date: Tue, 8 Oct 2024 18:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: restore semicolon after explicit DS prefix
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

It's not unnecessary (as the earlier commit claimed): The integrated
assembler of Clang up to 11 complains about an "invalid operand for
instruction".

Fixes: b42cf31d1165 ("x86: use alternative_input() in cache_flush()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -286,7 +286,7 @@ void cache_flush(const void *addr, unsig
          * + prefix than a clflush + nop, and hence the prefix is added instead
          * of letting the alternative framework fill the gap by appending nops.
          */
-        alternative_input("ds clflush %[p]",
+        alternative_input("ds; clflush %[p]",
                           "data16 clflush %[p]", /* clflushopt */
                            X86_FEATURE_CLFLUSHOPT,
                            [p] "m" (*(const char *)(addr)));

