Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016FA6A972
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922451.1326379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHYQ-0004Bu-Ij; Thu, 20 Mar 2025 15:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922451.1326379; Thu, 20 Mar 2025 15:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHYQ-00048r-FZ; Thu, 20 Mar 2025 15:11:30 +0000
Received: by outflank-mailman (input) for mailman id 922451;
 Thu, 20 Mar 2025 15:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHYP-0003yW-Fw
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:11:29 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9829cde1-059d-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:11:27 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ff64550991so1298352a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:11:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6ba6f1fsm136439875ad.135.2025.03.20.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:11:25 -0700 (PDT)
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
X-Inumbo-ID: 9829cde1-059d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742483486; x=1743088286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3blZWyxJmB4Vmv4l2VWGNvGK8VbZELq5Jc2Vv875TI=;
        b=raPssi19U1gptlUY2w6ONxvOjJwDS5Fe2M3pSEVzpZlgpoKjSgBzU9uklohXFxfC14
         GrNtzC9UgTThix/Ot7sGXYzQqN3/yGNDDd5HeeNxzRIYKWM8FE1Xu5GuQsMCLOmaH6ev
         ivB5EOc7u79sKAC+zw/RA8WOeLopgoRkv0gf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742483486; x=1743088286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3blZWyxJmB4Vmv4l2VWGNvGK8VbZELq5Jc2Vv875TI=;
        b=lzLtPNaI36z28MyCBtel1cNwMDp9SScKKWgYDZAfLchpBIBkgMVrStRGCEd3CHrcdc
         nsrEy4Z6++3MEIzW35j5GVzkl1UK7GpCl8vGd/pr+dEtT86Vsb66wSkehKZSsWMEhLVn
         GtPxfvm6jyNl58lc4Z+z+SOSpwztEY8PZRSxUDkywIYS/GPn30KUfSoM7/gfy5Q5TLwJ
         uok2Hg4QsDAZlFJWIRf6/bSlA8RsunVWbSruBjxurNccYV/Du7z1SO9WhRYcsfc9JgIz
         CCpIeB9uk5sSohpVxSNIwxH9/JjAI/BZoo2c13iCV41O/91qdIB9ZWQ5MLZARqxYpkKt
         W3tA==
X-Gm-Message-State: AOJu0YxV9PcXd1xBwtBWupWs7fRsZvElMkkeB9EZ4OmAaQWt9pdyp2cs
	zzEDA7m0ttVugDX5Krh8/nM8h6qT7yQ+8BDguQmyYS8V+dKQJIDFVRVwepEHL1PI7TBGT/ZRMAL
	Q
X-Gm-Gg: ASbGncubiQv99Y8gRI46AXwcy3Az3uRDhzcZIy8aU4cEBhBGRZHbT9TLxPszQRFB+aN
	cB/Unh7KHlqcCSlNDQqXA2HzWX/7B5cJD79WmCdu6fN+EjI0R1m3GnqH7mZY/VyWZL8n4K/C4Qh
	faSj+G57hfz6UFrLz4JWivbaITP64yvdN4XgU7YH6x5Oxx2XHL++0Ok7c1U85Ni0ZIVd63dmsCY
	GtQNX22VJ12S4CS9g3GKRgTTQhLSVmG9nbb+8mD87LXwcNQw/lveXKlf02Lv6wnClDSK5myBKNf
	f524oxxF+t+aM9xIX3ZKwgZKlabXtqhlnDM1OqD8p7rdKRpN4g==
X-Google-Smtp-Source: AGHT+IFjixWobjas621RGckYnu3VV28bVgj7ZBuxBStXAbWO/alblZKzys6OS3TFGlnU5aIVLAVh9w==
X-Received: by 2002:a17:90b:2703:b0:301:a0e9:66e with SMTP id 98e67ed59e1d1-301d52c9182mr5883126a91.20.1742483485601;
        Thu, 20 Mar 2025 08:11:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] x86/vga: fix mapping of the VGA text buffer
Date: Thu, 20 Mar 2025 16:11:09 +0100
Message-ID: <20250320151109.88228-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The call to ioremap_wc() in video_init() will always fail, because
video_init() is called ahead of vm_init_type(), and so the underlying
__vmap() call will fail to allocate the linear address space.

Fix by reverting to the previous behavior and use __va() for the VGA text
buffer, as it's below the 1MB boundary, and thus always mapped in the
directmap.

Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use __va() instead of ioremap().

Changes since v1:
 - No not attempt to adjust the directmap VGA text buffer mappings to be
   WC, just revert to the previous usage of UC- mappings for the whole VGA
   hole.
---
 xen/drivers/video/vga.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index b4d018326128..b577b2461942 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -71,7 +71,7 @@ void __init video_init(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
-             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
+             ((video = __va(0xB8000)) == NULL) )
             return;
         outw(0x200a, 0x3d4); /* disable cursor */
         columns = vga_console_info.u.text_mode_3.columns;
@@ -158,7 +158,6 @@ void __init video_endboot(void)
         if ( !vgacon_keep )
         {
             memset(video, 0, columns * lines * 2);
-            iounmap(video);
             video = ZERO_BLOCK_PTR;
         }
         break;
-- 
2.48.1


