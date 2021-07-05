Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE993BC302
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150629.278485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0TzQ-0002bx-Te; Mon, 05 Jul 2021 19:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150629.278485; Mon, 05 Jul 2021 19:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0TzQ-0002a8-Ph; Mon, 05 Jul 2021 19:10:44 +0000
Received: by outflank-mailman (input) for mailman id 150629;
 Mon, 05 Jul 2021 19:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0TzP-0002a2-PS
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:10:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ea574e3-8392-4818-a441-850b651e4db7;
 Mon, 05 Jul 2021 19:10:42 +0000 (UTC)
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
X-Inumbo-ID: 4ea574e3-8392-4818-a441-850b651e4db7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512242;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=4MTJp3+BUiLfrjjfU0zgrxNxIPZ07dJrFxqFfOLj24U=;
  b=La2fCLox/IHo3fdprraRMBzyqaEs3WstQVG10oCYeFal1SMRcWxqfO7P
   S7dHodkeEiVr7O8m2hC+c23bcXaM0GsVh5X1Jcc9M8lr4g0XlJwxloVBF
   RPicAQckP95gr42r+nbEruThwu/MCadFX7XyxNnHXJBtYzHcmsj0m0YMM
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BMLIWobxaEocJpqili7zkblWKvGp6h/m6ObylDrILcuHxasMPTSWclBPTWWGI5A0N3UgTD5Ty/
 9Zu953rrWuVhbM1s47rT/MIqCsmoCt3+o6YfUhQFfLWB8HRLQ1ycvpe3JuidlzX8pLYLhVwn6r
 nxqMZbnUNf88Jdn9F7PX8C+KWYV3WONI9Wnlo6h8pS0t6UDMFc+eX/wXLUntzoUvTQnOyKjUEZ
 K/W9kAhGOYohdJao0k+bIXAXjEjmotXEcZ6NC28lU1VMrS7B9FjY417uSxu8++3wQNjvIFlx4q
 0Dk=
X-SBRS: 5.1
X-MesageID: 49224525
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IGQXMaFJKDNqzxVKpLqE/seALOsnbusQ8zAXP0AYc3Jom62j5q
 eTdZsgtSMc5Ax8ZJhCo6HlBEDjewK+yXcd2+B4Vt3OYOCPghrMEGgI1+rfKlPbdBEWjtQtt5
 tdTw==
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="49224525"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] tools/migration: Py3 fixes, and page type helpers
Date: Mon, 5 Jul 2021 20:10:22 +0100
Message-ID: <20210705191027.15107-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

FAOD, this is what I'm planning to push, unless anyone shouts urgently.

Olaf Hering (5):
  tools/python: handle libxl__physmap_info.name properly in convert-legacy-stream
  tools/python: fix Python3.4 TypeError in format string
  tools/migration: unify known page type checking
  tools/migration: unify type checking for data pfns in the VM
  tools/migration: unify type checking for data pfns in migration stream

 tools/libs/guest/xg_sr_common.h            | 85 ++++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_restore.c           | 38 +++----------
 tools/libs/guest/xg_sr_save.c              | 18 +++----
 tools/python/scripts/convert-legacy-stream |  8 +--
 4 files changed, 102 insertions(+), 47 deletions(-)

-- 
2.11.0


