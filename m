Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6F927958
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 16:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753870.1162143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPNt9-0002yO-A7; Thu, 04 Jul 2024 14:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753870.1162143; Thu, 04 Jul 2024 14:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPNt9-0002vd-7V; Thu, 04 Jul 2024 14:56:47 +0000
Received: by outflank-mailman (input) for mailman id 753870;
 Thu, 04 Jul 2024 14:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sPNt7-0002uB-Tv
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 14:56:45 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0ca475a-3a15-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 16:56:43 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso783603e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 07:56:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b0238331csm1253803b3a.170.2024.07.04.07.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 07:56:42 -0700 (PDT)
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
X-Inumbo-ID: a0ca475a-3a15-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720105003; x=1720709803; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IprdpCOjKePeAHKeym3dolTDmwOmylzxtDVEpyghEYE=;
        b=dZ984znaaxrP9LPCUiDsrD5XepUkegvu0vzKHW0d01w1xnbrOjGzf15zs4ChHSKPLY
         oHoXb8nggr+m7x5TDhVPIKzwichSB6kJFyS0R421HosoK74osqFfaWyZrehaAIVdZDWz
         N4pRIwbwP9vH1wOPUPfr4osxwTcECZK9pQ2B81EF7SfoRbuS/6hrth2W836aaDEN0eMz
         sxnMYBnnSPrcF3T1LNjRaChXZA6gKmWJuwFyHCEqHKpYlhfL6J5GR/bF/Mg4l0bDEw2+
         4UUJ7JSt2j7MxoXGclsYLoK6DfVX4wOzBfwq6XiMsOJ00j/OlSVLf3BMgd/f8vzc/Wxh
         RM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105003; x=1720709803;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IprdpCOjKePeAHKeym3dolTDmwOmylzxtDVEpyghEYE=;
        b=juXBUZkiY5l5B4mFlG04wL8KOrWwXqnVZh94JOkjETmQ1+xc6nUdZB1BGGtZq9IkhV
         yOyKM0T7wsT5ItZRSdScKj7M0MH/jltYdPzW8gWBZfBdpdaHzxCzCAYUO18FUU0LYlG5
         G86TuuJeynhJE+8GbCS41jjPMNFS3YyqdsLEVc9uUqf0s5oFFoRfh02tW8jNDdq/SrtY
         q9TL3F8GYNqBlutCya3cNm0M6Tc6Qf6DS09HEdttV/imk7asyH9/LrcEnk8fNq8gMtCq
         sEV1CAtsrD84ew4qxE3t5a76NKwB1k2wzPApSlOGuSPAn+mOBhQDjMjE7sBd9FkRoJ/K
         9FIg==
X-Gm-Message-State: AOJu0YyqjRICSGJwGdBFCbLZuGlMx92eMg+O8yVo5n+/KFE6FsTv3n6L
	25lDJCDNtmaIZLA4TwjSmazRibqK0vnKQP5pKJ6ZYJnqIW3zKm3dCQ38wsiieN38ExKDYp9wteE
	=
X-Google-Smtp-Source: AGHT+IHI8Z+/W5zx6wMRbkJ3YeXjjMMM/Q1JOVdPxRFeTJfVYQiXid0/zzsD0zqWGqrumAINYHMjjg==
X-Received: by 2002:ac2:484d:0:b0:52c:dbe7:cfd5 with SMTP id 2adb3069b0e04-52ea063e47cmr1226560e87.32.1720105003221;
        Thu, 04 Jul 2024 07:56:43 -0700 (PDT)
Message-ID: <52133dfd-9e05-40d2-9a9c-dba361ec4c25@suse.com>
Date: Thu, 4 Jul 2024 16:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.{17,18}] evtchn: build fix for Arm
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

When backporting daa90dfea917 ("pirq_cleanup_check() leaks") I neglected
to pay attention to it depending on 13a7b0f9f747 ("restrict concept of
pIRQ to x86"). That one doesn't want backporting imo, so use / adjust
custom #ifdef-ary to address the immediate issue of pirq_cleanup_check()
not being available on Arm.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sending here just for completeness; I don't think I'll be waiting for
any acks or alike.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -643,7 +643,9 @@
     if ( rc != 0 )
     {
         info->evtchn = 0;
+#ifdef CONFIG_X86
         pirq_cleanup_check(info, d);
+#endif
         goto out;
     }
 
@@ -713,8 +715,8 @@
                  * The successful path of unmap_domain_pirq_emuirq() will have
                  * called pirq_cleanup_check() already.
                  */
-#endif
                 pirq_cleanup_check(pirq, d1);
+#endif
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;

