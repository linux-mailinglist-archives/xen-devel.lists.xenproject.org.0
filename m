Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373331FDFA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87026.163974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kH-0000jJ-Uo; Fri, 19 Feb 2021 17:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87026.163974; Fri, 19 Feb 2021 17:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kH-0000in-Or; Fri, 19 Feb 2021 17:39:13 +0000
Received: by outflank-mailman (input) for mailman id 87026;
 Fri, 19 Feb 2021 17:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kF-0000hU-MR
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1f7240a8-73a9-4cca-85ff-387540f20d63;
 Fri, 19 Feb 2021 17:39:11 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-ekoA_y90MHWIh4Fuavl0tw-1; Fri, 19 Feb 2021 12:39:09 -0500
Received: by mail-wr1-f70.google.com with SMTP id x14so2174132wrr.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:09 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y62sm15299048wmy.9.2021.02.19.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:07 -0800 (PST)
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
X-Inumbo-ID: 1f7240a8-73a9-4cca-85ff-387540f20d63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQ6bR9q2nTx8UZfcCwDp8YyWJ5IdPylW4EMLv5ePnSc=;
	b=aiIBXvVyVz8UZbKJ1VRMWUICNBGe/Ged0aq2gyJIxKbrGg/y/4qW6C+GOeGtIqz8jtKocz
	5JzrOWvPQ7Ac/lyOQZIzNKA0PophRMhi2pvyfybwaAlU4CSSoR35XxHQdA1Qhusxog216A
	8gIlUEBGhNHKT/IFLkIGd8rknRMOg3c=
X-MC-Unique: ekoA_y90MHWIh4Fuavl0tw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQ6bR9q2nTx8UZfcCwDp8YyWJ5IdPylW4EMLv5ePnSc=;
        b=CLxTCie4VOtz5W6EPAKmJABfLK0Vs8Tl9DU4erhE6tX+WxrprBzBPbYv08qdhRv1P/
         J/Lxx/lncNu7G43K4oIT0P+xV0JqffjaFcGxlhw7MfUtnMblm5o8aswPJY0UsaoA8eNX
         vBi2bFW/5QT3Bj4Kk3AqODwy+Hwnd1fG52qiQ1hrA2nrBJ3xSkXOLMl3DBQjinS8t2c2
         Ie2A18KpSid+S5LObd4UiWHx/bR5GC+J6bdUDDVsjjySWtRuHahvT1nCnf1snxEWbV/d
         EKc+/P039U8Azm8+Te3pepeTer6kxc1PAH7irhqEoluCHRYnPSz2afcLAW1DISpbVDdT
         mdyg==
X-Gm-Message-State: AOAM531E3m0Stii7/DF7ZVrfYJ92ReHtEmrwYITslbdp65loHJzKzrut
	ebyDiD1eZG3zIKcuJ7dEGa21pIdPOg16+pUpuVnsQTQCmluKdURZkxKVueRWcsb7wO2EZx9m46O
	w7dEsz4cbz83/SdO/Ol+pTE0rjKA=
X-Received: by 2002:adf:b342:: with SMTP id k2mr10246398wrd.264.1613756347931;
        Fri, 19 Feb 2021 09:39:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRIsqLMFpNjZYF3WUU2UHyYdzuctCSQdLydicZwE25C3zYE3MQJaOoIUNZctaN8YvHWyznKA==
X-Received: by 2002:adf:b342:: with SMTP id k2mr10246368wrd.264.1613756347790;
        Fri, 19 Feb 2021 09:39:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 03/11] hw/core: Restrict 'query-machines' to those supported by current accel
Date: Fri, 19 Feb 2021 18:38:39 +0100
Message-Id: <20210219173847.2054123-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not let 'query-machines' return machines not valid with
the current accelerator.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 44e979e503b..c8630bc2ddc 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,6 +204,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
         MachineClass *mc = el->data;
         MachineInfo *info;
 
+        if (!machine_class_valid_for_current_accelerator(mc)) {
+            continue;
+        }
+
         info = g_malloc0(sizeof(*info));
         if (mc->is_default) {
             info->has_is_default = true;
-- 
2.26.2


