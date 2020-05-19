Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C081DA08F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7c8-0005b0-3C; Tue, 19 May 2020 19:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7c6-0005ah-Gt
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:09:18 +0000
X-Inumbo-ID: 3923b658-9a04-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3923b658-9a04-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 19:09:12 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vg-0001da-Ud; Tue, 19 May 2020 20:02:41 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 19/38] buster: preseed partman-auto-lvm/guided_size
Date: Tue, 19 May 2020 20:02:11 +0100
Message-Id: <20200519190230.29519-20-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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

Otherwise we get this question:

  | You may use the whole volume group for guided partitioning, or part
  | of it.  [...]
  | Amount of volume group to use for guided partitioning:

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index cd8b2de0..bec72788 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -938,6 +938,7 @@ d-i partman/choose_partition select finish
 d-i partman/confirm boolean true
 d-i partman-lvm/confirm boolean true
 d-i partman-lvm/device_remove_lvm_span boolean true
+d-i partman-auto-lvm/guided_size string max
 
 d-i partman/confirm_nooverwrite true
 d-i partman-lvm/confirm_nooverwrite true
-- 
2.20.1


