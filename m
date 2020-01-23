Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D803147095
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 19:17:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuh0a-0000rq-JY; Thu, 23 Jan 2020 18:15:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v8qs=3M=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iuh0Y-0000rl-Lo
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:15:10 +0000
X-Inumbo-ID: 4a1006a0-3e0c-11ea-bea8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a1006a0-3e0c-11ea-bea8-12813bfff9fa;
 Thu, 23 Jan 2020 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579803310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3JJnb2eYUTxX7bx4PT8tcBS5QJ5UnyW4yAsaWCQTkEY=;
 b=U2OndjxWcLktOEw9PIdy+2fjplqQYvNYlhgctfEwgXYmj08XjxCy8Ykc
 CfsKCgM5T/e6UkjXZRN1+DtqGT6MgtMQB6UOiWTPCiZZ8Pq54l9MX3vdF
 DfQy+MDaXXWBiNoWGOz2uMTxPK6m2KRYmzo8/6WsovwcI5/nxTbYPuDsl w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fRzsT+fRMdYOFY2YowmgbuX+QlReF1TH3zH7ON3ovQlFRIRrVhSRZPMcHYwhGbTHuUbh37PgNd
 TIYhNVrQM1Yl+SGobHrL6jcXbVylRHVNZyiT7qOPNBow6Mu0iJX/lOjJ0LJvB0BG7QmPe0vQep
 eYRJdzQ6Owvp6I5eJwBmpFpy0je0cHvoLCJN3kJBF7/kDDGyr7ogcbBDvko/hbuQRCYT+1dQ7n
 y2CK5LTc//8gEGq1DYgYh3NOnABSrKwORf/LIm8p6lcvAJLthg/RjsZtLZ0bkLw7NiiU+pfjXL
 2Ko=
X-SBRS: 2.7
X-MesageID: 11521064
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11521064"
Date: Thu, 23 Jan 2020 18:15:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200123181506.GK1288@perard.uk.xensource.com>
References: <E1it15N-0001Ge-Go@osstest.test-lab.xenproject.org>
 <20200121102109.GG11756@Air-de-Roger>
 <20200123153425.GJ1288@perard.uk.xensource.com>
 <20200123171706.GE57924@desktop-tdan49n.eng.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123171706.GE57924@desktop-tdan49n.eng.citrite.net>
