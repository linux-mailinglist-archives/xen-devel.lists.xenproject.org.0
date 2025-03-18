Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D992EA66F86
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918730.1323384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6W-0001Vt-Mf; Tue, 18 Mar 2025 09:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918730.1323384; Tue, 18 Mar 2025 09:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6W-0001T6-Jd; Tue, 18 Mar 2025 09:19:20 +0000
Received: by outflank-mailman (input) for mailman id 918730;
 Tue, 18 Mar 2025 09:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6V-0001Er-7O
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ab39c7-03da-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:19:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso21498055e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d1fe60b91sm129211135e9.31.2025.03.18.02.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:16 -0700 (PDT)
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
X-Inumbo-ID: 11ab39c7-03da-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289557; x=1742894357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJrfgSgOCfJAjejXjwBF2RetzOVLR6TOxhOTSZtrq7M=;
        b=AXfMUBSyZtDQegyQDomRhFGSwvLxc8jd8wWaOpmbtKw8ykyDa11zP/VyRJZqgAWkSX
         1Gsbjx7z7ZwnpKq2FZHma8PYfyZcR6Q/k4HmajoiMoAGpeczelUmboTZG/fTSH9mqhVK
         M4NuKf6rtzDPcT9MYbb6KBQkFNSbURD5x8bIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289557; x=1742894357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJrfgSgOCfJAjejXjwBF2RetzOVLR6TOxhOTSZtrq7M=;
        b=cqBbZMrUMBLIW7rCSg29L6r6K703Wq77QDmXBPQN/y6GFyAxyyoqQ1AdAntTsJELan
         kpdhcIwa9HjvyBUDvn2wD8IksaqGBbDNcOFhF3bfl3U+XMKK6FA1iW22XPwKWhixqOQ6
         JG4BdSz+PsBqO6NrWm4EDcjvJ40Z6jEMwrN2opGXGD3zFDDmE8Fi/cx3EIs4Acmdq8AA
         FnLjmBBDtLwvdn4lEpt5NP0hBc4W182NquuF1Pnwo4oJ9SNFClQs5J3GVvdbHUtA+eK+
         MdWKr9GZrQ4w+h+8lWaF7i6xsEa7Tly37CxCcWgLTGk9LTzchyhi6ahtUiHuGtRIZOkJ
         jsIw==
X-Gm-Message-State: AOJu0Yzz9OhsjIrI3uZquZqbAXMrEw35xd/DuLEegDGCb7jiJJNM2fpO
	l9flg4fDbf0VQ8fceCSCI+xKZKRRZqhaNKR2SXxzJJuFeIKTOSX8m5atssCx6KMMYnqNvs+YDtx
	I
X-Gm-Gg: ASbGnctstSzZzEgUvcgd8N2wzJcKT06Fdi0LHWWETdS/eD/FQ1ccpnmbErAcORMQl3M
	Lwh3iiTp5aotPd7Sd0w/CVlKKGmp/Kt1kKXrTqmf0xtqRPuWezXqx+TLco6dgJn0PhZLbLrBkn4
	IDxxSteK33HvbQuTvker/ljQUV9/Tz+troXqPkr4mBj96GZHJH4rE2EUAtMIuBeR8sugKYQWyMB
	qY5muFu2PO4PdTzZiVXhhZCncs/AD5wMOV4TfZq15/ksgcyBd+Mb2B5bPjivH8zVi9m0QJ4SmRP
	ETjUzwcT7e2vilIEJATEtxszieEfPq5gnl0X5P1f0cfdDDPy2w==
X-Google-Smtp-Source: AGHT+IFMkceX6oq4VjB2zOMmMrOjarqH8kophX5VOaq2q0cqLz6dtfKN9iw0JKDaeoMiK0jGtDBRWg==
X-Received: by 2002:a05:600c:3c9e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43d3b993e94mr12025615e9.14.1742289557208;
        Tue, 18 Mar 2025 02:19:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/5] x86/vga: fix mapping of the VGA text buffer
Date: Tue, 18 Mar 2025 10:19:01 +0100
Message-ID: <20250318091904.52903-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091904.52903-1-roger.pau@citrix.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The call to ioremap_wc() in video_init() will always fail, because
video_init() is called ahead of vm_init_type(), and so the underlying
__vmap() call will fail to allocate the linear address space.

Fix by reverting to the previous behavior and using ioremap() for the VGA
text buffer.

Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - No not attempt to adjust the directmap VGA text buffer mappings to be
   WC, just revert to the previous usage of UC- mappings for the whole VGA
   hole.
---
 xen/drivers/video/vga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index b4d018326128..ee6cf0a7079a 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -71,7 +71,7 @@ void __init video_init(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
-             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
+             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
             return;
         outw(0x200a, 0x3d4); /* disable cursor */
         columns = vga_console_info.u.text_mode_3.columns;
@@ -158,7 +158,7 @@ void __init video_endboot(void)
         if ( !vgacon_keep )
         {
             memset(video, 0, columns * lines * 2);
-            iounmap(video);
+            /* No iounmap(), as it's a directmap mapping. */
             video = ZERO_BLOCK_PTR;
         }
         break;
-- 
2.48.1


