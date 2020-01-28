Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F225614BF4A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 19:11:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwVIy-0000f4-FV; Tue, 28 Jan 2020 18:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4m8=3R=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iwVIw-0000ex-U4
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 18:09:38 +0000
X-Inumbo-ID: 587dd01e-41f9-11ea-a933-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 587dd01e-41f9-11ea-a933-bc764e2007e4;
 Tue, 28 Jan 2020 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580234978;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hFEhuHJYovU22xMpePtXGxSpgZrPeP2TS1ud7uS5vy4=;
 b=ZugxPKJKxTiu/a/DYKX0oCwUh7L6lhnaXw3M620rC8Me/j18tTeQUZJg
 GZo/B8w7UZN9qAJAgdsx5PcMcdW6lvUJqMAVDFHAGRwVb+NbznRxQcEZ4
 R0nsLQMw+Yw1nQtskshfQpl1mF0b1MOb4skbeX0OeTy6pk4vFrD7qEWQ0 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OwRD3ZjxvoOklfy6X5cjEZHeCJ3/ySM2FCIxZ/KyCZdVcoJyS4goZ7s+bZGBWJOuysVNjN9cTb
 FmnJZdzg72w/u3SA3eU/9F5Devu77i+Nb0iBap+IMrI8samQiXod8qjwI9dri4GL7RroQ1ADaL
 e6NxLAUyEjFnEhEYs8Qw/K4bWM0UirC4ka2wvlfm5AMkWklpjyqAmtgKwBdZwG70moKaQcgmff
 y2CVjzkvHV1EQ+ZDXBWr34k2E4rJ1UzX5F/xV5FXpwGuzKhP5rL+xw9mfQNICTwZnV/aU+Jwjl
 SG0=
X-SBRS: 2.7
X-MesageID: 11583712
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11583712"
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <1580151370-6409-1-git-send-email-igor.druzhinin@citrix.com>
 <1c217bdf-b94d-d320-4254-85e786d38e0c@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c4365740-57d1-9e60-97c8-48cc0355594f@citrix.com>
