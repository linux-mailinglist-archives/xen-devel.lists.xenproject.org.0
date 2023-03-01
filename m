Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83486A6A17
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503936.776362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJ9V-0007c0-0h; Wed, 01 Mar 2023 09:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503936.776362; Wed, 01 Mar 2023 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJ9U-0007Zf-U2; Wed, 01 Mar 2023 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 503936;
 Wed, 01 Mar 2023 09:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPXQ=6Z=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pXJ9T-0007ZN-4Z
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:53:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ec3f3dbc-b816-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 10:53:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A4342F4;
 Wed,  1 Mar 2023 01:54:14 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8C483F881;
 Wed,  1 Mar 2023 01:53:29 -0800 (PST)
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
X-Inumbo-ID: ec3f3dbc-b816-11ed-a550-8520e6686977
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
Subject: [PATCH v2 0/2] xen/misra: create exclusion file list
Date: Wed,  1 Mar 2023 09:53:18 +0000
Message-Id: <20230301095320.264301-1-luca.fancellu@arm.com>
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

Luca Fancellu (2):
  xen/cppcheck: add a way to exclude files from the scan
  xen/misra: add entries to exclude-list.json

 docs/misra/exclude-list.json                  | 201 ++++++++++++++++++
 docs/misra/exclude-list.rst                   |  44 ++++
 xen/scripts/xen_analysis/cppcheck_analysis.py |  20 +-
 .../xen_analysis/exclusion_file_list.py       |  79 +++++++
 4 files changed, 342 insertions(+), 2 deletions(-)
 create mode 100644 docs/misra/exclude-list.json
 create mode 100644 docs/misra/exclude-list.rst
 create mode 100644 xen/scripts/xen_analysis/exclusion_file_list.py

-- 
2.34.1


