Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9F695DB5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 09:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495056.765297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRr7O-00069O-P9; Tue, 14 Feb 2023 08:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495056.765297; Tue, 14 Feb 2023 08:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRr7O-00066J-Lp; Tue, 14 Feb 2023 08:56:54 +0000
Received: by outflank-mailman (input) for mailman id 495056;
 Tue, 14 Feb 2023 08:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anql=6K=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pRr7O-00066D-2l
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 08:56:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8616a93d-ac45-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 09:56:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A9931042;
 Tue, 14 Feb 2023 00:57:34 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52C813F703;
 Tue, 14 Feb 2023 00:56:50 -0800 (PST)
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
X-Inumbo-ID: 8616a93d-ac45-11ed-933c-83870f6b2ba8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	bertrand.marquis@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/misra: create exclusion file list
Date: Tue, 14 Feb 2023 08:56:33 +0000
Message-Id: <20230214085635.3170962-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
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

Luca Fancellu (2):
  xen/cppcheck: add a way to exclude files from the scan
  xen/misra: add entries to exclude-list.json

 docs/misra/exclude-list.json                  | 209 ++++++++++++++++++
 docs/misra/exclude-list.rst                   |  44 ++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |  21 +-
 .../xen_analysis/exclusion_file_list.py       |  79 +++++++
 4 files changed, 351 insertions(+), 2 deletions(-)
 create mode 100644 docs/misra/exclude-list.json
 create mode 100644 docs/misra/exclude-list.rst
 create mode 100644 xen/scripts/xen_analysis/exclusion_file_list.py

-- 
2.25.1


