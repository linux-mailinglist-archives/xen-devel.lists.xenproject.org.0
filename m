Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF21AC47A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 16:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP542-00059I-9e; Thu, 16 Apr 2020 14:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8YfG=6A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jP541-00059B-3f
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:00:21 +0000
X-Inumbo-ID: 9baf24da-7fea-11ea-9e09-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9baf24da-7fea-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587045620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OVEGa+BBaSJHb0mtRikxXra1nYF8Nodlx6a7ie+oOaw=;
 b=FKhVdNl0s/lCdJcPBr+D4hPfaCfnnLAqn0yX4HoXvYtqkYs1/wTVcI/w
 P4fgF0TNzd8TlTA2qh77OZQkd9aYV4OKj30ZqKQcCkv7Sm9GfQfas4qU6
 K9Hngh+Ti0FdsGRLShRba6DHKL77ZnfnBB3LNPTEaKK/Z1mb1y3YvQc9s g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AhAbhK9I6BM6LOJPACLRR6pOah5wrRusMiBK7p1r0iLfgDUPWQfydBKVxOF9smQg4niD0q9gQY
 D60W3tk2tLwTw8Xeilvs9w2cnWLhEpJM4Uk2dl3vmLlAyjevsR/J8a956W5XxQIX77RKBEAHRC
 cGD1W3xfajEVr0bcHac9V1s4xcCv4tLnAaHi7Uan8YXbBVlkvSWfGy9XQDVt/LTtskmNd91ONM
 wYAZDQbcwiUQ/2gb0QbkhcRRHonA5hu0Wm9LByQ6sVWzcgl7603SAOrnYzxwUhwwdWaT/r/3L9
 Hhw=
X-SBRS: 2.7
X-MesageID: 16183925
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16183925"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v10 0/3] x86/guest: use assisted TLB flush in guest mode
Date: Thu, 16 Apr 2020 15:59:06 +0200
Message-ID: <20200416135909.16155-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

This is the remaining of the assisted TLB flush series. This last set of
patches enable the usage of the Xen assisted flush when running nested
on Xen.

Thanks, Roger.

Roger Pau Monne (3):
  x86/tlb: introduce a flush HVM ASIDs flag
  x86/tlb: allow disabling the TLB clock
  x86/tlb: use Xen L0 assisted TLB flush when available

 xen/arch/x86/flushtlb.c                | 37 ++++++++++++++++++++------
 xen/arch/x86/guest/hypervisor.c        | 14 ++++++++++
 xen/arch/x86/guest/xen/xen.c           |  6 +++++
 xen/arch/x86/mm/hap/hap.c              |  8 +++---
 xen/arch/x86/mm/hap/nested_hap.c       |  2 +-
 xen/arch/x86/mm/p2m-pt.c               |  5 ++--
 xen/arch/x86/mm/paging.c               |  2 +-
 xen/arch/x86/mm/shadow/common.c        | 18 ++++++-------
 xen/arch/x86/mm/shadow/hvm.c           |  2 +-
 xen/arch/x86/mm/shadow/multi.c         | 16 +++++------
 xen/arch/x86/mm/shadow/private.h       |  6 +++++
 xen/arch/x86/smp.c                     |  7 +++++
 xen/include/asm-x86/flushtlb.h         | 25 ++++++++++++++++-
 xen/include/asm-x86/guest/hypervisor.h | 17 ++++++++++++
 14 files changed, 130 insertions(+), 35 deletions(-)

-- 
2.26.0


