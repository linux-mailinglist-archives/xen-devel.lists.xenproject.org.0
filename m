Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710D254404
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFSX-0007ss-Li; Thu, 27 Aug 2020 10:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFSV-0007s9-KT
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:48:43 +0000
X-Inumbo-ID: 3ea800fc-3cde-4985-b89e-c8c3aa2df5bf
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ea800fc-3cde-4985-b89e-c8c3aa2df5bf;
 Thu, 27 Aug 2020 10:48:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a5so4900452wrm.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou6PcfrVc5dRp8NyE46XdDD5dZtuwfCS2v0rzwoiSu0=;
 b=tcJe31XgZeMr7R39jHM0635V+APx/yXrfyzJn6v27KzqCLCUCYrrs2SJ3wUqm8Hr3k
 pI/9GKe42en4+ZZ6eP48mRkmL22ZNsTfVXjFlrQfMKw4T6RiKUghyoxtzXJO34uL9IYy
 LratbfivWRSS9H4q9NmVp0AizMw+xlUqhy6jkoAo52bhvLipQD4yUiEfGt620upG9wKY
 sKAwof1CjBpvTgR9i7O3yV99i+XL/+sv8dr6rcUkwm2l5Jo2AFHViTvmSimvfzQCHdlS
 sJqebuvkqNdS9QHX/KGF2+4MypTl4dbjhwqbxYpnn94DG+mZxYwZkQf7e6ji/JIUJNb9
 NK/Q==
X-Gm-Message-State: AOAM5331hACCayu/rO+mA+Yt8l7c757qtXd1hU0IY2VXrAyiufBbSkni
 ikzCXZw/2dhtwUxRIDeyWQM7gxlP7jo=
X-Google-Smtp-Source: ABdhPJxGVZWUaj7QSnpsQBvOVyxnN3G6x85F6ooruC8FK7p7fX4Tg6sHraG3HAdkyMOVviGeDE5c+Q==
X-Received: by 2002:adf:81a3:: with SMTP id 32mr99964wra.368.1598525321836;
 Thu, 27 Aug 2020 03:48:41 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c205sm3270321wmd.33.2020.08.27.03.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:48:41 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] gitignore: ignore ebmalloc.c soft link
Date: Thu, 27 Aug 2020 10:48:38 +0000
Message-Id: <20200827104838.36072-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A previous commit split ebmalloc to its own translation unit but forgot
to modify gitignore.

Fixes: 8856a914bffd ("build: also check for empty .bss.* in .o -> .init.o conversion")
Signed-off-by: Wei Liu <wl@xen.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 36ce2ea104ac..0f03518f9178 100644
--- a/.gitignore
+++ b/.gitignore
@@ -296,6 +296,7 @@ xen/arch/*/xen.lds
 xen/arch/*/asm-offsets.s
 xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
+xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/runtime.c
 xen/common/config_data.S
-- 
2.20.1


