Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACEB917460
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 00:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748148.1155738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMEx8-0005Ua-8r; Tue, 25 Jun 2024 22:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748148.1155738; Tue, 25 Jun 2024 22:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMEx8-0005T6-6C; Tue, 25 Jun 2024 22:47:54 +0000
Received: by outflank-mailman (input) for mailman id 748148;
 Tue, 25 Jun 2024 22:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sMEx6-0005T0-SB
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 22:47:52 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e62b71-3344-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 00:47:51 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 171935566625863.208364233485895;
 Tue, 25 Jun 2024 15:47:46 -0700 (PDT)
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
X-Inumbo-ID: f2e62b71-3344-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719355667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T4bcsKU05hfX3R6EXK5W72cvPEHJJGcA/pYTDCd2H0dOUwlm5jMWfwD9lOuSQymJSjO0YFfis3R2hlOqQAo6UM5mD3HulQFjJUvC9C1d4VmBmmIEgapt6CTy/wCkyTHtjuQIBVesA4/rAkgjFkzZ4dFj1vy5PR+5uugiKO0msGE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719355667; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fjBA7qEiORBtB5xbabiMCCsVJFWSho8KsNxAHHf2G4A=; 
	b=dAfX1lgdsROhXa/mJieP39MzS61EbUBI1ZOesqT+fUuGng8QsvoAwjqr/A2MxbsutKjPYsrMJ2viyJ6Z7dZhluiQ8K/WPhM3gw4y8Lx7Kfuis9K25nTpH8bJa1l2tLuuO5s886J4FzmfejFndxig42YXIfVYwAK6FdKJKyzdgVU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719355667;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=fjBA7qEiORBtB5xbabiMCCsVJFWSho8KsNxAHHf2G4A=;
	b=MKM+FyOf4Bger0diWpWt2VSAhJDLBrvh+l3sINoTB5eZ7X+Q00ykS9/+rkYdhLe2
	pAZY2SNFtXdaSua5KKMf/+ykU7ABlaApL3oNS3ILSPiGK13PKFbC7fiEbl+H0GlKKSF
	ubpF/S9ReXKEiRqeqDX/0xNozr1/e96DKuzAHXFI=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
Date: Tue, 25 Jun 2024 18:47:38 -0400
Message-Id: <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build integration script for oss-fuzz targets. Future fuzzing targets can
be added to this script and those targets will be automatically picked up by
oss-fuzz without having to open separate PRs on the oss-fuzz repo.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 scripts/oss-fuzz/build.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 scripts/oss-fuzz/build.sh

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
new file mode 100755
index 0000000000..2cfd72adf1
--- /dev/null
+++ b/scripts/oss-fuzz/build.sh
@@ -0,0 +1,23 @@
+#!/bin/bash -eu
+# SPDX-License-Identifier: Apache-2.0
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
+./configure --disable-stubdom --disable-pvshim --disable-docs --disable-xen
+make clang=y -C tools/include
+make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
+cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
-- 
2.34.1


