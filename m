Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EACE9D0F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194175.1512607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7n-0004L6-Nc; Tue, 30 Dec 2025 13:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194175.1512607; Tue, 30 Dec 2025 13:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7n-0004Ia-Gd; Tue, 30 Dec 2025 13:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1194175;
 Tue, 30 Dec 2025 13:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7m-0004Hp-5H
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9058b66c-e586-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:50:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so61479945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:56 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:54 -0800 (PST)
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
X-Inumbo-ID: 9058b66c-e586-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102655; x=1767707455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYBfgeYkXFs2JqwcJcMeiu4Xt+bQnFiJZLerrgLP0nQ=;
        b=izpVbiUZyAyrTTYVHQGEItgetepm+fzsi88ihswhr2n5ZzTQ4Hytm0o7RNQfWUWZJ3
         lvMDjBJ44kzkUT7BdNSdVsoNJs93BMyVhc0KZa5col4IewDLo7PMhpao9tc+NEchNMca
         8Pe3tQoqhb/lJhQoGtYALJDf3PwCyDc6JT6rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102655; x=1767707455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYBfgeYkXFs2JqwcJcMeiu4Xt+bQnFiJZLerrgLP0nQ=;
        b=vZ7Asnae43BoTPQ58SYYTa9mvD7oc0MQVvnTO6/OC80Ez8rmrVF5azYTIR5OYzijud
         Yqcg7b0Kej0lZwrkSkE3q7+kjx8c70aPwT51SdNotsjrbQQlGS68lDoVnqCYtimFo+pW
         ieh+PjDPB5tihxy+qsyV0cb22qeNd0F5oA7urSROzURFDrLtEnPm4Nti+Hn0VTY1Es3g
         Z0m6ku8orU5/8bGi5EQFt5nGMTKwVh87WyMbazSVr4pu6guTXmQuzgY4XIU7EY3r99P9
         V0ljRB0ty7diCgIYG248BAT2rStcX0zXEwGeB1/GA/VWCIMAZrylpEa5T84Eq5J6Y/Xx
         i7Sg==
X-Gm-Message-State: AOJu0YyLDwcadxPx7kB+mtw73I3r8wXOSLpRuMS13ryOJvQePza2NMg/
	QmIFrRWMXq/H2BBzHxDsGMxYJ7pyrX+5Y9knT7ji1+wkQJjwQsrmObfRHWPS3ejoewuXk6qZ4/4
	2nie7
X-Gm-Gg: AY/fxX49jt4496orboAF87ewfdWvohV52yhLnpJs/QqeigglcxzYW7xLsR9i5u4+/Y7
	edJPzPNtdtRcK2vZ0TyJTWkRi+B4l8OML/Joh7sbg5q6E4Etlg++JO+XsPlbCvJVunvMfLeey5l
	toagfCVZY6P0d1d/tD7mVwqTRohHw4y02sqH+xYp+2n8sakQ2PhsDyNwAgMuHS3n9Phko8QYD6Z
	YKGcjNDNfECmT26Fl+rsj2wUT0lFkmhmB/uAGpNCwX5pkXiFQ5r8nONd74ZnNzrlSk1xxHfY4TC
	QbyH7JeReMQ6CBWwiQ7RKAZtYp7r8Fg0QCWdMF97plU7cuSFGQgaQVlrcB2C7r/rjpzYfxQsB3t
	lWyvvtcPlAt3eLntNMa/wutHCi+gYQXhiGAJRe9lUtmgAGSR2gOycmM7nKRfLX/VC3gf9dWDF6k
	iLKa6vX3Ym44B8QT3T8tQ/gvDU9WmrQIAi01VkMnnR6T3BebavPtBBmJUV9bLs5A==
X-Google-Smtp-Source: AGHT+IGxPFz0/stvHz7GQfWtCzy3oHV6WfJm4ey2uSL3F/GsksQV6YA/+Rpmm3G3SOyxNE0g7JyK0Q==
X-Received: by 2002:a05:600c:444b:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47d19549625mr351100915e9.5.1767102655140;
        Tue, 30 Dec 2025 05:50:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/5] xen/lib: muldiv64() cleanup
Date: Tue, 30 Dec 2025 13:50:45 +0000
Message-Id: <20251230135050.188191-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split out of lib.h, remove x86-isms from the common library.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2237126270

Andrew Cooper (5):
  xen: Fix endian handling in muldiv64.c
  arm/time: Sort headers
  x86/time: Sort headers
  xen: Split muldiv64() out of lib.h
  xen: Move x86-ism out of muldiv64.c

 xen/arch/arm/time.c               | 21 ++++++++--------
 xen/arch/riscv/include/asm/time.h |  4 +--
 xen/arch/x86/emul-i8254.c         | 12 ++++-----
 xen/arch/x86/include/asm/muldiv.h | 20 +++++++++++++++
 xen/arch/x86/time.c               | 42 ++++++++++++++++---------------
 xen/common/bitops.c               | 12 +++++++++
 xen/include/xen/lib.h             |  2 --
 xen/include/xen/muldiv.h          | 26 +++++++++++++++++++
 xen/lib/muldiv64.c                | 19 +++++---------
 9 files changed, 105 insertions(+), 53 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/muldiv.h
 create mode 100644 xen/include/xen/muldiv.h

-- 
2.39.5


