Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D5A20E8D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878623.1288814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRk-0003V0-9m; Tue, 28 Jan 2025 16:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878623.1288814; Tue, 28 Jan 2025 16:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRk-0003Qt-4V; Tue, 28 Jan 2025 16:28:16 +0000
Received: by outflank-mailman (input) for mailman id 878623;
 Tue, 28 Jan 2025 16:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00fH=UU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcoRi-0003Ni-HS
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:28:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de2588e6-dd94-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:28:12 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso5198478f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:28:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad87sm14559514f8f.74.2025.01.28.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:28:11 -0800 (PST)
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
X-Inumbo-ID: de2588e6-dd94-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738081692; x=1738686492; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD81beFmPqaU1R9FOQxjBPyp+1ickihRrVRD2fGWEdE=;
        b=Smv+sZb4dNiGdnWum/Nv2lCuU9vVoZkfrzg/j3z7lgsAmtz+Svj6xMoLlRwb7socqW
         +za+Icrq0kmarjmimJBDO+YTa281/RsM8G65WkgEJuINP1MOvBxW779R0kJM8qQEeYaN
         4MlOcxKDGj50AWt6suqMJPT2cPRRa/Vw0sLJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738081692; x=1738686492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CD81beFmPqaU1R9FOQxjBPyp+1ickihRrVRD2fGWEdE=;
        b=m07d/dVEf/6jCeETdSu/kwif/gRVFW78pDsJ0L/pw3s/378YKMrGnezbaxagstZKzf
         QKyqKuuyFKyfw7/nwkIeKrXQzUgTfKX6PtQxwxb6xnAkuVx0SojIv/iePU09xZGJWZFP
         lM3cStNF0ZaAUdjxpvuu65WR3GkZ1YE4NRZ7aNS6jXYUHUNpNJRaPv1z1NrHFvnOtKLv
         4Tm9Cmw3rWn1PNEUXNL2sxEckdqltnZwuEzifv0opb42sfpHq4jf+bwyR3wTwfzPDgyL
         tyhK+oUDpbtIhbHiXeKTVPegME7MwT34EbNHr4HC2CLoKAKTZVZliLj9mSBjXzjakoU9
         F1uA==
X-Gm-Message-State: AOJu0YwhXIEAqlkHVxkoC91CaQ2EcCuST/SK2e6uXqMWHYgQhI1SN5uE
	d6x0BFCZrSe6oYcfYQ7uoafHBeUetZklnP7Rp0Z0yQRlXo9o6pXvRf9EGX1/r0E0fYw1YcFyXLE
	Z
X-Gm-Gg: ASbGnctR1utRzzIDkm6+wxKlpxK1V3qA/EWA6DNecok5RgQmh1fWST4viaRXsGEuTJA
	dlb/YEhRhXkN4vDLgPaju0uAJdrjHWN/9INZ1pWFGeAtxTU3LYT2AIu7lvv95Ab66YsjwqNxown
	QE1inMVNGscHsHghtzgZsN7EUokNGWk1o/d/X6t7R2QNEj2R2WLn1qT2hKah+I7FfvjHEzqQmEm
	4fiYWM5tn3MUhgwlWTTL5uTBifElmBQ/AVf77wkGnkhcCdlLbSrj6F/PmKscIOcpJUy1eDrXRbl
	7F/zWh1UAPMtrIxTgAnY4Ga0mZxH1sQ=
X-Google-Smtp-Source: AGHT+IFT1mqzxuzpsPHaj5Q551xZdz3zB9BacWXjyIfD1UFaX6aPFzxddX6WMZwbn1IvIvZtuL0ojQ==
X-Received: by 2002:a05:6000:2a6:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38bf566a239mr42568251f8f.26.1738081691636;
        Tue, 28 Jan 2025 08:28:11 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 1/2] x86/shutdown: quiesce devices ahead of AP shutdown
Date: Tue, 28 Jan 2025 17:27:41 +0100
Message-ID: <20250128162742.90431-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250128162742.90431-1-roger.pau@citrix.com>
References: <20250128162742.90431-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current shutdown logic in smp_send_stop() will first disable the APs,
and then attempt to disable (some) of the interrupt sources.

There are two issues with this approach; the first one being that MSI
interrupt sources are not disabled, the second one is the APs are stopped
before interrupts are disabled.  On AMD systems this can lead to the
triggering of local APIC errors:

APIC error on CPU0: 00(08), Receive accept error

