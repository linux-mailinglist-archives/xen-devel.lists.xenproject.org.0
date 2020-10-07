Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E18286666
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3612.10395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkO-0004EA-GF; Wed, 07 Oct 2020 18:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3612.10395; Wed, 07 Oct 2020 18:01:04 +0000
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
	id 1kQDkO-0004DJ-C2; Wed, 07 Oct 2020 18:01:04 +0000
Received: by outflank-mailman (input) for mailman id 3612;
 Wed, 07 Oct 2020 18:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkM-0003r9-RQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:02 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ad78458-fc8c-4a5b-8731-ca75cb13c2bb;
 Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjt-0007CF-Jn; Wed, 07 Oct 2020 19:00:33 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkM-0003r9-RQ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:02 +0000
X-Inumbo-ID: 9ad78458-fc8c-4a5b-8731-ca75cb13c2bb
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ad78458-fc8c-4a5b-8731-ca75cb13c2bb;
	Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjt-0007CF-Jn; Wed, 07 Oct 2020 19:00:33 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/82] show_abs_time: Represent undef $timet as <undef>
Date: Wed,  7 Oct 2020 18:59:08 +0100
Message-Id: <20201007180024.7932-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This can happen, for example, if a badly broken flight has steps which
are STARTING and have NULL in the start time column, and is then
reported using sg-report-flight.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest.pm b/Osstest.pm
index b2b6b741..734c0ef6 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -457,6 +457,7 @@ sub visible_undef ($) {
 
 sub show_abs_time ($) {
     my ($timet) = @_;
+    return '<undef>' unless defined $timet;
     return strftime "%Y-%m-%d %H:%M:%S Z", gmtime $timet;
 }
 
-- 
2.20.1


