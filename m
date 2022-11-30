Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C763DB1A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450019.707155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMb-0002KK-O9; Wed, 30 Nov 2022 16:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450019.707155; Wed, 30 Nov 2022 16:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMb-0002HO-FY; Wed, 30 Nov 2022 16:55:13 +0000
Received: by outflank-mailman (input) for mailman id 450019;
 Wed, 30 Nov 2022 16:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMZ-00028d-Mj
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be64cd28-70cf-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:55:09 +0100 (CET)
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
X-Inumbo-ID: be64cd28-70cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=162zeh5jE/ckxoWntMvVQlDX4NJ4oVXrRVjHrDWZ9Fo=;
  b=ZmlZbCuLr9JKIWLrjn16+ZwiuTusmAgXC+WjrxoJN6Ygzou40y/jPGrJ
   Uu6gBiZ1PAVLXSDNty7cC8ucUka65gcHzCL0IHZxGWoRYlsPsf/hg6+xK
   qkRP/2px2gOEIb/nO+ZIkovUNa5isoZSF6bIdYotQNTSuFw69BuF2hzTl
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 84923297
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bhMNHqwae0FXQQaN3Al6t+c6xirEfRIJ4+MujC+fZmUNrF6WrkVWm
 GIZCjyPOP2DamGmfY13PIWzpkJSsJWHzIJkSgdlryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPqgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSJA0
 c0neCsGUhqO2N2Kmb+0bdEzrf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFZkExB3C9
 z2uE2LRHDZDJte64iO8yCyd3/DDh3rndI01PejtnhJtqALKnTFCYPEMbnO3qOe0olSzUNVeL
 woT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH87OxeE3N7byopz7tBhRMIGAlXXAvdF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6zdWNE/qQQ1d3XEy9hK0yDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp0nPe8S4q4CKyIMLKih6SdkifdpEmCgmbJjwjQfLUEy/lja
 f93j+7zZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePiNKjiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacidCNqX8mp+5EPL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:PePzL60PPY1Kd+Mz3f+a+gqjBJokLtp133Aq2lEZdPUzSKOlfq
 GV8sjzsCWetN9/YgBCpTntAtjjfZq+z/9ICPcqTNCftWDd0QPFEGgI1/qH/9SPIVyaygck78
 ddWpk7MvvWLXI/oOTbxE2DM/gGqePszImYwd3ZyHdmCSVEApsM0ztE
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="84923297"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 0/6] More Oxenstored live update fixes
Date: Wed, 30 Nov 2022 16:54:49 +0000
Message-ID: <20221130165455.31125-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 6 is already acked and queued for 4.18, but testing has identified it
was incomplete.  Specifically, the DOM_EXC virq needs handling across live
update, otherwise domain shutdown events go awry.

Therefore, this v2 series is presented with 5 patches of refactoring, leading
up to the virq correction in patch 6.

Andrew Cooper (5):
  tools/oxenstored: Style fixes to Domain
  tools/oxenstored: Bind the DOM_EXC VIRQ in in Event.init()
  tools/oxenstored: Rename some 'port' variables to 'remote_port'
  tools/oxenstored: Implement Domain.rebind_evtchn
  tools/oxenstored: Rework Domain evtchn handling to use port_pair

Edwin Török (1):
  tools/oxenstored: Keep /dev/xen/evtchn open across live update

 tools/ocaml/xenstored/connections.ml |  9 +---
 tools/ocaml/xenstored/domain.ml      | 86 ++++++++++++++++++++--------------
 tools/ocaml/xenstored/domains.ml     | 31 ++++++-------
 tools/ocaml/xenstored/event.ml       | 20 ++++++--
 tools/ocaml/xenstored/process.ml     | 16 +++----
 tools/ocaml/xenstored/xenstored.ml   | 89 +++++++++++++++++++++++-------------
 6 files changed, 149 insertions(+), 102 deletions(-)

-- 
2.11.0


