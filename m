Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D52866F5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3693.10894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9r-0002Ou-DT; Wed, 07 Oct 2020 18:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3693.10894; Wed, 07 Oct 2020 18:27:23 +0000
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
	id 1kQE9q-0002Lu-MX; Wed, 07 Oct 2020 18:27:22 +0000
Received: by outflank-mailman (input) for mailman id 3693;
 Wed, 07 Oct 2020 18:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE30-00072Q-IS
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:18 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51e97c34-5e24-471f-a252-757d6711b763;
 Wed, 07 Oct 2020 18:19:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk3-0007CF-A3; Wed, 07 Oct 2020 19:00:43 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE30-00072Q-IS
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:18 +0000
X-Inumbo-ID: 51e97c34-5e24-471f-a252-757d6711b763
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 51e97c34-5e24-471f-a252-757d6711b763;
	Wed, 07 Oct 2020 18:19:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk3-0007CF-A3; Wed, 07 Oct 2020 19:00:43 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 39/82] ts-host-reuse: tolerate unremoveable lv
Date: Wed,  7 Oct 2020 18:59:41 +0100
Message-Id: <20201007180024.7932-40-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

It might be a symlink in the pair tests.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-host-reuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-reuse b/ts-host-reuse
index e14a9149..74ac94aa 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -112,7 +112,7 @@ ENDI
                 printf 'LV %s...\n' "$dev"
                 if ! test -e $dev; then continue; fi
                 dd if=/dev/urandom bs=1024 count=4096 of=$dev ||:
-                lvremove -f $dev
+                lvremove -f $dev ||:
             done
         done
 ENDQ
-- 
2.20.1


