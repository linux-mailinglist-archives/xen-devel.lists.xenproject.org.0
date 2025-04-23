Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6CA99999
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965298.1355894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gy7-0000Or-4R; Wed, 23 Apr 2025 20:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965298.1355894; Wed, 23 Apr 2025 20:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gy7-0000Lj-0b; Wed, 23 Apr 2025 20:45:19 +0000
Received: by outflank-mailman (input) for mailman id 965298;
 Wed, 23 Apr 2025 20:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iEkW=XJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7gy5-0000HG-LW
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:45:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcd333f2-2083-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 22:45:16 +0200 (CEST)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id A475A4EE3CA0;
 Wed, 23 Apr 2025 22:45:14 +0200 (CEST)
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
X-Inumbo-ID: dcd333f2-2083-11f0-9eb0-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745441115;
	b=wqUiu8PzR0153AROb/mFaRMKQ68KlR+qjOebgh6zk9NIR41E5oAafICQYozXudYWUoOW
	 EpuBCkIpiy/mlq4+6itrMA/qyhENLmS5Bi1EBFZwybOov3dKvfpXziA5QxwQBZiErjByr
	 5OUHwEa/KnG+8SVijTBzENlxH/8UFI0QG1c8+CWcT6exSEjj6KjVRfiYFUi5VNP86lSta
	 tCbhFSFiYit+MlW3YxFtDmdqcwOZ/CeH8nPe2e+WC4qya9qTw8MLLyX+VUpH/KHNgCRzV
	 zs+TAbPS56Y5lBzo/wAfmEjCza3uNYEKiPK7JSG3m8wL1BHvBAs1fmbDASzahqCylMBLy
	 VCu/b1+7fO3EO9mgFkd0Ey6SDjlLF1E+GID3C/iki9bhpl96ZaYtWo0604J16xT1DHDTn
	 kIywkiZEEYXjYneSFv/OI19bGbnzANntglGH9DiMPI5kmTuaQFBXDYpm1ln0TK9zn1VSA
	 1kBYhKzdq0HM+E7zULJcOnks6uaY76hUzgl8TpMnogWQMvmhoeXIRfbSV9oqeXCMjYchU
	 EGMZO9H/0iRxsVt9YhUOYOLFUtlzcugv9kyRC2KhGlYSldPJLvztFSJD9VGz+pKMpNIE6
	 U8jC/XqyQKocWvWxGo8ZBzPchONJmHDP466ZfonmMc6r7L4eM1cJSwrX4899zV4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745441115;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QSRbeFNyBTwi1rlnE1pBrrm0cMRFfPjjwxbw65+ew2E=;
	b=ZLv9eZw0yyZwMIv2Y0M+gDIXPl8YmKnOk3BPHWrXlcan1jFukeJqNY0etcWh++mvl9Ul
	 YBvADuv7pk8/jM5kmAOg8BBJvEIJIHe8cBFTlWMajjrIPX9XNZSMPNZ69JV016Y7c1Igr
	 Z2cMwVfP/8NXfqtf+yIJLjEF9Q2quPuRkuUdk5dW+4Mvdr1oaZhX1yb7xmyghEdDzWWXt
	 lkCqwHAk/6AfUOyGLRzylHD/k+pY0ovp5ZnDJo4UKl9nTFq9yz5P4zzvt8WrK9KMWO15A
	 VklV9oaqBbJG0pYaTbUZ6t53m2ygfWutCpre5Nu86c5MFF0n8Tt1TAAXweOu0R0EpcUWh
	 QmUJkbrIBeA68EyV/hgOdkbl5YtnQd5dUjpYujw+o7bm0L8CxSBUl4fU3ttasNQlKRQoc
	 Ka24cu7huJXCUOx04EvPCbUXWTv0GzPmrRTHVDEmQ4nxRjWYvJu53hqSraHMsqNCpdzs2
	 oWax+lgxpjmKy2cv5K2gZIfgvXnGLl98gEjjdTOXnv5tzszBgSIGAjXkD8qOG23RvbW/K
	 V9CCdTxo3pTN1H2eo3OneY/Cbc9Yv/Y7+DIPCg2oFCuoYSN9uhna46BPCAqLftdVI9a/E
	 XjV8LwHLgmpi3RS26CGlOanG987LnNwD6MpK9ti3X+Z/gLGKX4NoaqDiuJ8ecmU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745441115; bh=xwFsdFxA6ryyyRsJ/8Xlk6C4M0YNcSTCIrKaVzKZnuY=;
	h=From:To:Cc:Subject:Date:From;
	b=PVcKqoH3tmxPl/y6KAVhsuwbck6KkDDc2NYXwnjGjB01QzUVts36bxIRNUC3q1fM8
	 +5Lf1LVo3rhWXkqWyzd5PHDoj5JISE7QUEcgTyAONXQkTg2X84e2My8JdvkNWz7MEP
	 eQaQ/MUjdU46x5pdTf0eh+WYNC521uAYvW/KfyB+Dv/XUjO6/a1GIMykyu0H3gTz9m
	 UFTfAFeqAg06Lz4WdBM1sdECgFkp8jtAQAqhPN/LmLumKFzaQRAxbAoJVObZqAReBI
	 gV2uNUWeebuJMR7AdXtnWvlf5Yv75LgkrIZ7YXFVZBhlcnl5X/ypNF/0cC3KeRdSOh
	 o2Tl4cI0jw/uw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] misra: update list of GCC extensions used by Xen
Date: Wed, 23 Apr 2025 22:45:11 +0200
Message-ID: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__inline was not mentioned in C-language-toolchain.rst, while
__inline__ is not used in code under xen/. __inline is kept because it
may be used in Xen. The ECLAIR configuration is now consistent with the
documented extensions in the rst file.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
See [1] for a patch that introduces a use of __inline. Rather than
remove it because there are no current uses of that alternate spelling
before shortly bringing it back, it makes more sense to keep it in both
places.

[1] https://lore.kernel.org/xen-devel/20250422113957.1289290-1-andrew.cooper3@citrix.com/
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 5 +++--
 docs/misra/C-language-toolchain.rst             | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 8ebf9f132cf2..b8c041d2d36e 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -18,7 +18,8 @@
     __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
     __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functions Provided by GCC\" of "GCC_MANUAL".
     __builtin_va_arg: non-documented GCC extension.
-    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
+    __const__: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
+    __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
     _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
     typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
     __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
@@ -30,7 +31,7 @@
 -name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
 -name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
 -name_selector+={const, "^__const__$"}
--name_selector+={inline, "^(__inline__|__inline)$"}
+-name_selector+={inline, "^__inline$"}
 -name_selector+={static_assert, "^_Static_assert$"}
 -name_selector+={typeof, "^(__typeof__|typeof)$"}
 -name_selector+={volatile, "^__volatile__$"}
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 5ddfe7bdbe10..5d4db857d198 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -86,6 +86,8 @@ The table columns are as follows:
           see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
        __const__:
           see Section "6.48 Alternate Keywords" of GCC_MANUAL.
+       __inline:
+          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
        typeof, __typeof__:
           see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
        __alignof__, __alignof:
-- 
2.43.0


