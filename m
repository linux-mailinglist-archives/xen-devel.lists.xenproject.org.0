Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02451134993
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:42:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFHP-0004ta-V5; Wed, 08 Jan 2020 17:38:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipFHO-0004tV-OJ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:38:02 +0000
X-Inumbo-ID: 9dbd19d0-323d-11ea-b861-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dbd19d0-323d-11ea-b861-12813bfff9fa;
 Wed, 08 Jan 2020 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578505081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jEpXZ+mdGNLk5xfw7hb46AOz0UlOeVoTpBb1AP3uUb4=;
 b=YC4M5RZdCwfR0rrrNrbBuBidEhePZCciGzT0syIOVCxGavWUDP1JI1ZS
 QWHwwDvGuRX+Ypu1eJMEawhHrWGpqLfA4oFr0bH4kQikaOtS3a2JpeiEr
 cn7qujP2+/ZhlcaZoyTMWf+O/iObETEtPACAz2xRQ8I6Pge10nBmgFuOf Q=;
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
IronPort-SDR: j5BRNv2dujWw5o0Se9uNjDGoDapk7+IqtOZJMkhC6UYwo/UVTzE1bTG93Fx3UuxBx7yI/r64Su
 14Jee1ARWFRx7g32YubwHaqwEf/h+4RBW9qOsP7vrvJNOi/CPFaewcbpvUsxAfbiG3bS6Ch6zO
 zZ5y/L6QlPYWdgDc1Je0zp83RS4YQsfKUfND4izdzeawzhMYGuP38sIl3JFe+RK0T84CPquHON
 fG+374m5nzg5yTiG9pKBPE4phFUNoONUrCEZX2FbhuYFppSAguBrJrdbKHIkxVGqo8yLf6zSXV
 62I=
X-SBRS: 2.7
X-MesageID: 11227230
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11227230"
Date: Wed, 8 Jan 2020 18:37:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108173754.GS11756@Air-de-Roger>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-2-roger.pau@citrix.com>
 <89458569-90b1-433a-c192-c22564c881c3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89458569-90b1-433a-c192-c22564c881c3@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hvm: improve performance of
 HVMOP_flush_tlbs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDQ6MTc6MTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMTIuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
