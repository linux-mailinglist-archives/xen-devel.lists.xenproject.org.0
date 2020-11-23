Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA32C1289
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35008.66394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khG8v-0000up-PO; Mon, 23 Nov 2020 18:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35008.66394; Mon, 23 Nov 2020 18:00:49 +0000
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
	id 1khG8v-0000rt-Bw; Mon, 23 Nov 2020 18:00:49 +0000
Received: by outflank-mailman (input) for mailman id 35008;
 Mon, 23 Nov 2020 18:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khG8r-0000mX-DF
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khG8q-00070r-Dd; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtm-0000at-0a; Mon, 23 Nov 2020 17:45:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8r-0000mX-DF
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=YcXfMQGt7JCycdtTvU5ue8RUHb6lcyzpJs/F2AZGOVM=; b=LaCR8JlKTnIY8XPMT1QVGLDtH
	EVQqVETA0EWBL+UWNfT19D7HEt6t+GGAI1TZVPxT4n/hZv5vneixIls+pso2Aq29CtafMBjbAWhnl
	bZ3dE252zZNT2SzxHuUB8eXDgBKaAXqi/kL+kngG4TSStn4GJ/ZQzMQRhPjWKetbcarPY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8q-00070r-Dd; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtm-0000at-0a; Mon, 23 Nov 2020 17:45:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 16/23] docs/man: fix xl(1) documentation for 'pci' operations
Date: Mon, 23 Nov 2020 17:44:56 +0000
Message-Id: <20201123174503.6800-17-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently the documentation completely fails to mention the existence of
PCI_SPEC_STRING. This patch tidies things up, specifically clarifying that
'pci-assignable-add/remove' take <BDF> arguments where as 'pci-attach/detach'
take <PCI_SPEC_STRING> arguments (which will be enforced in a subsequent
patch).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl.1.pod.in | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index f92bacfa72..c5fbce3b5c 100644
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
2.11.0


