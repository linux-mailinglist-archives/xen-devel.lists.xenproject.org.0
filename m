Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFDB390A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9onY-0005QM-6i; Mon, 16 Sep 2019 11:04:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9onX-0005QA-6m
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:03:59 +0000
X-Inumbo-ID: ae701320-d871-11e9-95df-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae701320-d871-11e9-95df-12813bfff9fa;
 Mon, 16 Sep 2019 11:03:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5267AD09;
 Mon, 16 Sep 2019 11:03:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32254c6d-6475-b5b2-8249-0975ca0fc89d@suse.com>
Date: Mon, 16 Sep 2019 13:04:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 05/10] x86/domctl: Implement
 XEN_DOMCTL_set_cpumsr_policy
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiB2MjoKPiAgKiBCdW1w
IHRoZSBET01DVEwgaW50ZXJmYWNlIHZlcnNpb24KPiAgKiBQcm9hY3RpdmVseSBzZXQgdGhlIGVy
cm9yIHBvaW50ZXJzIGluIHhjX3NldF9kb21haW5fY3B1X3BvbGljeSgpCgpGcm9tIHRoaXMgSSB3
b3VsZCBoYXZlIGV4cGVjdGVkIC4uLgoKPiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYu
Ywo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4gQEAgLTIyOSw2ICsyMjksNTIg
QEAgaW50IHhjX2dldF9kb21haW5fY3B1X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMy
X3QgZG9taWQsCj4gICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICtpbnQgeGNfc2V0X2RvbWFp
bl9jcHVfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBucl9sZWF2ZXMsIHhlbl9jcHVpZF9sZWFm
X3QgKmxlYXZlcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBucl9t
c3JzLCB4ZW5fbXNyX2VudHJ5X3QgKm1zcnMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgKmVycl9sZWFmX3AsIHVpbnQzMl90ICplcnJfc3VibGVhZl9wLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICplcnJfbXNyX3ApCj4gK3sKPiArICAg
IERFQ0xBUkVfRE9NQ1RMOwo+ICsgICAgREVDTEFSRV9IWVBFUkNBTExfQk9VTkNFKGxlYXZlcywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9sZWF2ZXMgKiBzaXplb2YoKmxlYXZl
cyksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWENfSFlQRVJDQUxMX0JVRkZFUl9C
T1VOQ0VfSU4pOwo+ICsgICAgREVDTEFSRV9IWVBFUkNBTExfQk9VTkNFKG1zcnMsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbnJfbXNycyAqIHNpemVvZigqbXNycyksCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWENfSFlQRVJDQUxMX0JVRkZFUl9CT1VOQ0VfSU4pOwo+
ICsgICAgaW50IHJldDsKPiArCj4gKyAgICBpZiAoIHhjX2h5cGVyY2FsbF9ib3VuY2VfcHJlKHhj
aCwgbGVhdmVzKSApCj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsKPiArICAgIGlmICggeGNfaHlw
ZXJjYWxsX2JvdW5jZV9wcmUoeGNoLCBtc3JzKSApCj4gKyAgICAgICAgcmV0dXJuIC0xOwoKLi4u
IHNldHRpbmcgb2YgKmVycl8uLi5fcCBhaGVhZCBvZiB0aGVzZS4KCj4gQEAgLTY1OCwxNyArNjU4
LDI0IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2NwdWlkIHsKPiAgfTsKPiAgCj4gIC8qCj4gLSAqIFhF
Tl9ET01DVExfZ2V0X2NwdV9wb2xpY3kgKHg4NiBzcGVjaWZpYykKPiArICogWEVOX0RPTUNUTF97
Z2V0LHNldH1fY3B1X3BvbGljeSAoeDg2IHNwZWNpZmljKQo+ICAgKgo+IC0gKiBRdWVyeSB0aGUg
Q1BVSUQgYW5kIE1TUiBwb2xpY2llcyBmb3IgYSBzcGVjaWZpYyBkb21haW4uCj4gKyAqIFF1ZXJ5
IG9yIHNldCB0aGUgQ1BVSUQgYW5kIE1TUiBwb2xpY2llcyBmb3IgYSBzcGVjaWZpYyBkb21haW4u
Cj4gICAqLwo+ICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcHVfcG9saWN5IHsKPiAgICAgIHVpbnQzMl90
IG5yX2xlYXZlczsgLyogSU4vT1VUOiBOdW1iZXIgb2YgbGVhdmVzIGluL3dyaXR0ZW4gdG8KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICogJ2NwdWlkX3BvbGljeScuICovCj4gICAgICB1aW50
MzJfdCBucl9tc3JzOyAgIC8qIElOL09VVDogTnVtYmVyIG9mIE1TUnMgaW4vd3JpdHRlbiB0bwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiAnbXNyX2RvbWFpbl9wb2xpY3knICovCj4gLSAg
ICBYRU5fR1VFU1RfSEFORExFXzY0KHhlbl9jcHVpZF9sZWFmX3QpIGNwdWlkX3BvbGljeTsgLyog
T1VUICovCj4gLSAgICBYRU5fR1VFU1RfSEFORExFXzY0KHhlbl9tc3JfZW50cnlfdCkgbXNyX3Bv
bGljeTsgICAgLyogT1VUICovCj4gKyAgICBYRU5fR1VFU1RfSEFORExFXzY0KHhlbl9jcHVpZF9s
ZWFmX3QpIGNwdWlkX3BvbGljeTsgLyogSU4vT1VUICovCj4gKyAgICBYRU5fR1VFU1RfSEFORExF
XzY0KHhlbl9tc3JfZW50cnlfdCkgbXNyX3BvbGljeTsgICAgLyogSU4vT1VUICovCj4gKwo+ICsg
ICAgLyoKPiArICAgICAqIE9VVCwgc2V0X3BvbGljeSBvbmx5LiAgV3JpdHRlbiBpbiBzb21lIChi
dXQgbm90IGFsbCkgZXJyb3IgY2FzZXMgdG8KPiArICAgICAqIGlkZW50aWZ5IHByb2JsZW0gdGhl
IENQVUlEIGxlYWYvc3VibGVhZiBhbmQvb3IgTVNSIHdoaWNoIGF1ZGl0aW5nCj4gKyAgICAgKiBv
YmplY3RzIHRvLgo+ICsgICAgICovCgpTdHJheSAicHJvYmxlbSIsIG9yIG1pc3NpbmcgZnVydGhl
ciB3b3JkKHMpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
