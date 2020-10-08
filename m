Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E6287C90
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4623.12236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbku-0003dO-3S; Thu, 08 Oct 2020 19:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4623.12236; Thu, 08 Oct 2020 19:39:12 +0000
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
	id 1kQbkt-0003ci-W2; Thu, 08 Oct 2020 19:39:11 +0000
Received: by outflank-mailman (input) for mailman id 4623;
 Thu, 08 Oct 2020 19:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbks-0003c5-Iy
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c2fff55-8ccc-41dc-bdb1-cebf48079dc6;
 Thu, 08 Oct 2020 19:39:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkr-0004yD-MW
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:09 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkr-0005OP-Ll
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:09 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN6-0006So-QH; Thu, 08 Oct 2020 20:14:36 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbks-0003c5-Iy
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:10 +0000
X-Inumbo-ID: 7c2fff55-8ccc-41dc-bdb1-cebf48079dc6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7c2fff55-8ccc-41dc-bdb1-cebf48079dc6;
	Thu, 08 Oct 2020 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=rKhUBECvH4UVMiFTJmADZZZYMWQOR+f/Us5E4XBbMw4=; b=pMdPpc0R8BfRIfkbfiBbeYrZmI
	aSNVXDhLHzl18lkxI35PUX+98luv93X7/hvRC6Y/qHkO1aHH0ykaV+idIWrHjy35mZJPYr4xu/maR
	gbZNJ5Cec7W+PbLBsdzJZkXtFkUS1gUulDSLGRAsSCwYUWIgrQYxkWXytrveYg94FpAY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkr-0004yD-MW
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:09 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkr-0005OP-Ll
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:09 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN6-0006So-QH; Thu, 08 Oct 2020 20:14:36 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 11/13] cr-daily-branch: Immediately retry failing tests
Date: Thu,  8 Oct 2020 20:14:20 +0100
Message-Id: <20201008191422.5683-12-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We exclude the self-tests because we don't want to miss breakage, and
the Xen smoke tests because they will be run again RSN anyway.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/cr-daily-branch b/cr-daily-branch
index 285ea361..bea8734e 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -472,12 +472,58 @@ esac
 sgr_args+=" $EXTRA_SGR_ARGS"
 
 date >&2
+original_start=`date +%s`
+
 : $flight $branch $OSSTEST_BLESSING $sgr_args
 eval "$DAILY_BRANCH_PREEXEC_HOOK"
 execute_flight $flight $OSSTEST_BLESSING
 date >&2
 
-start_email $flight $branch "$sgr_args" "$subject_prefix"
+default_immediate_retry=$wantpush
+
+case "$branch" in
+*smoke*)	default_immediate_retry=false ;;
+osstest)	default_immediate_retry=false ;;
+*)		;;
+esac
+
+: ${OSSTEST_IMMEDIATE_RETRY:-$default_immediate_retry}
+
+while true; do
+	start_email $flight $branch "$sgr_args" "$subject_prefix"
+	if grep '^tolerable$' $mrof >/dev/null 2>&1; then break; fi
+	if ! $OSSTEST_IMMEDIATE_RETRY; then break; fi
+	OSSTEST_IMMEDIATE_RETRY=false
+	retry_jobs=$(
+		perl <$mrof -wne '
+			next unless m/^regression (\S+) /;
+			my $j = $1;
+			next if $j =~ m/^build/;
+			$r{$j}++;
+			END {
+				print "copy-jobs '$flight' $_ "
+					foreach sort keys %r;
+			}'
+	)
+	if [ "x$retry_jobs" = x ]; then break; fi
+
+	rflight=$(
+		./cs-adjust-flight new:$OSSTEST_BLESSING \
+			branch-set $branch \
+			$retry_jobs
+	)
+
+	./mg-adjust-flight-makexrefs -v $rflight \
+		--branch=$branch --revision-osstest=$narness_rev \
+		'^build-*' --debug --blessings=real
+
+	export OSSTEST_RESOURCE_WAITSTART=$original_start
+	execute_flight $rflight $OSSTEST_BLESSING-retest
+	report_flight $rflight
+	publish_logs $rflight
+
+	sgr_args+=" --refer-to-flight=$rflight"
+done
 
 push=false
 if grep '^tolerable$' $mrof >/dev/null 2>&1; then push=$wantpush; fi
-- 
2.20.1


