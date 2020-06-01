Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8F1EA5D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRr-0005Ru-H8; Mon, 01 Jun 2020 14:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRq-0005Rf-LR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:54 +0000
X-Inumbo-ID: 5354e834-a414-11ea-9947-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5354e834-a414-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so45439wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WN1hnPJG9k0d4gUFGI62xXK6PTE3h6bC3clI/uY9zSA=;
 b=rQwXUg5DD3bZsQKBRP7+TLjtYRMRCkZaFS2Fc7UIHD4mZRBfDS/xiHu1Ue7JMj47lo
 YQCrXZP8AKSO/hQoXyFxRj5UVshxPxPHrfI8L5MRjJGqrtaXVeGmzmB9k3tsSYkegpHw
 rIZyb6oYca/YB/VWnAwFypBPoGjFMyWYhhvnp6dYTnCShgkU3DdL0ATl0WZqM+1xZXmC
 I1gkLtwqiSpUmsOC1Cw04fVuPZqiVTOd/bU8DnmQyuNBlhYQOcgvPtNCedgy/w67TQHv
 DYIcgr00vL3ihkHjppAsbuMqntmvih0rbRttVm6m483rOleYpDp9FZ9JTr7I1AgIraLC
 bcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WN1hnPJG9k0d4gUFGI62xXK6PTE3h6bC3clI/uY9zSA=;
 b=qfqkRYvNVHaoAxB55Bnii/mBzspbmaAzkPoqsjAuEtr8uLHqJ+dPMfzIjxyOHBCvCO
 XzE2yc7ltJiJBt7dWXY4y+6taQuYgSMEbZs6/A4g53Z6NvEgLnG3i474hdYcc/BtALlx
 yBa1keU8qAv9+2ZD5Zb70d9a4cfH4GcE7MkBUr67/eXaTGUoatipp4wwH3uejErSS45I
 dYHjnMdVVzLIaEVU0ewTVaQuIlYzznekosD+95hscYXXCChBk95d5LciNJxHPo54WCs8
 OZ5eVwBQybXTGiggY1FexL2c7joJaTSGGjyYMj5YFPCr9nl6pw6qsUsBeAi7/5lyie0I
 LIHg==
X-Gm-Message-State: AOAM533LSdUqQIS0dFzFDBtWK7QCwJakTtIPhdDj06RuOJHjsoh/KHbt
 R3fYv0QAeZLid85cACJOhzo=
X-Google-Smtp-Source: ABdhPJwfd+Lxug+8AxI6OGeoNfDT9lWckWHvnv1aj7LAWzbZV5sI6ke1Qv8+v6JK7sIfbYizrcdCeQ==
X-Received: by 2002:adf:bac8:: with SMTP id w8mr21300417wrg.47.1591021778914; 
 Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
Date: Mon,  1 Jun 2020 16:29:26 +0200
Message-Id: <20200601142930.29408-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3ba3203f72..3789c17edc 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -423,14 +423,14 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     }
 
     if (res_reserve.mem_non_pref != (uint64_t)-1 &&
-        res_reserve.mem_non_pref >= (1ULL << 32)) {
+        res_reserve.mem_non_pref >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: mem-reserve must be less than 4G");
         return -EINVAL;
     }
 
     if (res_reserve.mem_pref_32 != (uint64_t)-1 &&
-        res_reserve.mem_pref_32 >= (1ULL << 32)) {
+        res_reserve.mem_pref_32 >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: pref32-reserve  must be less than 4G");
         return -EINVAL;
-- 
2.21.3


