Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699F1CEB9C
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 05:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYLm2-0003vf-2S; Tue, 12 May 2020 03:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfNj=62=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYLlz-0003bO-S4
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 03:40:03 +0000
X-Inumbo-ID: 43668558-9402-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43668558-9402-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 03:40:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id l1so6456716qtp.6
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 20:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TplU775Hdr/fV2y9OYZMwvrtT2WBw0Ib2Gh0FHeM5+k=;
 b=gckY5BnnwAUYllb5uQrbl+92MqXXVKscqygtsrdF00NV2+Gtb4cRGmo/Rd6rlaX7YT
 0S7MOTrxfbGh2vqvhtKQbKlQJDXSfx/MAokwmOpFmPao7d8NilYNqDZq2zzPiPGrqN6K
 /ycPwnnndTSCr0i2SsoX1oASl5Wr0daazE2WX+UIFoTM2bqVezG24iJpayYnX7zSxao0
 4ycn0jWatpvbwidl7s/Lv5u3KwPdfCwSKILntaz2mOqHS4p/XsqTewQMsULxwEun0Tw/
 Qyl0XWL/SQ0Em34UYswwoWqT2XKw9lIFZVcJxXYTUgJFU7YFO3v8i90CItNBwANPVyNB
 4w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TplU775Hdr/fV2y9OYZMwvrtT2WBw0Ib2Gh0FHeM5+k=;
 b=PUe/Js7Fbq4K0KGF/mF77gId+MGEIA/FkAze4zg4oQBBGrPeAYOQ/I6YdtdIhG2pp5
 XyduBwS3OoroHhsKi6yA2I5Ya59RT/abxnBrcMMdthOAJ7U17n4yRoXCJKRZ7TkxrJuD
 FddgRa2+CjZ+8j1Bk+Y72DudR4Q07yTZ/hrjiYiaIj+cd0bq6C3sqP27vlzRqiXNUPt/
 3swIFT9NNnzrL3lCKYxWytSzB5GDmwEK98U/crdGj2A7K8da7tKNeF7Udh/InEZlQ1yL
 HBlo/BVG2WHOt+wsGJHUceXmPn0pXh+fZjh9nhI9JmL85yCP+ZbbVf9Qq+9i+ZkHR/Wv
 F3VQ==
X-Gm-Message-State: AOAM531y3jOx/quJ5Mt+3vZk/k2QfH+USI92Jz3gVUGPMzf3Feyaf2iS
 pFBmDLTVnxOsMhJ4kWds00S6hjkz
X-Google-Smtp-Source: ABdhPJxksLm506g3irhARDNGuFxiKZEuL2rKK24I53mzUFs+9NDpOEw1QuymX/3Ne+YML3mL95C9FQ==
X-Received: by 2002:ac8:227d:: with SMTP id p58mr574088qtp.180.1589254802410; 
 Mon, 11 May 2020 20:40:02 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:54fc:f6ff:ea10:3d73])
 by smtp.gmail.com with ESMTPSA id w35sm1107092qtk.51.2020.05.11.20.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 20:40:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] xen/x86: Disable fcf-protection when necessary to build
Date: Mon, 11 May 2020 23:39:47 -0400
Message-Id: <20200512033948.3507-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200512033948.3507-1-jandryuk@gmail.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ubuntu gcc-9 enables -fcf-protection by default, which conflicts with
-mindirect-branch=extern and prevents building the hypervisor with
CONFIG_INDIRECT_THUNK:
xmalloc.h:81:1: error: ‘-mindirect-branch’ and ‘-fcf-protection’ are not
compatible

Detect this incompatible combination, and add -fcf-protection=none to
allow the build to succeed.  To actually generated the error, the
compiled program must include a function.

CC: Stefan Bader <stefan.bader@canonical.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/arch.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2a51553edb..3aa6ce521a 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -63,7 +63,16 @@ CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
 # Compile with thunk-extern, indirect-branch-register if avaiable.
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
+# Some versions of gcc error: "‘-mindirect-branch’ and ‘-fcf-protection’ are
+# not compatible".  For those, we need to disable cf-protection with
+# -fcf-protection=none
+cc-mindirect-branch = $(shell if test -n "`echo 'void foo(void) {};' | \
+      LANG=C $(CC) -mindirect-branch=thunk-extern -S -o /dev/null -x c - 2>&1 | \
+      grep -- '-mindirect-branch.*-fcf-protection.*are not compatible' -`"; \
+    then echo "-mindirect-branch=thunk-extern -fcf-protection=none"; \
+    else echo "-mindirect-branch=thunk-extern"; fi ;)
+
+CFLAGS-$(CONFIG_INDIRECT_THUNK) += $(call cc-mindirect-branch)
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
-- 
2.25.1


