Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057DC3A9ED1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143401.264313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXJh-00028a-Az; Wed, 16 Jun 2021 15:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143401.264313; Wed, 16 Jun 2021 15:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXJh-000267-7v; Wed, 16 Jun 2021 15:18:57 +0000
Received: by outflank-mailman (input) for mailman id 143401;
 Wed, 16 Jun 2021 15:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJFi=LK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ltXJf-00025t-Nu
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:18:55 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b4fa1b8-3a64-4a02-a784-63879ed1aa02;
 Wed, 16 Jun 2021 15:18:54 +0000 (UTC)
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
X-Inumbo-ID: 5b4fa1b8-3a64-4a02-a784-63879ed1aa02
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623856734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bCyomFsR6dtfqKURitc5WY2glFEaC3FgGkeWvNQe234=;
  b=EDLy1OH9H5LpG7ef8iZlKRXxm1RFt8olK4eryjujgd98w+PjP7vy0skX
   /BIEHMkq6nmKMA3G/AQ4uHVbLsTsLdkaSev2exb+G4Ht5WCEgMXrdHva/
   9gIcoL7ToWP+FUDmtRJRl/khIlbDiI7jZErWs55Wimg4p6VOEBnQl2nby
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FrowePqB5Fx01UIm359GYqUJBPVN1GEy+GhVhpEi+jq8WLxZAm/4D4KAkt4T5xTpB6W6+5ec0v
 br7v8eatKp7c1EbBNKgiGblN2ecCGMcuOOuYmVDMfmRWRE8u3yPqo5CvqnGG0iE1yer4Wl1evF
 jADxRYV7sQrwMx+P36HkfrGn7aODhMV/yRwt73CqaL3VYgjd5jvMdQajOlTtW3jb7DoXK/DnB4
 tLSafMbl90TcmqRBIDLVnmir0Qfrh8LYihpTeaReDG7gKIQlS0wKI/H/MX/rng1TRjsuawGswX
 WAo=
X-SBRS: 5.1
X-MesageID: 46007795
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MT5q/qFpBRyI86eYpLqE5seALOsnbusQ8zAXP0AYc31om6uj5q
 eTdZUgpGbJYVkqKRIdcLy7V5VoIkmskaKdg7NhX4tKNTOO0ADDQe1fBOPZslvd8kbFltK1u5
 0PT0EHMqyUMWRH
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46007795"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Paul
 Durrant" <paul@xen.org>, Owen Smith <owen.smith@citrix.com>, "Chandrika
 Srinivasan" <chandrika.srinivasan@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, Konstantina Chremmou
	<konstantina.chremmou@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, "Li Zhang
 (3P)" <Li.Zhang@citrix.com>
Subject: [PATCH] code-of-conduct.rst: Add Stefano Stabellini as a Conduct Team member
Date: Wed, 16 Jun 2021 16:18:26 +0100
Message-ID: <20210616151826.224793-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With my upcoming leave, Ian will be the only person actively on the
Conduct Team.  Stefano has volunteered to join the team, so that there
are at least two members.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
Membership of the Conduct Team is a global XenProject decision,
and so needs a vote of the leadership of all active projects.

Please vote by replying to this email with +2 / +1 / 0 / -1 / -2, in
accordance with https://xenproject.org/developers/governance/#project-decisions .

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Owen Smith <owen.smith@citrix.com>
CC: Chandrika Srinivasan <chandrika.srinivasan@citrix.com>,
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Konstantina Chremmou <konstantina.chremmou@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: "Li Zhang (3P)" <Li.Zhang@citrix.com>
---
 source/code-of-conduct.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/code-of-conduct.rst b/source/code-of-conduct.rst
index 4cb33da..963d605 100644
--- a/source/code-of-conduct.rst
+++ b/source/code-of-conduct.rst
@@ -81,6 +81,7 @@ sub-project. The current list of Conduct Team members is:
 
 * George Dunlap <george dot dunlap at citrix dot com>
 * Ian Jackson <ian dot jackson at citrix dot com>
+* Stefano Stabellini <sstabellini at kernel dot org>
 
 Conduct Team members are changed by proposing a change to this document,
 posted on all sub-project lists, followed by a formal global vote as outlined
-- 
2.30.2


