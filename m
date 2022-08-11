Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42FF590549
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384916.620514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXD-00085g-AA; Thu, 11 Aug 2022 16:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384916.620514; Thu, 11 Aug 2022 16:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXC-0007sp-KB; Thu, 11 Aug 2022 16:59:50 +0000
Received: by outflank-mailman (input) for mailman id 384916;
 Thu, 11 Aug 2022 16:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNU-0003Aq-87
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973f5cd3-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:41 +0200 (CEST)
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
X-Inumbo-ID: 973f5cd3-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6vCbrh65CqtneFRPKerc/tF+uYF6bBQ+treqeycw4E=;
  b=B+yYT4xTMoCyP4HbTgPkrrlRK5VVtV29sJ6Ax11DE/lF6AukyIFj9BxV
   x3FNfqj8EB5+wr7e7PLN7lW1e4fMmeLzdkfMNPlBb62S89MDA+eDJwK07
   ZSb+UQ0K4xqDr77pfU3M2Ur+kubuiTswVSQOr1j7mbpMJSSd+w+37OEAh
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77898109
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AaVG8CKnncLjjaAHjvQOC/4ro5mJPLRN+VbBN2?=
 =?us-ascii?q?KgSYl3aPzYEGi7M+fK5BX4HbfXpEBkXJ6DNWZp+jjygzYrHtUg2Xxbj45YZf?=
 =?us-ascii?q?yDZLXmqdZgs0VxX6vn0ZOlwoiFN1XsDjuYdcDWPVIPGpeEQDFzbZKfGyJh0o?=
 =?us-ascii?q?JTlcDTURsW6/O+DBuvFIgpPt653o7KWjKJYK1cCcPdYWSMeOq8Wg+dLlLy7D?=
 =?us-ascii?q?iknrOc9ndkYuEn/kabEvtHuigADi58QgSP3SwBBg0cWDhRbaT7kUiV2Akg8L?=
 =?us-ascii?q?bYTJtu0Au6XiyJ4IyxgowRQeLsKh/mqBmNerufe/AyIABnOriJgbY2LivAJj?=
 =?us-ascii?q?g9gxgj3GoXyPNShhAR/efpWNlqFb8NujQsYBaJ3kjr0Bqe8zlk3nzf6lEjKE?=
 =?us-ascii?q?TJ7KdzklJ1dayNvDS72lUM7T8a4Tq4/0QeLhbuxeYZKUNtdJ1Yc9vY0HX3E+?=
 =?us-ascii?q?HtbK9IVWmHMOfXa9Hkx6fTg0pfkPesg/xRcv5czRtJNO8Qx8SKBG4CaN32PM?=
 =?us-ascii?q?XMiVkEGQRTXBgC6PqWv/WgytQwOIv5k6LQVB9IIa3ZLLftUUGTUe2E/UOJQd?=
 =?us-ascii?q?y5OT0YXDcR+TGErJ3ROEfk8DNkoZPNF5BoVKeXyRgtdwPkU4mHB4nHhjpjqO?=
 =?us-ascii?q?3mByYmn+6pB12gWE/ir8mSNeyHMKzNKSy9gSsfXWSFuUHUZ1b+0IRpbMIjDy?=
 =?us-ascii?q?G/2TBcqlkwilko2tlMMvKuzXjmfcIIsG5BV+JiUURvnwJYwXwIOoTDvCeVex?=
 =?us-ascii?q?01siOhJPp1eHNSeieqEg2DYPZcRrlp/lLAawO8FPBEcniyutiAbev/tREMvV?=
 =?us-ascii?q?441SNFY1ER1JN0+nYTNmdg+Cy0LwMM8qtNKQK0GyAEX7WipQ6ixDOWIqbqlm?=
 =?us-ascii?q?BZZX9mH4ouwooa6II9v3i/6WJ1owdr3qUk9e4xszpwq4SW/xxVfe/+HIF7f3?=
 =?us-ascii?q?4FtCNEzKqk1tcLQYXylDxFvkCcup4WR7haqvkWBCzJZJmeFFB4KLgQGc9VTu?=
 =?us-ascii?q?qgFmN9xCuRR3ErLEWJosKSgg9u0WjlXQgZeLrS/ktoPpAg3TTyIfd+OsC7A6?=
 =?us-ascii?q?Y8WRmCp8a3dLC5kaPSCISA7ULlx1ungExH8RqMYm2sMTEpZKSP97ZH0ifUHo?=
 =?us-ascii?q?WtH146kMvCSddaygun4W6HFAkydHnb+FqpwVA5zLEA6F6DJyOwmAlNi8vtqy?=
 =?us-ascii?q?/X4xfqm0tjD9yrzL1ga+fyzEU4nRUwdGZGdxo2oAqI+PtwSk6mjC+c8J7vAO?=
 =?us-ascii?q?3cWooenQWiaSHJJk9SpEghtpak16SC+SkwRLDTtudvmX4RCvlknuNLU3o8OP?=
 =?us-ascii?q?2ie+YigNOGgCFeMI53VK3C2OUeVuF4X8AqOjcggNb3XTQGnVr+JAouE44y8G?=
 =?us-ascii?q?mLWEXWbjglo/uUs2E0NSAwPh7WW07hSsBA5RHkYYGeWnIuW4D8ZgVbNVmolW?=
 =?us-ascii?q?YB7U4PIr113xtofpfJmqyxj2FVWSSnhJ+R0tmkZ8Pb2CpS5/zAVkd7y3dLBa?=
 =?us-ascii?q?lA9JpLgN/hlG67cTgXdYsgaBp5egThvKJrT3z3G/5gzr3uXs+46UG+k8lIhu?=
 =?us-ascii?q?7vDS9PgIsEtDxontowKV3uCgIlzxG+W23L9+/xIXlsUQ1vtWIrLnPL9NPDyl?=
 =?us-ascii?q?tqPUeArDZhFTYO8Y1aS8aPKgxiDTDkwwY17dewNdGinlw4hKb92kAFW596Tf?=
 =?us-ascii?q?Oami2yMcpsl7WTT3a8TcXIJy5/QEg6Qq7YGpm0FxxLFXB/wpA1jssusmsS0s?=
 =?us-ascii?q?6baqKTlkAn6GGcbjEZS6o7XxIsHHIBc+UpQF55+gLkay0BtBEI6q6ILGsXjR?=
 =?us-ascii?q?fyUUj4wXOJ1Q7adUacW6TBg9R0APjezijGWd5yR/F9UQVoAyfWtDmxRpSdf6?=
 =?us-ascii?q?sy/DPLQNnQlpaNUmAofo5foJ9hot/CBp1ev+bZI6bgvjHOxMp8Qr8DvU/Oju?=
 =?us-ascii?q?SvL4kKpqaxO0EuomG28FnhpnhX9LkL9VNWYpqLqUiAIdbPYpBWulDa4Y2Gwj?=
 =?us-ascii?q?UXFEA0oaqzvgpTILHf9essG/U/0mhRXJDz5X5NpEy/EF+Ax/a/7SPppLFJbL?=
 =?us-ascii?q?UPg7S/HkMW8J0uNETCCTSDrkimCLj04RFyRLb4TAU4xgtVIG3RNoudB4RCUY?=
 =?us-ascii?q?Zl3fRJ5sdc6KZhqcNq53L9E20dGONn1dct99e9eNmwppfydbh5haROoJAmLN?=
 =?us-ascii?q?Z4P3UAOgJ+qQK1XZk3zqvKjvPM3v0Lff4cXhArtzXQg3v4pjRsb5yIU8NrU+?=
 =?us-ascii?q?+3qNn0UHG4+EGgOTP9ulLHmoUx/ppzIXyF1ICnG0RLvzTHoqVG7XSp/NnNVo?=
 =?us-ascii?q?omyCl9UqxQhtXqG7717zOrUhCMgoG70+bEWkKPx/hUkbfMuhN+fut/gOrIHz?=
 =?us-ascii?q?ajpXshO1uh26g3C75bRWHIPHyYTafacLD/k8W3DmRmcQCpfieuSAPRyz5bVJ?=
 =?us-ascii?q?4XVm2EcpPBYPp8x7FJK0q7QV7JcLfzt/DOQKzZyCnkkFtwkCmken90hF5xaW?=
 =?us-ascii?q?tBp7KJG9GNmiVb3H5i7Xpu5mlHxlYk2ZEetIhh8oXMZuqtJdLVaI+Ie+sUyO?=
 =?us-ascii?q?SteRfEVIahTRmIjyxse1PW/+QoFjlq1QLxV0zHxduRSw4RTT9gC+cc5jwAnd?=
 =?us-ascii?q?NaTLV9Vc6dxtNfH66/iGt/0RYQlU6/bkOV8aM7Clhy7KYvlIOkjmjnntbHIb?=
 =?us-ascii?q?mZ/xfrhymqIm6nFhoufOEfXsPjSr5UJBU0jWWO7XuOmkW5Gkn3/gJkg4j0R2?=
 =?us-ascii?q?5UDfNn/2zx1CTmbC1AvlnDc/TisvlXmcDMz9iNwH3Xev+JJcsPrBCYUpe6rz?=
 =?us-ascii?q?rPHmQA0cmdmj3CmidFuEJywFXsBlwGuA/PWpjElA4jIToB01zfbSMAACS75?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77898109"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 24/32] git-checkout.sh: handle running git-checkout from a different directory
Date: Thu, 11 Aug 2022 17:48:37 +0100
Message-ID: <20220811164845.38083-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"$DIR" might not be a full path and it might not have `pwd` as ".."
directory. So use `cd -` to undo the first `cd` command.

Also, use `basename` to make a symbolic link with a relative path.

This doesn't matter yet but it will when for example the commands to
clone OVMF is been run from tools/ rather than tools/firmware/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 scripts/git-checkout.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index 20ae31ff23..fd4425ac4e 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -19,9 +19,9 @@ if test \! -d $DIR-remote; then
 		cd $DIR-remote.tmp
 		$GIT branch -D dummy >/dev/null 2>&1 ||:
 		$GIT checkout -b dummy $TAG
-		cd ..
+		cd -
 	fi
 	mv $DIR-remote.tmp $DIR-remote
 fi
 rm -f $DIR
-ln -sf $DIR-remote $DIR
+ln -sf $(basename $DIR-remote) $DIR
-- 
Anthony PERARD


