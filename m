Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C941E2D32E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47770.84631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAN-0005Ck-Nn; Tue, 08 Dec 2020 20:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47770.84631; Tue, 08 Dec 2020 20:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAM-00059Y-HN; Tue, 08 Dec 2020 20:00:54 +0000
Received: by outflank-mailman (input) for mailman id 47770;
 Tue, 08 Dec 2020 20:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAE-0004pY-01
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAD-00086a-3y; Tue, 08 Dec 2020 20:00:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihK-0001p0-Hr; Tue, 08 Dec 2020 19:30:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=UhlxfGmI/aEuEJYbZvO+wCWpWg3W+k9Y3YHBgam9bbQ=; b=F/WcsDkRt8mlAXrlFtOscwsnHx
	rUnmrIHMRw331u/FS2GTWJ3Eo7GPC0/q0ojoisBBfAWMxsE6mnNoCLgR/m7cJja0IvJrMATQdqq+f
	GxFm5tv93YUJIgH8P+4nzE0iwh/w2rZHIP1t/W3tiW99Q8P62p9280RIqnsyHQ6sb/Io=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 15/25] docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg manpage...
Date: Tue,  8 Dec 2020 19:30:23 +0000
Message-Id: <20201208193033.11306-16-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and put it into a new xl-pci-configuration(5) manpage, akin to the
xl-network-configration(5) and xl-disk-configuration(5) manpages.

This patch moves the content of the section verbatim. A subsequent patch
will improve the documentation, once it is in its new location.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl-pci-configuration.5.pod | 78 +++++++++++++++++++++++++++++
 docs/man/xl.cfg.5.pod.in            | 68 +------------------------
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 docs/man/xl-pci-configuration.5.pod

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
new file mode 100644
index 000000000000..72a27bd95dec
--- /dev/null
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -0,0 +1,78 @@
+=encoding utf8
+
+=head1 NAME
+
+xl-pci-configuration - XL PCI Configuration Syntax
+
+=head1 SYNTAX
+
+This document specifies the format for B<PCI_SPEC_STRING> which is used by
+the L<xl.cfg(5)> pci configuration option, and related L<xl(1)> commands.
+
+Each B<PCI_SPEC_STRING> has the form of
+B<[DDDD:]BB:DD.F[@VSLOT],KEY=VALUE,KEY=VALUE,...> where:
+
+=over 4
+
+=item B<[DDDD:]BB:DD.F>
+
+Identifies the PCI device from the host perspective in the domain
+(B<DDDD>), Bus (B<BB>), Device (B<DD>) and Function (B<F>) syntax. This is
+the same scheme as used in the output of B<lspci(1)> for the device in
+question.
+
+Note: by default B<lspci(1)> will omit the domain (B<DDDD>) if it
+is zero and it is optional here also. You may specify the function
+(B<F>) as B<*> to indicate all functions.
+
+=item B<@VSLOT>
+
+Specifies the virtual slot where the guest will see this
+device. This is equivalent to the B<DD> which the guest sees. In a
+guest B<DDDD> and B<BB> are C<0000:00>.
+
+=item B<permissive=BOOLEAN>
+
+By default pciback only allows PV guests to write "known safe" values
+into PCI configuration space, likewise QEMU (both qemu-xen and
+qemu-xen-traditional) imposes the same constraint on HVM guests.
+However, many devices require writes to other areas of the configuration space
+in order to operate properly.  This option tells the backend (pciback or QEMU)
+to allow all writes to the PCI configuration space of this device by this
+domain.
+
+B<This option should be enabled with caution:> it gives the guest much
+more control over the device, which may have security or stability
+implications.  It is recommended to only enable this option for
+trusted VMs under administrator's control.
+
+=item B<msitranslate=BOOLEAN>
+
+Specifies that MSI-INTx translation should be turned on for the PCI
+device. When enabled, MSI-INTx translation will always enable MSI on
+the PCI device regardless of whether the guest uses INTx or MSI. Some
+device drivers, such as NVIDIA's, detect an inconsistency and do not
+function when this option is enabled. Therefore the default is false (0).
+
+=item B<seize=BOOLEAN>
+
+Tells B<xl> to automatically attempt to re-assign a device to
+pciback if it is not already assigned.
+
+B<WARNING:> If you set this option, B<xl> will gladly re-assign a critical
+system device, such as a network or a disk controller being used by
+dom0 without confirmation.  Please use with care.
+
+=item B<power_mgmt=BOOLEAN>
+
+B<(HVM only)> Specifies that the VM should be able to program the
+D0-D3hot power management states for the PCI device. The default is false (0).
+
+=item B<rdm_policy=STRING>
+
+B<(HVM/x86 only)> This is the same as the policy setting inside the B<rdm>
+option but just specific to a given device. The default is "relaxed".
+
+Note: this would override global B<rdm> option.
+
+=back
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 12201a7e5461..c8e017f950de 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1101,73 +1101,7 @@ option is valid only when the B<controller> option is specified.
 =item B<pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]>
 
 Specifies the host PCI devices to passthrough to this guest.
