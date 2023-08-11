Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14CD7787FF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582278.911944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMR9-0003i0-NB; Fri, 11 Aug 2023 07:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582278.911944; Fri, 11 Aug 2023 07:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMR9-0003fT-JU; Fri, 11 Aug 2023 07:19:55 +0000
Received: by outflank-mailman (input) for mailman id 582278;
 Fri, 11 Aug 2023 07:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMR7-0003ey-Gq
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7705ac4a-3817-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 09:19:52 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 100034EE073F;
 Fri, 11 Aug 2023 09:19:52 +0200 (CEST)
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
X-Inumbo-ID: 7705ac4a-3817-11ee-b284-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 0/6] xen: fix missing headers and static storage duration
Date: Fri, 11 Aug 2023 09:19:25 +0200
Message-Id: <cover.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The files touched by this series contain function or variable definitions with
no prior declaration visible, because it's inside an header that is not included
or it's not present anywhere. This is a risk in itself, but also violates
MISRA C:2012 Rule 8.4, which states the following:
"A compatible declaration shall be visible when an object or function with
external linkage is defined".

The resolution strategies are as follows:

1. make the functions/variables static
2. include the header that contains the compatible declaration, or add one in
   the header if that's not the case.

No functional change.

Additional notes:
- This series is a continuation of the work done here [1], so the same additional
  notes apply.

[1] https://lore.kernel.org/xen-devel/cover.1691655814.git.nicola.vetrini@bugseng.com/T/#m28da1b5ef8d9a7683937bfc345765e3438b89977

Nicola Vetrini (6):
  x86/hpet: make variable 'per_cpu__cpu_bc_channel' static
  x86/setup: add missing headers
  x86/vm_event: add missing include
  cpufreq: add missing include of header 'pmstat.h'
  vpic/msix: make 'get_slot' static
  drivers/video: make declarations of defined functions available

 xen/arch/x86/hpet.c              |  2 +-
 xen/arch/x86/include/asm/setup.h |  6 ------
 xen/arch/x86/setup.c             |  4 +++-
 xen/arch/x86/vm_event.c          |  1 +
 xen/drivers/cpufreq/cpufreq.c    |  1 +
 xen/drivers/video/vga.c          |  9 +--------
 xen/drivers/vpci/msix.c          |  2 +-
 xen/include/xen/cpuidle.h        |  2 +-
 xen/include/xen/vga.h            | 14 ++++++++++++++
 9 files changed, 23 insertions(+), 18 deletions(-)

--
2.34.1

