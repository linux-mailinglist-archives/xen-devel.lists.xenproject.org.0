Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30983176763
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 23:32:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8tZD-0003x0-Fc; Mon, 02 Mar 2020 22:29:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=McR1=4T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j8tZC-0003wv-5q
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 22:29:38 +0000
X-Inumbo-ID: 4c54aa96-5cd5-11ea-a01d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c54aa96-5cd5-11ea-a01d-12813bfff9fa;
 Mon, 02 Mar 2020 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583188177;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xtimE8bXD9eyb7L3SAds6Ky7K6HtWBpoI1mHEJKHJ94=;
 b=OMI/MhGP+TNbwtLYpSSpklWJO8v4MKDwFjG64c8wS+jKsrKFi5CdsXdm
 DbHr9HE6u9XI3ApAalZy9CHSY0tnge9DgNTffWythM0Lg0CU8eQo/emrc
 GadEdOLY/6LdbFbwrhJThZZ/2tToE2xyeYYL4nuZ9xGkCT63mf1thzlWl k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W5toP3rE/9R/8ydV77F5tBx/02rI7XFl8F9o7QMYnAAw4SP4A8DO+j1GrFqrVE7ah3gvQQzvPM
 Maqw89vrC26uM2sF8+ztvRM/i5uesA0rFGAToFL4MAlgL62tid1nKIVY5Ak5FH9RUI1yPDdTgA
 OwpwUK67zaB/Tu5q9i7dJqj6cKn7x9XOpiCz5j6cHFPo3cgvIS+lRkLg0gxOi7pZF0ABvmu3NW
 gbhjpm/mcONzwT6HuOGPhbFdgihPpm/7nBU/vl9iLm6syTtFPhmAQHl5d3TfRsCql2jWkI1IxV
 XXA=
X-SBRS: 2.7
X-MesageID: 13644951
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,508,1574139600"; d="scan'208";a="13644951"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
 <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
 <cc39b5ca-03a1-cfde-5d81-29ca27c2b5a2@citrix.com>
 <397d7d26-8ed8-82f0-6aa0-37c0a8537fdd@suse.com>
 <fc17fb5e-0351-8a87-6f77-61bf29b4c877@citrix.com>
 <1e245b89-d3cc-d8c7-c783-1fcc04eab411@suse.com>
 <c29bb636-a7d8-3bf0-ae59-f10a274a9238@citrix.com>
 <b287c3f5-4819-c6eb-6c77-dcb9cc5d5335@suse.com>
 <4339d7ac-2e78-1104-b2bd-d058a1f226bf@citrix.com>
 <0177885e-6718-9519-aab7-b38a3dd5b4ec@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <d03e6ec3-ab7c-e56b-fd37-27c198ab2db0@citrix.com>
