Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F201B35A64
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:23:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYT1b-0004PL-5A; Wed, 05 Jun 2019 10:20:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYT1Z-0004Dr-3f
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:20:05 +0000
X-Inumbo-ID: 7b8e534d-877b-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b8e534d-877b-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:20:03 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tjbXVV3CJs+Lvm/XpZV3B3GVU/x9I416pApeT2dvTQFL4NoTy1sfWTCzT42ywM9fB48o9KPU2E
 IWPaVodWlpDyS/TPzmaSg0IwPvD5Z99RfNQue46wx+SYKfO0mpIlHUAeK4DTpJ8Pk18VSUp/7I
 ZMynGgm2681VoIhXgc9nIa5oxJTI/II5SZiQ7DF3+P+l8dsBMDCgMyA/omLo63aSgMPJTI7zgO
 8/GGlQGFJlJOpjiszFb3ihG1zLy9ecSWEON1a0xlZ0vmYURg9eFx5I1iMKNAt7Ha72Hqi77n/x
 /Ys=
X-SBRS: 2.7
X-MesageID: 1315381
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1315381"
Date: Wed, 5 Jun 2019 12:19:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190605101953.3qn7kzgsnpoltl3v@Air-de-Roger>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF666F90200007800235113@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF666F90200007800235113@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/PV: tighten page table ownership
 check in emul-priv-op.c:read_cr()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDY6NDE6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmF0aGVyIHRoYW4gY2hlY2tpbmcgdGhhdCBhIHBhZ2UgdGFibGUgaXMgX25vdF8gIm93
bmVkIiBieSB0aGUgZmFrZSBDT1cKPiBkb21haW4sIGNoZWNrIHRoYXQgaXQncyBvd25lZCBieSB0
aGUgZG9tYWluIGFjdHVhbGx5IHdhbnRpbmcgdG8gaW5zdGFsbAo+IGl0Lgo+IAo+IFN3aXRjaCBh
d2F5IGZyb20gQlVHX09OKCkgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IC0tLQo+IHYyOiBTcGxpdCBvdXQgZnJvbSBs
YXJnZXIgcGF0Y2ggdG8gbWFrZSBmdXJ0aGVyIGFkanVzdG1lbnRzLgo+IC0tLQo+IFRoaW5raW5n
IGFib3V0IGl0IEkgd29uZGVyIHdoeSB3ZSBoYXZlIHN1Y2ggYSBjaGVjayBoZXJlIGFuZCBuby13
aGVyZQo+IGVsc2UuIEFuIGFsdGVybmF0aXZlIHdvdWxkIHNlZW0gdG8gYmUgdG8gc2ltcGx5IGRy
b3AgdGhlIEJVR19PTigpLgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3Au
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwo+IEBAIC03MDYsNyArNzA2
LDcgQEAgc3RhdGljIGludCByZWFkX2NyKHVuc2lnbmVkIGludCByZWcsIHVucwo+ICAKPiAgICAg
IGNhc2UgMzogLyogUmVhZCBDUjMgKi8KPiAgICAgIHsKPiAtICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpjdXJyZCA9IGN1cnItPmRvbWFpbjsKPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpj
dXJyZCA9IGN1cnItPmRvbWFpbjsKPiAgICAgICAgICBtZm5fdCBtZm47Cj4gIAo+ICAgICAgICAg
IGlmICggIWlzX3B2XzMyYml0X2RvbWFpbihjdXJyZCkgKQo+IEBAIC03MjMsOCArNzIzLDE0IEBA
IHN0YXRpYyBpbnQgcmVhZF9jcih1bnNpZ25lZCBpbnQgcmVnLCB1bnMKPiAgICAgICAgICAgICAg
dW5tYXBfZG9tYWluX3BhZ2UocGw0ZSk7Cj4gICAgICAgICAgICAgICp2YWwgPSBjb21wYXRfcGZu
X3RvX2NyMyhtZm5fdG9fZ21mbihjdXJyZCwgbWZuX3gobWZuKSkpOwo+ICAgICAgICAgIH0KPiAt
ICAgICAgICAvKiBQVHMgc2hvdWxkIG5vdCBiZSBzaGFyZWQgKi8KPiAtICAgICAgICBCVUdfT04o
cGFnZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UobWZuKSkgPT0gZG9tX2Nvdyk7Cj4gKwo+ICsgICAg
ICAgIC8qIFBUcyBzaG91bGQgYmUgb3duZWQgYnkgdGhlaXIgZG9tYWlucyAqLwo+ICsgICAgICAg
IGlmICggcGFnZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UobWZuKSkgIT0gY3VycmQgKQo+ICsgICAg
ICAgIHsKPiArICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgICAg
IGRvbWFpbl9jcmFzaChjdXJyZCk7CgpJIHdvbmRlciB3aGV0aGVyIHlvdSBjb3VsZCBrZWVwIGN1
cnJkIGFzIGNvbnN0IGFuZCBqdXN0IHVzZQpjdXJyLT5kb21haW4gaGVyZS4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
