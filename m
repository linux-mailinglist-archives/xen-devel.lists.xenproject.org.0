Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E697D7443
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623192.970813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZt-0001wO-IP; Wed, 25 Oct 2023 19:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623192.970813; Wed, 25 Oct 2023 19:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZt-0001pj-AM; Wed, 25 Oct 2023 19:30:05 +0000
Received: by outflank-mailman (input) for mailman id 623192;
 Wed, 25 Oct 2023 19:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZr-0001Lv-Q7
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4082b4f-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b95622c620so24429366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:01 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:00 -0700 (PDT)
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
X-Inumbo-ID: e4082b4f-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262201; x=1698867001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q52Q1bg8EwRk5uyN9PN5npyenGJL42vG+cI2ukLBfR8=;
        b=UghYwxM6eNUCHWTr+y5tNHJ8Yu6Y2UMZ6ZZPprpEaJeoyX/WVYTzEjxOEC1rD3aG8X
         vdFNZp8LXm7oVDQ15Q0ar5AHAcgm3Cg61q87esA7DRsLNe0pyc0L+fvCujyULZ1bdpPB
         dNkXpxsn6grUw3LLwzPradwj3NPSWEmyeMx8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262201; x=1698867001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q52Q1bg8EwRk5uyN9PN5npyenGJL42vG+cI2ukLBfR8=;
        b=Z80Pv9ZyMLbOq1bWKdcMxmuOgKgfXrWUu4MagiS6VrHjBUqgtvz2Khg35ZZhqe0h2+
         Dvnr7EBjuwbp6V3U3jEWqyoQr5yqA4Mx1qtuxpySJMqIcaqoQsmxGuFxiMvdp/0y2Xcb
         rr7Udw+yZAjSd1G2bUzY9wTcCP4fuJJFxF2ya9cZj1K+7Zg/6yVuJFpth1xNUgoEzALp
         j85xuems0Bk9Xhk63ZMz0g2pqPbQZUN5m/FM86Vp9Mlrl/DDI18DJXxGVY2HC4cMAtdo
         nng67v2SvaA6OGyXGgjzoCns3fzJAcIukjO/xyHKNw4Km0AS/lOF7Ocg1411t/iFqgm4
         YUEA==
X-Gm-Message-State: AOJu0Yx9N0/VszveJLz9nMLCQQ1QXpnRCKEKLJcC1S37ERWar4PXBiDi
	zxjRlsDVvxfEiNV3orzxhGYpwA8W3X3oKvdFBMjTjC/6
X-Google-Smtp-Source: AGHT+IEDuSoHLBTSYKrv2dcyhFL37zkfx/6RXE+qOUBBIBiN5yWyjunViK6qHo6pKXlKofiH72yPbg==
X-Received: by 2002:a17:906:fd82:b0:9b2:7367:a6a4 with SMTP id xa2-20020a170906fd8200b009b27367a6a4mr13965194ejb.31.1698262201049;
        Wed, 25 Oct 2023 12:30:01 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 04/22] x86/msr-index: add references to vendor manuals
Date: Wed, 25 Oct 2023 20:29:34 +0100
Message-Id: <7e4418cfb1daa172e78fc47098a4018ae0493e23.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

To more easily lookup the semantics of these MSRs add references to
vendor manuals.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2853a276ca..8601f8f426 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -13,6 +13,16 @@
  * Blocks of related constants should be sorted by MSR index.  The constant
  * names should be as concise as possible, and the bit names may have an
  * abbreviated name.  Exceptions will be considered on a case-by-case basis.
+ *
+ * References:
+ * - https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
+ *    Intel(R) 64 and IA-32 architectures SDM volume 4: Model-specific registers
+ *    Chapter 2, "Model-Specific Registers (MSRs)"
+ *
+ * - https://developer.amd.com/resources/developer-guides-manuals/
+ *    AMD64 Architecture Programmer’s Manual Volume 2: System Programming
+ *    Appendix A "MSR Cross-Reference"
+ *
  */
 
 #define MSR_P5_MC_ADDR                      0
-- 
2.41.0


