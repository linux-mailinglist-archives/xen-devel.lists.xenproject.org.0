Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32041660106
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472545.732833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYb-0004EF-2k; Fri, 06 Jan 2023 13:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472545.732833; Fri, 06 Jan 2023 13:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYa-00049H-Tc; Fri, 06 Jan 2023 13:14:48 +0000
Received: by outflank-mailman (input) for mailman id 472545;
 Fri, 06 Jan 2023 13:14:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYZ-0003zy-CT
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:47 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d71d02-8dc4-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 14:14:45 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id z26so1886263lfu.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:45 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:44 -0800 (PST)
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
X-Inumbo-ID: 16d71d02-8dc4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/C7mq9n+LLhC4Y4ZbcEJdqsm6p7eqTbyDE7iupd4oI=;
        b=DmPgp211+8J2th3XIdLG7IFTx4S08FyDzOd2EKY33xrDl/G3AFncyIEwd9hidIynjW
         My5wV8H1swatr8xVCeu/nA4fhbDyYXH215UKAkYHa/zjrp9Gws+38Z0SsYUN1qcFFlVS
         rbuwrpYwBVF7X3vdf8bKHyA62wshCC0L+uXcVvoBk/Rr8XdlqLdoiJCiSiST7hPNYHVG
         bwBJ1t1ISSHFQfFYPJ9W79L+cI51pnkYJ0WQScbMrNDxRYFC9gaAJUsN5oAuuwX10gj6
         VJ+sERai9LxYoUtqqt3lpvj1a3yeLGGtY+m4VUcEfkRPxvXvNfUJ5SmYw0VU59TpGiu8
         vevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/C7mq9n+LLhC4Y4ZbcEJdqsm6p7eqTbyDE7iupd4oI=;
        b=NnkWNNRrOhmeW9ToyNCn7stmnwK2/uLmmA2pUXs4BQzMTP+qb0vuO3bJ76tfXOwC4A
         nD4ioATkBrNxHEWERPXobYdVR+QkDLa5Y+23oZKGHJTrYaMQZFvppysDvrH6Hqt6jp9V
         Hx/vCtfxDQX1bPD3J1V/qInD0QL482p5YXYYuMihOi/rifWPaoyHk+n75RsnDlcrID08
         QFUbj1RVeiu9cenpbfWCx9gHzOoQw3U5vlJKCyJcZnmBrUetzGU3qurpvSTqzFdeUa8l
         d14rkFt2/Dz8WEneNpt9FwPquKLOra1YZoHUpjZEbBYxl/VCbrjj/eKA80PEwydiOMbZ
         QGaQ==
X-Gm-Message-State: AFqh2kpQm1xgce9MP5LoGvanJpv00kkSmKBAX96JBrCOcyKqVzSkHOK4
	jCDGqYQrvpr8sYL1dBh6P8xyJfzL61IzToK6
X-Google-Smtp-Source: AMrXdXuzdj7/0NVCbmFTZQ7fqbaayzfjRYlIo5wrF/b9HwI6nUYbU6E3dM8LqLQZDIL0pVc1/Rrufg==
X-Received: by 2002:a05:6512:16a8:b0:4b5:b7ba:cae with SMTP id bu40-20020a05651216a800b004b5b7ba0caemr16054266lfb.48.1673010884899;
        Fri, 06 Jan 2023 05:14:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 5/8] xen/include: include <asm/types.h> in <xen/early_printk.h>
Date: Fri,  6 Jan 2023 15:14:26 +0200
Message-Id: <940bf18969634564fa5d206d02eb2a116c9e0ea0.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/types.h> should be included because second argument of
early_puts has type 'size_t' which is defined in <asm/types.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/xen/early_printk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/early_printk.h b/xen/include/xen/early_printk.h
index 0f76c3a74f..abb34687da 100644
--- a/xen/include/xen/early_printk.h
+++ b/xen/include/xen/early_printk.h
@@ -4,6 +4,8 @@
 #ifndef __XEN_EARLY_PRINTK_H__
 #define __XEN_EARLY_PRINTK_H__
 
+#include <asm/types.h>
+
 #ifdef CONFIG_EARLY_PRINTK
 void early_puts(const char *s, size_t nr);
 #else
-- 
2.38.1


