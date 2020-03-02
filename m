Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335A175D7C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:45:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8mGb-0006vD-Ok; Mon, 02 Mar 2020 14:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3PxB=4T=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1j8mGZ-0006v8-Kf
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:41:55 +0000
X-Inumbo-ID: f5da1174-5c93-11ea-9f86-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5da1174-5c93-11ea-9f86-12813bfff9fa;
 Mon, 02 Mar 2020 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583160115;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Gb+Nk07lNNngHXuFNtSCM0gCe9xXlx5D7dp/fC5MtX8=;
 b=G68PhmxyZOaQJwDZKk9MMp9tUNCG1/nNhoet24TZUPE57IUbPSNCk7+n
 lA/UUyKplyP6g9NqvRSSCl00yzRS6ydrGkKrtxu2mOoyr5aa/sc0uJ7mY
 kBvWEnhPOA2uFkdLnEI+kiP+3wd8qrW11EMiGKQDx39cbqrirqc/xzO3o M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9M/TJMMKKMBhqNL6vGiCYJIfbjpiSIaKERcjLb+q7qz9I7Vg0dMHUSOD0IueUCnB0c92Q3H4QO
 VgdU0Zcb4ZiytqvEY0eIG7vzro+OgJvgVV9t6o/XsxV38ImLsu/Szp+FuWZ6wid+oJ4yNa1RKL
 4S9bnm8mEP4W/NAmuk1w8rQUfs6hLZYOELJVWeEL54YZnEy5novUQ+5z46X4ZgT8NLRfypGTKv
 ok3We3xi3SOynqVXbdCJiOr5FxzWBMq/lzJbYCq7BTS5+mo01RxfEreQxenjyFYh06UTI2vNgD
 1h8=
X-SBRS: 2.7
X-MesageID: 13278364
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13278364"
To: Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>
References: <20200211093122.5644-1-jgross@suse.com>
 <6b65b34d-0078-ad0c-9a6c-ada5d2828cc0@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <680f7622-3e4b-1049-cecc-527910739ca9@citrix.com>
Date: Mon, 2 Mar 2020 14:41:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6b65b34d-0078-ad0c-9a6c-ada5d2828cc0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy8yLzIwIDI6MjggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAyLjIwMjAgMTA6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uZSBvZiB0aGUgbWFpbiBkZXNpZ24gZ29hbHMg
b2YgY29yZSBzY2hlZHVsaW5nIGlzIHRvIGF2b2lkIGFjdGlvbnMKPj4gd2hpY2ggYXJlIG5vdCBk
aXJlY3RseSByZWxhdGVkIHRvIHRoZSBkb21haW4gY3VycmVudGx5IHJ1bm5pbmcgb24gYQo+PiBn
aXZlbiBjcHUgb3IgY29yZS4gTGl2ZSBwYXRjaGluZyBpcyBvbmUgb2YgdGhvc2UgYWN0aW9ucyB3
aGljaCBhcmUKPj4gYWxsb3dlZCB0YWtpbmcgcGxhY2Ugb24gYSBjcHUgb25seSB3aGVuIHRoZSBp
ZGxlIHNjaGVkdWxpbmcgdW5pdCBpcwo+PiBhY3RpdmUgb24gdGhhdCBjcHUuCj4+Cj4+IFVuZm9y
dHVuYXRlbHkgbGl2ZSBwYXRjaGluZyB0cmllcyB0byBmb3JjZSB0aGUgY3B1cyBpbnRvIHRoZSBp
ZGxlIGxvb3AKPj4ganVzdCBieSByYWlzaW5nIHRoZSBzY2hlZHVsZSBzb2Z0aXJxLCB3aGljaCB3
aWxsIG5vIGxvbmdlciBiZQo+PiBndWFyYW50ZWVkIHRvIHdvcmsgd2l0aCBjb3JlIHNjaGVkdWxp
bmcgYWN0aXZlLiBBZGRpdGlvbmFsbHkgdGhlcmUgYXJlCj4+IHN0aWxsIHNvbWUgcGxhY2VzIGlu
IHRoZSBoeXBlcnZpc29yIGNhbGxpbmcgY2hlY2tfZm9yX2xpdmVwYXRjaF93b3JrKCkKPj4gd2l0
aG91dCBiZWluZyBpbiB0aGUgaWRsZSBsb29wLgo+Pgo+PiBJdCBpcyBlYXN5IHRvIGZvcmNlIGEg
Y3B1IGludG8gdGhlIG1haW4gaWRsZSBsb29wIGJ5IHNjaGVkdWxpbmcgYQo+PiB0YXNrbGV0IG9u
IGl0LiBTbyBzd2l0Y2ggbGl2ZSBwYXRjaGluZyB0byB1c2UgdGFza2xldHMgZm9yIHN3aXRjaGlu
ZyB0bwo+PiBpZGxlIGFuZCByYWlzaW5nIHNjaGVkdWxpbmcgZXZlbnRzLiBBZGRpdGlvbmFsbHkg
dGhlIGNhbGxzIG9mCj4+IGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpIG91dHNpZGUgdGhlIG1h
aW4gaWRsZSBsb29wIGNhbiBiZSBkcm9wcGVkLgo+Pgo+PiBBcyB0YXNrbGV0cyBhcmUgb25seSBy
dW5uaW5nIG9uIGlkbGUgdmNwdXMgYW5kIHN0b3BfbWFjaGluZV9ydW4oKQo+PiBpcyBhY3RpdmF0
aW5nIHRhc2tsZXRzIG9uIGFsbCBjcHVzIGJ1dCB0aGUgb25lIGl0IGhhcyBiZWVuIGNhbGxlZCBv
bgo+PiB0byByZW5kZXp2b3VzLCBpdCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4o
KSB0byBiZSBjYWxsZWQgb24KPj4gYW4gaWRsZSB2Y3B1LCB0b28sIGFzIG90aGVyd2lzZSB0aGVy
ZSBpcyBubyB3YXkgZm9yIHNjaGVkdWxpbmcgdG8KPj4gYWN0aXZhdGUgdGhlIGlkbGUgdmNwdSBm
b3IgdGhlIHRhc2tsZXQgb24gdGhlIHNpYmxpbmcgb2YgdGhlIGNwdQo+PiBzdG9wX21hY2hpbmVf
cnVuKCkgaGFzIGJlZW4gY2FsbGVkIG9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgIHwgIDkgKysrKy0tLS0tCj4+ICB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgfCAgNiAt
LS0tLS0KPj4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICB8ICA5ICsrKystLS0tLQo+PiAg
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgIHwgIDIgKy0KPj4gIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3ZtY3MuYyB8ICAyICstCj4+ICB4ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMgICAgfCAgMiAr
LQo+PiAgeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgIHwgIDIgKy0KPj4gIHhlbi9jb21tb24v
bGl2ZXBhdGNoLmMgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQo+PiAgOCBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkKPiAKPiBLb25yYWQsIFJvc3MgLSBJIHdhcyBhYm91dCB0byBhcHBseSB0aGlzIHdoZW4gSSBu
b3RpY2VkIGFuIGFjawo+IGJ5IG9uZSBvZiB0aGUgdHdvIG9mIHlvdSBpcyBzdGlsbCBuZWVkZWQu
IENhcmUgdG8gcHJvdmlkZSBvbmUKPiAob3IgY29tbWVudCBpZiB0aGVyZSBhcmUgaXNzdWVzKT8K
PiAKClNvcnJ5LgoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
