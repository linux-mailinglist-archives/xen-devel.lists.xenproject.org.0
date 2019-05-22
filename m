Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08726890
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 18:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTUJw-0007lq-Jq; Wed, 22 May 2019 16:42:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up1o=TW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hTUJu-0007lk-W0
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 16:42:27 +0000
X-Inumbo-ID: 946a1f64-7cb0-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 946a1f64-7cb0-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 16:42:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: sVJguGgH6FVVvICdnM2UzKmapOUwNMvXtOndE95TSMZybVNbAh755o6UzKWSaxjuf4chN3WH8i
 bnGCgnyZAt6EBwCpFbZ1J14I9IRy07ruljw7oRxhQ0S2LbaSbwkveAjarBtVs76dXKubwP+E8p
 mwuBFc3+oLWZz6aOoqJkYQsTqAwzZFYLb06fsxD6NGdVYcogrqubdaltnqOYCLDQbCk5LYwrj+
 1JcXMuwrMZ2sj/DwJZPImRSgBmJEZt03pKUOwwlAqiuJ3BfZNM1Jtg3w7z2UgV6o8xIBWZNNq4
 ZbY=
X-SBRS: 2.7
X-MesageID: 781604
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="781604"
Date: Wed, 22 May 2019 17:42:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190522164214.mptkeyojhulxbjww@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
 <20190520140449.5ihqctltaeiegqiz@Air-de-Roger>
 <5CE2C72D0200007800230AD1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE2C72D0200007800230AD1@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 13/15] x86/IRQ: tighten vector checks
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDk6MjY6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjA1LjE5IGF0IDE2OjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTI6MzJBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gVXNlIHZhbGlkX2lycV92ZWN0b3IoKSByYXRoZXIgdGhhbiAiPiAw
Ii4KPiA+PiAKPiA+PiBBbHNvIHJlcGxhY2UgYW4gb3Blbi1jb2RlZCB1c2Ugb2YgSVJRX1ZFQ1RP
Ul9VTkFTU0lHTkVELgo+ID4+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFRoYW5rcy4KPiAKPiA+IFRoZSBxdWVzdGlvbiBJIGhh
dmUgYmVsb3cgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhlIHVzYWdlIG9mCj4gPiB2YWxp
ZF9pcnFfdmVjdG9yLCBidXQgcmF0aGVyIHdpdGggdGhlIGV4aXN0aW5nIGNvZGUuCj4gPiAKPiA+
PiBAQCAtNDUyLDE1ICs0NTIsMTggQEAgc3RhdGljIHZtYXNrX3QgKmlycV9nZXRfdXNlZF92ZWN0
b3JfbWFzawo+ID4+ICAgICAgICAgICAgICBpbnQgdmVjdG9yOwo+ID4+ICAgICAgICAgICAgICAK
PiA+PiAgICAgICAgICAgICAgdmVjdG9yID0gaXJxX3RvX3ZlY3RvcihpcnEpOwo+ID4+IC0gICAg
ICAgICAgICBpZiAoIHZlY3RvciA+IDAgKQo+ID4+ICsgICAgICAgICAgICBpZiAoIHZhbGlkX2ly
cV92ZWN0b3IodmVjdG9yKSApCj4gPj4gICAgICAgICAgICAgIHsKPiA+PiAtICAgICAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiSVJRICVkIGFscmVhZHkgYXNzaWduZWQgdmVjdG9yICVk
XG4iLAo+ID4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJJUlElZCBhbHJl
YWR5IGFzc2lnbmVkIHZlY3RvciAlMDJ4XG4iLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlycSwgdmVjdG9yKTsKPiA+PiAgICAgICAgICAgICAgICAgIAo+ID4+ICAgICAgICAgICAgICAg
ICAgQVNTRVJUKCF0ZXN0X2JpdCh2ZWN0b3IsIHJldCkpOwo+ID4+ICAKPiA+PiAgICAgICAgICAg
ICAgICAgIHNldF9iaXQodmVjdG9yLCByZXQpOwo+ID4+ICAgICAgICAgICAgICB9Cj4gPj4gKyAg
ICAgICAgICAgIGVsc2UgaWYgKCB2ZWN0b3IgIT0gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEICkKPiA+
PiArICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiSVJRJWQgbWFwcGVkIHRv
IGJvZ3VzIHZlY3RvciAlMDJ4XG4iLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlycSwg
dmVjdG9yKTsKPiA+IAo+ID4gTWF5YmUgYWRkIGFuIGFzc2VydF91bnJlYWNoYWJsZSBoZXJlPyBJ
dCBzZWVtcyByZWFsbHkgYm9ndXMgdG8gY2FsbAo+ID4gaXJxX2dldF91c2VkX3ZlY3Rvcl9tYXNr
IHdpdGggYW4gdW5hc3NpZ25lZCB2ZWN0b3IuCj4gCj4gSG93IHRoYXQ/IFRoaXMgd291bGQgZS5n
LiBnZXQgY2FsbGVkIHRoZSB2ZXJ5IGZpcnN0IHRpbWUgYSB2ZWN0b3IKPiBpcyB0byBiZSBhc3Np
Z25lZC4gQnV0IEknbSBhZnJhaWQgSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIGFueXdheSBieQo+IHRo
ZSB3b3JkaW5nIHlvdSB1c2UgLSBhZnRlciBhbGwgdGhpcyBpcyB0aGUgY29kZSBwYXRoIGRlYWxp
bmcgd2l0aAo+IGFuIElSUSBfbm90XyBiZWluZyBtYXJrZWQgYXMgaGF2aW5nIG5vIHZlY3RvciBh
c3NpZ25lZCwgYnV0Cj4gYWxzbyBub3QgaGF2aW5nIGEgdmFsaWQgdmVjdG9yLgoKVGhhbmtzIGZv
ciB0aGUgY2xhcmlmaWNhdGlvbiwgYnkgdGhlIG5hbWUgb2YgdGhlIGZ1bmN0aW9uIEkgYXNzdW1l
ZCBpdAptdXN0IGJlIGNhbGxlZCB3aXRoIGFuIGlycSB0aGF0IGhhcyBhIHZlY3RvciBhc3NpZ25l
ZCwgaWYgdGhhdCdzIG5vdAp0aGUgY2FzZSB0aGVuIEkgdGhpbmsgaXQncyBmaW5lLgoKUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
