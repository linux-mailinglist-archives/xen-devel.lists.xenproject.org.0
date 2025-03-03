Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BDA4C327
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900365.1308308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cM-0007vm-2P; Mon, 03 Mar 2025 14:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900365.1308308; Mon, 03 Mar 2025 14:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cL-0007t3-Tc; Mon, 03 Mar 2025 14:18:01 +0000
Received: by outflank-mailman (input) for mailman id 900365;
 Mon, 03 Mar 2025 14:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp6cK-0007eo-Qb
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:18:00 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa044b4-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:18:00 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390eebcc371so1583833f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:18:00 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a5b96sm14550595f8f.29.2025.03.03.06.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:17:58 -0800 (PST)
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
X-Inumbo-ID: 4fa044b4-f83a-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011479; x=1741616279; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbGflUeQTUr7Q1t1j8X1mzZe7fmBcVrZJ57y6gNFULg=;
        b=mtDyFD/p5iw+pfY6lnbepnHWkDimn2L8wDQBPbQqFj4AB6oDI4XdllVNgjR3Xekpbg
         yuh+Mv19AJAJ9YjF3qjjsIGddawPM96N91TYLzgnRCrZoWf9rhYZAMPfWvE9sjRO4Yqp
         3JujuiSUUqJr1Tb1zQql8xVB0ZmJifcDNBwYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011479; x=1741616279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbGflUeQTUr7Q1t1j8X1mzZe7fmBcVrZJ57y6gNFULg=;
        b=s/ylFYzftFQUe/8hmAa0wgx48/4ea439GHOYJe3MLXAVUmfqSgpGMv5LFMb6HFPY0t
         +X6hdE/Q+vBtJtzGzS//V90zyIMw+IhxNbyX4GQh3wdX3vg6bLltR1PGjN/ZObV2lNSX
         sFH8x9pQRtS5oULuhgfCs0wCpLEaxoov5DXegOLS0CZSNZucIlu2B5n7HfgJn5mz0o4A
         4lLgvg61QUUexzD0Osxl7tTaFnHe/QtCSb8D5Q4B48u7eZog1v9vUpMHazrcvlUhafRl
         rFvlJin8YlGlyLKfl9XY0y7O5n8fneakZCqZnbsXKqL0dCWppCroXkErKV7ZTxrLYOu+
         JQJQ==
X-Gm-Message-State: AOJu0YxY2URrxHIIL3mNA4jc2wtuSEa4nu/zoQTetxR2kaLuE6n591n0
	HMxMCdBlOSFWuw48d/etPA/QFNWxSBt5g0RiE6WS9jVM3td9qHi8PfVnqKDgQTEemzafPBzPGRw
	T
X-Gm-Gg: ASbGncsRvT377FouJRFeNgEzQoYUwi2rDOiRUAHcKxC7DS27Yt4nGcwChFWG/yfUp06
	oiI6gQGpCYHClHyijbZaPeRdvmOgyo5k19r49i1K+8/g/g3NzjohJAgNpeFLzilXILUirrv6Al9
	SU9GvqJmml8zIivXEK1SVEmrdg6vs0qCbqnzWNeuxwj+P9J4N9q5UyjniGOqlBsSwuxfCx0Ldrq
	K/fyPbECyV4qVwzG2pG1ZlKZxl34Vkp0eVUPVh5vZf2bPFLT8DO8Yo4cvDyYHttow5AxPbomUj0
	bNMdpmCljnS+4S53jxcpv1NTdZCJeK7pmN4Qr5MIafYtMyqPOWxSxOo=
X-Google-Smtp-Source: AGHT+IEMm3P+ZQsaqsm93OAsNuMdwWxJjsNTrUx4rdaZbNWlHnkzjJkXM9zM1TfYks51GP4YXwRzhg==
X-Received: by 2002:a5d:64a6:0:b0:390:df6c:592a with SMTP id ffacd0b85a97d-390ec9bc813mr9892853f8f.29.1741011479287;
        Mon, 03 Mar 2025 06:17:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] CHANGELOG.md: Set release date for 4.20
Date: Mon,  3 Mar 2025 14:17:53 +0000
Message-Id: <20250303141754.26452-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303141754.26452-1-andrew.cooper3@citrix.com>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Backport to 4.20 too.
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c10df7d969ef..2b9ba4922533 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
 
 ### Changed
  - Fixed blkif protocol specification for sector sizes different than 512b.
-- 
2.34.1


