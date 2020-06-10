Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8011F53D4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizGW-000899-3D; Wed, 10 Jun 2020 11:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jizGV-000894-6y
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:51:31 +0000
X-Inumbo-ID: b9087e7c-ab10-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9087e7c-ab10-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 11:51:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zyLzOg9ydrdn0dJqs8dyKEpfPc+S21qCZ+0o6D50510o/5EcECpCCGeXcha8dPI4Y3E+hpBWHK
 jBGoC+3wrl7kFcWmdRSICWTgQGEEsbMYXgvIqVnpa+gRRJ4XZVf0Ip+ag+l/MH4r70+QtUIcAM
 fhpmP67Xr6NjOovJgPv2aa95VyOxlwRzJ34JGPxBzTDNvtz+weOb/GXSzQCmH1D1wPXfe3TOM8
 CSWWP448HRBWbfVtk3dBlBRbP9XMjwkwk1pWl8K/qP3piyqvKVtT/5Xbc668tQc7JzDuoK9Sh1
 z6I=
X-SBRS: 2.7
X-MesageID: 19915504
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19915504"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 0/2] x86/passthrough: fixes for PVH dom0 edge
 triggered interrupts
Date: Wed, 10 Jun 2020 13:51:01 +0200
Message-ID: <20200610115103.7592-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Small series with two bugfixes to correctly handle edge triggered
interrupts on PVH dom0.

for-4.14 reasoning: fixes are isolated to PVH dom0 specific passthrough
code (IDENTITY_GSI kind of bindings), and hence shouldn't affect
passthrough to HVM domUs. Without these fixes the RTC timer won't work
correctly on a PVH dom0 because it's edge triggered (GSI 8).

Roger Pau Monne (2):
  x86/passthrough: do not assert edge triggered GSIs for PVH dom0
  x86/passthrough: introduce a flag for GSIs not requiring an EOI or
    unmask

 xen/arch/x86/hvm/irq.c        | 13 ++++++++-----
 xen/drivers/passthrough/io.c  | 14 +++++++++++++-
 xen/include/asm-x86/hvm/irq.h |  2 ++
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.26.2


