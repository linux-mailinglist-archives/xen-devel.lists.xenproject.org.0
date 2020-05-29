Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05F1E86A2
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 20:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jejjj-0001im-Dg; Fri, 29 May 2020 18:28:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jejji-0001ih-7d
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 18:28:06 +0000
X-Inumbo-ID: 22817dee-a1da-11ea-a900-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22817dee-a1da-11ea-a900-12813bfff9fa;
 Fri, 29 May 2020 18:28:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 660B8AD94;
 Fri, 29 May 2020 18:28:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/build: fix xen/tools/binfile
Date: Fri, 29 May 2020 20:28:00 +0200
Message-Id: <20200529182800.27555-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xen/tools/binfile contains a bash specific command (let). This leads
to build failures on systems not using bash as /bin/sh.

Replace "let SHIFT=$OPTIND-1" by "SHIFT=$((OPTIND-1))".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/tools/binfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/binfile b/xen/tools/binfile
index df0301183f..23099c49bf 100755
--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -17,7 +17,7 @@ while getopts "ia:" opt; do
         ;;
     esac
 done
-let "SHIFT=$OPTIND-1"
+SHIFT=$((OPTIND-1))
 shift $SHIFT
 
 target=$1
-- 
2.26.2


