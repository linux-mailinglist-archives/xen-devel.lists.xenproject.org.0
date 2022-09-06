Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C223F5AE9FF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 15:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399869.641242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYnp-0003s5-1e; Tue, 06 Sep 2022 13:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399869.641242; Tue, 06 Sep 2022 13:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYno-0003qI-Uy; Tue, 06 Sep 2022 13:39:44 +0000
Received: by outflank-mailman (input) for mailman id 399869;
 Tue, 06 Sep 2022 13:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVYnm-0003qC-Qv
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 13:39:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5b683a1a-2de9-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 15:39:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9021A2D;
 Tue,  6 Sep 2022 06:39:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534543F7B4;
 Tue,  6 Sep 2022 06:39:39 -0700 (PDT)
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
X-Inumbo-ID: 5b683a1a-2de9-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com
Subject: [PATCH v4 0/7] xen/evtchn: implement static event channel signaling
Date: Tue,  6 Sep 2022 14:39:22 +0100
Message-Id: <cover.1662462034.git.rahul.singh@arm.com>
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


