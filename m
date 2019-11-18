Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0711006C2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 14:48:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWhMJ-0002tg-BT; Mon, 18 Nov 2019 13:46:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LWYA=ZK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iWhMH-0002tb-Od
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 13:46:25 +0000
X-Inumbo-ID: cf99cbe4-0a09-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf99cbe4-0a09-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574084784;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y1al6MPol7u4N5tk+NjJDWp04TxJGDI2dVXdilrXqok=;
 b=aHmo16+uAsnVRxgIkIEpsYZh7MBV/BXofUUtdDKxyObmgWxTdDZetbQm
 rRqf3VVJ9m4AgU0StKW/xWeAgJUBALvGCKfdVtD7kvTyUJ4uZZgVNWwCo
 Jhj5WQkxWmnsshglJovwiVxDK5l/OKErvyjOxiGENf92iiIL47VYUjVKN k=;
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
IronPort-SDR: xHXP3Dit2VWFwmW5ZAbK3dqbOFYpPm6WZAjy/TmXhhmQHAtNbBIui/hUC1MH4D5eL9jb8l3bQu
 HdYhTf0i3wflfDCZ2sNmeB/8cptRtEpT8LI88eFwqHtufT+Ntrxh8Esv97EKqHhTNekCIItwwR
 Zf6w9LiK4dZdUhv5rnUTFEcKs4YR5Xz5Ki8TECix68lFWW1C9+/uOhHi0CIGcIoEG5zDO5IhxQ
 jLJMY9Tqa9EL0xpDvMHuNMRBf4EGsu61Nc7900v/v71gK/R7sDTRD+A0JZGJrWZc+AKTMoIopm
 J0E=
