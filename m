Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98355B3A3
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 20:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356114.584138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5XGb-00043F-20; Sun, 26 Jun 2022 18:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356114.584138; Sun, 26 Jun 2022 18:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5XGa-0003zj-V7; Sun, 26 Jun 2022 18:45:52 +0000
Received: by outflank-mailman (input) for mailman id 356114;
 Sun, 26 Jun 2022 18:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5XGZ-0003zd-96
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 18:45:51 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32730784-f580-11ec-bd2d-47488cf2e6aa;
 Sun, 26 Jun 2022 20:45:49 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id c13so10178301eds.10
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 11:45:49 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a1709070b0700b00711d8696de9sm4019609ejl.70.2022.06.26.11.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 11:45:48 -0700 (PDT)
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
X-Inumbo-ID: 32730784-f580-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+muHyAkkc+movO68H9ldsLy8902fAEHYYZE1ioXjz5o=;
        b=mlx54YBcrvyEZoxkBVo63xB5IybpvxQ3mTf+IrL3kLWN6fo2fPEXHMhlAoCEzB/lh4
         K0KL4eoLCWvPXVsN97JELNmx3w5zXTvc0exAeBD/i5HOXEiLyZ34nlnoyQ5VKEx7GNl+
         nhjigY6vsH547RfTFRGdv2U37On+tNCp96HvmaUJD6AI/kE8Em9p/KGEJz/m+B0AShlh
         HrRBkVsr2B64omq/1VKogZ5uAV/5S7OZpPZcl1NKyRy5R1KW0UHPxMTEwbY16hPUT7tP
         wkFHtPdCx/r49ynjxMZ9Dx/2AgBmzKlChXwJGBt62J6qjaEqRhiTtdfG7Jg317lvHENb
         Ma7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+muHyAkkc+movO68H9ldsLy8902fAEHYYZE1ioXjz5o=;
        b=V3aoyZfKNycyy4dCXiJOgJ+gaoSi4rj5Bo0LcrZFtcXbgM9gcWzRTmExXSxVcNQBS7
         7Zlom4RLDLZpTUrJUXdqyRi38wYS5H9nn8UvlBGkRN0By1timiM0MOjit8dDC4dlwXRr
         hr9rQZVSQ+V2p9K7fO/3YPp68K0JCR8NcAEUH9SvfnCIWeOXB+uzTr9YtjMITtSboRSl
         RDI0FzeB2zxCAMgoQvzefDiVnoFYsmwROPi8kfZek/z/+mmpzbubItJFPTWdHBjHWQ4V
         GtRJ28ooPzyIWppbFZfTsp2eRbmfq7q9AM3AJc9mNiR39MoAA1EVHcUXbBjWChYgqCsU
         658Q==
X-Gm-Message-State: AJIora8C0vIuKoEETJazthLAzc3uS86EjppaMdr5GnHP5GqqAuM3iQ4n
	KkQ/TSw4bPZ20bEN1GOvzTR89J09xKk=
X-Google-Smtp-Source: AGRyM1vEyKV05yR6TIXWbiTaZ5SJn0lMZXPCIIDrEPa8bMpbqDn6WxibH6bnE5jxv2+d3uGJlT347Q==
X-Received: by 2002:a05:6402:2987:b0:434:ef34:6617 with SMTP id eq7-20020a056402298700b00434ef346617mr12486710edb.176.1656269148758;
        Sun, 26 Jun 2022 11:45:48 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH 1/2] uboot-script-gen: prevent user mistakes due to DOM0_KERNEL becoming optional
Date: Sun, 26 Jun 2022 21:45:35 +0300
Message-Id: <20220626184536.666647-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before enabling true dom0less configuration, the script was failing instantly
if DOM0_KERNEL parameter was not specified. This behaviour has changed and
this needs to be communicated to the user.

Mention in README.md that for dom0less configurations, the parameter
DOM0_KERNEL is optional.

If DOM0_KERNEL is not set, check that no other dom0 specific parameters are
specified by the user. Fail the script early with an appropriate error
message, if it was invoked with erroneous configuration settings.

Change message "Dom0 kernel is not specified, continue with dom0less setup."
to "Dom0 kernel is not specified, continue with true dom0less setup."
to refer more accurately to a dom0less setup without dom0.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 README.md                |  1 +
 scripts/uboot-script-gen | 21 ++++++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index 17ff206..cb15ca5 100644
--- a/README.md
+++ b/README.md
@@ -100,6 +100,7 @@ Where:
   been specified in XEN_PASSTHROUGH_PATHS.
 
 - DOM0_KERNEL specifies the Dom0 kernel file to load.
+  For dom0less configurations, the parameter is optional.
 
 - DOM0_MEM specifies the amount of memory for Dom0 VM in MB. The default
   is 1024. This is only applicable when XEN_CMD is not specified.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index e85c6ec..085e29f 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -410,6 +410,20 @@ function find_root_dev()
 
 function xen_config()
 {
+    if test -z "$DOM0_KERNEL"
+    then
+        if test "$NUM_DOMUS" -eq "0"
+        then
+            echo "Neither dom0 or domUs are specified, exiting."
+            exit 1
+        elif test "$DOM0_MEM" || test "$DOM0_VCPUS" || test "$DOM0_COLORS" || test "$DOM0_CMD" || test "$DOM0_RAMDISK" || test "$DOM0_ROOTFS"
+        then
+            echo "For dom0less configuration without dom0, no dom0 specific parameters should be specified, exiting."
+            exit 1
+        fi
+        echo "Dom0 kernel is not specified, continue with true dom0less setup."
+    fi
+
     if [ -z "$XEN_CMD" ]
     then
         if [ -z "$DOM0_MEM" ]
@@ -457,13 +471,6 @@ function xen_config()
     fi
     if test -z "$DOM0_KERNEL"
     then
-        if test "$NUM_DOMUS" -eq "0"
-        then
-            echo "Neither dom0 or domUs are specified, exiting."
-            exit 1
-        fi
-        echo "Dom0 kernel is not specified, continue with dom0less setup."
-        unset DOM0_RAMDISK
         # Remove dom0 specific parameters from the XEN command line.
         local params=($XEN_CMD)
         XEN_CMD="${params[@]/dom0*/}"
-- 
2.34.1


