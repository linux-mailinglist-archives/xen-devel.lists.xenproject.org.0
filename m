Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5466B571
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 02:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478242.741308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHElp-0002ej-UV; Mon, 16 Jan 2023 01:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478242.741308; Mon, 16 Jan 2023 01:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHElp-0002bp-Rd; Mon, 16 Jan 2023 01:58:45 +0000
Received: by outflank-mailman (input) for mailman id 478242;
 Mon, 16 Jan 2023 01:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wes/=5N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHElo-0002bj-TP
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 01:58:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4d1e8b59-9541-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 02:58:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24ADAD7;
 Sun, 15 Jan 2023 17:59:23 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5063D3F71A;
 Sun, 15 Jan 2023 17:58:39 -0800 (PST)
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
X-Inumbo-ID: 4d1e8b59-9541-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] P2M improvements for Arm
Date: Mon, 16 Jan 2023 09:58:17 +0800
Message-Id: <20230116015820.1269387-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some clean-up/improvement work that can be done in the
Arm P2M code triggered by [1] and [2]. These were found at the 4.17
code freeze period so the issues were not fixed at that time.
Therefore do the follow-ups here.

Patch#1 addresses one comment in [1]. It was sent earlier and reviewed
once. Pick the updated version, i.e. "[PATCH v2] xen/arm: Reduce
redundant clear root pages when teardown p2m", to this series.

Patch#2 and #3 addresses the comment in [2] following the discussion
between two possible options.

[1] https://lore.kernel.org/xen-devel/a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org/
[2] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/

Henry Wang (3):
  xen/arm: Reduce redundant clear root pages when teardown p2m
  xen/arm: Defer GICv2 CPU interface mapping until the first access
  xen/arm: Clean-up in p2m_init() and p2m_final_teardown()

 xen/arch/arm/domain.c           | 12 ++++++++
 xen/arch/arm/include/asm/p2m.h  |  5 +--
 xen/arch/arm/include/asm/vgic.h |  2 ++
 xen/arch/arm/p2m.c              | 54 +++++++++------------------------
 xen/arch/arm/traps.c            | 19 ++++++++++--
 xen/arch/arm/vgic-v2.c          | 25 ++++-----------
 6 files changed, 52 insertions(+), 65 deletions(-)

-- 
2.25.1


