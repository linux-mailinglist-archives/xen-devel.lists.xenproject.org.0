Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD17AB6531
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984045.1370214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF76a-0006Cf-TD; Wed, 14 May 2025 08:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984045.1370214; Wed, 14 May 2025 08:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF76a-00069i-QG; Wed, 14 May 2025 08:04:44 +0000
Received: by outflank-mailman (input) for mailman id 984045;
 Wed, 14 May 2025 08:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uF76Z-00069Y-9a
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 08:04:43 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16d8b748-309a-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 10:04:42 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7423fadbe77so4954408b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 01:04:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b235252c7bdsm8426426a12.78.2025.05.14.01.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 01:04:40 -0700 (PDT)
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
X-Inumbo-ID: 16d8b748-309a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747209881; x=1747814681; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1r1q9j/NiqaxCVnQX79fx6ZSieyvy37ernzXHZca/GE=;
        b=ftxImUPBV+uZ1D+TzyGBitsh5PYAWoNMiAEL8dYndNKIoIuOol35qLlNE+U4o/9Du2
         C81mTiudnOWjLuI8Kb2zW0aDVhN50KJODSFsydGEH42f54ORVvG8DDY/rAqkJ3l9u5U9
         4zzCdgqzMHP0Vox9Oovqoug1BUMDyrJXggFbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209881; x=1747814681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1r1q9j/NiqaxCVnQX79fx6ZSieyvy37ernzXHZca/GE=;
        b=Cl6EqyyOCts4LaIESzTM2JzSHEdsSa0hac8sOmGyWGZo0E0SxcDZGdUiU5AmZwLBAb
         k0Io2XAN2l5xmtLdegxyzcJNzcUfsGgTTQZWkhzGjR+chCw3GqT7enLj2pCaekACC4+P
         wZY4VczsK2OhPyS3wvH3UK6lGeqWDwEn4pKHr5PbNWEx6UTNYgVTeI0/YAaHWzZMY092
         IXik8MBe8KcWG15uDb1agqYngLpKrMurgnnV7lu6RFrqb+edd6RMcXLHJ1MwHbRL2vJb
         SBdj4egcYrtAbYeTKt0Gv0qqeEki1FSEJOvekckln31P9fH+NvD99PWJR5WTa4DuVOYI
         L7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVPDYfxRPRe1ztHZeQbABCK41Vi/PaA14sXPI9iX1sDbeF6o4F/pwmZ1iE4wH995E/ypNmfoZhvA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNhpsD2kbAbnatyaiWY0dgFWM9dDZr68C7HCsR2KEAz0tPoFBG
	WdgOFIn4YY8abFJ+VDtK/jbdh2ruNkicWFim6jINbeVSv86mUj2Q/kYUX4Khyvg=
X-Gm-Gg: ASbGncujPJpzALGQho0l2RXRlPFP5jxfCn8LnYPQZCwYs8Daid8ThK4EPEmSNGXr5qy
	fPZ+UISxbDVFRNfU/Zb4qsjizHabj4wO2nT1y3XSocKGsAq+AEDP0c34asfXXuAI2t+2nRnvrG+
	CdmbflDdMq/V0diBbzEfM4JbTqXqnzNW1INE6as+dELCNgBhtqLKFgLUJWbnk2Z9YHVu/1WeZAL
	F7Cfenno4Alejl2docTObSu6FQz6yloUqZno8huMaB54VnKfoZE+MmFiJoDC7U/06mf1/1eEyEe
	JPnu6HsVCni9YGuXkwplyTK0m0E4gRbP3C9bwjMo3eBW4P5qv4yzW9xxxh27bwoIQW8=
X-Google-Smtp-Source: AGHT+IGjjnzREvj/FCp6iOWskek++QwmkIK4fblbdLCYyxcvDMW5FxY5l8ARHhqFi5/9zGZiCAVtFA==
X-Received: by 2002:a05:6a21:6f13:b0:1f5:8e94:2e83 with SMTP id adf61e73a8af0-215ff093380mr4072477637.8.1747209880749;
        Wed, 14 May 2025 01:04:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/x86: fix initial memory balloon target
Date: Wed, 14 May 2025 10:04:26 +0200
Message-ID: <20250514080427.28129-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When adding extra memory regions as ballooned pages also adjust the balloon
target, otherwise when the balloon driver is started it will populate
memory to match the target value and consume all the extra memory regions
added.

This made the usage of the Xen `dom0_mem=,max:` command line parameter for
dom0 not work as expected, as the target won't be adjusted and when the
balloon is started it will populate memory straight to the 'max:' value.
It would equally affect domUs that have memory != maxmem.

Kernels built with CONFIG_XEN_UNPOPULATED_ALLOC are not affected, because
the extra memory regions are consumed by the unpopulated allocation driver,
and then balloon_add_regions() becomes a no-op.

Reported-by: John <jw@nuclearfallout.net>
Fixes: 87af633689ce ('x86/xen: fix balloon target initialization for PVH dom0')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/xen/balloon.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 8c852807ba1c..2de37dcd7556 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -704,15 +704,18 @@ static int __init balloon_add_regions(void)
 
 		/*
 		 * Extra regions are accounted for in the physmap, but need
-		 * decreasing from current_pages to balloon down the initial
-		 * allocation, because they are already accounted for in
-		 * total_pages.
+		 * decreasing from current_pages and target_pages to balloon
+		 * down the initial allocation, because they are already
+		 * accounted for in total_pages.
 		 */
-		if (extra_pfn_end - start_pfn >= balloon_stats.current_pages) {
+		pages = extra_pfn_end - start_pfn;
+		if (pages >= balloon_stats.current_pages ||
+		    pages >= balloon_stats.target_pages) {
 			WARN(1, "Extra pages underflow current target");
 			return -ERANGE;
 		}
-		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
+		balloon_stats.current_pages -= pages;
+		balloon_stats.target_pages -= pages;
 	}
 
 	return 0;
-- 
2.48.1


