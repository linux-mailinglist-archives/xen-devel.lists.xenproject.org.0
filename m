Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527A1B9589
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 05:41:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSudE-0005VU-QS; Mon, 27 Apr 2020 03:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UCaW=6L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jSudD-0005VP-3A
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 03:40:31 +0000
X-Inumbo-ID: d76de5aa-8838-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d76de5aa-8838-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 03:40:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x12so12688149qts.9;
 Sun, 26 Apr 2020 20:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=971x6VUzt76Bct6RLVEpnOoU0De5EYNxXyo8sYPzQmE=;
 b=fJZ7kZcKJtbBfe+iCziz8YSJaX/kV2w5DHb9qqvwqgk1Jn720L80bLQjqwGd/vN8jP
 cj9n/WXlDZwl2w3dztFuFEFrZ8nmSHWSWJSGAweaFJGsFFj1rcQ6d3iUFuEzJ8hz6TD5
 bGGlB+vwZxJvo+nAq6zyIwveQ6mCBZ287E3f2o/Pvb+J2Ql0Tn2xa9FfvvT5QeDXO2mN
 GfL3YTSvLpq3CQuhNlQPxFq9W54E6FzvncFhUF5newECjprdK4lRbz9ybMsizFcek3ZP
 2jwlDIKkmK+NTwYI2L645CsCCJVFC3MerFLnmRLrV9idFrX3ao6OcOo2wdI73VDK3FHr
 2aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=971x6VUzt76Bct6RLVEpnOoU0De5EYNxXyo8sYPzQmE=;
 b=C2ZI4/+EhTLuMrS8IT880oPir38geKdVTZdv4OaNjWSgfndereRBldrbE0LJ5eS/pm
 2Ew8xkOnTeenwMqgPk9bfIcbWkoVqqf13PQ6WPjq36D4L6A8KwtfyWThTI5wIWYhwd8J
 t6pNszIiFm/CfouAyj+WK4eQmAR8/qh2q3BL6WuTUptJp9dIVm+OKO0p50K79x+4wtGK
 6zz12Y1fXh5Bv4hv4NxsotiNaofU5qlqeGNbcVrrBsAji0mWyEcjAugPfduJaBXGB2US
 MS/PtDtsxsLOA1g19VK9CZ6qbvd4LxEKvrt6+0NbMNk4NbVb4Wu/kbVWRBAC8lPx+Hmc
 IHrg==
X-Gm-Message-State: AGi0PubXH2R+h+qa4tTH4PaVQ3cGps22p6NuesaMt1vHNq081uUe08mz
 SBIlH2T+5sf2q7c0Tn+zEv7CeOl7
X-Google-Smtp-Source: APiQypJt0895FDL4vWX46DmjCi786MaTYClG+nR3fpMeXWIF2T9Ni/vZsZAjRQ6qkVOyoPVXvl1A1g==
X-Received: by 2002:ac8:108b:: with SMTP id a11mr21431996qtj.173.1587958829051; 
 Sun, 26 Apr 2020 20:40:29 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:d026:4ef9:a4d0:cab2])
 by smtp.gmail.com with ESMTPSA id d4sm9421866qtc.48.2020.04.26.20.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 20:40:28 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
Date: Sun, 26 Apr 2020 23:40:19 -0400
Message-Id: <20200427034019.6251-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: samuel.thibault@ens-lyon.org, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit c96c22f1d94 "mini-os: minimal implementations of some termios
functions" introduced implementations of tcgetattr and tcsetattr.
However, they do not check if files[fildes].cons.dev is non-NULL before
dereferencing.  This is not a problem for FDs allocated through
alloc_fd, but the files array pre-allocates FDs 0-2 for stdio.  Those
entries have a NULL .dev, so tc{g,s}etattr on them segfault.

ioemu-stubdom segfaults when term_init() calls tcgetattr on FD 0.

Restore tcgetattr and tcsetattr behavior when .dev is NULL equivalent to
unsupported_function as it was before c96c22f1d94.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I can't get ioemu-stubdom to start without this.  With this, the guest
just reboots immediately, but it does that with a non-stubdom
device_model_version="qemu-xen-traditional" .  The same guest disk image
(cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
qemu-system-x86_64.

 lib/sys.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/sys.c b/lib/sys.c
index da434fc..c6a7b9f 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -1472,6 +1472,11 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
             return -1;
     }
 
+    if (files[fildes].cons.dev == NULL) {
+        errno = ENOSYS;
+        return -1;
+    }
+
     if (tios->c_oflag & OPOST)
         files[fildes].cons.dev->is_raw = false;
     else
@@ -1492,6 +1497,11 @@ int tcgetattr(int fildes, struct termios *tios)
         return -1;
     }
 
+    if (files[fildes].cons.dev == NULL) {
+        errno = ENOSYS;
+        return 0;
+    }
+
     if (tios == NULL) {
         errno = EINVAL;
         return -1;
-- 
2.20.1


