Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB68C7043
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 04:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722779.1127095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7QlB-0000xq-LU; Thu, 16 May 2024 02:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722779.1127095; Thu, 16 May 2024 02:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7QlB-0000vK-Hk; Thu, 16 May 2024 02:22:21 +0000
Received: by outflank-mailman (input) for mailman id 722779;
 Thu, 16 May 2024 02:22:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9d+=MT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s7QlA-0000Zq-Fb
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 02:22:20 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eac1423-132b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 04:22:19 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-61d35d266e7so89796137b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 19:22:19 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e17a8315csm49857151cf.32.2024.05.15.19.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 19:22:17 -0700 (PDT)
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
X-Inumbo-ID: 1eac1423-132b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715826138; x=1716430938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H15xTstOQCjjtsIpAdxJAvKFKY+gIA01CkEDZA9sFY0=;
        b=WRopWRggIKQqOibs18+UAbixrLfHwQ0ViQWLNBB5EBN+LoPFXBKmGzEhJH/qLXLHHE
         0DwPjtnbhN+QK6QD/WHDusolF3X6hsFVpt53Xl5sKjb0RnR4BEOhlIZj1XxVXc0dm2/J
         b0kQ6EQS5bvtrIhWKtldvnpySyibh4dUARCY9we6f8vm3JI/3gXkWqW+2aJ1/uE1cKdW
         7Qk9Z0DcNyXT5+CSto7yHJTCgbPevq0NO2W0Z+SJLApFVrEFq/4hJcA7ofmCPnZ2b20S
         Jvkri87YqkOcLoCwFfky5Y/6p2lqtngltzXdiJJ5E3LoPJVcqhZkW3r6gS0Kg4kpz0Yh
         E37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715826138; x=1716430938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H15xTstOQCjjtsIpAdxJAvKFKY+gIA01CkEDZA9sFY0=;
        b=G+w4N6nEnbM/mt/a2EFeFCWimdkNDEvANl/U7c+c4OP6kNp2cXVO0w8idBY1l+hbKJ
         PKMmZDzJ6qaxDC+p3Xu1eRFf4UXZCu/pGFtiU7pqKU/UVsftXKcoZRcSnTiIqaOa76IC
         u0DRelFA2MN3XEfEs6NHRA24bpfrvoqh2CpXnPVWSXpTytDsAyQBGpWw6VRp8DwnlVoq
         N3bEJd6+mNoZn2oFyAgZdRJCgNw1cY+dmffuznB7dWHnoQ0Ry48sD0zx9RJjePAzN5Ez
         FLnd2+5ru8mWmADnRmX2mkvi7Z/ZCwlwShRd9Re8m6FFpChs0fk/Xxo1BjzYRZqE5SM1
         iKPA==
X-Gm-Message-State: AOJu0YxF95ApNXbya4xR501w3mLQA+VTPFwE4/LpkKp2nGWw03Gi3fj6
	f8UhL2Egt0WfPEio975z7afq3UiMVmLjPH8o+68U9LjfZ7lIw547fjBJXA==
X-Google-Smtp-Source: AGHT+IHP9HhJ4g0luGl1dh4SVQ+af924DTrAwhF+FQCGPUOUjaM05KMvs+4f5/2vTAIbEZQGhv/PIw==
X-Received: by 2002:a05:690c:6c87:b0:61b:33c8:7bce with SMTP id 00721157ae682-622afff705emr179976697b3.31.1715826137844;
        Wed, 15 May 2024 19:22:17 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH] hotplug: Restore block-tap phy compatibility
Date: Wed, 15 May 2024 22:22:12 -0400
Message-Id: <20240516022212.5034-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

From: Jason Andryuk <jason.andryuk@amd.com>

backendtype=phy using the blktap kernel module needs to use write_dev,
but tapback can't support that.  tapback should perform better, but make
the script compatible with the old kernel module again.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is tested with tapback, but untested with phy/blkback since I don't
have the kernel module setup.

 tools/hotplug/Linux/block-tap | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
index 126e472786..8661ce77e3 100755
--- a/tools/hotplug/Linux/block-tap
+++ b/tools/hotplug/Linux/block-tap
@@ -20,9 +20,13 @@
 #
 # Disks should be specified using the following syntax:
 #
+# For use with tapback (vbd3) (preferred):
 # vdev=xvda,backendtype=tap,format=vhd,target=/srv/target.vhd
 #
-# format is either "aio" (for raw files), or "vhd"
+# For use with blkback and the blktap2 kernel module:
+# script=block-tap,vdev=xvda,target=<type>:<file>
+#
+# format/<type> is either "aio" (for raw files), or "vhd"
 
 dir=$(dirname "$0")
 . "$dir/block-common.sh"
@@ -205,12 +209,17 @@ add()
 
     xenstore_write "$XENBUS_PATH/pid" "$pid"
     xenstore_write "$XENBUS_PATH/minor" "$minor"
-    # dev, as a unix socket, would end up with major:minor 0:0 in
-    # physical-device if write_dev were used.  tapback would be thrown off by
-    # that incorrect minor, so just skip writing physical-device.
-    xenstore_write "$XENBUS_PATH/physical-device-path" "$dev"
 
-    success
+    if [ "$XENBUS_TYPE" = "vbd3" ] ; then
+        # $dev, as a unix socket, has major:minor 0:0.  If write_dev writes
+        # physical-device, tapback would use that incorrect minor 0.  So don't
+        # write physical-device.
+        xenstore_write "$XENBUS_PATH/physical-device-path" "$dev"
+
+        success
+    else
+        write_dev "$dev"
+    fi
 
     release_lock "block"
 }
-- 
2.40.1


