Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C210A272
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:50:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZe0V-0007aO-FO; Tue, 26 Nov 2019 16:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZe0U-0007aJ-PU
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:48:06 +0000
X-Inumbo-ID: 8431eb50-106c-11ea-a3a5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8431eb50-106c-11ea-a3a5-12813bfff9fa;
 Tue, 26 Nov 2019 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574786885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2vTnfBoSq3SXYJHmeWT7Fqu8rMhFiz+7SicH1ITt0dk=;
 b=Z6WirqsLhieOaIpAURJmvT+Pe6LT0XTQS3FsRm9MsjA5Mjnfm7l8X7ZV
 FAzPJTne52eSFQ3uD/Zxy4mtb8RNE5x62yxNcKVHbCPpu8Div8Bv72UBU
 uvl5Wd7M1Bm9lyez1fAvJkdgudA+4qg/Wq/ZPgHf8WRlJ8PaZ1skfR5jd I=;
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
IronPort-SDR: uzVhbmPatdjkuwz3BZeVAmqLEJS7hDybzsCRfJoOMpRCnqJLmUGoZfNi3RHIK7o5Kb6rF62uYD
 RboA+278fHPnJZfeYhdSKzpZ08ulpZ6hE5bHRPb9rMIPqpUMI8uVLwip4/Z/KQvuqKYPuJMk7S
 W9QuF29g1cqcvbl3zteIcPyHYj9WLjjEcbDUaX6ykGuZ5UvXF68dfSvLN3SMEVNMNCrcU1WWix
 oxSXhdkDpXwRi3FqNVk5klzx7Hrh5X3Qpk5Axp9q2CFB04Eyf02FABDVmXDsE8AUWJQgLjqm5I
 8m0=
X-SBRS: 2.7
X-MesageID: 9408541
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9408541"
Date: Tue, 26 Nov 2019 17:47:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191126164757.GH980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-2-roger.pau@citrix.com>
 <cccc439b-9595-1d5e-6969-8094e3a7c562@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cccc439b-9595-1d5e-6969-8094e3a7c562@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to
 prevent syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDU6MzI6MDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMTEuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jCj4gPiBAQCAtMjA1NCw2ICsyMDU0LDE5IEBAIHN0YXRpYyB2b2lkIHZteF9zeW5j
