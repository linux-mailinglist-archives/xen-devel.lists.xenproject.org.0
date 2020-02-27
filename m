Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE617223E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 16:28:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7L2f-0005uU-TA; Thu, 27 Feb 2020 15:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/ou=4P=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j7L2e-0005uM-8V
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 15:25:36 +0000
X-Inumbo-ID: 664e97da-5975-11ea-9c17-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 664e97da-5975-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582817136;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k1VeVWdZywBqbmhJfaPXswL2e4SNJ9ZRYA1hFVCy7TI=;
 b=XEOTf7q8+vaFPCLSfpyHi6xyR3cnvD8OYKJQBAmnW6MyKezNXTQEibnq
 AUYOirgoQy9QEVAQswNu/FbJ9X+LhpQmjg+Dk/g/+5o04NwR3Dvw4ZpMj
 yDHbWaDbOKHtzCyubPQ3DxfNR1E5UZV2RwH8ysE1KYfV1ZGb3x4TGHrc1 c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XpAwBlOL2IpvExcri3YTXcxhOmfEzldRs9/VjrBkDnu2OezDgPP3mTTSkEvd7zi2NbJBkH5+/o
 utUjz8KlrI7tM+J5+hhXLiKmZQhE0CIgASEXgr4w8/C7lc8DR6dDDdHC438nz+icsHV2n17U9w
 CJXzxA5b8BCti4/ubUtdOyy5Je08eHqNz5M8KGaqT2zYID0WYQUqeUj/nbh39LIWu8LB8RGHyR
 Wd9tpmDmm2saqKHTX8qPmqw/8XUhZu51uyAlGTB5ajDCn41h6aT78cuij+ZAKIUCruHHwJ8RV+
 2h4=
X-SBRS: 2.7
X-MesageID: 13291466
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13291466"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
 <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
 <cff24d62-e797-ab4a-a6a2-d16e7aff621e@citrix.com>
 <a27cf33b-6326-7461-b390-da675378188c@suse.com>
 <200c36a7-9bdf-8ea9-97c9-a1b4dc9dcfc4@citrix.com>
