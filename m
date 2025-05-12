Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0EAB3B1A
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981609.1368039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR0-0005Rs-D1; Mon, 12 May 2025 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981609.1368039; Mon, 12 May 2025 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR0-0005Oj-9A; Mon, 12 May 2025 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 981609;
 Mon, 12 May 2025 14:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUQy-0004nZ-EK
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1c9e27-2f3f-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:47:10 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5fd1f7f8b25so3058369a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:10 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:09 -0700 (PDT)
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
X-Inumbo-ID: fc1c9e27-2f3f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061230; x=1747666030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdxxBMh/8WuvhnZcKFZ8Olw6CipXskfibxNFcNvZtyA=;
        b=dPO1Dcv4MurhPry58joWp32vfXYlIQSYwOfTjyAExlKWnVuLkzp+yTShL01B87Lqzx
         Fp5bUbR1sd09g+OpvslC6nKS0URaltyxujOti6etvEM1NTAmdcNqpOMgQYjM6b2VQ4s9
         XgWb8RhfhfPaE0Dc3+rM73/SnFbyTYeUmBw1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061230; x=1747666030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdxxBMh/8WuvhnZcKFZ8Olw6CipXskfibxNFcNvZtyA=;
        b=UbyJmUqXxXrTQxLmn/4jojfH9Irg84P5b+R7KIgIvFOYE/KcYPecnyEgpEhZJxMFDc
         WLrYUGT4a0TWYFdpYRtOJ7EK2HTl5BuI/a41sr7z5he9pFfkBSbOu2YlGQuSwvMfjF1h
         TlC9zaC1aHfGfDkJFQZORz0ZFlDrUmCjwf5jBVllEefHNftY0fQ2xXOwqgcyltbWt07r
         RmGoLYdC6KGVJgD24BHWgAhzUtCxx2GXoAyhDmZqZfCwdmXl0CqXgxuJBpnDYmcAItqW
         fZJoO0LG9Rrww8Ahm6MpzG8mQxDi2wHVFdsG2Vvl6z8bsFn581TBbwnthH2Ubz7YJzI4
         WEcA==
X-Gm-Message-State: AOJu0YzoPONCB3n2a7o8rufbnSbOnf5w77UbhAu5AygNCKWxHR/iTO1u
	z4ZdjLj6o/y2x48YPPbH+XIe27CZr3531NB1pnNeGzScu3LQq9gzISn57jAtnPwuXRhHMFlAgnE
	=
X-Gm-Gg: ASbGncuU1iY5xig69gtTc28pIRoov0QvXXsxy+yuVZM+KtFZB1+EpcyvcYVWaJENXHj
	hJB5Clx/nJTFQfJ8bBKj4XCrBqNJDG6CHKAZmjNBbxkiegmrk35L0hWop+z8XYspFqgZUn87gGA
	3KHsnopuvcAhqTuB0QolktPGePPI+gFpu+d4kGL0k8aA2S7/2v1P0c5je0LWCGp5EJqgyoPwr/7
	4D/EjH2KmX9P0l7KkvdUNGGigUuJcRlUzMAK+lMbSvBtl0L7Y7fATx5nN9wxMkkTk6Y7uOJ1bHP
	L8zaeWM0RvlOD2JcI9NymGFSC4+ILv4nABK0TKGT1p15ViJMWXaYJG5Qky33oNTL1Xb+X76rn9w
	=
X-Google-Smtp-Source: AGHT+IEfSekAHKOEUn0CR4UQaDaWEYPwhkWiAlH4A74/DDvj+20F3qik12yG4Et71HKanrJCdcH8UQ==
X-Received: by 2002:a17:907:9484:b0:ad2:5657:3161 with SMTP id a640c23a62f3a-ad256573523mr402058766b.59.1747061229968;
        Mon, 12 May 2025 07:47:09 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 3/5] cpufreq: Avoid potential buffer overrun and leak
Date: Mon, 12 May 2025 15:46:54 +0100
Message-ID: <20250512144656.314925-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512144656.314925-1-ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If set_px_pminfo is called a second time with a larger state_count than
the first call, calls to PMSTAT_get_pxstat will read beyond the end of
the pt and trans_pt buffers allocated in cpufreq_statistic_init() since
they would have been allocated with the original state_count.

Secondly, the states array leaks on each subsequent call of
set_px_pminfo.

As far as I know, there is no valid reason to call set_px_pminfo
multiple times for the same CPU so fix both these issues by disallowing
it.

At the same time, fix a leak of the states array on error.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

* New in v2.

 xen/drivers/cpufreq/cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 19e29923356a..bf65403ff50b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -520,7 +520,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
     if ( perf->flags & XEN_PX_PSS )
     {
         /* capability check */
-        if ( perf->state_count <= 1 )
+        if ( perf->state_count <= 1 || pxpt->states )
         {
             ret = -EINVAL;
             goto out;
@@ -534,6 +534,8 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         }
         if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
         {
+            xfree(pxpt->states);
+            pxpt->states = NULL;
             ret = -EFAULT;
             goto out;
         }
-- 
2.49.0


