Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58DA7DC45
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939733.1339722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kfS-00047H-OO; Mon, 07 Apr 2025 11:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939733.1339722; Mon, 07 Apr 2025 11:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1kfS-00044s-LJ; Mon, 07 Apr 2025 11:29:30 +0000
Received: by outflank-mailman (input) for mailman id 939733;
 Mon, 07 Apr 2025 11:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1kfQ-0003pB-Mm
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:29:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908c1693-13a3-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 13:29:28 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so3372661f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 04:29:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ea97904b7sm125663975e9.1.2025.04.07.04.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 04:29:26 -0700 (PDT)
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
X-Inumbo-ID: 908c1693-13a3-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744025367; x=1744630167; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/6cLRblqhSUTeW8vQg0u+UKNboItlBAEZ9UsTsqQKU=;
        b=F/r/RbSn2Gihete5ChJRGokwJCmoM5Vgbr2hu/AugNun/rJ6HfNpT2iwCPjjv7BggM
         sk4TX6YYhapDDUAcyYAnAI7SDjXgqhw9rpo96V8jvIdfuNxqN67JY7JAhpsxqy6INOMi
         OpWc9rIOzyzB53eovgzSuPyarWPEZjJGtDeqNmWqQmscRb5x29EzcEpNCauFWeiC2Ck6
         OYTDhYGYRullt+gaG0zv+XnoLffmH/qXdlBvpLFLhwDf6ROvNWXdVgPl1SAPF4tkkd2x
         NqHgUz1Pu5ZFq3NdEOu+c5NilzwRCtn40XAG+RcRomIPvV+Zf+TREyTT4HnrP8HYDu5+
         pnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025367; x=1744630167;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/6cLRblqhSUTeW8vQg0u+UKNboItlBAEZ9UsTsqQKU=;
        b=Zm7RnXJewZ38YvLaVfDXMYvScLOVeXosDiBlPQljtko9gfhoCbmtGJCFBeY4FAeX12
         eP1mZ7Fev4jmMNLROcs4WutFU/1T7Yn+ijMuv+P+8UZQfIoYinIr3HcnuVnfxrWC/VLD
         48EZ+g1pXdaSrsduPA0VeyQAPI10/J2q4fuCSwxePmiAO/UsDKKb50AFQesDEpH+62ns
         dDb9lE+cwV7+IsAS4W5Qu10lMKkAdrXEaDzTUaIfwzL7tX5a3Z6m8r1RFa1PBCdsUhE4
         +RTLTg88KXkp/wM4RsbascSFXmF6iF5jBrAnGnLQwPqaNoWDhKvct1A772VR6RHwNmmb
         v26g==
X-Gm-Message-State: AOJu0Ywbt9rzFiN6iDne458q9DEu+GLpWgnARTXDw22t17K3tthOqi/t
	vqGcCbqPExeuB3MrLQDNOmp58GQINh5YncaNxk+xmD3TA59yBva8bZ1p6HU7EC7GveSzFJgq408
	=
X-Gm-Gg: ASbGncufuSjWONskdbM/v96ErpApqrgn46IeLzEcNHFlBX8zQQUPVb2Ba4ptQ7SA1+R
	oOx4LUqwRo56qV9VEz7ImCHgj890MhbP1LkuB9K+Q2EDmwP0tmoo959AkOx/eKON/ReB/dYpayB
	KW53x5Hca88BJd1Ee0ZoW3Ccekz0TwJ67SVroaOSfcRRGLXWCrlEBcB+NUS07+GQ3XnJtQc2NFb
	fCc9bVp8HBV2n9GMn6UwPp9XmF+RpK/DkEN7y1gREDguP4Xem198gkaJ98y7Yaqbr6qnlv9GqlE
	aMRTuJm/70YgqWf9+tMiNgyHeHZieCXOhuM7/LOXUuGyVzeWitrT91wHRHk4yrNpqSYRe2tGOgw
	cQBEdJtAri8CH5F/RbtTi9wxqRE748A==
X-Google-Smtp-Source: AGHT+IFMkBYsiwuE15Hn1ImClCdy7ep6ZvPxYVVHN3z3WUb+vcRXpbPu4uvewvuUwZYPfjv8SaM5DQ==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr9965525f8f.26.1744025366967;
        Mon, 07 Apr 2025 04:29:26 -0700 (PDT)
Message-ID: <8b16c210-4a2f-4d06-8fab-624394f06e5f@suse.com>
Date: Mon, 7 Apr 2025 13:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl{,u}: replace TOSTRING()
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

Now that common-macros.h has STR() available, which is even slightly
more flexible, use that and drop the custom macros.

No difference in generated code (except for line numbers, of course,
where embedded in code/data).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -53,7 +53,7 @@ static void disk_eject_xswatch_callback(
     }
 
     sscanf(backend,
-            "/local/domain/%d/backend/%" TOSTRING(BACKEND_STRING_SIZE)
+           "/local/domain/%d/backend/%" STR(BACKEND_STRING_SIZE)
            "[a-z]/%*d/%*d",
            &disk->backend_domid, backend_type);
     if (!strcmp(backend_type, "tap") ||
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2093,9 +2093,6 @@ _hidden int libxl__init_recursive_mutex(
 
 _hidden int libxl__gettimeofday(libxl__gc *gc, struct timeval *now_r);
 
-#define STRINGIFY(x) #x
-#define TOSTRING(x) STRINGIFY(x)
-
 /* from libxl_qmp */
 typedef struct libxl__qmp_handler libxl__qmp_handler;
 
--- a/tools/libs/util/libxlu_disk_l.c
+++ b/tools/libs/util/libxlu_disk_l.c
@@ -1152,7 +1152,7 @@ void xlu__disk_yyset_column(int  column_
 #define DSET(dpc,member,enumname,str,valname) do{			\
 	if (dpc->disk->member != LIBXL_DISK_##enumname##_UNKNOWN &&	\
 	    dpc->disk->member != LIBXL_DISK_##enumname##_##valname) {	\
-	    xlu__disk_err(dpc, str, TOSTRING(member) " respecified");	\
+	    xlu__disk_err(dpc, str, STR(member) " respecified");	\
 	} else {							\
 	    dpc->disk->member = LIBXL_DISK_##enumname##_##valname;	\
 	}								\
--- a/tools/libs/util/libxlu_disk_l.l
+++ b/tools/libs/util/libxlu_disk_l.l
@@ -64,7 +64,7 @@ void xlu__disk_yyset_column(int  column_
 #define DSET(dpc,member,enumname,str,valname) do{			\
 	if (dpc->disk->member != LIBXL_DISK_##enumname##_UNKNOWN &&	\
 	    dpc->disk->member != LIBXL_DISK_##enumname##_##valname) {	\
-	    xlu__disk_err(dpc, str, TOSTRING(member) " respecified");	\
+	    xlu__disk_err(dpc, str, STR(member) " respecified");	\
 	} else {							\
 	    dpc->disk->member = LIBXL_DISK_##enumname##_##valname;	\
 	}								\
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -25,6 +25,8 @@
 
 #include "libxlutil.h"
 
+#include <xen-tools/common-macros.h>
+
 struct XLU_ConfigList {
     int avalues; /* available slots */
     int nvalues; /* actual occupied slots */
@@ -69,10 +71,6 @@ typedef struct {
     void *scanner;
 } CfgParseContext;
 
-
-#define STRINGIFY(x) #x
-#define TOSTRING(x) STRINGIFY(x)
-
 #endif /*LIBXLU_INTERNAL_H*/
 
 /*

