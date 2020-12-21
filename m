Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5BB2DFF78
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57504.100639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjK-0000ZR-UU; Mon, 21 Dec 2020 18:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57504.100639; Mon, 21 Dec 2020 18:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjK-0000Z2-Qi; Mon, 21 Dec 2020 18:16:22 +0000
Received: by outflank-mailman (input) for mailman id 57504;
 Mon, 21 Dec 2020 18:16:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krPjJ-0000Ys-3Q
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:16:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f87d616d-fdab-49db-9602-799584b7e218;
 Mon, 21 Dec 2020 18:16:20 +0000 (UTC)
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
X-Inumbo-ID: f87d616d-fdab-49db-9602-799584b7e218
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608574580;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L7zpXpSF8sqEBnMwyjo06yBMcfoiSc3qOyImvvgHGnY=;
  b=AxHOFtaIzF+fpCE4Axtnhjc8XJVs5vROQLCaQgvgX5JdM5DDE2zxoJoV
   cks2gIsyBtTncJ4fTD70qKfGO710uKlqRoKz9c8ysYvDCSfovo+LS+kNJ
   bzpKR6SvtU2PNoevVi9qIPz/tey0By/mVYZJarTAVxh6uxa40mtUM3NFV
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: N2BIb0CzemZqfg7OYCye5eTJV1CsNu8jfWn/VbjuRzzKw0ZhoRVnk7rhMDU6a63nBYS+XCGeaj
 sbkgxrCH8yUxGD61RPzqcItY6zbkII2mqU+ZAnLVGtGogfyFMjKN3z08eGw9kZDXMxMaQntVz+
 +WDE8fO6wEn9xO5xIBPJv6J1zwCdGb8IgJbDIsSYExxh1pi+KIC8qieoRxaGK74Jdp0G1YI21C
 kJWeS/aa/fsCDKREFCDpxPBgyf2hZk+IJIvqE0yiJJHZWIfnyvutAa+vtmJsM4h8Thzy1vkWt6
 5eQ=
X-SBRS: 5.2
X-MesageID: 33707593
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33707593"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] xen/domain: More structured teardown
Date: Mon, 21 Dec 2020 18:14:43 +0000
Message-ID: <20201221181446.7791-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Follow up from both the investigation leading to "Fix memory leak in
vcpu_create() error path", and the older work to deduplicate the domain
teardown paths.

Andrew Cooper (3):
  xen/domain: Reorder trivial initialisation in early domain_create()
  xen/domain: Introduce domain_teardown()
  xen/evtchn: Clean up teardown handling

 xen/common/domain.c        | 113 ++++++++++++++++++++++++++++++++++-----------
 xen/common/event_channel.c |   8 ++--
 xen/include/xen/sched.h    |  12 ++++-
 3 files changed, 101 insertions(+), 32 deletions(-)

-- 
2.11.0


