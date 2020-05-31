Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA71E9980
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRuy-0003a3-4R; Sun, 31 May 2020 17:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRux-0003Zp-AH
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:39 +0000
X-Inumbo-ID: 8711ec9e-a365-11ea-8993-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8711ec9e-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p5so3252345wrw.9
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dv8k9OvX0sGDM6SnC2SEv28YQ5tgOTM9QioS6R+rf/M=;
 b=BVSryTZWMKqgtf1QMR74iA2a1/KO4Uy3SphIAK8LPJsyPkwckWfXDNibM+axg726DZ
 SOxrLOGVIxjQO1zqPrMp0H1sgXw3bFO+/tNCygs7RSfe47FZ6fzyl8luYeaYKphOjkVi
 OCMSIO+jJyhY8KvoRpSZImqE+0XAVhWggJCSkSwrg20N9ndbq6O399AVmjDCPvyP/Tb5
 dlQa2RKuW+AN6SwcOGxhziuKVbffRnR2ra0pRvolwWtCNXZiQU5hjwUjw+a/RC3Dn5mu
 mqyABHZCPs1C01fLaMueU7HT+U+bbJ4chOlXdK8XgTkduVhjcj2+7mnalCo1xT6WZsXh
 tIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dv8k9OvX0sGDM6SnC2SEv28YQ5tgOTM9QioS6R+rf/M=;
 b=E8uFG/M3bg0MjrJgGhZMlFUAKFer3Se64X+zrIi2niMtkWibzmGZZFAk8NV28Z5vFZ
 OWEsKm9AXS6LQ2EcfmP6dBZ2eabp0yPJUj4f94E7ygsA5EEM6uiTCX8UU6HPqxk2XdQM
 oVu10Ltn/nnscAF3d6pOiVc2h5CVODsz2pcaBGABgZujfALsy6DVbhp895GA8F/KwB6Y
 eN5uQohn/L9pHyl4L+4ugdR86aaSMUo7h64aAH9+13ueU1zPZ0uI9mG4TIf8tQoSTqNu
 6i3Z0fxt3Vi+8L3/lf8y+AcVCi4gnxhX/8007FZGvYdF6dFBwynJu0KQEPYTJcDDPhLa
 32TA==
X-Gm-Message-State: AOAM532O9SJ5NLQ/beZB+Kp9GSYRVW2XZc37lX+prX2+UdrEoslqidTU
 NyG743IjmBBWxu3gXMDQ6mE=
X-Google-Smtp-Source: ABdhPJwiBhhdiSv5xipwUBmxFfUuE7Js6srJ5I4x//n2LAjphXaXilwy/UiUFaG7+ZnnplrFb1ATaw==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr17874609wrq.362.1590946703877; 
 Sun, 31 May 2020 10:38:23 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hw/pci/pci_bridge: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:10 +0200
Message-Id: <20200531173814.8734-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

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


