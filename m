Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EC10500C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:08:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjLi-0002tY-N4; Thu, 21 Nov 2019 10:06:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXjLg-0002tS-UR
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:06:04 +0000
X-Inumbo-ID: 85ed9b8a-0c46-11ea-984a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85ed9b8a-0c46-11ea-984a-bc764e2007e4;
 Thu, 21 Nov 2019 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574330762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OlHmzDYucg+PtYaLDPQUKhQ2UWurbQwxfa0204gPiu0=;
 b=iBF/hErDL6hvAmcIEmbVmvKjQzlxG5+YjHaBaqtPt1id+ynIiroWlV/F
 qp/BJQrGZmg/mYHtozMNZ061uhmt5zpT+alCylFmuo326pUnXQ2Pv/xjX
 PHUrTjFQzEpxUyuCQuqw+1naR3BUd9hBeRH/ElO3M5c1i8h8P5H7pDiqN c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ra5Nf2UPWPujzaARdsChQsdsJk9jxCLMibIIyJkw+6e/dH69ECj3TRHejP4+Zu4RUCKOd5LIzx
 BfM1QzStdRO1219QmeADj4qeiraVFQ2DBS+UEkFL4g25A6rtnRr2UuC0LwPkJnHTjVtYrg91Od
 fnHxMWLaF+bre61gmytC0fyPEGRvZpT8d012bX6QBg2mHAdFu28bgwgjKAiziWH++CafZNtb6p
 onfWMqR4OyPmya7bxwHkhB+VpYE6IvufAcY+u4ixKI/WcOgGwU6aRqQBaWd7qyWnt1BMSYjFkn
 c+o=
X-SBRS: 2.7
X-MesageID: 9002169
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,224,1571716800"; 
   d="scan'208";a="9002169"
Date: Thu, 21 Nov 2019 11:05:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121100554.GT72134@Air-de-Roger>
References: <20191120173920.8705-1-roger.pau@citrix.com>
 <861a7ddf-b87f-0572-a586-56b9a2f840b0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <861a7ddf-b87f-0572-a586-56b9a2f840b0@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTA6NDg6MTZBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMTEuMjAxOSAxODozOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCBjb2RlIHVuY29uZGl0aW9uYWxseSBwcmV2ZW50cyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NV
