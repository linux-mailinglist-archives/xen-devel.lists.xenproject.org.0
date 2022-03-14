Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CD4D7E5E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 10:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290069.491933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgtK-0002KI-2y; Mon, 14 Mar 2022 09:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290069.491933; Mon, 14 Mar 2022 09:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgtJ-0002IZ-TK; Mon, 14 Mar 2022 09:21:25 +0000
Received: by outflank-mailman (input) for mailman id 290069;
 Mon, 14 Mar 2022 09:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65Xv=TZ=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nTgtI-0002IT-Fg
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 09:21:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1e1270-a378-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 10:21:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id j17so22874382wrc.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 02:21:22 -0700 (PDT)
Received: from dev-dsk-raphning-1b-027ba2d5.eu-west-1.amazon.com
 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056000022a00b001f017dfb5cdsm18596668wrz.90.2022.03.14.02.21.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 02:21:21 -0700 (PDT)
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
X-Inumbo-ID: 1d1e1270-a378-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lNBQso0zhHWbsx6FmHoKXMM8CPTES/RyOqRD8pydHKg=;
        b=LPnb3glCoavj7nj0vQJRRbcCa1zH37VaG3cp9sN4eizjmzOTJoqa8mBqc/hDHpB7vo
         f/k8oCsxa0oSdqNjowLpY9oasqbMM3ou4hr1H4oXr/ulKGT5h+AJ8VlC+xM+Tn06lqd6
         F1RNw3fGEvQvONvATv3LFIRhWcZga9k7SGzVV1IlxeknrPDddsX57t6jyZyHvwzMBJou
         wGpnnrqUEzxXxrjKnGVFXk1Tp7Q/TLnGwEEp3JUbuCDEsSm8Mn4FCrApAU3Z4tls2kV2
         rX2NJa2tfZQZoJNY0+cMMGMRWjqZxTMS4HBcUP/GabwSRYirFGnGLdS/iFC40CUAGqIf
         VBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lNBQso0zhHWbsx6FmHoKXMM8CPTES/RyOqRD8pydHKg=;
        b=mczRBT3tcb1ChPXT0QD+0t9zjxRfyys9KEjcmpu1laU3cmFNne7a7Fky72nH04T7ko
         jzcGy+j2xZVliYR9odBGpincFnLNLDk9FoxNtidl+rv4vEaOckmIL0qEwWo/j74uQU6K
         gSLSDZK98zA23T+/mKXB0XzV7dJ3dOfVssfdEWjr1Y45xi4Fy9ICcacotuWL3cgC4p6t
         IVwGMj8AbV/CzLhQghAqTZfgo8FYE9H9Ah+2M8yU7yLgZrQ3ahytIAGYP48nbOr7j0TT
         5MXRaMgZd/ukppXhjo3KiAX50Jdx7beJgD4Yjd3UoNF0QrS0HvjF/Q/YunZZ7rg3C6Wh
         pC1Q==
X-Gm-Message-State: AOAM532Uc32dzdixMAFpchiiiVYaBL1dlfv+uUVhlnE1QkBthRhivtxk
	qWMQqbZgLlsxTRC0igD23as=
X-Google-Smtp-Source: ABdhPJysTeuj9cLYwR/EO8Cg7/8pmF0BRM3ZE7pAXsWPH0Nvn3mCL8wB+ycEHtE1pZSqV2SOMa2t1w==
X-Received: by 2002:adf:a198:0:b0:1f0:2477:3b79 with SMTP id u24-20020adfa198000000b001f024773b79mr15423960wru.24.1647249681665;
        Mon, 14 Mar 2022 02:21:21 -0700 (PDT)
From: Raphael Ning <raphning@gmail.com>
To: Simon Horman <horms@verge.net.au>
Cc: kexec@lists.infradead.org,
	Raphael Ning <raphning@gmail.com>,
	Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org,
	Raphael Ning <raphning@amazon.com>
Subject: [PATCH] kexec-xen: Allow xen_kexec_exec() to return in case of Live Update
Date: Mon, 14 Mar 2022 09:21:15 +0000
Message-Id: <20220314092115.48309-1-raphning@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raphael Ning <raphning@amazon.com>

