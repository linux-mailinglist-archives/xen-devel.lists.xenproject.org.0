Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCF1E04ED
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3D0-0004XS-Ly; Mon, 25 May 2020 02:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Cz-0004Wx-Ds
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:21 +0000
X-Inumbo-ID: 940556bc-9e32-11ea-9887-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940556bc-9e32-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 02:51:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b27so6457948qka.4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3VIo617dxU+JNhTIh5muYXiVHbUoUU/vbppSclO4R4=;
 b=H//Y5QfjKCvFbeIzygw4SVcQFuOlrO12RIEjI8DQTOOE+qbkmX7/0YTKPVn5s1L/v8
 l+w9aN4jdqWihCj9TawrZN28mG674NgdJW1Fg6kClyaezu8wv1hdAiHPb/vbJYu/IUQc
 cTsJjwCJ+rBrNR6tWK/1frwx1HfgPpXr2Cn9WyEB91lPH3nyG30FDMiDLcaZOqUKb3my
 cWrygZpzPAyXmRh/PsSInNZEKQfJcmWpdeWiD1uLHurVmaChHLEbb590JT6ybJbhwL5l
 ZUAGYI0jDTi+AA6RqGsFnPVYUOHtCyDGlpZyqVKFgwrg+3PJImzFiKmnnHA8v3mIfFzA
 UTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3VIo617dxU+JNhTIh5muYXiVHbUoUU/vbppSclO4R4=;
 b=fFERzSq6w5k7aHGPtaiZaQakK2M5TZ5mQIHitoNHNAJuPWYFTFHyeGHKjqpY3i+TcP
 briLO9fCKjEfiUSMVAcgjwysleSO52VS0+aAymgwUoCZSnxd2Gvmh7Sxss0rmZksgWoh
 A1Z4LZGLdhSKdagexUKzqP5hMF5P5nATw5FoWMdUSRf3B1VEmD5xyfQzPA8RnAHQTQD7
 qBjWEKM9HqJ44pbPRVX2K/SkuP2Sh80zp+Fnk6UKIhFFXij+JvsYVwZ7E1A/E+eHYlC5
 DgBauTk0s5Fwlbx2UpiWKrUEJLu53OkgUMazyYgqSCjMpFuE26lWVt2OA0BgxDiUn11i
 o+kQ==
X-Gm-Message-State: AOAM5338D6qXK9ZTgnKhOrE2hI0ik5q6CiCnpslCPUav48lnqIQzRYmu
 mKsVLX8dG+PgMNw4PjI37i3AGLgf
X-Google-Smtp-Source: ABdhPJz87lVhG4951kT7XtwU45jYIGytRok/y5eoofYCmkEqwqVqOBqV4LiWrWTA+t0mWR5DoZGHpg==
X-Received: by 2002:ae9:f214:: with SMTP id m20mr25017275qkg.232.1590375065126; 
 Sun, 24 May 2020 19:51:05 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:51:04 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 7/8] vchan-socket-proxy: Cleanup resources on exit
Date: Sun, 24 May 2020 22:49:54 -0400
Message-Id: <20200525024955.225415-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200525024955.225415-1-jandryuk@gmail.com>
References: <20200525024955.225415-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Close open FDs and close th vchan connection when exiting the program.

This addresses some Coverity findings about leaking file descriptors.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index f3f6e5ec09..a04b46ee04 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -511,5 +511,14 @@ int main(int argc, char **argv)
         }
     }
 
+    if (state.output_fd >= 0)
+        close(state.output_fd);
+    if (state.input_fd >= 0)
+        close(state.input_fd);
+    if (state.ctrl)
+        libxenvchan_close(state.ctrl);
+    if (socket_fd >= 0)
+        close(socket_fd);
+
     return ret;
 }
-- 
2.25.1


