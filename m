Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009D912DBE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 21:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745496.1152625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKjiy-0004cR-U9; Fri, 21 Jun 2024 19:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745496.1152625; Fri, 21 Jun 2024 19:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKjiy-0004Zy-RX; Fri, 21 Jun 2024 19:15:04 +0000
Received: by outflank-mailman (input) for mailman id 745496;
 Fri, 21 Jun 2024 19:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DyDD=NX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sKjix-0004Zs-8W
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 19:15:03 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dbed7b9-3002-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 21:15:01 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 1718997295610207.92573120373834;
 Fri, 21 Jun 2024 12:14:55 -0700 (PDT)
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
X-Inumbo-ID: 8dbed7b9-3002-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1718997297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lmBCt5pBbNYjFmZyPlSRLuMAFEqEphvoDur25CfuXdCjCoFPezjyY+Yh2w+fxHeixaMJ/u1lDuCAg3uBCcdKt6F68EmPCuf70uRXzcaFB+hUey8KvER50Hql2p4bFqANN0TZuBMUu14v3DPla0UFCMkrqOfAPVsJGUMz+8Z6RWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718997297; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=az0Awjr8iknR6afX3DlNO8NfaAjpi0YMFq021oOMFmo=; 
	b=IWRfIBJ4pshWHRZQW2gx5RyYOpZTeWdoxmXya1Kl6AQHFC+TrtZDjynbbD+ACXc2lMBzPKEBBuTeJuIkm4sPpz7CUvN+D+2Z7HSDuofK+9CnDh0+fdVDDds9hzkUFrj9fCRFeZoPCp8MTc7A2RHW6b2lUI8YsNzFIpRxPuuH4aQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718997297;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=az0Awjr8iknR6afX3DlNO8NfaAjpi0YMFq021oOMFmo=;
	b=FUQ2HeJwKsXuF+TfhMrpOGfdEpQ4hW3axk2sbLvNT6BfDAuETyE2do1XYJ3fJ2yd
	IcGCPFJK78lQDcAoCXX3ILpgEHYWRpc8NvMX52Iiv6PdYEF/fhNMgFipLINmeB8+3AF
	wep3QxFr9YRyoap1w2qKCR3TYYyWJu7UKo1mptj4=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
Date: Fri, 21 Jun 2024 15:14:34 -0400
Message-Id: <20240621191434.5046-2-tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621191434.5046-1-tamas@tklengyel.com>
References: <20240621191434.5046-1-tamas@tklengyel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build integration script for oss-fuzz targets.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 scripts/oss-fuzz/build.sh | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 scripts/oss-fuzz/build.sh

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
new file mode 100755
index 0000000000..48528bbfc2
--- /dev/null
+++ b/scripts/oss-fuzz/build.sh
@@ -0,0 +1,22 @@
+#!/bin/bash -eu
+# Copyright 2024 Google LLC
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at
+#
+#      http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+# See the License for the specific language governing permissions and
+# limitations under the License.
+#
+################################################################################
+
+cd xen
+./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen
+make clang=y -C tools/include
+make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
+cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
-- 
2.34.1


