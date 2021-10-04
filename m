Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD44214CF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 19:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201609.356195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002q7-7I; Mon, 04 Oct 2021 17:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201609.356195; Mon, 04 Oct 2021 17:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002p9-2P; Mon, 04 Oct 2021 17:07:05 +0000
Received: by outflank-mailman (input) for mailman id 201609;
 Mon, 04 Oct 2021 17:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0002oW-E5
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0000L3-CJ
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0005fz-BG
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQb-0006NI-Et; Mon, 04 Oct 2021 18:07:01 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=/TfkwhZvbisooqp6bNw5GKYK4ugeo2SrDFrIijYr5B4=; b=3a2kCR86Bb9ZMHDHG26OhDV9m0
	1Rjv7/7k9y5rSiaACSPFdacDRsGJvI3ZZkNK46WOhM2h69bAA7kCRAJSQaeBGRCxsRNXs/tlQ015a
	Ozwe3n/PnZDTgOjsJWAEz82g6+IyOsDfBNisGLpN2GPC0qf14PsfRuXcI9Jm2Pe7TDUA=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 0/6] allocation / test fixes
Date: Mon,  4 Oct 2021 18:06:48 +0100
Message-Id: <20211004170654.21864-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix problems detected while doing maintenance work.

1 host lifecycle: Use correct taskid column for runvar reconstruction

In principle this might affect any job that picks up a host that was
messed with by a stale task.  It could even cause production flights
to fail.  I think this is a bugfix we want in production.

My Release Manager hat agrees.

2 mg-repro-setup: Promote an error test to before builds (nfc)
3 mg-allocate: Break out sub precheck (nfc)
4 mg-allocate: Add --dry-run mode
5 mg-allocate: feasibility check: print a reassuring message
6 mg-repro-setup: Check allocation feasibility at the start

These are fixes to manual and ad-hoc maintenance commands.  They don't
have any effect on db or host contents.  So they have no release
implications.

Therefore, all six:

Release-acked-by: Ian Jackson <iwj@xenproject.org>

I will push them to pretest shortly.

