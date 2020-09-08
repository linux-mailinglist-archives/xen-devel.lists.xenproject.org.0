Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56A2612AD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZs-0004g4-69; Tue, 08 Sep 2020 14:26:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZq-0004fG-LU
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:30 +0000
X-Inumbo-ID: c6ffeb93-9a04-4c1d-b07a-f84dc0118820
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c6ffeb93-9a04-4c1d-b07a-f84dc0118820;
 Tue, 08 Sep 2020 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaphSdiGhAZ4WeZEOB6GUUl46i+DVX/CX44TODloQyM=;
 b=GiMGQq8U7SZcAxZCFkwfGbp/KTM+X/Qzhawm/HoMCi1fJXWGRC5RuzR3MLKTISqXQIX99h
 AvfTVBma+jhvgHtjiNvFy0RNgJZPDA8cloyhPMR/P/7rOUeE8M46olYy2dzty8IMVpXMj8
 ovh2Sk9/lY4n2BN+oAcP1Yri9e3LCNE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-9BBEVFbHNamLZGcgTF1jOw-1; Tue, 08 Sep 2020 10:26:28 -0400
X-MC-Unique: 9BBEVFbHNamLZGcgTF1jOw-1
Received: by mail-wm1-f71.google.com with SMTP id m125so4791650wmm.7
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaphSdiGhAZ4WeZEOB6GUUl46i+DVX/CX44TODloQyM=;
 b=krujiwoEqktPRMWlZElHYPt1u1Ju6oPmE5RmabZ3VCg8S7yrk/wisz8qwB9Fwwblqt
 4x9M08CpIqGhjHnmeJtOYyqxhqpqbBZvCYAp5EyGG1cuZOgFicOr01KrsLxIhkhj3QeX
 3sXWnJjWbr4t6oN9H7SOL5XTKaYlTj+NuDq182mfmwSpN4ONtuAe95h05GTdgbNrtKNJ
 /7+i9MQJ7h8D/6kzBTN/6o0R+exCBeHFQhQcG9j0TNdcAJoKgv4CDwPVfDRIGhNxSbkN
 1xntaX5XppDj+MV7Qv0pfMCr5y2FO+PQD9WrH6rclf77OPMp/IdpdYzlCtNUtC3+3YO8
 yomg==
X-Gm-Message-State: AOAM530RWkQltDJxNjFtuJBuwdojAg82gWREWbOEjzx+u5JhDKdZ93bw
 dsk+SpzJwhWoBVFyzF7UJfVKq8DKrxPE/a6nv6avQkwoAg51NN/Izqr2+aFX76/QOMwZExr04tu
 iv2ZaS4xzQkaRAO3YKshrTHsX/d8=
X-Received: by 2002:a1c:39c4:: with SMTP id g187mr4575974wma.126.1599575186442; 
 Tue, 08 Sep 2020 07:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG1Q8mWXfEdH5JVru40UflvHEFaoABVR/a5qha22ZTatoY4EPmWAN5D43sEgEnSTkTauJZww==
X-Received: by 2002:a1c:39c4:: with SMTP id g187mr4575941wma.126.1599575186206; 
 Tue, 08 Sep 2020 07:26:26 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q15sm34307052wrr.8.2020.09.08.07.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:25 -0700 (PDT)
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
Subject: [PATCH 5/5] typedefs: Restrict PCMachineState to 'hw/i386/pc.h'
Date: Tue,  8 Sep 2020 16:25:59 +0200
Message-Id: <20200908142559.192945-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908142559.192945-1-philmd@redhat.com>
References: <20200908142559.192945-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
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

The PCMachineState type is only used under hw/i386/.
We don't need to forward-declare it for all architectures,
restrict it to the X86 one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/pc.h    | 4 ++--
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index fe52e165b27..d4ebefcf2b4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -19,7 +19,7 @@
  * @boot_cpus: number of present VCPUs
  * @smp_dies: number of dies per one package
  */
-struct PCMachineState {
+typedef struct PCMachineState {
     /*< private >*/
     X86MachineState parent_obj;
 
@@ -50,7 +50,7 @@ struct PCMachineState {
 
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
-};
+} PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 427027a9707..6281eae3b55 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -90,7 +90,6 @@ typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
-typedef struct PCMachineState PCMachineState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
-- 
2.26.2


