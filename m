Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5C292F0D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 22:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8825.23722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbLF-0008UD-PU; Mon, 19 Oct 2020 20:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8825.23722; Mon, 19 Oct 2020 20:01:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbLF-0008To-MW; Mon, 19 Oct 2020 20:01:13 +0000
Received: by outflank-mailman (input) for mailman id 8825;
 Mon, 19 Oct 2020 20:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kUbLE-0008Tj-Nl
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 20:01:12 +0000
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e333733-8481-45e8-b598-2c21f80f53db;
 Mon, 19 Oct 2020 20:01:06 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k6so1300374ior.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 13:01:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 r12sm748051ilm.28.2020.10.19.13.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:01:05 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kUbLE-0008Tj-Nl
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 20:01:12 +0000
X-Inumbo-ID: 1e333733-8481-45e8-b598-2c21f80f53db
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1e333733-8481-45e8-b598-2c21f80f53db;
	Mon, 19 Oct 2020 20:01:06 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k6so1300374ior.2
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eQKL04xasUcDd+ftioh0iFMePD/ue+0Y1d/ZN01kBg=;
        b=XCEbA9S54338AP5dTI8F9hUleHSbLlg34igGxVjXXq/rnVp5Yuymde3Slc91gNLSqW
         7zG7zYxDigc6rWP1HgoqbvZQKysbKtv+CPOgh6CigBHdXZD61lAsG597Zj3Cgb/xYOmu
         bVOBVpHOgSTFNBCvgEeSv5e09oixObUy0onRC9tWLt6j5o8WJ1g4LzP+O+SA/3F+VhnT
         ONEs89tl+/fqI3AywtYxKe4oNWZtjXIisalBHbwEM9NLNwH7/2Md8v5sEM7/XyaF2N6e
         dikejV/M0/v+fQ6GIeTw3ChSn9cq48Opc0AVce6/RlhkmK722QOWmu4lNXGZv2MwUhg6
         yhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eQKL04xasUcDd+ftioh0iFMePD/ue+0Y1d/ZN01kBg=;
        b=oWH8MFbXK7WcxK4mHB65egBT9UH8/gC71tgxUqC4DrrQgZ43ucm/y5Z5Hu6nGu+Pz8
         5ipg6TC8yREC7IYE6sz3SFH4B6PavVRUEoUdTM1scGOE/aV346sPHK91Y0jbZzlcIhjY
         R2XejfmOy15WyhTPeflSqYt96t6EmN+ROFq6UZ3kxtk0P7VJXokXybWlQ91gB4UVso7P
         cyL+7SrRPuOS5hmNIkOWSl48Xh7aN397FmJ/DpuIfFD+bMHamB5FM/pchsNNXOQsfsc3
         PeMi3n1wd09grA/E/yMy1QOmaYbUEYQ1rfNVU9bJ87SrwhKjPUL3Y+OrmCzbxh4Wa1TK
         Fmtg==
X-Gm-Message-State: AOAM533v//4/FJPD8BZz5QLeEcn1GVG27rWwUvDOyySO5bTHI7sxD7lS
	CC58QcalVe8hRxDM+2KU73w=
X-Google-Smtp-Source: ABdhPJyNHzUu4H6hURcTDLEKIci573YL5yT9qlQBpApJVZ8Ka0Qz6NplrJDui0k+P45kWTlLlZZY2Q==
X-Received: by 2002:a02:cd2c:: with SMTP id h12mr1404514jaq.138.1603137665874;
        Mon, 19 Oct 2020 13:01:05 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id r12sm748051ilm.28.2020.10.19.13.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:01:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: anthony.perard@citrix.com,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libxl: Add suppress-vmdesc to QEMU -machine pc options
Date: Mon, 19 Oct 2020 16:00:50 -0400
Message-Id: <20201019200050.103360-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device model state saved by QMP xen-save-devices-state doesn't
include the vmdesc json.  When restoring an HVM, xen-load-devices-state
always triggers "Expected vmdescription section, but got 0".  This is
not a problem when restore comes from a file.  However, when QEMU runs
in a linux stubdom and comes over a console, EOF is not received.  This
causes a delay restoring - though it does restore.

Setting suppress-vmdesc skips looking for the vmdesc during restore and
avoids the wait.

This is a libxl change for the non-xenfv case to match the xenfv change
made in qemu

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---

Should this also add suppress-vmdesc to xenfv for backwards
compatibility?  In that case, the change in QEMU is redundent.  Since
this only really matters for the stubdom case, it could be conditioned
on that.

 tools/libs/light/libxl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index d1ff35dda3..7d735ffcd9 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1778,7 +1778,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             /* Switching here to the machine "pc" which does not add
              * the xen-platform device instead of the default "xenfv" machine.
              */
-            machinearg = libxl__strdup(gc, "pc,accel=xen");
+            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
         } else {
             machinearg = libxl__strdup(gc, "xenfv");
         }
-- 
2.26.2