Such error message can be printed in a loop, thus blocking the system from
rebooting.  I assume this loop is created by the error being triggered by
the console interrupt, which is further triggered by the ESR reporting
write to the console.

Intel SDM states:

"Receive Accept Error.

Set when the local APIC detects that the message it received was not
accepted by any APIC on the APIC bus, including itself. Used only on P6
family and Pentium processors."

So the error shouldn't trigger on any Intel CPU supported by Xen.

However AMD doesn't make such claims, and indeed the error is broadcasted
to all local APIC when for example an interrupt targets a CPU that's
offline.

To prevent the error from triggering, move the masking of IO-APIC pins
ahead of stopping the APs.  Also introduce a new function that disables
MSI and MSI-X on all PCI devices.  Remove the call to fixup_irqs() since
there's no point in attempting to move interrupts: all sources will be
either masked or disabled.

For the NMI crash path also call the newly introduced function, with the
hope that disabling MSI and MSI-X will make it easier for the (possible)
crash kernel to boot, as it could otherwise receive the same "Receive
accept error" upon re-enabling interrupts.

Note that this will have the side-effect of preventing further IOMMU
interrupts from being delivered, that's expected and at that point in the
shutdown process no further interaction with the IOMMU should be relevant.
Also note all current callers of smp_send_stop() do so after having called
console_start_sync(), so disabling the console interrupt won't hamper
console output.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/crash.c           |  1 +
 xen/arch/x86/include/asm/msi.h |  1 +
 xen/arch/x86/msi.c             | 14 ++++++++++++++
 xen/arch/x86/smp.c             | 10 +++++-----
 xen/drivers/passthrough/pci.c  | 32 ++++++++++++++++++++++++++++++++
 xen/include/xen/pci.h          |  2 ++
 6 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index a789416ca3ae..55a96d469f47 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -176,6 +176,7 @@ static void nmi_shootdown_cpus(void)
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
 
         disable_IO_APIC();
+        pci_disable_msi_all();
         hpet_disable();
     }
 }
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 63adb19820e8..7f9e531f73e6 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -86,6 +86,7 @@ extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
 extern void pci_disable_msi(struct msi_desc *msi_desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
+extern void pci_disable_msi_all(void);
 extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc);
 extern int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
                            hw_irq_controller *handler);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e2360579deda..f53b50c98f2a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1248,6 +1248,20 @@ void pci_cleanup_msi(struct pci_dev *pdev)
     msi_free_irqs(pdev);
 }
 
+static int cf_check disable_msi(struct pci_dev *pdev, void *arg)
+{
+    msi_set_enable(pdev, 0);
+    msix_set_enable(pdev, 0);
+
+    return 0;
+}
+
+void pci_disable_msi_all(void)
+{
+    /* Disable MSI and/or MSI-X on all devices. */
+    pci_iterate_devices(disable_msi, NULL);
+}
+
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msix_pos;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 02a6ed7593f3..0cf03660214d 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -358,14 +358,15 @@ void smp_send_stop(void)
 {
     unsigned int cpu = smp_processor_id();
 
+    local_irq_disable();
+    disable_IO_APIC();
+    pci_disable_msi_all();
+    local_irq_enable();
+
     if ( num_online_cpus() > 1 )
     {
         int timeout = 10;
 
-        local_irq_disable();
-        fixup_irqs(cpumask_of(cpu), 0);
-        local_irq_enable();
-
         smp_call_function(stop_this_cpu, NULL, 0);
 
         /* Wait 10ms for all other CPUs to go offline. */
@@ -376,7 +377,6 @@ void smp_send_stop(void)
     if ( cpu_online(cpu) )
     {
         local_irq_disable();
-        disable_IO_APIC();
         hpet_disable();
         __stop_this_cpu();
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 777c6b1a7fdc..9782750f7902 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1803,6 +1803,38 @@ int iommu_do_pci_domctl(
     return ret;
 }
 
+struct segment_iter {
+    int (*handler)(struct pci_dev *pdev, void *arg);
+    void *arg;
+};
+
+static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
+{
+    const struct segment_iter *iter = arg;
+    struct pci_dev *pdev;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        int rc = iter->handler(pdev, iter->arg);
+
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg)
+{
+    struct segment_iter iter = {
+        .handler = handler,
+        .arg = arg,
+    };
+
+    return pci_segments_iterate(iterate_all, &iter);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f784e9116059..d4c9837af722 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -225,6 +225,8 @@ int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
-- 
2.46.0


