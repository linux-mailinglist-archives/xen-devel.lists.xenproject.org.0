Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA69BCF77
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830266.1245293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdC-0004tG-1r; Tue, 05 Nov 2024 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830266.1245293; Tue, 05 Nov 2024 14:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdB-0004mD-Ld; Tue, 05 Nov 2024 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 830266;
 Tue, 05 Nov 2024 14:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd9-0002K5-HU
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:03 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffcd476c-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:34:01 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so5709387a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:34:01 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:59 -0800 (PST)
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
X-Inumbo-ID: ffcd476c-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZmY2Q0NzZjLTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjQxLjMwOTk5MSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817240; x=1731422040; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHukccBbBpbC+k7kZ0/gZzzWfRKQINdoK6h9gGQzyg4=;
        b=fT8CMbkKkoEionf+10rr2ldMJYNDhX+QDFRZilivZDvqtnn8htUu1tNxDov0z0ulV0
         kY1kqbe7x8SGosEnflPyAUsyB9diZAQBFvnXAgVYSWMUf9+xVqBw7/JiApz3jTlnRpmh
         fDS0bAvmBmRS/euKUR3Y6D4F45d5GiMAO6K5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817240; x=1731422040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHukccBbBpbC+k7kZ0/gZzzWfRKQINdoK6h9gGQzyg4=;
        b=bNmiJftDzQrFvhFURlcL+gnu00nCOTGvhZWnCgYWE7eon4OEvg8EWnEUVSdDCYN5xQ
         zYS2+qnXLcbXVdV53+cMbBAdo0LSROdeFk23sQlgTnIBct9nFxJlKSjPlJWsy0p5JSiq
         Z0+wtQYBcdzOX1w0C2cB9+5P1TzHepXDntxuENLXUOirtuIPgvUfpCn2gRdH1t5ecPXR
         q3us5FEMYkjuTEDC1mKvkDeItqP7GXem6h49/2g3jrO6X9U7M6SC+DI8+UU9/aOKw+pm
         ASs8cfHD8M5xDsMjgqTTaCsw92odujX3c6jZxwzHUaC3xeqSJ8c4me/mhsmHN2kE6hZK
         Xsww==
X-Gm-Message-State: AOJu0Yw8zLd18fdX1+TbFG9+geylQgYbz2tQrSw47YNIcvJJHwIAVZjy
	kVKobDZn5G/R73xHxHIkXgx/MDLdc/D/PUmEHo6+agSriiTg9wnxYz00VDHZPR95ppzNdpdyRrk
	Q
X-Google-Smtp-Source: AGHT+IHa/ojeelBSzZGbiAyj+Hr1UbyyUgXITX9+Pi112rloiy17KwqQt0YRmn5B4ntqXT9Ez72fbg==
X-Received: by 2002:a05:6402:278e:b0:5ce:de14:63ed with SMTP id 4fb4d7f45d1cf-5cede146458mr4200250a12.36.1730817240423;
        Tue, 05 Nov 2024 06:34:00 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in read_bndcfgu()
Date: Tue,  5 Nov 2024 14:33:07 +0000
Message-ID: <20241105143310.28301-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * s/ret/bndcfgu
---
 xen/arch/x86/xstate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 6db7ec2ea6a9..9ecbef760277 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
 uint64_t read_bndcfgu(void)
 {
+    uint64_t bndcfgu = 0;
     unsigned long cr0 = read_cr0();
-    struct xsave_struct *xstate
-        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+    struct vcpu *v = idle_vcpu[smp_processor_id()];
+    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const struct xstate_bndcsr *bndcsr;
 
     ASSERT(cpu_has_mpx);
@@ -1050,7 +1051,12 @@ uint64_t read_bndcfgu(void)
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
 
-    return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
+    if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
+        bndcfgu = bndcsr->bndcfgu;
+
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
+
+    return bndcfgu;
 }
 
 void xstate_set_init(uint64_t mask)
-- 
2.47.0


