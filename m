Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329799F50EE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859412.1271541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaN4-00071c-2U; Tue, 17 Dec 2024 16:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859412.1271541; Tue, 17 Dec 2024 16:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaN3-0006zU-Vp; Tue, 17 Dec 2024 16:24:29 +0000
Received: by outflank-mailman (input) for mailman id 859412;
 Tue, 17 Dec 2024 16:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAop=TK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tNaN1-0006zO-M3
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:24:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6161773b-bc93-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:24:25 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id E593E4EE0738;
 Tue, 17 Dec 2024 17:24:23 +0100 (CET)
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
X-Inumbo-ID: 6161773b-bc93-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734452664; bh=nNvsqr0VCk5Pzf6ZRTEPm1/KB8uV5pXnIQ4aAQnURrc=;
	h=From:To:Cc:Subject:Date:From;
	b=QRoySKfSoF2LJ0bimMdwQ9nCCoIE3VfTm0/wG3dw3F28rqBZJMG2KnAVJAFv6yKUr
	 tlQu9y+P2ou3eN8oFSJJgQjG5PELqI5wEZr4USy1cCnQ3xrn9MvZf6ye7wO0YWPo2Z
	 zF5Kz81+110o8C3DC58xRS0IROVMFpiZeiK2ma8O+loJzoChWduFYt3GszlwG9hqfy
	 vX5noKywEu/4i+l6ebasHDWFWUYYcYk0sZWaB/nAU40uk/hYDayE5UdUo0EzJ6TM+I
	 GYPfx9kS6kTvdTPdJpvqGz1wnGz8BmXMtUrdpEQfhFBG15fw8zm2wFlmdRPJtzHR9l
	 s16txLjqm62xQ==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper3 <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] eclair-analysis: Add usage of varargs extension for C99
Date: Tue, 17 Dec 2024 17:24:20 +0100
Message-ID: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This extension name is missing from the current list of extension used
by Xen, therefore is must be added to that configuration in order to
avoid violations for MISRA C Rule 1.1.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 86e9a79b5231..9b419e562afa 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -100,8 +100,8 @@
     ext_enum_value_not_int: non-documented GCC extension.
     ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
 "
--config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
--config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
+-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
+-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
 -doc_end

 -doc_begin="The maximum size of an object is defined in the MAX_SIZE macro, and for a 32 bit architecture is 8MB.
--
2.43.0

