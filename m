Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9A902782
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737475.1143874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXv-0002km-NT; Mon, 10 Jun 2024 17:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737475.1143874; Mon, 10 Jun 2024 17:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXv-0002fG-Gp; Mon, 10 Jun 2024 17:11:03 +0000
Received: by outflank-mailman (input) for mailman id 737475;
 Mon, 10 Jun 2024 17:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXu-0000kq-DG
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:11:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e72a3b-274c-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 19:11:00 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57c68682d1aso2741897a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:11:00 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:59 -0700 (PDT)
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
X-Inumbo-ID: 68e72a3b-274c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039459; x=1718644259; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrX59hkSrQ0XvK870O5bXvRvRJt2HGVyFsC9P2tIoGs=;
        b=dS8D7DzULlvC9SjSLDIgpiypaQ7RI40ME3Rim2YDqhrHOv0cy+3BjLyIVGYand3lLA
         nnyfk1cA7IYNNr7YfpcYeT7wh3sAunF/U5wrzRZ1dFMoG9WXYN22VLcQ5fYsW6B1BLuj
         hfbariVFmZEWcffCwIC/mEqlKOS4dWuLVn7xDrfZt4u0vUc/AKIMX3PAuy094SGSZ7eI
         CB4U6bx8PsVGq8JiDjuABRQ3FfTGH6fOOUTW10INtTLN3uFfyvLQHfh+jJMAlWU+Mu5Y
         VR+hm6on53DEjyd359D75R53GReAdg9HjeQhSsZCC7gafGN8iED0jNR+2O0i3WtNXAUE
         LeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039459; x=1718644259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrX59hkSrQ0XvK870O5bXvRvRJt2HGVyFsC9P2tIoGs=;
        b=dV5j+P+Sq4rfXa4zBaHxpaERZMH1N4xrAdO+LuBrGN0n3AxP96M1B3FT4/EGUB8lNH
         B6W3zCu1KznFUY2+FZq0b4JlZH4mukqbPTE0p7wTegKZjYFEg2YLH3v1JaqLVGGIPIoD
         /t/BVP2GxX/V0005S0R7xx8rYfAoZFd6DVJlsZPbN63l+4Zz4pO89bM57ux9N7+n48Wd
         wGZJzcCa6A9CRv6cQa22zOTnbMn4otDct8vBvhHEwTwXwFncEGzhn8o7D0EpTrx6jJ3K
         zZzzOn/3DOf7qtB+st37gNJ3lrYuKE7dGpbbAeBdTaMdxsDznNYi9LCnksO15Sk9ljIB
         4zjQ==
X-Gm-Message-State: AOJu0YzSzCk9hxy2H8OhlSknnCjwuahg/uYRFIiHqRhJJTmCI4Pj1/Sq
	xCt8zYp64VuopiJ0TXu6gm0o6Z32/VjlmnNo1Sp7Hm1chOshH98w40ECOw==
X-Google-Smtp-Source: AGHT+IEXkPlHF5sRTc7fOS3R5VN5O5OYuYtfka9YGxGHMmFLmaA67En+ici0Ne59LQ3XF+BZaXxFyA==
X-Received: by 2002:a50:ab4b:0:b0:579:c8cb:ec3d with SMTP id 4fb4d7f45d1cf-57c509992b4mr5982072a12.37.1718039459552;
        Mon, 10 Jun 2024 10:10:59 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.19? v6 8/9] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Mon, 10 Jun 2024 17:10:46 +0000
Message-Id: <d3d5b3812db34758edcc8541b99c23408c79fd61.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index faec09e15e..721d753c95 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -747,8 +747,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)

         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }

         if ( config->altp2m.nr > MAX_NR_ALTP2M )
--
2.34.1


