Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62476590F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571229.894586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP470-0004Aj-Mh; Thu, 27 Jul 2023 16:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571229.894586; Thu, 27 Jul 2023 16:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP470-00047O-Jh; Thu, 27 Jul 2023 16:45:14 +0000
Received: by outflank-mailman (input) for mailman id 571229;
 Thu, 27 Jul 2023 16:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k29T=DN=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1qP46z-00047I-CB
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:45:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f2903357-2c9c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 18:45:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8221D75;
 Thu, 27 Jul 2023 09:45:51 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820A33F5A1;
 Thu, 27 Jul 2023 09:45:07 -0700 (PDT)
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
X-Inumbo-ID: f2903357-2c9c-11ee-8613-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	luca.fancellu@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 0/2] Add escape character argument to Xen console
Date: Thu, 27 Jul 2023 17:44:47 +0100
Message-Id: <20230727164450.77640-1-peter.hoyes@arm.com>
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

 docs/man/xl.1.pod.in             |  8 +++++-
 tools/console/client/main.c      | 21 +++++++++++++---
 tools/include/libxl.h            | 43 ++++++++++++++++++++++++++++----
 tools/libs/light/libxl_console.c | 30 ++++++++++++++++------
 tools/xl/xl_cmdtable.c           |  3 ++-
 tools/xl/xl_console.c            | 10 +++++---
 tools/xl/xl_vmcontrol.c          |  2 +-
 7 files changed, 94 insertions(+), 23 deletions(-)

-- 
2.34.1


