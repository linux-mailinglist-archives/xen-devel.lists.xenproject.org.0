Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766329739D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11201.29721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztd-00011X-3X; Fri, 23 Oct 2020 16:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11201.29721; Fri, 23 Oct 2020 16:26:29 +0000
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
	id 1kVztc-00010m-VR; Fri, 23 Oct 2020 16:26:28 +0000
Received: by outflank-mailman (input) for mailman id 11201;
 Fri, 23 Oct 2020 16:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztb-0000v2-GB
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 897b0fc5-8dbf-4bc1-a5d7-e01dd3117c9b;
 Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008NQ-Iu; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqp-000376-2n; Fri, 23 Oct 2020 16:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztb-0000v2-GB
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:27 +0000
X-Inumbo-ID: 897b0fc5-8dbf-4bc1-a5d7-e01dd3117c9b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 897b0fc5-8dbf-4bc1-a5d7-e01dd3117c9b;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=um7JEb+Wnwt5fiP5c5wstzbmPuQS6pAhcCxDSP4apgk=; b=h5SsgST+sCAoFHA0FZRabee9q
	wdqGgTts8Q9LxErYlEfoXtNMvcoMJhvNZ4RqeFk5rNDVjjVyjcTwXGc5dXCmRcc98y0a9vjvMksym
	7Zg1ekeRnIeRPdDR8jUG672LLSFypFD7c+SRhcNBHhmJY9ZUp5Il4+ifEae8unb1nexQ4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008NQ-Iu; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqp-000376-2n; Fri, 23 Oct 2020 16:23:35 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 18/25] docs/man: fix xl(1) documentation for 'pci' operations
Date: Fri, 23 Oct 2020 16:23:07 +0000
Message-Id: <20201023162314.2235-19-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

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
index 5f7d3a7134..373a52839d 100644
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


