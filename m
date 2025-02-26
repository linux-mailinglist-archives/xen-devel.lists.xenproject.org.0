Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD238A453FE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 04:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896139.1304807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn85J-0002Wq-QT; Wed, 26 Feb 2025 03:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896139.1304807; Wed, 26 Feb 2025 03:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn85J-0002V5-Nv; Wed, 26 Feb 2025 03:27:45 +0000
Received: by outflank-mailman (input) for mailman id 896139;
 Wed, 26 Feb 2025 03:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EFW=VR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tn85I-0002Uz-Ox
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 03:27:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2386a7f-f3f1-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 04:27:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A105D82880D9
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 21:27:40 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dOlsF3GKcjWZ; Tue, 25 Feb 2025 21:27:39 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 76EB88288411;
 Tue, 25 Feb 2025 21:27:39 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id g3TKBL65LDTo; Tue, 25 Feb 2025 21:27:39 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6561882880D9;
 Tue, 25 Feb 2025 21:27:38 -0600 (CST)
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
X-Inumbo-ID: a2386a7f-f3f1-11ef-9aae-95dc52dad729
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 76EB88288411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740540459; bh=P0f+T4Q/Ik33o86a6rjXecN6J8HX+zdXLk79UH79W9I=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hLG68a2uvSxEedb1dJ7yVDYDhO3YTZ54bs7e0hga3/gwhJKxme1N/Y+q8920Drg3a
	 h1366lM+9wQlJJHpY9R26m2jHUZZ458Ufs7G99curl4KGzUYeH1i3iZYGntwJV1176
	 WjqRqSn5elAsPq/cVjpNM4aMqR4fz0SWJHFVZHGQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 0/1] Enable UBSAN on ppc
Date: Tue, 25 Feb 2025 21:27:32 -0600
Message-Id: <cover.1740540262.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Extend Andrew's UBSAN enablement work to ppc.

Changes in v2:
  - Drop opal.c unaligned access patch
  - Enable -fno-sanitize=alignment like x86 does

Andrew Cooper (1):
  PPC: Activate UBSAN in testing

 automation/gitlab-ci/build.yaml      | 3 +++
 xen/arch/ppc/Kconfig                 | 1 +
 xen/arch/ppc/arch.mk                 | 6 ++++++
 xen/arch/ppc/include/asm/processor.h | 2 ++
 xen/arch/ppc/stubs.c                 | 2 +-
 5 files changed, 13 insertions(+), 1 deletion(-)

--
2.30.2


