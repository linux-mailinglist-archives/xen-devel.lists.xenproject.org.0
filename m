Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A646A3DF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239722.415643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZy-00029o-0f; Mon, 06 Dec 2021 18:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239722.415643; Mon, 06 Dec 2021 18:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZx-000261-ST; Mon, 06 Dec 2021 18:19:09 +0000
Received: by outflank-mailman (input) for mailman id 239722;
 Mon, 06 Dec 2021 18:19:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-00023m-V8
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-00041Q-TK
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZv-0004SN-S1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:07 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZZ-0001ab-PV; Mon, 06 Dec 2021 18:18:45 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=/xWqCJ7e+7pgQhkBZx8kQDeJeJ9c/oGVBEOm162UKU4=; b=5vhTEcvS8520hCBqARN4XiBezy
	wmgVCQ+72hWg+KzhbkxgxF7w8D0+rR+u/rG0DpWOhQj1kn/3Ez0k9QlK0j8pxEhKRdaLyaAu1XcbB
	oo7u72irBwheRYmKArsmPalK2uAk7tMJ+TF285JPbQ4+xkWOL1H7j7Lhp+d7y2OTSzsQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 00/13] Miscellaneous improvements
Date: Mon,  6 Dec 2021 18:18:26 +0000
Message-Id: <20211206181839.23463-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches were accumulated during the Xen 4.16 freeze and as RM I
chose to defer them.  I am submitting them to osstest pretest now.

Ian Jackson (12):
  make-flight: do_examine_one: add firmware argument
  ts-memdisk-try-append: Reindent (nfc)
  ts-memdisk-try-append: Enable perl warnings
  ts-memdisk-try-append: More defensive case test
  examination: skip memdisk on non-BIOS hosts, run per-firmware on x86
  starvation: Only count "pass" and "fail" as done jobs
  sg-run-job: Do not set a step status to pass unless it's running
  TestSupport: sub broken: break out "$msg"
  TestSupport: sub broken: Add a newline
  TestSupport: sub broken: exit with status 0 for skip
  TestSupport: sub broken: document that it does not return.
  ts-memdisk-try-append: Fix for fact that broken() does not return

Roger Pau Monne (1):
  ts-xen-install: enable timestamp on guests logs

 Osstest/Executive.pm        |  3 ++-
 Osstest/TestSupport.pm      | 13 ++++++++++--
 make-flight                 | 24 +++++++++++++++++++--
 mfi-common                  |  1 +
 tcl/JobDB-Executive.tcl     |  1 +
 ts-hosts-allocate-Executive |  5 ++++-
 ts-memdisk-try-append       | 42 +++++++++++++++++++++++++------------
 ts-xen-install              |  2 +-
 8 files changed, 71 insertions(+), 20 deletions(-)

-- 
2.20.1


