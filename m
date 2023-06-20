Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378917372C5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552069.861959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7S-0006iZ-3h; Tue, 20 Jun 2023 17:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552069.861959; Tue, 20 Jun 2023 17:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7R-0006dT-T1; Tue, 20 Jun 2023 17:26:17 +0000
Received: by outflank-mailman (input) for mailman id 552069;
 Tue, 20 Jun 2023 17:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7Q-0004q1-NY
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:16 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e86d7eb-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:14 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-57083a06b71so41788197b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:14 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:13 -0700 (PDT)
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
X-Inumbo-ID: 8e86d7eb-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281973; x=1689873973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEqoX2AjLX1PvGaIbFaWG2CMKLGJZqfTIlTMaOcN4vw=;
        b=syngMxkIZTeaQp9EqDCXblsZMbin0jsNke7dSjaot9xphnUmSuAruqjdyZe2WoweR3
         eH3f1NX9hHczy6+4cCHq6/IvVWjiWN90p0y8rp4ZLL6+B6jbVkJDavnPNLdcDi0Dvsy0
         GE88YUqM8DFZxDlftNsQp3Gcd2G3Q7VTV+HkrymeuvD2SjJpuHSV7W6isdnwiNQAnpbM
         l1sFy6VCqaTSSUiaqaeqTHMNKZC3TX3/pKRDESIrsX6VUJCPqDB0rGSJutFzEW+1FDYO
         mX2KmAlrMDsAn96lm/5k8KIKcHRj61qU1g/swUa5rHHKp57FAUtvjaBQ0q+0JXrryVWZ
         I9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281973; x=1689873973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEqoX2AjLX1PvGaIbFaWG2CMKLGJZqfTIlTMaOcN4vw=;
        b=d2JLtfhy7C5IuyehNJOHUeeQuoKPS9JMqg2aujEFA6na9jvQBdN+h098SMvLnxmOI1
         xDZi1JJoo3ckaqsiKADw97uKg6g75xKxjumf0+GIbfV0orB4CHjgNEfPr2pJOAFDD8vd
         QGf72wZ6dUnP9EBFJ7DdltaVZGuQoNOAmc2grXNtAKmhIU7Y/74/kv8DzkMZTEx1qTkt
         MidqAregkNKCzwxrIX0tmKc9tcoPVIRpog5j2Yd5bBT2IHk1FO1j40qzkWgNAaUXMRkO
         JLMh0FrtS3lE1JeKanmjrt3qIat0E+DFMd/oBOBWwyU44Gj+ap2NUZUqgHNB1hUM2Q5K
         IVEA==
X-Gm-Message-State: AC+VfDxViylTsMaamSl0l7RswJGXD0bqwCFDsEk9mXLOQ9W0jtUHfBLc
	1UebMYirpo3HJ46cGVOnmL0KsVNOAp7ZPA==
X-Google-Smtp-Source: ACHHUZ7kcV+4jXM1nvoQ+9LnCTBkDnjZwwW17Mts+DPH57RjuKWgSyke9VCfEcmOzSYeFt76ut4FPg==
X-Received: by 2002:a81:7dd5:0:b0:56f:fa56:4c32 with SMTP id y204-20020a817dd5000000b0056ffa564c32mr9995963ywc.52.1687281973507;
        Tue, 20 Jun 2023 10:26:13 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 09/23] xen/pt: Xen PCIe passthrough support for Q35: bypass PCIe topology check
Date: Tue, 20 Jun 2023 13:24:43 -0400
Message-Id: <dd9298e51628b998e48f800e06c1953233b7efe0.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compared to legacy i440 system, there are certain difficulties while
passing through PCIe devices to guest OSes like Windows 7 and above
on platforms with native support of PCIe bus (in our case Q35). This
problem is not applicable to older OSes like Windows XP -- PCIe
passthrough on such OSes can be used normally as these OSes have
no support for PCIe-specific features and treat all PCIe devices as legacy
PCI ones.

The problem manifests itself as "Code 10" error for a passed thru PCIe
device in Windows Device Manager (along with exclamation mark on it). The
device with such error do not function no matter the fact that Windows
successfully booted while actually using this device, ex. as a primary VGA
card with VBE features, LFB, etc. working properly during boot time.
It doesn't matter which PCI class the device have -- the problem is common
to GPUs, NIC cards, USB controllers, etc. In the same time, all these
devices can be passed thru successfully using i440 emulation on same
Windows 7+ OSes.

The actual root cause of the problem lies in the fact that Windows kernel
(PnP manager particularly) while processing StartDevice IRP refuses
to continue to start the device and control flow actually doesn't even
reach the IRP handler in the device driver at all. The real reason for
this typically does not appear at the time PnP manager tries to start the
device, but happens much earlier -- during the Windows boot stage, while
enumerating devices on a PCI/PCIe bus in the Windows pci.sys driver. There
is a set of checks for every discovered device on the PCIe bus. Failing
some of them leads to marking the discovered PCIe device as 'invalid'
by setting the flag. Later on, StartDevice attempt will fail due to this
flag, finally resulting in Code 10 error.

The actual check in pci.sys which results in the PCIe device being marked
as 'invalid' in our case is a validation of upstream PCIe bus hierarchy
to which passed through device belongs. Basically, pci.sys checks if the
PCIe device has parent devices, such as PCIe Root Port or upstream PCIe
switch. In our case the PCIe device has no parents and resides on bus
0 without eg. corresponding Root Port.

Therefore, in order to resolve this problem in a architecturally correct
way, we need to introduce to Xen some support of at least trivial non-flat
PCI bus hierarchy. In very simplest case - just one virtual Root Port,
on secondary bus of which all physical functions of the real passed thru
device will reside, eg. GPU and its HDAudio function.

