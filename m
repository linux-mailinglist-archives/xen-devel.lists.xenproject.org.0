Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E712D32E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47765.84576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAI-0004yj-LM; Tue, 08 Dec 2020 20:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47765.84576; Tue, 08 Dec 2020 20:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAH-0004wL-VU; Tue, 08 Dec 2020 20:00:49 +0000
Received: by outflank-mailman (input) for mailman id 47765;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004p5-Kg
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086K-Rj; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihM-0001p0-56; Tue, 08 Dec 2020 19:30:56 +0000
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
	bh=BBwaFwKiybbCIqgc9tMzuIzX22z57wEbmB7dmgtI4NU=; b=Mqeq+2l/Zz1BLnK4Q0P079EKns
	h8ldMBHO1UCEvz0JlDZ2OPbBjkD6rB+dRT2/K9bCLOtqFdZfbmXG+48LSmO2DDMQJJqGEVlD22SBW
	4LX8VtzScFEsUv4h2pfot21Hz1ESVMSveqpMMot7crI19OavCeM9GXrEjFcngOtp1aP4=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 17/25] docs/man: fix xl(1) documentation for 'pci' operations
Date: Tue,  8 Dec 2020 19:30:25 +0000
Message-Id: <20201208193033.11306-18-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Currently the documentation completely fails to mention the existence of
PCI_SPEC_STRING. This patch tidies things up, specifically clarifying that
'pci-assignable-add/remove' take <BDF> arguments where as 'pci-attach/detach'
take <PCI_SPEC_STRING> arguments (which will be enforced in a subsequent
patch).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl.1.pod.in | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index eaa72faad6a0..af31d2b5727a 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1597,14 +1597,18 @@ List virtual network interfaces for a domain.
 
 =item B<pci-assignable-list>
 
-List all the assignable PCI devices.
+List all the B<BDF> of assignable PCI devices. See
+L<xl-pci-configuration(5)> for more information.
+
 These are devices in the system which are configured to be
 available for passthrough and are bound to a suitable PCI
 backend driver in domain 0 rather than a real driver.
 
 =item B<pci-assignable-add> I<BDF>
 
-Make the device at PCI Bus/Device/Function BDF assignable to guests.
+Make the device at B<BDF> assignable to guests. See
+L<xl-pci-configuration(5)> for more information.
+
 This will bind the device to the pciback driver and assign it to the
 "quarantine domain".  If it is already bound to a driver, it will
 first be unbound, and the original driver stored so that it can be
@@ -1620,8 +1624,10 @@ being used.
 
 =item B<pci-assignable-remove> [I<-r>] I<BDF>
 
-Make the device at PCI Bus/Device/Function BDF not assignable to
-guests.  This will at least unbind the device from pciback, and
+Make the device at B<BDF> not assignable to guests. See
+L<xl-pci-configuration(5)> for more information.
+
+This will at least unbind the device from pciback, and
 re-assign it from the "quarantine domain" back to domain 0.  If the -r
 option is specified, it will also attempt to re-bind the device to its
 original driver, making it usable by Domain 0 again.  If the device is
@@ -1637,15 +1643,15 @@ As always, this should only be done if you trust the guest, or are
 confident that the particular device you're re-assigning to dom0 will
 cancel all in-flight DMA on FLR.
 
-=item B<pci-attach> I<domain-id> I<BDF>
+=item B<pci-attach> I<domain-id> I<PCI_SPEC_STRING>
 
-Hot-plug a new pass-through pci device to the specified domain.
-B<BDF> is the PCI Bus/Device/Function of the physical device to pass-through.
+Hot-plug a new pass-through pci device to the specified domain. See
+L<xl-pci-configuration(5)> for more information.
 
-=item B<pci-detach> [I<OPTIONS>] I<domain-id> I<BDF>
+=item B<pci-detach> [I<OPTIONS>] I<domain-id> I<PCI_SPEC_STRING>
 
-Hot-unplug a previously assigned pci device from a domain. B<BDF> is the PCI
-Bus/Device/Function of the physical device to be removed from the guest domain.
+Hot-unplug a pci device that was previously passed through to a domain. See
+L<xl-pci-configuration(5)> for more information.
 
 B<OPTIONS>
 
@@ -1660,7 +1666,7 @@ even without guest domain's collaboration.
 
 =item B<pci-list> I<domain-id>
 
-List pass-through pci devices for a domain.
+List the B<BDF> of pci devices passed through to a domain.
 
 =back
 
-- 
2.20.1


