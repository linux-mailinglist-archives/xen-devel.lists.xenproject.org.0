Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F703308D96
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 20:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78454.142743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ZhC-0005nS-HV; Fri, 29 Jan 2021 19:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78454.142743; Fri, 29 Jan 2021 19:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ZhC-0005me-Bl; Fri, 29 Jan 2021 19:44:42 +0000
Received: by outflank-mailman (input) for mailman id 78454;
 Fri, 29 Jan 2021 19:44:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fGyx=HA=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l5ZhB-0005mE-Lg
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 19:44:41 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5ac8c5c-63b5-4ecd-942c-f0681a3617ff;
 Fri, 29 Jan 2021 19:44:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id j18so7694058wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:44:41 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d2sm15407260wre.39.2021.01.29.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:39 -0800 (PST)
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
X-Inumbo-ID: d5ac8c5c-63b5-4ecd-942c-f0681a3617ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BM2y2J4KyWJi5sMWebJJS4WoG9B526AOKXXQVUHBZlw=;
        b=TaUDDLqD7Z3Ndo3PPEk8aaFyX8c6QcgnXzsURV4mFR+jOf6oUCbYVs5w9y+rjgcJYc
         e/0CVH+wlQn0VoPPB2fOJ/Pq9aK42DYqrdEah3eTySPnvY27AqUXb6U5bQEDPmAZS5W/
         Xx3YRn/FvO8vaNT6cBr/G3ddUU3NrgBwKmOuYOyKNukX0t1Yx94EdWQVuox4ZXbngoQa
         3MXZnbIk5QlqOXCHm4rfqn/1qxJoaAhZMT/k+iP4fqqnhzJ8fP6Yi+nMnvuEw1Uv+EPl
         +W0xeioTLhLzdBEQPY/GgXRe7z3NRFrHXedWgzDAECZIVoFPkU2bLRAr8gQi5wEDFmNJ
         LRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BM2y2J4KyWJi5sMWebJJS4WoG9B526AOKXXQVUHBZlw=;
        b=c4KU6crnGYS0T7q97yG9nCKl2bt2ikElMuUh4Vs+Ko61bopcRXhCfZmwbQJZ1mk7UW
         qFGRhhrCfvMyXL9FsCCBfU4gIgh2aAuJyRjIlEuASKjUK5TsGrklekn1ABeKcQh4jE++
         ER/SqPnE/9U71UM16SH3dlRVsoSZBBOqgoRo3awjYjIacsx1tKm1Ajr8HhEYAR7O3kwr
         x3Xohg7czxAIbgUDNoRCRhfi/qkxfdIQr2iXfDrlysbwcVUsBEg0z/RIFNRcvCzYWRgL
         EL59Y8Kb/EwYoqYlBX73qqkxWcdrqKZHt6TzEhk2Keud4UioQrPI/S967ARP9JpY4MFy
         7r1w==
X-Gm-Message-State: AOAM530i1Mz7hvBXCMTTX+u/jJQw4U+EAz9md8T3DWmuDQyWHNdn8T+S
	EZR5C0EZSGUGoVp/UYvhohI=
X-Google-Smtp-Source: ABdhPJwqnigiA/nIJHI0fcSWc5nmwSpoWMxpACaoJ9FpYDh6CnShvhAIypR354j5EUS/kAyOr0cNrg==
X-Received: by 2002:a1c:7e15:: with SMTP id z21mr512555wmc.27.1611949480239;
        Fri, 29 Jan 2021 11:44:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 4/4] hw/xen: Have the xenpv machine select 9pfs
Date: Fri, 29 Jan 2021 20:44:15 +0100
Message-Id: <20210129194415.3925153-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

9pfs is not an accelerator feature but a machine one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/Kconfig  | 1 -
 hw/xen/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..b9e9a2d35b0 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,3 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
index 15944144a17..14009cd6a05 100644
--- a/hw/xen/Kconfig
+++ b/hw/xen/Kconfig
@@ -4,3 +4,4 @@ config XEN_PV
     select PCI
     select USB
     select IDE_PIIX
+    select FSDEV_9P if VIRTFS
-- 
2.26.2


