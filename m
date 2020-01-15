Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F413C380
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 14:47:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriy9-0006DD-1y; Wed, 15 Jan 2020 13:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iriy8-0006D8-31
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 13:44:24 +0000
X-Inumbo-ID: 1e4c4148-379d-11ea-b89f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e4c4148-379d-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579095854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FRe7IVRgx2OPuHoqqv3ZcSnigAG12PaPVYmq9YAuHSE=;
 b=RLOh/SutaGjEAYU/+s6pVkiWI1lkmDKYM/Fv4VK7zTOOdSv52xPSWtFP
 Z4wxB3PvI7l+061DXiNVZp0r9jBux71CXkZ8WJsgj8YW9W6WrTFza9kyc
 NQ+Z79RhKCYsrtWOTD1ZQ2ZCoYOhd1bMXdTNLysHq/Wqh3snmeaY6zcDz M=;
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
IronPort-SDR: oZLOyA1HV6Izv+Yt8dFSARqBKhrCUgAxjU16Hlkt07R5rTpObXMdOww4N8rXBkswRIKI7LLtR5
 WjSJHAYcB5rWTXk4xZZtB6SpdRKZF3RlHaJk8W8tWN67xGWIG8jG5ApMF+cM+zcdGJhYqvJGE3
 O4sH2GzMaHL+G2X3hmg6A3fILJNEvUWJ7Vqx4Ii4wRsx2r9Zb3o7l989FEEU6qIZKI8QCNuwrp
 7cWSY/XYEAfFmyXkFFYpvU0GZdmCeLP8G2bsvSBiAM+jtECntplle9pXW4E57F4pjKeSiG8vAA
 XHI=
