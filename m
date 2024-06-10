Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2F9022BF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 15:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737286.1143513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGfCs-0001dm-Sx; Mon, 10 Jun 2024 13:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737286.1143513; Mon, 10 Jun 2024 13:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGfCs-0001bp-QF; Mon, 10 Jun 2024 13:37:06 +0000
Received: by outflank-mailman (input) for mailman id 737286;
 Mon, 10 Jun 2024 13:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGfCq-0001bj-UI
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 13:37:04 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a2771e-272e-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 15:37:02 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6ef46d25efso322933166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 06:37:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1480821esm232112766b.150.2024.06.10.06.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 06:37:01 -0700 (PDT)
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
X-Inumbo-ID: 84a2771e-272e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718026621; x=1718631421; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGveORXj8d2uAHhUI/wuRMK7VF70NHq9UIfCL1PH3v8=;
        b=GOHZE6q+l55Rx8ZGk/MCdNKXj06G6HdgoZrSUeKNnwmwPLtf5vIapyMVEO+ejUWWbi
         NerTzQITcb/VEug2G1RgzCCTxncY1YUtOkZUWGtKeC/h4cUAjMKL03pJN5wvKij441xs
         Ot0F2jaHIMYNpvc1+eg7DDnfp26Z3Oxu/8JJDJMkIqS0TzIuLNHQizMFD3YlUcXtGmF0
         y4qclKQhVklsda4KOGCGKfgRzZZTJd5LnMF5+bdw7437hJOzJn8snyYHwD2u0M28VLkM
         /Z7WERVHDgdzw7LXEhe1dXlVqWxxgInFPmTToRgOQH230Mq33htlbulivt3vYzqS3yYz
         ICLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718026621; x=1718631421;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGveORXj8d2uAHhUI/wuRMK7VF70NHq9UIfCL1PH3v8=;
        b=F4Ma8jfJez+G+a6UkeYgEd9z5waB9C9XMnviGYtKFPgA7+5jHn7B32NxDFT5lwwKjH
         Rqx6DTaEmCIuhY4SKX0KTBK8xYd71VkRDzAi1XHBeaExdXM6tZgcATxy7twtlOJi7z97
         c6STbUEZR70xuE5e0HjEmAYaPhm95stfVGtUtZph2YyauBZf8ERFXkX2CPHt0p5d6vAN
         WYS7DYMFsGSLv0uPX6J0n0gJKY9v88+emJvbAMzeJl9nmcX3udiE9a5OtCQCGLIJnlOw
         dFlMwuj44jqleLQV6LNVBTkrn7doUCRK0wq0lsQnPlOYkNyBxo59lWcSv07B8e5ZMqf9
         buzw==
X-Gm-Message-State: AOJu0YyLn1DBLtQV6te6uoSp3U4tIm1fNemB7r7GZ87lr8zBchClOugY
	xVyOb9hay1oBvyZkz75CjXqSU+TzgMlfqiZOhcAxvC4vqaFh0tyt1Fa9HhTzRxOj3bBOVP3qHDk
	=
X-Google-Smtp-Source: AGHT+IFeAGGsR5TwlM3jVuG/w16wGuRbmt1P/urcLcmQTF1POaff3HmNrIhNMig6qNpPebYO6/C9zA==
X-Received: by 2002:a17:906:2b97:b0:a6e:f68c:a1cd with SMTP id a640c23a62f3a-a6ef68ca2femr394402666b.62.1718026621490;
        Mon, 10 Jun 2024 06:37:01 -0700 (PDT)
Message-ID: <f7228594-fa64-4fd8-b55b-506d004b73cb@suse.com>
Date: Mon, 10 Jun 2024 15:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] Arm64: amend "xen/arm64: head: Add missing code symbol
 annotations"
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

While the change[1] didn't go in yet, there is the intention for the ELF
metadata annotations from xen/linkage.h to also effect honoring of
CONFIG_CC_SPLIT_SECTIONS. In code that's placement / ordering sensitive,
these annotations therefore need using with some care.

[1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00470.html

Fixes: fba250ae604e ("xen/arm64: head: Add missing code symbol annotations")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative would be to use LABEL{,_LOCAL}() instead of FUNC{,_LOCAL}().
That would avoid the need for any override, but would also lose the type
information. Question is whether the annotated ranges really are
"functions" in whichever wide or narrow sense.

The Fixes: tag is slightly questionable, seeing that the patch actually
adding section switching didn't go in yet; the issue right now is a
latent one only. Whichever form of an adjustment we'll settle on will
likely want to become part of [1] above. Hence the RFC.

--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -28,6 +28,14 @@
 #include <asm/arm64/efibind.h>
 #endif
 
+/*
+ * Code here is, at least in part, ordering sensitive.  Annotations
+ * from xen/linkage.h therefore may not switch sections (honoring
+ * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
+ */
+#undef SYM_PUSH_SECTION
+#define SYM_PUSH_SECTION(name, attr)
+
 #define __HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
 
 #define __HEAD_FLAG_PHYS_BASE   1

