Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64935CBBA6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:28:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNax-0007RF-4x; Fri, 04 Oct 2019 13:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihSl=X5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iGNaw-0007RA-4N
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:26:06 +0000
X-Inumbo-ID: 83e907dc-e6aa-11e9-9756-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83e907dc-e6aa-11e9-9756-12813bfff9fa;
 Fri, 04 Oct 2019 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570195564;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a0ucVUd7Wh3VbxppAGzKHXrpe43mlcS0sf5BXW1WBaQ=;
 b=PbMAYeVbgsPj4V+iJwxg/kr7WvpuyEQMKJ6a51Nz44OyDdsgYFegu8do
 GNDH7BZLF0ewMiWCjb9HXPTcjZRpp+aSdNk4r2Ko3DZ1cP9kIDa1c3YVc
 cI7OqibeImhqo0XgY3IYFEB2h6NT9X8j2DgZqeJNQnKs+bbmy+q78Z+Z9 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i7/M/tac9uNsMbgEAZXDPbdKoiFypAuySKV9Yv7wHcYd9POposau5cVh94QzmblcL4BHbQ4fUU
 0ydf11NDGBovw+mQZgPrsmG5jvdrfqoCZzCeJ+VnGDuaDdpPCrI3IW+/iL3j+fhT6RWCQTZU2+
 akQy11mNebU1kf0vYd2YTAaDZkWXSGvljqqNS8SLGCiYWSZ18Wxrr/4foWmbpwWWsXtB7EhUpf
 g+vgJTRsVEZiyPv2pcZCzGskcbz/RkQs6uPo4Om1RJVli15hfHWFRtdVFnQoVA/pSlCMR3xeeB
 bGk=
X-SBRS: 2.7
X-MesageID: 6839878
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6839878"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <b143bc0c-3d13-2127-be5d-b459d7b53c1e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <135ac304-2f46-c84a-95ce-e18516f2b36d@citrix.com>
Date: Fri, 4 Oct 2019 14:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b143bc0c-3d13-2127-be5d-b459d7b53c1e@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 2/3] AMD/IOMMU: allow callers to request
 allocate_buffer() to skip its memset()
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxNToyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGNvbW1hbmQgcmlu
ZyBidWZmZXIgZG9lc24ndCBuZWVkIGNsZWFyaW5nIHVwIGZyb250IGluIGFueSBldmVudC4KPiBT
dWJzZXF1ZW50bHkgd2UnbGwgYWxzbyB3YW50IHRvIGF2b2lkIGNsZWFyaW5nIHRoZSBkZXZpY2Ug
dGFibGVzLgo+Cj4gV2hpbGUgcGxheWluZyB3aXRoIGZ1bmN0aW9ucyBzaWduYXR1cmVzIHJlcGxh
Y2UgdW5kdWUgdXNlIG9mIGZpeGVkIHdpZHRoCj4gdHlwZXMgYXQgdGhlIHNhbWUgdGltZSwgYW5k
IGV4dGVuZCB0aGlzIHRvIGRlYWxsb2NhdGVfYnVmZmVyKCkgYXMgd2VsbC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2NzogTmV3Lgo+
Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAtOTk0LDEyICs5
OTQsMTIgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgZHRfYWxsb2Nfc2l6ZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9ERVZfVEFCTEVf
RU5UUllfU0laRSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIF9faW5pdCBkZWFsbG9jYXRlX2J1
ZmZlcih2b2lkICpidWYsIHVpbnQzMl90IHN6KQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgZGVhbGxv
Y2F0ZV9idWZmZXIodm9pZCAqYnVmLCB1bnNpZ25lZCBsb25nIHN6KQoKUHJvYmFibHkgYmVzdCB0
byB1c2Ugc2l6ZV90IGhlcmUsIGJlaW5nIGJvdGggc2hvcnRlciwgYW5kIGd1YXJhbnRlZWQgbm90
CnRvIHJlcXVpcmUgbW9kaWZpY2F0aW9uIGluIHRoZSBmdXR1cmUuCgo+ICB7Cj4gLSAgICBpbnQg
b3JkZXIgPSAwOwo+ICAgICAgaWYgKCBidWYgKQo+ICAgICAgewo+IC0gICAgICAgIG9yZGVyID0g
Z2V0X29yZGVyX2Zyb21fYnl0ZXMoc3opOwo+ICsgICAgICAgIHVuc2lnbmVkIGludCBvcmRlciA9
IGdldF9vcmRlcl9mcm9tX2J5dGVzKHN6KTsKPiArCj4gICAgICAgICAgX19mcmVlX2FtZF9pb21t
dV90YWJsZXMoYnVmLCBvcmRlcik7Cj4gICAgICB9Cj4gIH0KCkhvdyBhYm91dCBzaW1wbHkKCmlm
ICggYnVmICkKwqDCoMKgIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKGJ1ZiwgZ2V0X29yZGVyX2Zy
b21fYnl0ZXMoc3opKTsKCndoaWNoIGRyb3BzIHRoZSBvcmRlciB2YXJpYWJsZSBlbnRpcmVseT8K
CklkZWFsbHkgd2l0aCBib3RoIG9mIHRoZXNlIG1vZGlmaWNhdGlvbnMsIFJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiBAQCAtMTA1MCwyMSAr
MTA1NSwyMyBAQCBzdGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9jbWRfYnVmZmVyCj4gICAg
ICAvKiBhbGxvY2F0ZSAnY29tbWFuZCBidWZmZXInIGluIHBvd2VyIG9mIDIgaW5jcmVtZW50cyBv
ZiA0SyAqLwo+ICAgICAgcmV0dXJuIGFsbG9jYXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+Y21kX2J1
ZmZlciwgc2l6ZW9mKGNtZF9lbnRyeV90KSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJT01NVV9DTURfQlVGRkVSX0RFRkFVTFRfRU5UUklFUywKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiQ29tbWFuZCBCdWZmZXIiKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiQ29tbWFuZCBCdWZmZXIiLCBmYWxzZSk7Cj4gIH0KPiAgCj4gIHN0YXRp
YyB2b2lkICogX19pbml0IGFsbG9jYXRlX2V2ZW50X2xvZyhzdHJ1Y3QgYW1kX2lvbW11ICppb21t
dSkKPiAgewo+ICAgICAgLyogYWxsb2NhdGUgJ2V2ZW50IGxvZycgaW4gcG93ZXIgb2YgMiBpbmNy
ZW1lbnRzIG9mIDRLICovCj4gICAgICByZXR1cm4gYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11
LT5ldmVudF9sb2csIHNpemVvZihldmVudF9lbnRyeV90KSwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJT01NVV9FVkVOVF9MT0dfREVGQVVMVF9FTlRSSUVTLCAiRXZlbnQgTG9n
Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRVZFTlRfTE9HX0RF
RkFVTFRfRU5UUklFUywgIkV2ZW50IExvZyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHJ1ZSk7CgpXZWxsIC0gdGhpcyBtZWFucyBJJ3ZlIGdvdCB5ZXQgYW5vdGhlciBBTUQg
SU9NTVUgYnVnZml4IGhpZGluZyBzb21ld2hlcmUKaW4gYSBicmFuY2guwqAgSSBjb3VsZCBoYXZl
IHN3b3JuIEkgcG9zdGVkIGl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
