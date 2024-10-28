Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C109B35AD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826778.1241182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SDE-0003Cf-4G; Mon, 28 Oct 2024 16:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826778.1241182; Mon, 28 Oct 2024 16:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SDE-0003At-1A; Mon, 28 Oct 2024 16:03:24 +0000
Received: by outflank-mailman (input) for mailman id 826778;
 Mon, 28 Oct 2024 16:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5SDD-0003An-C9
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:03:23 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272ca9d4-9546-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:03:21 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539f72c913aso5744813e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:03:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431935f744esm114660985e9.34.2024.10.28.09.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:03:18 -0700 (PDT)
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
X-Inumbo-ID: 272ca9d4-9546-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730131400; x=1730736200; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgj69Cd/dAiOQr4jsPsRsdPGZRl2lr4O7CpY+NdIcKg=;
        b=HBb2ZgzjKV9v8Y2NKC5du9d1k2l61sWYVaBYH42NQ1hCVl3HtrIuv0QTLBxlTAe2Cb
         0ERrEZ6AIpEM2SYFvyLVRaZ8Wi4uzYEQliHfVKnGCGTGYMZpLEvHPaVl0cqzF1CYU407
         jRXyveH7WTME/gSbhrVksese6LXKb0L8zbWwG7+qB+VOYjL/tSutm7v3AhiXW+cUOOLh
         XqtyknG9K3uc4WC1/8LTKOsrLccdTq5Jy/0X6k69OSTsN2tLoyTeWpcxZWSzOf+PnOlN
         0p9/2WoDsqB7aiX2YhfzifJn2xI94NKcTAbxq4rAcnPoS7S9DQFanAowecVz6yD6ZbjN
         x66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730131400; x=1730736200;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgj69Cd/dAiOQr4jsPsRsdPGZRl2lr4O7CpY+NdIcKg=;
        b=Z/HTi2kd9xGDzAe53UKVMc1T9olGG19ovz6l7URWiVz4uIwsayO+FXGi3LgG9XW9xL
         n8tITsvmZ8grY4YMH/LXFTGN3JTiMx33QxmGf7X/qzw/wbNXvNzRQPE6NutzeK/8E8Zu
         EXDQwqcgPae23mQgnYk3kMKH02WJSNOCjGEMZUBE15RCGK4k3h56E7yXLYTjoZyaOiE+
         gA0WH6P+4bWljldqy3u35uDE9fN6+juUv1s8ipjaqQ4UTROeD5s8JhSfc29Ng3D67mto
         2vj+RfAcFgUBrOGH20DBZpX2h/jiu83tzujvgJ4NuOI9YHshIW08SfYDyPq5UFact5oI
         DWiA==
X-Gm-Message-State: AOJu0Yw020MK/HxHvY5mWV0IRai+htwzcsgf1IUvcpSRm6dl7IW2nQ13
	UmiN/Pc/3dQCO14A+v3rJwQgdRnDmhOXogyS/IUEpCpxoKdWL8LVf5L7Jp+F/XO9NZXMkpJgcGM
	=
X-Google-Smtp-Source: AGHT+IHMEj5uN+E77renAJ9qLvrG8/erYlbeK1PEi2oVzi9SyyFi0TsupUvfAgk7kZfoFXL0wl+ieg==
X-Received: by 2002:a05:6512:401f:b0:539:e317:b05f with SMTP id 2adb3069b0e04-53b348e2e0fmr4082587e87.28.1730131398870;
        Mon, 28 Oct 2024 09:03:18 -0700 (PDT)
Message-ID: <b2fdb048-cfc5-4f61-8507-bf8020e02132@suse.com>
Date: Mon, 28 Oct 2024 17:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] earlycpio: constify find_cpio_data()'s "data" parameter
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

As with 9cbf61445cda ("xen/earlycpio: Drop nextoff parameter"): While
this is imported from Linux, the parameter not being pointer-to-const is
dubious in the first place and we're not plausibly going to gain a write
through it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/earlycpio.c
+++ b/xen/common/earlycpio.c
@@ -64,7 +64,8 @@ enum cpio_fields {
  *              the match returned an empty filename string.
  */
 
-struct cpio_data __init find_cpio_data(const char *path, void *data, size_t len)
+struct cpio_data __init find_cpio_data(
+	const char *path, const void *data, size_t len)
 {
 	const size_t cpio_header_len = 8*C_NFIELDS - 2;
 	struct cpio_data cd = { NULL, 0, "" };
--- a/xen/include/xen/earlycpio.h
+++ b/xen/include/xen/earlycpio.h
@@ -9,6 +9,6 @@ struct cpio_data {
 	char name[MAX_CPIO_FILE_NAME];
 };
 
-struct cpio_data find_cpio_data(const char *path, void *data, size_t len);
+struct cpio_data find_cpio_data(const char *path, const void *data, size_t len);
 
 #endif /* _EARLYCPIO_H */

