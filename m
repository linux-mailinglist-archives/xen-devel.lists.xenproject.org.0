Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697CAFE535
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 12:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038009.1410553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRkm-0005cS-O8; Wed, 09 Jul 2025 10:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038009.1410553; Wed, 09 Jul 2025 10:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRkm-0005aW-KY; Wed, 09 Jul 2025 10:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1038009;
 Wed, 09 Jul 2025 10:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZRkl-0005aL-WC
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 10:10:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e68456fd-5cac-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 12:10:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so3401039f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 03:10:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459a1d5sm131989305ad.222.2025.07.09.03.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 03:10:10 -0700 (PDT)
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
X-Inumbo-ID: e68456fd-5cac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752055811; x=1752660611; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+oTUXggHFkMhsuLHSQGElxPAOmR6WCA2e5QxoeAU7I=;
        b=Hf4urYGTvj4hQIeZwfG/RWjNsZ25E5ek7+LPXTNycBj43WsrMjLBANkP0GRF/RXu4h
         lX3FelfyIl2aJcqiVI6hVcCY9xJYFtJeUQurNKo6qUkSfl5cY9eKI+S3L5vPvfdJByVL
         yPnic1IqaMKBfuiz6yfmjADjA4WdbPcfTg+c+Kp4hoWLfc0xBBowqneSWzjUXaqGmmoG
         c2wHxIAGB9naQfn8ZC0X6Qh+PhsYAX4yS9yLXnlLPfXMtrQ7Y9efE9pV13vedXaBqhIp
         89UaFTd52v92OpVgP107dcUhdiYUb8nPwsulqC33noXCZxjqUGPvuaEfzMOOtgjAhiVE
         CWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055811; x=1752660611;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+oTUXggHFkMhsuLHSQGElxPAOmR6WCA2e5QxoeAU7I=;
        b=tIg+IFb/PeOh7t+yShev/2/NT0HaS6jiC5kFvalUxU3eQnwQHpLf5G2l6yVq6OFedI
         PduOFwqwyelfqiY3lV8vsXmaTwMOujjadvMpST/o4b5twOnX7ODmMyYJ05tnPyUdgGTy
         KVyfiFBg9XsljCPI9C/SyEW3fn/K+ONJchP7dYb2pDgZjclP4s4b09LJj2SoeqfGsvq7
         L6xATYKD5HxXUlCV8WTIp5tOnZI4FEPClX9mSLkPS0L+N81XtngBO53hOe5sGU0vcyw4
         buzcOp6A4GwjsgHt02i1q4eyF2LD9q8WT7xOGP+Xq5MMKnOnrhT/jLlFKpeJIXuXGVRw
         ZFiw==
X-Gm-Message-State: AOJu0Yym5NjJuwafEPJYZHlrvmmZ04aMU9UOTDPAl3B99H0eQJD90vsf
	02S+R7w1TXiaXvYN349MJOaAl84chQ4nKlRxQJoxdxZ160pPs2JAe6kU4BvSZsZYecjTyeQ1IpZ
	pVnA=
X-Gm-Gg: ASbGncszDpHPvFWPz6Kr8WUH8cbHL9d1VHlvYd+h9CSozZQ/7WEco8xgOEg45Wdj3Hu
	/eqFRpKZS8Ilrsk4KGWloIhANshRQiFSbVBMzgRUzODngfujFMNaOMPWR6zt/O+KVnd2ei/nCDY
	dUbPjbQspjDl793TNnSqpb5PQu0wJXIxGnkhupxS/HzCK4NUNHHLLYBQ6+0Uuv7gollCxRhy8mL
	47DUgIztZfLbGSQjpTdauo8L6YZQvOWPAa5YRRmdkCB8FiEZYr4acTg/w4Wsl3HiWaFTHxgzexv
	/38g0VysgLVVU2GTHPplMu0Ad4/9kAPcog3GSZ3DthV+FeouYSBK7mu+1fMcDHzlsqa+yNFtUEM
	1IyN05/1Wv/tMZaQ2vv9fFGzMKGlPHguL7vo46BStvcsrG3Y=
X-Google-Smtp-Source: AGHT+IEEvEvCz9cSLLhryWX5X8a/YCebRbYMZuqzrOK9C36j/VOKIZd7IjNdHw1XmRkYKSPiq0rVBQ==
X-Received: by 2002:a05:6000:2006:b0:3b4:990b:9ee7 with SMTP id ffacd0b85a97d-3b5e453117emr1204422f8f.22.1752055811428;
        Wed, 09 Jul 2025 03:10:11 -0700 (PDT)
Message-ID: <be5994d5-5e8b-4d9a-b08d-2a7f11a78e3a@suse.com>
Date: Wed, 9 Jul 2025 12:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Penny Zheng <Penny.Zheng@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] acpi/pm-op: make do_pm_op() decl available in pm-op.c
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

This addresses a Misra rule 8.4 ("A compatible declaration shall be
visible when an object or function with external linkage is defined")
violation.

Fixes: a16f2b3e0669 ("xen/pmstat: introduce CONFIG_PM_OP")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -5,6 +5,7 @@
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
+#include <xen/pmstat.h>
 #include <xen/sched.h>
 
 #include <acpi/cpufreq/cpufreq.h>

