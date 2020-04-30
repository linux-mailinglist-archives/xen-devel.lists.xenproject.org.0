Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFC1C0988
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 23:39:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUGtn-00007M-UJ; Thu, 30 Apr 2020 21:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBcg=6O=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jUGtm-00007E-S5
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 21:39:14 +0000
X-Inumbo-ID: 087b2726-8b2b-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 087b2726-8b2b-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 21:39:13 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i68so6432621qtb.5
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=I954QwFC86mA/2Znauymh9Jmb/Y7p8bIrTzd0TFH8NM=;
 b=XbbyGacKjyvNURl/ncRIru9ZGYao49z4dohVLC1aHGAeduvo6CzmnG/ntrG7YopudI
 8rbos926ZBoUzVgjPylKAwiIKoruRfOG7h//9FNBuuzwqlL3HnYDnd4xhBuweRj0aafC
 uwSCA7bkn0r0CRJVyqnlPirdwb+BHG2kddNs3LXGK2L2eYebtLSk33qzPba1IjqJxOYW
 aImZFm9rZ/6kO3IoyZJx7BdnvbBg66F9l4iTx+9PQ/JFmHHhkdjxipBHCGndIiqLGx6n
 6g4+g1usaJC/sLA+MJdjJwLOcmk4LSiog3Vu3wU/LEqkPlOcbh4tvL7QRQ5aAmWD25u7
 78kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=I954QwFC86mA/2Znauymh9Jmb/Y7p8bIrTzd0TFH8NM=;
 b=r1tQD3M3xbUtKbqgoNi9LMNy7LMTSSalXetX1kkHxgaES5ELnZCVGKiG+zc/FYInFK
 3JciL5uASeGVYAOHFknClSvO3gW9/cdHFZLIDQjylARtOIm+8S9qW5hfqHe6k7R+Kz/I
 JPRhw2EI88PgXMqow7Cjgdll78dyLfJiK/uv/vKnzTLXLHfB50/Dwr1C8c/SHwydJwCE
 Pqqgi5RmpylthVF5TgpOpC2nt+uGjZAoKfJZTzM6MC9bu2OixtM+Y32Pu3eNFRfAGchg
 gJQs/b9O+Z8nelIXHYsWCBl3Sg6QzEP28C1h2mURjaODHGTFIgjDQUya4JlfDVchgivF
 FUXA==
X-Gm-Message-State: AGi0PuZuJLhGoWn9jwRjgkoKDMIS89XAYnzwoucN2N110iNC3Zbz3guE
 8Dh9i6dkBkm4tE0bqNSJ7j3FWLfHllE=
X-Google-Smtp-Source: APiQypL+g3eOLzNH+E0UQc0KWvgHB9CM+ao2AttIYu+J1yA+crrD8AsFolbgNVZ4lsFVqZskoIXYQQ==
X-Received: by 2002:aed:3e8f:: with SMTP id n15mr607453qtf.241.1588282752123; 
 Thu, 30 Apr 2020 14:39:12 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b42sm922476qta.29.2020.04.30.14.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:39:11 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] golang/xenlight: init xenlight go module
Date: Thu, 30 Apr 2020 17:39:00 -0400
Message-Id: <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Initialize the xenlight Go module using the xenbits git-http URL,
xenbits.xen.org/git-http/xen.git/tools/golang/xenlight, and update the
XEN_GOCODE_URL variable in tools/Rules.mk accordingly.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/Rules.mk               | 2 +-
 tools/golang/xenlight/go.mod | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 tools/golang/xenlight/go.mod

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5b8cf748ad..ca33cc7b31 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -36,7 +36,7 @@ debug ?= y
 debug_symbols ?= $(debug)
 
 XEN_GOPATH        = $(XEN_ROOT)/tools/golang
-XEN_GOCODE_URL    = golang.xenproject.org
+XEN_GOCODE_URL    = xenbits.xen.org/git-http/xen.git/tools/golang
 
 ifeq ($(debug_symbols),y)
 CFLAGS += -g3
diff --git a/tools/golang/xenlight/go.mod b/tools/golang/xenlight/go.mod
new file mode 100644
index 0000000000..232d102153
--- /dev/null
+++ b/tools/golang/xenlight/go.mod
@@ -0,0 +1 @@
+module xenbits.xen.org/git-http/xen.git/tools/golang/xenlight
-- 
2.17.1


