Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D72554D94
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353971.580984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Up-0003wY-0o; Wed, 22 Jun 2022 14:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353971.580984; Wed, 22 Jun 2022 14:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Uo-0003uT-TX; Wed, 22 Jun 2022 14:38:18 +0000
Received: by outflank-mailman (input) for mailman id 353971;
 Wed, 22 Jun 2022 14:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41Un-0003uL-Fw
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:38:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f3387b1f-f238-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:38:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37CA8D6E;
 Wed, 22 Jun 2022 07:38:15 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1C1F3F792;
 Wed, 22 Jun 2022 07:38:13 -0700 (PDT)
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
X-Inumbo-ID: f3387b1f-f238-11ec-bd2d-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/8] xen/evtchn: implement static event channel signaling
Date: Wed, 22 Jun 2022 15:37:57 +0100
Message-Id: <cover.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to add static event channel signaling
support to Xen on Arm based on design doc [1].

This patch series depends on patch series [2] to create event channel in Xen. 

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg01160.html
[2] https://patchwork.kernel.org/project/xen-devel/list/?series=646289

Rahul Singh (8):
  xen/evtchn: make evtchn_bind_interdomain global
  xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
  xen/evtchn: modify evtchn_bind_interdomain to allocate specified port
  xen/evtchn: modify evtchn_bind_interdomain to pass domain as argument
  xen/evtchn: don't close the static event channel.
  xen/evtchn: don't set notification in evtchn_bind_interdomain()
  xen: introduce xen-evtchn dom0less property
  xen/arm: introduce new xen,enhanced property value

 docs/misc/arm/device-tree/booting.txt |  62 +++++-
 xen/arch/arm/domain_build.c           | 290 +++++++++++++++++++-------
 xen/arch/arm/include/asm/domain.h     |   1 +
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 xen/common/event_channel.c            |  68 ++++--
 xen/include/xen/event.h               |   8 +-
 xen/include/xen/sched.h               |   1 +
 9 files changed, 351 insertions(+), 85 deletions(-)

-- 
2.25.1


