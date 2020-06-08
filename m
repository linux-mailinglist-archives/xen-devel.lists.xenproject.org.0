Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6771F1CC0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKEh-0004uc-Bk; Mon, 08 Jun 2020 16:02:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEf-0004st-IL
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:53 +0000
X-Inumbo-ID: 81e1445a-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 81e1445a-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=dREsi8+9USoV9mqRVVqwwtnDzTxDqYdeauDbid0PtNqYUm1LW5HjOsYbhcRhq5l9b9QK4k
 X8yl9Mz00jJhpoBhf3W2lYQsN9IRv3ovhDvRWtueQHfCs1l8vxMna/hOjfrDEbJ5cYjyDF
 K4E+NkCxazqaS9FMtQLCVrk2unkEEqI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-5bUDAgB7NHK05YOvBySRwA-1; Mon, 08 Jun 2020 12:02:49 -0400
X-MC-Unique: 5bUDAgB7NHK05YOvBySRwA-1
Received: by mail-wr1-f69.google.com with SMTP id a4so7339930wrp.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=nJn+ko453m+tMkHFsstwOX3LAUsWaKIAtQlR6xH19uXM1R+K3EGxjbMiXjkA42ArVr
 ctOWyKhUIB31wgupDxhF29D+D36+GVnR6J8wB3+6yAlXRtvS4kN/9T739OpGd8RPc9MY
 wYAku6z5AdUnNVfPfsdcIdv0QRp/NLaYoyZyQNG5z4xjdf77ly83Jr1sHC2FiQnN91Hu
 wUJpQDPYhaYmsCQG06XSIyCfz5JNExpqYYTVG3ZLKny41X8ykZdhT+TvsPdhk/p7pyHM
 JP1tahwmXswfEVQzvuuUaQA64sUL8WVGvvouZ/c1b8b0ibS0qF9FMI9KkppEM1VJfXXD
 J67Q==
X-Gm-Message-State: AOAM532Utb7DuQz77kxJsJ0eBxSutV1o03QhyC78iKqtKtteJ/oiY7Bk
 gM7NVXXU2FOknX8ZnO/Kjxkceun/nCm2Ef0VOyJKPZbzMjjvzhjXpOEDXwSnQVUn9W9ogDpZHkG
 02PmkQllLeGAiJtXthEFlv/7BAWA=
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925419wrj.163.1591632168116; 
 Mon, 08 Jun 2020 09:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl0bue+F9URFV2MLoWaC0ni3jZ25V2PPkWtrtnwtHvWPF3nP5GuuAiBdquATZ2VeeHOXjWiw==
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925378wrj.163.1591632167963; 
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z16sm155794wrm.70.2020.06.08.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/35] hw/lm32/lm32_hwsetup: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:30 +0200
Message-Id: <20200608160044.15531-22-philmd@redhat.com>
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
 hw/lm32/lm32_hwsetup.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index de94de177a..f4a4d8fe4b 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -27,6 +27,7 @@
 
 #include "qemu/cutils.h"
 #include "hw/loader.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct {
     void *data;
@@ -57,6 +58,8 @@ static inline HWSetup *hwsetup_init(void)
 {
     HWSetup *hw;
 
+    qdev_warn_deprecated_function_used();
+
     hw = g_malloc(sizeof(HWSetup));
     hw->data = g_malloc0(TARGET_PAGE_SIZE);
     hw->ptr = hw->data;
-- 
2.21.3


