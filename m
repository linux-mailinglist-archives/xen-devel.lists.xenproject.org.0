Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935087C8CE9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616850.959140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMfk-0006M5-2m; Fri, 13 Oct 2023 18:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616850.959140; Fri, 13 Oct 2023 18:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMfj-0006K6-Vx; Fri, 13 Oct 2023 18:14:03 +0000
Received: by outflank-mailman (input) for mailman id 616850;
 Fri, 13 Oct 2023 18:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8jO=F3=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qrMfi-0006Jy-RR
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:14:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48818d4c-69f4-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 20:14:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B0138285873;
 Fri, 13 Oct 2023 13:14:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6t30Qa-2Xv3l; Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 215828285879;
 Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mAt3FFO9wD_7; Fri, 13 Oct 2023 13:13:58 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A83108285873;
 Fri, 13 Oct 2023 13:13:58 -0500 (CDT)
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
X-Inumbo-ID: 48818d4c-69f4-11ee-98d4-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 215828285879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1697220839; bh=3CIntRKcXOt7QoCjse2/hGyBC/GT4jPzfc8Z1vriXwk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hCZOLbErS944CfxmDNsfq13Nx9aXk2tHxZaWyhBLj/AhRG3o0iVpmWbgwZfQZPlMI
	 KDOMSujA/BM78zofjbEdI8VTPQXXQQl/ITR1GsuHesFGpzT7w5wFEZ9/xoJ8hPyK+w
	 kzBHdWNkMhtBhVRq0DTe6dZe7CFvz7EDeHPPBJLk=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 0/2] Early exception handlers on Power
Date: Fri, 13 Oct 2023 13:13:46 -0500
Message-Id: <cover.1697220184.git.sanastasio@raptorengineering.com>
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


