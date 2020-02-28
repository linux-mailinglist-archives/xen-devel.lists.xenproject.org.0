Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A89173DA3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:54:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iqp-00019x-2X; Fri, 28 Feb 2020 16:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7iqn-00019s-TV
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:50:57 +0000
X-Inumbo-ID: 7d2192ca-5a4a-11ea-99b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d2192ca-5a4a-11ea-99b0-12813bfff9fa;
 Fri, 28 Feb 2020 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582908656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EvXCgoTg9qkAeWIINHvXJ2o7HcbHL0HTlw1sF1fn9M8=;
 b=EGceZcwjU9nC0rc89leGhdQ3WOacOflqdUgG31tGflFm7j/9y1fD7f+9
 Pe1DnHAzr/JXsqWcr5V39caiOlOcD05m+zJMPrE1jr9Unv+jRyrlAnRJH
 oyAWmIWeVsZxxQVgbxh5Cis0nUfrDHJywyvBmg1kbZWXJVX8ZDuaQ5d+D E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: krCKqbKU/EIN3kHneFNKsXxWXepNOXPmNo6ypQitXctZ7l+moOxJG5T33JaXfmMB4nUqNZdEbs
 8XlummTwjgaBHGL5KmExbjckNZO622e/pOFe6crHiOeCz6tbAtf2XTKM/blcSDEGZTcvqVHb66
 GUCMJBdw0+JQHY0X8P3ChhC22TxddOlN/8lnmllvh8VXY+lFATwgt806H4bPoTx/n9I0w75Lxt
 +FrdS+P58PVK6v0JTgJeSCajGS3hyZhHy9eGxVhiZinl7GtO6oAgKyomONivGSwhVi/yEc8UKa
 3eo=
X-SBRS: 2.7
X-MesageID: 13362444
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13362444"
Date: Fri, 28 Feb 2020 17:50:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228165048.GE24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-5-roger.pau@citrix.com>
 <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDU6MTQ6MDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSW50
