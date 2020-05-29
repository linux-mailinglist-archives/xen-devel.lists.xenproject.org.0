Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF81E7B99
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed44-0006l0-9Y; Fri, 29 May 2020 11:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed43-0006kD-DB
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:39 +0000
X-Inumbo-ID: 556c9e32-a19e-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 556c9e32-a19e-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:20:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3P-0003xZ-Ea; Fri, 29 May 2020 12:19:59 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 08/49] ts-leak-check: Ignore buster's udevd too
Date: Fri, 29 May 2020 12:19:04 +0100
Message-Id: <20200529111945.21394-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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

For reasons I don't propose to investigate, on buster udevd shows up
like this:

  2019-11-26 18:13:48 Z LEAKED [process 2633 /lib/systemd/systemd-udevd] process: root      2633  1555  0 18:10 ?        00:00:00 /lib/systemd/systemd-udevd

This does not match our suppression.  Add an additional suppression.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-leak-check | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-leak-check b/ts-leak-check
index 41e6245d..f3cca8aa 100755
--- a/ts-leak-check
+++ b/ts-leak-check
@@ -202,6 +202,7 @@ xenstore /vm
 xenstore /libxl
 
 process .* udevd
+process .* .*/systemd-udevd
 process .* /.+/systemd-shim
 
 file /var/run/xenstored/db
-- 
2.20.1


