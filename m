Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF0AB1A86
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980251.1366726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe8-0001uw-BL; Fri, 09 May 2025 16:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980251.1366726; Fri, 09 May 2025 16:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe8-0001jg-5l; Fri, 09 May 2025 16:32:24 +0000
Received: by outflank-mailman (input) for mailman id 980251;
 Fri, 09 May 2025 16:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDQe6-0001fR-7L
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:32:22 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d730218-2cf3-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 18:32:20 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a0b7fbdde7so2047296f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:32:20 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecb46sm3790069f8f.30.2025.05.09.09.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:32:18 -0700 (PDT)
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
X-Inumbo-ID: 2d730218-2cf3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746808339; x=1747413139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj6rfH1i3XcyxsQoQ74OA6E4STBRj/hMndAunES5dfs=;
        b=DnXFDBJ69KKbZ0j21DMhaNt20PrO0WjrB8dwwTjt6WAYckw7I7srlFiSuRDMuFzaek
         g0f6SLMXoHL7foAcKQWrD/ygopxlePssLY7QlrIxWJhIjctpuCNEllwUs/5CQRaBg2oC
         0LbHuO9HVWGPDO+9sQQj1vTql45vo1T/7zIQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808339; x=1747413139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj6rfH1i3XcyxsQoQ74OA6E4STBRj/hMndAunES5dfs=;
        b=K7izd/B83m43vwC9+lhmgH19GTLvcXBaCUqT9Nmqwxa0Rlie2OYvAHVEJb5FszSlmC
         CjLBHFZWQId6JeI2aYk2/BYNKP4umar+wFXUgb2Mk/ch4sZAlHBrl+DX0iBVGM5CGaqu
         vZpC9vCRw6YRz5I915o81ObMoiOOZ7ldcbOTLvZJRuGrLj1lS4Hd8MwdvO3plkqb/LaW
         r54BFHPadDBFH85JdYeO4GXjEPxChqveLqA+apu2YCPP+xovDWuzzl2X94ZB1WbN0Q2K
         BYXVUQ9jfDiMjcoYO2OFD0G+d7bd3kK0EGd8tg4Z9QpbLhyi2KxHp7ef2qkOM00FY3lQ
         euNg==
X-Gm-Message-State: AOJu0Yy7HWWdIBTeoNm5ONksLbmFyyxHcFgfd28DNMhvwliVyyqTty6Z
	QzjOrKvz95iMpz98IXn4haMTlpwT5uS+z+lohcjXZhX6kKBM755510yHKauIvdvhQZC0Wf6nRY0
	B
X-Gm-Gg: ASbGnctpZaLLX2kdk9Md57XOvvFV6VaJpNEqdZCMz+ym5qpHKPzMFjE+Z+cMWFJyaPh
	Hacy9gnwYIGuVj0F9h95fxMruoyMFgm2/32JD3Oon+gScxFa2mEA019PhnU/sOKEx9r7Pmj6j6Z
	6BS0LJsxGNbaX/CN2UDSBWVxY5iVqGr1/8pVE4TI7coS9ZVveZ+sxDaJyx6dGZ7S+LrD+sDqGmL
	3fyIzeTu109ideNqrfIXON+C/DK8LTZdhKOxjBjcRJ5pRU521ZV2ZbSIgBPXLeNwr9EYEilPGl1
	/XP4NID3AurTKRKrVNhaZAiFsk4VqcKNtfz05UVjLP6Sua6Ywi4/kEtyaYGzrn4/+uyX+ZP96KQ
	+qyuRNWuNEC1PYg==
X-Google-Smtp-Source: AGHT+IH3Z38Rocwpp+dGJAJ8JcleA2f+AdZVLNkSuF3mEpA1/A4xYZVt3i6ya5jaCgnAUPzV9Mf9Qw==
X-Received: by 2002:a5d:588b:0:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-3a1f643ba3emr3805411f8f.23.1746808339322;
        Fri, 09 May 2025 09:32:19 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/3] xen/elfstructs: Include xen/types.h
Date: Fri,  9 May 2025 17:32:10 +0100
Message-Id: <20250509163212.2948359-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

elfstructs.h needs the stdint.h types.  Two headers arrange this manually, but
elf.h and livepatch.h do not, which breaks source files whose headers are
properly sorted.

elfstructs.h is used by tools too, so use stdint directly outside of Xen.

Clean up trailing whitespace.

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
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v2:
 * Include stdint outside of Xen.
---
 xen/include/xen/elfstructs.h    | 8 +++++++-
 xen/include/xen/livepatch_elf.h | 1 -
 xen/include/xen/version.h       | 1 -
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index eb6b87a823a8..0ca86cd6ac4d 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -26,6 +26,12 @@
  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#ifdef __XEN__
+#include <xen/stdint.h>
+#else
+#include <stdint.h>
+#endif
+
 typedef uint32_t	Elf32_Addr;	/* Unsigned program address */
 typedef uint32_t	Elf32_Off;	/* Unsigned file offset */
 typedef uint16_t	Elf32_Half;	/* Unsigned medium integer */
@@ -45,7 +51,7 @@ typedef uint64_t	Elf64_Xword;
 
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
-- 
2.39.5


