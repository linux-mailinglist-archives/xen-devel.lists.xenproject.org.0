Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD219F3EA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:57:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPRU-00008M-3c; Mon, 06 Apr 2020 10:57:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLPRS-00008H-4j
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:57:22 +0000
X-Inumbo-ID: 638f6706-77f5-11ea-bfe0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 638f6706-77f5-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XDRe6vJTxuvFJHLETgFyGVKLbvcSRm8LOY2Y/LB+8Dc=;
 b=Psx2+DqGZwCn7n2uPcZyRBPP7rs4D1OscB8DtyBdmmhfnq9cl/d6q3B0
 9pCN7k9cbnojiG5P99jaZhLLRnKHmm4Vsl+EPY8nwa1kT93xcJIRAZFLl
 hT+AxAgMzw0nWCgJSh/9xUs37lNQNohqXGaEERmr0qtxbIEwAHY/6l65B g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RzQnE3D2qTDpzsTNz5rDF8WYSgEars9fppLl2JkG23CqvMl1xt4L2G3K6+t+rJiBA7Nx9JOfdd
 DzJG/HK0BK4aKwyYBiInKVLBm9OWaAzJw6ueqKeg8w1Daq15o/2b7d/gRLE3QIhdDWJEY1HzUQ
 G7kvvrbTA3T2TFHkqaFqbSmcmeFdMH2CL38ItnuII5xrLPzNx1qfuSd3Lkhr798rcwlEFmmw+z
 8g4N6rgq6KF/z5n2MlI+UuIVps2LdGqjVtuATp/06v8/SM7y+KYEyoqtusd7WsT2hZAi5ZJv+I
 cjw=
X-SBRS: 2.7
X-MesageID: 15236532
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15236532"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v9 0/3] x86/guest: use assisted TLB flush in guest mode
Date: Mon, 6 Apr 2020 12:57:00 +0200
Message-ID: <20200406105703.79201-1-roger.pau@citrix.com>
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

 xen/arch/x86/flushtlb.c                | 25 +++++++++++++++++--------
 xen/arch/x86/guest/hypervisor.c        | 14 ++++++++++++++
 xen/arch/x86/guest/xen/xen.c           |  6 ++++++
 xen/arch/x86/mm/hap/hap.c              |  8 ++++----
 xen/arch/x86/mm/hap/nested_hap.c       |  2 +-
 xen/arch/x86/mm/hap/private.h          |  5 +++++
 xen/arch/x86/mm/p2m-pt.c               |  2 +-
 xen/arch/x86/mm/paging.c               |  3 ++-
 xen/arch/x86/mm/shadow/common.c        | 18 +++++++++---------
 xen/arch/x86/mm/shadow/hvm.c           |  2 +-
 xen/arch/x86/mm/shadow/multi.c         | 17 +++++++++--------
 xen/arch/x86/mm/shadow/private.h       |  6 ++++++
 xen/arch/x86/smp.c                     |  7 +++++++
 xen/include/asm-x86/flushtlb.h         | 23 ++++++++++++++++++++++-
 xen/include/asm-x86/guest/hypervisor.h | 17 +++++++++++++++++
 15 files changed, 121 insertions(+), 34 deletions(-)

-- 
2.26.0


