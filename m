Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E257D7820
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623370.971188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0008Nd-7Y; Wed, 25 Oct 2023 22:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623370.971188; Wed, 25 Oct 2023 22:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0008LS-2k; Wed, 25 Oct 2023 22:41:30 +0000
Received: by outflank-mailman (input) for mailman id 623370;
 Wed, 25 Oct 2023 22:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm7K=GH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qvmZ6-0008LH-6A
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:41:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c77e2f-7387-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 00:41:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 766C082858AF;
 Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7LfU19WLdtAS; Wed, 25 Oct 2023 17:41:23 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BEE1482858BE;
 Wed, 25 Oct 2023 17:41:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id znXbM_DcxfIw; Wed, 25 Oct 2023 17:41:23 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3F5F882857E5;
 Wed, 25 Oct 2023 17:41:23 -0500 (CDT)
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
X-Inumbo-ID: a0c77e2f-7387-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BEE1482858BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1698273683; bh=3CIntRKcXOt7QoCjse2/hGyBC/GT4jPzfc8Z1vriXwk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pDm9K3bkxEP4ti1NA3yqfNgZq9JOGF2OZ5Ct7kI+9JmuZ1gT3OtGCBvccam1wjwAn
	 La/wZadbPgY6cBR4e5AekQdYzjCQ9Z8negtpzGhKI+bzt/9hsLxOhQQJI9j2SFHBQw
	 FeGgpPtOKDnroSAW50lICAzsAmnw91TqCt0OrnRE=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 0/2] Early exception handlers on Power
Date: Wed, 25 Oct 2023 17:41:02 -0500
Message-Id: <cover.1698273423.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series implements a basic exception handler and the required
support infrastructure on Power. Currently the handler just dumps all
registers to the serial console and nothing else, but even this is
useful for debugging during early bring-up.

Thanks,

Shawn Anastasio (2):
  xen/ppc: Add .text.exceptions section for exception vectors
  xen/ppc: Implement a basic exception handler

 xen/arch/ppc/include/asm/config.h    |   3 +
 xen/arch/ppc/include/asm/processor.h |  31 +++++++
 xen/arch/ppc/ppc64/Makefile          |   2 +
 xen/arch/ppc/ppc64/asm-offsets.c     |   1 +
 xen/arch/ppc/ppc64/exceptions-asm.S  | 129 +++++++++++++++++++++++++++
 xen/arch/ppc/ppc64/exceptions.c      | 102 +++++++++++++++++++++
 xen/arch/ppc/setup.c                 |  11 +++
 xen/arch/ppc/xen.lds.S               |   7 ++
 8 files changed, 286 insertions(+)
 create mode 100644 xen/arch/ppc/ppc64/exceptions-asm.S
 create mode 100644 xen/arch/ppc/ppc64/exceptions.c

--
2.30.2


