Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11397A6476E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916430.1321521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6oc-0006Be-2c; Mon, 17 Mar 2025 09:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916430.1321521; Mon, 17 Mar 2025 09:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6ob-00069R-W6; Mon, 17 Mar 2025 09:31:21 +0000
Received: by outflank-mailman (input) for mailman id 916430;
 Mon, 17 Mar 2025 09:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu6oa-00069H-Vu
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:31:20 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 954b0ccb-0312-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:31:20 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so21160655e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:31:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda38esm102064425e9.8.2025.03.17.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:31:18 -0700 (PDT)
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
X-Inumbo-ID: 954b0ccb-0312-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742203879; x=1742808679; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqTn9SlbWqmKbsnWuP4d6KGrlH+4EhECJcrr0N6jYow=;
        b=LxISZB2wdVMYm5bZ8d1wN5Swy3nxf3akttOM8TstJx4g2G1EM1XWPIdWnsPVLarb9C
         3Abnuqm1rnL9JbqynPl9kF4HBn3Pq+CIjRyrqX3ZBEQF49XCm1w3A9Ex8fXnrPtGC6mZ
         auebNM0lezzhi/aViuA6oAFMW05g2TXwIB/Yyk+F+2fjvXiCQ1oZtP7gR36Ezn0Q4bCQ
         EKf+S7/jog+vPOfRjtHDfy+N41rLKEVbpQ/lI4hIHfUySZ3UZlqP3yyqAeQt49X2jLV6
         mLf4+JXdJ9nj8iAFsSjS8FamjdSEPJeCYDBqYlmuEeSi81Z5/yDlHIJwKLepmFLw91Yf
         rMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203879; x=1742808679;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqTn9SlbWqmKbsnWuP4d6KGrlH+4EhECJcrr0N6jYow=;
        b=jIt897XHN6D1Q6xUiHvwARYimrDq6GczgUtiHUEbG4NFRgSfgDonPW1PKUvTP8ooc2
         phr4mC3FvK78XThQ0SVA+TiUgaunrX1Y4P9isi2o04BqI+l+rLnNhgeN7uvJlIJrj6GV
         WWQWB0cT44EkIMNjxxM6KJMgEAQWjeiqCb4kInJVkYOBrFC21OfxCQqFxsdWPuXPViHL
         3V2E/nrkxsX6iZSmI+LM8IOWC1RjvzVKJdH39GnngSjgDXd6EBpa6LVtEbUY+pnOqwa4
         sP+UcVP7s3ec0oGTZF7/9E9ushNW3l1HvzXYe79RFCGITN32/IXIZndSP4y4bea925j+
         rx0A==
X-Gm-Message-State: AOJu0Yx2VNjyParI88bKN4GEJBWJp7g0NgcZKXf9ZYgy2LsdJv4QzPkX
	7sKdG1WGStTwVD4YbqKSjXPt2LwY4VL9+OYb8cy/xMV3bs9yPQtL2QQtpnNALIV+lktv4ClXKXs
	=
X-Gm-Gg: ASbGnct8dbleA5X7/N362DpmaTBU0PbksWgg3nss6V8Y72ljA5ZuobQlbmq9fJbBckE
	oggIfdI1SRg9Kr5ZnVT4nESpL9pz2uPWF+8eFfk/g9t7Ykkbvf+bVBuia/GdyUzfX1iyToNCd27
	ig5oMcU9qchNF0PGxFOC1bC2i4hsLVZMqWzh8D1rhE83VO0veK7wiB3H7i2kgv2nVglB7TkExjy
	Ux2FAmvrSkh+CcphGan+dppe9MfoUGRz4j52pLp+V2RFDq4XwpfsYiBh9okvCkKeFnNjceAX3IS
	49/W8HRKj5BgTHwnEDvnoobDPMsbhwi0mwAEWKMP+XH4idkLuZtlukUWrqFMxhLGLUhzmRhiJyW
	2bb+4Q8x8tpwxrL+w4ecQjS3ERWiFTA==
X-Google-Smtp-Source: AGHT+IEflcSP6QKlz//iSUJVHJG7dyKMTBXYKMW565jwlDZ+gL4q0yeTffghuLyzIN2SLcthrXlLSg==
X-Received: by 2002:a05:600c:3ba9:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43d1ec72f4cmr119688425e9.2.1742203879226;
        Mon, 17 Mar 2025 02:31:19 -0700 (PDT)
Message-ID: <d8c08c22-ee70-4c06-8fcd-ad44fc0dc58f@suse.com>
Date: Mon, 17 Mar 2025 10:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] arinc653: move next_switch_time access under lock
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

Even before its recent movement to the scheduler's private data
structure it looks to have been wrong to update the field under lock,
but then read it with the lock no longer held.

Coverity-ID: 1644500
Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag references where the locking was added; I can't exclude
there was an issue here already before that.

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -579,6 +579,9 @@ a653sched_do_schedule(
      */
     BUG_ON(now >= sched_priv->next_major_frame);
 
+    prev->next_time = sched_priv->next_switch_time - now;
+
+    /* Return the amount of time the next domain has to run. */
     spin_unlock_irqrestore(&sched_priv->lock, flags);
 
     /* Tasklet work (which runs in idle UNIT context) overrides all else. */
@@ -590,11 +593,7 @@ a653sched_do_schedule(
          && (sched_unit_master(new_task) != cpu) )
         new_task = IDLETASK(cpu);
 
-    /*
-     * Return the amount of time the next domain has to run and the address
-     * of the selected task's UNIT structure.
-     */
-    prev->next_time = sched_priv->next_switch_time - now;
+    /* Also return the address of the selected task's UNIT structure. */
     prev->next_task = new_task;
     new_task->migrated = false;
 

