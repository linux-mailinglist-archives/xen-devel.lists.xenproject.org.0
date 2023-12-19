Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5073818637
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656711.1025093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFY8m-000291-FO; Tue, 19 Dec 2023 11:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656711.1025093; Tue, 19 Dec 2023 11:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFY8m-00026T-Cm; Tue, 19 Dec 2023 11:20:00 +0000
Received: by outflank-mailman (input) for mailman id 656711;
 Tue, 19 Dec 2023 11:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFY8l-000258-4d
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:19:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aa04c7c-9e60-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:19:57 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso50811365e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 03:19:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0040c6b667ce3sm2421164wmq.1.2023.12.19.03.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 03:19:57 -0800 (PST)
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
X-Inumbo-ID: 8aa04c7c-9e60-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702984797; x=1703589597; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+TBfPNEvQr569JsrAXlagEv7wqY4vXl9AQjzAh+6Bs=;
        b=SqK0v3tgeYJlyVSqmpB2ELRt1YLMJF9pqSUgy8qqCC/j3l8emHBCZs1+z5B0b+1nsS
         AET/QNCyZewy67X6/Ue0mJweIuGm9d/lGefeh+vzJgoZa3ybRa6cuJEpO+LcqtF6XtvX
         6CdK16Okbm1f/RjKtjkQeEoP679LyN8Wwb0KxTNQ0c2wzGI6M+kYzva4n3AoXSciszUX
         9pVz4UEtxpvbH4DdVy9qqQM/uWTbYZ2dQvgU/mRjW2CuL90YCaa6U9XJGyPTlNqduG6e
         QJQHGueim0cRKsC0J3cszde/AV1WaGbmIabaeAIGaDq0eAwHAQip1nwbn5cFkvP5SUXB
         QJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702984797; x=1703589597;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+TBfPNEvQr569JsrAXlagEv7wqY4vXl9AQjzAh+6Bs=;
        b=lPVXQI6zdmkJbEHUASfCllabVXG8G4ZJFkPYzN+Th/5RNGn2MM1ROuWAWUO4vvpO3s
         ffL8VS8pxuJ+revp+bbcMfcUkIoXny8t05vaOPHZgcvISEd568FeZWA+mKfuV6Uk6lp6
         uyqIcyP3Sp+8pxJvNFCdp6mFBUPHDibsDbvYOBq2HG35dOuQIPIhSwhKJKrBzDWSympW
         vMEYpgofApX46AzLuWPW9myubIuKtLFiYxAcB2SwKtacAVhg7Cf1m7KkQvwT6G9uHYxe
         dJnLINdBE7cnnim+b1ZTcI/spWn9XfJHfQIhLqzTq3EP4KZnFuTe6YuB9stUuynSRlx3
         kzUg==
X-Gm-Message-State: AOJu0Yw7XcWTJJr4awM5IDlLVU/3Yn6xbKlZlmlbVo6/HzNtqXPFdOsw
	7ned6UTgjA7qQojyY77RgODq9/ry3I6qPubdslJI
X-Google-Smtp-Source: AGHT+IHYA64qaks9I+/AAoYGhrcVOS9NpRS7vyNAdLAE/OuiPI3eBzl7IIep0Pds9xFeru9DPdbSLw==
X-Received: by 2002:a05:600c:3151:b0:40d:190c:160f with SMTP id h17-20020a05600c315100b0040d190c160fmr1002428wmo.110.1702984797431;
        Tue, 19 Dec 2023 03:19:57 -0800 (PST)
Message-ID: <e944cc4f-354c-4752-8794-03e6a7517372@suse.com>
Date: Tue, 19 Dec 2023 12:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: use "break" in arch_memory_op()
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

The final return statement is unreachable and hence disliked by Misra
C:2012 (rule 2.1). Convert those case-specific (main) return statements
which already use "rc", or in one case when it can be used without
further adding of code, to break.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2023-12/msg01537.html.
Yet another option would be to simply pull the default case out of the
switch() statement.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4724,7 +4724,7 @@ long arch_memory_op(unsigned long cmd, X
         spin_unlock(&d->arch.e820_lock);
 
         rcu_unlock_domain(d);
-        return rc;
+        break;
     }
 
     case XENMEM_memory_map:
@@ -4818,7 +4818,7 @@ long arch_memory_op(unsigned long cmd, X
         if ( __copy_to_guest(arg, &ctxt.map, 1) )
             return -EFAULT;
 
-        return 0;
+        break;
     }
 
     case XENMEM_machphys_mapping:
@@ -4880,7 +4880,7 @@ long arch_memory_op(unsigned long cmd, X
         }
 
         rcu_unlock_domain(d);
-        return rc;
+        break;
     }
 #endif
 
@@ -4888,7 +4888,7 @@ long arch_memory_op(unsigned long cmd, X
         return subarch_memory_op(cmd, arg);
     }
 
-    return 0;
+    return rc;
 }
 
 int cf_check mmio_ro_emulated_write(

