Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBCA29381E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9026.24291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUo48-0000Iq-AC; Tue, 20 Oct 2020 09:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9026.24291; Tue, 20 Oct 2020 09:36:24 +0000
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
	id 1kUo48-0000IQ-6k; Tue, 20 Oct 2020 09:36:24 +0000
Received: by outflank-mailman (input) for mailman id 9026;
 Tue, 20 Oct 2020 09:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8HF=D3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kUo46-0000IL-9t
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:36:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49c8fcf0-143c-479b-9876-f8357475d70b;
 Tue, 20 Oct 2020 09:36:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=V8HF=D3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kUo46-0000IL-9t
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:36:22 +0000
X-Inumbo-ID: 49c8fcf0-143c-479b-9876-f8357475d70b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 49c8fcf0-143c-479b-9876-f8357475d70b;
	Tue, 20 Oct 2020 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603186581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/nKCzpQ8X+4DBrdKHo+8uPOvKbU/EZW5MQG7/VZedVU=;
  b=Nfruz7OwEQCqMMvIeeX3kThz8JT3bV5wapFC77tv/IyRKwtImltI6EmK
   WOFs01+jITvn6VZQhq2DkhCLdP7mDMBGn1Nbqd5Uk9lio+IIwEk6iTHS9
   adyuySkkWLqHwseFzPpSU31BtuMNcKyR1TaERQSEhUeEFfsqGvpt/7197
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MlBOqquFyx623KlBzQYtjTVwtk1W0nI/uPeCoFOiHA0lE8JB2ZQe70TBpRr3L34Di6TtvAS1kn
 sPxynJ4O4a6ho/ZEMWwi6gGf1d3m1ACca1Ioz1OPc5ye2oq3V8w7tKYiJogm76xtJ+Wc83Bcve
 vXTXDuKXW0C7J/Y+Ii3MsUhjb8SQRYmb1dlZo4Oy4eS+znWoExsLUVZQ/bHtRnOTPvSPCeFRK6
 z6NXBacwc6b1VT81WgwVWgHCNQ/XR5+s1z+UrxOc7FBt9mtLw14Y29jYhw8ZW+pi+/OUeCIhtG
 pwM=
X-SBRS: None
X-MesageID: 30418410
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,396,1596513600"; 
   d="scan'208";a="30418410"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] ts-xen-build-prep: Install ninja
Date: Tue, 20 Oct 2020 10:35:49 +0100
Message-ID: <20201020093549.270000-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

QEMU upstream now requires ninja to build. (Probably since QEMU commit
09e93326e448 ("build: replace ninjatool with ninja"))

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-build-prep | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index fcabf75a1686..5ec70dd538e9 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -199,7 +199,7 @@ END
 sub prep () {
     my @packages = qw(mercurial rsync
                       build-essential bin86 bcc iasl bc
-                      flex bison cmake
+                      flex bison cmake ninja-build
                       libpci-dev libncurses5-dev libssl-dev python-dev
                       libx11-dev git-core uuid-dev gettext gawk
                       libsdl-dev libyajl-dev libaio-dev libpixman-1-dev
-- 
Anthony PERARD