Date: Tue, 28 Jan 2020 18:09:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c217bdf-b94d-d320-4254-85e786d38e0c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] RCU: reimplement RCU barrier to avoid
 deadlock
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDEvMjAyMCAwOTozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI3LzAxLzIwMjAg
MTg6NTYsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBUaGUgZXhpc3RpbmcgUkNVIGJhcnJpZXIg
aW1wbGVtZW50YXRpb24gaXMgcHJvbmUgdG8gYSBkZWFkbG9jayBzY2VuYXJpbwo+PiBkdWUgdG8g
SVJRcyBiZWluZyByZS1lbmFibGVkIGluc2lkZSBzdG9wbWFjaGluZSBjb250ZXh0LiBJZiBkdWUg
dG8gYSByYWNlCj4+IElSUXMgYXJlIHJlLWVuYWJsZWQgb24gc29tZSBvZiBDUFVzIGFuZCBzb2Z0
aXJxcyBhcmUgYWxsb3dlZCB0byBiZQo+PiBwcm9jZXNzZWQgaW4gc3RvcG1hY2hpbmUsIGkuZS4g
d2hhdCBjdXJyZW50bHkgaGFwcGVucyBpbiByY3VfYmFycmllcigpLAo+PiB0aW1lciBpbnRlcnJ1
cHQgaXMgYWJsZSB0byBpbnZva2UgVFNDIHN5bmNocm9uaXphdGlvbiByZW5kZXp2b3VzLgo+PiBB
dCB0aGlzIG1vbWVudCBzZW5kaW5nIFRTQyBzeW5jaHJvbml6YXRpb24gSVBJIHdpbGwgc3RhbGwg
d2FpdGluZyBmb3IKPj4gb3RoZXIgQ1BVcyB0byBzeW5jaHJvbml6ZSB3aGlsZSB0aGV5IGluIHR1
cm4gYXJlIHdhaXRpbmcgaW4gc3RvcG1hY2hpbmUKPj4gYnVzeSBsb29wIHdpdGggSVJRcyBkaXNh
YmxlZC4KPj4KPj4gVG8gYXZvaWQgdGhlIHNjZW5hcmlvIGFib3ZlIC0gcmVpbXBsZW1lbnQgcmN1
X2JhcnJpZXIoKSBpbiBhIHdheSB3aGVyZQo+PiBJUlFzIGFyZSBub3QgYmVpbmcgZGlzYWJsZWQg
YXQgYW55IG1vbWVudC4gVGhlIHByb3Bvc2VkIGltcGxlbWVudGF0aW9uCj4+IGlzIGp1c3QgYSBz
aW1wbGlmaWVkIGFuZCBzcGVjaWFsaXplZCB2ZXJzaW9uIG9mIHN0b3BtYWNoaW5lLiBUaGUgc2Vt
YW50aWMKPj4gb2YgdGhlIGNhbGwgaXMgcHJlc2VydmVkLgo+IHN0b3BfbWFjaGluZV9ydW4oKSBp
cyB1c2VkIGluIGEgZmV3IHBsYWNlcyB3aXRoaW4gWGVuLiBXaHkgaXMgdGhpcyBhIHByb2JsZW0g
Zm9yIHJjdV9iYXJyaWVyKCkgYW5kIG5vdCBmb3IgdGhlIG90aGVyIGNhbGxlcnM/CgpJdCdzIHRy
dWUgdGhhdCBzb21lIG9mIHRoZW0gZG8gcmUtZW5hYmxlIGludGVycnVwdHMgKF9fY3B1X2Rpc2Fi
bGUpLgpUaGUgcmVhc29uIHRoZXkgYXJlIG5vdCBwcm9uZSB0byB0aGUgZGVzY3JpYmVkIGlzc3Vl
IGlzIHRoYXQgY3VycmVudGx5CnRoZXJlIGlzIG5vLCBsaWtlbHksIGludGVycnVwdCBoYW5kbGVy
IHRoYXQgbWlnaHQgbG9ja3VwIHRoZSBzeXN0ZW0uCk5ldmVydGhlbGVzcywgdGhlcmUgYXJlIHNv
ZnRpcnEgaGFuZGxlcnMgdGhhdCBkbyB0aGlzIChUU0Mgc3luYykgYW5kCnJjdV9iYXJyaWVyKCkg
aGFzIHRvIGNhbGwgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkgaW5zaWRlIHN0b3BtYWNoaW5l
CmNvbnRleHQgZHVlIHRvIHRoZSBuYXR1cmUgb2YgaXRzIGltcGxlbWVudGF0aW9uLgoKPj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+
IC0tLQo+PiBUaGlzIGNoYW5nZSBoYXMgYmVlbiBzdHJlc3MgdGVzdGVkIGJ5IGRvaW5nIGFjdGlv
bnMgaW52b2tpbmcgcmN1X2JhcnJpZXIoKQo+PiBmdW5jdGlvbmFsaXR5IGFuZCBkaWRuJ3Qgc2hv
dyBhbnkgaXNzdWVzLgo+PiAtLS0KPj4gwqAgeGVuL2NvbW1vbi9yY3VwZGF0ZS5jIHwgMzYgKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vcmN1cGRhdGUuYyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwo+PiBpbmRleCBjYjcxMmM4
Li45NWExZjg1IDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPj4gKysrIGIv
eGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4+IEBAIC0xNDUsNiArMTQ1LDkgQEAgc3RydWN0IHJjdV9i
YXJyaWVyX2RhdGEgewo+PiDCoMKgwqDCoMKgIGF0b21pY190ICpjcHVfY291bnQ7Cj4+IMKgIH07
Cj4+IMKgICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHRhc2tsZXQsIHJjdV9iYXJyaWVy
X3Rhc2tsZXQpOwo+PiArc3RhdGljIGF0b21pY190IHJjdV9iYXJyaWVyX2NwdV9jb3VudCwgcmN1
X2JhcnJpZXJfY3B1X2RvbmU7Cj4+ICsKPj4gwqAgc3RhdGljIHZvaWQgcmN1X2JhcnJpZXJfY2Fs
bGJhY2soc3RydWN0IHJjdV9oZWFkICpoZWFkKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0
IHJjdV9iYXJyaWVyX2RhdGEgKmRhdGEgPSBjb250YWluZXJfb2YoCj4+IEBAIC0xNTIsMTIgKzE1
NSw5IEBAIHN0YXRpYyB2b2lkIHJjdV9iYXJyaWVyX2NhbGxiYWNrKHN0cnVjdCByY3VfaGVhZCAq
aGVhZCkKPj4gwqDCoMKgwqDCoCBhdG9taWNfaW5jKGRhdGEtPmNwdV9jb3VudCk7Cj4+IMKgIH0K
Pj4gwqAgLXN0YXRpYyBpbnQgcmN1X2JhcnJpZXJfYWN0aW9uKHZvaWQgKl9jcHVfY291bnQpCj4+
ICtzdGF0aWMgdm9pZCByY3VfYmFycmllcl9hY3Rpb24odm9pZCAqdW51c2VkKQo+PiDCoCB7Cj4+
IC3CoMKgwqAgc3RydWN0IHJjdV9iYXJyaWVyX2RhdGEgZGF0YSA9IHsgLmNwdV9jb3VudCA9IF9j
cHVfY291bnQgfTsKPj4gLQo+PiAtwqDCoMKgIEFTU0VSVCghbG9jYWxfaXJxX2lzX2VuYWJsZWQo
KSk7Cj4+IC3CoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+PiArwqDCoMKgIHN0cnVjdCByY3Vf
YmFycmllcl9kYXRhIGRhdGEgPSB7IC5jcHVfY291bnQgPSAmcmN1X2JhcnJpZXJfY3B1X2NvdW50
IH07Cj4+IMKgIMKgwqDCoMKgwqAgLyoKPj4gwqDCoMKgwqDCoMKgICogV2hlbiBjYWxsYmFjayBp
cyBleGVjdXRlZCwgYWxsIHByZXZpb3VzbHktcXVldWVkIFJDVSB3b3JrIG9uIHRoaXMgQ1BVCj4+
IEBAIC0xNzIsMTUgKzE3MiwzMCBAQCBzdGF0aWMgaW50IHJjdV9iYXJyaWVyX2FjdGlvbih2b2lk
ICpfY3B1X2NvdW50KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1X3JlbGF4KCk7Cj4+IMKgwqDC
oMKgwqAgfQo+PiDCoCAtwqDCoMKgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4+IC0KPj4gLcKgwqDC
oCByZXR1cm4gMDsKPj4gK8KgwqDCoCBhdG9taWNfaW5jKCZyY3VfYmFycmllcl9jcHVfZG9uZSk7
Cj4+IMKgIH0KPj4gwqAgwqAgaW50IHJjdV9iYXJyaWVyKHZvaWQpCj4+IMKgIHsKPiAKPiBzdG9w
X21hY2hpbmVfcnVuKCkgcmVxdWlyZXMgdGhlIGludGVycnVwdHMgdG8gYmUgZW5hYmxlZCB3aGVu
IGNhbGxlZC4gSXMgdGhpcyByZXF1aXJlbWVudCBzdGlsbCB0aGUgc2FtZSBoZXJlPyBJZiBzbywg
Y2FuIHdlIGRvY3VtZW50IGl0IGFuZCBhZGQgYW4gQVNTRVJUPwoKU3VyZSwgd2lsbCBhZGQuCgo+
PiAtwqDCoMKgIGF0b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+PiAtwqDCoMKg
IHJldHVybiBzdG9wX21hY2hpbmVfcnVuKHJjdV9iYXJyaWVyX2FjdGlvbiwgJmNwdV9jb3VudCwg
TlJfQ1BVUyk7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gK8KgwqDCoCBpZiAo
ICFnZXRfY3B1X21hcHMoKSApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVCVVNZOwo+IAo+
IEkgcmVhbGl6ZSB0aGlzIGlzIGFsc28gcHJlc2VudCBpbiB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbi4gSG93ZXZlciwgbm9ib2R5IHNlZW1zIHRvIGNoZWNrIHRoZSByZXR1cm4gb2YgdGhlIGJh
cnJpZXIuIFdoYXQgd291bGQgaGFwcGVuIGlmIHlvdSBjb250aW51ZSB3aXRob3V0IHN5bmNocm9u
aXppbmcgdGhlIFJDVT8KClByb2JhYmx5IGEgY3Jhc2gsIGFzIGZyb20gd2hhdCBJIHNhdyB0aGUg
ZXhpc3RpbmcgY2FsbGVycyByZWx5IG9uIGl0CmZpbmlzaGluZyB0aGUgdGFzay4gSSBlaXRoZXIg
bmVlZCB0byBjaGFuZ2UgdGhlIHNlbWFudGljcyBvZiB0aGUgY2FsbApvciBmaXggdXAgdGhlIGNh
bGxlcnMgdGhhdCBtaWdodCBiZSBhZmZlY3RlZC4gSSdkIHByZWZlciB0byBkbwp0aGUgbGF0dGVy
IGluIGEgZm9sbG93IHVwIHBhdGNoLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
