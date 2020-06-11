Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D951F608C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvP-00083s-C6; Thu, 11 Jun 2020 03:30:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvO-0007xd-Rq
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:42 +0000
X-Inumbo-ID: e641f156-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e641f156-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:30 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id e16so3632185qtg.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OV7hLic7QdG3BUdt8KJifuAGbNbuFpzMSDCmTGtRTHI=;
 b=FBXUPHhodN+sKzb9ZEnacuQ+nWFTGfIuss7ws1Hoiz8fCT9W223Py3wYhhm218fYrs
 hmWfdw5lEdK11CiWNA0E2QeTsoGzq99SC3OeQpUUerJqzzrxsd0DPuBE3WV0C0qPDQY8
 D/iZCSEtyU1Oa7XaCRgPPNUTiWghAWVqys8WiIMhH9lpKLuAkf0s1uCiy1wrDu2jye31
 xiGN2whoMy5wVaGjXCRF++zxJ0FLMHBLB1tMF+oLG8b52zxmRJ+14lJEeFqc+m8Fl+3e
 1u2gS3w0rgaOsVNe6YKfb0VIYqdl88YFZRS5cuaniyNg6mU5DBR+5tuN2SVUW5s2bKMY
 eI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OV7hLic7QdG3BUdt8KJifuAGbNbuFpzMSDCmTGtRTHI=;
 b=FYtcPugEgKPlofIRWvgzRzd94CkpdFegkOuwNiqGHhj0oySQoyaTYvaZwBqEHHqC0c
 xtMsfuFlb6Qz25Mf5VOk9WUolxgnN6jTPwwbWSKOI7C12N2vT+oYbCiBwlcBBgngHg/u
 fFEzISx6ABDTbFVMZbSHySTPyZ0MC4kYOfff+Zi45zDeRUkirDC37DSSQ5akGYzOIYhT
 LB047+lKNTxfeDjnE7TYpujAJh0HZkwj4orDYF8gDqyyXLWsXOz26SYY3DXQtrKL9uW2
 sDfEVc9y9dwQTIJBm0t95tf/oyly9UqunDwG9+Xxx4tAsVi2RzyIVIO+J9vMtPg/sFt7
 6tUw==
X-Gm-Message-State: AOAM532M2mQijyRdgj3okx4APx52kB8w4t2OFWStVRs+/I9YxIoHkMYl
 CppkBk6SLCB2Kzj025oHocPX6cdC
X-Google-Smtp-Source: ABdhPJwJQtwUYbCgitLnSAMDSRlFD+GH7f+0kPhX2hfvFDCiPwSn2oJd1pKiZ9lOLpYWgP6NCVYZrA==
X-Received: by 2002:ac8:341a:: with SMTP id u26mr6550830qtb.36.1591846229462; 
 Wed, 10 Jun 2020 20:30:29 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:28 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 05/10] vchan-socket-proxy: Unify main return value
Date: Wed, 10 Jun 2020 23:29:31 -0400
Message-Id: <20200611032936.350657-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce 'ret' for main's return value and remove direct returns.  This
is in preparation for a unified exit path with resource cleanup.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 196f6016b9..36a2fe2cb8 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -388,6 +388,7 @@ int main(int argc, char **argv)
     const char *vchan_path;
     const char *state_path = NULL;
     int opt;
+    int ret;
 
     while ((opt = getopt_long(argc, argv, "m:vs:", options, NULL)) != -1) {
         switch (opt) {
@@ -454,6 +455,8 @@ int main(int argc, char **argv)
         xs_close(xs);
     }
 
+    ret = 0;
+
     for (;;) {
         if (is_server) {
             /* wait for vchan connection */
@@ -468,7 +471,8 @@ int main(int argc, char **argv)
             }
             if (input_fd == -1) {
                 fprintf(stderr, "connect_socket failed\n");
-                return 1;
+                ret = 1;
+                break;
             }
             if (data_loop(ctrl, input_fd, output_fd) != 0)
                 break;
@@ -481,14 +485,16 @@ int main(int argc, char **argv)
                 input_fd = output_fd = accept(socket_fd, NULL, NULL);
             if (input_fd == -1) {
                 perror("accept");
-                return 1;
+                ret = 1;
+                break;
             }
             set_nonblocking(input_fd, 1);
             set_nonblocking(output_fd, 1);
             ctrl = connect_vchan(domid, vchan_path);
             if (!ctrl) {
                 perror("vchan client init");
-                return 1;
+                ret = 1;
+                break;
             }
             if (data_loop(ctrl, input_fd, output_fd) != 0)
                 break;
@@ -500,5 +506,6 @@ int main(int argc, char **argv)
             ctrl = NULL;
         }
     }
-    return 0;
+
+    return ret;
 }
-- 
2.25.1


