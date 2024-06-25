Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F979170E0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748029.1155632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVs-0001eN-D5; Tue, 25 Jun 2024 19:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748029.1155632; Tue, 25 Jun 2024 19:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVs-0001aR-8g; Tue, 25 Jun 2024 19:07:32 +0000
Received: by outflank-mailman (input) for mailman id 748029;
 Tue, 25 Jun 2024 19:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVp-00008w-O3
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa255d4-3326-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 21:07:29 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso501003766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:27 -0700 (PDT)
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
X-Inumbo-ID: 2aa255d4-3326-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342448; x=1719947248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqTAjuFXDg4PchRKJS8PgwLD1p7wjSEO9wUcu/jl/lg=;
        b=aF7Eudbs/pvxagbLa98MU3eidR/QdZZTGQG2uELKl4t9gnJr/60LB8peKiHyLgMd7Y
         c3AF5sFwInypUhNvKwNcLI83w/7l9iijfJ29p+edAdxs4WGgmub0tduDm4WKEj/oPXNw
         xZ7xxmwxSiUKHZrKBwSub7JhfZ7UlXD40XQt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342448; x=1719947248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqTAjuFXDg4PchRKJS8PgwLD1p7wjSEO9wUcu/jl/lg=;
        b=sN0bwQ/D8zYAvvlxgFCLpa1GOdRiUDCAQiVjtDagixpIOiByGEN82nrvL28itQe1fz
         oULq0dnp7nx7sATmBvtHgbAH4jxyzj/vVb+CCih7t+egT2GW9Oi0YbMrp2E/qfnNDfud
         SYpQxt8gieONFxu4ugijtdNelkQOQv8CahozdYFyV0rIk3kOWPqHcKjR+e1oF2HTm5S7
         nSz3d3aMVjs18khVXTYFJFgKziunRk7fog5Z7n+nEF6tiSTzuYd53Tkib9SINF6WGJYt
         lWt1H4m2kltdVqbGmRBAFns7uxEdWqTI+o1YEUugqXnX8njoBNG41ez4+0I17Uike6SV
         4Xhw==
X-Gm-Message-State: AOJu0YziNW1sXQ0aZlBqpMUxWN/Q8Dzb0zJtgKJzr8XOTTqy0d+844Ht
	Q0Zbg0owXuPzvsh30VIMT80Vwo/6CeJH+nRkeUyvhEaCmBWCrsb2+LGdcel1A76BhOS3dfJthxS
	MlKs=
X-Google-Smtp-Source: AGHT+IEXoA2JRkMlTSVwVKWS+vj658ux8ClHQgfVG80Prd6QW4t1IN1zGIW7wD48aUpC2pYpxZkHdg==
X-Received: by 2002:a17:906:1995:b0:a6e:fa0a:4899 with SMTP id a640c23a62f3a-a7245b45affmr505431466b.16.1719342448411;
        Tue, 25 Jun 2024 12:07:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 6/6] x86/xstate: Switch back to for_each_set_bit()
Date: Tue, 25 Jun 2024 20:07:19 +0100
Message-Id: <20240625190719.788643-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In all 3 examples, we're iterating over a scaler.  No caller can pass the
COMPRESSED flag in, so the upper bound of 63, as opposed to 64, doesn't
matter.

This alone produces:

  add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-161 (-161)
  Function                                     old     new   delta
  compress_xsave_states                         66      58      -8
  xstate_uncompressed_size                     119      71     -48
  xstate_compressed_size                       124      76     -48
  recalculate_xstate                           347     290     -57

where xstate_{un,}compressed_size() have practically halved in size despite
being small before.

The change in compress_xsave_states() is unexpected.  The function is almost
entirely dead code, and within what remains there's a smaller stack frame.  I
suspect it's leftovers that the optimiser couldn't fully discard.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/cpu-policy.c | 4 ++--
 xen/arch/x86/xstate.c     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index cd53bac777dc..fa55f6073089 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -193,7 +193,7 @@ static void sanitise_featureset(uint32_t *fs)
 static void recalculate_xstate(struct cpu_policy *p)
 {
     uint64_t xstates = XSTATE_FP_SSE;
-    unsigned int i, ecx_mask = 0, Da1 = p->xstate.Da1;
+    unsigned int ecx_mask = 0, Da1 = p->xstate.Da1;
 
     /*
      * The Da1 leaf is the only piece of information preserved in the common
@@ -237,7 +237,7 @@ static void recalculate_xstate(struct cpu_policy *p)
     /* Subleafs 2+ */
     xstates &= ~XSTATE_FP_SSE;
     BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
-    bitmap_for_each ( i, &xstates, 63 )
+    for_each_set_bit ( i, xstates )
     {
         /*
          * Pass through size (eax) and offset (ebx) directly.  Visbility of
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index da9053c0a262..88dbfbeafacd 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -589,7 +589,7 @@ static bool valid_xcr0(uint64_t xcr0)
 
 unsigned int xstate_uncompressed_size(uint64_t xcr0)
 {
-    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
+    unsigned int size = XSTATE_AREA_MIN_SIZE;
 
     /* Non-XCR0 states don't exist in an uncompressed image. */
     ASSERT((xcr0 & ~X86_XCR0_STATES) == 0);
@@ -606,7 +606,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
      * with respect their index.
      */
     xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_X87);
-    bitmap_for_each ( i, &xcr0, 63 )
+    for_each_set_bit ( i, xcr0 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
         unsigned int s = c->offset + c->size;
@@ -621,7 +621,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
 
 unsigned int xstate_compressed_size(uint64_t xstates)
 {
-    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
+    unsigned int size = XSTATE_AREA_MIN_SIZE;
 
     if ( xstates == 0 )
         return 0;
@@ -634,7 +634,7 @@ unsigned int xstate_compressed_size(uint64_t xstates)
      * componenets require aligning to 64 first.
      */
     xstates &= ~(X86_XCR0_SSE | X86_XCR0_X87);
-    bitmap_for_each ( i, &xstates, 63 )
+    for_each_set_bit ( i, xstates )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
 
-- 
2.39.2


