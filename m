Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75161A6DD56
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925719.1328602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twj5B-0001zb-EV; Mon, 24 Mar 2025 14:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925719.1328602; Mon, 24 Mar 2025 14:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twj5B-0001y8-AJ; Mon, 24 Mar 2025 14:47:17 +0000
Received: by outflank-mailman (input) for mailman id 925719;
 Mon, 24 Mar 2025 14:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twj59-0001y2-85
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:47:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df350216-08be-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 15:47:13 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2401947f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 07:47:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3a10sm11029428f8f.28.2025.03.24.07.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:47:12 -0700 (PDT)
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
X-Inumbo-ID: df350216-08be-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742827632; x=1743432432; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHW3o3KuYRIiSfPlaM/6o4MZpVpg3PF6ZSje8Ur31Ic=;
        b=M9HbzoS6vL0pb0I/e6YaAoU9P8yF0Vdalfev/89+45yOWKd8gRRqVt1BhjG1ve+Ija
         YKuBrTA5UY1KY3fYw5p0eN2xG4FkFhgm+7MxhapTWXPzYarHOADixt6d+2IRdkJiQPw4
         wGdbZqVKzJG+OMh0JFi6CoGehIXWw0ttBSywV3yQZjR06/62ju75J9c3MihxPxHSomYJ
         go1txqtaLdqMGR9U+ggLMX63gH3WaZG/AoxJlm+DGwNDojpWYwcGErXpe2dlGCGzrX9L
         /WfukTLLSbznU01DJABzH35oSIdLPquVmEk5WT0LgBzS099MePnKHXBww0P/DQjBejdV
         W4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742827632; x=1743432432;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHW3o3KuYRIiSfPlaM/6o4MZpVpg3PF6ZSje8Ur31Ic=;
        b=HkAdAhlJ4ibSKY8+W1VJoMUyvTaPFevGGmghehmPTsaZXgFaECHAXdixlsPEVjU29C
         vLClAdwsKofi67UXL2hb9pYbBLkD2CvGlwSNsNgulmb3LgP/UtPZo4rBZV5nHaaOgTsR
         2b+LPe/poxt5Q5814ZMthNDjrKKdQEiV7ME7vqnjdk/cDaiwsTlqhholVuD+GWvFGA/o
         CgHzX+LAioT5AqnwPyvE4LiBBBh33/YGPh0eS79g+DaYMXt9jkJqWsa/WYmJitpwr3lM
         fl0ejDl3Tp43B1zaxxixXIXhr454IYKbbGnyDmU0zq6zodqBrkJ05tu9v/PyFM8HdCwv
         +FfQ==
X-Gm-Message-State: AOJu0Yw6Ux+MoChIYRM22CJwj0wSCm5cbaL7F4mNQ+Ud+9HxO9l5zcHe
	FTrhdPZ6ytgFyQWaDQHm36egvU88syiRxBOnum6Dr2Jhcwugx763XjSjsBjqfuZlHfC0E71AypM
	=
X-Gm-Gg: ASbGnctrLdkh/vzJneTYpfuu9YiuMrI0JI8DwVtwIj+1jkbBD0UtOBXu36j49Is5nqX
	T4tf/XTQKPU/KKDus6tq4couTaNsPtmUQRXMA4cZqXKRMlyE+7R1JocUOJHV/q94h/YH/LQ5GzC
	plOfESUnEvYnVoc+PaqZoVTQ1nINmWpAixty7E4ZYguLkHl0uEteoPkkEddD617DfGSYJeul2xe
	cIg14S0HZnjQCF7NUTZyQPhyoFQfeVmWBVr/gdh87HIt9LaWBkh0BwRFyWzLEbp4C4vmpnx1vl+
	dbffEW8KNzfktdKDCJ5pnCeCw+8en90DmTvJf/vtdE/IXN6gzsH8Nw9tvjnNv5TgaXITQ+LY3tt
	MQCsP7VnjubNd5jYWUPBnER6Mq847Eg==
X-Google-Smtp-Source: AGHT+IH0+qpARs/vl/QPKMoR8OULd5lxIU0TjTtc7fLOZ0nCcPb2EXNUp8BCjZVrYYO2OoVJ8EVTqg==
X-Received: by 2002:a05:6000:401f:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-3997f90f413mr11271435f8f.12.1742827632500;
        Mon, 24 Mar 2025 07:47:12 -0700 (PDT)
Message-ID: <b18e523d-89a6-482d-b2ce-a5576578ff58@suse.com>
Date: Mon, 24 Mar 2025 15:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] arinc653: move next_switch_time access under lock
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
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
---
v2: Put comment in appropriate place.

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -580,6 +580,9 @@ a653sched_do_schedule(
      */
     BUG_ON(now >= sched_priv->next_major_frame);
 
+    /* Return the amount of time the next domain has to run. */
+    prev->next_time = sched_priv->next_switch_time - now;
+
     spin_unlock_irqrestore(&sched_priv->lock, flags);
 
     /* Tasklet work (which runs in idle UNIT context) overrides all else. */
@@ -591,11 +594,7 @@ a653sched_do_schedule(
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
 

