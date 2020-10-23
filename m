Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AB29739E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11202.29731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztd-00012s-JW; Fri, 23 Oct 2020 16:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11202.29731; Fri, 23 Oct 2020 16:26:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztd-00011Z-D7; Fri, 23 Oct 2020 16:26:29 +0000
Received: by outflank-mailman (input) for mailman id 11202;
 Fri, 23 Oct 2020 16:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztb-0000v3-HW
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7828a2f3-b8a2-4ece-86ed-5eb63f846dcb;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztV-0008Nq-0h; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqn-000376-F3; Fri, 23 Oct 2020 16:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztb-0000v3-HW
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:27 +0000
X-Inumbo-ID: 7828a2f3-b8a2-4ece-86ed-5eb63f846dcb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7828a2f3-b8a2-4ece-86ed-5eb63f846dcb;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=GMhuBQvWwKt0oiSVX55rbWxIi0temtvls6NwYa6kuYM=; b=3uTiqlaer9LfnCLBMURaVX2tb
	ErERqysULJnoGU2hRi47Z3HIAItwBFoBv12UhCxP12KxZAqc6+xD0TX0Jt4QIaOWHHSUxmwovLGqi
	Pi73o3sX7oiGdAZYCdxWSyO6oNajpb/3ytdWtzivelnhXfg2EB63GgZ4A5Zb8V5ZG0DkE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztV-0008Nq-0h; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqn-000376-F3; Fri, 23 Oct 2020 16:23:33 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 16/25] docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg manpage...
Date: Fri, 23 Oct 2020 16:23:05 +0000
Message-Id: <20201023162314.2235-17-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... and put it into a new xl-pci-configuration(5) manpage, akin to the
xl-network-configration(5) and xl-disk-configuration(5) manpages.

This patch moves the content of the section verbatim. A subsequent patch
will improve the documentation, once it is in its new location.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl-pci-configuration.5.pod | 78 +++++++++++++++++++++++++++++++++++++
 docs/man/xl.cfg.5.pod.in            | 68 +-------------------------------
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 docs/man/xl-pci-configuration.5.pod

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
new file mode 100644
index 0000000000..72a27bd95d
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
index 0532739c1f..b00644e852 100644
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
2.11.0


