Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52045B253BB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 21:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080216.1440759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGv4-00088b-Oy; Wed, 13 Aug 2025 19:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080216.1440759; Wed, 13 Aug 2025 19:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGv4-00086a-Lb; Wed, 13 Aug 2025 19:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1080216;
 Wed, 13 Aug 2025 19:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaOB=2Z=gmail.com=nicola.vetrini@bugseng.com>)
 id 1umGv2-0007sc-Fs
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 19:13:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5f331ad-7879-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 21:13:52 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 0285C4EE3C05;
 Wed, 13 Aug 2025 21:13:49 +0200 (CEST)
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
X-Inumbo-ID: a5f331ad-7879-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755112431;
	b=WUSxfd6QKmXCEYL1lgv5Kf+5yGRKv/zdL9MdCPOIs1qRRMinh+Y7Gc48Cse+T3QDPWOi
	 2nLy+tnZ/ur/E8qfecWkOVnWqHc3VyyTk6wiNhiWqlHOhmNmlsZ3e2ctkrOvX6O32n6Hb
	 Kp1oAde6rdGjjL57yO087x/8b/XVkAYjTgZQFdcx/WXi+poXrkMfaLFdwBfVpm3dbnHwh
	 6ytm1iKTqUD6KlR4RDuy+fQp5VSYIrSeBaG6tdsEn4wWhAgU4/PdbTM1A91hT4vuFX8Gv
	 uu/AqmFmlBE8CUMWNZNzHSlNRf8bbFTIldkl/QfWmLvozJ+S6AU5+3eI8Bo1gApW/G7rL
	 ZKCzjnwHwwqnJtMgUaAzLmBerwgqRKZopJf4V1VLVRL5q7dsj7IczMA2YdIj+XxKuKmOk
	 yRLxZYbba/GWUwU00j5QY4UlSy+7YC59kpDKVPmKHePF4hkRZfaFZUBoK7vjSN1GjKjd0
	 oxafUra7G4kzrGn5aK17sLe7J2GD9SE5b5jzdTVFgWXJsLw31+Q4WKYHc0xI9aX4dlS5i
	 QFnjE56UDUwEzI1XoK8jgw2K8HHozBfABrWdhm/OklJTWIzF7V1VI3yUSnX/Qiyy+Sign
	 h+FbofBVsM4FSsMcP62I41aYQLfcaxfBTYYW+m2cZ+xJ+7uVaXpVZFhXGS547DI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755112431;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VOKEf9dD+zgMtMXQ5hikRxtG6VewsOUliCA+rvTuy60=;
	b=kPGNecuzv54LVaDjZZTgvZLLDFeW6GmBzKh9OEc2AMuOqUbItm34KJtOCCf8h+pYEsSw
	 uGZYJeQJDyUy0nMojOcfx42EIw2Guzm1TNC3NKSrU2Gy3yvDVIvmAPo+mAD6pqKS/0Cxb
	 yDvD6dgwvzfi1IPmaYHDLrqYID4XLH+xbiSuJw6MkEnkvDCCUwX1Mz1Ydrq3etsSUqv4k
	 isvxyDljWTCC9nIL/KefZGFVwb8NEe7UKi3zxJlLZLD4OrUtKC/9CBxuHGBiGbep3l76u
	 DY+dBcNRfb1wIU3AGa9XcwZXexZcgEVQRrqFss2+ZFYUvtZ9t3fimpmfqTasZU99OV9Tq
	 7/Ag22e77Fq3yO+ts3cFkPBDSAg6TvaJLGd+1/+GQn7EI2eYxQQDVmeXI+QsIw5FEdqIx
	 EKWlfgd6qVksSEHbmzAzZFcDEdaTNurVac72udjbJaIb4AuDSc+WK8KYbPAR/Z4kx95uG
	 nocdmpb177yC5oF+jwyDyHNC4px3n3viwADQVQZdZyOdMDoSjGQ/vklNfaFuUc1qbjbsu
	 Cs6I6e7Mo20i1MvtUAvdt25C//Z7tr7kOSYzXbtXMXaA9SnBcviWdk+7D9/MVjpfN88aG
	 AR+5E57+o7hKD2DbysKWHLXb5SfYhgbRV5CYFPpejCuV7voHOnCebkeI+mkc01E=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
From: nicola.vetrini@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/3] xen/compiler: drop alternative unreachable() definition for older GCC
Date: Wed, 13 Aug 2025 21:12:48 +0200
Message-ID: <9215845f364527203efaea9dd1019cd1e3c1768b.1755111932.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755111932.git.nicola.vetrini@bugseng.com>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@gmail.com>

The GCC baseline version is 5.1, which supports __builtin_unreachable(),
therefore the alternative definition can be dropped

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
---
 xen/include/xen/compiler.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 735c844d2d15..88bf26bc5109 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -47,11 +47,7 @@
 # define cf_check
 #endif
 
-#if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
-#define unreachable() do {} while (1)
-#else
 #define unreachable() __builtin_unreachable()
-#endif
 
 /*
  * Compilers estimate the size of an asm() block for inlining purposes.
-- 
2.43.0


