Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37A78C7A5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592334.925030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznx-0000sz-UK; Tue, 29 Aug 2023 14:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592334.925030; Tue, 29 Aug 2023 14:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznx-0000rF-Pu; Tue, 29 Aug 2023 14:34:53 +0000
Received: by outflank-mailman (input) for mailman id 592334;
 Tue, 29 Aug 2023 14:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8Qf=EO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaznw-0000r3-8H
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:34:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364adf1a-4679-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 16:34:51 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ffae5bdc9aso7114398e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 07:34:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 21-20020ac24835000000b00500a2091e30sm1963770lft.115.2023.08.29.07.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 07:34:50 -0700 (PDT)
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
X-Inumbo-ID: 364adf1a-4679-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693319690; x=1693924490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUlNTS1bmBEqtM4LMhzwtXR0cEz+6j/3Bg53dCx8Qu4=;
        b=qmpojKLEkKekj6BZ0GGpE1SRfZYp5/a62cWqt1IbG/6afcZxHbWg6ZV3gx8hSpZ2lq
         ypesuoy1VQuvzUTzHpPthQnpkUJBcAXhCjHp9CSXGMDHa8mMLimQpKr4WsA1YgLkHcnb
         vg0WF7c2liVo/yE+9bvl4ykfc7u+VqAGyV95xu6X0Nj0dw418rs71MP+nbqO7eyimC1t
         +yRIcBdFbiyz4aqj1t+9O6PwsfGJkD3BDgpNUnrAqz5cSEa06TzLE/h9tSXeiCGLF0IV
         5vHM8mZbUFh8YC6rwE1lpfFNrDSXespJPvOVBTy8V6S4HOyMwXgcW22sOa9QUK3halGp
         K/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319690; x=1693924490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUlNTS1bmBEqtM4LMhzwtXR0cEz+6j/3Bg53dCx8Qu4=;
        b=JRldaiYFydpyOlQ8MZeOU3aRsN9hYlRCtTt3XZw/E8f2ljv3m7XOgNMeg+KRg7XF7R
         OFp0RCye5xs9XP8kQNzpPDei6twPYunwYgNS7MkN479vq8sej3ZszU0HYvKEBIZKbbgl
         eGRagQejyfMLtuaSjdMnVlbG9IyZ8vG4q7CB9xhW8X2i9NVpX8KmJPkhaRzy46JG+57U
         KaRDySPCRqDxyV44f+kQ7xOSgWPMPiK66D07PpFuC9W0lKVfQG9SOebV6zPKrTP+GbbD
         B6rI4q/nAQSegFEb2uUcCfhd+VTj3VObJkKa55F4k/mKtkoFTCQ/HnZB9s5gtyITjkKz
         +FTQ==
X-Gm-Message-State: AOJu0YxweIJ2ViOiUeM5aULxFdvjHx1U0+sN9qXm4OThFQJKefzuoKCe
	RQBZa7EiVo6RczTZpic26PeNeMtrSVU=
X-Google-Smtp-Source: AGHT+IGHyPGbLk7gXCfuCP0D67FNj04ATNHeW9fe0ChkPFYkrGC2+hOR2Ez9eRetrgarr7bKeaSF3A==
X-Received: by 2002:a05:6512:12c4:b0:4fb:9712:a717 with SMTP id p4-20020a05651212c400b004fb9712a717mr22639647lfg.13.1693319690287;
        Tue, 29 Aug 2023 07:34:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] xen: add stubs dir to include path
Date: Tue, 29 Aug 2023 17:34:38 +0300
Message-ID: <09fa701d2be02589cc9f63d8334082346b5c1702.1693319118.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693319118.git.oleksii.kurochko@gmail.com>
References: <cover.1693319118.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stubs dir will contain empty/stubs generic for all architectures
headers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed.
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index f57e5a596c..64c3542c84 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(srctree)/include/stubs
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
-- 
2.41.0


