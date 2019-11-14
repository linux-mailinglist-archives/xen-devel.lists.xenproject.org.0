Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A1FC91C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 15:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVGKF-0000ws-Ez; Thu, 14 Nov 2019 14:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwvT=ZG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVGKD-0000wi-MV
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 14:42:21 +0000
X-Inumbo-ID: f63e35e8-06ec-11ea-a24f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f63e35e8-06ec-11ea-a24f-12813bfff9fa;
 Thu, 14 Nov 2019 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573742540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfFNfTPrMHKv7W43xpW5lYrVE9GRdnWlofEqaG0LsOc=;
 b=eD2fSkNuiyULp18ls42/TKXaFxS0m4LMgXOTHKjk6pDhWQ5IqsWAxCfx
 AkdwwjTvHqbgtvWhL7TKiWrzoRTHNKTHZPkFcbXY6fcRiTxEpJa1FgWgx
 2yXoXrsbtnA0zC87XpujK1mws5Guh7YSPtc/FqrWOETyV0tFgPjEsG5mW A=;
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
IronPort-SDR: Ac1axPCCDuvuEvzTYH30q9TktAvAlyDlhb8CfkX7xUab2GgCxtRM+aJPpdSgeKu66Fukg83qwk
 cdDfrWKJYT+AkywufxnYsf3vQEMf5MaI7zL+UA1KgmW62793wBTt+R9s3wUmP//MSikZIexT64
 3UxPhWX5gmaczHzHmF8VdV+gcoPkKvIcrjwUTzGsZn6Y1SNrpL/1318mIu5m+5KCILXC9iHcTk
 OhsOJ6zpOYEstN8WsNJBOTT5zgq17/UM42Lx5HCVSlZTIPKp1XsiKppAb8fWPMYisfD0qUf6zD
 k3E=
X-SBRS: 2.7
X-MesageID: 8739477
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8739477"
Date: Thu, 14 Nov 2019 15:42:13 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191114144213.GE72134@Air-de-Roger>
References: <20191113155940.81837-1-roger.pau@citrix.com>
 <20191113155940.81837-3-roger.pau@citrix.com>
 <6af26dbb-42c8-d938-ea6a-4ae0efcc4c87@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6af26dbb-42c8-d938-ea6a-4ae0efcc4c87@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 2/3] x86/passthrough: fix
 migration of MSI when using posted interrupts
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
 Joe Jin <joe.jin@oracle.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDI6MzU6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMTEuMjAxOSAxNjo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gKyAg
