Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB07976D6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 12:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0NgX-0007XW-21; Wed, 21 Aug 2019 10:17:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WlBC=WR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0NgV-0007XR-RA
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 10:17:43 +0000
X-Inumbo-ID: e92c35f4-c3fc-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e92c35f4-c3fc-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566382663;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1QV0ztAGYBhatmG01dHLYFsoNWLKtYaO3JQi0sA9GQY=;
 b=P8cXSEHpwoM3CzJYAJvzF5aaJBwmxKVJrRtdgZfKE6p2LWKHEC49gTWM
 tXNsjz/6eUyWtNwh07CqatjQaJ2exX9ArULg8207EParXz2HQKRMi9if6
 nyQypXtU3lUPhmrcsfTNOXOeBMexyw4Frjt6vqlH7v4vSkxR9CtfaFrgp k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UPXa9bHoGCj1Ht6jWiI/m0wxxowIcUxD2xrXcAXSRcvb90nTtN83K/0j7FfaUkfC1u1or465Av
 S4rYKGCm49VV5eWaFX3gkCGm8nrm9JHHF4nUJTArGBEBBlTL14vNnyldKo+D0LrzM5z1QidkBT
 xPYQoxLmvvGcjS1L3k7kKB7K/OUsLCZSV0SolJUrLdmnwJRDygF3j2ZDKMfpJdO8GaL9oUBe75
 fCE2nxF3KBNPyj8Tz31E16ajqwhPgwTMECI5SzGiHu1LuYuKt00KRDy3aYyTexDeiajvYNFk5O
 Q6k=
X-SBRS: 2.7
X-MesageID: 4519587
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4519587"
To: Paul Durrant <Paul.Durrant@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>
References: <20190821082258.36549-1-paul.durrant@citrix.com>
 <20190821085210.kjx53rseieu2uc5k@Air-de-Roger>
 <40b248ea31a84e39be5cf521d6acec69@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e7f38578-0caa-3456-5eae-770dd0ed0095@citrix.com>
Date: Wed, 21 Aug 2019 11:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40b248ea31a84e39be5cf521d6acec69@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] viridian: make
 viridian_time_domain_freeze() safe to call...
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDgvMjAxOSAxMDoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBTZW50OiAyMSBBdWd1c3QgMjAxOSAwOTo1Mgo+PiBUbzogUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIHZpcmlkaWFuOiBtYWtlIHZpcmlkaWFuX3RpbWVfZG9tYWluX2ZyZWV6
ZSgpIHNhZmUgdG8gY2FsbC4uLgo+Pgo+PiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwOToyMjo1
OEFNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiAuLi5vbiBhIHBhcnRpYWxseSBkZXN0
cm95ZWQgZG9tYWluLgo+Pj4KPj4+IHZpcmlkaWFuX3RpbWVfZG9tYWluX2ZyZWV6ZSgpIGFuZCB2
aXJpZGlhbl90aW1lX3ZjcHVfZnJlZXplKCkgcmVseQo+Pj4gKHJlc3BlY3RpdmVseSkgb24gdGhl
IGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwZXItZG9tYWluIGFuZCBwZXItdmNwdSB2aXJpZGlhbgo+
Pj4gYXJlYXMgWzFdLCB3aGljaCBhcmUgZnJlZWQgZHVyaW5nIGRvbWFpbl9yZWxpbnF1aXNoX3Jl
c291cmNlcygpLgo+Pj4gQmVjYXVzZSBhcmNoX2RvbWFpbl9wYXVzZSgpIGNhbiBjYWxsIHZpcmlk
aWFuX2RvbWFpbl90aW1lX2ZyZWV6ZSgpIHRoaXMKPj4+IGNhbiBsZWFkIHRvIGhvc3QgY3Jhc2hl
cyBpZiBlLmcuIGEgWEVOX0RPTUNUTF9wYXVzZWRvbWFpbiBpcyBpc3N1ZWQgYWZ0ZXIKPj4+IGRv
bWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGhhcyBydW4uCj4+Pgo+Pj4gVG8gcHJldmVudCBz
dWNoIGNyYXNoZXMsIHRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIG9mIGlzX2R5aW5nIGludG8KPj4+
IHZpcmlkaWFuX3RpbWVfZG9tYWluX2ZyZWV6ZSgpLCBhbmQgdmlyaWRpYW5fdGltZV9kb21haW5f
dGhhdygpIHdoaWNoIGlzCj4+PiBzaW1pbGFybHkgdnVsbmVyYWJsZSB0byBpbmRpcmVjdGlvbiBp
bnRvIGZyZWVkIG1lbW9yeS4KPj4+Cj4+PiBOT1RFOiBUaGUgcGF0Y2ggYWxzbyBtYWtlcyB2aXJp
ZGlhbl90aW1lX3ZjcHVfZnJlZXplL3RoYXcoKSBzdGF0aWMsIHNpbmNlCj4+PiAgICAgICB0aGV5
IGhhdmUgbm8gY2FsbGVycyBvdXRzaWRlIG9mIHRoZSBzYW1lIHNvdXJjZSBtb2R1bGUuCj4+Pgo+
Pj4gWzFdIFNlZSBjb21taXQgZTdhOWI1ZTcyZjI2ICJ2aXJpZGlhbjogc2VwYXJhdGVseSBhbGxv
Y2F0ZSBkb21haW4gYW5kIHZjcHUKPj4+ICAgICBzdHJ1Y3R1cmVzIi4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+PiBSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IE5vdGUg
eW91IGNvdWxkIGFsc28gZHJvcCB0aGUgdmlyaWRpYW5fIHByZWZpeCB0byB0aGUgbm93IHN0YXRp
Ywo+PiBmdW5jdGlvbnMuCj4+Cj4gWWVhaCwgdGhleSBjb3VsZCBiZSBkcm9wcGVkLiBNYXkgYmUg
YSBmcmllbmRseSBjb21taXR0ZXIgY291bGQgZG8gaXQ/IDotKQoKRG9uZS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