Currently, my_exec() does not expect the Xen KEXEC_CMD_kexec hypercall
to return on success, because it assumes that the hypercall always
triggers an immediate reboot. However, for Live Update, the hypercall
merely schedules the kexec operation and returns; the actual reboot
happens asynchronously. [1]

Therefore, rework the Xen code path of my_exec() such that it does not
treat a successfully processed Live Update request as an error. Also,
rephrase the comment above the function to remove ambiguity.

[1] https://lists.xen.org/archives/html/xen-devel/2021-05/msg00286.html

Signed-off-by: Raphael Ning <raphning@amazon.com>
---
 kexec/kexec-xen.c |  9 ++++++---
 kexec/kexec.c     | 23 +++++++++++++++++++----
 kexec/kexec.h     |  2 +-
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/kexec/kexec-xen.c b/kexec/kexec-xen.c
index 47da3da466f0..44c64d99c566 100644
--- a/kexec/kexec-xen.c
+++ b/kexec/kexec-xen.c
@@ -247,21 +247,24 @@ int xen_kexec_status(uint64_t kexec_flags)
 	return ret;
 }
 
-void xen_kexec_exec(uint64_t kexec_flags)
+int xen_kexec_exec(uint64_t kexec_flags)
 {
 	xc_interface *xch;
 	uint8_t type = KEXEC_TYPE_DEFAULT;
+	int ret;
 
 	xch = xc_interface_open(NULL, NULL, 0);
 	if (!xch)
-		return;
+		return -1;
 
 	if (kexec_flags & KEXEC_LIVE_UPDATE)
 		type = KEXEC_TYPE_LIVE_UPDATE;
 
-	xc_kexec_exec(xch, type);
+	ret = xc_kexec_exec(xch, type);
 
 	xc_interface_close(xch);
+
+	return ret;
 }
 
 #else /* ! HAVE_LIBXENCTRL */
diff --git a/kexec/kexec.c b/kexec/kexec.c
index 7e4787bc8211..e7861049bbea 100644
--- a/kexec/kexec.c
+++ b/kexec/kexec.c
@@ -902,13 +902,28 @@ static int my_shutdown(void)
 }
 
 /*
- *	Exec the new kernel (reboot)
+ *	Exec the new kernel. If successful, this triggers an immediate reboot
+ *	and does not return, but Xen Live Update is an exception (more on this
+ *	below).
  */
 static int my_exec(void)
 {
-	if (xen_present())
-		xen_kexec_exec(kexec_flags);
-	else
+	if (xen_present()) {
+		int ret;
+
+		/*
+		 * There are two cases in which the Xen hypercall may return:
+		 * 1) An error occurred, e.g. the kexec image was not loaded.
+		 *    The exact error is indicated by errno.
+		 * 2) Live Update was successfully scheduled. Note that unlike
+		 *    a normal kexec, Live Update happens asynchronously, i.e.
+		 *    the hypercall merely schedules the kexec operation and
+		 *    returns immediately.
+		 */
+		ret = xen_kexec_exec(kexec_flags);
+		if ((kexec_flags & KEXEC_LIVE_UPDATE) && !ret)
+			return 0;
+	} else
 		reboot(LINUX_REBOOT_CMD_KEXEC);
 	/* I have failed if I make it here */
 	fprintf(stderr, "kexec failed: %s\n", 
diff --git a/kexec/kexec.h b/kexec/kexec.h
index 595dd681db6d..0f97a974cb8a 100644
--- a/kexec/kexec.h
+++ b/kexec/kexec.h
@@ -324,7 +324,7 @@ void cmdline_add_liveupdate(char **base);
 int xen_present(void);
 int xen_kexec_load(struct kexec_info *info);
 int xen_kexec_unload(uint64_t kexec_flags);
-void xen_kexec_exec(uint64_t kexec_flags);
+int xen_kexec_exec(uint64_t kexec_flags);
 int xen_kexec_status(uint64_t kexec_flags);
 
 extern unsigned long long get_kernel_sym(const char *text);
-- 
2.32.0


