Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B366EA5E30B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910629.1317302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAr-0006kQ-9l; Wed, 12 Mar 2025 17:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910629.1317302; Wed, 12 Mar 2025 17:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAr-0006gd-4V; Wed, 12 Mar 2025 17:47:21 +0000
Received: by outflank-mailman (input) for mailman id 910629;
 Wed, 12 Mar 2025 17:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAp-0006eC-Nj
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab2f288-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso488235e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:18 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:17 -0700 (PDT)
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
X-Inumbo-ID: 0ab2f288-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801638; x=1742406438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqBQFlJTZsCUlmNgAuNEOWwWaFXwc+Wq2W2eNaP76Wc=;
        b=WUeZe41NoXlxwUsk1Wgbrrrg+Ruf3OflzildEFWS5v1rI1aUHQQFiHR4pDn8COD4c0
         Z0p+wh4gwZAOuRn2whCBdov+TjiY3yxd8C0n10xBQ14hRoh7AcOlNxo7aflc3U5aukeJ
         yDaq8PUi4CyED3VtZp20iM/P/4qk6WoyZBK1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801638; x=1742406438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqBQFlJTZsCUlmNgAuNEOWwWaFXwc+Wq2W2eNaP76Wc=;
        b=DiCC4XUHkeeNYnwLgb18J+TV9VTQYJyJVJVvagwtnNq4/uOk+4Fg7pkf/ABfmYx070
         Rs5Wy2NQR6gsQdW6y4xxT8mIJ/udYi2sCsaAZxJpiqP+vSwTQWeu29fjc0AafKkSxQGA
         2uy75SGLteuSm/vY4OiB7w13Yg3vK1bvyT6DVgUYMpT4SNEAE60OZl6AuZ4nUqu52E5D
         EJPgL3y9WUgHtNGPSm2rFjvuDPdXB0XB6MjTcsD81Z0l4YczM5nU7sxmnwwK8lDUVfOR
         ihiaf/DAy8cT8Yqv8sMgh6LyBwmuS74KLxd3B60GqMtKa7IHUrT3mzrvvWH2pXuAvtnF
         fkgw==
X-Gm-Message-State: AOJu0YxR+V+uBx4YWTfs4StyycrgUCNwKrW4TqVjjyv6gJMzyFfgiwda
	YFSIRw90ADduqR7XFVwGv5wAQqMKJj6n9tMlmASlnzVVq0JCY6MU28HklH6eHUhHeQ7NvLY8NxF
	v
X-Gm-Gg: ASbGncvPbpBcdQsVyNuftjS9qLXyHQ11YO6bYVpWk6+SRiQ7eX66Fy4L727r2EcUWVA
	9IHKW782odx5qHYFZA6YSTLruv+IMTX3cifQssM7/VE1IkOGGLxLFmsDgRWOAgRsBO++NDbm0Ma
	1HlIgwDS51GnM6L0qwE2w7Sc8m4Zc2Uv7IncaioW6LQ3756imiIhAaPcXiyuG6lfENhwPZI7XNa
	ptmhLbvTtygRydxDYfYYGBH+buXUEKyQCRqVSpeMD0TAEHtrAWXdQ3FbjpDt97RPGYSvOZf5hI0
	9WoD+m1cshBWLpYbHEt1Xbajxcg1CupkvRTffLL1X9UEMdP8RQ6iPyj2l1IzajuDR7RZlIxj0ox
	XGMvbfq0qNgoRXfbP8zhR+na2
X-Google-Smtp-Source: AGHT+IG6WIQbLyBVw6c1o93+Ab+dfGr34YtfYi/4+2Ny4ovDDLsD2cCOH/9AIuJzZw2tSsUE5Y9zaw==
X-Received: by 2002:a05:600c:468b:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-43cf00bd768mr120761215e9.29.1741801637594;
        Wed, 12 Mar 2025 10:47:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/8] xen/elfstructs: Include xen/types.h
Date: Wed, 12 Mar 2025 17:45:05 +0000
Message-Id: <20250312174513.4075066-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

elfstructs.h needs the stdint.h types.  Two headers arrange this manually, but
elf.h and livepatch.h do not, which breaks source files whose headers are
properly sorted.

elfstructs.h is used by tools too, so limit this to Xen only.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/include/xen/elfstructs.h    | 7 ++++++-
 xen/include/xen/livepatch_elf.h | 1 -
 xen/include/xen/version.h       | 1 -
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index eb6b87a823a8..f64ecec01990 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -26,6 +26,11 @@
  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+/* Outside of Xen, the includer must provide stdint.h or equivalent. */
+#ifdef __XEN__
+#include <xen/types.h>
+#endif
+
 typedef uint32_t	Elf32_Addr;	/* Unsigned program address */
 typedef uint32_t	Elf32_Off;	/* Unsigned file offset */
 typedef uint16_t	Elf32_Half;	/* Unsigned medium integer */
@@ -45,7 +50,7 @@ typedef uint64_t	Elf64_Xword;
 
 /*
  * e_ident[] identification indexes
- * See http://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html 
+ * See http://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html
  */
 #define EI_MAG0		0		/* file ID */
 #define EI_MAG1		1		/* file ID */
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 842111e14518..a8aafecd34b1 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -5,7 +5,6 @@
 #ifndef __XEN_LIVEPATCH_ELF_H__
 #define __XEN_LIVEPATCH_ELF_H__
 
-#include <xen/types.h>
 #include <xen/elfstructs.h>
 
 /* The following describes an Elf file as consumed by Xen Live Patch. */
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index 4856ad1b446d..bc69ec9fb029 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -1,7 +1,6 @@
 #ifndef __XEN_VERSION_H__
 #define __XEN_VERSION_H__
 
-#include <xen/types.h>
 #include <xen/elfstructs.h>
 
 const char *xen_compile_date(void);

base-commit: 8e60d47cf0112c145b6b0e454d102b04c857db8c
-- 
2.39.5


