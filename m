Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE5BE0BC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:01:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8lF-0002JG-Nj; Wed, 25 Sep 2019 14:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZcR2=XU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iD8lE-0002J9-K8
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 14:59:20 +0000
X-Inumbo-ID: 0d026674-dfa5-11e9-b588-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 0d026674-dfa5-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569423560;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1+DJcz75gHc3GfJB2Lih4nYKrcUKzRkHyhUTohJ/lxU=;
 b=BrmJ1/2r6n8UjTdK5lm0BsYNw4UAY6E68yocvuXXI/wo8bWD4eQnUE81
 R7YWSIYnVHDplA/ie//gldmHpHa5DGLXSXkskKoQ1wRHxqtedTz07j7jH
 yuWaNBmTLbbcP3JodR2lGP9l/foYdvwekTN/oa5kG85pTBIoihgIVhw4G I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8W1YamWf/QWnDHUCB13FwBDCZaIe458efBDOjwIPfaPasRrkulLRkmQuVC6Tj14hLy7Ydc2bDK
 OK1Jqnp2/jK1OxvFNE0VdenVU8fT6/ybE2cj0dW3/RCx6aP4nYIpfFl0OQev7gTIqJbCyWhXSM
 w6l30hdavajX+9EV3aeVvsJkwRM/vNsgMURZgKyRENZG+G2smRgZBB/suKsqeidIK18+1PzPhr
 7GTJYVnsjAmC2opgFWNELqCENmyoTM8V7SX9VVK703hw/JtGV4Kxv7g+wMjoopsW+0h45Zvmu/
 1eI=
