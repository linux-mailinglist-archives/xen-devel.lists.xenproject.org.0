Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A632EB9A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93666.176696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uJ-0002t7-4A; Fri, 05 Mar 2021 12:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93666.176696; Fri, 05 Mar 2021 12:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uI-0002sd-V8; Fri, 05 Mar 2021 12:50:14 +0000
Received: by outflank-mailman (input) for mailman id 93666;
 Fri, 05 Mar 2021 12:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lI9uH-0002s9-3W
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:50:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e5a1ca4-5447-4c68-8fc9-e5a8778ae9ce;
 Fri, 05 Mar 2021 12:50:11 +0000 (UTC)
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
X-Inumbo-ID: 2e5a1ca4-5447-4c68-8fc9-e5a8778ae9ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614948611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eBkvGcYWDjOBL+srh6pm9g8FpW5ClCH/vq3XL3Y80S8=;
  b=JHcD43aosXSgt71sA0v40If9WEjZlXV6MaxxisA+iUkwP28BHwD48c5P
   W3VW4HIjs6nrbvI9hX/bnPN8MCJ0PAITCk1yqj+IV+FvvWBJYjpRhMnR7
   sFuNQ0OeTuNqEKQYnco5EJlSZsDqGpsHL+5cv6ZRHvBOjzid8XV4xxMCz
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: adfsXxGQefkW6flCelYkRU8pzUCPhgh50dGIGU4dQaplJMI252JX3ADFusdc4i2ox/ga3raEmf
 n7CVlUO+hbvbilHUsPGmleYPx1sP/DT7/mGbgH9/a5BXfRROMWL9ruU6SNGf5VEgjXvx6B8T6V
 FVWPWy4Qp3AqlQD1VlFf7JpZS413TB9BdAQJcxFxmFaMXaVVX5i8b+7VTgy88atXUOp5RQaipv
 gvt9l62xUL6WfNMj5FRn/H3Io10joIpXI4iuxcc9ZUJl0WJ9SGye2npBFaUo0wLaBSxTueFe2A
 pKI=
X-SBRS: 5.1
X-MesageID: 40038981
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="40038981"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15 0/3] tools/libs: Multiple fixes to header handling
Date: Fri, 5 Mar 2021 12:49:46 +0000
Message-ID: <20210305124949.6719-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This can of worms is festering.  See patch 1 for yet more issues.

Andrew Cooper (3):
  tools/libxentoolcore: Fill in LIBHEADERS
  xen/dmop: Strip __XEN_TOOLS__ header guard from public API
  tools/libs: Fix headers.chk logic

 tools/libs/devicemodel/private.h | 2 --
 tools/libs/libs.mk               | 2 +-
 tools/libs/toolcore/Makefile     | 2 ++
 xen/include/public/hvm/dm_op.h   | 5 -----
 4 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.11.0


