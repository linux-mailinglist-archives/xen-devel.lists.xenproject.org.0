Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BE12ADD9A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 19:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23650.50574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXwu-0005OA-ON; Tue, 10 Nov 2020 18:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23650.50574; Tue, 10 Nov 2020 18:00:56 +0000
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
	id 1kcXwu-0005NL-Hg; Tue, 10 Nov 2020 18:00:56 +0000
Received: by outflank-mailman (input) for mailman id 23650;
 Tue, 10 Nov 2020 18:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXws-00059I-HE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:00:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ebb0dff-749e-4c82-9d0c-1cd728dfa451;
 Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXwh-0006qv-JA; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoQ-0007RC-Dc; Tue, 10 Nov 2020 17:52:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXws-00059I-HE
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:00:54 +0000
X-Inumbo-ID: 0ebb0dff-749e-4c82-9d0c-1cd728dfa451
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ebb0dff-749e-4c82-9d0c-1cd728dfa451;
	Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=uc5JF4Aw3pRQS5p/Kqsvv3JLTlI3UZvcoVyjRuBT19E=; b=zj6e0f7fy52Y1xBC/zGW7mf+Y1
	GNZm5L6ykgc9s4kMtsaF3VKO26F25xfyQUVSeBINvPOnGgwfLfCzM8xCGq/xM9AJeOZsL9yiVSfSc
	3uBgCNI0WZiQwsqxSIBYTd2Qh2pJ9kKMhtdEnNkmn93CCoTAOnCyJP6CNQZtcvvDWd14=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXwh-0006qv-JA; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoQ-0007RC-Dc; Tue, 10 Nov 2020 17:52:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 21/24] docs/man: modify xl(1) in preparation for naming of assignable devices
Date: Tue, 10 Nov 2020 17:51:44 +0000
Message-Id: <20201110175147.7067-22-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will introduce code to allow a name to be specified to
'xl pci-assignable-add' such that the assignable device may be referred to
by than name in subsequent operations.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl.1.pod.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index c5fbce3b5c4b..0822a5842835 100644
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
2.20.1


