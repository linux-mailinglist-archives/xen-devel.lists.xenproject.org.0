Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9479173763
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:43:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7exZ-0002gC-Cm; Fri, 28 Feb 2020 12:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7exY-0002g2-06
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:41:40 +0000
X-Inumbo-ID: aa054868-5a27-11ea-b7e8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa054868-5a27-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582893699;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KCAGYrn93XASWJd/qYaYzMRr6S89XBhaZBAN8tgGzXU=;
 b=c7VivzURsePrb9mxUzuAG2FyKBED0mouCGOHtzlIRCdwUEWcZFd4WJxt
 HE+V0ZDmUN7QRVM5zni/fTJFRnHuRS6WnfUS4qE2peBg4JPHAgyY1uHre
 Or7UpOIJ8KlvIi3PcZX8ldtY6eytEaWdxM3SnKd0RY24041O+7HlKfbfj w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +EwMYgBkpfZRp7mdaTHnx0oRB8MN0zRX3aEKracFGlceTbcJI1bhtLjuQncVuyIeRKcBWHI5FL
 5l79vSJuoDXuY+eeJn18bXdVCcgOYoJS3hjrPr/52pJ5tenZLtR96Q6+yOXE/0plGYJJLoLPh/
 hLxFfHF1lWKuLBh5HA5Qx/dCaA41DjOmoDU/c+KHkPHAS4G6UQ7lvXkKXvG0/w78ijU6M3CkGA
 HGiu1UX2+RB+sfOGx/SxhzRooPcVP4YH6yD6iPDeOjKPzOjeZbkG37wCLqSm0Dfy5amp6yZw2/
 WLA=
X-SBRS: 2.7
X-MesageID: 13792267
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13792267"
Date: Fri, 28 Feb 2020 13:41:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228123331.GX24458@Air-de-Roger.citrite.net>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/2] AMD/IOMMU: correct handling when
 XT's prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDE6MTA6NTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2Ugc2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3
aG9sZSB0byBmYWlsIGluIHRoaXMKPiBjYXNlICh3ZSBzaG91bGQgc3RpbGwgYmUgYWJsZSB0byBi
cmluZyB1cCB0aGUgc3lzdGVtIGluIG5vbi14MkFQSUMgb3IKPiB4MkFQSUMgcGh5c2ljYWwgbW9k
ZSksIG5vciBzaG91bGQgdGhlIHJlbWFpbmRlciBvZiB0aGUgZnVuY3Rpb24gYmUKPiBza2lwcGVk
IChhcyB0aGUgbWFpbiBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpCgpJ
J20gbm90IHN1cmUgSSBzZWUgd2h5IGl0IHdvbid0IGdldCBlbnRlcmVkIGEgc2Vjb25kIHRpbWUu
IEFGQUlDVAppbml0X2RvbmUgd29uJ3QgYmUgc2V0IGlmIGFtZF9pb21tdV9pbml0IGZhaWxzLCBh
bmQgaGVuY2Ugd2lsbCBiZQpjYWxsZWQgYWdhaW4gd2l0aCB4dCA9PSBmYWxzZSBpbiBpb3ZfZGV0
ZWN0PwoKPiBpbiBzdWNoIGFuCj4gZXZlbnQuIEl0IGlzIG1lcmVseSBuZWNlc3NhcnkgZm9yIHRo
ZSBmdW5jdGlvbiB0byBpbmRpY2F0ZSB0byB0aGUgY2FsbGVyCj4gKGlvdl9zdXBwb3J0c194dCgp
KSB0aGF0IHNldHVwIGZhaWxlZCBhcyBmYXIgYXMgeDJBUElDIGlzIGNvbmNlcm5lZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpMR1RNLCBidXQg
aXQgbmVlZHMgdG8gZ28gaW4gd2l0aCAyLzIgQUZBSUNULCBvciBlbHNlIHlvdSB3b3VsZCByZXBv
cnQKaW50ZXJydXB0IHJlbWFwcGluZyBlbmFibGVkIGFuZCB4MkFQSUMgYWxzbyBlbmFibGVkIGJ1
dCB3b24ndCBoYW5kbGUKY29ycmVjdGx5IGEgMzIgYml0IGRlc3RpbmF0aW9uIGZpZWxkLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