X-SBRS: 2.7
X-MesageID: 8818671
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8818671"
Date: Mon, 18 Nov 2019 14:46:11 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191118134611.GK72134@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDE6MDE6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTEuMjAxOSAxMToxNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gV2hl
biB1c2luZyBwb3N0ZWQgaW50ZXJydXB0cyBvbiBJbnRlbCBoYXJkd2FyZSBpdCdzIHBvc3NpYmxl
IHRoYXQgdGhlCj4gPiB2Q1BVIHJlc3VtZXMgZXhlY3V0aW9uIHdpdGggYSBzdGFsZSBsb2NhbCBB
UElDIElSUiByZWdpc3RlciBiZWNhdXNlCj4gPiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMg
dG8gYmUgaW5qZWN0ZWQgdmxhcGljX2hhc19wZW5kaW5nX2lycQo+ID4gbWlnaHQgbm90IGJlIGNh
bGxlZCwgYW5kIHRodXMgUElSIHdvbid0IGJlIHN5bmNlZCBpbnRvIElSUi4KPiA+IAo+ID4gRml4
IHRoaXMgYnkgbWFraW5nIHN1cmUgUElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluIHZteF9p
bnRyX2Fzc2lzdAo+ID4gcmVnYXJkbGVzcyBvZiB3aGF0IGludGVycnVwdHMgYXJlIHBlbmRpbmcu
Cj4gCj4gRm9yIHRoaXMgcGFydCwgZGlkIHlvdSBjb25zaWRlciBwdWxsaW5nIGFoZWFkIHRvIHRo
ZSBiZWdpbm5pbmcKPiBvZiBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEoKSBpdHMgY2FsbCB0byB2
bGFwaWNfaGFzX3BlbmRpbmdfaXJxKCk/CgpJIGFzc3VtZWQgdGhlIG9yZGVyIGluIGh2bV92Y3B1
X2hhc19wZW5kaW5nX2lycSBpcyB0aGVyZSBmb3IgYSByZWFzb24uCkkgY291bGQgaW5kZWVkIG1v
dmUgdmxhcGljX2hhc19wZW5kaW5nX2lycSB0byB0aGUgdG9wLCBidXQgdGhlbiBlaXRoZXIKdGhl
IHJlc3VsdCBpcyBkaXNjYXJkZWQgaWYgZm9yIGV4YW1wbGUgYSBOTUkgaXMgcGVuZGluZyBpbmpl
Y3Rpb24KKGluIHdoaWNoIGNhc2UgdGhlcmUncyBubyBuZWVkIHRvIGdvIHRocm91Z2ggYWxsIHRo
ZSBsb2dpYyBpbgp2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKSwgb3Igd2UgaW52ZXJ0IHRoZSBwcmlv
cml0eSBvZiBldmVudAppbmplY3Rpb24uCgpJIGhhdmUgdG8gYWRtaXQgSSBoYXZlIGRvdWJ0cyBh
Ym91dCB0aGUgY29kZSBpbgpodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEuIEknbSBub3Qgc3VyZSB3
aGF0J3MgdGhlIG1vdGl2YXRpb24gZm9yCmV4YW1wbGUgdG8gZ2l2ZSBwcmlvcml0eSB0byBIVk1J
UlFfY2FsbGJhY2tfdmVjdG9yIG92ZXIgb3RoZXIgdmVjdG9ycwpmcm9tIHRoZSBsYXBpYy4KCj4g
SSBhc2sgYmVjYXVzZSAuLi4KPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIu
Ywo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5jCj4gPiBAQCAtMjMyLDYgKzIz
MiwxNCBAQCB2b2lkIHZteF9pbnRyX2Fzc2lzdCh2b2lkKQo+ID4gICAgICBlbnVtIGh2bV9pbnRi
bGsgaW50YmxrOwo+ID4gICAgICBpbnQgcHRfdmVjdG9yOwo+ID4gIAo+ID4gKyAgICBpZiAoIGNw
dV9oYXNfdm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ID4gKyAgICAgICAgLyoKPiA+ICsg
ICAgICAgICAqIEFsd2F5cyBmb3JjZSBQSVIgdG8gYmUgc3luY2VkIHRvIElSUiBiZWZvcmUgdm1l
bnRyeSwgdGhpcyBpcyBhbHNvCj4gPiArICAgICAgICAgKiBkb25lIGJ5IHZsYXBpY19oYXNfcGVu
ZGluZ19pcnEgYnV0IGl0J3MgcG9zc2libGUgb3RoZXIgcGVuZGluZwo+ID4gKyAgICAgICAgICog
aW50ZXJydXB0cyBwcmV2ZW50IHRoZSBleGVjdXRpb24gb2YgdGhhdCBmdW5jdGlvbi4KPiA+ICsg
ICAgICAgICAqLwo+ID4gKyAgICAgICAgdm14X3N5bmNfcGlyX3RvX2lycih2KTsKPiAKPiAuLi4g
dGhpcyBhZGRpdGlvbiBsb29rcyBtb3JlIGxpa2UgcGFwZXJpbmcgb3ZlciBzb21lIGlzc3VlIHRo
YW4KPiBhY3R1YWxseSB0YWtpbmcgY2FyZSBvZiBpdC4KClhlbiBuZWVkcyB0byBtYWtlIHN1cmUg
UElSIGlzIHN5bmNlZCB0byBJUlIgYmVmb3JlIGVudGVyaW5nCm5vbi1yb290IG1vZGUuIEkgY291
bGQgcGxhY2UgdGhlIGNhbGwgc29tZXdoZXJlIGVsc2UsIG9yIGFsdGVybmF0aXZlbHkKWGVuIGNv
dWxkIGRpc2FibGUgaW50ZXJydXB0cywgc2VuZCBhIHNlbGYtaXBpIHdpdGggdGhlIHBvc3RlZCB2
ZWN0b3IKYW5kIGVudGVyIG5vbi1yb290IG1vZGUuIFRoYXQgc2hvdWxkIElNTyBmb3JjZSBhIHJl
c3luYyBvZiBQSVIgdG8gSVJSCndoZW4gcmVzdW1pbmcgdkNQVSBleGVjdXRpb24sIGJ1dCBpcyBv
dmVybHkgY29tcGxpY2F0ZWQuCgo+IFRoZW4gYWdhaW4gSSB3b25kZXIgd2hldGhlciB0aGUgUElS
LT5JUlIgc3luYyBpcyBhY3R1YWxseQo+IGxlZ2l0aW1hdGUgdG8gcGVyZm9ybSB3aGVuIHYgIT0g
Y3VycmVudC4KCklNTyB0aGlzIGlzIGZpbmUgYXMgbG9uZyBhcyB0aGUgdkNQVSBpcyBub3QgcnVu
bmluZywgYXMgaW4gdGhhdCBjYXNlCnRoZSBoYXJkd2FyZSBpcyBub3QgaW4gY29udHJvbCBvZiBJ
UlIuCgo+IElmIGl0J3Mgbm90LCB0aGVuIHRoZXJlCj4gbWlnaHQgYmUgYSB3aWRlciBzZXQgb2Yg
cHJvYmxlbXMgKHNlZSBlLmcuCj4gaHZtX2xvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KCkpLiBC
dXQgb2YgY291cnNlIHRoZSBhZGp1c3RtZW50Cj4gdG8gaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJx
KCkgY291bGQgYWxzbyBiZSB0byBtYWtlIHRoZSBjYWxsCj4gZWFybHkgb25seSB3aGVuIHYgPT0g
Y3VycmVudC4KCkkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGJlIHRoYXQgcmVzdHJpY3RpdmUsIHYg
PT0gY3VycmVudCB8fAohdmNwdV9ydW5hYmxlKHYpIG91Z2h0IHRvIGJlIHNhZmUuIEkndmUgYWxz
byBmb3Jnb3QgdG8gc2VuZCBteQpwcmUtcGF0Y2ggdG8gaW50cm9kdWNlIGFuIGFzc2VydCB0byB0
aGF0IGVmZmVjdDoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMDYzNS5odG1sCgo+IEEgbGFzdCBxdWVzdGlvbiBpcyB0aGF0
IG9uIHRoZSBjb25zZXF1ZW5jZXMgb2Ygb3Zlcmx5IGFnZ3Jlc3NpdmUKPiBzeW5jLWluZyAtIHRo
YXQnbGwgaGFybSBwZXJmb3JtYW5jZSwgYnV0IHNob3VsZG4ndCBhZmZlY3QKPiBjb3JyZWN0bmVz
cyBpZiBJJ20gbm90IG1pc3Rha2VuLgoKVGhhdCdzIGNvcnJlY3QsIGFzIGxvbmcgYXMgdGhlIHZj
cHUgaXMgdGhlIGN1cnJlbnQgb25lIG9yIGl0J3Mgbm90CnJ1bm5pbmcuCgpSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
