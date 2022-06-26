Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E555B3A4
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 20:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356115.584149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5XGc-0004Gs-9y; Sun, 26 Jun 2022 18:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356115.584149; Sun, 26 Jun 2022 18:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5XGc-0004F3-6t; Sun, 26 Jun 2022 18:45:54 +0000
Received: by outflank-mailman (input) for mailman id 356115;
 Sun, 26 Jun 2022 18:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5XGa-0003zd-No
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 18:45:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3424f11a-f580-11ec-bd2d-47488cf2e6aa;
 Sun, 26 Jun 2022 20:45:52 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id c13so10178301eds.10
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 11:45:52 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a1709070b0700b00711d8696de9sm4019609ejl.70.2022.06.26.11.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 11:45:51 -0700 (PDT)
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
X-Inumbo-ID: 3424f11a-f580-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R57KbytAbDK41N7wZwRgrJuymEgkyCgxDTH+lUlBCWI=;
        b=jPcgV+UVoAzqOXv43SqwA+/iIPN0cjB17rJUVp7km/ULG6YlIBoSDLpN2AY7fNqpDR
         e6DlAzhSm5KXBoRAo41MwtKbQEmOx44IFROUfU407CRxsh3NyrFgJOrKUa59pBCvib9x
         IhJKsamzUG7xSMnAEFBke3W0TdbH+S6sBz9CyFi3Ifu4T+YQakl3bh3VkCu/5gTh1Hl8
         K9OSBJCio52cIbDlRHPFmYTKP6vdGrwWD1EDvhFIZnQkOV3FYSNeR8xIhhVCQK6QQlvq
         a5VghOg+NVTnpAmgWcL7j9ZTIO/izMpfgNLDhrbdAsPa25SXE5Uy6v4rH26S5zitL/wo
         C5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R57KbytAbDK41N7wZwRgrJuymEgkyCgxDTH+lUlBCWI=;
        b=3rllWAfpiHNOmOfchsJD9BPfVTi85AUvmhFZOKAFMymlfQmtGDcztWNunB3Hs3i35O
         gM+/0yR6ilZ7c1olR9S8FgMy7KzzSo4iKSKn+5H125Q7XMB9n86YABNy9zQDHqp0K5HC
         q8ZnFPMr7j/nHmzu+M3jGGs3PYesfhCy/YLlVd4r/0n9zV+wdFebfAMm4L9P6p8wEEhc
         cMXUBRRjbucaj19YhfEt+seDzq8nUabh/lXTciV9sipQPz5m0ry17PcQi6fHLBgZgqQ0
         M40GirRcK5hpF6R+/2kV9u9ej1MGyZC1sFQLayUvRwKFxDrWgTUeuY7ANAC98FBrCGbY
         hQ3A==
X-Gm-Message-State: AJIora+L+tmw32rCL/ajoTj8BD/u3gukGU+tC4Dr/c6pPjna6m60A0on
	I86bkx1zjdnhqoOmbax8ZDtp2Hhf7vw=
X-Google-Smtp-Source: AGRyM1uSUtpJPuatrGKpEoGzr/vWJiHxcXqwI8D/ypG7JgIb1QTc96drf1DCfiaica4jWXtz3amfzA==
X-Received: by 2002:a05:6402:4386:b0:437:6450:b41f with SMTP id o6-20020a056402438600b004376450b41fmr12295437edc.97.1656269151589;
        Sun, 26 Jun 2022 11:45:51 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	viryaos-discuss@lists.sourceforge.net,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by default
Date: Sun, 26 Jun 2022 21:45:36 +0300
Message-Id: <20220626184536.666647-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626184536.666647-1-burzalodowa@gmail.com>
References: <20220626184536.666647-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be inline with XEN, do not enable direct mapping automatically for all
statically allocated domains.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 README.md                | 4 ++--
 scripts/uboot-script-gen | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/README.md b/README.md
index cb15ca5..03e437b 100644
--- a/README.md
+++ b/README.md
@@ -169,8 +169,8 @@ Where:
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
 
-- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
-  If set to 1, the VM is direct mapped. The default is 1.
+- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
+  By default, direct mapping is disabled.
   This is only applicable when DOMU_STATIC_MEM is specified.
 
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 085e29f..66ce6f7 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -52,7 +52,7 @@ function dt_set()
             echo "fdt set $path $var $array" >> $UBOOT_SOURCE
         elif test $data_type = "bool"
         then
-            if test "$data" -eq 1
+            if test "$data" == "1"
             then
                 echo "fdt set $path $var" >> $UBOOT_SOURCE
             fi
@@ -74,7 +74,7 @@ function dt_set()
             fdtput $FDTEDIT -p -t s $path $var $data
         elif test $data_type = "bool"
         then
-            if test "$data" -eq 1
+            if test "$data" == "1"
             then
                 fdtput $FDTEDIT -p $path $var
             fi
@@ -491,10 +491,6 @@ function xen_config()
         then
             DOMU_CMD[$i]="console=ttyAMA0"
         fi
-        if test -z "${DOMU_DIRECT_MAP[$i]}"
-        then
-             DOMU_DIRECT_MAP[$i]=1
-        fi
         i=$(( $i + 1 ))
     done
 }
-- 
2.34.1


