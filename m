Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D912613EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:56:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfyb-0005vF-8q; Tue, 08 Sep 2020 15:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfyZ-0005s0-03
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:56:07 +0000
X-Inumbo-ID: 986bef88-0b03-48f7-a305-6a6a4864f9a0
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 986bef88-0b03-48f7-a305-6a6a4864f9a0;
 Tue, 08 Sep 2020 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaphSdiGhAZ4WeZEOB6GUUl46i+DVX/CX44TODloQyM=;
 b=OQO2/jQtnj06aWyy6m2mXgxw+CKr7RxR9RU3GEOx9Dux8xx81tNuzOZRIn8heQXveDso1/
 0mC1RL7K+JLk2p6+6GiwDKCycAf4ujvEj44fvRDWiSJpSvsVOYSEosYU0CD4PXN1UfsVch
 bksJ07MQTKgEtBItdQxIf4/5Q/tKKl0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-rtJnU8VXPh-N-mF1btm8KQ-1; Tue, 08 Sep 2020 11:56:04 -0400
X-MC-Unique: rtJnU8VXPh-N-mF1btm8KQ-1
Received: by mail-wr1-f70.google.com with SMTP id x15so6258138wrm.7
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaphSdiGhAZ4WeZEOB6GUUl46i+DVX/CX44TODloQyM=;
 b=H2QNtInXtf8KsIMYFrNX4Qa1z0FsNJE64U37CCJXDqN8lx1tiPpB8ABhhn38WKIMLQ
 x32jJPMWiiiCsP7pyUuMywn5w/ieptWv2RIe4ZedpD8dy1jOFVQgcQOf4sJGXUp17nyx
 Bm+ixqXydGr2YP5RWsSjwDbl8a+8cx1pzjB3cVrHExYbZGlqNfU/3eqSDbtXqZXeMskS
 sdfseXV7ZW3gd7GKyifutYsZBuzskuPzICVVYzd/tP1sCTLBu5ltYdmZNQgmtS8AxdKa
 UBtjUmIWMNjNIXjvLU/NP4FvmY+y6SGtRP+xkTAvUom0SLRNob3/p0PPGUPk2PivJBEm
 xhlw==
X-Gm-Message-State: AOAM530l0QhGhOGGGTchYf2eD4dsEJvxTt7t7jY6RvMRJgWEa1I0rOYM
 o1bR0nKfSnb6I7YztXA/LTESvlPdRJXwJL4NenG8O2fpsfEFvaDyYMP7y52NOobDhALol7Osu1S
 mfHBB2ZgTFj3Ynd60H6TH+mUh6T4=
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr162450wmi.135.1599580562476; 
 Tue, 08 Sep 2020 08:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyALjQfs+9IOfen4Ye454tvzuEGIBzUvWIDpuXevuX4q2Ul/ulBEnGqrdlon8zddGjC4+VrrA==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr162434wmi.135.1599580562312; 
 Tue, 08 Sep 2020 08:56:02 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id d6sm34124785wrq.67.2020.09.08.08.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:56:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 6/6] typedefs: Restrict PCMachineState to 'hw/i386/pc.h'
Date: Tue,  8 Sep 2020 17:55:30 +0200
Message-Id: <20200908155530.249806-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
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


