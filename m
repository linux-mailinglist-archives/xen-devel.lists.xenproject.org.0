Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D785175CFF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8lyy-00050U-7U; Mon, 02 Mar 2020 14:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=McR1=4T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j8lyw-00050P-HU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:23:42 +0000
X-Inumbo-ID: 6993cae1-5c91-11ea-9f81-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6993cae1-5c91-11ea-9f81-12813bfff9fa;
 Mon, 02 Mar 2020 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583159021;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9dTXTvJBNpOVepHjXq1f+P4rwfSOHeaz0qFZk+2hgG8=;
 b=BTl7xM62SbikoYzFBEMJQ/Vfm8q+BVdOYAkO5aAfS+CQK59Ykubf5wQJ
 T/cjd0/ISyfJhAboXHJYdlZINLwpsSniZhAhgFBRrh3VUesQySoJwH6Je
 n0blOfb3Pl3YfZKf5qwokwfiJx6YfKWlG5Zttwj57OdI04EilFi9sdYKC Q=;
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
IronPort-SDR: 4CIkLfW520KEAs75K1BhLtigMJpUVB7fsk3kS6m/C+0benbOMmpOJYJVS5HcKirrMw0dRIhdhX
 qMRs9XCT2o6QcpdzraPSieI8DzO/0TAVRnqmvO3Ksc80MJnDdkqinTXK4gj+2Own++T5FMTQAD
 y3/GlGL8/C6s5VoXrbBhmE+lNyQgJuzYlShbYHZYKhXnyqHzr8XL/0s0RqueKXvhGke5ociqWv
 kQ1Use29wEOxCviq49lW4uE5RbNAjYLU/Fe/pE4NN2HT/BmJOsy1qjuAtAvEbF+KFXFM4cP7ZZ
 7jM=
X-SBRS: 2.7
X-MesageID: 13276990
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13276990"
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
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4339d7ac-2e78-1104-b2bd-d058a1f226bf@citrix.com>
Date: Mon, 2 Mar 2020 14:23:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b287c3f5-4819-c6eb-6c77-dcb9cc5d5335@suse.com>
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

