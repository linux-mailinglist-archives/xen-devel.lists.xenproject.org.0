Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70E1F6089
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvB-0007yd-GE; Thu, 11 Jun 2020 03:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDv9-0007xd-RQ
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:27 +0000
X-Inumbo-ID: e335d77a-ab93-11ea-8496-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e335d77a-ab93-11ea-8496-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i16so3600419qtr.7
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xuj1oyeuSUlKPQJS2nl7hDTURFrye9RvexdzOTb7cJ0=;
 b=f1IGQWYC+vrigx8yJ2oxfZQUfd/70HCG0opTR9Qbko8LYtBPE3qe73aJ3ukY3/+3fG
 DYUS2JEoIEQErVe2yUc3Jjj21GRTeOLSB7FIViB46I8bnKGImeSrIJjat9Jpk9N6piue
 1KVClOUQpySylxyMPEMfEfC0fiHRNb6SXhgK17a//Dy96tdgKphWyIkLzrCuV62eD/V6
 Qt3Xqell8qsazRLSJinS29uOw3vHXMvbn59s+BBI/xppkkn6KkjTPuurf6EBTctdPa+n
 bqvX7vmONfTndckCrJV2dhHM2+ppGkZtWVoJJU+VNXSShsHv/ND55G0LLA+OJsOuH49C
 Gmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xuj1oyeuSUlKPQJS2nl7hDTURFrye9RvexdzOTb7cJ0=;
 b=qN3z3vTEiFiTQ394YlKfFc+HRac1/qe/JukOrQmOUQho5fsZtrp/4t+HdPVZfPfaqc
 BAKYdey98UWSO8WByFxZKJFI1fubXVwXPmtHZipSq1txtGPLylTsM/ha3nbdQ51CQYTK
 RqESlDpjBLL78Ix3Nw8MLxMU36DHR+B6E8e4SKMLefJMyYHRskPCezYIdDNce6uv/vYy
 B5cYfsHGiOo/cZSQQ8XJkhsNq37vU7VTbbyCfG4SuqaNoeiSwPfVXjX97BTLhpv5Cdcm
 PEsf7jUI/xexO7pYXTHc3hhH5RF+BIuTTwv2prApL7yWsMEnVeSkn9oiW8CnzBSuKnMb
 D8gg==
X-Gm-Message-State: AOAM530Qeo0P0P/CtdbsVL1+sN5oZmhvmObXUnGNKdKKVB3lFIk59eSb
 S59jWdufPADOhEj7DL6k43nj6elz
X-Google-Smtp-Source: ABdhPJwO3IQ1jhD/t3O/3FRk4P3EWIPbIG10rbuhK9cU3ErZSxtylF1zUqqetUppzSAXRBSUKv+EtA==
X-Received: by 2002:ac8:22e5:: with SMTP id g34mr6742379qta.227.1591846224351; 
 Wed, 10 Jun 2020 20:30:24 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:23 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 02/10] vchan-socket-proxy: Move perror() into listen_socket
Date: Wed, 10 Jun 2020 23:29:28 -0400
Message-Id: <20200611032936.350657-3-jandryuk@gmail.com>
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

The use of perror on the return from listen_socket can produce
misleading results like:
UNIX socket path "/tmp/aa....aa" too long (156 >= 108)
listen socket: Success

errno is reset by subsequent system & library calls, so it may be
inaccurate by the time listen_socket returns.  Call perror immediately
after failing system calls to print the proper message.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 6ae1d84143..4edc3a44f5 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -188,16 +188,20 @@ static int listen_socket(const char *path_or_fd) {
 
     /* if not a number, assume a socket path */
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (fd == -1)
+    if (fd == -1) {
+        perror("socket");
         return -1;
+    }
 
     addr.sun_family = AF_UNIX;
     strcpy(addr.sun_path, path_or_fd);
     if (bind(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
+        perror("bind");
         close(fd);
         return -1;
     }
     if (listen(fd, 5) != 0) {
+        perror("listen");
         close(fd);
         return -1;
     }
@@ -419,7 +423,7 @@ int main(int argc, char **argv)
         } else {
             socket_fd = listen_socket(socket_path);
             if (socket_fd == -1) {
-                perror("listen socket");
+                fprintf(stderr, "listen socket failed\n");
                 return 1;
             }
         }
-- 
2.25.1


