Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB278244D73
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPM-00026w-JL; Fri, 14 Aug 2020 17:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPK-00024H-UU
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:22 +0000
X-Inumbo-ID: 024a05e7-f430-4e32-aa4e-fd8279454bf4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 024a05e7-f430-4e32-aa4e-fd8279454bf4;
 Fri, 14 Aug 2020 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425733;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6Yh1gTjmkgvYSEZGqFd7rRT5aw5d6Kjp6VoJ1bNZQdE=;
 b=HGYPvM5Edri/EuIFt4TsbUneJyvk1xTIi+t/f2rMy69L60vMtzI4jE/4
 cyp45Ioij+RS7PKI2+hN800pOQJ/LnuhyEaOMjxzNTukJn7cdUsBv8nL7
 KVStY2wvoHPpN6vr8DHLCL93J156SLTw4AXgkFEAllSVjNVPHEwq3hqsV k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +LaL0UoATh1NAWrkxc8gBxJvvWQ9SjdIqXc0kuVH++Mv5JJLJ1gfT1USLNKX3UKZzX7z4F2bLP
 WuS/L40YB1ZPo0w58ac7lkpZbO9DlghgA2p0Kj9KYbgaaUcOsF+JFiHK+PFWV9NR3hee1rNpgi
 aJb650NIPCqSzI6pzR74TOfBt9wmfhoUzvu8hEgSYYJHP35YtV4pyOf9O032rnxsgoTn05uzzW
 +qaWvcK09RAu4tUXbqP8cCJaoQ3Ot+bb2Zk75PvWt2HPcozgOaOH87BkCc6fghHI0o4CFcWjJx
 g14=
X-SBRS: 2.7
X-MesageID: 24879727
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879727"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 00/60] Speed up sg-report-job-history
Date: Fri, 14 Aug 2020 18:21:05 +0100
Message-ID: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I think this is the final section of my work to speed up osstest's
reporting db queries etc.

After this is pushed and working, I will look and see what the
interval is now, between one flight finishing and the next starting,
to see ig there is more to be done.

Ian Jackson (60):
  history reporting (nfc): Do not key cache on hostname any more
  history reporting (nfc): Add some test runes to the notes
  history reporting: Delete two debug prints
  history reporting (nfc): Refactor to generalise, cache_read_existing
  history reporting (nfc): Make cache_write_entry into a top-level sub
  history reporting (nfc): Rename jobquery to cacheable_query
  history reporting (nfc): Break out cache_row_lookup_prep
  history reporting (nfc): Rename "existing" to "previous"
  history reporting (nfc): Provide cacheable_fn
  history reporting (nfc): Bind by name in cacheable_query
  history reporting (nfc): Rename $cachehits to $rows_hit
  history reporting (nfc): Record query-specific stats
  history reporting (nfc): Move cacheable_* further up the file
  history reporting (nfc): Use cacheable_fn for power methods
  history reporting (nfc): Introduce cache_set_key_cols
  history reporting (nfc): Record more row-specific stats
  history reporting: Cache stats reporting: Centralise and rework
  history reporting (nfc): Remove now-obsolete stats variables
  history reporting (nfc): Introduce empty HistoryReport module
  history reporting (nfc): Move cache code into HistoryReport module
  history reporting (nfc): Rename some module variables, remove "cache"
  history reporting: Skip undefined keys
  history reporting (nfc): Documentation for the new module
  history reporting: Cache data limit now in History module
  history reporting: Print debug for cache misses
  history reporting: Improve an error message slightly
  sg-report-host-history: Write cache entry for unfinished jobs
  parallel by fork: Break out into HistoryReport
  parallel by fork: Disconnect $dbh_tests as well as undefing it
  parallel by fork: Fix a variable name to $task
  sg-report-job-history: Prep for fork: Move $buildsq query
  sg-report-job-history: Prep for fork: Move $revisionsq query
  sg-report-job-history: Use fork-based parallelism
  sg-report-job-history: Use one child per report
  sg-report-job-history (nfc): Have main program decide HTML filename
  sg-report-job-history: Always write HTML output
  sg-report-job-history (nfc): Remove needless conditional
  history reporting (nfc): Add another test rune to the notes
  history reporting (nfc): Make cacheable_fn work without cache
  sg-report-job-history: Refactor "ALL" handling
  sg-report-job-history (nfc): Make $ri->{Hosts} a hash
  sg-report-job-history (nfc): Add new hostvarcols calculation
  sg-report-job-history (nfc): Query hosts runvars in one go
  sg-report-job-history (nfc): Drop $hostsq query
  history reporting (nfc): Provide cache_set_task_print
  sg-report-job-history: Introduce use of cache, for hosts query
  history reporting (nfc): Break out url_quote
  history reporting (nfc): Break out url_unquote
  history reporting (nfc): Break out $url_ok_chars
  history reporting (nfc): url-quoting: quote = too
  history reporting (nfc): Quote keys too
  sg-report-job-history: Cache the per-flight revisions
  sg-report-job-history (nfc): Refactor osstestrevs code
  sg-report-job-history: Cache osstestrevs
  history reporting: Break out minflight_by_time
  sg-report-job-history (nfc): Abolish $fromstuff
  sg-report-job-history: Cache report_run_getinfo
  sg-report-host-history: Cache report_run_getinfo
  sg-report-job-history: Provide --time-limit
  sg-report-job-history: Increase default limit

 Osstest/HistoryReport.pm | 301 +++++++++++++++++++++++++++++++++++++++++++++
 runes                    |  10 ++
 sg-report-host-history   | 216 +++++++-------------------------
 sg-report-job-history    | 313 +++++++++++++++++++++++++----------------------
 4 files changed, 520 insertions(+), 320 deletions(-)
 create mode 100644 Osstest/HistoryReport.pm

-- 
2.11.0


