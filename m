Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB096A9444
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505652.778523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1sd-0001uG-Sp; Fri, 03 Mar 2023 09:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505652.778523; Fri, 03 Mar 2023 09:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1sd-0001ra-Pg; Fri, 03 Mar 2023 09:39:11 +0000
Received: by outflank-mailman (input) for mailman id 505652;
 Fri, 03 Mar 2023 09:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmbX=63=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pY1sc-0001qp-7p
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:39:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3e00a99e-b9a7-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 10:39:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8CBD2F4;
 Fri,  3 Mar 2023 01:39:49 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533233F587;
 Fri,  3 Mar 2023 01:39:05 -0800 (PST)
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
X-Inumbo-ID: 3e00a99e-b9a7-11ed-a550-8520e6686977
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/3] xen/misra: create exclusion file list
Date: Fri,  3 Mar 2023 09:38:53 +0000
Message-Id: <20230303093856.2169227-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is introducing an exclusion list for the misra analysis, at the
moment only cppcheck can benefit from it because it's the tool where we
control every step and configuration.

Exclude a file from the analysis is the last step we should do, but sometime it
is unavoidable because we can't do direct changes to it to fix/deviate from
findings.
So we declare the file(s) here and we leave the burden of the misra compliance
to the final user.

Luca Fancellu (3):
  xen/cppcheck: add a way to exclude files from the scan
  xen/misra: add entries to exclude-list.json
  xen/cppcheck: globally suppress unusedStructMember

 docs/misra/exclude-list.json                  | 201 ++++++++++++++++++
 docs/misra/exclude-list.rst                   |  46 ++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |  23 +-
 .../xen_analysis/exclusion_file_list.py       |  70 ++++++
 4 files changed, 338 insertions(+), 2 deletions(-)
 create mode 100644 docs/misra/exclude-list.json
 create mode 100644 docs/misra/exclude-list.rst
 create mode 100644 xen/scripts/xen_analysis/exclusion_file_list.py

-- 
2.34.1