Subject: Re: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDY6MTc6MDZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAyMCBhdCAwMzozNDoyNVBNICswMDAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDEwOjIxOjA5QU0g
KzAwMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IFRoZSBpc3N1ZSBpcyB0aGF0IHRo
aXMgY2hhbmdlIGlzIHBhc3NpbmcgdGhlIGd1ZXN0IGRvbWFpbl9jcmVhdGVfc3RhdGUKPiA+ID4g
dG8gbGlieGxfX2RvbWFpbl9idWlsZCBpbiBsaWJ4bF9fc3Bhd25fc3R1Yl9kbSwgYW5kIGhlbmNl
IHRoZQo+ID4gPiBzdHViZG9tYWluIGRvZXNuJ3QgZ2V0IGNyZWF0ZWQuIEkgaGF2ZSB0aGUgZm9s
bG93aW5nIHBhdGNoIHRoYXQgZml4ZXMKPiA+ID4gaXQsIGJ1dCBpdCdzIGtpbmQgb2YgZGlydHku
Cj4gPiA+IAo+ID4gPiAtLS04PC0tLQo+ID4gPiBGcm9tIDY4OGZkZTk1OTkyZDA3YmIxMTIzZDMy
NGE2ODAwNmRkMDhiYzY1MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+IEZyb206IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IERhdGU6IFR1ZSwgMjEg
SmFuIDIwMjAgMTA6MTQ6MDkgKzAwMDAKPiA+ID4gU3ViamVjdDogW1BBVENIXSBsaWJ4bDogZml4
IHN0dWJkb21haW4gY3JlYXRpb24gYWZ0ZXIgYWFjYzE0MzAwNjQyOWRlCj4gPiA+IE1JTUUtVmVy
c2lvbjogMS4wCj4gPiA+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+
ID4gCj4gPiA6LSgsIHRoaXMgaXMgYSBsaWUuIFRoZSBlbWFpbCBJJ3ZlIHJlY2VpdmVkIGhhcyBh
IGRpZmZlcmVudCBjaGFyc2V0Lgo+IAo+IFJlYWxseT8gVGhlIGVtYWlsIGhlYWRlcnMgYWxzbyBj
b250YWluIHRoZSBzYW1lIHRhZywgYW5kIGhlbmNlIGFsbCBteQo+IGVtYWlscyB3b3VsZCBoYXZl
IGEgd3JvbmcgZW5jb2RpbmcgdGhlbi4KCkZvciBlbWFpbHMgc2VudCBieSB5b3VyIE1VQSwgSSBo
YXZlOgpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9Imlzby04ODU5LTEiClRoZXJl
J3Mgbm90aGluZyB3cm9uZyB3aXRoIHRoYXQsIG15IE1VQSB1c2VzIHRoZSBzYW1lIGNoYXJzZXQu
IElmLCBpbiB0aGUKcGF0Y2ggdGhhdCBJIHRyeSB0byBhcHBseSwgSSByZXBsYWNlIHRoZSBjb250
ZW50LXR5cGUgbGluZSBvZiB0aGUgcGF0Y2gKYnkgdGhlIG9uZSBmcm9tIHRoZSBlbWFpbCBoZWFk
ZXIsIGdpdCBhcHBsaWVkIHRoZSBwYXRjaCBqdXN0IGZpbmUgYW5kCmRvbid0IGNvbXBsYWluLgoK
U28sIHRoZSBlbWFpbCBlbmNvZGluZyBpcyBmaW5lLgoKSXQgaXMganVzdCB0aGUgY29weSBvZiBh
biBlbWFpbCBpbnRvIGFub3RoZXIgZW1haWwncyBib2R5IHRoYXQgd2FzIGFuCmlzc3VlLgoKPiAK
PiA+IGdpdAo+ID4gY29tcGxhaW5lZCBhYm91dCBpdC4gTWF5YmUgbmV4dCB0aW1lIHRoZSBwYXRj
aCBjb3VsZCBiZSBhdHRhY2hlZCwgb3IgaXQKPiA+IGNvdWxkIGJlIGEgcHJvcGVyIHBhdGNoIHdp
dGggc29tZSBub3RlIChhZnRlciAtLS0pIChnaXQgc2VuZC1lbWFpbCBjYW4KPiA+IGRvIC0taW4t
cmVwbHktdG8pLCBvciBpdCBjb3VsZCBiZSB0d28gc2VwYXJhdGVkIGVtYWlscyB3aXRoIHRoZSBm
aXJzdAo+ID4gb25lIHJlcGx5aW5nIHRvIHRoZSByZXBvcnQgYW5kIHRoZSBzZWNvbmQgdGhlIHBh
dGNoIChhbGwgaW4gdGhlIHNhbWUKPiA+IHRocmVhZCkuCj4gCj4gSSBjYW4gY2VydGFpbmx5IHNl
bmQgdGhlIHBhdGNoIHNlcGFyYXRlbHkgYXMgYSByZXBseSBhcyB5b3Ugc2F5IGFib3ZlLAo+IGJ1
dCBJIHdvdWxkIHN0aWxsIG5lZWQgdG8gZml4IG15IGVtYWlsIGNsaWVudCB0byBzZXQgdGhlIHBy
b3Blcgo+IGVuY29kaW5nIHRoZW4uCgpUaGUgZW1haWwgSSByZWNlaXZlZCB3YXMganVzdCBmaW5l
LCBlbmNvZGVkIHByb3Blcmx5IChJIHRoaW5rKS4gSXQgaXMKanVzdCB0cnlpbmcgdG8gYXBwbHkg
dGhlIHBhdGNoIGVtYmVkZGVkIGludG8gdGhlIGJvZHkgb2YgdGhlIGVtYWlsIHRoYXQKd2FzIGFu
bm95aW5nLgoKPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCj4gPiA+IGluZGV4IDNmMDhjY2FkMWIuLmIxZGRkZTc3ZTggMTAw
NjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiA+ID4gKysrIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYwo+ID4gPiBAQCAtMjExMCwxNyArMjExMCwyMSBAQCB2b2lkIGxpYnhs
X19zcGF3bl9zdHViX2RtKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2RvbWFpbl9jcmVhdGVfc3Rh
dGUgKmRjcykKPiA+ID4gICAgICB4c190cmFuc2FjdGlvbl90IHQ7Cj4gPiA+ICAKPiA+ID4gICAg
ICAvKiBjb252ZW5pZW5jZSBhbGlhc2VzICovCj4gPiA+IC0gICAgbGlieGxfZG9tYWluX2NvbmZp
ZyAqY29uc3QgZG1fY29uZmlnID0gJnNkc3MtPmRtX2NvbmZpZzsKPiA+ID4gICAgICBsaWJ4bF9k
b21haW5fY29uZmlnICpjb25zdCBndWVzdF9jb25maWcgPSBzZHNzLT5kbS5ndWVzdF9jb25maWc7
Cj4gPiA+ICAgICAgY29uc3QgaW50IGd1ZXN0X2RvbWlkID0gc2Rzcy0+ZG0uZ3Vlc3RfZG9taWQ7
Cj4gPiA+ICAgICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZSAqY29uc3QgZF9zdGF0ZSA9IHNk
c3MtPmRtLmJ1aWxkX3N0YXRlOwo+ID4gPiAtICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUg
KmNvbnN0IHN0dWJkb21fc3RhdGUgPSAmc2Rzcy0+ZG1fc3RhdGU7Cj4gPiA+ICsgICAgbGlieGxf
X2RvbWFpbl9idWlsZF9zdGF0ZSAqc3R1YmRvbV9zdGF0ZTsKPiA+ID4gKyAgICBsaWJ4bF9kb21h
aW5fY29uZmlnICpkbV9jb25maWc7Cj4gPiA+ICAKPiA+ID4gICAgICAvKiBJbml0aWFsaXNlIHBy
aXZhdGUgcGFydCBvZiBzZHNzICovCj4gPiA+IC0gICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0
ZV9pbml0KHN0dWJkb21fc3RhdGUpOwo+ID4gPiAgICAgIGRtc3NfaW5pdCgmc2Rzcy0+ZG0pOwo+
ID4gPiAgICAgIGRtc3NfaW5pdCgmc2Rzcy0+cHZxZW11KTsKPiA+ID4gICAgICBsaWJ4bF9feHN3
YWl0X2luaXQoJnNkc3MtPnhzd2FpdCk7Cj4gPiA+ICsgICAgR0NORVcoc2Rzcy0+ZGNzKTsKPiA+
ID4gKyAgICBzdHViZG9tX3N0YXRlID0gJnNkc3MtPmRjcy0+YnVpbGRfc3RhdGU7Cj4gPiA+ICsg
ICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9pbml0KHN0dWJkb21fc3RhdGUpOwo+ID4gPiAr
ICAgIEdDTkVXKHNkc3MtPmRjcy0+Z3Vlc3RfY29uZmlnKTsKPiA+ID4gKyAgICBkbV9jb25maWcg
PSBzZHNzLT5kY3MtPmd1ZXN0X2NvbmZpZzsKPiA+IAo+ID4gSSBkb24ndCB0aGluayB0aGF0J3Mg
ZW5vdWdoLCB3ZSBuZWVkIHRvIGluaXRpYWxpemUgdGhlIGRjcyBwcm9wZXJseS4KPiA+IE90aGVy
d2lzZSwgbGlieGxfX2RvbWFpbl9idWlsZCgpIG1pZ2h0IHN0YXJ0IHVzaW5nIHRoaW5nIHRoYXQg
YXJlbid0IHNldAo+ID4gcHJvcGVybHkuIE1heWJlIHdlIHdvdWxkIG5lZWQgYSBuZXcgc3RydWN0
IHdoaWNoIGNvdWxkIGJlIHBhc3MgdG8KPiA+IGxpYnhsX19kb21haW5fYnVpbGQqLCBvciB0aGF0
IG1pZ2h0IGJlIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBuZWVkZWQuCj4gCj4gRXIgbGlrZWx5IHll
cywgYnV0IGNyZWF0aW5nIGEgY29tcGxldGUgZG9tYWluX2NyZWF0ZV9zdGF0ZSBmb3IgdGhlCj4g
c3R1YmRvbSB3aWxsIGJlIHZlcnkgY3VtYmVyc29tZSBJIHRoaW5rLiBNYXliZSB3ZSBjYW4gY29w
eSB0aGUgb25lCj4gZnJvbSB0aGUgZ3Vlc3Qgb3ZlciB0aGUgc3R1YmRvbSBvbmUgaW4gb3JkZXIg
dG8gaW5pdGlhbGl6ZSBpdD8KClRoYXQncyBub3QgZ29pbmcgdG8gd29yay4KCj4gTm90IHN1cmUg
dGhhdCdzIGFueSBiZXR0ZXIgdGhhbiBqdXN0IHVzaW5nIGFuIGVtcHR5IG9uZS4KCkFuZCBhbiAi
ZW1wdHkgb25lIiBkb2Vzbid0IHdvcmsgZWl0aGVyLCB0aGUgZGNzIGNyZWF0ZWQgaGVyZSBjb250
YWlucwptb3JlIHRoYXQganVzdCB0aGUgYGJ1aWxkX3N0YXRlJyBhbmQgYGd1ZXN0X2NvbmZpZycs
IGl0IGFsc28gY29udGFpbnMKZm9yIGFsbCB0aGUgX2ZkIGZpZWxkIHNldCB0byBzb21ldGhpbmcu
CgpUaGUgX2ZkIHRoaW5nIGlzIGltcG9ydGFudCBiZWNhdXNlIEFuZHJldyBjaGVjayB0aGUgdmFs
dWUgb2YKYHJlc3RvcmVfZmQnIHRvIGZpZ3VyZSBvdXQgaWYgYSBkb21haW4gaXMgYmVlbiByZXN0
b3JlZCBvciBub3QuCgpJIGRvbid0IGhhdmUgYmV0dGVyIHN1Z2dlc3Rpb24gZm9yIG5vdywgSSds
bCB0cnkgdG8gdGhpbmsgYWJvdXQgaXQuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
