Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E6100AD7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:52:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWl92-0001Rw-GM; Mon, 18 Nov 2019 17:49:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWl90-0001Rq-VO
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:48:58 +0000
X-Inumbo-ID: b2283c73-0a2b-11ea-a2dd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2283c73-0a2b-11ea-a2dd-12813bfff9fa;
 Mon, 18 Nov 2019 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574099338;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=PFquTjxrY9ozS/IegSdzRKRJCiOKgHO7QKevEJCBaJ0=;
 b=ds6M6E/98vLLK5A0YzKsbhTUVMUaYQgNsEaUjWGOTkh7OZ4CMAMfGhEE
 bghTxwQv2YoNgttUCQGSqLScAhsK1CF3GOuGNj9SME1TX/tGJsZTuScfu
 kq7AsyeKuPc1XiW+mPWySPAGxuj08QWIGdSduX+ou5WGZ5CKQlPTap3tb k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9yjkj0LGX9fB6zGWjoBcgkSsZjyKCng5Ll3OYjDEJvnND1HXTYHxuz9wHSRtorhuqyvb7wvsa/
 ourYDXlclgqEPLRBiOD8bqEGKsFVPy147fSdmNuJQwLOTxEFhnlYXtxL5qxc0aI8hDeSyJqgqU
 AkRzyHO0MaqSLTncRkZ7cn6BXfirdyfATXVCI6kyQf7QPYE8jQptfhfKHxVgin70dEEYWBruLS
 1PfZoVwOPca8yJ3+Or+OX7q/gaLAjnGK/NfJu8hfxZEAtHhFKAzXYMF99V8gJURJSWwXZtUBIh
 4bM=
X-SBRS: 2.7
X-MesageID: 8834901
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="8834901"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.55686.770468.99167@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 17:48:54 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <CACvf2oVaR+N9Zgoty3DK6oKqeRcR0gpRnitnvbOUmxFJydD3FQ@mail.gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
 <23968.46591.386956.861918@mariner.uk.xensource.com>
 <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
 <CACvf2oXGzmZquomG5xH=DsCuybFR7b=k8HoOA-tU2ZytoJJfPg@mail.gmail.com>
 <CACvf2oUpk=bP4QB8c9QTPcomuOpYm88+G6Bm_DyFf2h_4_MFGA@mail.gmail.com>
 <24014.65525.944108.509444@mariner.uk.xensource.com>
 <CACvf2oVaR+N9Zgoty3DK6oKqeRcR0gpRnitnvbOUmxFJydD3FQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
