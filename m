Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8572D32E7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47760.84516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAE-0004qW-OX; Tue, 08 Dec 2020 20:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47760.84516; Tue, 08 Dec 2020 20:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAE-0004q2-LM; Tue, 08 Dec 2020 20:00:46 +0000
Received: by outflank-mailman (input) for mailman id 47760;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004oq-Iz
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086G-Nq; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihL-0001p0-BW; Tue, 08 Dec 2020 19:30:55 +0000
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
	bh=Kp5JHM/PcDPgoyQFpS4CPrVmdU0OAzBzGq/q/o/48HU=; b=RwuXlpVlGqqwSfs9ckruZrDqFD
	c7NWlIYHncocBbwbUaf7sSbkXzqOZiFW5VsVz3PrS6OiqyckaYsi/KW5Z+v9bPqm05nHRVE2uKQnx
	pP1OR8hKo4CSiBDHjvE3K7nbIX/GFrLm7g9w3jENbMvRX5PEU4EwBTmN47EOXHcKCxCY=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 16/25] docs/man: improve documentation of PCI_SPEC_STRING...
Date: Tue,  8 Dec 2020 19:30:24 +0000
Message-Id: <20201208193033.11306-17-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and prepare for adding support for non-positional parsing of 'bdf' and
'vslot' in a subsequent patch.

