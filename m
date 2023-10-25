Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE047D744E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623194.970832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZv-0002d7-Dt; Wed, 25 Oct 2023 19:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623194.970832; Wed, 25 Oct 2023 19:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZv-0002SX-7y; Wed, 25 Oct 2023 19:30:07 +0000
Received: by outflank-mailman (input) for mailman id 623194;
 Wed, 25 Oct 2023 19:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZt-0001Lv-QQ
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:05 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4e9c8cf-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:03 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so22209166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:03 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:02 -0700 (PDT)
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
X-Inumbo-ID: e4e9c8cf-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262202; x=1698867002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kel4w+AQXGzNo/gpv6UV34p2+pJUPxrobh9qF8lkfgA=;
        b=ao6wAcCyyaQGgczNWgz66cRtQF+lOlEy8SUzJNd2OD+3Wu+6PwoEu7btILlTuAjVSM
         xDrJFU9GXAPcC0XXwtwQY0/jQtb0b44bl4reoY6VtKG06KK73uUbw7tUONIs6KeznKdE
         e+dZwLMoeypVIGiJ0WshozN1rx9P9lE0pOWXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262202; x=1698867002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kel4w+AQXGzNo/gpv6UV34p2+pJUPxrobh9qF8lkfgA=;
        b=QXw+h6++XeMsIdHniNpsqoVEgr56r9URqKsdxlJjFfmaQbxEBrpAOAaoXa5EpJ1Apu
         6iPCx+nv5etxNpI/720wMfk+AtVqZJodmfnun0CDLBMfnBa7gPc6LcMjLBYzs2C2LrDR
         nBfFHL+ycF3cNRXHWGLXVGdnKidjhX2KPvj8QaLq/REbsNoQ+7bJLLJC9Z3wPLznbTJX
         0vBpvXRQOCVoVsqSr53cn/SCbhzHdYDyodY3urnZ4l2U7K7WQ0qM7g8/cWFA2oHvkRFA
         SmZj+GZB6+15LUKfDW/5ZcVI96S8Bkf0re0iG6gNn/I8qNdUf4qdPqgIwDWXSKAHGkr3
         cm6g==
X-Gm-Message-State: AOJu0YxqmnWvK4g7NyDD713HXxdderJh2ehwcfwSUMLxLnqTJLDmMVDd
	khcClGcwkqTvlo99WMByjIqlL1YZpXa5b83jZedhkz2x
X-Google-Smtp-Source: AGHT+IGbKc2jQ4Q0PVrBZMcpCHLXBfoNvATvEKAJZTTKSBDyDV/PQqhZ+zu6aXMtAGGxtWu16quuUg==
X-Received: by 2002:a17:906:3656:b0:9ca:e7ce:8e60 with SMTP id r22-20020a170906365600b009cae7ce8e60mr5464173ejb.41.1698262202484;
        Wed, 25 Oct 2023 12:30:02 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 06/22] x86/PMUv1: limit arch PMCs to 4 for non-Dom0
Date: Wed, 25 Oct 2023 20:29:36 +0100
Message-Id: <fc28de1f8d0558829ae902cc2a76063ec31815df.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Only PERFEVTSEL{0-3} are architectural MSRs and Thread scoped.

PERFEVTSEL{4-7} are Core scoped, and we cannot allow using them if more
than 1 guest can attempt to modify them: if they program them with
different events (quite likely when multiplexing) then one of the VMs
would sample the wrong PMCs.

For now only allow this when Dom0 is the only one using the PMU, i.e. in
vpmu mode `all`.

We could also allow this when sched_gran >= SCHED_GRAN_core, but we
don't have access to the cpupool here.

There is some indication that this was causing bugs, e.g.
`pcm` mentions about a bug with perf counters beyond 3 on AWS:
https://github.com/opcm/pcm/commit/02f3b00f304401c723131372e09b71798df613ff

Backport: 4.0+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 9602728f1b..ec9ab01fde 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -926,6 +926,16 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     }
 
     arch_pmc_cnt = core2_get_arch_pmc_count();
+    if ( arch_pmc_cnt > 4 &&
+         vpmu_mode != XENPMU_MODE_ALL )
+    {
+        /* Architectural PMCs 0-3 are Thread scoped, but 4+ are Core scoped.
+         * We can only allow using them if we know that we have at most one guest using a PMU
+         * on all siblings threads on a core. */
+        printk(XENLOG_INFO "VPMU: limiting architectural PMCs to 4\n");
+        arch_pmc_cnt = 4;
+    }
+
     fixed_pmc_cnt = core2_get_fixed_pmc_count();
 
     if ( cpu_has_pdcm )
-- 
2.41.0


