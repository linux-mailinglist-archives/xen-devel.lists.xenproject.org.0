Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6EB1F054
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 23:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075243.1437694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUph-0001pI-NN; Fri, 08 Aug 2025 21:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075243.1437694; Fri, 08 Aug 2025 21:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUph-0001mB-KW; Fri, 08 Aug 2025 21:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1075243;
 Fri, 08 Aug 2025 21:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHVc=2U=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ukUpg-0001RO-H4
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 21:41:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fc2c88c-74a0-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 23:41:00 +0200 (CEST)
Received: from nico.tail79467d.ts.net (93-57-251-141.ip167.fastwebnet.it
 [93.57.251.141]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 49F5F4EE3C10;
 Fri,  8 Aug 2025 23:40:58 +0200 (CEST)
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
X-Inumbo-ID: 5fc2c88c-74a0-11f0-a324-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.57.251.141
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754689259;
	b=q5g7RvThsuYjmcpBItnZcbFV9lVRoa5sTlyqsaJ17n+nRnMD5iPp+5SOh0xOGvczGUQK
	 0FaJkU6Xh4mXo6BnaAfewvWoVwkcxfdgKbEHLU7SsMG7gJ4BjNypNgGIjPDfC8/lHUmq7
	 xUGuBrQKsmgUEIOFrowpYEB+cpShayMOlOR/DF8CiWXmBbdYPhCxUxdyGH0MvPQgTrg6Z
	 LgiPyYRDe66a6MFFTyqfvUjuxDD57v9zF9DE3+eKaw+zzBqlrYeh81NKxhHkmQfwT4a85
	 X5hGvwjQf+5M+kHagn7tTGfjUn4nBif2k839RB+t3DgvzNWKUxHdVjlqRTyUaKaXRJ9+d
	 kP/LUqMctQZR3HD/dHkkumUVwpSHJan0o9QUcIqIVB0LOF/T4qTAcVAEL5A9vBhdZ3AK0
	 SlE47Tx8Ieds9yRzMV89W2xfJnLN/Fp5+xs8XSeFbKnH5PTRpIbbqm0ROA1q6WAFNzQZF
	 Ci2fDcJQme7fZ+7/j0mgQ0I34MMvLwst6FkV6CFGGBno7cn09f+C9f15e5IRwcC6K9gFb
	 8WeIr/MGByHMjYP2o/eHVotugVnEnZHrh4zCiP+iCBPulHnR8rNU/v2kC6DdMbP2ONLPE
	 f3j8TkCCQyrlJlMDyfCKsQRl+t/zQNNxSM1XovBdkSwfV8UO2sU9sid+wVrVhEY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754689259;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NGuzVXZc9lVbFupjO0fco9+V+MPeZQpDHOKUM0agI9I=;
	b=PuVOB3kGCIWKxZSRdepALhZMBzzlpFCTdwU9KWNpECW618asLW0TbcUDesRxFjmFinbc
	 9qgTVLgjDXkZku0kLiannJj2lP4HyoGbyD0EjAKtCvWGz843l7UOpEVV1v/0eJ7w8dI8O
	 vZr+w6VvP96PiaQtGQvq5DdesaOaJVUSjKmTyGGKOIJsaMkP2iZ8cw1CwpJ2ifuQDQzpf
	 mzmEFUcq6o4XEAhJzciuo93+igxkBY6dVf3D46dl0G9n4dB1zStAn1N9CCdvOXP6CXWQn
	 1zGVStea10bl9aWbaebQQdLH4czUdSq+hIPEt5BoxK/5sPYt/NJZceAJ5MbyZHkVkQVim
	 772nQAwA7okaVB+711FCPAPF+rD2SOeUjygUB4JwkHeoyuuzg4RFNjYstmdAlXoAPAb8d
	 roS2bavCgJm/FYMk+S/MlkqoYEDqYlkCRzwi+ILPaumD0CRBoVBdar7vANf1joTKszUXT
	 YNJHW+oQjfw1AYuz2lIn1GvLvTKXqbUvctCp277x8Mf5F0nbZjVjyidDr6K384v8YKJsR
	 yKpBVvj35y2R3z9m3OOyaX4QIzJBDdavMu5lIhmiVHzOM39DZRuqXWyyq4ESRmzphIgLU
	 kKpm3setpvm26KBoNKgC9wgBeDR1bnEpXmdmKHUMcYZ+Ax2hucjR7CBKX9X+xRc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.57.251.141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754689259; bh=buA/oGxgBNRfiekroD96f1pJfErjZVJm/KPiOe3FnYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CQyQp2dxXXLn6ZSntdNlo+sb89wTqyioUBjI6rF1wZwcBsaaZyFhAZh4S/48oS4io
	 mAyFCSN4DUXK3fpGo4kQoc9Quhu5/EttADb48L2Nfl17RVZmOCBvmuHcfhi5os5Bk9
	 tGS3SE4/3KsdqGvGKRqI44HxJjjS6Ils1O0oWrhthBAkni+iWJ9dw2UTvvp3dx0fF5
	 LPMSzBilHeadatxTfcRJEOn3Uy3a6+mPF6aYgScRsyq5KePU0KmMqTYdiV9zUbi5JX
	 AHo2JsrR8VfrHYSOpinEPgOquEVFikUxyqq19GVtILmC0Fzr5MtH41x7YlFlTO0O1z
	 wAtnuWYZZ++pw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	dmytro_prokopchuk1@epam.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving asm side effects.
Date: Fri,  8 Aug 2025 23:40:47 +0200
Message-ID: <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule states: "Initializer lists shall not contain persistent side effects".
The specific way in which the 'mrs' instruction is used does not lead to
visible side effects for the surrounding code.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Not yet tested on the Xen ECLAIR runner, as the syntax used in the deviation
is only supported after updating the runner.

What the tool is reporting is that due to the '=r' constraint and the
semantics of the instruction, there is the side effect of writing to '_r',
but this is not observable outside the stmt expr. The deviation ends up being
a bit too general for my taste, but the restriction on the actual istruction
should be enough to limit applicability to cases that are arguably safe in
practice.

An alternative approach would be represented by stating that side effects in
'READ_SYSREG64' are safe, but this is not true in general.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ec0cac797e5f..6b492e38505d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -437,6 +437,10 @@ write or not"
 # Series 13
 #
 
+-doc_begin="Consider the asm instruction to read an Arm system register to have no side effects."
+-asm_properties+={"asm(any())&&child(text, ast_field(value,^mrs\\s+%0.*$))", {no_side_effect}}
+-doc_end
+
 -doc_begin="All developers and reviewers can be safely assumed to be well aware
 of the short-circuit evaluation strategy of such logical operators."
 -config=MC3A2.R13.5,reports+={disapplied,"any()"}
-- 
2.43.0


