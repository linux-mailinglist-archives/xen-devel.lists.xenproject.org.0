Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B232D13BF0B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:56:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhFE-0003Hb-Lx; Wed, 15 Jan 2020 11:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irhFD-0003HW-Hh
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:53:55 +0000
X-Inumbo-ID: af356c76-378d-11ea-b89f-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af356c76-378d-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579089226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MUoEl6d7R85iSusoOMjR07npH2tnm1F6gTBiE+0qHt0=;
 b=BQwVmYhuU1H3AilxUkP4cAStKaQqvyLTI3tTbMMlYm1KzMQ6ubbwaPPh
 DKF4Kcy5UGO+XuHimjRSD1wBL2McFx1ZeyV/h14GWjUuKiQAvJbFA3/R4
 WTwGmRd6UpDdsk3X0a9dydkSKVD7kmYoDqiNpk4qBxu/eYVkDNTeGweB2 k=;
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
IronPort-SDR: S28LMLdmuJfx0ejbwaf9dGnrrwE80Ze9pvoZkmnk8NGgfsGpqfGviZXOioeSvPbb5ktfEc/fpj
 DvF6GOLtPePU7jz00VSYunu2RYuzZpZN+LVAg9XoQxtlAmua9pKB5areqVDugpRzKDEDto9Nnk
 yTbURS3z+alfXAP09pOorI3k3GFIJZQzdNkYF+LetY8dgoET1HdbQvxuwIASqIWtgArRXVTGey
 jhuH93SoEo2aAYN6fj7sdG9l2VDX59q1qfyHe4pvVQXK37SmIBUkVO4aaKDq8YdtblrcwWSAnU
 nS4=
X-SBRS: 2.7
X-MesageID: 11529231
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11529231"
Date: Wed, 15 Jan 2020 12:53:38 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200115115338.GL11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMTI6NDA6MjdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMDEuMjAyMCAxMDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA3OjM2OjIxUE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdy
b3RlOgo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+PiArKysgYi94ZW4vYXJjaC94
ODYvdGltZS5jCj4gPj4gQEAgLTk1NSwxMCArOTU1LDE2IEBAIHU2NCBzdGltZTJ0c2Moc190aW1l
X3Qgc3RpbWUpCj4gPj4gIAo+ID4+ICB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+ID4+
ICB7Cj4gPj4gKyAgICBzdHJ1Y3QgY3B1X3RpbWUgKnQgPSAmdGhpc19jcHUoY3B1X3RpbWUpOwo+
ID4+ICsKPiA+PiAgICAgIGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX05PTlNUT1BfVFND
KSApCj4gPj4gICAgICAgICAgcmV0dXJuOwo+ID4+ICAKPiA+PiAtICAgIHdyaXRlX3RzYyhzdGlt
ZTJ0c2MocmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKSkpOwo+ID4+ICsgICAgdC0+c3RhbXAubWFz
dGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKTsKPiA+PiArICAgIHQtPnN0YW1w
LmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0ZXJfc3RpbWUpOwo+ID4+ICsgICAg
dC0+c3RhbXAubG9jYWxfc3RpbWUgPSB0LT5zdGFtcC5tYXN0ZXJfc3RpbWU7Cj4gPj4gKwo+ID4+
ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7Cj4gPiAKPiA+IEluIG9yZGVyIHRv
IGF2b2lkIHRoZSBUU0Mgd3JpdGUgKGFuZCB0aGUgbGlrZWx5IGFzc29jaWF0ZWQgdm1leGl0KSwK
PiA+IGNvdWxkIHlvdSBpbnN0ZWFkIGRvOgo+ID4gCj4gPiB0LT5zdGFtcC5sb2NhbF9zdGltZSA9
IHQtPnN0YW1wLm1hc3Rlcl9zdGltZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCk7Cj4gPiB0
LT5zdGFtcC5sb2NhbF90c2MgPSByZHRzY19vcmRlcmVkKCk7Cj4gPiAKPiA+IEkgdGhpbmsgaXQg
c2hvdWxkIGFjaGlldmUgdGhlIHNhbWUgYXMgaXQgc3luY3MgdGhlIGxvY2FsIFRTQyBzdGFtcCBh
bmQKPiA+IHRpbWVzLCB3b3VsZCBhdm9pZCB0aGUgVFNDIHdyaXRlIGFuZCBzbGlnaHRseSBzaW1w
bGlmaWVzIHRoZSBsb2dpYy4KPiAKPiBXb3VsZG4ndCB0aGlzIHJlc3VsdCBpbiBndWVzdHMgcG9z
c2libHkgb2JzZXJ2aW5nIHRoZSBUU0MgbW92aW5nCj4gYmFja3dhcmRzPwoKSXNuJ3QgbG9jYWxf
dHNjIHN0b3JpbmcgYSBUU0MgdmFsdWUgcmVhZCBmcm9tIHRoZSBzYW1lIENQVSBhbHdheXMsIGFu
ZApoZW5jZSBjb3VsZCBvbmx5IGdvIGJhY2t3YXJkcyBpZiByZHRzYyBhY3R1YWxseSBnb2VzIGJh
Y2t3YXJkcz8KCkllOiBjcHVfZnJlcXVlbmN5X2NoYW5nZSBzZWVtcyB0byBkbyBzb21ldGhpbmcg
c2ltaWxhciwgdG9nZXRoZXIgd2l0aAphIHJlLWFkanVzdGluZyBvZiB0aGUgdGltZSBzY2FsZSwg
YnV0IGRvZXNuJ3QgcGVyZm9ybSBhbnkgVFNDIHdyaXRlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