U19ESVNBQkxFRAo+ID4gcmVnYXJkbGVzcyBvZiB0aGUgcHJvY2Vzc29yIG1vZGVsLCB3aGljaCBp
cyBub3QgY29ycmVjdCBhY2NvcmRpbmcgdG8KPiA+IHRoZSBzcGVjaWZpY2F0aW9uLgo+ID4gCj4g
PiBGaXggaXQgYnkgYWxsb3dpbmcgc2V0dGluZyBBUElDX1NQSVZfRk9DVVNfRElTQUJMRUQgYmFz
ZWQgb24gdGhlCj4gPiBkb21haW4gY3B1aWQgcG9saWN5Lgo+IAo+IFdvdWxkIHlvdSBtaW5kIGFk
ZGluZyBoYWxmIGEgc2VudGVuY2UgdG8gY2xhcmlmeSB3aGV0aGVyIHRoaXMgaXMgYQo+IHByb2Js
ZW0gb2JzZXJ2ZWQgaW4gcHJhY3RpY2UsIG9yIHNpbXBseSBmb3VuZCBieSBjb2RlIGluc3BlY3Rp
b24/CgpUaGlzIHdhcyBmb3VuZCBieSB0cnlpbmcgdG8gYm9vdCB0aGUgcHZzaGltIHdpdGggeDJB
UElDIGVuYWJsZWQsIHNpbmNlClhlbiB3aWxsIHRyeSB0byBkaXNhYmxlIGZvY3VzIGF0IGluaXRf
YnNwX0FQSUMgZm9yIHRoZSBCU1AuIE5vdGUgdGhhdApBRkFJQ1QgdGhpcyBpcyBub3QgZG9uZSBm
b3IgdGhlIEFQcywgYW5kIHNldHVwX2xvY2FsX0FQSUMgd2lsbCBhbHNvCmF2b2lkIHNldHRpbmcg
dGhlIGZvY3VzIGRpc2FibGVkIGJpdC4KCkkgdGhpbmsgdGhlIHNldHRpbmcgb2YgdGhlIGZvY3Vz
IGRpc2FibGUgYml0IGluIGluaXRfYnNwX0FQSUMgY2FuIGJlCnJlbW92ZWQsIGJ1dCB0aGF0J3Mg
YSBkaWZmZXJlbnQgaXNzdWUuCgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYwo+
ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYwo+ID4gQEAgLTk3Nyw2ICs5NzcsNyBA
QCBpbnQgZ3Vlc3Rfd3Jtc3JfeDJhcGljKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVp
bnQ2NF90IG1zcl9jb250ZW50KQo+ID4gIHsKPiA+ICAgICAgc3RydWN0IHZsYXBpYyAqdmxhcGlj
ID0gdmNwdV92bGFwaWModik7Cj4gPiAgICAgIHVpbnQzMl90IG9mZnNldCA9IChtc3IgLSBNU1Jf
WDJBUElDX0ZJUlNUKSA8PCA0Owo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpj
cHVpZCA9IHYtPmRvbWFpbi0+YXJjaC5jcHVpZDsKPiAKPiBXZSBjb21tb25seSBuYW1lIHN1Y2gg
dmFyaWFibGVzICJjcCIuCgpBY2ssIGluIGFueSBjYXNlIHRoaXMgaXMgZ29pbmcgYXdheS4KCj4g
Cj4gPiBAQCAtOTkzLDYgKzk5NCwxNCBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfeDJhcGljKHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90IG1zcl9jb250ZW50KQo+ID4gIAo+ID4gICAg
ICBjYXNlIEFQSUNfU1BJVjoKPiA+ICAgICAgICAgIGlmICggbXNyX2NvbnRlbnQgJiB+KEFQSUNf
VkVDVE9SX01BU0sgfCBBUElDX1NQSVZfQVBJQ19FTkFCTEVEIHwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBB
UElDX1NQSVZfRk9DVVNfRElTQUJMRUQgaXMgbm90IHN1cHBvcnRlZCBvbgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICogSW50ZWwgUGVudGl1bSA0IGFuZCBYZW9uIHByb2Nlc3Nv
cnMuCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICgoY3B1aWQtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRF
TCB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfY3B1X2ZhbWlseShj
cHVpZC0+YmFzaWMucmF3X2ZtcywgTlVMTCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTlVMTCkgIT0gMTUpID8KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQVBJQ19TUElWX0ZPQ1VTX0RJU0FCTEVEIDogMCkgfAo+IAo+IERvIHdl
IGFjdHVhbGx5IG5lZWQgdGhpcyAodmlydHVhbCkgZmFtaWx5IGNoZWNrPyBJZiBJJ20gbm90IG1p
c3Rha2VuCj4gLSBwaHlzaWNhbCBmYW1pbHkgMHhmIENQVXMgZG9uJ3Qgc3VwcG9ydCB4MkFQSUMs
CgpJIGFzc3VtZWQgd2UgZXhwb3NlZCB4MkFQSUMgc3VwcG9ydCB0byBhbGwgZ3Vlc3RzLCByZWdh
cmRsZXNzIG9mCndoZXRoZXIgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUgc3VwcG9ydHMgaXQgb3Ig
bm90LgoKPiAtIGluIHhBUElDIG1vZGUsIHdyaXRpbmcgcmVzZXJ2ZWQgYml0cyB3b3VsZG4ndCBm
YXVsdCAtIHN1Y2ggd3JpdGVzCj4gICB3b3VsZCBzaW1wbHkgYmUgaWdub3JlZC4KPiBUaGVyZWZv
cmUgSSBzZWUgbm8gcmlzayBpbiBhbHdheXMgcGVybWl0dGluZyB0aGUgYml0IHRvIGdldCBzZXQK
PiAobGlrZSB0aGUgY29ycmVzcG9uZGluZyB4QVBJQyBsb2dpYyBkb2VzLCBzYWRseSBieSB1c2lu
ZyBhIGxpdGVyYWwKPiBudW1iZXIgaW5zdGVhZCBvZiBBUElDX1NQSVZfKikuIE9uIHRoZSBjb250
cmFyeSwgY29kZSBzZWVpbmcgYW4KPiB4MkFQSUMgbWlnaHQgYXNzdW1lIHRoZSBmbGFnIHRvIGJl
IHNldHRhYmxlIHJlZ2FyZGxlc3Mgb2YgZmFtaWx5Cj4gKGJlY2F1c2UgaW1wbGljaXRseSBpdCB3
b3VsZG4ndCBleHBlY3QgdG8gYmUgb24gZmFtaWx5IDB4ZikuCgpSaWdodC4gVEJIIEkgaGFkIG15
IGRvdWJ0cyBhYm91dCB0aGlzIGFuZCBJIHdhcyBhbHNvIGNvbnNpZGVyaW5nIHRvCmFsd2F5cyBh
bGxvdyBzZXR0aW5nIHRoZSBiaXQsIGF0IHRoZSBlbmQgb2YgZGF5IHRoaXMgaXMgYWxsCmVtdWxh
dGVkLiBTaW5jZSB5b3UgYWdyZWUgSSB3aWxsIGRyb3AgdGhlIGZhbWlseSBkZXBlbmRlbmNlIGFs
d2F5cwphbGxvdyBzZXR0aW5nIGZvY3VzIGRpc2FibGVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
