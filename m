Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C064CB253BD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 21:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080218.1440768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGvC-0008R3-VS; Wed, 13 Aug 2025 19:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080218.1440768; Wed, 13 Aug 2025 19:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGvC-0008Ot-SN; Wed, 13 Aug 2025 19:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1080218;
 Wed, 13 Aug 2025 19:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaOB=2Z=gmail.com=nicola.vetrini@bugseng.com>)
 id 1umGvA-0008Mm-N8
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 19:14:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c478ef-7879-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 21:13:58 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 605154EE3C05;
 Wed, 13 Aug 2025 21:13:55 +0200 (CEST)
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
X-Inumbo-ID: a9c478ef-7879-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755112438;
	b=xYpRKG0Du5MG9elu+KVdUZcS71KNziGvjzX5TOOeQ+qOXLyxBmPpC9DnnSz1/7OCsSW/
	 ZlUeUUOtolTiZ2w8hEICuhjhyyYI/mOslVdko3ZAk6D59Re7OCCu7u7FXyV/uSUjIaMk0
	 gVVdPVu+X6QHkZvbZJLZIkayAqxVoadGYlpw6cBqb5UUjdOtj+cqTvjtfwC+9nplbShfs
	 2brMdWfUzHNBOhWWbFJCTNq9+k+cwrk+5DS7pNZHE1rGdMyG7EnYV6kTqgQtszyr03Fz4
	 7k6mHip8BS2AjgLrkkuQjnMKg+aOVslkHxsMeDjA4YNkSx37XQByL/7vGFf4gzvddIrHL
	 WaDP0FCDrw982v718GixZIRmsDMhU1yZEGQx6emuEtQS7069Prc1izkdD0G66H0o/nx/d
	 +GBs7qh8+8bb4U3YxUxV8CXECDBKptqazVgc1klt3NZfhqv9E3D3rECD6J8PWulS8fUNp
	 cntKESnJY3M16Gy+IhuSXXz++g0WaWXJH7MT1ijGm8YyKfjxsEMJZJxSGA09h0jPzkQkc
	 as31F5Gl2Zc5WdRTAr+RdDUuUWg4S4LKV5NLxjJSv+7eOWUrNK7M2Sal5648AGQ0+k8WK
	 RQ2bOaNic8tIeCreo9mA1teB8GADkuZqHnZqHYMts64Peug0MVsfSuUfpi24V7I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755112438;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X8Z/Iy3vEL05qlHR3iwBDCDEqtsnD159/f7F2D0+DUs=;
	b=i6ZvIGiNHShaLfpmOXmHMrPxxxR11TeZd46h0tCg6aSV3BEFcnS/37r5blbbkCMdB5cK
	 kUIAusgTbkFlUxn8+9TMbi4o1rFFYBcolN8i6NxwQv0quIyXKVrgMtH7xT7sqLg67eOYw
	 E0MD7HUOYJFdjahoz4rqevsfk30GfVuaz3KN0nRN/IeRUEUCRZcHtNd6cX93oWI5Mim0E
	 2UH9Ze4Pl2Ifvn6/mVsRN8Bq1bnP3jlo/ieZI3hD5xx1fQvQqV6rlfZ/w/ajclj2V4Y5w
	 RW+147oYe+gI/jhIaRiwl27yTBTyaPmnifjKyYMdRXnS7JpovXrG914zVHRlz1nDQ0IwH
	 w5mMLpFa3NTMo9xV0BwHXftIglaIV7nFosC5AI4C7JAXYVKbE58Huk8nKplLHmPHDiGm9
	 ok8v6LPqP3BwOiwprBVysBTiznh3/GoG9YR6FlUi4mAJ3jqrt2zLz/BL7l/64ksPzi3hU
	 pz+IYNVnX40ESwbqeR2VztlC03+8fgVY+jwxq6TlKn9tHlSMpnc8VPx+3zyeY8AL3c2T1
	 owe1So80mE4OR3zsIAIfDF2ROINyEW6YaoPtBlIj5kCNi9pHFKBcGxvwI54z7vL6ykKJ2
	 MOWo2qKIycsZiAMt6BzvpotWbXU+6ZZM2CGUAqohbaWbIj0dT9R8NkkXhXSdvx8=
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
Subject: [XEN PATCH 2/3] xen/macros: Drop alternative definition of BUILD_BUG_ON(_ZERO)? for old GCC
Date: Wed, 13 Aug 2025 21:12:49 +0200
Message-ID: <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755111932.git.nicola.vetrini@bugseng.com>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@gmail.com>

The toolchain baseline for GCC is 5.1, which supports _Static_assert
in c99 mode

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
---
 xen/include/xen/macros.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index cd528fbdb127..f9ccde86fb23 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -40,9 +40,6 @@
 
 #ifndef __ASSEMBLY__
 
-/* All clang versions supported by Xen have _Static_assert. */
-#if defined(__clang__) || \
-    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
 /* Force a compilation error if condition is true */
 #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
 
@@ -54,11 +51,6 @@
  */
 #define BUILD_BUG_ON_ZERO(cond) \
     (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0)
-#else
-#define BUILD_BUG_ON_ZERO(cond) \
-    (sizeof(struct { unsigned u : !(cond); }) & 0)
-#define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
-#endif
 
 /*
  * Force a compilation error.  This is for code which, in the normal case,
-- 
2.43.0


