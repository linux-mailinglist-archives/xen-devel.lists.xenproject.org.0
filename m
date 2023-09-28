Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D97B28B5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610076.949328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IM-00039X-AV; Thu, 28 Sep 2023 23:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610076.949328; Thu, 28 Sep 2023 23:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IM-00037L-6Z; Thu, 28 Sep 2023 23:19:46 +0000
Received: by outflank-mailman (input) for mailman id 610076;
 Thu, 28 Sep 2023 23:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu57=FM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qm0IL-0002sR-2t
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:19:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ffe708f-5e55-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 01:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A703E8284D90;
 Thu, 28 Sep 2023 18:19:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w6jUswYTHsPN; Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2FD6082853BD;
 Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j6S8hQ2P1Xir; Thu, 28 Sep 2023 18:19:37 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AE1018284D90;
 Thu, 28 Sep 2023 18:19:37 -0500 (CDT)
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
X-Inumbo-ID: 7ffe708f-5e55-11ee-878b-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2FD6082853BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695943178; bh=GkMCrT7OHafY6FbubsKZsxllbhsBSWueAlw69PuDHXQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=eUQcW3UraTUZ7nzSyESt7BmZo4mGA7FXigenvV1BSMrHuYnM5K3RXt8ZANlMG2Hrn
	 O3kR1XboTq22cniR0IwYkVkYjq48o9OBV8n0azI/8kq5ur1r1tvlNUh1N2oPkPXbjP
	 XnJtivZfww/pqa7Y7OvRfSgP1PxDEceNygqeznIQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/3] Early exception handlers on Power
Date: Thu, 28 Sep 2023 18:19:26 -0500
Message-Id: <cover.1695942864.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series implements a basic exception handler and the required
support infrastructure on Power. Currently the handler just dumps all
registers to the serial console and nothing else, but even this is
useful for debugging during early bring-up.

An additional patch to fix the stack setup code in head.S is also
included.

Thanks,

Shawn Anastasio (3):
  xen/ppc: Fix stack initialization in head.S
  xen/ppc: Add .text.exceptions section for exception vectors
  xen/ppc: Implement a basic exception handler

 xen/arch/ppc/include/asm/config.h    |   3 +
 xen/arch/ppc/include/asm/processor.h |  31 +++++++
 xen/arch/ppc/ppc64/Makefile          |   2 +
 xen/arch/ppc/ppc64/asm-offsets.c     |   1 +
 xen/arch/ppc/ppc64/exceptions-asm.S  | 122 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/exceptions.c      | 102 ++++++++++++++++++++++
 xen/arch/ppc/ppc64/head.S            |   2 +-
 xen/arch/ppc/setup.c                 |  11 +++
 xen/arch/ppc/xen.lds.S               |   7 ++
 9 files changed, 280 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/ppc/ppc64/exceptions-asm.S
 create mode 100644 xen/arch/ppc/ppc64/exceptions.c

--
2.30.2


