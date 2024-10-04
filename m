Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD699005A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 11:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810247.1222939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swf2D-0005qp-0Y; Fri, 04 Oct 2024 09:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810247.1222939; Fri, 04 Oct 2024 09:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swf2C-0005oA-UD; Fri, 04 Oct 2024 09:55:40 +0000
Received: by outflank-mailman (input) for mailman id 810247;
 Fri, 04 Oct 2024 09:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swf2B-0005nI-F8
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 09:55:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6d157b-8236-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 11:55:36 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37ce14ab7eeso1611954f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 02:55:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104c75b4sm200968066b.202.2024.10.04.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 02:55:34 -0700 (PDT)
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
X-Inumbo-ID: cd6d157b-8236-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728035735; x=1728640535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzFi01ZFHHEu7FaARB4F4ZRxCS6RfmPm39Tq3Q1bTWw=;
        b=DY8NbrlsY5DwwL0zEdxz0zQAQQHGqpCrGlPv9FmQwMyyRNnB+uDThSvswIADWP+7tf
         H0lPA3zruy9UlZy5EYOS1n2h03p1QFwQ2Rx9aWHMmniRLz+OnTU4zHHS5k5ksX1sN3Aj
         PnnLf6xQICvf8d5J206p6YGmdCKVriqLjTHMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728035735; x=1728640535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzFi01ZFHHEu7FaARB4F4ZRxCS6RfmPm39Tq3Q1bTWw=;
        b=Nnmmlc5yq4WVQZ15uIH9c42M7blHDuf/vKecudEgaofVLCLeMm+0bcCZnJj4bVzKzr
         Ek08qjf0ccdrDklRdULxJErDsSaVEcnFb8vElLOOdyQDzGnffvX/k5hennkAH++kEtnp
         bk0xKNBHeFrQH1Ur8p7Jrf+nvoJc3R8pZKADImHNuLh+2xF0U1oc9ZSCsV8UtH/RvsGU
         XqOzOFN7zeI3D2EL51V5k9XCiYH92RYF4kKLCq8wz4iq+2fO/7ev/XwpNSI9Adogdvkk
         gO+aqe73NCUAvVM9ClCn0V64wEQvgvi0+9pcj3J23zy8U4pP1HIwJeL5qeboVA7WKY1G
         UyBw==
X-Gm-Message-State: AOJu0Yx5wQEWQI6XcUrLChh03KprvMVRMDjD0JJeiH477tnC9Ko3OnFq
	TuwUXO1LscThPXd8aajVRql8dthu++RW6bF+wec4cdu88lJk2gOrHqu1RTTh1FpilYEmOyKFTOo
	9
X-Google-Smtp-Source: AGHT+IFEl87T4x4slYP3lPu/6a0cqpoSAdT/an35en90ezbVeYwnDOUPHBMSDesaEfYt9sV8GuYOlg==
X-Received: by 2002:a5d:50c2:0:b0:37c:cda4:a6ca with SMTP id ffacd0b85a97d-37d0e72b9e6mr1892515f8f.17.1728035735047;
        Fri, 04 Oct 2024 02:55:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: minor file line updates
Date: Fri,  4 Oct 2024 10:55:26 +0100
Message-Id: <20241004095526.889790-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"xen/arch/arm/include/asm/tee" is a directory and should be terminated
by a slash ("/").
"xen/arch/*/include/asm/*/mem_access.h" did not match any files
from shell, all "mem_access.h" files are directly under "asm" directory.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0ebf0939..13d718f7f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -517,7 +517,7 @@ F:	stubdom/
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 S:	Supported
-F:	xen/arch/arm/include/asm/tee
+F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
@@ -545,7 +545,7 @@ F:	tools/misc/xen-access.c
 F:	xen/arch/*/*/mem_access.c
 F:	xen/arch/*/*/monitor.c
 F:	xen/arch/*/*/vm_event.c
-F:	xen/arch/*/include/asm/*/mem_access.h
+F:	xen/arch/*/include/asm/mem_access.h
 F:	xen/arch/*/include/asm/*/monitor.h
 F:	xen/arch/*/include/asm/*/vm_event.h
 F:	xen/arch/*/include/asm/mem_access.h
-- 
2.34.1


