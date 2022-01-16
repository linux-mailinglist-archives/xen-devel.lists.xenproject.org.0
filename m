Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A546D48FD13
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 13:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257896.443412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n955k-0000bC-2P; Sun, 16 Jan 2022 12:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257896.443412; Sun, 16 Jan 2022 12:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n955j-0000ZM-V4; Sun, 16 Jan 2022 12:57:03 +0000
Received: by outflank-mailman (input) for mailman id 257896;
 Sun, 16 Jan 2022 12:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Sa2=SA=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1n955i-0000ZF-E9
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 12:57:02 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb6fddfd-76cb-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 13:57:00 +0100 (CET)
Received: by mail-wm1-f50.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso16240525wmd.5
 for <xen-devel@lists.xenproject.org>; Sun, 16 Jan 2022 04:57:00 -0800 (PST)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id bh26sm16973287wmb.3.2022.01.16.04.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 04:56:59 -0800 (PST)
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
X-Inumbo-ID: cb6fddfd-76cb-11ec-a115-11989b9578b4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MmkBAIaQ84NO7AayUarLYyz7AgzdMhXb8fd0CwRhJkA=;
        b=f2OKy3OMPqow3WqMNJNYO3aSTGBEp3OuFq2gBJwgEuQT2TTXUlSDgegnKHhK01lPtU
         hO21TKsSeplVZ/IA4OTBXVCiSqq9MemTj7M2gG2x0EZHOu7yrqyic4jDOPLZYkS+jCsb
         eOQp0ZPTgJlxZmmmAWtba3FeO67ZYIUl6nw3PaxSxTpv6nEYnzrmfHvUKo9VL2rIi6uo
         sQG2eAZMTxOw92L4B56a5m/aswLoLZkcaUe0jkNwZZW/7Ctrcoj4neZ1seqYYL7KIvM2
         emWMH20iTxGnyFW8VkXqZm5cbBKXCu+rIhYkyM5VjOBmibM5ZrtLPbtwzqBmBiGmNch2
         h7Dg==
X-Gm-Message-State: AOAM531wglD0Md3aG3bhj1xbIsVJycCQ3UkS6Sraqq3fdZCQqch5ch+8
	3K8GydvnrMEgx8Jo3aWYpncK/9ZnHFg=
X-Google-Smtp-Source: ABdhPJwq0qF2GjWdDIc/nbnCfKGPXapjljm2kn8dnzkOhHLsJYtn9Slq3lPqsUAigYFV86yuUhzLLw==
X-Received: by 2002:a05:600c:3acc:: with SMTP id d12mr20445739wms.85.1642337820182;
        Sun, 16 Jan 2022 04:57:00 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Config.mk: update seabios to 1.15.0
Date: Sun, 16 Jan 2022 12:56:48 +0000
Message-Id: <20220116125648.1200259-1-wl@xen.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wei Liu <wl@xen.org>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 1c1998a5a8e0..38e88b2927d2 100644
--- a/Config.mk
+++ b/Config.mk
@@ -233,7 +233,7 @@ OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9
 
-SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
+SEABIOS_UPSTREAM_REVISION ?= rel-1.15.0
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 
-- 
2.30.2