X-SBRS: 2.7
X-MesageID: 11373436
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11373436"
Date: Wed, 15 Jan 2020 14:44:08 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200115134408.GN11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
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

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDE6NDk6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMDEuMjAyMCAxMjo1MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDE1LCAyMDIwIGF0IDEyOjQwOjI3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE1LjAxLjIwMjAgMTA6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA3OjM2OjIxUE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+ID4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L3RpbWUuYwo+ID4+Pj4gQEAgLTk1NSwxMCArOTU1LDE2IEBAIHU2NCBzdGltZTJ0
c2Moc190aW1lX3Qgc3RpbWUpCj4gPj4+PiAgCj4gPj4+PiAgdm9pZCBjc3RhdGVfcmVzdG9yZV90
c2Modm9pZCkKPiA+Pj4+ICB7Cj4gPj4+PiArICAgIHN0cnVjdCBjcHVfdGltZSAqdCA9ICZ0aGlz
X2NwdShjcHVfdGltZSk7Cj4gPj4+PiArCj4gPj4+PiAgICAgIGlmICggYm9vdF9jcHVfaGFzKFg4
Nl9GRUFUVVJFX05PTlNUT1BfVFNDKSApCj4gPj4+PiAgICAgICAgICByZXR1cm47Cj4gPj4+PiAg
Cj4gPj4+PiAtICAgIHdyaXRlX3RzYyhzdGltZTJ0c2MocmVhZF9wbGF0Zm9ybV9zdGltZShOVUxM
KSkpOwo+ID4+Pj4gKyAgICB0LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0
aW1lKE5VTEwpOwo+ID4+Pj4gKyAgICB0LT5zdGFtcC5sb2NhbF90c2MgPSBzdGltZTJ0c2ModC0+
c3RhbXAubWFzdGVyX3N0aW1lKTsKPiA+Pj4+ICsgICAgdC0+c3RhbXAubG9jYWxfc3RpbWUgPSB0
LT5zdGFtcC5tYXN0ZXJfc3RpbWU7Cj4gPj4+PiArCj4gPj4+PiArICAgIHdyaXRlX3RzYyh0LT5z
dGFtcC5sb2NhbF90c2MpOwo+ID4+Pgo+ID4+PiBJbiBvcmRlciB0byBhdm9pZCB0aGUgVFNDIHdy
aXRlIChhbmQgdGhlIGxpa2VseSBhc3NvY2lhdGVkIHZtZXhpdCksCj4gPj4+IGNvdWxkIHlvdSBp
bnN0ZWFkIGRvOgo+ID4+Pgo+ID4+PiB0LT5zdGFtcC5sb2NhbF9zdGltZSA9IHQtPnN0YW1wLm1h
c3Rlcl9zdGltZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCk7Cj4gPj4+IHQtPnN0YW1wLmxv
Y2FsX3RzYyA9IHJkdHNjX29yZGVyZWQoKTsKPiA+Pj4KPiA+Pj4gSSB0aGluayBpdCBzaG91bGQg
YWNoaWV2ZSB0aGUgc2FtZSBhcyBpdCBzeW5jcyB0aGUgbG9jYWwgVFNDIHN0YW1wIGFuZAo+ID4+
PiB0aW1lcywgd291bGQgYXZvaWQgdGhlIFRTQyB3cml0ZSBhbmQgc2xpZ2h0bHkgc2ltcGxpZmll
cyB0aGUgbG9naWMuCj4gPj4KPiA+PiBXb3VsZG4ndCB0aGlzIHJlc3VsdCBpbiBndWVzdHMgcG9z
c2libHkgb2JzZXJ2aW5nIHRoZSBUU0MgbW92aW5nCj4gPj4gYmFja3dhcmRzPwo+ID4gCj4gPiBJ
c24ndCBsb2NhbF90c2Mgc3RvcmluZyBhIFRTQyB2YWx1ZSByZWFkIGZyb20gdGhlIHNhbWUgQ1BV
IGFsd2F5cywgYW5kCj4gPiBoZW5jZSBjb3VsZCBvbmx5IGdvIGJhY2t3YXJkcyBpZiByZHRzYyBh
Y3R1YWxseSBnb2VzIGJhY2t3YXJkcz8KPiAKPiBGb3Igb25lIEkgaGF2ZSB0byBhZG1pdCBJIHdh
cyAobWlzdGFrZW5seSkgdGhpbmtpbmcgb2Ygd2FrZXVwCj4gZnJvbSBTIHN0YXRlcyBtb3JlIHRo
YW4gdGhhdCBmcm9tIEMgc3RhdGVzLiBTbyBhc3N1bWluZyB0aGUKPiBUU0MgaW5kZWVkIG9ubHkg
c3RvcHMgKGJ1dCB3b24ndCBnZXQgZS5nLiByZXN0YXJ0ZWQpLCBiYWNrd2FyZHMKPiBtb3ZlcyBv
dWdodCB0byBiZSBleGNsdWRlZC4KCkV2ZW4gaWYgdGhlIFRTQyB3YXMgcmVzdGFydGVkIEkgdGhp
bmsgbXkgcHJvcG9zZWQgYXBwcm9hY2ggc2hvdWxkIGJlCmZpbmUuIFRoZSBvbmx5IHJlcXVpcmVt
ZW50IGlzIHRoYXQgdGhlIHN0b3JlZCBUU0Mgc3RhbXAgbXVzdCBhbHdheXMgYmUKYmVoaW5kIHRo
YW4gdGhlIHZhbHVlIHJldHVybmVkIGJ5IHJkdHNjLiBTZWUgZ2V0X3NfdGltZV9maXhlZDogYXMK
bG9uZyBhcyB0aGUgZGVsdGEgaXMgcG9zaXRpdmUgdGhlIHJldHVybmVkIHRpbWUgc2hvdWxkIGJl
IGNvcnJlY3QuCgo+IFdoYXQgSSdtIHRoZW4gd29ycmllZCBhYm91dCBpcyB0b28KPiBsaXR0bGUg
cHJvZ3Jlc3Mgb2JzZXJ2YWJsZSBieSBndWVzdHMuIFRoZSBQViB0aW1lIHByb3RvY29sCj4gb3Vn
aHQgdG8gYmUgZmluZSBpbiB0aGlzIHJlZ2FyZCAoYW5kIGNvbnN1bWVycyBvZiByYXcgVFNDIHZh
bHVlcwo+IGFyZSBvbiB0aGVpciBvd24gYW55d2F5KSwgYnV0IHdvdWxkbid0IHlvdSBuZWVkIHRv
IHVwZGF0ZSBUU0MKPiBvZmZzZXRzIG9mIEhWTSBndWVzdHMgaW4gb3JkZXIgdG8gY29tcGVuc2F0
ZSBmb3IgdGhlIGVsYXBzZWQKPiB0aW1lPwoKVGhhdCB3aWxsIGJlIGRvbmUgd2hlbiB0aGUgSFZN
IHZDUFUgZ2V0cyBzY2hlZHVsZWQgaW4gYXMgcGFydCBvZiB0aGUKdXBkYXRlX3ZjcHVfc3lzdGVt
X3RpbWUgY2FsbCBBRkFJQ1QuIGNzdGF0ZV9yZXN0b3JlX3RzYyB3aWxsIGFsd2F5cyBiZQpjYWxs
ZWQgd2l0aCB0aGUgaWRsZSB2Q1BVIGNvbnRleHQsIGFuZCBoZW5jZSB0aGVyZSdzIGFsd2F5cyBn
b2luZyB0bwpiZSBhIHZDUFUgc3dpdGNoIGJlZm9yZSBzY2hlZHVsaW5nIGFueXRoaW5nIGVsc2Uu
Cgo+ID4gSWU6IGNwdV9mcmVxdWVuY3lfY2hhbmdlIHNlZW1zIHRvIGRvIHNvbWV0aGluZyBzaW1p
bGFyLCB0b2dldGhlciB3aXRoCj4gPiBhIHJlLWFkanVzdGluZyBvZiB0aGUgdGltZSBzY2FsZSwg
YnV0IGRvZXNuJ3QgcGVyZm9ybSBhbnkgVFNDIHdyaXRlLgo+IAo+IEEgUC1zdGF0ZSBjaGFuZ2Ug
YXQgbW9zdCBhbHRlcnMgdGhlIHRoZSB0aWNrIHJhdGUsIGJ1dCB3b3VsZG4ndAo+IHN0b3Agb3Ig
ZXZlbiByZXNldCB0aGUgVFNDIChhZmFpY3QpLgoKUmlnaHQsIGp1c3Qgd2FudGVkIHRvIHBvaW50
IG91dCB0aGF0IHRoZSBjcHVfdGltZSBzdGFtcCBjYW4gYmUKdXBkYXRlZCB3aXRob3V0IGhhdmlu
ZyB0byB3cml0ZSB0byB0aGUgVFNDLiBBbnl3YXksIG5vdCBzdXJlIGl0J3MgdmVyeQpyZWxldmFu
dCBvciB1c2VmdWwsIHNvIGZvcmdldCB0aGlzIHJlZmVyZW5jZS4KClJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
