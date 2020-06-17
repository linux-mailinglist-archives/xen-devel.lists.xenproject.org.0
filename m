Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A074A1FC431
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 04:38:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlNwj-0004eZ-Q1; Wed, 17 Jun 2020 02:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxAP=76=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jlNwh-0004eU-VK
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 02:37:00 +0000
X-Inumbo-ID: 6b01640e-b043-11ea-bca7-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b01640e-b043-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 02:36:59 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id cv17so324804qvb.13
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nSKfD5d2+BwYaR4WdN1c/tjc8AtQ3TM9Fxf2YQVCFdE=;
 b=YwITUNCPcpczVoPZlIIzNDSk2OzucWlQYkDu4bVo0ZdTWJC68P2iImasxrLTQtTQ0H
 zfScFHjvyfkFx0+aVu5M8fAcIE0cgIuvfU45LwzydVqr8YhIcy4mSIqGxVm1q+HVPQJx
 DC8FAC+w9nPFAzRhu/f0iZ27wC9iIfBfGqOFQSN2CA4AKQX+j867kHDmZYYCvhKqa+XJ
 ZQKTRwl1Q0qBTPqotGBjknq36prgtXssxwfW6nMMdz+5UGqfRw5T98yWm7J0PXR/yemk
 ozUWs7a216+r7f5PfpBPSlNmXQGrrI0bApYAethYzMHEpi8UvJC07SQTL3l95oKTuanV
 Lb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nSKfD5d2+BwYaR4WdN1c/tjc8AtQ3TM9Fxf2YQVCFdE=;
 b=ZmZ/hXNYHfVJq+MFWEDnIx2xvH12zhLIBkChoFxeHgJhXMMqdTMbsaQa8mcjOT20gl
 eTQgeNtU5YpLAS2BlsKKMqik4VV7uW/dTxrUksZ5EiOgHxkJ6dJIDmRQklTCag0r3h7B
 XDxPFzto3Fo1QPQO/qewG92h7LDx16wG1b0ufV3wk33T9k6Z4R3uZYbu2/OFLlptRxyT
 4UmUE33uvF6efc+3eYqmCzzKtI8kk0Qv9Bo5QTeG+doySFLo0ZwVxUPxDMGDhqQo0qVv
 B88VM7/aSwxo7o8FVvaeE1zcn3POOcOdO+ALt1KjxNNhbiVfG5EuCCpbwEoAZfIKaiuR
 FnLg==
X-Gm-Message-State: AOAM531jweFwg4iDHdpDBs+MMbknPuTc6iUnuNkxaI8G3ZhHv0Hy0ijM
 srYPO6vsGGlECJttkjFSRlbzyuiE
X-Google-Smtp-Source: ABdhPJzJYrzOWey3fg0wjUkfWvus9hkPeIrZyUHTuvBAIs9L/XD59VgDkguPoTukZhZg0su1mzIRUw==
X-Received: by 2002:a05:6214:405:: with SMTP id
 z5mr5294960qvx.112.1592361418533; 
 Tue, 16 Jun 2020 19:36:58 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:c083:40e9:3c38:2bd9])
 by smtp.gmail.com with ESMTPSA id 124sm16308558qkm.115.2020.06.16.19.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 19:36:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xl: Allow shutdown wait for domain death
Date: Tue, 16 Jun 2020 22:36:42 -0400
Message-Id: <20200617023642.80594-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

`xl shutdown -w` waits for the first of either domain shutdown or death.
Shutdown is the halting of the guest operating system, and death is the
freeing of domain resources.

Allow specifying -w multiple times to wait for only domain death.  This
is useful in scripts so that all resources are free before the script
continues.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/man/xl.1.pod.in    |  4 +++-
 tools/xl/xl_vmcontrol.c | 17 +++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 09339282e6..52a47a6fbd 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -743,7 +743,9 @@ of a Xen system.
 
 =item B<-w>, B<--wait>
 
-Wait for the domain to complete shutdown before returning.
+Wait for the domain to complete shutdown before returning.  If given once,
+the wait is for domain shutdown or domain death.  If given multiple times,
+the wait is for domain death only.
 
 =item B<-F>
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 17b4514c94..435155a033 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -162,7 +162,8 @@ static void shutdown_domain(uint32_t domid,
     }
 }
 
-static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
+static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr,
+                                   int wait_for_shutdown_or_death)
 {
     int rc, count = 0;
     LOG("Waiting for %d domains", nr);
@@ -183,8 +184,12 @@ static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
         case LIBXL_EVENT_TYPE_DOMAIN_SHUTDOWN:
             LOG("Domain %d has been shut down, reason code %d",
                 event->domid, event->u.domain_shutdown.shutdown_reason);
-            libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
-            count++;
+            if (wait_for_shutdown_or_death) {
+                libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
+                count++;
+            } else {
+                LOG("Domain %d continue waiting for death", event->domid);
+            }
             break;
         default:
             LOG("Unexpected event type %d", event->type);
@@ -214,7 +219,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
         all = 1;
         break;
     case 'w':
-        wait_for_it = 1;
+        wait_for_it++;
         break;
     case 'F':
         fallback_trigger = 1;
@@ -246,7 +251,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
         }
 
         if (deathws) {
-            wait_for_domain_deaths(deathws, nrdeathws);
+            wait_for_domain_deaths(deathws, nrdeathws, wait_for_it == 1);
             free(deathws);
         }
 
@@ -258,7 +263,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
         fn(domid, wait_for_it ? &deathw : NULL, 0, fallback_trigger);
 
         if (wait_for_it)
-            wait_for_domain_deaths(&deathw, 1);
+            wait_for_domain_deaths(&deathw, 1, wait_for_it == 1);
     }
 
 
-- 
2.25.1


