Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1344A05FDE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867482.1279030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXps-0000UR-0k; Wed, 08 Jan 2025 15:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867482.1279030; Wed, 08 Jan 2025 15:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpr-0000S8-T1; Wed, 08 Jan 2025 15:19:07 +0000
Received: by outflank-mailman (input) for mailman id 867482;
 Wed, 08 Jan 2025 15:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpp-0008Ue-GZ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5088e42-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so24091031a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:03 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:02 -0800 (PST)
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
X-Inumbo-ID: e5088e42-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349543; x=1736954343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbGRQTGcHs+jb1boNth07gwQLtq4Kdirf6gaOSDnoIc=;
        b=EI8IcDPLbUmkegEKo/JEVosAAlseqKivtVJrNKCpj4A/Yjv3RwQ3VriuiidP+rvcJa
         Z2ixumAufKwRZsMwmCkxaAJvLFaH/ElJPyWQfYA8oyNH76ag1/n+/SuiLdiHqGU7Ucur
         kEA6VTGmOKUumzF8j5ujBAr/5pnQmq7nx22OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349543; x=1736954343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbGRQTGcHs+jb1boNth07gwQLtq4Kdirf6gaOSDnoIc=;
        b=RWtxGUgGlFVRKspVhGJNBwz0124JrtTA4OaUA/DOeMbfUgHZBuMfDGAQss7I+GRS9h
         5T5niFhGBrjVq6PP89pzj6i1/fy+ZJxJB0PDqNy1nJ1xW/yf640FvzYR0zsFdUUtMN7K
         h7jAjpMox73xgv8incDRLq0r781Svo0hmMzYkNo9pinY4sMfwyxWWUX8PtSv+ZGUDzT8
         03CGVX9qyuz9xW3PPeAjmoM0xJT3p/ticrmb069G08RVyjKghUZv+l2fCmX5PBeE40hS
         BwFm+/W9F99LCisYnv2OKfDH6IOp2voKirDH8Wqn4RaB4ytAXb6ViEGkKWxszjpvID86
         lYjQ==
X-Gm-Message-State: AOJu0YyX/8WPJCAYdBzRnm5YDTVENdzL/+msCnuvdnKLlulkkJDq0hdP
	8BN0KWxsxN0WBbhgIz8RCgFtuDva5cInqmf32ITj+uLmUk3CGUb7FZ2EygK37pFuZU5AfRTrS/F
	W6t081w==
X-Gm-Gg: ASbGnctQT8VI5eAmzC5uV0jQKF66MBNivNApujtE2cpyQzCn+5BS93zPd0usKPLDrNv
	0bW7mjESxDisWKEVrBzD/KtcRkwVHHoQU7gt1fvlCjR3n7aV7B+s85/9/UTqBcHuD8OUGhISY0G
	zmBIM7owLEIx4KZTHgDLi2k7hXoHEaYkvI6OyvCwCidf/4xmfTliuzX6rl8EYl+VydZF05oJNMG
	PX/0P8vFCObzlIMYXh9pxd1WRbGaBaP9UPgyciJS8gq80c9BUrGol/VI25xTwVvCH4zAmHaQuvu
	W44=
X-Google-Smtp-Source: AGHT+IGkaiMbxkSh85J0AOmJK4ePyzmat6eWHelGZ7J77qfccD/S6Yzj6V5PY3eDPIIRCuv82vjIQg==
X-Received: by 2002:a05:6402:2548:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5d972e639e4mr6963135a12.24.1736349542864;
        Wed, 08 Jan 2025 07:19:02 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 02/15] x86/pv: Use copy_domain_page() to manage domheap pages during initrd relocation
Date: Wed,  8 Jan 2025 15:18:09 +0000
Message-ID: <20250108151822.16030-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

Replace the manual copying logic with a call to `copy_domain_page()`
while relocating intird which map and unmap pages accordingly.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * No changes

v3->v4:
  * Use the count of pages instead of calculating from order for nr_pages initialization

v2->v3:
  * Rename commit title
  * Rework the for loop copying the pages

v1->v2:
  * Get rid of mfn_to_virt
  * Don't open code copy_domain_page()

Changes since Hongyan's version:
  * Add missing newline after the variable declaration
---
 xen/arch/x86/pv/dom0_build.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f54d1da5c6f4..08a4534d5c19 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -637,17 +637,24 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
         {
+            unsigned int nr_pages = count;
+
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
             if ( !page )
                 panic("Not enough RAM for domain 0 initrd\n");
+
             for ( count = -count; order--; )
                 if ( count & (1UL << order) )
                 {
                     free_domheap_pages(page, order);
                     page += 1UL << order;
+                    nr_pages -= 1UL << order;
                 }
-            memcpy(page_to_virt(page), __va(initrd->start), initrd_len);
+
+            for ( ; nr_pages-- ; page++, mfn++ )
+                copy_domain_page(page_to_mfn(page), _mfn(mfn));
+
             /*
              * The initrd was copied but the initrd variable is reused in the
              * calculations below. As to not leak the memory used for the
-- 
2.47.1


