Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BDB41BBA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 12:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108053.1458189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeR-0001DE-B8; Wed, 03 Sep 2025 10:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108053.1458189; Wed, 03 Sep 2025 10:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeR-0001An-8V; Wed, 03 Sep 2025 10:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1108053;
 Wed, 03 Sep 2025 10:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO1L=3O=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1utkeP-0001Ah-Nk
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:23:37 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac8769e-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:23:34 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id A8E7A80C0658; Wed,  3 Sep 2025 15:53:30 +0530 (IST)
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
X-Inumbo-ID: 0ac8769e-88b0-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 0/4]  xentop: add physical CPU usage support
Date: Wed,  3 Sep 2025 15:53:19 +0530
Message-Id: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v4 of the patch series to add physical CPU monitoring to xentop.

Changes since v3:
-   Split the single large patch into a logical series of 3 smaller patches
    for easier review.
-   Fixed the memory allocation error handling in pcpu.c as pointed out by
    Anthony PERARD. The realloc() result is now assigned immediately to avoid
    invalid pointers on failure.
-   Simplified the time calculation by using a single global timestamp instead
    of a per-CPU array, as the time difference is the same for all cores.
-   Removed the unnecessary check for small time intervals which could lead to
    incorrect usage calculations.
-   Integrated the PCPU display with the existing print() function to ensure
    correct behavior in both interactive and batch modes.

The series adds a new '-p'/'--pcpus' flag to xentop. When enabled, it displays
a table showing the usage percentage of each physical CPU core in the system.

Jahan Murudi (4):
  xentop: add pcpu header and basic infrastructure
  xentop: add pcpu implementation with proper error handling
  xentop: update Makefile to link against libxenctrl
  xentop: integrate pcpu support into main program


 tools/xentop/Makefile |   5 +-
 tools/xentop/pcpu.c   | 141 ++++++++++++++++++++++++++++++++++++++++++
 tools/xentop/pcpu.h   |  17 +++++
 tools/xentop/xentop.c |  79 +++++++++++++++++------
 4 files changed, 222 insertions(+), 20 deletions(-)
 create mode 100644 tools/xentop/pcpu.c
 create mode 100644 tools/xentop/pcpu.h

-- 
2.34.1