X3Bpcl90b19pcnIoc3RydWN0IHZjcHUgKnYpCj4gPiAgICAgIHVuc2lnbmVkIGludCBncm91cCwg
aTsKPiA+ICAgICAgREVDTEFSRV9CSVRNQVAocGVuZGluZ19pbnRyLCBOUl9WRUNUT1JTKTsKPiA+
ICAKPiA+ICsgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgIWF0b21pY19yZWFkKCZ2LT5wYXVzZV9j
b3VudCkgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICogU3luY2lu
ZyBQSVIgdG8gSVJSIG11c3Qgbm90IGJlIGRvbmUgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBDUFUs
Cj4gPiArICAgICAgICAgKiBzaW5jZSB0aGUgSVJSIGlzIGNvbnRyb2xsZWQgYnkgdGhlIGhhcmR3
YXJlIHdoZW4gdGhlIHZDUFUgaXMKPiA+ICsgICAgICAgICAqIGV4ZWN1dGluZy4gT25seSBhbGxv
dyBYZW4gdG8gZG8gc3VjaCBzeW5jIGlmIHRoZSB2Q1BVIGlzIHRoZSBjdXJyZW50Cj4gPiArICAg
ICAgICAgKiBvbmUgb3IgaWYgaXQncyBwYXVzZWQ6IHRoYXQncyByZXF1aXJlZCBpbiBvcmRlciB0
byBzeW5jIHRoZSBsYXBpYwo+ID4gKyAgICAgICAgICogc3RhdGUgYmVmb3JlIHNhdmluZyBpdC4K
PiA+ICsgICAgICAgICAqLwo+IAo+IElzIHRoaXMgc3RhdGVkIHRoaXMgd2F5IGJ5IHRoZSBTRE0g
YW55d2hlcmU/CgpObywgSSB0aGluayB0aGUgU0RNIGlzIG5vdCB2ZXJ5IGNsZWFyIG9uIHRoaXMs
IHRoZXJlJ3MgYSBwYXJhZ3JhcGgKYWJvdXQgUElSOgoKIlRoZSBsb2dpY2FsIHByb2Nlc3NvciBw
ZXJmb3JtcyBhIGxvZ2ljYWwtT1Igb2YgUElSIGludG8gVklSUiBhbmQKY2xlYXJzIFBJUi4gTm8g
b3RoZXIgYWdlbnQgY2FuIHJlYWQgb3Igd3JpdGUgYSBQSVIgYml0IChvciBncm91cCBvZgpiaXRz
KSBiZXR3ZWVuIHRoZSB0aW1lIGl0IGlzIHJlYWQgKHRvIGRldGVybWluZSB3aGF0IHRvIE9SIGlu
dG8gVklSUikKYW5kIHdoZW4gaXQgaXMgY2xlYXJlZC4iCgo+IEkgYXNrIGJlY2F1c2UgdGhlCj4g
Y29tbWVudCB0aGVuIHJlYWxseSBkb2Vzbid0IGFwcGx5IHRvIGp1c3QgdGhpcyBmdW5jdGlvbiwg
YnV0IHRvCj4gdmxhcGljX3ssdGVzdF9hbmRffXtzZXQsY2xlYXJ9X3ZlY3RvcigpIG1vcmUgZ2Vu
ZXJhbGx5LiBJdCdzCj4gbm90IGNsZWFyIHRvIG1lIGF0IGFsbCB3aGV0aGVyIHRoZSBDUFUgY2Fj
aGVzIChpbiBhbiBpbmNvaGVyZW50Cj4gZmFzaGlvbikgSVJSIChhbmQgbWF5YmUgb3RoZXIgQVBJ
QyBwYWdlIGVsZW1lbnRzKSwgcmF0aGVyIHRoYW4KPiBob25vcmluZyB0aGUgYXRvbWljIHVwZGF0
ZXMgdGhlc2UgbWFjcm9zIGRvLgoKSU1PIHN5bmNpbmcgUElSIHRvIElSUiB3aGVuIHRoZSB2Q1BV
IGlzIHJ1bm5pbmcgb24gYSBkaWZmZXJlbnQgcENQVSBpcwpsaWtlbHkgdG8gYXQgbGVhc3QgZGVm
ZWF0IHRoZSBwdXJwb3NlIG9mIHBvc3RlZCBpbnRlcnJ1cHRzOiB3aGVuIHRoZQpDUFUgcmVjZWl2
ZXMgdGhlIHBvc3RlZCBpbnRlcnJ1cHQgdmVjdG9yIGl0IHdvbid0IHNlZSB0aGUKb3V0c3RhbmRp
bmctbm90aWZpY2F0aW9uIGJpdCBpbiB0aGUgcG9zdGVkLWludGVycnVwdCBkZXNjcmlwdG9yCmJl
Y2F1c2UgdGhlIHN5bmMgZG9uZSBmcm9tIGEgZGlmZmVyZW50IHBDUFUgd291bGQgaGF2ZSBjbGVh
cmVkIGl0LCBhdAp3aGljaCBwb2ludCBpdCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IHRoZSBwcm9j
ZXNzb3Igd2lsbCBjaGVjayB2SVJSCmZvciBwZW5kaW5nIGludGVycnVwdHMuIFRoZSBkZXNjcmlw
dGlvbiBpbiBzZWN0aW9uIDI5LjYKUE9TVEVELUlOVEVSUlVQVCBQUk9DRVNTSU5HIGRvZXNuJ3Qg
ZXhwbGljaXRseSBtZW50aW9uIHdoZXRoZXIgdGhlCnZhbHVlIG9mIHRoZSBvdXRzdGFuZGluZy1u
b3RpZmljYXRpb24gYml0IGFmZmVjdHMgdGhlIGxvZ2ljIG9mIHBvc3RlZAppbnRlcnJ1cHQgcHJv
Y2Vzc2luZy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
