Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A6750469
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562179.878759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJX7c-0004PI-A4; Wed, 12 Jul 2023 10:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562179.878759; Wed, 12 Jul 2023 10:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJX7c-0004My-69; Wed, 12 Jul 2023 10:31:00 +0000
Received: by outflank-mailman (input) for mailman id 562179;
 Wed, 12 Jul 2023 10:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1v4=C6=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1qJX7a-0004Ms-Qp
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:30:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2f0e9b32-209f-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:30:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83930D75;
 Wed, 12 Jul 2023 03:31:37 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 091EF3F73F;
 Wed, 12 Jul 2023 03:30:53 -0700 (PDT)
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
X-Inumbo-ID: 2f0e9b32-209f-11ee-8611-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	luca.fancellu@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 0/2] Add escape character argument to Xen console
Date: Wed, 12 Jul 2023 11:29:15 +0100
Message-Id: <20230712102917.37763-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>


Dom0 may be accessed via telnet, meaning the default escape character
(which is the same as telnet's) cannot be directly used to exit the
console. It would be helpful to make the escape character customizable
in such use cases, falling back to the existing value if not set.

Make the necessary changes to the console client, libxl and the xl
console sub-command to support this.

Peter Hoyes (2):
  tools/console: Add escape argument to configure escape character
  xl: Add escape character argument to xl console

 docs/man/xl.1.pod.in             |  8 ++++++-
 tools/console/client/main.c      | 21 +++++++++++++----
 tools/include/libxl.h            | 39 +++++++++++++++++++++++++++++---
 tools/libs/light/libxl_console.c | 30 +++++++++++++++++-------
 tools/xl/xl_cmdtable.c           |  3 ++-
 tools/xl/xl_console.c            | 10 +++++---
 tools/xl/xl_vmcontrol.c          |  2 +-
 7 files changed, 92 insertions(+), 21 deletions(-)

-- 
2.34.1


