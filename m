Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29055A92CD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396359.636475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgGH-000547-L3; Thu, 01 Sep 2022 09:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396359.636475; Thu, 01 Sep 2022 09:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgGH-00052D-Hj; Thu, 01 Sep 2022 09:13:21 +0000
Received: by outflank-mailman (input) for mailman id 396359;
 Thu, 01 Sep 2022 09:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgGF-000527-Tj
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:13:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 503a7b53-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:13:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4955D6E;
 Thu,  1 Sep 2022 02:13:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C395D3F766;
 Thu,  1 Sep 2022 02:13:14 -0700 (PDT)
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
X-Inumbo-ID: 503a7b53-29d6-11ed-82f2-63bd783d45fa
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
Subject: [PATCH v3 0/7] xen/evtchn: implement static event channel signaling
Date: Thu,  1 Sep 2022 10:12:59 +0100
Message-Id: <cover.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to add the static event channel signaling
support to Xen on Arm based on design doc [1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg01160.html

Julien Grall (1):
  xen/evtchn: Make sure all buckets below d->valid_evtchns are allocated

Rahul Singh (6):
  xen/evtchn: Add an helper to reserve/allocate a port
  xen/evtchn: restrict the maximum number of evtchn supported for domUs
  xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
  xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
  xen/arm: introduce xen-evtchn dom0less property
  xen/arm: introduce new xen,enhanced property value

 docs/misc/arm/device-tree/booting.txt |  68 +++++++++++-
 xen/arch/arm/domain_build.c           | 148 +++++++++++++++++++++++++-
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 xen/common/event_channel.c            | 121 +++++++++++++--------
 xen/include/xen/device_tree.h         |  13 +++
 xen/include/xen/event.h               |   8 +-
 8 files changed, 313 insertions(+), 51 deletions(-)

-- 
2.25.1


