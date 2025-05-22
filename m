Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA53AC063E
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993099.1376548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lL-0006Sg-E1; Thu, 22 May 2025 07:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993099.1376548; Thu, 22 May 2025 07:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lL-0006Ng-93; Thu, 22 May 2025 07:54:47 +0000
Received: by outflank-mailman (input) for mailman id 993099;
 Thu, 22 May 2025 07:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0lK-0006JE-31
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:54:46 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06c72dd9-36e2-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 09:54:45 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so63606005e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:54:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f73d3edcsm97786325e9.20.2025.05.22.00.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:54:44 -0700 (PDT)
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
X-Inumbo-ID: 06c72dd9-36e2-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747900484; x=1748505284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tt93X8/M//cm6RVXeEKC2o6v986fsxbCRkDTkmxvdfg=;
        b=keUgetdG2fXqvMvWke7zPH060AGv53DFA7JhK9UEZabeLK3L2zNtcnspkJiC1sluo3
         3oOuBgyWwXjL95okSQHgXDm4Q+voToxVpswgcTxAYBFmvgYdBv3MdW9qt2OG9pfxSEYl
         kTH5IPuV8gMte8U/NSlqH8rRoinJMppe2JQGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900484; x=1748505284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt93X8/M//cm6RVXeEKC2o6v986fsxbCRkDTkmxvdfg=;
        b=UUym3EjWpZy6bw5oSJM2/IQFy/L5WI1bUII0rKxK3EjRnOlZNnH+mWL6Xe07WH8KcQ
         Nk7nB7kL/+3B/gfLrLsYL+g5oKcX5Pvdw5fopc3skSWNe35zpdx5snc0CXcu8QZzs+8O
         eOyonDGPnEL3hb2x7JwgYocAuEjrauNpZBaJUoTp+myMXaumVcY+yqiTckfDXilMPNKV
         /EdAnzkefhmndYznEm4pCEekjyDGwzecI+LbRjUdIvFwCrKy6A/8OYr0pWR2Ee/Qv47T
         2Ljp6KXS+bx/4VD52bdO/e5VTOJxTwuudKOubwE7Csgsxg8Jp1rzGMJXjNk13mrRbo6F
         OnVQ==
X-Gm-Message-State: AOJu0Ywxa53+IPd+Akv9Q1T4f3TZ15Gb8TBfcwXPhRMF7QrtTgOgKWn0
	JlcNn/cnsiRglg54xDmirAhkA8Ee67qJkZDmTyphOUJSHcphMOXz/WhycnSTOqNZhy+JzoC1J1m
	4bhrw
X-Gm-Gg: ASbGncu4PevKy/9aaJd6LXGaZrWKL5DIOyCRdEouUoZbnSkibdXuzo/y3UcYotwYc0Q
	t+cDs5RHB4AiEjYo99H8sihdZTJc9OgmLbHWn5rhWHmACyJkRQkwcv6WJ2uDgRn0pr8DZMh005x
	jcour8BseAQ5E5mFv7/VNLHrrxTN8cXPWO4145inBQTOdn8jejpRQUPKgMfyG6GOitxybdgB4D1
	w0eMUDQh+vvHBStmzwMkC7gT6jyQRxtB/o0Q6A2YwREXNBL2v+H6DvGtiqjSuYnmsNVDJSBlOps
	+EoDtg6sL2MdGUUDnJ4RaPA9f5gBAYLawUvmGQgXzGSYV/THcvFTiiQGEPswkQJOndzwmTmuVcE
	fU0TMQnnNBHDFw+tQSvZEuMZkVPDYOA==
X-Google-Smtp-Source: AGHT+IGhNrAr/hRUljY+8j/hvusjJZFNAobH2p1pEtgVC2wSlfpCVao6R/KxtDVBG57mG422/tHzlg==
X-Received: by 2002:a05:600c:5305:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442fd622eb4mr288804925e9.10.1747900484472;
        Thu, 22 May 2025 00:54:44 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/4] x86/traps: remove smp_mb() ahead of IPI dispatch
Date: Thu, 22 May 2025 09:54:38 +0200
Message-ID: <20250522075440.99882-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522075440.99882-1-roger.pau@citrix.com>
References: <20250522075440.99882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IPI dispatch functions should already have the required barriers to
ensure correct memory ordering.

Note other callers of send_IPI_mask() don't use any barriers.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/traps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c94779b4ad4f..22f20629327d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -785,8 +785,6 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
             cpumask_andnot(&show_state_mask, &cpu_online_map,
                            cpumask_of(smp_processor_id()));
             set_nmi_callback(nmi_show_execution_state);
-            /* Ensure new callback is set before sending out the NMI. */
-            smp_wmb();
             smp_send_nmi_allbutself();
 
             /* Wait at most 10ms for some other CPU to respond. */
-- 
2.49.0


