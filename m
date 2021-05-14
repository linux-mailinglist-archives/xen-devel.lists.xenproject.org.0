Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B738101A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 20:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127485.239608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwt-0001mH-Hp; Fri, 14 May 2021 18:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127485.239608; Fri, 14 May 2021 18:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwt-0001jq-EQ; Fri, 14 May 2021 18:54:11 +0000
Received: by outflank-mailman (input) for mailman id 127485;
 Fri, 14 May 2021 18:54:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcwr-0001R5-ID
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:09 +0000
Received: from mail-il1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31d89682-3904-4638-b714-9e0170676e68;
 Fri, 14 May 2021 18:54:05 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id r5so625109ilb.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:05 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:04 -0700 (PDT)
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
X-Inumbo-ID: 31d89682-3904-4638-b714-9e0170676e68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZyiRnb9WVtOr1miy5zSjmis6+BOGxMggG62SA/umH8=;
        b=eJGco2a1tomoj6gw/zyZjjfGUagfbHQEckqHj6YRKZQbiYMoK9bCjFDBqZgAztQktc
         Hkd6n5m8LtxCtw4q8UY7hrru5QsaZ8FHT32W5bsmJPHY+zIzmvHIaKwiLaSKCmMcehv1
         qcIMb1uUuImTwGfHO6QNlR/2dmbwJGj8c24PQ79p8xnUANJvdG3YskahyT3dEaQY/Xaw
         vafYkHMjhp3knJhThf1q92mxfWPKmudE+y1Vq7NNatoRZrKEYDbWB+IKQ1G9zsaQdRpN
         2UWS1tQ4C+xdpm0hcp2aEjNkrDK4tnLtk6MZ0K1F3CP2m6FONzQ3x3HQxSEh9rrOpcaK
         GSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZyiRnb9WVtOr1miy5zSjmis6+BOGxMggG62SA/umH8=;
        b=jDxpHxMmIE5qwWUJ6KfkBG4cKXofC6qmArFR46RLOUf8jvNOLR3D8G2kbvNuqgWAnc
         6qpjW+wrREepsc+t/S6mNznyTe0rCvha5HraWxuIGXMGRQPDLuquYvir2e0nzMuzbKke
         UNSVy2PXRNQvO+QWkn9TAwt4QhfDBZMwCIHtA/l0uvphhUP6VM3qExM/fjVap/F4TbjE
         gTjOkLgn4aDDh1dOwJu1cdTeIUd9Pc84Nvd24WhntqJ7sZud65doWclQFgScKDGkFLIk
         JZw2o9+f34OUdNmPpkdK65Ii1cAreW8Z0h0sHe/Hdr+QwHN9PrsxXR0lccsPFGA16fTo
         cmUQ==
X-Gm-Message-State: AOAM533M2BKZLp0dNgvcFm63/9qM2VoQkQLWabXNPP+uHXe0/cGGSsQN
	gN5o4kyVVunduYbSf3/alrgZRU3wjF8Z7w==
X-Google-Smtp-Source: ABdhPJxORXVTkCb9xQ/n10JtvuniniP2lgIXzB4QiGFKmbPlpndKtHWiUIW2Wfn+lytSZAbzUlQEog==
X-Received: by 2002:a05:6e02:1545:: with SMTP id j5mr11038056ilu.35.1621018444806;
        Fri, 14 May 2021 11:54:04 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/5] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Fri, 14 May 2021 12:53:21 -0600
Message-Id: <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/drivers/char/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..b15b0c8d6a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,6 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
-	default y
+	default y if (ARM || X86)
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
 
-- 
2.31.1


