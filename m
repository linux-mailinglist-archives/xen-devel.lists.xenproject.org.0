Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA80376D0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 16:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtQB-0007CB-N4; Thu, 06 Jun 2019 14:31:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYtQA-0007C6-A5
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 14:31:14 +0000
X-Inumbo-ID: bbf8c81a-8867-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbf8c81a-8867-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 14:31:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wcsXepiTu6N7fN+7G9EKDSHBvm1GolLzkMFa/67EboRx/gUgubAqxr8huELYHwnsdYtAF1AL6Q
 op9f+Q+LzW9opZt4QkGVBPKJE7s87zPJS4fiheHCYgOO7MpVsKe4cpQxTI4WOypQdlViR2H3Gc
 anUf0Svfo4vWqHTTrdOD5IHKO6SgEoGjxvf0AIj4yAv+NQbvcaNgZophgI890hp+OpMHGke1Qr
 j3ky8fKxXOCaigy7GNNmt7TDOIhTFzARydxM0BmX2jff8QNVfiW8k6PnK6N18QFvEX8baphfYV
 mg8=
X-SBRS: -0.9
X-MesageID: 1412136
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1412136"
Date: Thu, 6 Jun 2019 16:31:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190606143102.hozjnlcmod3ktjhv@Air-de-Roger>
References: <1559831189-26103-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559831189-26103-1-git-send-email-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/irq: Fix undefined behaviour in
 irq_move_cleanup_interrupt()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDM6MjY6MjlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBVQlNBTiByZXBvcnRzOgo+IAo+ICAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiAgIChYRU4pIFVCU0FOOiBVbmRlZmluZWQgYmVoYXZpb3VyIGluIGlycS5jOjY4MjoyMgo+
ICAgKFhFTikgbGVmdCBzaGlmdCBvZiAxIGJ5IDMxIHBsYWNlcyBjYW5ub3QgYmUgcmVwcmVzZW50
ZWQgaW4gdHlwZSAnaW50Jwo+ICAgKFhFTikgLS0tLVsgWGVuLTQuMTMtdW5zdGFibGUgIHg4Nl82
NCAgZGVidWc9eSAgIE5vdCB0YWludGVkIF0tLS0tCj4gICAoWEVOKSBDUFU6ICAgIDE2Cj4gICAo
WEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMmE1NGNlPl0gdWJzYW4uYyN1YnNhbl9lcGls
b2d1ZSsweGEvMHhjMgo+ICAgPHNuaXA+Cj4gICAoWEVOKSBYZW4gY2FsbCB0cmFjZToKPiAgIChY
RU4pICAgIFs8ZmZmZjgyZDA4MDJhNTRjZT5dIHVic2FuLmMjdWJzYW5fZXBpbG9ndWUrMHhhLzB4
YzIKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhNjAwOT5dIF9fdWJzYW5faGFuZGxlX3NoaWZ0
X291dF9vZl9ib3VuZHMrMHgxNWQvMHgxNmMKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMxYWU3
Nz5dIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KzB4MjVjLzB4NGEwCj4gICAoWEVOKSAgICBb
PGZmZmY4MmQwODAzMWI1ODU+XSBkb19JUlErMHgxOWQvMHgxMDRjCj4gICAoWEVOKSAgICBbPGZm
ZmY4MmQwODA1MGM4YmE+XSBjb21tb25faW50ZXJydXB0KzB4MTBhLzB4MTIwCj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAzYjEzYTY+XSBjcHVfaWRsZS5jI2FjcGlfaWRsZV9kb19lbnRyeSsweDFk
ZS8weDI0Ygo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwM2IxZDgzPl0gY3B1X2lkbGUuYyNhY3Bp
X3Byb2Nlc3Nvcl9pZGxlKzB4NWM4LzB4OTRlCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyZmE4
ZDY+XSBkb21haW4uYyNpZGxlX2xvb3ArMHhlZS8weDEwMQo+ICAgKFhFTikKPiAgIChYRU4pID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gU3dpdGNoIHRvIGFuIHVuc2lnbmVkIHNoaWZ0LCBh
bmQgY29ycmVjdCB0aGUgc3Vycm91bmRpbmcgc3R5bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
