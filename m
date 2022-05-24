Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6F532F09
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 18:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336672.561046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXS6-0002U9-UZ; Tue, 24 May 2022 16:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336672.561046; Tue, 24 May 2022 16:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXS6-0002S5-R3; Tue, 24 May 2022 16:32:10 +0000
Received: by outflank-mailman (input) for mailman id 336672;
 Tue, 24 May 2022 16:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4sq=WA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ntXS5-0002Rz-JS
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 16:32:09 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0db5171a-db7f-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 18:32:08 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id m13so9118911qtx.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 09:32:08 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:232b:a469:f1f6:e2d7])
 by smtp.gmail.com with ESMTPSA id
 g15-20020ae9e10f000000b0069fc13ce1e9sm6033213qkm.26.2022.05.24.09.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 09:32:06 -0700 (PDT)
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
X-Inumbo-ID: 0db5171a-db7f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IiIg1GUmt3YDROQNKNSyomdlx2ySFqe/mHdIetvhtE=;
        b=oC0VFc9uHh9mymKMaP5faNbOHnwnLvvX832lHHpiJwSHb+eCZio1WCdkEi7oCQG/xV
         ZQxKbqSq4QPagfc4ex8FPi7Hs2mw2t3G9R4BUl2tBLXvlmCoV5AWdoVlSrgzm/ee5QBc
         +l3bGbBIXlc1mI6Q+ARr4jrANUy1SqoaZvA6zWRENK4DLzedP2o0u8kCXSviuWI3EusT
         rmlkqPjlWD1sg1adWoiltVdksRvYGuKuTd1q7OyCrNrSg4oIBZnaeEgXkhqD0uUApFd+
         wXzZNWpETvNAM4w/biWqO9PegwOPXIuOEcT1HOTqc4xxk9n1oM/EHSJuOJLhxat7PjU8
         Q5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IiIg1GUmt3YDROQNKNSyomdlx2ySFqe/mHdIetvhtE=;
        b=wqXG+1cCUwtVS3eqQG00LglsmaHzKQSiRwAxecDqwPkXAcM5Rd5HzvGVP5bIkNH+UG
         bFQT7woaAHqzgWELe8esXCrq4OZmvq8GIGHU9S5qb/gHKEimbtlZuD1f5Qoj5baXuqV4
         8qL2k+K9aEoXrXF9gMgTgUHERNepkRaHBt2wlPH4BW/aOxEA+pmTvJMBhep8oLbfIFjo
         d8bx002oFEfJk9VKjeIpLpJ3oDnJowLVvF0GwWJhe0/+WYnM9j3+OsaYSEDpCHwZL2nx
         SnK02EKTxZ33e9YmLRCw+Vc5C94DmMqJCHz3IwHJ6XwULoCK789SkcZ9yBssF/kt+Twu
         mgcQ==
X-Gm-Message-State: AOAM533+NXr75tFb1udakWb7h2XvGe1HaSobxobBVVgZ8IzYrMPwyFcK
	/Te8VtSqYXfercVTHbjFapJm9I+n6oo=
X-Google-Smtp-Source: ABdhPJzKVoEJP7TcrJvimtfz434njRxStBzaFIY4PU9EcyzGjESpIOvVo0EiDu+yvcvwKKx+1CvtHQ==
X-Received: by 2002:a05:622a:650:b0:2f3:facf:d11a with SMTP id a16-20020a05622a065000b002f3facfd11amr21034914qtb.109.1653409927034;
        Tue, 24 May 2022 09:32:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Don't leak self pipes
Date: Tue, 24 May 2022 12:31:52 -0400
Message-Id: <20220524163152.19948-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl is leaking self pipes to child processes.  These can be seen when
running with env var _LIBXL_DEBUG_EXEC_FDS=1:

libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge online
[Detaching after fork from child process 5099]
libxl: execing /etc/xen/scripts/vif-bridge: fd 4 is open to pipe:[46805] with flags 0
libxl: execing /etc/xen/scripts/vif-bridge: fd 13 is open to pipe:[46807] with flags 0
libxl: execing /etc/xen/scripts/vif-bridge: fd 14 is open to pipe:[46807] with flags 0
libxl: execing /etc/xen/scripts/vif-bridge: fd 19 is open to pipe:[48570] with flags 0
libxl: execing /etc/xen/scripts/vif-bridge: fd 20 is open to pipe:[48570] with flags 0

(fd 3 is also open, but the check only starts at 4 for some reason.)

For xl, this is the poller created by libxl_ctx_alloc, the poller
created by do_domain_create -> libxl__ao_create, and the self pipe for
libxl__sigchld_needed.  Set CLOEXEC on the FDs so they are not leaked
into children.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Maybe the setting wants to move into libxl__pipe_nonblock()?  Poller &
sigchld are the only callers of that function.
---
 tools/libs/light/libxl_event.c | 3 +++
 tools/libs/light/libxl_fork.c  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tools/libs/light/libxl_event.c b/tools/libs/light/libxl_event.c
index c8bcd13960..8d24613921 100644
--- a/tools/libs/light/libxl_event.c
+++ b/tools/libs/light/libxl_event.c
@@ -1800,6 +1800,9 @@ int libxl__poller_init(libxl__gc *gc, libxl__poller *p)
     rc = libxl__pipe_nonblock(CTX, p->wakeup_pipe);
     if (rc) goto out;
 
+    libxl_fd_set_cloexec(CTX, p->wakeup_pipe[0], 1);
+    libxl_fd_set_cloexec(CTX, p->wakeup_pipe[1], 1);
+
     return 0;
 
  out:
diff --git a/tools/libs/light/libxl_fork.c b/tools/libs/light/libxl_fork.c
index 676a14bb28..b13659d231 100644
--- a/tools/libs/light/libxl_fork.c
+++ b/tools/libs/light/libxl_fork.c
@@ -387,6 +387,8 @@ int libxl__sigchld_needed(libxl__gc *gc) /* non-reentrant, idempotent */
     if (CTX->sigchld_selfpipe[0] < 0) {
         rc = libxl__pipe_nonblock(CTX, CTX->sigchld_selfpipe);
         if (rc) goto out;
+        libxl_fd_set_cloexec(CTX, CTX->sigchld_selfpipe[0], 1);
+        libxl_fd_set_cloexec(CTX, CTX->sigchld_selfpipe[1], 1);
     }
     if (!libxl__ev_fd_isregistered(&CTX->sigchld_selfpipe_efd)) {
         rc = libxl__ev_fd_register(gc, &CTX->sigchld_selfpipe_efd,
-- 
2.35.1


