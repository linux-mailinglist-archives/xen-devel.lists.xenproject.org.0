Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858CA3F5CC0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171096.312431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCW-0003q7-Hn; Tue, 24 Aug 2021 11:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171096.312431; Tue, 24 Aug 2021 11:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCV-0003Ql-EG; Tue, 24 Aug 2021 11:02:39 +0000
Received: by outflank-mailman (input) for mailman id 171096;
 Tue, 24 Aug 2021 11:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2b-0003Ux-At
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48f60f1f-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:50 +0000 (UTC)
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
X-Inumbo-ID: 48f60f1f-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YhvmbSKSt9wr4FJapgNfP9qgY+cjnLZoYpUfU64Omx4=;
  b=OD124aVh5dRg4IkQW1Th7urGn+hmXAS6zJafypl5xQyaYyviSd53ebBh
   Q70QTzXwOGLD6iJN09C07GUA5tPFFVeSnxWJkhXIY0dXHGENJbPCbFFd6
   x6V9PQQK9fVymGysjW0U1xodvSsSRR+74ibFC0VGYop1FYJ+WhptImKQa
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Sznb641ImOy9jyj6Kijbb4mP9qWLSYcVPgJISeJFmPQTfDExDsNe0FhZmPF9wtvzSY5GDhz3dg
 0yxtde55cFuxJMRccrivKELVrB5O3Htw0oI1FMV28nIpgr+HV55kepeFkMPmY+9mOoEYF6p4rd
 Si0JD2i1o+GijjpLL60IHVwTQLMiugx7y6KMBJwAjaRVqM4fBxjG1T2ynoWawozeXKV8mixcGR
 9C/lWBkEXIxoNgfhiVX8OpZ7k1Jvw5Qd/lnQM9s+kCvZ2EHE26H7VgPDGORYZUNlPELTpjL7xR
 STXfwmjVaBrqVUiTus7fK1fE
X-SBRS: 5.1
X-MesageID: 51166384
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:M6310qBubL9GktnlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166384"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 29/51] build: add an other explicite rules to not build $(XEN_ROOT)/.config
Date: Tue, 24 Aug 2021 11:50:16 +0100
Message-ID: <20210824105038.1257926-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

GNU Make will try to rebuild every Makefile included with the
"include" directive, so everytime Config.mk is used, make will try to
build ".config". This would normally not be an issue, unless we happen
to have a rules which match. This is the case with Kconfig in xen/.

While we had a workaround in "xen/Makefile", this ".config" files
becomes an issue again in "xen/tools/kconfig/Makefile". It has a
target "%.config".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index a62c761be8d1..f1043a78a332 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -11,6 +11,10 @@ __build:
 -include $(BASEDIR)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
+
+# Don't try to remake this file included by Config.mk.
+$(XEN_ROOT)/.config: ;
+
 include $(BASEDIR)/scripts/Kbuild.include
 
 ifndef obj
-- 
Anthony PERARD


