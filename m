Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9B9628D5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 15:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784839.1194240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIsi-0001c1-20; Wed, 28 Aug 2024 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784839.1194240; Wed, 28 Aug 2024 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIsh-0001Zt-VZ; Wed, 28 Aug 2024 13:38:39 +0000
Received: by outflank-mailman (input) for mailman id 784839;
 Wed, 28 Aug 2024 13:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9ut=P3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sjIsg-0001Zn-RQ
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 13:38:38 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ba5330-6542-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 15:38:37 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 1724852306670261.24261591500965;
 Wed, 28 Aug 2024 06:38:26 -0700 (PDT)
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
X-Inumbo-ID: d2ba5330-6542-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1724852308; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z3AhUZM4obUdwIZun6TURgGCxhMh5jKOkglTsl1EJg72at/VDGChmLJjc0c+baH/3w/aXYEEuuAQm2Nw5BjqbDshbaevnc6CRAqAje7t5JYg7YEVb31Tdyv7E1sSUtcgaQVxRfS+dL783Prk5tLA4ehfUlDf5w1OnoPvbEiS5Kw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724852308; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h5izV+gy9kms6C1QElYdVAc20fiMd6pHKbrRU4zUrIk=; 
	b=OgnanZK7kHoGZsnfXU4pTOM0a319/1V3uF5oQFyN/QH0o4462c/9XCoj9Pk5Io27uryFMI83AnB8Jn5DQ5NKrImaFo+a1uexUMfQ/RcD1wzXZ2y7CS83zJTu/kZtTgC6bx91JablKOHhZueERMaon5tDGM40ZOTjjksNlWwYSiQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724852308;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=h5izV+gy9kms6C1QElYdVAc20fiMd6pHKbrRU4zUrIk=;
	b=Fki3e9fvkLDsBeTxSMje7Ny9qbhiJrs8ryIOiSDOm8R94ojW4cSDZT8Ua4ixWy2Z
	Ki5Xga3AoRpWeCzCjxS/gId9PqeOwTETveFNYn3jfa6VTXW99jdfQaZABSSmMudi8k+
	DDQ6r72TH8JoLceUVmYJ1FqzdKPqcbTkaj6/uZ2Y=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] oss-fuzz: Fix coverage runtime error
Date: Wed, 28 Aug 2024 09:38:23 -0400
Message-Id: <20240828133823.1114-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The oss-fuzz infrastructure collects runtime coverage information for debugging
and fuzzing evaluation. Currently it appears broken due to missing C files.
This is because the fuzzer's Makefile only symlinks the C files from various
locations in the Xen source tree into the build folder. These symlinks however
are gone as oss-fuzz uses separate docker containers for the build and for the
run.

Update the oss-fuzz build script to copy the required C files into the
build folder to fix this oss-fuzz specific issue.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/fuzz/oss-fuzz/build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/fuzz/oss-fuzz/build.sh b/tools/fuzz/oss-fuzz/build.sh
index 08eeb66e4c..002d86c44f 100644
--- a/tools/fuzz/oss-fuzz/build.sh
+++ b/tools/fuzz/oss-fuzz/build.sh
@@ -9,3 +9,7 @@ cd xen
 make clang=y -C tools/include
 make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
 cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
+
+# Runtime coverage collection requires access to source files and symlinks don't work
+cp xen/lib/x86/*.c tools/fuzz/x86_instruction_emulator
+cp tools/tests/x86_emulator/*.c tools/fuzz/x86_instruction_emulator
-- 
2.34.1


