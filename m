Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6389C0070
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 09:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831519.1246835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8yCu-000720-EG; Thu, 07 Nov 2024 08:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831519.1246835; Thu, 07 Nov 2024 08:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8yCu-0006yp-B9; Thu, 07 Nov 2024 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 831519;
 Thu, 07 Nov 2024 08:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8yCs-0006yj-FO
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 08:49:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d39634-9ce5-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 09:49:30 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so104616366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 00:49:30 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17643sm63672266b.21.2024.11.07.00.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 00:49:29 -0800 (PST)
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
X-Inumbo-ID: 33d39634-9ce5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMzZDM5NjM0LTljZTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTY5MzcwLjU0NjI4LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730969369; x=1731574169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09SQ87ZB9lYkZ4opBgm3YjpRGD4piTTFwgGq+KVliIc=;
        b=T+Zemi8BzkRvKjW5fFHnE4VL4320FK+TucpvMpm5Apk91dhWteiBZKGUC/S9Xb52WU
         8w9ud9wm0qzoL+joHX5dAufTAaVDeZU4+uVXUmKyY28kQE9mkNtUanqPuvgcuL5EmMD5
         8NtHQafbPeZ/ejUbZ8cz+rBPrSV8/qcSH4Bsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730969369; x=1731574169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09SQ87ZB9lYkZ4opBgm3YjpRGD4piTTFwgGq+KVliIc=;
        b=iRcYmSdFI2SJcP9SB3aTH6qqxIqvTAOsoXKNQn4/QnDPhAflYEOh+X+EqA2pK2knkX
         jQmD1AbKZMbB2qrFp4LEblx4xC0XHmDJGtkWcnXXH8ONrKKUgz05nhJ1spQkI99FHNTw
         YaNdz7OhFPLXr+M5zAFaPpUUcl0R4u6I4W/GgH4albiK2Jigqv5DHNppHrC8f5ggnkDn
         qy8Cg1RhU5z/nr/IyT+7YJwj9w1QuN4TlOC/XtJfmuOK8DuPIV6+z58rRWZ+gw1VtSdo
         ZuPw5919/LTxjWffXE7TplD/ELFQHWiBIyK4pJFXSrlVJwxe9o8rJB/MTnAdZTh2Qnqp
         WC3g==
X-Gm-Message-State: AOJu0Yy0fjwpJUW8cOGSBpAw+NOGs9xJoonKHE1Jo+RZjUoT3ty2iUGC
	TJ9idDUGIKcUe7sBMX7LXVgg8pahykRb3J16sMAp0S9sntAKPsJNcYL4jjPZgM6MkdKoVyV8H7e
	I
X-Google-Smtp-Source: AGHT+IHKKRom8I21n8oDX4xAcaH2ltJu2AdHOpUtLNRiLPsXF/63kW4uMC7PagXvM3k65xu81OXg+A==
X-Received: by 2002:a17:907:7e8d:b0:a9a:e6:a031 with SMTP id a640c23a62f3a-a9ee7568a87mr16742166b.59.1730969369568;
        Thu, 07 Nov 2024 00:49:29 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/Kconfig: livepatch-build-tools requires debug information
Date: Thu,  7 Nov 2024 09:49:27 +0100
Message-ID: <20241107084927.37748-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tools infrastructure used to build livepatches for Xen
(livepatch-build-tools) consumes some DWARF debug information present in
xen-syms to generate a livepatch (see livepatch-build script usage of readelf
-wi).

The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
on release builds, thus providing a default Kconfig selection that's not
suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
because it's missing the DWARF debug section.

Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d92499a..f3135f85034d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -420,6 +420,7 @@ config LIVEPATCH
 	default X86
 	depends on "$(XEN_HAS_BUILD_ID)" = "y"
 	select CC_SPLIT_SECTIONS
+	select DEBUG_INFO
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.46.0


