Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB797357E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795383.1204737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRu-0005xs-GC; Tue, 10 Sep 2024 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795383.1204737; Tue, 10 Sep 2024 10:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRu-0005u0-D0; Tue, 10 Sep 2024 10:50:18 +0000
Received: by outflank-mailman (input) for mailman id 795383;
 Tue, 10 Sep 2024 10:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snyRs-0005eE-VK
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:50:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 761832a1-6f62-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:50:15 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 69CD44EE07BE;
 Tue, 10 Sep 2024 12:50:14 +0200 (CEST)
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
X-Inumbo-ID: 761832a1-6f62-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725965414; bh=aoNTUKoXfcXXjlXwKVUxj5UZJoOJwzKkIhTK6KbP6Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQf4juL96tsmyJOZNAqdJ25r9X/6rUgt1kSKVnCkenztbeOExd6BnibvXrsJBINr7
	 G9YEgOIPrO3ATLt+bpjkykNfe+CYgHwg7xxsKjgRnhRoYEuaGTaiqtRqE4xgMKKxHS
	 g1J7s3lBCMe5gjCdiuueDeZYviuA3KvQcyPF1hNHXY2iLB4cSNXOk8RVgk0FekMDiu
	 HF8bM9zU5VssUX7w4rGf8NE3rd2p9T1lEFJKIZ3NYZMNHi3SSMIuHnaDLY16MqeaZs
	 0XyZnUjGU8JlcjjE9E8YZguvhzj6joVPW6chLl/RLEeH8KAfUGqZXm5spT5hcteE7x
	 DgHFImGw5CuLw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 1/2] automation/eclair: update configuration of Rule 20.7
Date: Tue, 10 Sep 2024 12:50:06 +0200
Message-Id: <2e77768c0f0e4c3cdae099201bcceca635158bf8.1725963889.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725963889.git.federico.serafini@bugseng.com>
References: <cover.1725963889.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 20.7 states that "Expressions resulting from the
expansion of macro parameters shall be enclosed in parentheses".
The rational of the rule is that if a macro argument expands to an
expression, there may be problems related to operator precedence, e.g.,

define M(A, B) A * B

M(1+1, 2+2) will expand to: 1+1 * 2+2

Update ECLAIR configuration to tag as 'safe' the expansions of macro
arguments surrounded tokens '{', '}' and ';', since in their presence
problems related to operator precedence can not occur.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes from v1:
- more details to justify the deviation;
- split modifications in two patches.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9051f41602..e0d9426b7a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -581,6 +581,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
 -doc_end
 
+-doc_begin="Problems related to operator precedence can not occur if the expansion of the macro argument is surrounded by tokens '{', '}' and ';'."
+-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
+-doc_end
+
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
 a macro and used within the body for both ordinary parameter expansion and as an
 operand to the # or ## operators have a behavior that is well-understood and
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b66c271c4e..69f93a6a91 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -534,6 +534,11 @@ Deviations related to MISRA C:2012 Rules:
        refactoring it to add parentheses breaks its functionality.
      - Tagged as `safe` for ECLAIR.
 
+   * - R20.7
+     - Problems related to operator precedence can not occur if the expansion
+       of the macro argument is surrounded by tokens '{', '}' and ';'.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.12
      - Variadic macros that use token pasting often employ the gcc extension
        `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
-- 
2.34.1


