Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B744F17DE9F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:23:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGRg-0005yr-N5; Mon, 09 Mar 2020 11:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8knV=42=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBGRe-0005ym-W4
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:19:39 +0000
X-Inumbo-ID: dcabfbcc-61f7-11ea-b52f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcabfbcc-61f7-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583752777;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=0bydsNg2+2Mo2iLMvk4mBG1Gesmfd2lcncJzt9Sm4TI=;
 b=OJOToppOtW8BW1P78cFzm5jntfGKZ6gTdCgunuIZVssvxUcvaQuZpDtQ
 NmVSBVybVXBG4LwB1N2nWC1N0vGOOJ1kFyPPtZoqGkoy3L7qE7a1Lcsf4
 DJd90yZMPyQSLgn+OYUz1znXIvwJJ9z2eVN0VJcTjmCRCRYLJ5V5MtQwn 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pA5pm4zm6pb9LneNe12lYXXlm04yea/AmoTd6Imc07hyWHsv++GRwyQBi51b7RhKUKy59lkN6L
 y2e8VQaoFlGVEGlMK/Petaw4EHdSTbxF9keY5jBLpBeHM6Ck7x6zVqWK/Z49v5Py2nS78DLbcx
 v77XV4raJnVmi1YHrMOJE69gA4P6gksiiXEbyAgIthwgSF+33EJ0W2uReERYmmkz5xd4kzruZ4
 zX08rvNBT2Degi1mmSS4gtJewtQZ53y+jO47vjAlEHr7yz5WjrjOHOPRGzzPvhIrHTpKpwqUCJ
 Dqw=
X-SBRS: 2.7
X-MesageID: 14046816
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="14046816"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24166.9796.198300.531332@mariner.uk.xensource.com>
Date: Mon, 9 Mar 2020 11:19:32 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200305160015.60232-1-roger.pau@citrix.com>
References: <20200305160015.60232-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST] make-flight: add dom0 PVH test
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUXSBtYWtlLWZsaWdodDogYWRk
IGRvbTAgUFZIIHRlc3QiKToKPiBBZGQgYSBkb20wIFBWSCB0ZXN0LCB0aGUgdGVzdCB0byBiZSBy
dW4gaXMgbGF1bmNoaW5nIGEgUFYgZ3Vlc3QKPiAodGVzdC1kZWJpYW4pLiBOb3RlIHRoZSBQVkgg
ZG9tMCB0ZXN0cyBhcmUgb25seSBlbmFibGVkIGZvciBYZW4gPj0KPiA0LjEzLgoKUmV2aWV3ZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzIQoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
