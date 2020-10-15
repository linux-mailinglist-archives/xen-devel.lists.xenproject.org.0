Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D228F627
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7514.19651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5WQ-0006Gx-T5; Thu, 15 Oct 2020 15:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7514.19651; Thu, 15 Oct 2020 15:50:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5WQ-0006GW-MM; Thu, 15 Oct 2020 15:50:30 +0000
Received: by outflank-mailman (input) for mailman id 7514;
 Thu, 15 Oct 2020 15:50:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WP-0006GM-50
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c08dda8-552f-4602-b07d-4671cb82684d;
 Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-00087i-0F
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WN-0005EJ-Vi
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WM-0000oB-8D; Thu, 15 Oct 2020 16:50:26 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WP-0006GM-50
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
X-Inumbo-ID: 1c08dda8-552f-4602-b07d-4671cb82684d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1c08dda8-552f-4602-b07d-4671cb82684d;
	Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=0cu1fQEr/YhhkV7d6ryfyU30np6PR4Bzu+bivwbzW74=; b=VtqZkfNS9vcK3jAnRQM0G5IL/A
	CHimD6YIZx6fT4+B4mhrnvuFWIxdNDeaGv15+aUsp3uogOHjQm/5LrFt4oA1DISvou14V6q8/q+Wi
	RE0EA3ohdR1TQNaho8Fh4zjWU1w/1vHklPylyCYS7MOybVvbuodNrQxqTPy6NKFLMcDc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-00087i-0F
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WN-0005EJ-Vi
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WM-0000oB-8D; Thu, 15 Oct 2020 16:50:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 00/13] Immediately retry failing tests
Date: Thu, 15 Oct 2020 16:50:02 +0100
Message-Id: <20201015155019.20705-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We discussed this at the Xen Summit.  What I do here is immediate
retry the jobs with regressions, and then reanalyse the original full
flight.  If the retries showed the failures were heisenbugs, this will
let them though.

This should reduce the negative impact on development, of heisenbugs,
but it won't do anything to help keep them out of the tree.

This series has now had proper dev testing (insofar as possible for
something of this nature) and I will be pushing it to pretest shortly.

Ian Jackson (17):
  Honour OSSTEST_SIMULATE=2 to actually run dummy flight
  Honour OSSTEST_SIMULATE_FAIL in sg-run-job
  sg-report-flight: Consider all blessings for "never pass"
  mg-execute-flight: Do not include the transcript in reports
  sg-report-job-history: eval $DAILY_BRANCH_PREEXEC_HOOK
  cri-args-hostlists: New debug var $OSSTEST_REPORT_JOB_HISTORY_RUN
  cri-args-hostlists: Break out report_flight and publish_logs
  sg-report-flight: Break out printout_flightheader
  sg-report-flight: Provide --refer-to-flight option
  sg-report-flight: Nicer output for --refer-to-flight option
  Introduce real-retry blessing
  cri-args-hostlists: Move flight_html_dir variable
  cr-daily-branch: Immediately retry failing tests
  Honour OSSTEST_SIMULATE_FAIL_RETRY for immediate retries
  cr-daily-branch: Do not do immediate retry of failing xtf flights
  sg-report-flight: Include count of blockers, and of jobs, in mro
  cr-daily-branch: Heuristics for when to do immediate retest flight

 README.dev          |  9 +++---
 cr-daily-branch     | 73 +++++++++++++++++++++++++++++++++++++++++++--
 cr-disk-report      |  2 +-
 cr-try-bisect       |  4 +--
 cr-try-bisect-adhoc |  2 +-
 cri-args-hostlists  | 28 +++++++++++------
 cs-bisection-step   |  4 +--
 mg-execute-flight   |  3 --
 sg-report-flight    | 42 +++++++++++++++++++++-----
 sg-run-job          |  9 +++++-
 10 files changed, 143 insertions(+), 33 deletions(-)

-- 
2.20.1


