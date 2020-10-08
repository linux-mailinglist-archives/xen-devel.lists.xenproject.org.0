Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DDB287C2F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4593.12126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNM-0000Jh-Sd; Thu, 08 Oct 2020 19:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4593.12126; Thu, 08 Oct 2020 19:14:52 +0000
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
	id 1kQbNM-0000IG-Lx; Thu, 08 Oct 2020 19:14:52 +0000
Received: by outflank-mailman (input) for mailman id 4593;
 Thu, 08 Oct 2020 19:14:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNK-0008Lp-7M
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:50 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 286ccc93-c436-4794-8ccc-44b0bbb7a092;
 Thu, 08 Oct 2020 19:14:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0004RM-Vr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0003rG-UI
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN4-0006So-2J; Thu, 08 Oct 2020 20:14:34 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNK-0008Lp-7M
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:50 +0000
X-Inumbo-ID: 286ccc93-c436-4794-8ccc-44b0bbb7a092
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 286ccc93-c436-4794-8ccc-44b0bbb7a092;
	Thu, 08 Oct 2020 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=e3H0s2+WzQtNrHrJPYnYMyg0OSRyEJNxDWc8yLBsrEc=; b=ThhjZGReMUkY9BrNq7xCGh8Umd
	4YA7moqxkSbPkTuiu434WGYDrFAia4Fg4hGT2ouyN4VK0DsFvFZyxMqtjzCopclPwj0s1N8WsGeVT
	om1Yc2zXAWJ2FFbWEfX/F0uN6NkEFXMMq2X+wQevxAzoIFguRaV+cV7y7ch8fat6jgJs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0004RM-Vr
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0003rG-UI
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0006So-2J; Thu, 08 Oct 2020 20:14:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/13] cri-args-hostlists: Break out report_flight and publish_logs
Date: Thu,  8 Oct 2020 20:14:14 +0100
Message-Id: <20201008191422.5683-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

NFC.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cri-args-hostlists | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 7019c0c7..52e39f33 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -128,10 +128,7 @@ start_email () {
 
 	date >&2
 
-	./sg-report-flight --report-processing-start-time \
-	        --html-dir=$flight_html_dir/$flight/ \
-		--allow=allow.all --allow=allow.$branch \
-		$sgr_args $flight >tmp/$flight.report
+	report_flight $flight
 	./cr-fold-long-lines tmp/$flight.report
 
 	date >&2
@@ -144,11 +141,23 @@ start_email () {
 	date >&2
 }
 
+report_flight () {
+	local flight=$1
+	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
+		--allow=allow.all --allow=allow.$branch \
+		$sgr_args $flight >tmp/$flight.report
+}
+
+publish_logs () {
+	local flight=$1
+	./cr-publish-flight-logs ${OSSTEST_PUSH_HARNESS- --push-harness} \
+	    $flight >&2
+}
+
 publish_send_email () {
 	local flight=$1
+	publish_logs $flight
 	exec >&2
-	./cr-publish-flight-logs ${OSSTEST_PUSH_HARNESS- --push-harness} \
-	    $flight
 	send_email tmp/$flight.email
 }
 
-- 
2.20.1


