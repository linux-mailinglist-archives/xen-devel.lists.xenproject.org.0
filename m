Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B3A84D18
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 21:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946232.1344198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xdP-00047V-VO; Thu, 10 Apr 2025 19:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946232.1344198; Thu, 10 Apr 2025 19:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xdP-00044N-SO; Thu, 10 Apr 2025 19:32:23 +0000
Received: by outflank-mailman (input) for mailman id 946232;
 Thu, 10 Apr 2025 19:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FIM=W4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u2xdN-00044H-Ep
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 19:32:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84700375-1642-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 21:32:19 +0200 (CEST)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 13ADB4EE074B;
 Thu, 10 Apr 2025 21:32:17 +0200 (CEST)
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
X-Inumbo-ID: 84700375-1642-11f0-9eac-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744313538;
	b=lVi2pOe2GLqZXU3ZGlYyumunPJGjeztoXvpm2CyNBhwtmGK5TsIAEcw5lz7FEQXwlTyy
	 bRrDxQYNoi6OK7aDTkUNAhUFSfjpEvrVPMtXUaN+JVkWv2g/M2cI+bGjtvY8r9hNtEZQ7
	 rhdA2gcXJ95H8AlXuFDqZA5b8j/genUk3pidYliMBDvDFuY7KMmTyYLohrhjFF9yawhyW
	 tddHyhQXpdkT3jO171ER0FNhmNDhuPJyzqh5SWuEDq5M8m8wpVywbh+23B6VHTu2m5/DP
	 epoLOPZlquBC+fAi3+sZCTERYMIClY3VMDtQ2CZ4Jkc8AhrZw93MwAWG+3G00kfeCq30R
	 IWdFhHztTnpmwTnfsIn1nLl+QDnkxtcQRyf02z6J4CCDfkrLfSNyZOpC5EaXJ+p8cW5UU
	 aZDuaxYCLR8+X1YMq+2nZgLIn0La4lGVGQrejBVOSFCot3ZvZ6LDPAtYk1/YMuSvETVuU
	 7vZlSutCBM7Gk6IkDNsgCZ2qR1bcTU8Cy1cvTvLgtCuiKCZokktbmYs2mX/qm5onx4oSA
	 caJt1kuC3j12qt23m9OhhXh2kqwktYBCphGV2nXQxoiQwAA8UsETnawk6IfTaKcUEI11l
	 bhbXWeiO28/aHgAN6Q0kl9BwlCUzHnG0ZQpXp+7rgxB3r/HhbWjnVPnw/Xn0VDs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744313538;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fWsrMGnovWZ1pXwkz8UYY4Lof4sHqhm1qFlVCkeSFxg=;
	b=0P3xBhJVOB8OuIqy5gw6G+XFk0tEMjV2XY88gXAqszADAn5z0s0DVExwLMI6lGq04LYX
	 A0nfYu7U/14gyz+7aQ6k8r0LteyAuFmmXmTwL2eXFRbjafN/ksFAVP0aM7eakMZEAH3oV
	 qBBA5llNoEY6VduArWyH41NrpIFERkTcragE86l9d3TYQuSYk3Twt5WUZwjDDrgph0NvC
	 ASpArqigRd464bHV9ejSou5HjGsY65juKX7cPnYvy/s038P7a/SZuKEvhTYCve9oNS+6D
	 enl8n9nWrx325WgfTfcqVjwDOYhZFTO4OlDWPK7kMuHecLly0v3Dt0NmMt5xogxF+2cjW
	 TVUFYzMQnk3NQbPBJZxfK3kTOTs5UVT1Bamo3R+vPWQ0K2fzIZJCTMZA4nfZfkvN9sMvc
	 Sw0xowGPCv09SQqPdbdqVqc6PKAL/+p5h30QQpKdfWhAs2G4EqdGBNZC3o+Nh3R95yy1Q
	 xlwN7cUIDeqIjn4Lhj0JU4aPHSc/mfNM3N6Y7xCZEseFy3Uxwop0n3Vz8eWAXWu1fAAdR
	 +7vOaeUg9rlN6pPGAKp8s5/6BGQ1YTZAE7ZX3VR2dMPrfhKneRKStiQnGjD15OwlPviGl
	 IsOeWWOaknuQxL6aNyG+wB+b8xmiCaAwz+8HX/7UovJ0yaJTbtDCPeh3UhA7oTo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744313538; bh=Ffs5Du95wPUDjvK/AtqMfFI77Up6KB+hkBC39BJm+y4=;
	h=From:To:Cc:Subject:Date:From;
	b=pEZ0HmQltDal34KM14vG2bEWdzm5ZeZ0ph8euYC6bG7nLqnTbmBzzDgYigZHQB9/A
	 VHlWwXT7jij5mzUzihe/X4zRPmW9bL9P/IUZ/aorqTq4UKyR4WNkOnsO0nZTIXajXs
	 xEekWJ/k/44lXQfj9V+QOzEOkJaO2Y172zNeuSinYxJPnv8ryyg7k0eko9wBsTbzb2
	 L/klpZIx/vWnD7OyuYHpoTqti0kw9kNBzWFOqh2YllyGno6uKKzIO/TfeF3XQwAkAE
	 dcUpaYSiUbPLJ2uND1TNWsoDLKkKE8yoVLFqVj8WltX6jqFIxTqzNcMm2RMCK6GNjz
	 OckyjJxoNcGNw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] automation/eclair: Remove bespoke service B.UNEVALEFF
Date: Thu, 10 Apr 2025 21:32:14 +0200
Message-ID: <a2b2d290e62bf6727769af91d3955bdd989ede3c.1744313419.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The service is now part of the updated ECLAIR runner, therefore
redefining will result in an error.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---

To be applied after updating the ECLAIR runners
---
 automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl | 10 ----------
 automation/eclair_analysis/ECLAIR/analysis.ecl    |  1 -
 2 files changed, 11 deletions(-)
 delete mode 100644 automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl

diff --git a/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl b/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
deleted file mode 100644
index fa249b8e3625..000000000000
--- a/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
+++ /dev/null
@@ -1,10 +0,0 @@
--clone_service=MC3A2.R13.6,B.UNEVALEFF
-
--config=B.UNEVALEFF,summary="The operand of the `alignof' and `typeof'  operators shall not contain any expression which has potential side effects"
--config=B.UNEVALEFF,stmt_child_matcher=
-{"stmt(node(utrait_expr)&&operator(alignof))", expr, 0, "stmt(any())", {}},
-{"stmt(node(utrait_type)&&operator(alignof))", type, 0, "stmt(any())", {}},
-{"stmt(node(utrait_expr)&&operator(preferred_alignof))", expr, 0, "stmt(any())", {}},
-{"stmt(node(utrait_type)&&operator(preferred_alignof))", type, 0, "stmt(any())", {}},
-{"type(node(typeof_expr))", expr, 0, "stmt(any())", {}},
-{"type(node(typeof_type))", type, 0, "stmt(any())", {}}
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index 29409a9af0eb..399099938f45 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -50,7 +50,6 @@ their Standard Library equivalents."
 -eval_file=adopted.ecl
 -eval_file=out_of_scope.ecl
 
--eval_file=B.UNEVALEFF.ecl
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
-- 
2.43.0