Message-ID: <dd3eddb0-72ec-e448-ebe1-2edc51b37e9f@citrix.com>
Date: Thu, 27 Feb 2020 15:25:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <200c36a7-9bdf-8ea9-97c9-a1b4dc9dcfc4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDIvMjAyMCAxMjo0NiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjUvMDIvMjAy
MCAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI1LjAyLjIwMjAgMTM6MzcsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMjUvMDIvMjAyMCAxMjoyMiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjEuMDIuMjAyMCAyMDoyNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IE9uIDIxLzAyLzIwMjAgMTY6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMDIu
MjAyMCAxODoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L3N5c2N0bC5jCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4+Pj4+Pj4g
QEAgLTc4LDggKzc4LDExIEBAIHN0YXRpYyB2b2lkIGwzX2NhY2hlX2dldCh2b2lkICphcmcpCj4+
Pj4+Pj4gIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQo+Pj4+Pj4+ICB7Cj4+Pj4+Pj4g
ICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPj4+Pj4+PiAtICAg
IGludCByZXQgPSBjcHVfdXAoY3B1KTsKPj4+Pj4+PiArICAgIGludCByZXQ7Cj4+Pj4+Pj4gIAo+
Pj4+Pj4+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20g
cHJlY2VkaW5nIENQVSBvZmZsaW5lICovCj4+Pj4+Pj4gKyAgICByY3VfYmFycmllcigpOwo+Pj4+
Pj4+ICsgICAgcmV0ID0gY3B1X3VwKGNwdSk7Cj4+Pj4+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJV
U1kgKQo+Pj4+Pj4+ICAgICAgewo+Pj4+Pj4+ICAgICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBS
Q1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8KPj4+Pj4+PiBAQCAtMTA0LDcgKzEwNywx
MSBAQCBsb25nIGNwdV91cF9oZWxwZXIodm9pZCAqZGF0YSkKPj4+Pj4+PiAgbG9uZyBjcHVfZG93
bl9oZWxwZXIodm9pZCAqZGF0YSkKPj4+Pj4+PiAgewo+Pj4+Pj4+ICAgICAgaW50IGNwdSA9ICh1
bnNpZ25lZCBsb25nKWRhdGE7Cj4+Pj4+Pj4gLSAgICBpbnQgcmV0ID0gY3B1X2Rvd24oY3B1KTsK
Pj4+Pj4+PiArICAgIGludCByZXQ7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsgICAgLyogRmx1c2ggcG90
ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20gcHJlY2VkaW5nIENQVSBvbmxpbmUgKi8K
Pj4+Pj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+Pj4+Pj4gKyAgICByZXQgPSBjcHVfZG93bihj
cHUpOwo+Pj4+Pj4+ICAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkKPj4+Pj4+PiAgICAgIHsKPj4+
Pj4+PiAgICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1v
cmUgZ28uICovCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBj
cHVfdXAoKSAvIGNwdV9kb3duKCksIG1vc3Qgbm90YWJseSBpbgo+Pj4+Pj4gY29yZV9wYXJraW5n
LmMuIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtYWtlIHRoZSBiYXJyaWVyIHBhcnQKPj4+Pj4+
IG9mIHRoZSB0d28gZnVuY3Rpb25zPyBUaGlzIHdvdWxkIHRoZSBhbHNvIGNvdmVyIG5vbi14ODYg
aW4KPj4+Pj4+IGNhc2UgYW4gYXJjaCB3YW50cyB0byBzdXBwb3J0IG9mZmxpbmluZy9vbmxpbmlu
ZyBvZiBDUFVzLgo+Pj4+Pgo+Pj4+PiBUaG9zZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBmcm9tIGVh
cmx5IGluaXQgY29kZSBhbmQgcmN1X2JhcnJpZXIoKSBpcwo+Pj4+PiBhbiBleHBlbnNpdmUgb3Bl
cmF0aW9uLiBJIHRoaW5rIGl0J3MgYmV0dGVyIGlmIGNhbGxlciBpcyByZXNwb25zaWJsZQo+Pj4+
PiBmb3Igc3luY2luZyB0aGUgc3RhdGUuIFRoaXMgaXMgdGhlIHJlYXNvbiBJIG1vdmVkIHJjdV9i
YXJyaWVyKCkgaW4gZnJvbnQKPj4+Pj4gb2YgY3B1X3VwL2Rvd24uCj4+Pj4KPj4+PiBXZWxsLCB0
aGVyZSBhcmUgdHdvIGFzcGVjdHMgaGVyZTogT25lIGlzIHRvIGF2b2lkIHRoZSBvdmVyaGVhZCB3
aGVyZQo+Pj4+IGl0J3Mgbm90IG5lZWRlZC4gVGhlIG90aGVyIGlzLCBhcyBvYnNlcnZlZCBvbiB0
aGlzIHBhdGNoLCB0aGF0IGJ5Cj4+Pj4gdGhlIGNob3NlbiBhcHByb2FjaCBjYWxsZXJzIHdoaWNo
IGluIGZhY3QgbmVlZCBhbWVuZGluZyBtYXkgYmUKPj4+PiBmb3Jnb3R0ZW4uIFRvIGZpbmQgbWlk
ZGxlIGdyb3VuZHMsIHBlcmhhcHMgdGhlIHNvbHV0aW9uIGlzIHRvIGhhdmUKPj4+PiB2YXJpYW50
cyBvZiBjcHVfe3VwLGRvd259KCkgd2hpY2ggaW52b2tlIHRoZSBiYXJyaWVyLCBhbmQgd2hpY2gK
Pj4+PiB3b3VsZCBiZSB1c2VkIGJ5IGFsbCBydW50aW1lIGludm9jYXRpb25zPwo+Pj4+Cj4+Pj4g
VGhlIG90aGVyIHF1ZXN0aW9uIG9mIGNvdXJzZSBpcyB3aHkgZWFybHkgaW5pdCBjb2RlIGlzIHNw
ZWNpYWwgaW4KPj4+PiB0aGlzIHJlZ2FyZC4gSWYgaXQgaW5kZWVkIHdhcywgcGVyaGFwcyB0aGUg
YmFycmllciBpbnZvY2F0aW9uIGNvdWxkCj4+Pj4gYWxzbyBiZSB0aWVkIHRvIGNlcnRhaW4gU1lT
X1NUQVRFXyogdmFsdWVzPwo+Pj4KPj4+IEl0J3Mgbm90IHNwZWNpYWwgLSBpbiBmYWN0IGl0IHN0
YXJ0cyBhZnRlciBSQ1UgaXMgaW5pdGlhbGl6ZWQuIFRoZSBpc3N1ZQo+Pj4gaXMsIGFzIHlvdSBz
YWlkLCB1bm5lY2Vzc2FyeSBvdmVyaGVhZC4KPj4KPj4gV2VsbCwgaWYgaXQncyB1bm5lY2Vzc2Fy
eSBvdmVyaGVhZCwgdGhlbiBpdCBpcyBzcGVjaWFsIGluIHNvbWUgd2F5Lgo+PiBBZnRlciBhbGwg
YXQgcnVudGltZSB0aGUgb3ZlcmhlYWQgaXNuJ3QgdW5uZWNlc3NhcnkuIElzIGl0IHBlcmhhcHMK
Pj4ganVzdCB0aGF0IGN1cnJlbnRseSB3ZSBkb24ndCBfaGFwcGVuXyB0byBoYXZlIGFueXRoaW5n
IHRoYXQgd291bGQKPj4gbWFrZSB1c2Ugb2YgYW4gUkNVIGJhcnJpZXIgbmVjZXNzYXJ5IGluIHRo
aXMgY2FzZT8gSW4gd2hpY2ggY2FzZSBpdAo+PiB3b3VsZCBiZSBhIHByb2JsZW0gd2FpdGluZyB0
byBiaXRlIHVzIGRvd24gdGhlIHJvYWQ/Cj4gCj4gSSBhZ3JlZSB0byBhIGNlcnRhaW4gZXh0ZW50
IHRoYXQgaXQgbWlnaHQgYmUgcHJ1ZGVudCB0byBhdm9pZCBzcGVjaWFsCj4gY2FzaW5nIGV2ZW4g
aWYgd2UgY3VycmVudGx5IGtub3cgdGhhdCB0aGUgY2FzZSBpcyBzYWZlLiBMZXQgbWUgc2VlCj4g
aWYgb3ZlcmhlYWQgaXMgdG9sZXJhYmxlIGF0IENQVSBicmluZyB1cCBvbiBvdXIgbGFyZ2VzdCBz
eXN0ZW0gYXZhaWxhYmxlCj4gKDQ0OCBDUFVzKS4KCkkgZGlkbid0IHNlZSBhbnkgc2lnbmlmaWNh
bnQgc2xvd2Rvd24gaW4gYm9vdCBvbiA0NDggQ1BVcyB3aXRoIGxhdGVzdAp2ZXJzaW9uIG9mIFJD
VSBzZXJpZXMgZnJvbSBKdWVyZ2VuLiBXaWxsIHNlbmQgdjMgc2hvcnRseS4KCklnb3IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
