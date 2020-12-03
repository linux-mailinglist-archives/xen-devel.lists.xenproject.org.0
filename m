Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244812CD92E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43601.78465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdL-0002zb-Du; Thu, 03 Dec 2020 14:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43601.78465; Thu, 03 Dec 2020 14:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdK-0002tI-LL; Thu, 03 Dec 2020 14:30:58 +0000
Received: by outflank-mailman (input) for mailman id 43601;
 Thu, 03 Dec 2020 14:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpd8-0002OV-3j
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpd7-0006UL-8T; Thu, 03 Dec 2020 14:30:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYU-00015c-KU; Thu, 03 Dec 2020 14:25:58 +0000
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
	bh=/V+Xsx5DyAJ7DrcbKg6+KBwsTjqitxu0fA7ODPAM4l8=; b=hVb/32lK4Spdb9YCTzgyRAKXwV
	HJL9l1y0sJYCte4jBiAllLWIzCAH5IIY5Vv768LWwoiA/CuY2zdF0GvMWhxPQ+gUSlEPiy49Romu2
	hwOtL4THRkREvAw3pcX6ygPOLjQELLltXAulGbUBmzA+37tBaSIeeF//51T0Hb4LX+W8=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 22/23] docs/man: modify xl-pci-configuration(5) to add 'name' field to PCI_SPEC_STRING
Date: Thu,  3 Dec 2020 14:25:33 +0000
Message-Id: <20201203142534.4017-23-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Since assignable devices can be named, a subsequent patch will support use
of a PCI_SPEC_STRING containing a 'name' parameter instead of a 'bdf'. In
this case the name will be used to look up the 'bdf' in the list of assignable
(or assigned) devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl-pci-configuration.5.pod | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index 4dd73bc498d6..db3360307cbd 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -51,7 +51,7 @@ is not specified, or if it is specified with an empty value (whether
 positionally or explicitly).
 
 B<NOTE>: In context of B<xl pci-detach> (see L<xl(1)>), parameters other than
-B<bdf> will be ignored.
+B<bdf> or B<name> will be ignored.
 
 =head1 Positional Parameters
 
@@ -70,7 +70,11 @@ B<*> to indicate all functions of a multi-function device.
 
 =item Default Value
 
-None. This parameter is mandatory as it identifies the device.
+None. This parameter is mandatory in its positional form. As a non-positional
+parameter it is also mandatory unless a B<name> parameter is present, in
+which case B<bdf> must not be present since the B<name> will be used to find
+the B<bdf> in the list of assignable devices. See L<xl(1)> for more information
+on naming assignable devices.
 
 =back
 
@@ -194,4 +198,21 @@ B<NOTE>: This overrides the global B<rdm> option.
 
 =back
 
+=item B<name>=I<STRING>
+
+=over 4
+
+=item Description
+
+This is the name given when the B<BDF> was made assignable. See L<xl(1)> for
+more information on naming assignable devices.
+
+=item Default Value
+
+None. This parameter must not be present if a B<bdf> parameter is present.
+If a B<bdf> parameter is not present then B<name> is mandatory as it is
+required to look up the B<BDF> in the list of assignable devices.
+
+=back
+
 =back
-- 
2.20.1


