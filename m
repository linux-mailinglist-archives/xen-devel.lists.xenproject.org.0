Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54831FE04
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87043.164058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9l3-0001Tn-JA; Fri, 19 Feb 2021 17:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87043.164058; Fri, 19 Feb 2021 17:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9l3-0001Sn-Eo; Fri, 19 Feb 2021 17:40:01 +0000
Received: by outflank-mailman (input) for mailman id 87043;
 Fri, 19 Feb 2021 17:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9l2-0001FU-0R
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:40:00 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5c1ec71a-6762-4892-b815-30b495f60090;
 Fri, 19 Feb 2021 17:39:50 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-eeWd5OYkPF2IJSbFAA9Xsg-1; Fri, 19 Feb 2021 12:39:49 -0500
Received: by mail-wr1-f71.google.com with SMTP id w11so2794419wrp.6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:48 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm9098392wrn.86.2021.02.19.09.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:47 -0800 (PST)
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
X-Inumbo-ID: 5c1ec71a-6762-4892-b815-30b495f60090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23DXGFBg27YE0s/hCFn43oTEX31jOtnU+ISUArv5+bE=;
	b=FcHUbTFI2+D1UE2Q92T8b2JIM9nFTt/JKbFLOyM4TygNx1swzrCgcRrxf64R6wJTlRH7mT
	xFkytyvafaZHjWWHPzMiSJfkdUh85Nq25J787tsuIwr0Y2iWW8mjTF6L1w0bVwb/YBo2KA
	tixYyBWDLkU5lTbRlL8ZeHKf4LGWttk=
X-MC-Unique: eeWd5OYkPF2IJSbFAA9Xsg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=23DXGFBg27YE0s/hCFn43oTEX31jOtnU+ISUArv5+bE=;
        b=nT5UCHdQMCgrZtOk9VSin1CqQ4hbk2W5E/Pbks/rr6nq3jlzwAHHVN87Xyl1Sv/qbw
         puSV/zz8loKbOwuA4irabTO3Q2P/XTw3v9Cb204JbBSDOBWnxxs3G1sTHzduPe9njvEB
         sDlGllblw9jRDa8mRoO1xr1eTU1Aws4G+pCq9fMO8KyJIenpfSBJL80AkGSzj3XVCBr8
         HQNPvvQg/4FDtRDLPlsT9q4vdUlkmfFQa80L1bQGOfZeR45poLmXlNiLPmbnZ4mX4tjZ
         GWQpHLTnCzoFs+nvLgtWht4c2Rg0mYm9GEAqVMEsumcQomagLi911Uh8iOp+AXh3Mz5O
         5aXg==
X-Gm-Message-State: AOAM532NU0QB5PN1TKRyj3EjRpVQkqKBuBno4PPJRXw7fRSsncDMKBF5
	q84QSYMdKKoTqMb4TjFkx6hKzw3eY+TTf2wGnR7TIV9bczdvpRYdoz1HpAI67jALOujdImsrA03
	ZwIkSVMqlylW11FRAwXMCkWL0AoI=
X-Received: by 2002:a7b:c095:: with SMTP id r21mr3049566wmh.48.1613756387887;
        Fri, 19 Feb 2021 09:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiAWfgHRpHyAW3kKe8U38bgrZikJVMduVGw3sP0TrSilsr1/3Kg29a0ZDcfjt7MheizWAw2g==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr3049522wmh.48.1613756387730;
        Fri, 19 Feb 2021 09:39:47 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 10/11] hw/board: Only allow TCG accelerator by default
Date: Fri, 19 Feb 2021 18:38:46 +0100
Message-Id: <20210219173847.2054123-11-philmd@redhat.com>
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

By default machines can only use the TCG and QTest accelerators.

If a machine can use another accelerator, it has to explicitly
list it in its MachineClass valid_accelerators[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 4 ++--
 hw/core/machine.c   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4d08bc12093..b93d290b348 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -146,8 +146,8 @@ typedef struct {
  * @valid_accelerators:
  *    If this machine supports a specific set of virtualization accelerators,
  *    this contains a NULL-terminated list of the accelerators that can be
- *    used. If this field is not set, any accelerator is valid. The QTest
- *    accelerator is always valid.
+ *    used. If this field is not set, a default list containing only the TCG
+ *    accelerator is used. The QTest accelerator is always valid.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c42d8e382b1..ca7c9ee2a0c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -520,11 +520,11 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
 
 bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
 {
-    const char *const *name = mc->valid_accelerators;
+    static const char *const default_accels[] = {
+        "tcg", NULL
+    };
+    const char *const *name = mc->valid_accelerators ? : default_accels;
 
-    if (!name) {
-        return true;
-    }
     if (strcmp(acc_name, "qtest") == 0) {
         return true;
     }
-- 
2.26.2


