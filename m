Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C7A5EDC3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911390.1317835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdjf-0007CJ-8t; Thu, 13 Mar 2025 08:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911390.1317835; Thu, 13 Mar 2025 08:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdjf-00079Y-5N; Thu, 13 Mar 2025 08:16:11 +0000
Received: by outflank-mailman (input) for mailman id 911390;
 Thu, 13 Mar 2025 08:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdc7-0002fh-II
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:08:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 549695ef-ffe2-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:08:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so3588385e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:08:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a4c71esm11567045e9.39.2025.03.13.01.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:08:20 -0700 (PDT)
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
X-Inumbo-ID: 549695ef-ffe2-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853301; x=1742458101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V2ayXPNTBMmuD+MnIRKXvHvXy9zY3DBe7QT9taI8yfA=;
        b=dajOHvIsAoJZ+5SPu07YMjM4a27Lki3NLM7mgYH41ZDjaBP6Oua8R1uzwamF28S9Gu
         9qSsGlzeQCraYBp9nKTKP5sBaMw0FZvOYMNdfGRs4jjxk+chGycN5Lfbbh9Tg8p+U2/E
         kwmYMzjgxZbszGd3CIKXfGj1rR5kDKWJLYaBY8pnnDiAo8dV7LQOctZdrcXT+fp+8qKc
         ZmC/CIMFP2K7kHl9LRNsyTKohRv3kDvVPMR2dbpf9H0yQAMk1z9hpDOZ+6H9o+0sZ6HF
         HLA/lE8p8xwszaAcRFXNjjjm0jeilykizEwCzFvMmlnzIDfeO7WQN81ONyIBpNu3psWW
         rEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853301; x=1742458101;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2ayXPNTBMmuD+MnIRKXvHvXy9zY3DBe7QT9taI8yfA=;
        b=TMv4Vl5ug+/nn32tuwP/m8xUNRe9exw8JPPaYChhKvLx/QW3iwX2hl7Wu0BbATAiPJ
         aaGEHhX9XxSwc7FodXL4wIUnc6OsinRwEcjnrKzpLu3EhLfZhPVwtmOSG1LZy1WcOPLM
         8ZOVl/dZgKtMRaO6vnkaWHSD6mAAny/nHJjgHEvdJlaQPnGHQgp2629sXVTv6Rp1DTEi
         +gwfmmMryWRRhCla1DXn1v3DvGT9q0JNErZxjSeirvzyUYp4MVU2cuptb6DyZW9oPRoF
         dTESQAK+izX779X56cegVCYTLFBUHFWcbgsoMxYCgcP9eAfs7eOnDgaxCZRTL8T9AdXL
         a6iA==
X-Gm-Message-State: AOJu0YwInTAvRLdUJXRftPYQV7BW8ktJZJ0wot3sI8VajQ991zv/dRIG
	KWRJK8x93TDEhg8k66fvf/o3PjYBP/4MKGOosxo1HnkyuCQPjLjYMjhEHksKJx34aRO7IfthuQg
	=
X-Gm-Gg: ASbGncscayn2v0DCZS+pZNiH25wxtnXF2xoOcRIxC290mWbYYysFFtxW6jeX69jI43z
	uR5o/81bF8OTVx3y2eG9p46QlinmTrQtgIgK0yXMgdu+kOEZf2rRO8gqVHAktoktYuTQmorBjll
	jitqdI+pG9JYIh0aw485Xck5gGVtAYGL/dJYAQkXdhnQtu1vuhajKSqc/sE5duhzNSj9Y/O4f9n
	sbfoXOdyPK1l2XcTmWqeMMKFUKqr5QJBgN2D6/wmEdXJfoCxGIIYENbbhcthdTjRgk47aM7B+J3
	gXXECgTl2hwA7r1xwG4qjWZOfpsAf4rfLbJlSj9JBfCtKLBvWWUFgkzQxxmcJui2wV/L4qcwJsQ
	lizm0CHwgYDweG1tTRUm5olBcfzDOXA==
X-Google-Smtp-Source: AGHT+IHj74m/bqqWj11m3m8dDP3+N8s8544b1+LtqndUJlFNSifYnr2gbtasbdhScEcsuupGLxGCoA==
X-Received: by 2002:a05:600c:3b1d:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43cfe15436emr126281805e9.18.1741853301202;
        Thu, 13 Mar 2025 01:08:21 -0700 (PDT)
Message-ID: <867b783c-4fb5-40f0-8253-54b181a95b82@suse.com>
Date: Thu, 13 Mar 2025 09:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 RESEND 5/6] Arm: purge ENTRY(), ENDPROC(), and ALIGN
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
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
In-Reply-To: <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

They're no longer used. This also makes it unnecessary to #undef two of
them in the linker script.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
---
v7: New.

--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,17 +53,9 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define ALIGN .balign CONFIG_FUNCTION_ALIGNMENT
-#define ENTRY(name)                             \
-  .globl name;                                  \
-  ALIGN;                                        \
-  name:
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
-#define ENDPROC(name) \
-  .type name, %function; \
-  END(name)
 #endif
 
 #include <xen/const.h>
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -6,8 +6,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 #include <asm/page.h>
-#undef ENTRY
-#undef ALIGN
 
 ENTRY(start)
 


