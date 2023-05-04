Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB76F6CA8
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529725.824423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlW-0003vp-G7; Thu, 04 May 2023 13:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529725.824423; Thu, 04 May 2023 13:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlW-0003u2-Br; Thu, 04 May 2023 13:12:58 +0000
Received: by outflank-mailman (input) for mailman id 529725;
 Thu, 04 May 2023 13:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1puYlU-0003tK-NK
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:12:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 61776874-ea7d-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:12:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E4F22F4;
 Thu,  4 May 2023 06:13:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFCBC3F67D;
 Thu,  4 May 2023 06:12:52 -0700 (PDT)
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
X-Inumbo-ID: 61776874-ea7d-11ed-b226-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/3] Fix and improvements to xen-analysis.py
Date: Thu,  4 May 2023 14:12:42 +0100
Message-Id: <20230504131245.2985400-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie includes a fix for a limitation of xen-analysis.py that when using
cppcheck and make parallel build, it was spuriously failing.

The second patch is enabling the tool to accept cppcheck version above 2.7
(excluding 2.8 for the reasons described in the documentation).

The final one is a fix for the generated cppcheck text report to include the
relative path from the repository, instead that the relative path from the
/xen/xen directory.

Luca Fancellu (3):
  xen/misra: xen-analysis.py: fix parallel analysis Cppcheck errors
  xen/misra: xen-analysis.py: allow cppcheck version above 2.7
  xen/misra: xen-analysis.py: use the relative path from the ...

 xen/scripts/xen_analysis/cppcheck_analysis.py | 36 ++++++++++++-------
 xen/tools/cppcheck-cc.sh                      | 19 +++++++++-
 2 files changed, 41 insertions(+), 14 deletions(-)

-- 
2.34.1


