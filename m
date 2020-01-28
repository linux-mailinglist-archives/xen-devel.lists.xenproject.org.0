Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC114B26C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 11:18:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwNro-0003p3-L6; Tue, 28 Jan 2020 10:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwNrm-0003oy-EQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 10:13:06 +0000
X-Inumbo-ID: c5ca757a-41b6-11ea-ad98-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5ca757a-41b6-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580206385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CkIX/JKuZQbLBC08MtNbDyyWGTUKC5YxTgOX9W+k+nE=;
 b=Jx322X30/244bgDPM0btEepEmiPXMtRWCWJAgD3SCl/OI7E2Mnv9xxVh
 I6YhEz24UwvaoTJgcz9/5/V097aEUblwteGL0kEM363Uu9sEqydYYSFph
 aKT7jLtxH0a1cbYTSQbETua8WlMqSOV5LenMKe7JDpS7kojLHd7To0hYL A=;
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
IronPort-SDR: l2sBb038cOpuOM9pvlsDBvoD6oIzWWYKDJAE41NKCzGvM93vcsYhdpKQuPBsKjyVsJeu340E4K
 Fqi1TvHPuqNivRM+RVUKRmdJYXPSnkO0/MV2ftTwvUlKaN+EmLLW5fEQsYUPUP0bno5Cvi+Uiq
 ryHATRyvQI4xH9qDAT2ksHJroFYCNkw4dbZSi95gjOsfH/XuwZ5bn7Z6S1f/pTS/O/tblDaahR
 V4Of/UzcjZGWYEcnZnQKqmP+e8Cy4RMCVJwyhLxuutzyQYq5iMlhy3Pq5L6L8yEZTrml2DyyYU
 mYk=
X-SBRS: 2.7
X-MesageID: 11910408
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11910408"
Date: Tue, 28 Jan 2020 11:12:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200128101257.GJ57924@desktop-tdan49n.eng.citrite.net>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
 <299023995.1231830.1580157801838@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <299023995.1231830.1580157801838@mail.yahoo.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDg6NDM6MjFQTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6
