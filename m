Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43034399669
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136280.252754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaRT-0005tF-0D; Wed, 02 Jun 2021 23:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136280.252754; Wed, 02 Jun 2021 23:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaRS-0005qS-T7; Wed, 02 Jun 2021 23:38:30 +0000
Received: by outflank-mailman (input) for mailman id 136280;
 Wed, 02 Jun 2021 23:38:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaRR-0005ZJ-ED
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:38:29 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19cfe518-f0cd-443d-b221-ca53f475c0aa;
 Wed, 02 Jun 2021 23:38:27 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x41-20020a05683040a9b02903b37841177eso4051703ott.9
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:38:27 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id z15sm301633otp.20.2021.06.02.16.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 16:38:26 -0700 (PDT)
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
X-Inumbo-ID: 19cfe518-f0cd-443d-b221-ca53f475c0aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XGumMjGtg94IhtORkgOv43FTexceLATJry4J5HfIX+U=;
        b=l29U+8l1/SaCFexdatu2QaPv9YjzKWsUYJL2XWAweIgoXgcgB6hGAq/lv/7j/wo3td
         iss+1jpTy84C4b/+vV8aqhh5p+CGmV+9u7v5z0DOpvNhIdgenBu+Rkj3xonfeDjmEit7
         xQ4JqqYr3vf3CtxuMxYKQNaAFgz6QxEBARaxLLh67N8bWlE3mKHL0xHqvWD9asQpqaIu
         p/aP23SJlMm5IR7fDT8Eyt0boohscK1vGeMUrJYmqWjqDhbiMiaqHzMGN7N2LK/oyzMY
         mDAx1gI+i4lLNQXfdWiudmMr016EDVwO9MefLYog/Pz+rwqODBSvlmgjD/7poi1qb/Ig
         Z4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGumMjGtg94IhtORkgOv43FTexceLATJry4J5HfIX+U=;
        b=b8lIn92hX05W61X+zapVKYtloh9Su+wHuCXsjhbGv6OEOPVqpn6nmcpSCCfU0NnWOx
         LBo53/IZgBH+8VbEFaPgYwgW7fUNxBQ7Upv0oY5HpRIE9gchZaKs8qR3FpIb+amGY1QP
         0SHNsVR+6CQ36bHMhOqn+61SfKMDOzm6zA/w0bQLb/mSP+s5EA+/g4l+vFgABkfCuuqx
         PK0KvCDEjEUSGgS2eTUhoOolpA5N9xPiZA/pUuqYg8fjI3XocZt/cJzFFsKie74rZC2E
         TmWC0b+qCoNVQBn/8q4c2UDvZL717yiL+yo5PsOrmOhAuACWTPf2Y7jPoaeKeb8wcue2
         nUIA==
X-Gm-Message-State: AOAM5319ZormXQxa6WL5pmeQHqFdlNNa71ijhqATo9gY03D/jkFpkyHW
	dyMQ47IPPiAa4ZiG1/R+SPcb9QBiUxSm8w==
X-Google-Smtp-Source: ABdhPJy8zR/jCqTi3XYkmniIn/mLPkEPqqLViFpBtjEcj7s7YhPNEVS6KKy5+WJrnoJkc+q91lyrWA==
X-Received: by 2002:a05:6830:803:: with SMTP id r3mr27984351ots.237.1622677106833;
        Wed, 02 Jun 2021 16:38:26 -0700 (PDT)
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
Subject: [PATCH v7 1/2] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Wed,  2 Jun 2021 17:38:09 -0600
Message-Id: <d2d19b62bd2a570db97f2940e6152bf93dc01632.1622676439.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622676439.git.connojdavis@gmail.com>
References: <cover.1622676439.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..2ff5b288e2 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,5 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
+	default n if RISCV
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.31.1


