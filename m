Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8092A84A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755531.1163928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGx-0000YG-OO; Mon, 08 Jul 2024 17:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755531.1163928; Mon, 08 Jul 2024 17:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGx-0000Vy-Lj; Mon, 08 Jul 2024 17:35:31 +0000
Received: by outflank-mailman (input) for mailman id 755531;
 Mon, 08 Jul 2024 17:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQsGw-0000H0-78
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:35:30 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775a3695-3d50-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:35:28 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so5674290a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:35:28 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm11603666b.6.2024.07.08.10.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:25 -0700 (PDT)
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
X-Inumbo-ID: 775a3695-3d50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720460126; x=1721064926; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epcQlWhE08mmo18Ou0eUa+ySD6kZjdPGssgvvnX14vM=;
        b=CQj1Zig1rku/JKCKrmi3PcEl8V8u70Pg+3MLnrdPc8WSIpnXJfIwfy0WrwDGtWThDP
         KWkuh7cNh7bikwY/dzsdMqxbPlRwOpBit2h6PovZQBNfNOJmpE8k6vZ5yxLV0ePnZG8l
         +pAzsALKx0WFWcrKk41R/TtRIjrVaQUt9Hvgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460126; x=1721064926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epcQlWhE08mmo18Ou0eUa+ySD6kZjdPGssgvvnX14vM=;
        b=RVolCbX4DDNEmGutX4S8J1z2t0fjtyAXBio6ZZsVsYuETfJgC5utSUEHZs3xPlNiYu
         cABU9KaAQrsxCAtEyp6c5JQvV+ZDXvK+V4JQLgJ4Ef8P8PXDZJhKjBhi4HeWCYeU7GPj
         dav3YeVi6gXuOr+82PKomcmI8zLiAqdphfyHv6lQTpgeVbXS1oI3nCkRLBFFlKd3N+Ij
         b2QCVE1V89FCz0PtzkytPjwPB22K7VM6GAB9EPg8FrK4jvZu7cZUWyZtYc10R1re5kkb
         tGU+99DgJvjjAr/0SZ5Il11m3Tf1I+RmLH196pyjrc/jZNaMSul3WY2Zy+u97liuIjFH
         j2Yw==
X-Gm-Message-State: AOJu0YwNmGAqspYsBytsPBAFf/pDC9rBWGdpgRG9LFh/iSsBzCzJtVSM
	dbbu+OhlXk1zb+/ypCeawvVvCpx73GxpD7FdYuHcGo1O28L/Y2Z9S8Jm+EGIW3+sMj65TkD3R0h
	p
X-Google-Smtp-Source: AGHT+IFI2/gBtGpBbyGt3lCYXWmf0QYtt4N0rNJ3xsNz0sosJ5NN+JTGmFARbLqHfD2RQ7GMMLlD1A==
X-Received: by 2002:a17:906:f0cc:b0:a6f:e819:da9c with SMTP id a640c23a62f3a-a780b70539bmr19110566b.43.1720460126307;
        Mon, 08 Jul 2024 10:35:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/4] CI: Fix CONTAINER_UID0=1 scripts/containerize
Date: Mon,  8 Jul 2024 18:35:19 +0100
Message-Id: <20240708173522.2218293-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, most build containers use root.  Archlinux, Fedora and Yocto set up
a regular user called `user`.

For those containers, trying to containerize as root fails, because
CONTAINER_UID0=1 does nothing, whereas CONTAINER_UID0=0 forces the user away
from root.

To make CONTAINER_UID0=1 work reliably, force to root if requested.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/scripts/containerize | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index acdef1b54813..03bc4837350c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -51,7 +51,7 @@ esac
 
 # Use this variable to control whether root should be used
 case "_${CONTAINER_UID0}" in
-    _1)   userarg= ;;
+    _1)   userarg="-u 0" ;;
     _0|_) userarg="-u $(id -u) $userns_podman" ;;
 esac
 
-- 
2.39.2


