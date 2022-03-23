Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5224E547A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 15:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293922.499500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX2E5-00086D-ON; Wed, 23 Mar 2022 14:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293922.499500; Wed, 23 Mar 2022 14:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX2E5-00083c-LL; Wed, 23 Mar 2022 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 293922;
 Wed, 23 Mar 2022 14:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uas=UC=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nX2E4-00083W-P4
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 14:44:40 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45efed4-aab7-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 15:44:39 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id m30so2482732wrb.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 07:44:39 -0700 (PDT)
Received: from dev-dsk-raphning-1b-027ba2d5.eu-west-1.amazon.com
 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b0038ccb22cc9fsm428292wmq.37.2022.03.23.07.44.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:44:38 -0700 (PDT)
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
X-Inumbo-ID: c45efed4-aab7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/vBWQlI8QgaP0LHW33MUjoRn8pJZviwij7lihemgwdw=;
        b=n8Rr2kFr5DOv2Y9jrV9OJ6EKTssOeIT+k9tvoWFtzFwyIXy+csLfMLLAvG9qL51F5K
         7qwcnrie6mTjFvU4iEKvPG6ZcX8vJbcgZ1laEupdnGYpy/i3Jnybvk8lp4eV39jUa144
         /AlfmYd4hPTkH9dgLCjazLLh4kk1t+JrLR2ARaWZWAzWqw7GEhSJ3AZocRpxmswvuOQZ
         r+5OOtRTKH6x7v2uIOBbKQeVlgU3w85A8s+nC8ENB5fP4pHhKfE+CR1znBPmI/T5NOZy
         Q4aHh4Ro6yUK/DLujNq1xYxMllXB7TJ5QowV7NXUWKnNU3KdtAjfxfqMRWRAHOTTfvCx
         kzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/vBWQlI8QgaP0LHW33MUjoRn8pJZviwij7lihemgwdw=;
        b=tklGPwc0mNyIRuaRUnVOpgXNuwxOhMstGB+OYLjJ/j/KYlvgwwjC/0Me/tRkn8tv8P
         Na4MLBQEaH8oRgOFvfDaMOrll9CbIv/Jx3uZ/isPRcIuFxnoAqlFkGa2VLbGGUhGskOO
         xWfkGU6nvaORUk1gE5zp9IQjTfvRlRhUudilLVv5GaVFeofUeXP2SG9k9U4eStI3oZyJ
         Dq2HuDga/SvF8e2T3w9ZxZM+TnCTKiyqCmQ1hMP16PdjsQXWe5fBKN0PMiNbX0CZjQdg
         jE5ZTtT7337AjwiiReI2ONDvoQE13GXRTKuF0yOrEgOkZLj2/gUTSy141Mn1gKI7NsYU
         byxw==
X-Gm-Message-State: AOAM532gev75sA08ppVwYwqRyE2BkNrWKgEuEkdV8F21ma8Zace8f8/k
	zHgHqjh4ixcAPw89JvKU4qk=
X-Google-Smtp-Source: ABdhPJy6MuaX/2bHo246FtcM1iWIfHWP2Wx5AKIuP4sZ/mwQzf9m1qPuPKrxXSKV4eMfO0loaycViA==
X-Received: by 2002:adf:e701:0:b0:203:f4c2:a1c with SMTP id c1-20020adfe701000000b00203f4c20a1cmr132024wrm.628.1648046678906;
        Wed, 23 Mar 2022 07:44:38 -0700 (PDT)
From: Raphael Ning <raphning@gmail.com>
To: Simon Horman <horms@verge.net.au>
Cc: kexec@lists.infradead.org,
	Raphael Ning <raphning@gmail.com>,
	Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org,
	Raphael Ning <raphning@amazon.com>
Subject: [PATCH v2] kexec-xen: Allow xen_kexec_exec() to return in case of Live Update
Date: Wed, 23 Mar 2022 14:44:18 +0000
Message-Id: <20220323144418.1658-1-raphning@gmail.com>
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
Changes in v2:
- Fix --without-xen build.

---
 kexec/kexec-xen.c | 12 ++++++++----
 kexec/kexec.c     | 23 +++++++++++++++++++----
 kexec/kexec.h     |  2 +-
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/kexec/kexec-xen.c b/kexec/kexec-xen.c
index 47da3da466f0..a7c89339c4b7 100644
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
@@ -286,8 +289,9 @@ int xen_kexec_status(uint64_t kexec_flags)
 	return -1;
 }
 
-void xen_kexec_exec(uint64_t kexec_flags)
+int xen_kexec_exec(uint64_t kexec_flags)
 {
+	return -1;
 }
 
 #endif
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


