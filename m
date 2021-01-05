Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B02EB1B1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62110.109781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqPx-0005Pp-Q5; Tue, 05 Jan 2021 17:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62110.109781; Tue, 05 Jan 2021 17:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqPx-0005P2-MK; Tue, 05 Jan 2021 17:46:49 +0000
Received: by outflank-mailman (input) for mailman id 62110;
 Tue, 05 Jan 2021 17:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqPw-0005OQ-4N
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPv-0006IJ-Ps; Tue, 05 Jan 2021 17:46:47 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPv-0008Uy-IE; Tue, 05 Jan 2021 17:46:47 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Y8PbmtYpQowGDJUtA704ovt/LSU9vc1pqSwcHoxEmjg=; b=hkac7kaicppGsyHdEXWkiMd4e
	1cr9lH9OTqO3WutvRnnpP9xDVvqzOjGuzjkMob5DcmdQA7yrmFd4i5KO6heS+aZy2gUdR5v9bVzWF
	IaJeV3iSc4MPHO7lzWfrr2LL7vIJE8+LH/c13NV1bMP+xlNzvEDehUXtn/OffCm7RmcSE=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v7 1/7] docs/man: modify xl(1) in preparation for naming of assignable devices
Date: Tue,  5 Jan 2021 17:46:36 +0000
Message-Id: <20210105174642.2754-2-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
References: <20210105174642.2754-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will introduce code to allow a name to be specified to
'xl pci-assignable-add' such that the assignable device may be referred to
by than name in subsequent operations.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl.1.pod.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index af31d2b572..f4779d8fd6 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1595,19 +1595,23 @@ List virtual network interfaces for a domain.
 
 =over 4
 
-=item B<pci-assignable-list>
+=item B<pci-assignable-list> [I<-n>]
 
 List all the B<BDF> of assignable PCI devices. See
-L<xl-pci-configuration(5)> for more information.
+L<xl-pci-configuration(5)> for more information. If the -n option is
+specified then any name supplied when the device was made assignable
+will also be displayed.
 
 These are devices in the system which are configured to be
 available for passthrough and are bound to a suitable PCI
 backend driver in domain 0 rather than a real driver.
 
-=item B<pci-assignable-add> I<BDF>
+=item B<pci-assignable-add> [I<-n NAME>] I<BDF>
 
 Make the device at B<BDF> assignable to guests. See
-L<xl-pci-configuration(5)> for more information.
+L<xl-pci-configuration(5)> for more information. If the -n option is
+supplied then the assignable device entry will the named with the
+given B<NAME>.
 
 This will bind the device to the pciback driver and assign it to the
 "quarantine domain".  If it is already bound to a driver, it will
@@ -1622,10 +1626,11 @@ not to do this on a device critical to domain 0's operation, such as
 storage controllers, network interfaces, or GPUs that are currently
 being used.
 
-=item B<pci-assignable-remove> [I<-r>] I<BDF>
+=item B<pci-assignable-remove> [I<-r>] I<BDF>|I<NAME>
 
-Make the device at B<BDF> not assignable to guests. See
-L<xl-pci-configuration(5)> for more information.
+Make a device non-assignable to guests. The device may be identified
+either by its B<BDF> or the B<NAME> supplied when the device was made
+assignable. See L<xl-pci-configuration(5)> for more information.
 
 This will at least unbind the device from pciback, and
 re-assign it from the "quarantine domain" back to domain 0.  If the -r
-- 
2.11.0