This solution is not hard to implement technically, but there are multiple
affecting limitations present in Xen (many related to each other)
currently:

- in many places the code is limited to use bus 0 only. This applicable
  to both hypervisor and supplemental modules like hvmloader. This
  limitation is enforced on API level -- many functions and interfaces
  allow to specify only devfn argument while bus 0 being implied.

- lot of code assumes Type0 PCI config space layout only, while we need
  to handle Type1 PCI devices as well

- currently there no way to assign to a guest domain even a simplest
  linked hierarchy of passed thru PCI devices. In some cases we might need
  to passthrough a real PCIe Switch/Root Port with his downstream child
  devices.

- in a similar way Xen/hvmloader lacks the concept of IO/MMIO space
  nesting. Both code which does MMIO hole sizing and code which allocates
  BARs to MMIO hole have no idea of MMIO ranges nesting and their relations.
  In case of virtual Root Port we have basically an emulated PCI-PCI bridge
  with some parts of its MMIO range used for real MMIO ranges of passed
  through device(s).

So, adding to Xen multiple PCI buses support will require a bit of effort
and discussions regarding the actual design of the feature.  Nevertheless,
this task is crucial for PCI/GPU passthrough features of Xen to work
properly.

To summarize, we need to implement following things in the future:
1) Get rid of PCI bus 0 limitation everywhere. This could've been
  a simplest of subtasks but in reality this will require to change
  interfaces as well - AFAIR even adding a PCI device via QMP only allows
  to specify a device slot while we need to have some way to place the
  device on an arbitrary bus.

2) Fully or partially emulated PCI-PCI bridge which will provide
  a secondary bus for PCIe device placement - there might be a possibility
  to reuse some existing emulation QEMU provides. This also includes Type1
  devices support.
  The task will become more complicated if there arise necessity, for
  example, to control the PCIe link for a passed through PCIe device. As PT
  device reset is mandatory in most cases, there might be a chance
  to encounter a situation when we need to retrain the PCIe link to restore
  PCIe link speed after the reset. In this case there will be a need
  to selectively translate accesses to certain registers of emulated PCIe
  Switch/Root Port to the corresponding physical upstream PCIe
  Switch/RootPort. This will require some interaction with Dom0, hopefully
  extending xen-pciback will be enough.

3) The concept of I/O and MMIO ranges nesting, for tasks like sizing MMIO
  hole or PCI BAR allocation. This one should be pretty simple.

The actual implementation still is a matter to discuss of course.

In the meantime there can be used a very simple workaround which allows
to bypass pci.sys limitation for PCIe topology check - there exist one
good exception to "must have upstream PCIe parent" rule of pci.sys. It's
chipset-integrated devices. How pci.sys can tell if it deals with
a chipset built-in device? It checks one of PCI Express Capability fields
in the device PCI conf space. For chipset built-in devices this field will
state "root complex integrated device" while in our  case for a normal
passed thru PCIe device there will be a "PCIe endpoint" type. So that's
what the workaround does - it intercepts reading of this particular field
for passed through devices and returns the "root complex integrated
device" value for PCIe endpoints. This makes pci.sys happy and allows
Windows 7 and above to use PT device on PCIe-capable system normally.
So far no negative side effects were encountered while using this
approach, so it's a good temporary solution until multiple PCI bus support
will be added to Xen.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 49 +++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 47c8482f32..757a035aad 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -907,6 +907,55 @@ static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
     return 0;
 }
 
+/* initialize PCI Express Capabilities register */
+static int xen_pt_pcie_capabilities_reg_init(XenPCIPassthroughState *s,
+                                             XenPTRegInfo *reg,
+                                             uint32_t real_offset,
+                                             uint32_t *data)
+{
+    uint8_t dev_type = get_pcie_device_type(s);
+    uint16_t reg_field;
+
+    if (xen_host_pci_get_word(&s->real_device,
+                             real_offset - reg->offset + PCI_EXP_FLAGS,
+                             &reg_field)) {
+        XEN_PT_ERR(&s->dev, "Error reading PCIe Capabilities reg\n");
+        *data = 0;
+        return 0;
+    }
+    /*
+     * Q35 workaround for Win7+ pci.sys PCIe topology check.
+     * As our PT device currently located on a bus 0, fake the
+     * device/port type field to the "Root Complex integrated device"
+     * value to bypass the check
+     */
+    switch (dev_type) {
+    case PCI_EXP_TYPE_ENDPOINT:
+    case PCI_EXP_TYPE_LEG_END:
+        XEN_PT_LOG(&s->dev, "Original PCIe Capabilities reg is 0x%04X\n",
+            reg_field);
+        reg_field &= ~PCI_EXP_FLAGS_TYPE;
+        reg_field |= ((PCI_EXP_TYPE_RC_END /*9*/ << 4) & PCI_EXP_FLAGS_TYPE);
+        XEN_PT_LOG(&s->dev, "Q35 PCIe topology check workaround: "
+                   "faking Capabilities reg to 0x%04X\n", reg_field);
+        break;
+
+    case PCI_EXP_TYPE_ROOT_PORT:
+    case PCI_EXP_TYPE_UPSTREAM:
+    case PCI_EXP_TYPE_DOWNSTREAM:
+    case PCI_EXP_TYPE_PCI_BRIDGE:
+    case PCI_EXP_TYPE_PCIE_BRIDGE:
+    case PCI_EXP_TYPE_RC_END:
+    case PCI_EXP_TYPE_RC_EC:
+    default:
+        /* do nothing, return as is */
+        break;
+    }
+
+    *data = reg_field;
+    return 0;
+}
+
 /* PCI Express Capability Structure reg static information table */
 static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
     /* Next Pointer reg */
-- 
2.34.1