-Each B<PCI_SPEC_STRING> has the form of
-B<[DDDD:]BB:DD.F[@VSLOT],KEY=VALUE,KEY=VALUE,...> where:
-
-=over 4
-
-=item B<[DDDD:]BB:DD.F>
-
-Identifies the PCI device from the host perspective in the domain
-(B<DDDD>), Bus (B<BB>), Device (B<DD>) and Function (B<F>) syntax. This is
-the same scheme as used in the output of B<lspci(1)> for the device in
-question.
-
-Note: by default B<lspci(1)> will omit the domain (B<DDDD>) if it
-is zero and it is optional here also. You may specify the function
-(B<F>) as B<*> to indicate all functions.
-
-=item B<@VSLOT>
-
-Specifies the virtual slot where the guest will see this
-device. This is equivalent to the B<DD> which the guest sees. In a
-guest B<DDDD> and B<BB> are C<0000:00>.
-
-=item B<permissive=BOOLEAN>
-
-By default pciback only allows PV guests to write "known safe" values
-into PCI configuration space, likewise QEMU (both qemu-xen and
-qemu-xen-traditional) imposes the same constraint on HVM guests.
-However, many devices require writes to other areas of the configuration space
-in order to operate properly.  This option tells the backend (pciback or QEMU)
-to allow all writes to the PCI configuration space of this device by this
-domain.
-
-B<This option should be enabled with caution:> it gives the guest much
-more control over the device, which may have security or stability
-implications.  It is recommended to only enable this option for
-trusted VMs under administrator's control.
-
-=item B<msitranslate=BOOLEAN>
-
-Specifies that MSI-INTx translation should be turned on for the PCI
-device. When enabled, MSI-INTx translation will always enable MSI on
-the PCI device regardless of whether the guest uses INTx or MSI. Some
-device drivers, such as NVIDIA's, detect an inconsistency and do not
-function when this option is enabled. Therefore the default is false (0).
-
-=item B<seize=BOOLEAN>
-
-Tells B<xl> to automatically attempt to re-assign a device to
-pciback if it is not already assigned.
-
-B<WARNING:> If you set this option, B<xl> will gladly re-assign a critical
-system device, such as a network or a disk controller being used by
-dom0 without confirmation.  Please use with care.
-
-=item B<power_mgmt=BOOLEAN>
-
-B<(HVM only)> Specifies that the VM should be able to program the
-D0-D3hot power management states for the PCI device. The default is false (0).
-
-=item B<rdm_policy=STRING>
-
-B<(HVM/x86 only)> This is the same as the policy setting inside the B<rdm>
-option but just specific to a given device. The default is "relaxed".
-
-Note: this would override global B<rdm> option.
-
-=back
+See L<xl-pci-configuration(5)> for more details.
 
 =item B<pci_permissive=BOOLEAN>
 
-- 
2.20.1