cmUncyBubyBuZWVkIHRvIGNhbGwgcGFnaW5nX3VwZGF0ZV9jcjMgdW5sZXNzIENSMyB0cmFwcGlu
ZyBpcwo+ID4gZW5hYmxlZCwgYW5kIHRoYXQncyBvbmx5IHRoZSBjYXNlIHdoZW4gdXNpbmcgc2hh
ZG93IHBhZ2luZyBvciB3aGVuCj4gPiByZXF1ZXN0ZWQgZm9yIGludHJvc3BlY3Rpb24gcHVycG9z
ZXMsIG90aGVyd2lzZSB0aGVyZSdzIG5vIG5lZWQgdG8KPiA+IHBhdXNlIGFsbCB0aGUgdkNQVXMg
b2YgdGhlIGRvbWFpbiBpbiBvcmRlciB0byBwZXJmb3JtIHRoZSBmbHVzaC4KPiA+IAo+ID4gQ2hl
Y2sgd2hldGhlciBDUjMgdHJhcHBpbmcgaXMgY3VycmVudGx5IGluIHVzZSBpbiBvcmRlciB0byBk
ZWNpZGUKPiA+IHdoZXRoZXIgdGhlIHZDUFVzIHNob3VsZCBiZSBwYXVzZWQsIG90aGVyd2lzZSBq
dXN0IHBlcmZvcm0gdGhlIGZsdXNoLgo+IAo+IEZpcnN0IG9mIGFsbCAtIHdpdGggdGhlIGNvbW1p
dCBpbnRyb2R1Y2luZyB0aGUgcGF1c2luZyBub3Qgc2F5aW5nCj4gYW55dGhpbmcgb24gdGhlICJ3
aHkiLCB5b3UgbXVzdCBoYXZlIGdhaW5lZCBzb21lIHVuZGVyc3RhbmRpbmcKPiB0aGVyZS4gQ291
bGQgeW91IHNoYXJlIHRoaXM/CgpoYXBfdXBkYXRlX2NyMyBkb2VzIGEgInYtPmFyY2guaHZtLmh3
X2NyWzNdID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM10iCnVuY29uZGl0aW9uYWxseSwgYW5kIHN1
Y2ggYWNjZXNzIHdvdWxkIGJlIHJhY3kgaWYgdGhlIHZDUFUgaXMgcnVubmluZwphbmQgYWxzbyBt
b2RpZnlpbmcgY3IzIGF0IHRoZSBzYW1lIHRpbWUgQUZBSUNULgoKSnVzdCBwYXVzaW5nIGVhY2gg
dkNQVSBiZWZvcmUgY2FsbGluZyBwYWdpbmdfdXBkYXRlX2NyMyBzaG91bGQgYmUgZmluZQphbmQg
d291bGQgaGF2ZSBhIHNtYWxsZXIgcGVyZm9ybWFuY2UgcGVuYWx0eS4KCj4gSSBjYW4ndCBzZWUg
d2h5IHRoaXMgd2FzIG5lZWRlZCwgYW5kCj4gc2hfdXBkYXRlX2NyMygpIGFsc28gZG9lc24ndCBs
b29rIHRvIGhhdmUgYW55IHJlc3BlY3RpdmUgQVNTRVJUKCkKPiBvciBhbGlrZS4gSSdtIGhhdmlu
ZyBldmVuIG1vcmUgdHJvdWJsZSBzZWVpbmcgd2h5IGluIEhBUCBtb2RlIHRoZQo+IHBhdXNpbmcg
d291bGQgYmUgbmVlZGVkLgo+Cj4gQXMgYSByZXN1bHQgSSB3b25kZXIgd2hldGhlciwgcmF0aGVy
IHRoYW4gZGV0ZXJtaW5pbmcgd2hldGhlcgo+IHBhdXNpbmcgaXMgbmVlZGVkIGluc2lkZSB0aGUg
ZnVuY3Rpb24sIHRoaXMgc2hvdWxkbid0IGJlIGEgZmxhZwo+IGluIHN0cnVjdCBwYWdpbmdfbW9k
ZS4KPgo+IE5leHQgSSBzZXJpb3VzbHkgZG91YnQgaW50cm9zcGVjdGlvbiBob29rcyBzaG91bGQg
YmUgY2FsbGVkIGhlcmUuCj4gSW50cm9zcGVjdGlvbiBzaG91bGQgYmUgYWJvdXQgZ3Vlc3QgYWN0
aW9ucywgYW5kIHVzIGNhbGxpbmcKPiBwYWdpbmdfdXBkYXRlX2NyMygpIGlzIGFuIGltcGxlbWVu
dGF0aW9uIGRldGFpbCBvZiBYZW4sIG5vdAo+IHNvbWV0aGluZyB0aGUgZ3Vlc3QgY29udHJvbHMu
IEV2ZW4gbW9yZSwgdGhlcmUgbm90IGJlaW5nIGFueSBDUjMKPiBjaGFuZ2UgaGVyZSBJIHdvbmRl
ciB3aGV0aGVyIHRoZSBjYWxsIGJ5IHRoZSBob29rcyB0bwo+IGh2bV91cGRhdGVfZ3Vlc3RfY3Iz
KCkgY291bGRuJ3QgYmUgc3VwcHJlc3NlZCBhbHRvZ2V0aGVyIGluIHRoaXMKPiBjYXNlLiBRdWl0
ZSBwb3NzaWJseSBpbiB0aGUgc2hhZG93IGNhc2UgdGhlcmUgY291bGQgYmUgbW9yZQo+IHN0ZXBz
IHRoYXQgYXJlbid0IHJlYWxseSBuZWVkZWQsIHNvIHBlcmhhcHMgYSBzZXBhcmF0ZSBob29rIG1p
Z2h0Cj4gYmUgb24gb3JkZXIuCgpSaWdodCwgSSBndWVzcyBqdXN0IGhhdmluZyBhIGhvb2sgdGhh
dCBkb2VzIGEgZmx1c2ggd291bGQgYmUgZW5vdWdoLgpMZXQgbWUgdHJ5IHRvIHByb3Bvc2Ugc29t
ZXRoaW5nIHNsaWdodGx5IGJldHRlci4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
