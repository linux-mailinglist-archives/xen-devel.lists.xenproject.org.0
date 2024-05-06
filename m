Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40688BC925
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717285.1119324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tOu-0003Ea-OW; Mon, 06 May 2024 08:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717285.1119324; Mon, 06 May 2024 08:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tOu-0003BU-Lr; Mon, 06 May 2024 08:08:44 +0000
Received: by outflank-mailman (input) for mailman id 717285;
 Mon, 06 May 2024 08:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3tOs-0003BO-JG
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:08:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8f33e79-0b7f-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 10:08:40 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ecffed96cso5626805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:08:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600001c300b0034df7313bf1sm10150992wrx.0.2024.05.06.01.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:08:39 -0700 (PDT)
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
X-Inumbo-ID: d8f33e79-0b7f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714982920; x=1715587720; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJoKfjr9VcDjkUuiasQBoBbYQ10TDbtiRDBcCFiZOno=;
        b=aKcm4dluLWXlUPjZdfutp550xxJk86kxxdB17SKB3Qh80KbRCWCnA81bLhE+Vzmwh1
         D8BoY1AKZ7Yu/kCbsscNU7fFT6fdet7imGZ/wp2C9inKePAPxC0bw3iBzHVgu/wl5FcK
         LlRtXChSLO2EEhmVJIWp98K7PIhgoI3YuAumlfMLUwCpt3A3ff3ykkYyhN0W72g69LmZ
         kXK7SIwUAOk+KKpwrwbFe8PrS5A2RLEaRG6TNwtFksb6Lr9raEQG5jyx+048AunLzKqi
         DcLxZ5qpqbUWXZORoBJatOSnL6TEBCwzNLepFwpmu76yEYZZCvMhtrBFJ/dmOAq33gQ1
         GKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714982920; x=1715587720;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJoKfjr9VcDjkUuiasQBoBbYQ10TDbtiRDBcCFiZOno=;
        b=aVBS6NPMeAezX7neP2qcztRCLu8nAxEmltedtDhf77GD2YdwVTVu7U3SqQz+aglhDp
         ver6hvgQJ2BlJly/TuDFDKQOHYgBoGXpxOvsPj5WbV/x1fOst8o3EVTOSzP4CgZHDWOZ
         p1C+Ioc3osphZLqwRUi1Pnn+GTbI2xS2tIkZpB6I/emvHYIY03vUOM8uJ2f9xH41v4WY
         ZFgNR5T2HSvrG5uWKqkSn8vyIBjs1skhwqRzybmcv+Wrswj7bf+o03x/dQQV3iUcG7kv
         vKeTBg08tioEv55Jwc7dLqP4p74GtaN8bbilaraskwx6OgsBDH5jmzBOGF9tGy9H1JXC
         UkXw==
X-Gm-Message-State: AOJu0YyXISXybAqQ+OL0Gsj/kKom0Rp6uGSigjSPFSoEl1+UDVqCAp3n
	f4FrXN/g9AgCF3j2evAZPmux+i1IB7cmb1rd2lvz6wbdAn72HgZl3cXeskbiiHsFrjl6PCpWNw4
	=
X-Google-Smtp-Source: AGHT+IHzqrb5PuWE3VdQ8R8NnA2MV8PFiXfJtnIFGE1rHi/Bg1HEDxQxA8YwNop4JjmA3VxSeEchzA==
X-Received: by 2002:adf:e947:0:b0:34d:b75c:c7ec with SMTP id m7-20020adfe947000000b0034db75cc7ecmr6933615wrn.8.1714982919612;
        Mon, 06 May 2024 01:08:39 -0700 (PDT)
Message-ID: <33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com>
Date: Mon, 6 May 2024 10:08:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gunzip: don't leak memory on error paths
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

While decompression errors are likely going to be fatal to Xen's boot
process anyway, the latest with the goal of doing multiple decompressor
runs it is likely better to avoid leaks even on error paths. All the
more when this way code size actually shrinks a tiny bit.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is quite the opposite of Coverity reporting use-after-free-s and
free-after-free-s in inflate_dynamic() for tl and td, for an unclear to
me reason.

--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -757,16 +757,14 @@ static int noinline __init inflate_fixed
     }
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
-        free(l);
-        return 1;
-    }
+    i = inflate_codes(tl, td, bl, bd);
 
     /* free the decoding tables, return */
     free(l);
     huft_free(tl);
     huft_free(td);
-    return 0;
+
+    return !!i;
 }
 
 /*
@@ -940,19 +938,17 @@ static int noinline __init inflate_dynam
     DEBG("dyn6 ");
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
-        ret = 1;
-        goto out;
-    }
+    ret = !!inflate_codes(tl, td, bl, bd);
 
-    DEBG("dyn7 ");
+    if (!ret)
+       DEBG("dyn7 ");
 
     /* free the decoding tables, return */
     huft_free(tl);
     huft_free(td);
 
-    DEBG(">");
-    ret = 0;
+    if (!ret)
+       DEBG(">");
  out:
     free(ll);
     return ret;

