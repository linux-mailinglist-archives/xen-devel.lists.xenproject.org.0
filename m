Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67841F1CAA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKE6-0004Kq-Dh; Mon, 08 Jun 2020 16:02:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKE5-0004KB-JO
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:17 +0000
X-Inumbo-ID: 6d183054-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6d183054-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=fefb/B0sEevutDY78MH/2UWOO1i+K3MTugRIojbNgaC0LB3ka6Od5kXlv2cFhVWzBordYC
 eAm5dOgPRh237pcCnOZMDQeM0dkczuLjQDMKXws10lrLJp31LXmSOhbVNmZM8LSWXBZy7Q
 ShFTX6ewNBX5+gNJpFhxAGvcnhBJ+Ho=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-6JOXoJevN4-h3qAPn3LDWg-1; Mon, 08 Jun 2020 12:02:13 -0400
X-MC-Unique: 6JOXoJevN4-h3qAPn3LDWg-1
Received: by mail-wr1-f71.google.com with SMTP id n6so7362787wrv.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=qIJSwZq6MaCdtM+OFrVraWnhVmweD5X+nrA/iEDDvIXdlux7CTl3cGZF4EgZXPUMh9
 P8J2A2n4G4t37bV1XVZ6kGCZ++C9Ckhp1VXYScm1TZ8UWCOekreNqsoVYg0ja8MG+6L8
 vArQhaHThmYT8KNyaaZKeG8sd1S1psZpzHdTJ6wWkNiDmJ0aE1M9xNh84YG5Sfd8MDpB
 wJJEZtebmHh0ZZtC73+bvoRGaTXAC4XIsPikm0lzWiSgx+fimrFT1dyGqMHNOI+f6H/g
 27y9+6Fa9MbD0tE47a3I5W0j+4goTo1b2z3sZR0JEV26MyaR9xV6s4837gnLU579LHZ4
 no2w==
X-Gm-Message-State: AOAM531EdbJAGjaPcM680mKiddNTuDKWoHuSMNz7SRakz7JgN32w9UN1
 xbd8ID2Tvhj4i2ja8vBdBzN+dWqn5Z5UYt1IUeU1qZOcax3GZfZNW4y+KaJ7rFDbv9ZM+HFUcEn
 SOob3TazSmFzPPuGNlc0FaKjYDwg=
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82461wmm.18.1591632132280; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvLE6gRX7XM83bmbZu8lLW6Zr2jKGWG6aII1A2AXMFr5e4D5cYkpsPFEEPHv3ro5n12uF+eA==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82438wmm.18.1591632132052; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z25sm31297wmf.10.2020.06.08.09.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:24 +0200
Message-Id: <20200608160044.15531-16-philmd@redhat.com>
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
 hw/i386/xen/xen-hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..a1163b1529 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -31,7 +31,7 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
 
@@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
 
+    qdev_warn_deprecated_function_used();
+
     state = g_malloc0(sizeof (XenIOState));
 
     state->xce_handle = xenevtchn_open(NULL, 0);
-- 
2.21.3


