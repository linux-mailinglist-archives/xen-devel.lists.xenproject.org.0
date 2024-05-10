Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DE8C226A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719760.1122599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NoX-0007dQ-I9; Fri, 10 May 2024 10:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719760.1122599; Fri, 10 May 2024 10:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NoX-0007bM-FA; Fri, 10 May 2024 10:49:21 +0000
Received: by outflank-mailman (input) for mailman id 719760;
 Fri, 10 May 2024 10:49:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5NoV-0007MJ-Mp
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34551cd-0eba-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:49:18 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41ffad2426eso3650765e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:18 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bdbcsm4196331f8f.23.2024.05.10.03.49.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:17 -0700 (PDT)
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
X-Inumbo-ID: f34551cd-0eba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338157; x=1715942957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVbCv81rAzGflBvcSrzxqDvQbbVCQ+aUGbh/Oa+Rhcw=;
        b=WGWLDirjkrVHyU6JwVlrULpLZGf7hJrkCfjZuocw28RRNUxenNRpApohRTL7gTxWKN
         zVyQUWf75wErhf0SJBNR7rSwd5RzUzJKGPW+jckrVVU+sPkGTmjWSHqKc66lebQfNccZ
         r3vn9jJ9CPqdrFup+wNc76W57DgSv85ifbk1U94JiW7AK+U40ncM5EyXl3oXc8uuYdPb
         yi3/QRHd1d4KMagHgwzzb0iYpztAetFyfBtkGHKDMyQ3IS96K7PIOhU5bPAenVom09rL
         vdKmjAL5XRYL0n7srcbXowJfhiwl2EIA3aHlZ36wtBOKTCubgW4hFC8Kx+7K1moBqN4n
         xRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338157; x=1715942957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVbCv81rAzGflBvcSrzxqDvQbbVCQ+aUGbh/Oa+Rhcw=;
        b=cYNt/sziYvK/qsyFYgulknaUDrmEUiPltyIZs4ltqg1m8HM49a4KcPCcpzuJKWYD7J
         5pe0CzKBqycSPm5Fn7KF4ArAbZQhoQkHWABHYoUAeP1At7KTJJbcx4bcoGBr7QMsUk0v
         SAB9nEsoCASPJ2JI1o4s9etlYAEdNslWkAkZRLB8dtDdaGZGOuW/dYsq6fcsHqLrobIx
         rfD0BG78pj8At8GjREl0jIuyZnuR7Gmu+MbndQ7wk+1eUV8UI0XxBAjbITNA3DdejX4w
         GfhjkUAVBEkr2RshVSVW6aEFZmJHNzM2GaTP1O02g3poHW1055rbOzWRU7UnbbGHfvw2
         GQTA==
X-Forwarded-Encrypted: i=1; AJvYcCWoebHz5D7K6R8nRYMfnShiZ5lIvOJ/fX0QRbDC4ywIYjOKxixST0C4Yld2Av/Fmgsz0kgi922sh/Yg5Ih2rrZMEKGLwU3ZsVI9ikOKiVE=
X-Gm-Message-State: AOJu0YyMqT8xVY1nP1o7dkiF3DRW/F40c2XVPfDovlEC+LW9INZLWj9B
	7qMyaibAg25Cje/20EEygK3KoN2V3IHkkzclxdPeNm5xrP9maGBIx5JlESvHxRc=
X-Google-Smtp-Source: AGHT+IHdk5RMerXt6xlL7OKXtzLIPevwNSQsVWTfglLFy+cVjQ0DDHmvBq710DZ/D55SqgKGH3hL1w==
X-Received: by 2002:a05:600c:3508:b0:41b:f116:8868 with SMTP id 5b1f17b1804b1-41feaa38a79mr24859125e9.12.1715338157651;
        Fri, 10 May 2024 03:49:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/7] hw/xen: Remove declarations left over in 'xen-legacy-backend.h'
Date: Fri, 10 May 2024 12:49:02 +0200
Message-ID: <20240510104908.76908-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'xen_blkdev_ops' was removed in commit 19f87870ba ("xen: remove
the legacy 'xen_disk' backend"), 'xen_netdev_ops' in commit
25967ff69f ("hw/xen: update Xen PV NIC to XenDevice model") and
'xen_console_ops' in commit 9b77374690 ("hw/xen: update Xen
console to XenDevice model"). Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 2cca174778..eb22633caa 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -67,14 +67,11 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
 }
 
 /* actual backend drivers */
-extern struct XenDevOps xen_console_ops;      /* xen_console.c     */
 extern struct XenDevOps xen_kbdmouse_ops;     /* xen_framebuffer.c */
 extern struct XenDevOps xen_framebuffer_ops;  /* xen_framebuffer.c */
-extern struct XenDevOps xen_blkdev_ops;       /* xen_disk.c        */
 #ifdef CONFIG_VIRTFS
 extern struct XenDevOps xen_9pfs_ops;       /* xen-9p-backend.c        */
 #endif
-extern struct XenDevOps xen_netdev_ops;       /* xen_nic.c         */
 #ifdef CONFIG_USB_LIBUSB
 extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 #endif
-- 
2.41.0