Cj4gUm9qZXIsCj4gCj4gPiBZb3UgY2FuIGFsc28gc3RhcnQgeGwgZGV2ZCBtYW51YWxseSwgYXMg
dGhhdCB3aWxsIGdpdmUgeW91IHZlcmJvc2UKPiA+IG91dHB1dCBvZiB3aGF0cyBnb2luZyBvbi4g
SW4gdGhlIGRyaXZlciBkb21haW46Cj4gCj4gPiAjIGtpbGxhbGwgeGwKPiA+ICPCoHhsIC12dnYg
ZGV2ZCAtRgo+IAo+ID4gVGhhdCBzaG91bGQgZ2l2ZSB5b3UgZGV0YWlsZWQgb3V0cHV0IG9mIHdo
YXQncyBnb2luZyBvbiBpbiB0aGUgZHJpdmVyCj4gPiBkb21haW4sIGNhbiB5b3UgcGFzdGUgdGhl
IG91dHB1dCB5b3UgZ2V0IGZyb20gdGhlIGRyaXZlciBkb21haW4gd2hlbgo+ID4geW91IHRyeSB0
byBzdGFydCB0aGUgZmFpbGVkIGd1ZXN0Pwo+IAo+IEkgcmFuIGJvdGggY29tbWFuZHMgaW4gdGhl
IGRyaXZlciBkb21haW4uIEJlZm9yZSBzdGFydGluZyB0aGUgZG9tVSwgSSBnZXQgdGhlIGZvbGxv
d2luZyB2ZXJib3NlLgo+IAo+ICMgc3VkbyB4bCAtdnZ2IGRldmQgLUYKPiBsaWJ4bDogZGVidWc6
IGxpYnhsX2RldmljZS5jOjE3MzM6bGlieGxfZGV2aWNlX2V2ZW50c19oYW5kbGVyOiBEb21haW4g
MDphbyAweDU1NmUzZTk0MGVmMDogY3JlYXRlOiBob3c9KG5pbCkgY2FsbGJhY2s9KG5pbCkgcG9s
bGVyPTB4NTU2ZTNlOTQwYzEwCj4gbGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjYzNjpsaWJ4
bF9fZXZfeHN3YXRjaF9yZWdpc3Rlcjogd2F0Y2ggdz0weDdmZmNhMzM1NDlkOCB3cGF0aD0vbG9j
YWwvZG9tYWluLzAvYmFja2VuZCB0b2tlbj0zLzA6IHJlZ2lzdGVyIHNsb3RudW09Mwo+IGxpYnhs
OiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTc5MDpsaWJ4bF9kZXZpY2VfZXZlbnRzX2hhbmRsZXI6
IERvbWFpbiAwOmFvIDB4NTU2ZTNlOTQwZWYwOiBpbnByb2dyZXNzOiBwb2xsZXI9MHg1NTZlM2U5
NDBjMTAsIGZsYWdzPWkKPiBsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6NTczOndhdGNoZmRf
Y2FsbGJhY2s6IHdhdGNoIHc9MHg3ZmZjYTMzNTQ5ZDggd3BhdGg9L2xvY2FsL2RvbWFpbi8wL2Jh
Y2tlbmQgdG9rZW49My8wOiBldmVudCBlcGF0aD0vbG9jYWwvZG9tYWluLzAvYmFja2VuZAo+IGxp
YnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzoyMjI3OmxpYnhsX19uZXN0ZWRfYW9fY3JlYXRlOiBh
byAweDU1NmUzZTk0MDYwMDogbmVzdGVkIGFvLCBwYXJlbnQgMHg1NTZlM2U5NDBlZjAKPiBsaWJ4
bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6MTgzODpsaWJ4bF9fYW9fX2Rlc3Ryb3k6IGFvIDB4NTU2
ZTNlOTQwNjAwOiBkZXN0cm95CgpBcmUgeW91IHN1cmUgdGhpcyBjb21tYW5kIGlzIHJ1biBvbiB0
aGUgZHJpdmVyIGRvbWFpbj8KClRoZSB0cmFjZSBhYm92ZSBzaG93cyAneGwgZGV2ZCcgdHJ5aW5n
IHRvIGdldCBhIHdhdGNoIG9uCi9sb2NhbC9kb21haW4vMC9iYWNrZW5kIHdoaWNoIGlzIHRoZSB4
ZW5zdG9yZSBiYWNrZW5kIHBhdGggb2YgZG9tMC4KCkJUVywgYXJlIHlvdSBjcmVhdGluZyB0aGUg
ZHJpdmVyIGRvbWFpbiB3aXRoICdkcml2ZXJfZG9tYWluPTEnIGluIHRoZQp4bCBjb25maWcgZmls
ZT8KCldoaWNoIHZlcnNpb24gb2YgdGhlIHRvb2xzIGFyZSB5b3UgdXNpbmcgaW4gdGhlIGRyaXZl
ciBkb21haW4/CgpJJ20gcXVpdGUgc3VyZSA0LjcgaXMgdG9vIG9sZCwgYW5kICd4bCBkZXZkJyB3
b24ndCB3b3JrIHByb3Blcmx5IGluCnRoYXQgdmVyc2lvbi4KCj4gCj4gSSBrbm93IHRoaXMgaXMg
bm90IGV4YWN0bHkgd2hhdCB5b3UgYXNrZWQgZm9yLiBVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IHNl
ZSBhbnkgb3RoZXIgdmVyYm9zZSB3aGVuIHRyeSB0byBzdGFydCBEb21VLiBUaGUgZXJyb3IgbWVz
c2FnZXMgSSBnZXQgZnJvbSB0aGUgZmFpbGVkIERvbVUgbGF1bmNoIGlzIGFzIHRoZSBmb2xsb3dp
bmcsIHdoZXJlIGRyaXZlciBkb21haW4gaWQgaXMgNy4KPiAKPiBsaWJ4bDogZXJyb3I6IGxpYnhs
X2RldmljZS5jOjEwNzU6ZGV2aWNlX2JhY2tlbmRfY2FsbGJhY2s6IERvbWFpbiA4OnVuYWJsZSB0
byBhZGQgZGV2aWNlIHdpdGggcGF0aCAvbG9jYWwvZG9tYWluLzcvYmFja2VuZC92aWYvOC8wCj4g
bGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxNDU4OmRvbWNyZWF0ZV9hdHRhY2hfZGV2aWNl
czogRG9tYWluIDg6dW5hYmxlIHRvIGFkZCBuaWMgZGV2aWNlcwo+IGxpYnhsOiBlcnJvcjogbGli
eGxfZGV2aWNlLmM6MTA3NTpkZXZpY2VfYmFja2VuZF9jYWxsYmFjazogRG9tYWluIDg6dW5hYmxl
IHRvIHJlbW92ZSBkZXZpY2Ugd2l0aCBwYXRoIC9sb2NhbC9kb21haW4vNy9iYWNrZW5kL3ZpZi84
LzAKPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwNzU6ZGV2aWNlc19kZXN0cm95X2Ni
OiBEb21haW4gODpsaWJ4bF9fZGV2aWNlc19kZXN0cm95IGZhaWxlZAo+IGxpYnhsOiBlcnJvcjog
bGlieGxfZG9tYWluLmM6MTAwMzpsaWJ4bF9fZGVzdHJveV9kb21pZDogRG9tYWluIDg6Tm9uLWV4
aXN0YW50IGRvbWFpbgo+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6OTYyOmRvbWFpbl9k
ZXN0cm95X2NhbGxiYWNrOiBEb21haW4gODpVbmFibGUgdG8gZGVzdHJveSBndWVzdAo+IGxpYnhs
OiBlcnJvcjogbGlieGxfZG9tYWluLmM6ODg5OmRvbWFpbl9kZXN0cm95X2NiOiBEb21haW4gODpE
ZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkCgpJJ20gYWZyYWlkIHRoaXMgbG9nIGlzIG5vdCB2
ZXJ5IGhlbHBmdWwsIHdvdWxkIGJlIGJldHRlciBpZiB5b3UgY291bGQKcGFzdGUgdGhlIGZ1bGwg
bG9ncywgYXMgdGhlcmUgbWlnaHQgYmUgaGludHMgb2Ygd2hhdCdzIGdvaW5nIG9uIGluCm90aGVy
IHBhcnRzIG9mIHRoZSBmaWxlLgoKPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgSSBydW4gZGV2
ZCBpbiBEb20wLCBJIGdldCBhIGxvdCBvZiB2ZXJib3NlIHdoZW4gSSB0cnkgdG8gbGF1bmNoIERv
bVUsIGRlcGVuZGVudCBvbiBEcml2ZXIgRG9tYWluIGZvciBuZXR3b3JraW5nLiBJIGFtIG5vdCBz
dXJlIGlmIEkgc2hvdWxkIHBhc3RlIGl0IGhlcmUuIFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHlv
dSB0aGluay4KCk5vLCAneGwgZGV2ZCcgaW4gZG9tMCBpcyBub3QgdXNlZnVsLCBhcyBpdCB3aWxs
IGludGVyYWN0IGJhZGx5IHdpdGgKdGhlIHRvb2xzdGFjayBhbHNvIHJ1bm5pbmcgZnJvbSBkb20w
LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