X-SBRS: 2.7
X-MesageID: 6119833
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6119833"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <c5d2eaf3-77f6-f87e-6898-c4c475f607c1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <740443e0-bf92-a9b7-df31-004b269ed2ff@citrix.com>
Date: Wed, 25 Sep 2019 15:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c5d2eaf3-77f6-f87e-6898-c4c475f607c1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 8/8] AMD/IOMMU: pre-fill all DTEs right
 after table allocation
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDkvMjAxOSAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTWFrZSBzdXJlIHdlIGRv
bid0IGxlYXZlIGFueSBEVEVzIHVuZXhwZWN0ZWQgcmVxdWVzdHMgdGhyb3VnaCB3aGljaAo+IHdv
dWxkIGJlIHBhc3NlZCB0aHJvdWdoIHVudHJhbnNsYXRlZC4gU2V0IFYgYW5kIElWIHJpZ2h0IGF3
YXkgKHdpdGgKPiBhbGwgb3RoZXIgZmllbGRzIGxlZnQgYXMgemVybyksIHJlbHlpbmcgb24gdGhl
IFYgYW5kL29yIElWIGJpdHMKPiBnZXR0aW5nIGNsZWFyZWQgb25seSBieSBhbWRfaW9tbXVfc2V0
X3Jvb3RfcGFnZV90YWJsZSgpIGFuZAo+IGFtZF9pb21tdV9zZXRfaW50cmVtYXBfdGFibGUoKSB1
bmRlciBzcGVjaWFsIHBhc3MtdGhyb3VnaCBjaXJjdW1zdGFuY2VzLgo+IFN3aXRjaCBiYWNrIHRv
IGluaXRpYWwgc2V0dGluZ3MgaW4gYW1kX2lvbW11X2Rpc2FibGVfZG9tYWluX2RldmljZSgpLgo+
Cj4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyBtYWtlIHRoZSBsYXR0ZXIgZnVuY3Rpb24gc3Rh
dGljLCBjb25zdGlmeWluZwo+IGl0cyBmaXJzdCBwYXJhbWV0ZXIgYXQgdGhlIHNhbWUgdGltZSwg
YXQgdGhpcyBvY2Nhc2lvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAtLS0KPiB2NjogTmV3Lgo+Cj4gLS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgfCAgIDIyICsrKysrKysrKysrKysrKysrKystLS0K
PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8ICAgMjAgKysr
KysrKysrKysrKysrKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMK
PiBAQCAtMTI1NSwxMiArMTI1NSwyOCBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0
dXBfZGV2aWNlCj4gIAo+ICAgICAgaWYgKCAhZHQgKQo+ICAgICAgewo+ICsgICAgICAgIHVuc2ln
bmVkIGludCBzaXplID0gZHRfYWxsb2Nfc2l6ZSgpOwo+ICsKPiAgICAgICAgICAvKiBhbGxvY2F0
ZSAnZGV2aWNlIHRhYmxlJyBvbiBhIDRLIGJvdW5kYXJ5ICovCj4gICAgICAgICAgZHQgPSBJVlJT
X01BUFBJTkdTX0RFVlRBQihpdnJzX21hcHBpbmdzKSA9Cj4gLSAgICAgICAgICAgIGFsbG9jYXRl
X2J1ZmZlcihkdF9hbGxvY19zaXplKCksICJEZXZpY2UgVGFibGUiKTsKPiArICAgICAgICAgICAg
YWxsb2NhdGVfYnVmZmVyKHNpemUsICJEZXZpY2UgVGFibGUiKTsKPiArICAgICAgICBpZiAoICFk
dCApCj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiArICAgICAgICAvKgo+ICsg
ICAgICAgICAqIFByZWZpbGwgZXZlcnkgRFRFIHN1Y2ggdGhhdCBhbGwga2luZHMgb2YgcmVxdWVz
dHMgd2lsbCBnZXQgYWJvcnRlZC4KPiArICAgICAgICAgKiBCZXNpZGVzIHRoZSB0d28gYml0cyBz
ZXQgdG8gdHJ1ZSBiZWxvdyB0aGlzIGJ1aWxkcyB1cG9uCj4gKyAgICAgICAgICogSU9NTVVfREVW
X1RBQkxFX1NZU19NR1RfRE1BX0FCT1JURUQsCj4gKyAgICAgICAgICogSU9NTVVfREVWX1RBQkxF
X0lPX0NPTlRST0xfQUJPUlRFRCwgYXMgd2VsbCBhcwo+ICsgICAgICAgICAqIElPTU1VX0RFVl9U
QUJMRV9JTlRfQ09OVFJPTF9BQk9SVEVEIGFsbCBiZWluZyB6ZXJvLCBhbmQgdXMgYWxzbwo+ICsg
ICAgICAgICAqIHdhbnRpbmcgYXQgbGVhc3QgVFYsIEdWLCBJLCBhbmQgRVggc2V0IHRvIGZhbHNl
Lgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9m
KCpkdCk7IGJkZiA8IHNpemU7ICsrYmRmICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGR0
W2JkZl0udiA9IHRydWU7Cj4gKyAgICAgICAgICAgIGR0W2JkZl0uaXYgPSB0cnVlOwo+ICsgICAg
ICAgIH0KClRoZSBEVC1CQVIgaXMgZ2VuZXJhbGx5IDJNQiBpbiBzaXplLsKgIEl0IGlzIGluY29u
dmVuaWVudCB0aGF0IHdlIGZpcnN0Cnplcm8gaXQsIHRoZW4gd2FsayBpdCBhIHNlY29uZCB0aW1l
IHNldHRpbmcgdHdvIGJpdHMuCgpJJ20gbm90IHN1cmUgdGhhdCBhbGxvY2F0ZV9idWZmZXIoKSBu
ZWVkcyB0byB6ZXJvIG1lbW9yeSBmb3IgYW55IG9mIGl0cwpjYWxsZXJzLsKgIFRoZSBjb21tYW5k
IHJpbmcgd3JpdGVzIGEgZnVsbCBlbnRyeSBhdCBvbmNlLCBhbmQgdGhlIElPTU1VCndyaXRlcyBm
dWxsIGV2ZW50L3BhZ2UgbG9ncyBhdCBvbmNlLgoKRHJvcHBpbmcgdGhlIG1lbXNldCgpIGFuZCBj
aGFuZ2luZyB0aGlzIHRvIGJlIGEgbG9vcCBvZiBzdHJ1Y3R1cmUKYXNzaWdubWVudHMgd291bGQg
YmUgcmF0aGVyIG1vcmUgZWZmaWNpZW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
