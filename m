Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67568A2A6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 20:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489348.757696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RA-0003fo-OY; Fri, 03 Feb 2023 19:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489348.757696; Fri, 03 Feb 2023 19:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RA-0003e7-Lp; Fri, 03 Feb 2023 19:09:28 +0000
Received: by outflank-mailman (input) for mailman id 489348;
 Fri, 03 Feb 2023 19:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4sJ=57=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pO1RA-0003ds-4g
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 19:09:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46dff81e-a3f6-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 20:09:27 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id x7so6185780edr.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 11:09:26 -0800 (PST)
Received: from uni.router.wind (adsl-160.109.242.226.tellas.gr.
 [109.242.226.160]) by smtp.googlemail.com with ESMTPSA id
 q24-20020aa7cc18000000b0049e19136c22sm1517393edt.95.2023.02.03.11.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:09:25 -0800 (PST)
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
X-Inumbo-ID: 46dff81e-a3f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/53xjCm4StWok4GzCMBvVj8eVR215tSpVZLrSRkfJ0=;
        b=FQLirTlVFUjB+AQPp0y0vNUjzoF5Od//jXZK0/QFsa2lKmSla9/e/4CkSzlDziqz3D
         LzTNkPGiiVErGIrbvXPG6PTnuX2tb4ugi5KFg4I+KnFwQrSTKxUoi0a3mFJf32FfBHJn
         3ANlqIEsmS+A4DmnTad3QB3LO4A47O7Fgplfct4BG1qCOJpR39aw4+UeFhRhEwnJhVcV
         ZeRngIVXF+P0qBzFaXkNU5M0CyfJwpmRBhHCRe+w4+E6wS8A7F1mtkCPq291pulfLYYK
         Q2V+puqeZotcLZb8YfaYONFcFBXsNKUKE7uZfGzbkWC7Gl9xlGOc5cWIFEaElqimefgY
         X2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/53xjCm4StWok4GzCMBvVj8eVR215tSpVZLrSRkfJ0=;
        b=qjJNp+u1xV9r/8xtHy04JPYUWyAjJucJ7YQO0yHVmF4Xez0L+mkEClO5RZaY+OeKTO
         7WUHlnE+XipnEX9ajj0anTfxWwn1JBHlO7CpQhHmfF7N9eciMg5uvuiiGDP9yDCwsMcF
         XylijeXxkD4rOeXhjsmVaGbe3cnoilesFpruG5/DVAtHA/U0Tb9PgfPYkG6YuKBPFJHe
         v0UCtgumd2TGBdLGz2Uyic637u0xgFq+WOBG8jB3rVdC6NR7ZH8GjlY0GJ5rEZsYfnLi
         ibYlBNy5H4pQb3y+khQ0iR2DpISLZ1hTgQ6C7qKquAnfhG0vPPy/KX3pHjftSSEoZAfS
         OHPg==
X-Gm-Message-State: AO0yUKWW4fsIHMkVFbZjv+0Io+bHVx5c9BdZF2hugAG8yev15828H9Zt
	hD/oTNAWIvcsNo8NIqautLAnym5pR9E=
X-Google-Smtp-Source: AK7set9T2ERnS3b9g9ktqqYsjwHPVy/YdYunkxTUXH1aeyDSovnj456AsSqHC0+2XWBqsC+ZD357wg==
X-Received: by 2002:aa7:c24f:0:b0:497:b6bc:b811 with SMTP id y15-20020aa7c24f000000b00497b6bcb811mr11466606edo.33.1675451365991;
        Fri, 03 Feb 2023 11:09:25 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused dt_irq() and dt_irq_flags() macros
Date: Fri,  3 Feb 2023 21:09:08 +0200
Message-Id: <20230203190908.211541-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203190908.211541-1-burzalodowa@gmail.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macro dt_irq() is broken because the macro parameter has the same name with
the struct dt_irq member "irq".
Macro dt_irq_flags() is broken as well because struct dt_irq has no member
named "flags".

Since no one seems to have ever tried to use them and eventually stumble upon
the issues above, remove them instead of fixing them.

Fixes: 886f34045bf0 ("xen/arm: Add helpers to retrieve an interrupt description from the device tree")
Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/include/xen/device_tree.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 7839a199e311..19a74909cece 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -159,9 +159,6 @@ struct dt_raw_irq {
     u32 specifier[DT_MAX_IRQ_SPEC];
 };
 
-#define dt_irq(irq) ((irq)->irq)
-#define dt_irq_flags(irq) ((irq)->flags)
-
 typedef int (*device_tree_node_func)(const void *fdt,
                                      int node, const char *name, int depth,
                                      u32 address_cells, u32 size_cells,
-- 
2.37.2


