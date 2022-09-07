Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E255B0A13
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 18:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402024.644009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxu4-0006Am-Re; Wed, 07 Sep 2022 16:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402024.644009; Wed, 07 Sep 2022 16:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxu4-000688-NA; Wed, 07 Sep 2022 16:27:52 +0000
Received: by outflank-mailman (input) for mailman id 402024;
 Wed, 07 Sep 2022 16:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVxu2-000682-UU
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 16:27:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 03332409-2eca-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 18:27:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF393106F;
 Wed,  7 Sep 2022 09:27:54 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63CFB3F71A;
 Wed,  7 Sep 2022 09:27:47 -0700 (PDT)
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
X-Inumbo-ID: 03332409-2eca-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/7] xen/evtchn: implement static event channel signaling
Date: Wed,  7 Sep 2022 17:27:31 +0100
Message-Id: <cover.1662563170.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to add the static event channel signaling
support to Xen on Arm based on design doc [1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg01160.html

Julien Grall (1):
  xen/evtchn: Make sure all buckets below d->valid_evtchns are allocated

Rahul Singh (5):
  xen/evtchn: restrict the maximum number of evtchn supported for domUs
  xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
  xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
  xen/arm: introduce new xen,enhanced property value
  xen/arm: introduce xen-evtchn dom0less property

Stanislav Kinsburskii (1):
  xen/evtchn: Add an helper to reserve/allocate a port

 docs/misc/arm/device-tree/booting.txt | 102 ++++++++++++++++
 xen/arch/arm/domain_build.c           | 167 +++++++++++++++++++++++++-
 xen/arch/arm/include/asm/kernel.h     |  23 +++-
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 xen/common/event_channel.c            | 121 ++++++++++++-------
 xen/include/xen/device_tree.h         |  16 +++
 xen/include/xen/event.h               |   8 +-
 8 files changed, 387 insertions(+), 53 deletions(-)

-- 
2.25.1