Cc: Juergen Gross <jgross@suse.com>, "wl@xen.org" <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiUmU6IFtQQVRDSCB2MSAxLzJdIGxpYnhsOiBpbnRy
b2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQiKToKPiBPbiBGcmksIE5vdiAxNSwgMjAxOSBh
dCA5OjQzIFBNIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+
IFNvcnJ5IGZvciB0aGUgZGVsYXkgcmVwbHlpbmcuICBJbiB5b3VyIGVhcmxpZXIgbWFpbHMgSSBo
YWQgdHJvdWJsZQo+ID4gZmlndXJpbmcgb3V0IHdoYXQgeW91IG1lYW50IGJ1dCB0aGlzIGxpdHRs
ZSB2aWduZXR0ZSBtYWtlcyBpdCBjbGVhciB0bwo+ID4gbWUuCj4gPgo+ID4gSSB0aGluayB0aGUg
cHJvYmxlbSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZSBpcyB0aGlzOiBpbiB5b3VyIGNhc2UKPiA+
IFFFTVVfQkFDS0VORCBuZWVkcyB0byBkZXBlbmQgb24gdGhlIHZpc2libGUgdmtiX2JhY2tlbmQg
ZmllbGQsIGJ1dCB0aGUKPiA+IGRldmljZS0+YmFja2VuZF9raW5kIGlzIHNldCB1bmNvbmRpdGlv
bmFsbHkgdG8ganVzdCBWS0IgPwo+IAo+IEV4YWN0bHkuCgpUaGFua3MuCgo+ID4gQ291bGQgeW91
IHNvbHZlIHRoaXMgcHJvYmxlbSBieSBpbnZlbnRpbmcgYSBuZXcgYmFja2VuZF9raW5kLCBhbmQK
PiA+IHdyaXRpbmcgeW91ciBvd24gZnVuY3Rpb24gbGlieGxfX2RldmljZV9mcm9tX3ZrYiwgYW5k
IHB1dHRpbmcKPiA+ICpkaWZmZXJlbnQqIHZhbHVlcyBpbnRvIGJhY2tlbmRfa2luZCA/ICBJIHRo
aW5rIHRoYXQgaXMgd2hhdAo+ID4gYmFja2VuZF9raW5kIGlzIGZvci4gIFNlZSBmb3IgZXhhbXBs
ZSB2YXJpb3VzIGNvbnNvbGUgZnVuY3Rpb25zIGFuZAo+ID4gYWxzbyBsaWJ4bF9fZGV2aWNlX2Zy
b21fZGlzay4KPiAKPiBUaGlzIHdoYXQgd2FzIGRvbmUgaW4gdGhpcyBwYXRjaC4gVklOUFVUIGJh
Y2tlbmQgdHlwZSB3YXMgaW50cm9kdWNlZC4KCldlIGhhdmUgY29tZSBmdWxsIGNpcmNsZS4gIEJ1
dCBvbiB0aGUgd2F5IHlvdSBoYXZlIG1hbmFnZWQgdG8gZ2V0IGludG8KbXkgdGhpY2sgaGVhZCB3
aGF0IGlzIGdvaW5nIG9uIGhlcmUuICBXZWxsIGRvbmUgYW5kIHRoYW5rIHlvdS4KCkkgd2lsbCBn
byBiYWNrIGFuZCBkbyBhIG1vcmUgY29kZSByZXZpZXcgb2YgdGhlIG9yaWdpbmFsIHBhdGNoLgoK
PiBQcm9iYWJseSB0aGUgbmFtZSBzaG91bGQgYmUgY2hhbmdlZCBidXQgaGF2ZSBubyBpZGVhIHdo
aWNoIGJhY2tlbmQKPiBraW5kIGlzIG1vcmUgc3VpdGFibGUgZm9yIHRoaXMgcHVycG9zZS4KCkkg
YW0gaGFwcHkgdGhpcyB0aGlzIG5hbWUuICBJdCBpcyBub3QgaW4gdGhlIHB1YmxpYyBBUEkgc28g
aWYgaXQgdHVybnMKb3V0IHRvIGJlIHdyb25nIHdlIGNhbiBjaGFuZ2UgaXQuCgo+ID4gQUZBSUNU
IGZyb20gdGhlIGNvZGUgaXQganVzdCB1c2VzIHdoYXQgd291bGQgdGhlIGB1c3VhbCcgeGVuc3Rv
cmUgcHYKPiA+IGNvbnRyb2wgcGxhbmUgcGF0aCBmb3IgYSBkZXZpY2UgY2FsbGVkICJ2a2IiID8K
PiAKPiBJIGd1ZXNzIHllcy4KPiAKPiA+IFNvIG1heWJlIHdlIGNvdWxkIGNhbGwgaXQgInB2IiA/
Cj4gCj4gRG8geW91IG1lYW4gTElCWExfVktCX0JBQ0tFTkRfUFY/CgpJIHRoaW5rIHNvLiAgV2hh
dCBkbyB5b3UgdGhpbmsgPyAgSSBhbSBqdXN0IHRyeWluZyB0byBnZXQgcmlkIG9mIHRoZQpzdHJp
bmcgYGxpbnV4JyB3aGVuIGl0J3Mgbm90IExpbnV4IHNwZWNpZmljLiAgSSBxdWlja2x5IHNjYW5u
ZWQKa2JkaWYuaCBhbmQgaXQgbG9va3MgdmVyeSBsaWtlIGEgWGVuIFBWIHByb3RvY29sIDotKS4g
IFNvICJwdiIgd291bGQKc291bmQgZ29vZCB0byBtZSBhbmQgYmV0dGVyIHRoYW4gIkxpbnV4Iiwg
dW5sZXNzIHNvbWVvbmUgZWxzZSBoYXMgYW4Kb3Bpbmlvbi4KCkNDaW5nIHZhcmlvdXMgbWFpbnRh
aW5lcnMgd2hvIG1pZ2h0IGhhdmUgYW4gb3Bpbmlvbi4KCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
