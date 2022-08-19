Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17B599962
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390189.627478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyqB-0008RO-EY; Fri, 19 Aug 2022 10:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390189.627478; Fri, 19 Aug 2022 10:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyqB-0008OV-Bq; Fri, 19 Aug 2022 10:02:59 +0000
Received: by outflank-mailman (input) for mailman id 390189;
 Fri, 19 Aug 2022 10:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOyq9-0008OP-SO
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:02:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 183fbc16-1fa6-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 12:02:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369FB1042;
 Fri, 19 Aug 2022 03:02:56 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DDD93F70D;
 Fri, 19 Aug 2022 03:02:53 -0700 (PDT)
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
X-Inumbo-ID: 183fbc16-1fa6-11ed-bd2e-47488cf2e6aa
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
Subject: [PATCH v2 0/7] xen/evtchn: implement static event channel signaling
Date: Fri, 19 Aug 2022 11:02:37 +0100
Message-Id: <cover.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to add static event channel signaling
support to Xen on Arm based on design doc [1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg01160.html

Julien Grall (1):
  xen/evtchn: Make sure all buckets below d->valid_evtchns are allocated

Rahul Singh (6):
  xen/evtchn: Add an helper to reserve/allocate a port
  xen/evtchn: restrict the maximum number of evtchn supported for domUs
  xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
  xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
  xen: introduce xen-evtchn dom0less property
  xen/arm: introduce new xen,enhanced property value

 docs/misc/arm/device-tree/booting.txt |  63 +++++-
 xen/arch/arm/domain_build.c           | 289 +++++++++++++++++++-------
 xen/arch/arm/include/asm/domain.h     |   1 +
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 xen/common/event_channel.c            | 122 +++++++----
 xen/include/xen/event.h               |   8 +-
 xen/include/xen/sched.h               |   3 +
 9 files changed, 373 insertions(+), 119 deletions(-)

-- 
2.25.1


