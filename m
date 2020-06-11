Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26E1F608A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvF-000805-Ov; Thu, 11 Jun 2020 03:30:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvE-0007xd-Rk
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:32 +0000
X-Inumbo-ID: e450c340-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e450c340-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:26 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w9so3618204qtv.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1VW2Vbm9sbX6brqSfDiW+eia7lSqgNEJbMvS1O/20A=;
 b=EPUSz/BRdjcU7hP3v7u/F8J+qfjEClfVqyZBfTFDr6ebh4j18yhW1QVN03jn/cdCHS
 rOtnhrFDrDbA7d3NHy4LhhCd3err3yQSKlritxvGKydhtRXXCpqd619CxZsFQS8fv2Rj
 Yil8DnifXsTnpGhbgepEMi4sozVhkbJZTCW/nZiX98SqfR2t5NfaLX+ChMJa/lbPoSs6
 Jp99HPqryyKMKfbGGHG4SRBM1PUiMZWQ34z0SpHoNSn9TO/Oq/9eOHBSuE6OSf6G9pAK
 98XxOJ7noVUvVp9n2ZZAptDkCt+nlRXZg6jH+AF83C7Nch/jae2679cnXj+DTAyhRDoH
 uGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1VW2Vbm9sbX6brqSfDiW+eia7lSqgNEJbMvS1O/20A=;
 b=lsauzh7vzFnmqLzLeOp5ICTpiglMSHhKq3dz33upJoWNOC3kuxXgCwrZQHe0NOQNYr
 O9/9SccQVd0spcPeTrA8HpCptg5b+f5YAP87TBzEpefqgilsd+uQfTGlnDmWE74L9ZKx
 L8JuSUiQGshIaCPbqOvk2XLwxiR+Tp6WomOhAqKo7Cx1mPJAeMfFpeWU9El+uquDoJm2
 +pVG5v2Ncp6Z0K/sIf1mNdRa/mO3zS4jFtgH8b6xaz8Gg6KQfmelbHE49p7dJ4Bd9OV3
 TM3S25UfzSD3ZBZDrlK5bQYgg+Iltes1pSC7nKW5i6T17fnFAR0SC47vA5Oj52fkRZ3s
 n01w==
X-Gm-Message-State: AOAM533w1dyAKNVpzkGoSE76VuUcCq6WiAxhK9o9HrrhKI5sDUPt+POB
 lo4RAJZF/WeRUBtVQrHrINVtD54D
X-Google-Smtp-Source: ABdhPJwThClwsV971Q6HYvvQGLd5cWakFsLrNXUri9Wvl5vA+lhutV/8hPOFwNn7czZX+S7kCd+0VA==
X-Received: by 2002:ac8:6f79:: with SMTP id u25mr6687555qtv.183.1591846226187; 
 Wed, 10 Jun 2020 20:30:26 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:25 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 03/10] vchan-socket-proxy: Move perror() into connect_socket
Date: Wed, 10 Jun 2020 23:29:29 -0400
Message-Id: <20200611032936.350657-4-jandryuk@gmail.com>
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

errno is reset by subsequent system & library calls, so it may be
inaccurate by the time connect_socket returns.  Call perror immediately
after failing system calls to print the proper message.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 4edc3a44f5..c6a83e4712 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -155,12 +155,15 @@ static int connect_socket(const char *path_or_fd) {
     }
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (fd == -1)
+    if (fd == -1) {
+        perror("socket");
         return -1;
+    }
 
     addr.sun_family = AF_UNIX;
     strcpy(addr.sun_path, path_or_fd);
     if (connect(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
+        perror("connect");
         close(fd);
         return -1;
     }
@@ -457,7 +460,7 @@ int main(int argc, char **argv)
                 input_fd = output_fd = connect_socket(socket_path);
             }
             if (input_fd == -1) {
-                perror("connect socket");
+                fprintf(stderr, "connect_socket failed\n");
                 return 1;
             }
             if (data_loop(ctrl, input_fd, output_fd) != 0)
-- 
2.25.1


