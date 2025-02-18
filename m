Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4AA3A0A0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891838.1300855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP3T-0005HF-Jd; Tue, 18 Feb 2025 14:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891838.1300855; Tue, 18 Feb 2025 14:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP3T-0005EW-H4; Tue, 18 Feb 2025 14:58:35 +0000
Received: by outflank-mailman (input) for mailman id 891838;
 Tue, 18 Feb 2025 14:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkOgq-0006F6-6e
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:35:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e7ef3c7-ee05-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:35:10 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso10276403a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:35:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb952c7364sm450691866b.18.2025.02.18.06.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:09 -0800 (PST)
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
X-Inumbo-ID: 8e7ef3c7-ee05-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889310; x=1740494110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWQsofR/OwYu0UntOR2i7CjQrmM6vERZ5SxhIV+/oQs=;
        b=U4nKR4DkIT3zNZf84AnWijmuzeYqAl31/JWzI/7ba5Hc/OsF3DHvgKCG7T5i7NL56g
         PPRNiNazRyaDh3D3QpwqflVlBDZsDgsU8g6YVdPfVkZxxI6EukreGeQns5y69AEfjw8c
         rlQ2zB5oMi8K8nKzy2xJmJqXcjCal1Xzmq5wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889310; x=1740494110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWQsofR/OwYu0UntOR2i7CjQrmM6vERZ5SxhIV+/oQs=;
        b=Nv3rhk3+qzYavT2GITKMDRm9Y/nQgYp1zjWDCmOQoWlPNoMia5Di01wgn1Hhk8eZOV
         z8LXdKZ8ga4d40pDB71UE9qY10EBtHBM8d224e8+kSaJfjKglZoSouXACKMcSUpP94JJ
         7dv4lCKyNUg6KGu51c0WsUR3iMvv+rwZo+lcUyykhWYc6WIgXYycZSAKx7WYbtXbBlfH
         xWfU4KxqS9csiUAyi59XWLKa7tWGeCsia7GMDlxTy7OeT5S6ae9kBLwwc9/iSR1Qq4zI
         qhsKW8TBOfpAOqWZh/zoKJbOjvcWVgVa1wjMlleXG478Z4Lpw+uw5/e9okTRj4YNOEAF
         PEBg==
X-Gm-Message-State: AOJu0Yxjyo3Zrm/zUbjZq2yp8753598sh1E/xJeqbkD/ow5b+BK2Pa54
	toBHoAFV9BM7f7PPH9mLRozcidylfvZg70Y2gfBSKw+att70GssAnNljiSWmFhCc0JGwcMgnnfB
	P
X-Gm-Gg: ASbGncu+eYcIubuOQjs63bT4/0+XCrLVjg6oBGXclGGSJniA+rGwhaOXs00JF/KC5Z5
	cwPWs+cSLQjyW1FJuFIFnn90xWxBpMlNiWF6AKJ4liCkDbPiGNOCsb3hTy7oWlaP+0PYnc3YPKB
	l/AJFut7/H3f4WiyctUJ/v1y4fD1k34+d1P+ljJkmse5qLR/o2LC7N1n4H1R4LZlCcPTzLF6rjF
	MbUO06yd2Ut3ZqZLLyP9tP1ryQeBsWZAvzXjr0QFbWtdwU1TDNfm6+jzOxE2Vt3SLtP9qFKvtV+
	cdn/2WspFSuBsoMUkl1g
X-Google-Smtp-Source: AGHT+IFdki87Kb70og2rfQkffNBKPkMfweUZa4yACA4+AB+FPxgpdQXCGMHoZ1di5iaJp/yiwTq1tw==
X-Received: by 2002:a17:906:3117:b0:ab7:b356:62e0 with SMTP id a640c23a62f3a-abb711c3ef2mr1262258466b.53.1739889309751;
        Tue, 18 Feb 2025 06:35:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/emul: dump unhandled memory accesses for PVH dom0
Date: Tue, 18 Feb 2025 15:35:03 +0100
Message-ID: <20250218143504.77638-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250218143504.77638-1-roger.pau@citrix.com>
References: <20250218143504.77638-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A PV dom0 can map any host memory as long as it's allowed by the IO
capability range in d->iomem_caps.  On the other hand, a PVH dom0 has no
way to populate MMIO region onto it's p2m, so it's limited to what Xen
initially populates on the p2m based on the host memory map and the enabled
device BARs.

Introduce a new debug build only printk that reports attempts by dom0 to
access addresses not populated on the p2m, and not handled by any emulator.
This is for information purposes only, but might allow getting an idea of
what MMIO ranges might be missing on the p2m.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/emulate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 0d90cc4598be..08b9493e6d88 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -337,6 +337,9 @@ static int hvmemul_do_io(
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
         {
+            if ( is_mmio && is_hardware_domain(currd) )
+                gdprintk(XENLOG_DEBUG, "unhandled memory %s %#lx size %u\n",
+                         dir ? "read from" : "write to", addr, size);
             rc = hvm_process_io_intercept(&null_handler, &p);
             vio->req.state = STATE_IOREQ_NONE;
         }
-- 
2.46.0


