Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4FCC058B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 01:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187600.1508957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVIqP-0003De-5z; Tue, 16 Dec 2025 00:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187600.1508957; Tue, 16 Dec 2025 00:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVIqP-0003Bf-2O; Tue, 16 Dec 2025 00:23:13 +0000
Received: by outflank-mailman (input) for mailman id 1187600;
 Tue, 16 Dec 2025 00:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZqM=6W=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vVIqN-0003BG-Mf
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 00:23:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62809d7d-da15-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 01:23:03 +0100 (CET)
Received: from nico.tail79467d.ts.net (93-44-185-214.ip98.fastwebnet.it
 [93.44.185.214]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 29B0A4EE7F07;
 Tue, 16 Dec 2025 01:22:58 +0100 (CET)
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
X-Inumbo-ID: 62809d7d-da15-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765844582;
	b=zGEHrltTWPdDbRAyM6K9wDWxymADggaZG6fzIlglH3wVm2cDicyRDsoy4aRu7e4wvrJR
	 Oo+B5a29gWH9Wy4V2a2pCjmxNdsoyBZr8s7H8GsyzubrPIUJmUf7LTjDApK/V0r07/dZw
	 Od+HwCZ9HIOXnzbmxiyunn5ht2L/Ajpb2Wj3zD3w3EYLewfSg2ZUkkLMLdxbD8zenvNVm
	 2qHkDZqGqVKBjmk5bjN99Eu6OXAgwDivs+LYv2R7TPBkBdSxjRI+X6QOcwZlg5uHKjr0E
	 2rhij/E181VVbAjZufGM1+8HQrfYakyidiAWLCIgBzObiNnTUdC+/Z+wWaF30cToPgx6n
	 XP+FKKOAom/ahwS92iZyI3+LrbigxEs27AqSI4t5OPip+Qpnftx6ItAStpSs1WyFnWpbh
	 E8XY8x1y9lJv0gvUso4vJ35aY7ZxjtJvqSauUyUWL1ZX62tv2ZnOqaT4lZIS/kCgM8Kxc
	 1+UlR3bf045s7/wy07CkBbP+uoDlu0IpLZsjwwmAlfz7erIHcrxPQUd+E5+MVoEu0RbzG
	 hTMQQdRtA/Dl0W4to26NLmSDXqNHHgHCF42Pgfen+Bl3Fajdmz9nPmuZvlKz+tWIbPrh9
	 k6sLRntbm+jWTgCQhDbk2deOtkMs7Wi+tDQ2JZpVMq57Fw+tOdK3QvGsuF6M8zY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765844582;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WdMNly/zURqI76BJfEXjjsKvFJGrqlZNOGTi8OcXOMc=;
	b=FQNFurfwHEJjYRx2/nhtDdDi/KucWaSEzfj8kdVM4Ni8HXIhCbbZq0jH+fkADEKRuMAC
	 N30bTlpyerOqupty8VsEdbpKXVjJxDLwlmPusb3cETP+PXihAFkAnUTUdKIvQ5N+EpMvX
	 X8u++BT5Uo8F36ETZGmC1ZRI1el5yUxJL0BkVDZ94iedbKeK59n2AyKeqEV9SDtaGZZmJ
	 oPu0H2APuLRrQRjMz7kSSXa1pHMlzkWqBYSQsarayG/jtThaFYYvowYK85ZMdIuO8VNkK
	 LMhrd4hYCnpAsyyyljJCBoGvMnmf2gtmd3/I+2nSxC6Jo1ST6dhkoeqLCWsM0XS2TGlKL
	 uTunqVVybwYzA2RPw335L/EmbKH3cfqdCvOxuNO90kXTs2w28eV0n3pLz7Kjs+RhEeQps
	 aPEEMQsXjqxlw66hVQthmfQZjaR7Q5mt3oaCgtAInTfYFxlD6LRInNA6ftjh6NCk7Q7yx
	 8e73ezul493qbHZ27/kvBDq8b6cW20LPpOGWSOgt8HH/LKZpXN2PHIRwuTQkMcbHp3dmH
	 iokswVA9kBelk7ae+3wwhKT95PuFWNJUyyQpZuUQ3y+/1DppPuTyzqlfieL/LMkFEx4Km
	 a0mI45OkGuBvvN65ysN0xA0iJnZK4ta599rpOaXD9Ll+Ph5eywn4/F3Triwx5qM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765844582; bh=me4e3FkuyO3ZIHzqKYFSvYGmfLuhj2voW8l2K91NigU=;
	h=From:To:Cc:Subject:Date:From;
	b=C47mmfJQ2BLJZ/Xn9eKB72bAl9gKtxuoBIXwp8NX8weY+XutFlTYz1MFlB0JLWT3Y
	 CsBzdyM0+dM8ZItoUbLCjuoiJkYxNf6v2inIzMYO4GtNG+JktRmQUc3fNE91AdQfnC
	 XvzkiImrGjxTULaM8PapsQKzLzXLqlgwSw7w2UDNhHNQuoG7L/Xh2bc0zAvDRESsTR
	 xlv/QMTnYqEs6kKjVNwUsu+/YtR3NkBrBarnCCnhGWrIYRLtVZf1HXD9GYLvE4o6Ur
	 UCbtrp9KYV+HwMcE+7ScLuRxtQo+TpUuxBBKrjphRdsGj+fzwfnxbBqRFdfHHk/ABQ
	 m7RyLyNpbmnMw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] misra: extend toolchain assumption about source character set
Date: Tue, 16 Dec 2025 01:22:55 +0100
Message-ID: <5351e65c12a4fcc0a27b5e18102030ccf20bd28a.1765844467.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the ARM64 compiler, the same assumptions can be made about
the X86_64 toolchain.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 1 +
 docs/misra/C-language-toolchain.rst             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 842f8377e561..4bc88aa02942 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -210,6 +210,7 @@ ext_sizeof_alignof_void_type"
 
 -doc_begin="See Section \"1.1 Character sets\" of "CPP_MANUAL".  We assume the locale is not restricting any UTF-8 characters being part of the source character set."
 -config=STD.charset,behavior={c99, GCC_ARM64, "utf8"}
+-config=STD.charset,behavior={c99, GCC_X86_64, "utf8"}
 -doc_end
 
 -doc_begin="See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index cb81f5c09872..ec0c9953be1c 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -400,7 +400,7 @@ The table columns are as follows:
      - See Section "4.15 Architecture" of GCC_MANUAL and Section "3.1.2 Data Representation" of X86_64_ABI_MANUAL.
 
    * - Character not in the basic source character set is encountered in a source file, except in an identifier, a character constant, a string literal, a header name, a comment, or a preprocessing token that is never converted to a token
-     - ARM64
+     - ARM64, X86_64
      - UTF-8
      - See Section "1.1 Character sets" of CPP_MANUAL.
        We assume the locale is not restricting any UTF-8 characters being part of the source character set.
-- 
2.43.0