Date: Mon, 2 Mar 2020 22:29:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0177885e-6718-9519-aab7-b38a3dd5b4ec@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDMvMjAyMCAxNDozMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMi4wMy4yMCAx
NToyMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDAyLzAzLzIwMjAgMTQ6MDMsIErDvHJn
ZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAwMi4wMy4yMCAxNDoyNSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gT24gMjgvMDIvMjAyMCAwNzoxMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4K
Pj4+Pj4gSSB0aGluayB5b3UgYXJlIGp1c3QgbmFycm93aW5nIHRoZSB3aW5kb3cgb2YgdGhlIHJh
Y2U6Cj4+Pj4+Cj4+Pj4+IEl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGhhdmUgdHdvIGNwdXMgZW50
ZXJpbmcgcmN1X2JhcnJpZXIoKSBhbmQgdG8KPj4+Pj4gbWFrZSBpdCBpbnRvIHRoZSBpZiAoICFp
bml0aWFsICkgY2xhdXNlLgo+Pj4+Pgo+Pj4+PiBJbnN0ZWFkIG9mIGludHJvZHVjaW5nIGFub3Ro
ZXIgYXRvbWljIEkgYmVsaWV2ZSB0aGUgZm9sbG93aW5nIHBhdGNoCj4+Pj4+IGluc3RlYWQgb2Yg
eW91cnMgc2hvdWxkIGRvIGl0Ogo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9y
Y3VwZGF0ZS5jIGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4+Pj4+IGluZGV4IGU2YWRkMGIxMjAu
LjBkNTQ2OWEzMjYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vcmN1cGRhdGUuYwo+Pj4+
PiArKysgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPj4+Pj4gQEAgLTE4MCwyMyArMTgwLDE3IEBA
IHN0YXRpYyB2b2lkIHJjdV9iYXJyaWVyX2FjdGlvbih2b2lkKQo+Pj4+Pgo+Pj4+PiDCoMKgwqB2
b2lkIHJjdV9iYXJyaWVyKHZvaWQpCj4+Pj4+IMKgwqDCoHsKPj4+Pj4gLcKgwqDCoCBpbnQgaW5p
dGlhbCA9IGF0b21pY19yZWFkKCZjcHVfY291bnQpOwo+Pj4+PiAtCj4+Pj4+IMKgwqDCoMKgwqDC
oCB3aGlsZSAoICFnZXRfY3B1X21hcHMoKSApCj4+Pj4+IMKgwqDCoMKgwqDCoCB7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwo+Pj4+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKCBpbml0aWFsICYmICFhdG9taWNfcmVhZCgmY3B1X2NvdW50KSApCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICFhdG9taWNfcmVhZCgmY3B1X2NvdW50KSApCj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+Pgo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjcHVfcmVsYXgoKTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGluaXRpYWwg
PSBhdG9taWNfcmVhZCgmY3B1X2NvdW50KTsKPj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4KPj4+
Pj4gLcKgwqDCoCBpZiAoICFpbml0aWFsICkKPj4+Pj4gLcKgwqDCoCB7Cj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBhdG9taWNfc2V0KCZjcHVfY291bnQsIG51bV9vbmxpbmVfY3B1cygpKTsKPj4+Pj4g
K8KgwqDCoCBpZiAoIGF0b21pY19jbXB4Y2hnKCZjcHVfY291bnQsIDAsIG51bV9vbmxpbmVfY3B1
cygpKSA9PSAwICkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1bWFza19yYWlzZV9zb2Z0
aXJxKCZjcHVfb25saW5lX21hcCwgUkNVX1NPRlRJUlEpOwo+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4K
Pj4+Pj4gwqDCoMKgwqDCoMKgIHdoaWxlICggYXRvbWljX3JlYWQoJmNwdV9jb3VudCkgKQo+Pj4+
PiDCoMKgwqDCoMKgwqAgewo+Pj4+Pgo+Pj4+PiBDb3VsZCB5b3UgZ2l2ZSB0aGF0IGEgdHJ5LCBw
bGVhc2U/Cj4+Pj4KPj4+PiBXaXRoIHRoaXMgcGF0Y2ggSSBjYW5ub3QgZGlzYWJsZSBTTVQgYXQg
YWxsLgo+Pj4+Cj4+Pj4gVGhlIHByb2JsZW0gdGhhdCBteSBkaWZmIHNvbHZlZCB3YXMgYSByYWNl
IGJldHdlZW4gMiBjb25zZWN1dGl2ZQo+Pj4+IHJjdV9iYXJyaWVyIG9wZXJhdGlvbnMgb24gQ1BV
MCAodGhlIHBhdHRlcm4gc3BlY2lmaWMgdG8gU01ULW9uL29mZgo+Pj4+IG9wZXJhdGlvbikgd2hl
cmUgc29tZSBDUFVzIGRpZG4ndCBleGl0IHRoZSBjcHVfY291bnQgY2hlY2tpbmcgbG9vcAo+Pj4+
IGNvbXBsZXRlbHkgYnV0IGNwdV9jb3VudCBpcyBhbHJlYWR5IHJlaW5pdGlhbGl6ZWQgb24gQ1BV
MCAtIHRoaXMKPj4+PiByZXN1bHRzIGluIHNvbWUgQ1BVcyBiZWluZyBzdHVjayBpbiB0aGUgbG9v
cC4KPj4+Cj4+PiBBaCwgb2theSwgdGhlbiBJIGJlbGlldmUgYSBjb21iaW5hdGlvbiBvZiB0aGUg
dHdvIHBhdGNoZXMgaXMgbmVlZGVkLgo+Pj4KPj4+IFNvbWV0aGluZyBsaWtlIHRoZSBhdHRhY2hl
ZCB2ZXJzaW9uPwo+Pgo+PiBJIGFwb2xvZ2llcyAtIG15IHByZXZpb3VzIHRlc3QgcmVzdWx0IHdh
cyBmcm9tIG1hY2hpbmUgYm9vdGVkIGluIGNvcmUgbW9kZS4KPj4gSSdtIG5vdyB0ZXN0aW5nIGl0
IHByb3Blcmx5IGFuZCB0aGUgb3JpZ2luYWwgcGF0Y2ggc2VlbXMgdG8gZG8gdGhlIHRyaWNrIGJ1
dAo+PiBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgaG93IHlvdSBjYW4gYXZvaWQgdGhlIHJhY2Ug
d2l0aCBvbmx5IDEgY291bnRlciAtCj4+IGl0J3MgYWx3YXlzIHBvc3NpYmxlIHRoYXQgQ1BVMSBp
cyBzdGlsbCBpbiBjcHVfY291bnQgY2hlY2tpbmcgbG9vcCAoZXZlbiBpZgo+PiBjcHVfY291bnQg
aXMgY3VycmVudGx5IDApIHdoZW4gY3B1X2NvdW50IGlzIHJlaW5pdGlhbGl6ZWQuCj4gCj4gSSBn
dWVzcyB0aGlzIGlzIHZlcnkgdmVyeSB1bmxpa2VseS4KPiAKPj4gSSdtIGxvb2tpbmcgYXQgeW91
ciBjdXJyZW50IHZlcnNpb24gbm93LiBXYXMgdGhlIHJlbW92YWwgb2YgZ2V0X2NwdV9tYXBzKCkK
Pj4gYW5kIHJlY3Vyc2lvbiBwcm90ZWN0aW9uIGludGVudGlvbmFsPyBJIHN1c3BlY3QgaXQgd291
bGQgb25seSB3b3JrIG9uIHRoZQo+PiBsYXRlc3QgbWFzdGVyIHNvIEkgbmVlZCB0byBrZWVwIHRo
b3NlIGZvciA0LjEzIHRlc3RpbmcuCj4gCj4gT2gsIHNvcnJ5LCB0aGlzIHNlZW1zIHRvIGJlIGFu
IG9sZCB2ZXJzaW9uLgo+IAo+IEhlcmUgY29tZXMgdGhlIGNvcnJlY3Qgb25lLgoKSSBjaGVja2Vk
IHRoaXMgdmVyc2lvbiBhbmQgaXQncyBzdXBwb3NlZCB0byBiZSBmaW5lIGZvciB2MyBJIGd1ZXNz
LiBIb3dldmVyLApJIHdhc24ndCBhYmxlIHRvIGNoZWNrIGhvdyB3ZWxsIGl0IHdvdWxkIHdvcmsg
aW4gY29yZSBtb2RlIHRob3VnaCBhcyBDUFUgaG90IG9mZgppcyBnZW5lcmFsbHkgYnJva2VuIGlu
IGl0IG5vdyAoYXQgbGVhc3QgaXQgYm9vdHMgaW4gY29yZSBtb2RlIHdpdGggcmN1X2JhcnJpZXIK
Y2FsbGVkIG9uIENQVSBicmluZy11cCkuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