cm9kdWNlIGEgc3BlY2lmaWMgZmxhZyB0byByZXF1ZXN0IGEgSFZNIGd1ZXN0IFRMQiBmbHVzaCwg
d2hpY2ggaXMKPiA+IGFuIEFTSUQvVlBJRCB0aWNrbGUgdGhhdCBmb3JjZXMgYSBsaW5lYXIgVExC
IGZsdXNoIGZvciBhbGwgSFZNIGd1ZXN0cy4KPiAKPiBIZXJlIGFuZCBiZWxvdywgd2hhdCBkbyB5
b3UgbWVhbiBieSAibGluZWFyIj8gSSBndWVzcyB5b3UgbWVhbgo+IFRMQnMgaG9sZGluZyB0cmFu
c2xhdGlvbnMgZnJvbSBndWVzdCBsaW5lYXIgdG8gZ3Vlc3QgcGh5c2ljYWwsCj4gYnV0IEkgdGhp
bmsgdGhpcyBjb3VsZCBkbyB3aXRoIHRoZW4gYWxzbyBzYXlpbmcgc28sIGV2ZW4gaWYgaXQncwo+
IG1vcmUgd29yZHMuCgpZZXMsIHdpbGwgY2hhbmdlLgoKPiA+IFRoaXMgd2FzIHByZXZpb3VzbHkg
dW5jb25kaXRpb25hbGx5IGRvbmUgaW4gZWFjaCBwcmVfZmx1c2ggY2FsbCwgYnV0Cj4gPiB0aGF0
J3Mgbm90IHJlcXVpcmVkOiBIVk0gZ3Vlc3RzIG5vdCB1c2luZyBzaGFkb3cgZG9uJ3QgcmVxdWly
ZSBsaW5lYXIKPiA+IFRMQiBmbHVzaGVzIGFzIFhlbiBkb2Vzbid0IG1vZGlmeSB0aGUgZ3Vlc3Qg
cGFnZSB0YWJsZXMgaW4gdGhhdCBjYXNlCj4gPiAoaWU6IHdoZW4gdXNpbmcgSEFQKS4KPiAKPiBU
aGlzIGV4cGxhaW5zIHRoZSBjb3JyZWN0bmVzcyBpbiBvbmUgZGlyZWN0aW9uLiBXaGF0IGFib3V0
IHRoZQo+IHJlbW92YWwgb2YgdGhpcyBmcm9tIHRoZSBzd2l0Y2hfY3IzX2NyNCgpIHBhdGg/CgpB
RkFJQ1QgdGhhdCdzIG5ldmVyIHVzZWQgYnkgc2hhZG93IGNvZGUgdG8gbW9kaWZ5IGNyMyBvciBj
cjQsIGFuZApoZW5jZSBkb2Vzbid0IHJlcXVpcmUgYSBndWVzdCBsaW5lYXIgVExCIGZsdXNoLgoK
PiBBbmQgd2hhdCBhYm91dAo+IG91ciBzYWZldHkgYXNzdW1wdGlvbnMgZnJvbSB0aGUgdGlja2lu
ZyBvZiB0bGJmbHVzaF9jbG9jaywKPiB3aGVyZSB3ZSB0aGVuIGltcGx5IHRoYXQgcGFnZXMgZS5n
LiBhYm91dCB0byBiZSBmcmVlZCBjYW4ndAo+IGhhdmUgYW55IHRyYW5zbGF0aW9ucyBsZWZ0IGlu
IGFueSBUTEJzIGFueW1vcmU/CgpJJ20gc2xpZ2h0bHkgY29uZnVzZWQuIFRoYXQgZmx1c2ggb25s
eSBhZmZlY3RzIEhWTSBndWVzdHMgbGluZWFyIFRMQiwKYW5kIGhlbmNlIGlzIG5vdCB1bmRlciBY
ZW4gY29udHJvbCB1bmxlc3Mgc2hhZG93IG1vZGUgaXMgdXNlZC4gUGFnZXMKdG8gYmUgZnJlZWQg
aW4gdGhlIEhBUCBjYXNlIG5lZWQgdG8gYmUgZmx1c2hlZCBmcm9tIHRoZSBFUFQvTlBULCBidXQK
d2hldGhlciB0aGVyZSBhcmUgcmVmZXJlbmNlcyBsZWZ0IGluIHRoZSBndWVzdCBUTEIgdG8gcG9p
bnQgdG8gdGhhdApnZm4gcmVhbGx5IGRvZXNuJ3QgbWF0dGVyIHRvIFhlbiBhdCBhbGwsIHNpbmNl
IHRoZSBndWVzdCBpcyBpbiBmdWxsCmNvbnRyb2wgb2YgaXQncyBNTVUgYW5kIFRMQiBpbiB0aGF0
IGNhc2UuCgpGb3Igc2hhZG93IGFueSBjaGFuZ2UgaW4gdGhlIGd1ZXN0IHBhZ2UtdGFibGVzIHNo
b3VsZCBhbHJlYWR5IGJlCmFjY29tcGFuaWVkIGJ5IGEgZ3Vlc3QgVExCIGZsdXNoLCBvciBlbHNl
IHRoZSBndWVzdCBjb3VsZCBhY2Nlc3Mgbm8KbG9uZ2VyIHByZXNlbnQgZW50cmllcywgcmVnYXJk
bGVzcyBvZiB3aGV0aGVyIHRoZSBhZmZlY3RlZCBwYWdlcyBhcmUKZnJlZWQgb3Igbm90LgoKPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAo+ID4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCj4gPiBAQCAtMTA1LDYgKzEwNSw4IEBAIHZvaWQgc3dpdGNo
X2NyM19jcjQodW5zaWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcgY3I0KTsKPiA+ICAjZGVm
aW5lIEZMVVNIX1ZDUFVfU1RBVEUgMHgxMDAwCj4gPiAgIC8qIEZsdXNoIHRoZSBwZXItY3B1IHJv
b3QgcGFnZSB0YWJsZSAqLwo+ID4gICNkZWZpbmUgRkxVU0hfUk9PVF9QR1RCTCAweDIwMDAKPiA+
ICsgLyogRmx1c2ggYWxsIEhWTSBndWVzdHMgbGluZWFyIFRMQiAodXNpbmcgQVNJRC9WUElEKSAq
Lwo+ID4gKyNkZWZpbmUgRkxVU0hfR1VFU1RTX1RMQiAweDQwMDAKPiAKPiBGb3Igb25lLCB0aGUg
ImFsbCIgaXMgcHJldHR5IG1pc2xlYWRpbmcuIEEgc2luZ2xlIHN1Y2ggcmVxdWVzdAo+IGRvZXNu
J3QgZG8gdGhpcyBmb3IgYWxsIHZDUFUtcyBvZiBhbGwgSFZNIGd1ZXN0cywgZG9lcyBpdD8KCkl0
IGtpbmQgb2YgZG9lcyBiZWNhdXNlIGl0IHRpY2tsZXMgdGhlIHBDUFUgQVNJRC9WUElEIGdlbmVy
YXRpb24gSUQsCnNvIGFueSB2Q1BVIHNjaGVkdWxlZCBvbiB0aGUgc2VsZWN0ZWQgcENQVXMgd2ls
bCBnZXQgYSBuZXcgQVNJRC9WUElECmFsbG9jYXRlZCBhbmQgdGh1cyBhIGNsZWFuIFRMQi4KCj4g
SSdtCj4gYWxzbyBzdHJ1Z2dsaW5nIHdpdGggdGhlICdTJyBpbiAiR1VFU1RTIiAtIHdoeSBpcyBp
dCBub3QganVzdAo+ICJHVUVTVCI/IAoKQW55IGd1ZXN0IHZDUFVzIHJ1bm5pbmcgb24gdGhlIHNl
bGVjdGVkIHBDUFVzIHdpbGwgZ2V0IGEgbmV3IEFTSUQvVlBJRApJRCBhbmQgdGh1cyBhIGNsZWFu
IFRMQi4KCj4gSSBhZG1pdCB0aGUgbmFtZXMgb2YgdGhlIGludm9sdmVkIGZ1bmN0aW9ucwo+ICho
dm1fZmx1c2hfZ3Vlc3RfdGxicygpLCBodm1fYXNpZF9mbHVzaF9jb3JlKCkpIGFyZSBzb21ld2hh
dAo+IG1pc2xlYWRpbmcsIGFzIHRoZXkgZG9uJ3QgYWN0dWFsbHkgZG8gYW55IGZsdXNoaW5nLCB0
aGV5IG1lcmVseQo+IGFycmFuZ2UgZm9yIHdoYXQgaXMgaW4gdGhlIFRMQiB0byBubyBsb25nZXIg
YmUgYWJsZSB0byBiZSB1c2VkLAo+IHNvIGdpdmluZyB0aGlzIGEgc3VpdGFibGUgbmFtZSBpcyAi
aGlzdG9yaWNhbGx5IiBjb21wbGljYXRlZC4KPiBXaGF0IGlmIHdlIGRpZCBhd2F5IHdpdGggdGhl
IGh2bV9mbHVzaF9ndWVzdF90bGJzKCkgd3JhcHBlciwKPiBuYW1pbmcgdGhlIGNvbnN0YW50IGhl
cmUgdGhlbiBhZnRlciBodm1fYXNpZF9mbHVzaF9jb3JlKCksIGUuZy4KPiBGTFVTSF9BU0lEX0NP
UkU/CgpJJ20gbm90IG9wcG9zZWQgdG8gcmVuYW1pbmcuIFRoZSBjb21tZW50IGJlZm9yZSB0aGUg
ZGVmaW5pdGlvbiB3YXMKYWxzbyBtZWFudCB0byBjbGFyaWZ5IGl0J3MgdXNhZ2UsIGFuZCBoZW5j
ZSB0aGUgZXhwbGljaXQgbWVudGlvbiBvZgpBU0lEL1ZQSUQuCgo+IEkgYWxzbyB0aGluayB0aGlz
IGNvbnN0YW50IG1pZ2h0IGJldHRlciBiZSB6ZXJvIHdoZW4gIUhWTS4KClllcywgdGhhdCdzIGEg
Z29vZCBpZGVhLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
