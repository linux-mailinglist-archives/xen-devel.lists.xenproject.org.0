Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F30195D80
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:21:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtWD-0004Bb-5A; Fri, 27 Mar 2020 18:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtWB-0004B2-F2
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:43 +0000
X-Inumbo-ID: f2f9c676-7056-11ea-92cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2f9c676-7056-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW0-0004UK-T6; Fri, 27 Mar 2020 18:15:33 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:24 +0000
Message-Id: <20200327181526.19412-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
References: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [OSSTEST PATCH 4/6] ts-logs-capture: Move some general
 logs onto @general_logs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Now @general_logs contains logs we want from guests as well as hosts.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index ae37d492..418155ce 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -148,6 +148,11 @@ our @general_logs = qw(
                   /var/log/installer/syslog*
                   /var/log/installer/partman*
 
+                  /boot/config*
+
+                  /home/osstest/osstest-confirm-booted.log
+
+                  /var/core/*.core
 		     );
 
 sub fetch_logs_host () {
@@ -172,14 +177,8 @@ sub fetch_logs_host () {
 
                   /var/log/xen-tools/*
 
-                  /boot/config*
-
                   /etc/xen/*
 
-                  /home/osstest/osstest-confirm-booted.log
-
-                  /var/core/*.core
-
                   )];
     if (!try_fetch_logs($ho, $logs)) {
         logm("log fetching failed, trying hard host reboot...");
-- 
2.11.0


