Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB225DA79
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:52:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEC8k-00077d-O7; Fri, 04 Sep 2020 13:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kEC8j-00077X-Ou
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:52:29 +0000
X-Inumbo-ID: 009e1a63-2f0b-4d21-9619-7ae5d8c0ee22
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 009e1a63-2f0b-4d21-9619-7ae5d8c0ee22;
 Fri, 04 Sep 2020 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599227548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R79jPQaAfi7MQ9LAN5a3K+elPsyN2Pc2NS0m0wlrRFc=;
 b=TnkVnEkTFY+L0b4a9CD83dYbq6BkHwurzxnWFlrAN1JW7sEos+cDyUwk
 Sw+sTxCaUveoiH9YF497rqe6zDxYRQFEFO9+ctdLkjOyGyzi+3vvwJoCc
 I/8QPDF+ZuJRYbYtlS5g9x35L+BJb5EMl1+IwjvjAVJl/VSd6+/pQg76C U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZFQjOMZXk2P06nAE22a+16rfOiv1DjSYi5qzKtaRIecKxf6bSW7NtNIoTm0FNLfjTcY5YHJeHH
 /Dqp1sVT6IA+vqKJWessJNy33/S4FpygXt+FUQ4IZe9plLbQqm7V20bAcbXsctX3a6ni1m7fJ/
 kaP1EBizh5F476pQxb3okTrbe0H33mvJ3/dfhRlfY8Wwv9h2jLGw3TbnTUUqi8MvSouj+r/umf
 yq+27WLqxhjjy6ez5RKnBrndunscZI5oWTkv67RlXJhrz7NOM8SwsvQ/9hl7ygbUIfC10+7f/C
 NO0=
X-SBRS: 2.7
X-MesageID: 26137701
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26137701"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
Subject: [PATCH v2 0/2] x86/pv: Segment context switch bugfixes
Date: Fri, 4 Sep 2020 14:52:07 +0100
Message-ID: <20200904135209.29226-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Split into two patches as more bugs were found with v1.

Andrew Cooper (2):
  x86/pv: Fix consistency of 64bit segment bases
  x86/pv: Rewrite segment context switching from scratch

 xen/arch/x86/domain.c                    | 199 ++++++++++++-------------------
 xen/arch/x86/pv/domain.c                 |  18 +--
 xen/arch/x86/pv/emul-priv-op.c           |  19 +--
 xen/arch/x86/x86_64/mm.c                 |   6 -
 xen/include/asm-x86/domain.h             |  19 ++-
 xen/include/public/arch-x86/xen-x86_64.h |   4 +-
 6 files changed, 106 insertions(+), 159 deletions(-)

-- 
2.11.0


