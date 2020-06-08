Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE811F1CB8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKET-0004gF-7t; Mon, 08 Jun 2020 16:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKER-0004ep-G4
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:39 +0000
X-Inumbo-ID: 79b4496b-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 79b4496b-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=LyUR2LmtYlw+ksuhAT1yGgjrce4DSADfuhbGMGOHDtEkdN6UUVnUgtCLGui9aFzIopFHVj
 8XSkUEjyqzP+fgdE4g/gh7UFVeBQgX/mMzdgzAdEMqkMkhxw9fKulm4lwWY4bxcqIIgXM7
 TVbYv5yctCIpqUWC+n+CayuEhXDhKE4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-4BxmoRxxP92FzDGoP6qjuw-1; Mon, 08 Jun 2020 12:02:37 -0400
X-MC-Unique: 4BxmoRxxP92FzDGoP6qjuw-1
Received: by mail-wr1-f71.google.com with SMTP id s17so7305839wrt.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=S8ZTdyOXVLHsWxdLWAV/Jild1kGQ5ez+HKszzKNTREG5nTJc3bUULgmwRO3j4ISock
 H3MgV75gYIR4i1ETQlWWqKPaeF4MsxtXHUTH3gQpdAH4bHblyJKz+reNkuNSq7rwUAQz
 4JMQFrjZ6aSTmYdFYT62pxiv4m/MSDMkCvRiGEsa9ToHWseD8lhpEONiIy7k7vTedbGj
 bsQFE2gDmezTVttzEntTnk/9eqPbXgx04qha66A7zr6lHlhXlKM7t3yAPTRcDspjTXSL
 bWL8bAMGb+d+cQuZ+CFQCxdiSuQ3wT4M6zo8dCy+UhxM6NgIy+7tAYAuhFTDcTsKhP7x
 hlGg==
X-Gm-Message-State: AOAM532MRUKE+OOKf5QztQ4jFMM7fQLVc9ip4zR1tfbOksoEuwpDJ+hO
 Mr11g2jR5sX1SwBHIxh8B7YaK16J5ssQApuEWpHq7WoGgqn88eL01kPFtV3wkyOcL+5s+X2KTgE
 Bq/Xc6qeJ1jWiaqqRzlcddzY79CU=
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853421wru.118.1591632155838; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDmwNfyaecxfbcj81e+/jUBcU6vumJ01a4QLGsVfaCgs3E8cqqhTSmTr88Achkag+c/jFzSw==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853379wru.118.1591632155624; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o10sm183753wrj.37.2020.06.08.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/35] hw/input/tsc2005: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:28 +0200
Message-Id: <20200608160044.15531-20-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/tsc2005.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 55d61cc843..1f97b82379 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -489,6 +490,8 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (TSC2005State *)
             g_malloc0(sizeof(TSC2005State));
     s->x = 400;
-- 
2.21.3


