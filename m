Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CD2612AA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZg-0004ZR-4N; Tue, 08 Sep 2020 14:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZe-0004Z0-Dj
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:18 +0000
X-Inumbo-ID: 3664bd58-1bd3-4a1d-811e-071f2a39d189
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3664bd58-1bd3-4a1d-811e-071f2a39d189;
 Tue, 08 Sep 2020 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9MSzTqEXdEyImaMC4bb2Kv6juBLliyTUBhWiXmnlsA=;
 b=cQ8yZG/yJYMFC91oLmHQGmC4tLX2Do5Lz3VO7ocjnMC4oiXFf5Lnfkn+voSWGy5Vs2fl8i
 EjWUmng7q/b1nGu1mTIT/k9lcloQvcBXLuPAMgGME9Oi0Kv0KsiwNkHL+10B9fvH0GZyPm
 kmr21ExCVwuNuZ1Kh3d8fWUc7L5Fat8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-4MYOfzWJMlasmwoLkl4viw-1; Tue, 08 Sep 2020 10:26:12 -0400
X-MC-Unique: 4MYOfzWJMlasmwoLkl4viw-1
Received: by mail-wm1-f72.google.com with SMTP id s24so3544396wmh.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9MSzTqEXdEyImaMC4bb2Kv6juBLliyTUBhWiXmnlsA=;
 b=aSRXGTGvPFg18FAjL8Mk3/tDlnFSfKkyq6oGoprgZ/YoNwbY3sqMXSjwQwUZyA/dDm
 iJUlO1zrnzNYkpSFwbe5N8VFzhQOUCL4M383WKsxXrzDD80C20NpERLop01iylIJ107f
 QoGfzuTLEQFazg/VGFHYw4u0EqgLf7AORU+tLXNFpuDCexxd0zf6PMDYK7U2s7zIOLkj
 TEOHEJ5F5wATnT4p0PMj4Ef83wD3cvLF4aiYNt5Q5CKqJElQ+gB/47GFDd9XP9mIVchL
 rJ5NhTsruo9Q2Isd4JdIWI71J6HNAkVelDgSAHuW9SFLlzNOo89ovR0QIJbuhYBr1Rt9
 ALfA==
X-Gm-Message-State: AOAM53234spZ9pTplI5AiC2uDVX0IQu6ah/ryqR0qAhj87dr/0oX/3u2
 vk68Dv8L9lr5jxcoCylYpCZlRRrag8kG2ztkND+zIt26mGR9FXHspuEMNyFIEjNB2AVGP1oMb7/
 Y1L7ikKJzu18S2bCauj1EkmCKqac=
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr4633439wmb.71.1599575171514; 
 Tue, 08 Sep 2020 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3vgB6KYzGWWNNlxEePF5U1CwXzF+kjRAXT8UQ0UbqHEu67mnmI4scehmYDtJwRd7p3yPSHg==
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr4633412wmb.71.1599575171290; 
 Tue, 08 Sep 2020 07:26:11 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id a10sm30865798wmj.38.2020.09.08.07.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/5] hw/i386/xen: Rename X86/PC specific function as
 xen_hvm_init_pc()
Date: Tue,  8 Sep 2020 16:25:56 +0200
Message-Id: <20200908142559.192945-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908142559.192945-1-philmd@redhat.com>
References: <20200908142559.192945-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xen_hvm_init() is only meanful to initialize a X86/PC machine,
rename it as xen_hvm_init_pc().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/xen/xen.h   | 2 +-
 accel/stubs/xen-stub.c | 2 +-
 hw/i386/pc_piix.c      | 6 +++---
 hw/i386/xen/xen-hvm.c  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 771dd447f2b..b2b459964cb 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -30,7 +30,7 @@ qemu_irq *xen_interrupt_controller_init(void);
 
 void xenstore_store_pv_console_info(int i, struct Chardev *chr);
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory);
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index 8ae658acff5..fa3dddbce57 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -46,7 +46,7 @@ void xen_register_framebuffer(MemoryRegion *mr)
 {
 }
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
 }
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32b1453e6a8..3e008bb0b1a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -117,8 +117,8 @@ static void pc_init1(MachineState *machine,
      *    so legacy non-PAE guests can get as much memory as possible in
      *    the 32bit address space below 4G.
      *
-     *  - Note that Xen has its own ram setp code in xen_ram_init(),
-     *    called via xen_hvm_init().
+     *  - Note that Xen has its own ram setup code in xen_ram_init(),
+     *    called via xen_hvm_init_pc().
      *
      * Examples:
      *    qemu -M pc-1.7 -m 4G    (old default)    -> 3584M low,  512M high
@@ -127,7 +127,7 @@ static void pc_init1(MachineState *machine,
      *    qemu -M pc,max-ram-below-4g=4G -m 3968M  -> 3968M low (=4G-128M)
      */
     if (xen_enabled()) {
-        xen_hvm_init(pcms, &ram_memory);
+        xen_hvm_init_pc(pcms, &ram_memory);
     } else {
         if (!pcms->max_ram_below_4g) {
             pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index cde981bad66..49748cda3fb 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1395,7 +1395,7 @@ static int xen_map_ioreq_server(XenIOState *state)
     return 0;
 }
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
     unsigned int max_cpus = ms->smp.max_cpus;
-- 
2.26.2


