Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7531FE03
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87040.164047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kv-0001LT-7O; Fri, 19 Feb 2021 17:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87040.164047; Fri, 19 Feb 2021 17:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kv-0001Kl-3J; Fri, 19 Feb 2021 17:39:53 +0000
Received: by outflank-mailman (input) for mailman id 87040;
 Fri, 19 Feb 2021 17:39:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kt-0000on-8S
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7b0e2b8c-9c17-456a-bb6c-1467ccc2a51b;
 Fri, 19 Feb 2021 17:39:39 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-L0b7UppANLaDziCdFdlqKA-1; Fri, 19 Feb 2021 12:39:38 -0500
Received: by mail-wr1-f71.google.com with SMTP id y6so2750267wrl.9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c133sm2365046wme.46.2021.02.19.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:36 -0800 (PST)
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
X-Inumbo-ID: 7b0e2b8c-9c17-456a-bb6c-1467ccc2a51b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XNpw7EsZwRfqH5jj+d5q0K26B/2H8ocJXujjf2y0q0=;
	b=ZHMfCRdN/bdY9ziUhL8FHMTvt/ET0FvOdowXpYp4YyGeLfmKK3gCq1Q5yUpR/vx4sBp6od
	KsswFI/FdlK0RsYDWmNDnarQHauInHORqA5+n6X3gIMFFYUUgQP2bjAX1Jrl/INaeb3oQr
	zmZDk09RjVLsR0/Ze6jNpbgjNMWyFsU=
X-MC-Unique: L0b7UppANLaDziCdFdlqKA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0XNpw7EsZwRfqH5jj+d5q0K26B/2H8ocJXujjf2y0q0=;
        b=t5HtcEcIp3i2D4AqEzp27oCkuCyQ55/7gxNko08hANUWLmcEReWpQlC31HcjlugNMU
         LNAoozvrOpYAwi1rel8VaAJp2v7kkUC5bs7cX+n3TEUp3VUZQDxBZHW4OsUaGmK0NrPh
         UrAgLBLkH3Wb2Kr8XnhPZppZTdsqOoP/0mq/mH8s1vc5wi36T6SC/njs9edowzoRmjAo
         NdnuxWtA+nG7UzLqkI21zBOiu0VsZ/A6UA4WogFR62Vtdd3PVHUONsva0HyDQo/nUY48
         A/kcZuOuHlf02mo4rhLIQbRhE2s4yqJ//YEJN8wnv9gOSzYGkKtzBiES70xUvbBdn0tj
         DN4g==
X-Gm-Message-State: AOAM532NCiLuF9sT29p62M54kaUtI8keiyVutJa8upGfgtnLU6bXb2fr
	8f2lZcQoTX2P4YHGEoHN+HI6yDrN26OvwXaJwp3QEJQ0OE8RVfekWlFPmIcicjN1gIBgDLx9kGS
	FQQIoeVGmE0yPvPJDa5p6SFkHBtk=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr10124627wrr.93.1613756376926;
        Fri, 19 Feb 2021 09:39:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUWYk16cfFnjfBZLMWl2Vy5aAjSJDcFd3Zrj54+kp+HHEcqph2ioitLZ00EdqyQhCQF2e9eA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr10124607wrr.93.1613756376757;
        Fri, 19 Feb 2021 09:39:36 -0800 (PST)
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
Subject: [RFC PATCH v2 08/11] hw/i386: Explicit x86 machines support all current accelerators
Date: Fri, 19 Feb 2021 18:38:44 +0100
Message-Id: <20210219173847.2054123-9-philmd@redhat.com>
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

x86 machines currently support all accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: not sure about this, x86 is not my cup of tea

 hw/i386/x86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef90..2dc10e7d386 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1209,6 +1209,10 @@ static void x86_machine_initfn(Object *obj)
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", "xen", "hax", "hvf", "whpx", NULL
+};
+
 static void x86_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1218,6 +1222,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->valid_accelerators = valid_accels;
     x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
-- 
2.26.2


