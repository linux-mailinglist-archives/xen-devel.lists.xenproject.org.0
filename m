Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F8240533
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 13:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k55rV-0008GO-Ta; Mon, 10 Aug 2020 11:21:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k55rU-0008Fj-Ul
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 11:21:04 +0000
X-Inumbo-ID: f70dfcdf-0d3f-4b96-aec0-c4ee5e881699
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70dfcdf-0d3f-4b96-aec0-c4ee5e881699;
 Mon, 10 Aug 2020 11:20:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k55rJ-0003aJ-He; Mon, 10 Aug 2020 12:20:53 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 3/6] timing traces: cr-daily-branch: Add more calls to
 date >&2
Date: Mon, 10 Aug 2020 12:20:44 +0100
Message-Id: <20200810112047.30285-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
References: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

More tools to see where it is faffing too much.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cr-daily-branch | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/cr-daily-branch b/cr-daily-branch
index d84dcc8e..b8f221ee 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -51,6 +51,7 @@ determine_version () {
                 if [ "x$FORCE_REVISION" != x ]; then
                         tversion="$FORCE_REVISION"
                 else
+			date >&2
 			tversion=`$AP_FETCH_PFX ./ap-fetch-version "$tbranch"`
                 fi
 		determine_tree "$treevarwhich" "" _${treevarwhich}
@@ -98,6 +99,7 @@ if [ "x$OLD_REVISION" = x ]; then
 		# last test will have tested the previous upstream baseline
 		OLD_REVISION=`check_tested --print-revision=$tree`
 	    else
+		date >&2
 		OLD_REVISION="`$AP_FETCH_PFX ./ap-fetch-version-old $branch`"
 	    fi
 	    ;;
@@ -159,6 +161,7 @@ if [ "x$REVISION_XEN" = x ]; then
         export REVISION_XEN
 fi
 if [ "x$REVISION_PREVXEN" = x -a "x$prevxenbranch" != "x" ]; then
+	date >&2
 	REVISION_PREVXEN="`\
 		$AP_FETCH_PFX ./ap-fetch-version-baseline $prevxenbranch`"
 	export REVISION_PREVXEN
@@ -321,6 +324,7 @@ unset IFS
 
 if [ "x$OLD_REVISION" = xdetermine-late ]; then
 	OLD_REVISION="`\
+ date >&2
  $AP_FETCH_PFX ./ap-fetch-version-baseline-late $branch $NEW_REVISION`"
 fi
 
@@ -430,6 +434,7 @@ case "$NEW_REVISION/$OLD_REVISION" in
 
                 case "$realtree" in
                 xen-4*|xen-unstable*)
+		    date >&2
                     oldqemu=`./ap-qemu-revision $realtree $OLD_REVISION`
                     newqemu=`./ap-qemu-revision $realtree $NEW_REVISION`
                     if [ "$oldqemu" ] && [ "$newqemu" ]; then
@@ -445,6 +450,7 @@ case "$NEW_REVISION/$OLD_REVISION" in
                 cat <<END >tmp/$flight.people-touched
 People who touched revisions under test:
 END
+		date >&2
                 ./adhoc-people-touched-filter <$revlog \
                         >>tmp/$flight.people-touched
 		touched_lines=`wc -l <tmp/$flight.people-touched`
@@ -464,9 +470,12 @@ esac
 
 sgr_args+=" $EXTRA_SGR_ARGS"
 
+date >&2
 : $flight $branch $OSSTEST_BLESSING $sgr_args
 $DAILY_BRANCH_PREEXEC_HOOK
 execute_flight $flight $OSSTEST_BLESSING
+date >&2
+
 start_email $flight $branch "$sgr_args" "$subject_prefix"
 
 push=false
@@ -502,6 +511,7 @@ elif $push; then
 		echo >&2 "BAD PUSH REVISION $to_push"
 		;;
 	[0-9a-f]*)
+		date >&2
 	        if ./ap-push $branch $to_push 2>&1; then
 			rm -f $branch.push $branch.force-rev
 			perl -i~ -pe '
@@ -527,6 +537,7 @@ freebsd-*)
     if grep '^tolerable$' $mrof >/dev/null 2>&1 && $OSSTEST_ANOINT &&
        [ "x$OSSTEST_BLESSING" == "xreal" ]; then
         IFS=$'\n'
+	date >&2
         for anointed in `./mg-anoint list-prepared \
                                      "freebsd build $freebsd_branch *"`; do
             # Update anointed versions
@@ -554,4 +565,5 @@ if [ -f $revlog ]; then
     fi
 fi
 
+date >&2
 publish_send_email $flight
-- 
2.20.1


