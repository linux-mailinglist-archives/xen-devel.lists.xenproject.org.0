Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7F662A68
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473751.734543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMj-0002sz-In; Mon, 09 Jan 2023 15:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473751.734543; Mon, 09 Jan 2023 15:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMj-0002od-FX; Mon, 09 Jan 2023 15:47:13 +0000
Received: by outflank-mailman (input) for mailman id 473751;
 Mon, 09 Jan 2023 15:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMh-0001Ok-E9
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03e858f-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:09 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id vm8so21174205ejc.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:09 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:08 -0800 (PST)
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
X-Inumbo-ID: e03e858f-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfnD404WY8hoWXz7M6QxUrNZUgpeIm9YCOZjEZ67MZU=;
        b=kCxCCMt//j+fO82VIWosCsH70bh7+2l51ewWKYmVjIJfFuALEKC6RrRaFxKMsNOt4u
         mjuZaTPIjMiAaysnpjOfy8Y3sEkrHlR7Oam+CrJ6Axc9x0SVjGV/b/BbWsFHm9jLJk4C
         h6Jxz1ee4Er1T0sYNM76oBiJYz5GJcC/Oi/yn+WiE7TAayD57bkjlkipn8eTTdtA3Mda
         8jN+ffqM/G/pOQo7PkWw5pcIoyRztRVxBOyozQ6qQt9g8X0P57tELOcajQaAdFgG5NjN
         VRFtwC9G3baHMpe5qGiXbG9ibx0wWj++cniJ4OomX1iPIb3q9Fxrfg9y17pQQ/oMdDlt
         5ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfnD404WY8hoWXz7M6QxUrNZUgpeIm9YCOZjEZ67MZU=;
        b=Km+BtszLjgFniMVsMY8mgkx2qZk6XqPEL4hokzUdgxOx1q8gJywT4w/Iqna9VWFDGF
         KHK2W1p7OubGUmpMLb13rxQjn/mire/1lmahExJFeMoMnambOAELyxRUPpEgbtYV9U9V
         CyBFNHjECFVtx5Y/HWQF6wem1Jf0nqIKp/hwK3Ng7SimXZjyn/hjPxl61UCnxbe13BMC
         C0oh0wqh+N5rf6+vBFeDtP2OR2aE1qxYea2SRUiblN1eoERjTD5nbfwIcjT2K+qD7wzn
         q0HxdHFfl8k+55ci2vTNLEiXkOddQuVKm2Js1thPsvzBKxfuJ1T6QqYf0JiDtBsM7qX7
         0BeQ==
X-Gm-Message-State: AFqh2kqTpZgHe36wmdhEVOCG2lrDJl2ZvlBUhxGYB6fFWRnceXW1yGJp
	G2mEOuHe6hEtzB6hfwMOt69alDR0yLjGWQ==
X-Google-Smtp-Source: AMrXdXuqaCYbURIHqb86DXSLX04rTZYHXx+kJoChkuf3VUW7/sB/PJn0ZlqOSpiYG/s00ciULywomQ==
X-Received: by 2002:a17:906:8447:b0:7c8:9f04:ae7e with SMTP id e7-20020a170906844700b007c89f04ae7emr55018487ejy.22.1673279229209;
        Mon, 09 Jan 2023 07:47:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 5/8] xen/include: include <asm/types.h> in <xen/early_printk.h>
Date: Mon,  9 Jan 2023 17:46:52 +0200
Message-Id: <3b292b680a02e2413ad6d9bd7c64bbe6a71e0d5b.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/types.h> should be included because second argument of
early_puts has type 'size_t' which is defined in <asm/types.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V2:
    - add Acked-by: Julien Grall <jgrall@amazon.com>
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


