Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E711B871F00
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 13:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688785.1073373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTnS-00038i-Bx; Tue, 05 Mar 2024 12:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688785.1073373; Tue, 05 Mar 2024 12:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTnS-00036a-9J; Tue, 05 Mar 2024 12:21:26 +0000
Received: by outflank-mailman (input) for mailman id 688785;
 Tue, 05 Mar 2024 12:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhTnQ-00036E-H2
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 12:21:24 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c3cc7c-daea-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 13:21:24 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56682b85220so8930555a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 04:21:24 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d17-20020a056402517100b005671100145dsm3559454ede.55.2024.03.05.04.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:21:22 -0800 (PST)
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
X-Inumbo-ID: e1c3cc7c-daea-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709641283; x=1710246083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3i4C+xzhxQOm5TomDZOcoUjBDYeat+d4hlJTa4Id/Q=;
        b=QiPnIF2i/WIkG+pSOtsHTLcU5YYzAo3RLG4iG0T1OnbVgYtxI0U0nK6zacLkFuaE5x
         ktIABviXw/y8/HT408mk/jXgWr+vVQnt4qWyoVFZEDdoNuQ+AgCx9U007ppUFtX4SozT
         MkHONaPR3saUtGl1jjYHAGSTUT/hBvBrqT1r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709641283; x=1710246083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3i4C+xzhxQOm5TomDZOcoUjBDYeat+d4hlJTa4Id/Q=;
        b=T3LWkcP7gcKlI9IXoccUKMpzOO/HViAJj1nD6P04EKO6xDHnaS0wm11RKupy4TYSxW
         /HqH+eAWVRO3qkL4yoEMqa+/reuHknj2zYK2Xj/lKrVUM8dNzhOEqmjUuKaP5kXaNs27
         fckXcjYSmr7Dz2A/d4aJsRq0xRUl2CD7nyZj/a+B3GS6DVgRR/GHIylhNgGl561hZzS1
         RMKdIDSc0PuAkGYiMQGVH7WcdDJlC0DcDpAGqfAVL0/d3lqubIDOXBmAT8566C6kTyay
         ijxla/Grg4FoMFBUeQ81AmlH7TeZqY2FcbjxZTJUoRgACKsoqv4EX6Gq6AhghGcFBFDX
         dXLw==
X-Gm-Message-State: AOJu0Yx9pdQ37/q5GKYapCtsR72xNSkqNduZT/E17IvpmbkZBT2V9oR/
	J53PJ+7IbHuok/Gd+cxHLyzUPuHP5TSvFxNd7HJBSp25mHMZGN4aZD+7BUj8y+kzh+i5w22F6Qj
	D
X-Google-Smtp-Source: AGHT+IFynhTQKYhGLVqq9tzOLefAbg6pvPdrY7Js09ndbbQRoPATwuZA5uMChfo/Z/iZi0Iyg0pr1A==
X-Received: by 2002:a05:6402:3d5:b0:567:6c77:dd43 with SMTP id t21-20020a05640203d500b005676c77dd43mr2764585edw.18.1709641282826;
        Tue, 05 Mar 2024 04:21:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen/{RISCV,PPC}/xen.lds: Delete duplicate _erodata definitions
Date: Tue,  5 Mar 2024 12:21:21 +0000
Message-Id: <20240305122121.3529541-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is bad copy/paste from somewhere.  Retain the second _erodata symbol,
which follows the Build ID, and matches the other architectures.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S   | 1 -
 xen/arch/riscv/xen.lds.S | 1 -
 2 files changed, 2 deletions(-)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 030e1ee37b55..05b6db272805 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -60,7 +60,6 @@ SECTIONS
         VPCI_ARRAY
 
         . = ALIGN(POINTER_ALIGN);
-        _erodata = .;        /* End of read-only data */
     } :text
 
     #if defined(BUILD_ID)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8510a87c4d06..ace6f49c579c 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -60,7 +60,6 @@ SECTIONS
         VPCI_ARRAY
 
         . = ALIGN(POINTER_ALIGN);
-        _erodata = .;        /* End of read-only data */
     } :text
 
     #if defined(BUILD_ID)

base-commit: fc84b4a5a37b9250d87ef63983b48e1953bba6d1
prerequisite-patch-id: b14999775a3dc222f2f94d7d5d7a1db377de9cb9
prerequisite-patch-id: 00650d75df673992b4c8cb6d7ac61dab72b9b309
prerequisite-patch-id: 5464f5f1e7448cde38749a3744c9e74708727dee
-- 
2.30.2


