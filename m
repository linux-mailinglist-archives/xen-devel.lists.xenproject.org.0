Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C541A03AD6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866158.1277436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5cJ-0002Pj-V3; Tue, 07 Jan 2025 09:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866158.1277436; Tue, 07 Jan 2025 09:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5cJ-0002NS-Rq; Tue, 07 Jan 2025 09:11:15 +0000
Received: by outflank-mailman (input) for mailman id 866158;
 Tue, 07 Jan 2025 09:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zac/=T7=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tV5cH-0002Lq-Bn
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:11:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 565f5bb6-ccd7-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:11:11 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-87-20-204-41.retail.telecomitalia.it [87.20.204.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 0B47F4EE073E;
 Tue,  7 Jan 2025 10:11:08 +0100 (CET)
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
X-Inumbo-ID: 565f5bb6-ccd7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736241070; bh=UoO31GcfZ3JwHGshg9nzIAzs7hqs8F9dpMBk7TPFhO4=;
	h=From:To:Cc:Subject:Date:From;
	b=SSsrSm9TfzaWwfjPKPfFCoULpi5hQFNHib/FRefcFtIRaRuXMZsf/+dz65Sd2EpkM
	 sugFSIniIgeR+4hNo/SIPVKFQ/d3ptJvkqKaC2a2LO+AElNRr9WVp/mEkThmim3VY6
	 umzTCNaiplF2zOvXoXRyxnIlG+70iEQ/kGHd0FV3mRpaTwnBnqSRNJtMNWLyz/87rM
	 vaSpC2UScq+j61+Of4JQrvs24W0cfh0SF/gRHwqG8HDN3Gp+4nL+rmQvdXnI602HYd
	 56d1nF73D9xROJLTfEwuYDyjOI5sS39ZLlIDp4IRXYm9gOFfQnBP9vReXITKnnL56C
	 lJXN+ziRiU9kg==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3] misra: add deviation for MISRA C Rule R11.8.
Date: Tue,  7 Jan 2025 10:10:48 +0100
Message-ID: <4a2c68bdc11a815cb8531be305e2e7fc4bef7779.1736240655.git.alessandro.zucchelli@bugseng.com>
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
Changes from V2:
The deviation has been documented under docs/misra/deviations.rst.

Changes from V1:
The deviation has been refined to specify that every instance of casting away
const-ness is accompanied by a comment explaining why it is safe.
This comment is a requirement that has been incorporated into the text defining
the deviation.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2f58f29203..c9d06b44f4 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
 -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
 -doc_end
 
+-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
+function, where the parameter needs to not be const because it can be set for
+write or not"
+-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 15a993d050..92dcc91e3a 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -353,6 +353,13 @@ Deviations related to MISRA C:2012 Rules:
        Fixing this violation would require to increase code complexity and lower readability.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.8
+     - Violations caused by function __hvm_copy occour when a const void attribute is passed,
+       as the const qualifier is stripped. However, in such cases, the function ensures
+       that it does not modify the attribute, therefore, this use is deemed safe.
+       Fixing this violation would require to increase code complexity and lower readability.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or other
-- 
2.43.0


