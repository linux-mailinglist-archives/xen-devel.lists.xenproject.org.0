Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E8673B4E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481130.745829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZp-00034v-8J; Thu, 19 Jan 2023 14:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481130.745829; Thu, 19 Jan 2023 14:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZp-00030Y-4O; Thu, 19 Jan 2023 14:07:37 +0000
Received: by outflank-mailman (input) for mailman id 481130;
 Thu, 19 Jan 2023 14:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZn-0002xN-Vk
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1c5990-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:34 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id g10so1638897wmo.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:34 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:33 -0800 (PST)
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
X-Inumbo-ID: 9f1c5990-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw5z92GdwkOpMq67zyGgBHYZBK1yWuFbI322wDA/UW4=;
        b=hVoM7hPlhAeqWlT93JqTd1mxy1MsnUUU2u7L66yRzLAxRgy3fbB0xK+Ag+jaWpnEDQ
         j6ywgy3AsgCY15Olqg4eeG3ajTdinCyRgbXyzl4ZPnlqt1qaAF4l8OpzF9jcSuISSoTR
         IreTmWgq5OF9q2BJm9ukVHDDobwpxr2asdhajUwIqOZlwwq4m5bOGUnlwoGbUbPA1D8h
         HX4yybvyxMcOg8jOGpaRFFxCtqGczcFADQNCgGVOVajY2bhlmpsZ/FcZMSaNPatd8N5I
         XFrm/DijyCg3WfBwhZR5Lp5fLybIFNWjIqK3dbuwwMgz3e/Ydgyzkks3VhvpkuAGnEaQ
         MQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jw5z92GdwkOpMq67zyGgBHYZBK1yWuFbI322wDA/UW4=;
        b=uFnbbl64H+rY3aBw7/DIauJk/rkR3UKaUBSeHDvlaaFRHz8ZsM43dKoCmje7v2bs/v
         EmNLLtB6hmc4F4yjUFPisKuE5TJMS77PzBC2pwLNXqS6orIO0+fLfbydGmtzC1Fo8TZx
         Q7NGkmHALquyvQ8AFrCdMiZvB4n91DMFfMWUfOo8LATud6NLkxIWAKuGG9QS8qqE6Nfh
         Q9icGju/2CwE0ObrL8/qvrWSlcKu6J5TENLPRucPRzK7zED1jGHop7lLGG/qctxLIVh1
         jCdxav/vny/305bBeUqSMBUkMqAEhfLWaFM10pl+OaKVsy3TkUQ6vffRo+3k/ClaPKNr
         Mq8Q==
X-Gm-Message-State: AFqh2kpDsA00YhHJDxDRECanh0O3TJQj1iZIlS4M0qBQk1K+TVS8G3Os
	rFLLG4L8l23jt5AMCZivxoSo0VuhkMz0gQ==
X-Google-Smtp-Source: AMrXdXso+VlLck+nuGDxhZ6lIwyeNuE6ySJ/rTv+sX03C0sCknM9MJ3l9n8n5yvH8oVtgULUxe12vA==
X-Received: by 2002:a05:600c:3d06:b0:3da:f945:2354 with SMTP id bh6-20020a05600c3d0600b003daf9452354mr10404349wmb.41.1674137253886;
        Thu, 19 Jan 2023 06:07:33 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/5] xen/include: Change <asm/types.h> to <xen/types.h>
Date: Thu, 19 Jan 2023 16:07:18 +0200
Message-Id: <916d01663e76a3a0acad93f6c234834deaa2dd72.1674131459.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674131459.git.oleksii.kurochko@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the patch "include/types: move stddef.h-kind types to common
header" [1] size_t was moved from <asm/types.h> to <xen/types.h>
so early_printk should be updated correspondingly.

[1] https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/xen/early_printk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/early_printk.h b/xen/include/xen/early_printk.h
index abb34687da..5d72293793 100644
--- a/xen/include/xen/early_printk.h
+++ b/xen/include/xen/early_printk.h
@@ -4,7 +4,7 @@
 #ifndef __XEN_EARLY_PRINTK_H__
 #define __XEN_EARLY_PRINTK_H__
 
-#include <asm/types.h>
+#include <xen/types.h>
 
 #ifdef CONFIG_EARLY_PRINTK
 void early_puts(const char *s, size_t nr);
-- 
2.39.0


