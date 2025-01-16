Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005BA135EA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873343.1284306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLiP-0003wM-A5; Thu, 16 Jan 2025 08:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873343.1284306; Thu, 16 Jan 2025 08:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLiP-0003us-7P; Thu, 16 Jan 2025 08:59:01 +0000
Received: by outflank-mailman (input) for mailman id 873343;
 Thu, 16 Jan 2025 08:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYLiO-0003um-MQ
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:59:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f4540b1-d3e8-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 09:58:58 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so3541045e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 00:58:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384054sm19942478f8f.36.2025.01.16.00.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:58:56 -0800 (PST)
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
X-Inumbo-ID: 1f4540b1-d3e8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737017937; x=1737622737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3QCn3jOgn/JvfbmhCVngGXb1tZ7Fz8blJiUHxCaYbk=;
        b=P/yMbAvMfskrO6r42lYODW5HGp1OoN8l9Qkxqhe0ZzI0DjP3rRuSrgQmhuhcFNNhh8
         AKbWkCPvVO1Y7IHtUF6BOjSnPcLVfi7+hol6leqmte/tumu0JZ22p2TcTyXBtRFbeILJ
         Fivj1IIzBvc76EAALe0offRqXxSH/hpkLgy3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017937; x=1737622737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3QCn3jOgn/JvfbmhCVngGXb1tZ7Fz8blJiUHxCaYbk=;
        b=MiwHxSnoHiw9Cv4rVskmQBsjSJ1z2ffPc7Bk2PDQZL6BX4+raKgLXLp+ZBl9MNIOc1
         sV+ecuZNpMDJFOC6BWYGIZ+LvEwm0TNm33akobEBZLSmtToVPEQif7or56rN/3GnqzaX
         p7FjTfieJuDQDtQN5BSvT8Gj1IHIGH+/cjvITCAMFICYzvr56I3Plg7B/FhBUC7akZ1U
         wbe8bWFCaFd6G+0p+1LsldunORc6LzjWYKANhyR3BlUz03bycm6aDceF1dOn96jh2MEP
         qRKiL7Al1+U6KCdCKJbsGCDEif2Iz2pK55jdQm0pY0eFmkjSyp+9vV5bsc5Eev/sooCG
         OEkw==
X-Gm-Message-State: AOJu0Yyk1CtNTXcbdKXjt3H+GLciDeu6OXc9pLHtgm/XRMm7fe15LjY6
	ndaER+2eFqEKkdB1cX8rGJjHj0UN0xGIZNwQP7uKmIvhsHUSnDRe7puYaQDPbXrE36TTIlra557
	W
X-Gm-Gg: ASbGncv43epOtrhR4MUyWaUhAFRhjZEnsrLPPmDxYuvI89AIgXTHyynPJRho1AWr0sx
	eYRfpbMClofnqI70hi2yZ15FR08A4qcXurn/f7Gfd1Jab9MniF+gOfCLwllwkxM2FRMkMlZc4I4
	cr9hCLBwGuKqbEAG+ylM4m+N0yQtKES1K1ZDNIqUNDOv8oDGP0FNeXZm3/nMt1BlJm4FdT5Yxi4
	GwCxbWUgkoGbNIf8J1PYUuJ95TREruBYQhUcwdl2FKI+emYFZRs7TX9FRWdEbSrdEI=
X-Google-Smtp-Source: AGHT+IEFf6bLRJ5IOz2NyFKmkR9yiutCHHyj93HGEM9ATj7GP3hPmZmCKqizb9HCNAnQK7hoa0bfbQ==
X-Received: by 2002:a05:600c:1e0b:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-436e26e4c61mr265211845e9.22.1737017937230;
        Thu, 16 Jan 2025 00:58:57 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 1/2] automation/cirrus-ci: update FreeBSD to 13.4
Date: Thu, 16 Jan 2025 09:58:50 +0100
Message-ID: <20250116085852.78273-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4a120fad41b2..ee80152890f2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,7 +18,7 @@ freebsd_template: &FREEBSD_TEMPLATE
 task:
   name: 'FreeBSD 13'
   freebsd_instance:
-    image_family: freebsd-13-3
+    image_family: freebsd-13-4
   << : *FREEBSD_TEMPLATE
 
 task:
-- 
2.46.0


