Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F321A072D7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868038.1279576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpfY-0003N2-Pi; Thu, 09 Jan 2025 10:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868038.1279576; Thu, 09 Jan 2025 10:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpfY-0003LY-MO; Thu, 09 Jan 2025 10:21:40 +0000
Received: by outflank-mailman (input) for mailman id 868038;
 Thu, 09 Jan 2025 10:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHdR=UB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tVpfX-0003Km-Ae
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:21:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 821c174f-ce73-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:21:37 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-87-20-204-41.retail.telecomitalia.it [87.20.204.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 52E314EE0738;
 Thu,  9 Jan 2025 11:21:32 +0100 (CET)
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
X-Inumbo-ID: 821c174f-ce73-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736418096; bh=ZzTypflkqDi+3QAuJnRK3p/CkVQ1Vt55alRN2zi1QhI=;
	h=From:To:Cc:Subject:Date:From;
	b=i0P+BsIsnH3otBjj6iLCGC0ZW22C8IglQU2+ftVzuBODo4OYihv4xzKuFiQoi1OJO
	 beCi4qTOvtg89LDpoVpxjBsGXWYME7hXW9IIlBZQX5BnXh/URNLro81G9bGhakhhe3
	 VeQmUQqY5GJFuQTCeVFI8FSEKPKoqToN8bwmRdqiTZM/tAZ19235PSdYwg7cqXT6CC
	 0XW/m7dQyFSR+0mP3iDQAJTy6o0yCh+KLYlsDNK3JqTW0Nzg7QHPoQ5Q891VqdwdOz
	 eXkZdNB7BASM5nBud5byf/jWgLd10Z1TulR3FDvt4JkbrDdQrSEIF0o7MyeWC9jF02
	 hLHEdW4jypmGw==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4] misra: add deviation for MISRA C Rule R11.8.
Date: Thu,  9 Jan 2025 11:21:21 +0100
Message-ID: <5b8b143207a5dc0478a500cf2d41017bdb982019.1736417750.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.8 states as following: "A cast shall not remove any `const' or
`volatile' qualification from the type pointed to by a pointer".

Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
function, where the parameter needs to not be const because it can be
set for write or not. As it was decided a new const-only function will
lead to more developer confusion than it's worth, this violation is
addressed by deviating the function.
All cases of casting away const-ness are accompanied with a comment
explaining why it is safe given the other flags passed in; such comment is used
by the deviation in order to match the appropriate function call.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes from V3:
Edit docs/misra/deviations.rst, according to the feedback received.
Rebase against the current staging tree.

Changes from V2:
The deviation has been documented under docs/misra/deviations.rst.

Changes from V1:
The deviation has been refined to specify that every instance of casting away
const-ness is accompanied by a comment explaining why it is safe.
This comment is a requirement that has been incorporated into the text defining
the deviation.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ae25eeb76a..a28eb0ae76 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
 -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
 -doc_end
 
+-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
+function, where the parameter needs to not be const because it can be set for
+write or not"
+-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3A2.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 15a993d050..fe0b1e10a2 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -353,6 +353,15 @@ Deviations related to MISRA C:2012 Rules:
        Fixing this violation would require to increase code complexity and lower readability.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.8
+     - Violations caused by function __hvm_copy occur when a const void
+       argument is passed, as the const qualifier is stripped. However, in such
+       cases, the function ensures that it does not modify the buffer
+       referenced by the argument, therefore, this use is deemed safe. Fixing
+       this violation would require to increase code complexity and lower
+       readability.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or other
-- 
2.43.0