ICBmb3IgKCBpZCA9IGZpbmRfZmlyc3RfYml0KHZjcHVzLCBkLT5tYXhfdmNwdXMpOwo+ID4gKyAg
ICAgICAgICBpZCA8IGQtPm1heF92Y3B1czsKPiA+ICsgICAgICAgICAgaWQgPSBmaW5kX25leHRf
Yml0KHZjcHVzLCBkLT5tYXhfdmNwdXMsIGlkICsgMSkgKQo+ID4gKyAgICB7Cj4gPiArICAgICAg
ICBpZiAoIGQtPnZjcHVbaWRdICE9IGN1cnJlbnQgKQo+ID4gKyAgICAgICAgICAgIHZjcHVfcGF1
c2UoZC0+dmNwdVtpZF0pOwo+IAo+IElzbid0IHRoaXMgc2V0dGluZyB1cyB1cCBmb3IgYSBkZWFk
bG9jayBpZiB0d28gcGFydGllcyBjb21lIGhlcmUKPiBmb3IgdGhlIHNhbWUgZG9tYWluLCBhbmQg
Ym90aCBvbiBhIHZDUFUgYmVsb25naW5nIHRvIHRoYXQgZG9tYWluCj4gKGFuZCB3aXRoIHRoZSBv
cHBvc2l0ZSBvbmUncyBiaXQgc2V0IGluIHRoZSBiaXRtYXApPyBCdXQgaXQgbG9va3MKPiBsaWtl
IGQgd291bGQgbmV2ZXIgYmUgdGhlIGN1cnJlbnQgZG9tYWluIGhlcmUgLSB5b3Ugd2lsbCB3YW50
IHRvCj4gYXNzZXJ0IGFuZCBjb21tZW50IG9uIHRoaXMsIHRob3VnaC4gQXQgdGhhdCBwb2ludCB0
aGUgY29tcGFyaXNvbnMKPiBhZ2FpbnN0IGN1cnJlbnQgY2FuIHRoZW4gZ28gYXdheSBhcyB3ZWxs
IGFmYWljdC4KClRoZSBhYm92ZSBpcyB0cnVlIGZvciBzeW5jcyB0cmlnZ2VyZWQgYnkgTVNJIGNo
YW5nZXMgdGhhdCBib3VuY2UgdG8KUUVNVSBhbmQgdGhlbiBnZXQgZm9yd2FyZGVkIHRvIFhlbiBh
cyBET01DVExzLCBidXQgQUZBSUNUIHN5bmNzIHRoYXQKcmVzdWx0IGZyb20gYSB2SU8tQVBJQyBl
bnRyeSB3cml0ZSAocGF0Y2ggIzMpIHdpbGwgaGF2ZSB2ID09CmN1cnJlbnQuCgp2SU8tQVBJQyB3
cml0ZXMgaG93ZXZlciB1c2UgdGhlIGQtPmFyY2guaHZtLmlycV9sb2NrLCBzbyBpdCdzIG5vdApw
b3NzaWJsZSB0byBwcm9jZXNzIG11bHRpcGxlIHZDUFVzIHZJTy1BUElDIGFjY2Vzc2VzIGF0IHRo
ZSBzYW1lIHRpbWUuCkknbSBhZnJhaWQgSSBkb24ndCBrbm93IGhvdyB3aGljaCBraW5kIG9mIGFz
c2VydCBzaG91bGQgYmUgYWRkZWQKaGVyZS4gSSBjb3VsZCBhZGQgYSBjb21tZW50LCBidXQgc2Vl
bXMgZnJhZ2lsZS4KCj4gCj4gPiBAQCAtMzQ1LDYgKzI4OSw4IEBAIGludCBwdF9pcnFfY3JlYXRl
X2JpbmQoCj4gPiAgICAgICAgICBjb25zdCBzdHJ1Y3QgdmNwdSAqdmNwdTsKPiA+ICAgICAgICAg
IHVpbnQzMl90IGdmbGFncyA9IHB0X2lycV9iaW5kLT51Lm1zaS5nZmxhZ3MgJgo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgflhFTl9ET01DVExfVk1TSV9YODZfVU5NQVNLRUQ7Cj4gPiAr
ICAgICAgICBERUNMQVJFX0JJVE1BUChkZXN0X3ZjcHVzLCBNQVhfVklSVF9DUFVTKSA9IHsgfTsK
PiA+ICsgICAgICAgIERFQ0xBUkVfQklUTUFQKHByZXZfdmNwdXMsIE1BWF9WSVJUX0NQVVMpID0g
eyB9Owo+IAo+IFRoaXMgaXMgcmVhY2hhYmxlIGZvciBIVk0gZG9tYWlucyBvbmx5LCBpc24ndCBp
dD8gSW4gd2hpY2ggY2FzZQo+IHdoeSB0aGUgbXVjaCBsYXJnZXIgTUFYX1ZJUlRfQ1BVUyAoY3Jl
YXRpbmcgdHdvIHVucmVhc29uYWJseSBiaWcKPiBsb2NhbCB2YXJpYWJsZXMpIGluc3RlYWQgb2Yg
SFZNX01BWF9WQ1BVUz8gSG93ZXZlciwgZXZlbiBvbmNlCj4gc3dpdGNoZWQgSSdkIGJlIG9wcG9z
ZWQgdG8gdGhpcyAtIFRoZXJlJ2QgYmUgYSBmYWlyIGNoYW5jZSB0aGF0Cj4gdGhlIG5lZWQgdG8g
ZGVhbCB3aXRoIHRoZXNlIHZhcmlhYmxlcyBtaWdodCBnbyB1bm5vdGljZWQgb25jZQo+IHRoZSBt
YXhpbXVtIHZDUFUgY291bnQgZm9yIEhWTSBnZXRzIGluY3JlYXNlZCAod2hpY2ggaGFzIGJlZW4g
YQo+IHBlbmRpbmcgdG9kbyBpdGVtIGZvciBtYW55IHllYXJzIG5vdykuCgpTZWUgYmVsb3csIGFm
dGVyIHlvdXIgcmFudCBhYm91dCBob3cgdG8gZml4IGl0LgoKPiA+IEBAIC00MjAsMjAgKzM4NCwx
NiBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+ID4gICAgICAgICAgZGVsaXZlcnlfbW9kZSA9
IE1BU0tfRVhUUihwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX1ZNU0lfWDg2X0RFTElWX01BU0spOwo+ID4gIAo+
ID4gLSAgICAgICAgZGVzdF92Y3B1X2lkID0gaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoZCwgZGVz
dCwgZGVzdF9tb2RlKTsKPiA+ICsgICAgICAgIGh2bV9pbnRyX2dldF9kZXN0cyhkLCBkZXN0LCBk
ZXN0X21vZGUsIGRlbGl2ZXJ5X21vZGUsIGRlc3RfdmNwdXMpOwo+ID4gKyAgICAgICAgZGVzdF92
Y3B1X2lkID0gYml0bWFwX3dlaWdodChkZXN0X3ZjcHVzLCBkLT5tYXhfdmNwdXMpICE9IDEgPwo+
ID4gKyAgICAgICAgICAgIC0xIDogZmluZF9maXJzdF9iaXQoZGVzdF92Y3B1cywgZC0+bWF4X3Zj
cHVzKTsKPiA+ICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQgPSBkZXN0X3Zj
cHVfaWQ7Cj4gPiAgICAgICAgICBzcGluX3VubG9jaygmZC0+ZXZlbnRfbG9jayk7Cj4gPiAgCj4g
PiAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kucG9zdGVkID0gZmFsc2U7Cj4gPiAgICAgICAgICB2
Y3B1ID0gKGRlc3RfdmNwdV9pZCA+PSAwKSA/IGQtPnZjcHVbZGVzdF92Y3B1X2lkXSA6IE5VTEw7
Cj4gPiAtICAgICAgICBpZiAoIGlvbW11X2ludHBvc3QgKQo+ID4gLSAgICAgICAgewo+ID4gLSAg
ICAgICAgICAgIGlmICggZGVsaXZlcnlfbW9kZSA9PSBkZXN0X0xvd2VzdFByaW8gKQo+ID4gLSAg
ICAgICAgICAgICAgICB2Y3B1ID0gdmVjdG9yX2hhc2hpbmdfZGVzdChkLCBkZXN0LCBkZXN0X21v
ZGUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpcnFf
ZHBjaS0+Z21zaS5ndmVjKTsKPiA+IC0gICAgICAgICAgICBpZiAoIHZjcHUgKQo+ID4gLSAgICAg
ICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kucG9zdGVkID0gdHJ1ZTsKPiA+IC0gICAgICAgIH0K
PiA+ICsgICAgICAgIGlmICggdmNwdSAmJiBpb21tdV9pbnRwb3N0ICkKPiA+ICsgICAgICAgICAg
ICBwaXJxX2RwY2ktPmdtc2kucG9zdGVkID0gdHJ1ZTsKPiAKPiBPbmUgYXNwZWN0IHRoYXQgSSdt
IGN1cmlvdXMgYWJvdXQ6IEhvdyBtdWNoIHBvc3Rpbmcgb3Bwb3J0dW5pdHkgZG8KPiB3ZSBsb3Nl
IGluIHByYWN0aWNlIGJ5IG5vIGxvbmdlciBwb3N0aW5nIHdoZW4gdGhlIGd1ZXN0IHVzZXMgbG93
ZXN0Cj4gcHJpb3JpdHkgbW9kZSB3aXRoIG11bHRpcGxlIGRlc3RpbmF0aW9ucz8KCkxpbnV4IHNl
ZW1zIHRvIHVzZSBkZXN0X0ZpeGVkIGV4Y2x1c2l2ZWx5LCBhbmQgdGhlIHNhbWUgZ29lcyB0bwpG
cmVlQlNELgoKPiA+IEBAIC00NDIsNiArNDAyLDkgQEAgaW50IHB0X2lycV9jcmVhdGVfYmluZCgK
PiA+ICAgICAgICAgICAgICBwaV91cGRhdGVfaXJ0ZSh2Y3B1ID8gJnZjcHUtPmFyY2guaHZtLnZt
eC5waV9kZXNjIDogTlVMTCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLCBw
aXJxX2RwY2ktPmdtc2kuZ3ZlYyk7Cj4gPiAgCj4gPiArICAgICAgICBpZiAoIGh2bV9mdW5jcy5k
ZWxpdmVyX3Bvc3RlZF9pbnRyICkKPiA+ICsgICAgICAgICAgICBkb21haW5fc3luY192bGFwaWNf
cGlyKGQsIHByZXZfdmNwdXMpOwo+IAo+IEFjY2Vzc2luZyBodm1fZnVuY3MgaGVyZSBsb29rcyBs
aWtlIGEgbGF5ZXJpbmcgdmlvbGF0aW9uLiBUaGlzCj4gd2FudHMgZWl0aGVyIG1vdmluZyBpbnRv
IHRoZSBmdW5jdGlvbiBvciAoc2VlaW5nIHRoZSBvdGhlciB1c2UpCj4gYWJzdHJhY3RpbmcgYXdh
eS4gU2VlaW5nIHRoZSBjb25kaXRpb25hbCBoZXJlIChhbmQgYmVsb3cpIEkgYWxzbwo+IG5vdGlj
ZSB0aGF0IHlvdSBjYWxjdWxhdGUgcHJldl92Y3B1cyBpbiB2ZWluIHdoZW4gdGhlcmUncyBubwo+
IGludGVycnVwdCBwb3N0aW5nIGluIHVzZS4KCkkgY291bGQgaW5kZWVkIG9ubHkgZmlsbCBwcmV2
X3ZjcHVzIHdoZW4gcG9zdGluZyBpcyBpbiB1c2UuCgo+IEkgZ3Vlc3MgdG9nZXRoZXIgd2l0aCB0
aGUgdmFyaWFibGUgc2l6ZSBpc3N1ZSBtZW50aW9uZWQgYWJvdmUgYQo+IHBvc3NpYmxlIHNvbHV0
aW9uIHdvdWxkIGJlOgo+IC0gaGF2ZSBvbmUgYml0bWFwIGhhbmdpbmcgb2ZmIG9mIHBpcnFfZHBj
aS0+Z21zaSwKPiAtIGhhdmUgb25lIGJpdG1hcCBwZXIgcENQVSwKPiAtIHBvcHVsYXRlIHRoZSBu
ZXcgZGVzdGluYXRpb24gYml0cyBpbnRvIHRoZSBwZXItcENQVSBvbmUsCj4gLSBpc3N1ZSB0aGUg
UElSLT5JUlIgc3luYywKPiAtIGV4Y2hhbmdlIHRoZSBwZXItcENQVSBhbmQgcGVyLURQQ0kgcG9p
bnRlcnMuCj4gWW91IGNvdWxkIHRoZW4gbGVhdmUgdGhlIHBvaW50ZXJzIGF0IE5VTEwgd2hlbiBu
byBwb3N0aW5nIGlzIHRvCj4gYmUgdXNlZCwgYWRkcmVzc2luZyB0aGUgYXBwYXJlbnQgbGF5ZXJp
bmcgdmlvbGF0aW9uIGhlcmUgYXQgdGhlCj4gc2FtZSB0aW1lLgoKUmlnaHQsIHRoZSBhYm92ZSBv
cHRpb24gYXZvaWRzIGhhdmluZyB0byBjYWxjdWxhdGUgdGhlIHBvc3NpYmxlCmRlc3RpbmF0aW9u
cyB0d2ljZSAob25jZSBvbiBzZXR1cCBhbmQgb25jZSBvbiB0ZWFyZG93biksIGhvd2V2ZXIgaXQK
ZXhwYW5kcyB0aGUgc2l6ZSBvZiBnbXNpLgoKV2hpbGUgaGVyZSwgSSd2ZSBhbHNvIHJlYWxpemVk
IHRoYXQgaW50ZXJydXB0cyBpbmplY3RlZCB1c2luZwpYRU5fRE1PUF9pbmplY3RfbXNpIHdpbGwg
YWxzbyBiZSBwb3N0ZWQsIGFuZCBJJ20gYWZyYWlkIHRoZXJlJ3Mgbm8gd2F5CnRvIHRyYWNrIGFu
ZCBmbHVzaCB0aG9zZSB1bmxlc3Mgd2UgcHJvdmlkZSBhIHBvc3RlZC1mbHVzaCBoeXBlcmNhbGwg
b3IKc29tZSBzdWNoLCBzbyB0aGF0IGVtdWxhdG9ycyBjYW4gcmVxdWVzdCBhIFBJUiBmbHVzaCB3
aGVuIGludGVycnVwdHMKb2YgZnVsbHkgZW11bGF0ZWQgZGV2aWNlcyBhcmUgcmVjb25maWd1cmVk
LgoKT1RPSCwgbWF5YmUgWEVOX0RNT1BfaW5qZWN0X21zaSBzaG91bGQgcGF1c2UgdGhlIHZDUFUs
IHNldCB0aGUgYml0IGluCklSUiBhbmQgdW5wYXVzZT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