Also document 'BDF' as a first-class parameter type and fix the documentation
to state that the default value of 'rdm_policy' is actually 'strict', not
'relaxed', as can be seen in libxl__device_pci_setdefault().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl-pci-configuration.5.pod | 177 +++++++++++++++++++++++-----
 1 file changed, 148 insertions(+), 29 deletions(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index 72a27bd95dec..4dd73bc498d6 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -6,32 +6,105 @@ xl-pci-configuration - XL PCI Configuration Syntax
 
 =head1 SYNTAX
 
-This document specifies the format for B<PCI_SPEC_STRING> which is used by
-the L<xl.cfg(5)> pci configuration option, and related L<xl(1)> commands.
+This document specifies the format for B<BDF> and B<PCI_SPEC_STRING> which are
+used by the L<xl.cfg(5)> pci configuration option, and related L<xl(1)>
+commands.
 
-Each B<PCI_SPEC_STRING> has the form of
-B<[DDDD:]BB:DD.F[@VSLOT],KEY=VALUE,KEY=VALUE,...> where:
+A B<BDF> has the following form:
+
+    [DDDD:]BB:SS.F
+
+B<DDDD> is the domain number, B<BB> is the bus number, B<SS> is the device (or
+slot) number, and B<F> is the function number. This is the same scheme as
+used in the output of L<lspci(1)> for the device in question. By default
+L<lspci(1)> will omit the domain (B<DDDD>) if it is zero and hence a zero
+value for domain may also be omitted when specifying a B<BDF>.
+
+Each B<PCI_SPEC_STRING> has the one of the forms:
+
+=over 4
+
+    [<bdf>[@<vslot>,][<key>=<value>,]*
+    [<key>=<value>,]*
+
+=back
+
+For example, these strings are equivalent:
 
 =over 4
 
-=item B<[DDDD:]BB:DD.F>
+    36:00.0@20,seize=1
+    36:00.0,vslot=20,seize=1
+    bdf=36:00.0,vslot=20,seize=1
 
-Identifies the PCI device from the host perspective in the domain
-(B<DDDD>), Bus (B<BB>), Device (B<DD>) and Function (B<F>) syntax. This is
-the same scheme as used in the output of B<lspci(1)> for the device in
-question.
+=back
+
+More formally, the string is a series of comma-separated keyword/value
+pairs, flags and positional parameters.  Parameters which are not bare
+keywords and which do not contain "=" symbols are assigned to the
+positional parameters, in the order specified below.  The positional
+parameters may also be specified by name.
+
+Each parameter may be specified at most once, either as a positional
+parameter or a named parameter.  Default values apply if the parameter
+is not specified, or if it is specified with an empty value (whether
+positionally or explicitly).
+
+B<NOTE>: In context of B<xl pci-detach> (see L<xl(1)>), parameters other than
+B<bdf> will be ignored.
+
+=head1 Positional Parameters
+
+=over 4
+
+=item B<bdf>=I<BDF>
+
+=over 4
 
-Note: by default B<lspci(1)> will omit the domain (B<DDDD>) if it
-is zero and it is optional here also. You may specify the function
-(B<F>) as B<*> to indicate all functions.
+=item Description
 
-=item B<@VSLOT>
+This identifies the PCI device from the host perspective.
 
-Specifies the virtual slot where the guest will see this
-device. This is equivalent to the B<DD> which the guest sees. In a
-guest B<DDDD> and B<BB> are C<0000:00>.
+In the context of a B<PCI_SPEC_STRING> you may specify the function (B<F>) as
+B<*> to indicate all functions of a multi-function device.
 
-=item B<permissive=BOOLEAN>
+=item Default Value
+
+None. This parameter is mandatory as it identifies the device.
+
+=back
+
+=item B<vslot>=I<NUMBER>
+
+=over 4
+
+=item Description
+
+Specifies the virtual slot (device) number where the guest will see this
+device. For example, running L<lspci(1)> in a Linux guest where B<vslot>
+was specified as C<8> would identify the device as C<00:08.0>. Virtual domain
+and bus numbers are always 0.
+
+B<NOTE:> This parameter is always parsed as a hexidecimal value.
+
+=item Default Value
+
+None. This parameter is not mandatory. An available B<vslot> will be selected
+if this parameter is not specified.
+
+=back
+
+=back
+
+=head1 Other Parameters and Flags
+
+=over 4
+
+=item B<permissive>=I<BOOLEAN>
+
+=over 4
+
+=item Description
 
 By default pciback only allows PV guests to write "known safe" values
 into PCI configuration space, likewise QEMU (both qemu-xen and
@@ -46,33 +119,79 @@ more control over the device, which may have security or stability
 implications.  It is recommended to only enable this option for
 trusted VMs under administrator's control.
 
-=item B<msitranslate=BOOLEAN>
+=item Default Value
+
+0
+
+=back
+
+=item B<msitranslate>=I<BOOLEAN>
+
+=over 4
+
+=item Description
 
 Specifies that MSI-INTx translation should be turned on for the PCI
 device. When enabled, MSI-INTx translation will always enable MSI on
-the PCI device regardless of whether the guest uses INTx or MSI. Some
-device drivers, such as NVIDIA's, detect an inconsistency and do not
+the PCI device regardless of whether the guest uses INTx or MSI.
+
+=item Default Value
+
+Some device drivers, such as NVIDIA's, detect an inconsistency and do not
 function when this option is enabled. Therefore the default is false (0).
 
-=item B<seize=BOOLEAN>
+=back
+
+=item B<seize>=I<BOOLEAN>
+
+=over 4
+
+=item Description
 
-Tells B<xl> to automatically attempt to re-assign a device to
-pciback if it is not already assigned.
+Tells L<xl(1)> to automatically attempt to make the device assignable to
+guests if that has not already been done by the B<pci-assignable-add>
+command.
 
-B<WARNING:> If you set this option, B<xl> will gladly re-assign a critical
+B<WARNING:> If you set this option, L<xl> will gladly re-assign a critical
 system device, such as a network or a disk controller being used by
 dom0 without confirmation.  Please use with care.
 
-=item B<power_mgmt=BOOLEAN>
+=item Default Value
+
+0
+
+=back
+
+=item B<power_mgmt>=I<BOOLEAN>
+
+=over 4
+
+=item Description
 
 B<(HVM only)> Specifies that the VM should be able to program the
-D0-D3hot power management states for the PCI device. The default is false (0).
+D0-D3hot power management states for the PCI device.
+
+=item Default Value
+
+0
 
-=item B<rdm_policy=STRING>
+=back
+
+=item B<rdm_policy>=I<STRING>
+
+=over 4
+
+=item Description
 
 B<(HVM/x86 only)> This is the same as the policy setting inside the B<rdm>
-option but just specific to a given device. The default is "relaxed".
+option in L<xl.cfg(5)> but just specific to a given device.
 
-Note: this would override global B<rdm> option.
+B<NOTE>: This overrides the global B<rdm> option.
+
+=item Default Value
+
+"strict"
+
+=back
 
 =back
-- 
2.20.1


