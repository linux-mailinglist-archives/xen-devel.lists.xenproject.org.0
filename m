Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB99750026
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561992.878536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUOr-00078I-9J; Wed, 12 Jul 2023 07:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561992.878536; Wed, 12 Jul 2023 07:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUOr-000767-6V; Wed, 12 Jul 2023 07:36:37 +0000
Received: by outflank-mailman (input) for mailman id 561992;
 Wed, 12 Jul 2023 07:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1v4=C6=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1qJUOp-00075l-9r
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:36:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d2700252-2086-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 09:36:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D76D2F4;
 Wed, 12 Jul 2023 00:37:14 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A97C33F67D;
 Wed, 12 Jul 2023 00:36:30 -0700 (PDT)
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
X-Inumbo-ID: d2700252-2086-11ee-8611-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	luca.fancellu@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/2] Add escape character argument to Xen console
Date: Wed, 12 Jul 2023 08:35:54 +0100
Message-Id: <20230712073556.14719-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Dom0 may be accessed via telnet, meaning the default escape character
(which is the same as telnet's) cannot be directly used to exit the
console. It would be helpful to make the escape character customizable
in such use cases, falling back to the existing 

Make the necessary changes to the console client, libxl and the xl
console sub-command to support this.

Changes in v4:
 * Update xl docs
 * Add necessary changes for libxl API version compatibility
 * Improve escape sequence argument validation

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