T24gMDIvMDMvMjAyMCAxNDowMywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMi4wMy4yMCAx
NDoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDI4LzAyLzIwMjAgMDc6MTAsIErDvHJn
ZW4gR3Jvw58gd3JvdGU6Cj4+Pgo+Pj4gSSB0aGluayB5b3UgYXJlIGp1c3QgbmFycm93aW5nIHRo
ZSB3aW5kb3cgb2YgdGhlIHJhY2U6Cj4+Pgo+Pj4gSXQgaXMgc3RpbGwgcG9zc2libGUgdG8gaGF2
ZSB0d28gY3B1cyBlbnRlcmluZyByY3VfYmFycmllcigpIGFuZCB0bwo+Pj4gbWFrZSBpdCBpbnRv
IHRoZSBpZiAoICFpbml0aWFsICkgY2xhdXNlLgo+Pj4KPj4+IEluc3RlYWQgb2YgaW50cm9kdWNp
bmcgYW5vdGhlciBhdG9taWMgSSBiZWxpZXZlIHRoZSBmb2xsb3dpbmcgcGF0Y2gKPj4+IGluc3Rl
YWQgb2YgeW91cnMgc2hvdWxkIGRvIGl0Ogo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L3JjdXBkYXRlLmMgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPj4+IGluZGV4IGU2YWRkMGIxMjAu
LjBkNTQ2OWEzMjYgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPj4+ICsr
KyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwo+Pj4gQEAgLTE4MCwyMyArMTgwLDE3IEBAIHN0YXRp
YyB2b2lkIHJjdV9iYXJyaWVyX2FjdGlvbih2b2lkKQo+Pj4KPj4+IMKgwqB2b2lkIHJjdV9iYXJy
aWVyKHZvaWQpCj4+PiDCoMKgewo+Pj4gLcKgwqDCoCBpbnQgaW5pdGlhbCA9IGF0b21pY19yZWFk
KCZjcHVfY291bnQpOwo+Pj4gLQo+Pj4gwqDCoMKgwqDCoCB3aGlsZSAoICFnZXRfY3B1X21hcHMo
KSApCj4+PiDCoMKgwqDCoMKgIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRp
bmdfc29mdGlycXMoKTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIGluaXRpYWwgJiYgIWF0b21p
Y19yZWFkKCZjcHVfY291bnQpICkKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICFhdG9taWNfcmVh
ZCgmY3B1X2NvdW50KSApCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+
Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNwdV9yZWxheCgpOwo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGluaXRpYWwgPSBhdG9taWNfcmVhZCgmY3B1X2NvdW50KTsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4K
Pj4+IC3CoMKgwqAgaWYgKCAhaW5pdGlhbCApCj4+PiAtwqDCoMKgIHsKPj4+IC3CoMKgwqDCoMKg
wqDCoCBhdG9taWNfc2V0KCZjcHVfY291bnQsIG51bV9vbmxpbmVfY3B1cygpKTsKPj4+ICvCoMKg
wqAgaWYgKCBhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBudW1fb25saW5lX2NwdXMoKSkg
PT0gMCApCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKCZjcHVf
b25saW5lX21hcCwgUkNVX1NPRlRJUlEpOwo+Pj4gLcKgwqDCoCB9Cj4+Pgo+Pj4gwqDCoMKgwqDC
oCB3aGlsZSAoIGF0b21pY19yZWFkKCZjcHVfY291bnQpICkKPj4+IMKgwqDCoMKgwqAgewo+Pj4K
Pj4+IENvdWxkIHlvdSBnaXZlIHRoYXQgYSB0cnksIHBsZWFzZT8KPj4KPj4gV2l0aCB0aGlzIHBh
dGNoIEkgY2Fubm90IGRpc2FibGUgU01UIGF0IGFsbC4KPj4KPj4gVGhlIHByb2JsZW0gdGhhdCBt
eSBkaWZmIHNvbHZlZCB3YXMgYSByYWNlIGJldHdlZW4gMiBjb25zZWN1dGl2ZQo+PiByY3VfYmFy
cmllciBvcGVyYXRpb25zIG9uIENQVTAgKHRoZSBwYXR0ZXJuIHNwZWNpZmljIHRvIFNNVC1vbi9v
ZmYKPj4gb3BlcmF0aW9uKSB3aGVyZSBzb21lIENQVXMgZGlkbid0IGV4aXQgdGhlIGNwdV9jb3Vu
dCBjaGVja2luZyBsb29wCj4+IGNvbXBsZXRlbHkgYnV0IGNwdV9jb3VudCBpcyBhbHJlYWR5IHJl
aW5pdGlhbGl6ZWQgb24gQ1BVMCAtIHRoaXMKPj4gcmVzdWx0cyBpbiBzb21lIENQVXMgYmVpbmcg
c3R1Y2sgaW4gdGhlIGxvb3AuCj4gCj4gQWgsIG9rYXksIHRoZW4gSSBiZWxpZXZlIGEgY29tYmlu
YXRpb24gb2YgdGhlIHR3byBwYXRjaGVzIGlzIG5lZWRlZC4KPiAKPiBTb21ldGhpbmcgbGlrZSB0
aGUgYXR0YWNoZWQgdmVyc2lvbj8KCkkgYXBvbG9naWVzIC0gbXkgcHJldmlvdXMgdGVzdCByZXN1
bHQgd2FzIGZyb20gbWFjaGluZSBib290ZWQgaW4gY29yZSBtb2RlLgpJJ20gbm93IHRlc3Rpbmcg
aXQgcHJvcGVybHkgYW5kIHRoZSBvcmlnaW5hbCBwYXRjaCBzZWVtcyB0byBkbyB0aGUgdHJpY2sg
YnV0Ckkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBob3cgeW91IGNhbiBhdm9pZCB0aGUgcmFjZSB3
aXRoIG9ubHkgMSBjb3VudGVyIC0gCml0J3MgYWx3YXlzIHBvc3NpYmxlIHRoYXQgQ1BVMSBpcyBz
dGlsbCBpbiBjcHVfY291bnQgY2hlY2tpbmcgbG9vcCAoZXZlbiBpZgpjcHVfY291bnQgaXMgY3Vy
cmVudGx5IDApIHdoZW4gY3B1X2NvdW50IGlzIHJlaW5pdGlhbGl6ZWQuCgpJJ20gbG9va2luZyBh
dCB5b3VyIGN1cnJlbnQgdmVyc2lvbiBub3cuIFdhcyB0aGUgcmVtb3ZhbCBvZiBnZXRfY3B1X21h
cHMoKQphbmQgcmVjdXJzaW9uIHByb3RlY3Rpb24gaW50ZW50aW9uYWw/IEkgc3VzcGVjdCBpdCB3
b3VsZCBvbmx5IHdvcmsgb24gdGhlCmxhdGVzdCBtYXN0ZXIgc28gSSBuZWVkIHRvIGtlZXAgdGhv
c2UgZm9yIDQuMTMgdGVzdGluZy4KCklnb3IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
