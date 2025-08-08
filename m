Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAEB1F053
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 23:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075242.1437684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUpg-0001Wo-Bl; Fri, 08 Aug 2025 21:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075242.1437684; Fri, 08 Aug 2025 21:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUpg-0001Vm-83; Fri, 08 Aug 2025 21:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1075242;
 Fri, 08 Aug 2025 21:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHVc=2U=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ukUpe-0001RO-CJ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 21:40:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d5af0e4-74a0-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 23:40:56 +0200 (CEST)
Received: from nico.tail79467d.ts.net (93-57-251-141.ip167.fastwebnet.it
 [93.57.251.141]) (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 2DBBE4EE3C0F;
 Fri,  8 Aug 2025 23:40:52 +0200 (CEST)
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
X-Inumbo-ID: 5d5af0e4-74a0-11f0-a324-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.57.251.141
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754689255;
	b=AcpM+x1ANmqfogQxztAXLaV/H0O0g7zpQiC0m7fUlkZLGJSmCUsDBJbmZtPkyRO3/us8
	 850U/OAzvdj4IEssXRpXMvg0YlXOq5w5SJiETBfvKGz6mnGGT8fJsEgbXmdUaQw9Z4k5j
	 HZZxfyJMvnF1kni5/wogW89q7riDhcPjWX+LhwS0vx5AEInmniEMt9LdzAUrc32ykppr2
	 s2VOvi3VAFF/Dp4AxKxiq1KGwUV/gK+r3Vbve0EAsajyPfYdPVaTvA5hGrVyo9zdUS4c0
	 VKgQyyydUUQ7xQPQRCSHJExYsJa3Nad6maMjIA7W1U3uEe1WCG+FxBFAxTZuytcz0yXkk
	 TcN6vKag1Y1XOzPGc4V4olW679/zaZPBHDZ2hBfo5dFdNdfWvlePuOKGbgdyp4qzhR0yc
	 iFGyfCjtqBab8xBZbuKJ25QJbDEc4pOt8pPfNtOEki/ReNOnjqFETQ4RALZkzwsFrh6GB
	 kZ28/lGriAyolE6RVhM1ltpq0rornWktfhu53Zaol1eLk97HlF/n3o5C0TKjXVSYuY/K8
	 nNK8AaDjojGhEtRFXh6wuvN7USKszs4pOaGmKza+utQeauGQu3hcv/lbE7hZlKw66JkFE
	 Wz2axYkWxPmd6cv9rrMwZ03GJLvSc2beZcIRadIRWNxANg8+FmgRsz5xHxyJlE4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754689255;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ceLU869e29JG31IlOZ9OqwoMLz6q4g1Sh4I2G9VfcPA=;
	b=ludvSVCmVazeOOAoua/i1kRG+95zylb5l3bGzLaEX8rJItKAeKDmQJe8a+n5ZLfSsuyl
	 yX2a7QLkDVXAaXM7qLU5K+VTWlJWurCcWIFMlv1j/Qz+B590OYoX2nxhsnWzCuH9XHje4
	 zxcJzadt0rE/D3J0JMfb6qa/RiH/9NAyvXHMmmgL0RoCFn3gwWvu5jxNOtqCBAL4nQsww
	 zwiv5AJiIZq+nzQ0FMDJFprstFYnbi0AoScWEtFwj/VaVRGyNDZrMCVPDDc5Xj/jHJiMb
	 1tqN8h6fBwO+PC9kEseVWynsyl8deEmR0wZD1qAAEYzOgA74qJ0QQcr1z1bhyYrkey7Th
	 RhQszi1pI7kod5fBI+NVbM660Sih8QTeSmfimaH/dy5ruNBApn0zg1HNvN6jaAK45Upxl
	 JrobnAXST+obPfuN38iiJ1xldhAzepnD6IKe0GGZi8p2EIU31A5+PYLqFtV2sB6GqNCaF
	 a+KAW0YfaU+s+KSlvbg7+cA6Eg/J8Iz8hmVq9ff6eOsExbTL/QKmOzRdQeIFGgQ6AL/bZ
	 1prNLQjSXvjZhnEPjw9DgCFkqsrmFagUHs0JSFNrqPsEj2Qk8zjnEoMjz97IW1O6F/WhC
	 T2pM6oO8wOiLX9CwNzR3znt3mfc2OAeWV3oJidedQaNS84nKzXZoKGcLVGNzICw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.57.251.141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754689255; bh=zO9FAG2I+pMJXMZeo32isS7tt845hhaI+5ng7/nc4g0=;
	h=From:To:Cc:Subject:Date:From;
	b=QpEP4XRQlocmAmu9MOnWgHUKej4gOmx9KcRKiG+k4MuZR3isLPzrH4RfHTYrGKifp
	 /ku5T6Aiw6OLpBjuYgfBEOnreZo6sf3zO2BhySxd07cEe5+AATMGKwSIlwBdOoU1Cu
	 xHgPsFxhPTMAhfswvg8vXe9yO6WYkGzncmsud0HiA9PaXx4TP1Z2vK92AiF5iVSLNu
	 a5v6iiebicgNXAN+J9qP75v5NgKtJhJpe+MQFgU04lhKWox+nSDPvyAzmSU+qcYtXG
	 iV6zCukiM2kxQTT8nf1jfKPJdQbKROlxul/UHSurhbwvUG78Zp4XCrZcd4bNwJ4FzL
	 58eVbtVtBTPnA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	dmytro_prokopchuk1@epam.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 1/2] automation/eclair: ECLAIR configuration changes due to GitLab runner update
Date: Fri,  8 Aug 2025 23:40:46 +0200
Message-ID: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update configurations to adapt to the new syntax used by the newer
version of the tool in the GitLab runner.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This will of course need coordination with me to update the runners
just before committing the patches, as any analysis done in between will
fail due to syntax errors in the tool configuration files.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ebce1ceab912..ec0cac797e5f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -536,8 +536,8 @@ safe."
 -config=MC3A2.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
 -doc_end
 
--doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
--config=MC3A2.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
+-doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as -Werror is used) if one of the enumeration values is missing from the switch."
+-config=MC3A2.R16.4,reports+={deliberate,"any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,ref(enum_underlying_type(any()))))))"}
 -doc_end
 
 -doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
@@ -596,10 +596,10 @@ in assignments; (5) as initializers, possibly designated, in initalizer lists;
 -config=MC3A2.R20.7,expansion_context=
 {safe, "context(__call_expr_arg_contexts)"},
 {safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
-{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
-{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator(assign), lhs)))"},
-{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"},
-{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(case_stmt), lower||upper)))"}
+{safe, "context(skip(__expr_non_syntactic_contexts, is(subscript)&&node(array_subscript_expr)))"},
+{safe, "context(skip(__expr_non_syntactic_contexts, is(lhs)&&stmt(operator(assign))))"},
+{safe, "context(skip(__expr_non_syntactic_contexts, is(init)&&node(init_list_expr||designated_init_expr)))"},
+{safe, "context(skip(__expr_non_syntactic_contexts, is(lower||upper)&&node(case_stmt)))"}
 -doc_end
 
 -doc_begin="Violations involving the __config_enabled macros cannot be fixed without
-- 
2.43.0


