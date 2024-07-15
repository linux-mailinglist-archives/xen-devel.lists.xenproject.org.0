Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2975931DC9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 01:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759281.1168931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTVPK-0000DA-CR; Mon, 15 Jul 2024 23:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759281.1168931; Mon, 15 Jul 2024 23:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTVPK-0000Bf-8u; Mon, 15 Jul 2024 23:47:02 +0000
Received: by outflank-mailman (input) for mailman id 759281;
 Mon, 15 Jul 2024 23:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GpAr=OP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1sTVPI-0000BY-OZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 23:47:00 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a6b182-4304-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 01:46:57 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3d92d1a5222so3033621b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 16:46:57 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a160c63d1esm242267585a.93.2024.07.15.16.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 16:46:52 -0700 (PDT)
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
X-Inumbo-ID: 84a6b182-4304-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721087214; x=1721692014; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdLIbrQfyeS6W6iVJL+N3KIZc9bXSXmnQnN4HJvcufI=;
        b=K+zkeNauHn5/6zkcszP/tYb4jgB3qKEU+zSwy+Qqg9wnspbLhV7f8+cm/0BUrtLpWF
         DoOWNUygPp633QicZRufbBvTY8ZlbwMB50Yzj/gWSbblpABXx7kniSGQHI+QlHegyrSf
         /uC4u95GkeHCrxK//71PpwbsSUwT4eCC4I8F7fn+/PlvCXwXdmgkVkGL8yHvqaG5n6Ty
         ddYaJl+o9q4J1T7t7Qj0+zgAU/gGY3e3pHw9BESGgzxFuKDEo80DLJ1TMz63OyU4WfZC
         58eIZS4FKlla2I+DWmzabGfCpj3VjWlgSrL3pITkJu7MqJcCJ2Hg6ml7zWwh3hcryFD/
         AmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721087214; x=1721692014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdLIbrQfyeS6W6iVJL+N3KIZc9bXSXmnQnN4HJvcufI=;
        b=xBxzJKlnRHCDBMqXcR25KjxuCASdVE2k2iJzKHw+hQCZo0CL12cGmmZc2kn7fR21+E
         BdwhiupWO3sn2ia5/hju2DTpKQE/Ot9vnKP4MSWPIlHLZ8AuWt+R6v8k9QlG4S/2Uxi6
         Cz9NuAVPkBJ+CXDFxaIV/YS7a3shMkZxJoo+Yo9kOVw+Y/Cea/4t5vfw2fUmo40lx2wf
         BhhXFZTG6nheVQhSbZB1yh4P5TRu/BIpQGDphsOtqWupAVT0qA0G9LL5XnlIHI4vH274
         02TmPLv7goGC6sIR7sljLeUIdCqZwt7Xr0Pt9/2gNXVJK+SmMbBuk66DHtlEvuKRf2B3
         2MTQ==
X-Gm-Message-State: AOJu0YwGQdKpmu93cjbVQR6OeIcwXymQd2WYF1D3z3DCzHkki0fw2Fik
	TZVztmrOQOAvz2+VXK8CbuZGh5BKdzAybbGdTWOCD9r2WzgJRL/0tIjnZQ==
X-Google-Smtp-Source: AGHT+IF6C8oaDkTjfCBn5HyqW0B/qR8LgbomU+6dBdocydfhgOul4UqInMx5zMnY1I1b5T1OFLj9yw==
X-Received: by 2002:a05:6808:1b0d:b0:3d9:2154:2ffd with SMTP id 5614622812f47-3dac7b5de6emr891750b6e.3.1721087213716;
        Mon, 15 Jul 2024 16:46:53 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility (again)
Date: Mon, 15 Jul 2024 19:46:31 -0400
Message-Id: <20240715234631.4468-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

"$dev" needs to be set correctly for backendtype=phy as well as
backendtype=tap.  Move the setting into the conditional, so it can be
handled properly for each.

(dev could be captured during tap-ctl allocate for blktap module, but it
would not be set properly for the find_device case.  The backendtype=tap
case would need to be handled regardless.)

Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy compatibility")
Fixes: 76a484193d ("hotplug: Update block-tap")

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Tested with backendtype=tap & tapback and backendtype=phy & blktap
module.
---
 tools/hotplug/Linux/block-tap | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
index 5165f459c8..a0b3924370 100755
--- a/tools/hotplug/Linux/block-tap
+++ b/tools/hotplug/Linux/block-tap
@@ -204,13 +204,13 @@ add()
         tap_create
     fi
 
-    # Create nbd unix path.  find_device/tap_create set pid & minor
-    dev=$( printf "/run/blktap-control/nbd%ld.%d" "$pid" "$minor" )
-
     xenstore_write "$XENBUS_PATH/pid" "$pid"
     xenstore_write "$XENBUS_PATH/minor" "$minor"
 
     if [ "$XENBUS_TYPE" = "vbd3" ] ; then
+        # Create nbd unix path.  find_device/tap_create set pid & minor
+        dev=$( printf "/run/blktap-control/nbd%ld.%d" "$pid" "$minor" )
+
         # $dev, as a unix socket, has major:minor 0:0.  If write_dev writes
         # physical-device, tapback would use that incorrect minor 0.  So don't
         # write physical-device.
@@ -218,6 +218,9 @@ add()
 
         success
     else
+        # Construct dev path from minor
+        dev="/dev/xen/blktap-2/tapdev$minor"
+        [ -b "$dev" ] || fatal "blktap \"$dev\" is not a block dev"
         write_dev "$dev"
     fi
 
-- 
2.40.1


