Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7D234E83
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:13:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCyf-00075f-TQ; Tue, 04 Jun 2019 17:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYCye-00075Y-2j
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:12:00 +0000
X-Inumbo-ID: daf719d4-86eb-11e9-80d1-eb3ee10c26f0
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf719d4-86eb-11e9-80d1-eb3ee10c26f0;
 Tue, 04 Jun 2019 17:11:56 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: OCoLR+xMucLtpybD91Nz+fS/ZZHYHfQEWPuCQ/C8PW3vLkAg7a7Ja5fsbiYBRef8vftAeU8i4j
 ExbnLirWTj8kcI6GOI2OjZ7FpnIoq6q2R9tBHHysMkkVT+xptV7JWZrjmHJ/+44ANa85g2YQnf
 aS2o4t7Dc0AZtUWNI0GufRTnz4Lg9/19Ju/jQCrtjinyhwbBsYrGUT+HOblAww6b8Lw9LucfVT
 Rq0Ql4KSwUy1gaOriM6zaOFNQPpyCjyjZ0J0cVKYe+KVT0s0JQUlwyhvqwtBFZMy3r+xQvhJrz
 Z9A=
X-SBRS: 2.7
X-MesageID: 1284639
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1284639"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.42555.428964.824573@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:11:23 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-5-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-5-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/9] libxl_internal: Create new lock for
 devices hotplug via QMP
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDQvOV0gbGlieGxfaW50ZXJuYWw6IENyZWF0
ZSBuZXcgbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAiKToKPiBUaGUgY3VycmVudCBs
b2NrIGBkb21haW5fdXNlcmRhdGFfbG9jaycgY2FuJ3QgYmUgdXNlZCB3aGVuIG1vZGlmaWNhdGlv
bgo+IHRvIGEgZ3Vlc3QgaXMgZG9uZSBieSBzZW5kaW5nIGNvbW1hbmQgdG8gUUVNVSwgdGhpcyBp
cyBhIHNsb3cgcHJvY2Vzcwo+IGFuZCByZXF1aXJlcyB0byBjYWxsIENUWF9VTkxPQ0ssIHdoaWNo
IGlzIG5vdCBwb3NzaWJsZSB3aGlsZSBob2xkaW5nCj4gdGhlIGBkb21haW5fdXNlcmRhdGFfbG9j
aycuCi4uLgo+ICtzdHJ1Y3QgbGlieGxfX2RvbWFpbl9xbXBfbG9jayB7Cj4gKyAgICBsaWJ4bF9f
Z2VuZXJpY19sb2NrIGxvY2s7Cj4gK307Cj4gKwo+ICtsaWJ4bF9fZG9tYWluX3FtcF9sb2NrICps
aWJ4bF9fbG9ja19kb21haW5fcW1wKGxpYnhsX19nYyAqZ2MsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9taWQgZG9taWQpCj4gK3sKPiAr
ICAgIGxpYnhsX19kb21haW5fcW1wX2xvY2sgKmxvY2sgPSBOVUxMOwo+ICsgICAgaW50IHJjOwo+
ICsKPiArICAgIGxvY2sgPSBsaWJ4bF9femFsbG9jKE5PR0MsIHNpemVvZigqbG9jaykpOwo+ICsg
ICAgcmMgPSBsaWJ4bF9fbG9ja19nZW5lcmljKGdjLCBkb21pZCwgJmxvY2stPmxvY2ssCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgImxpYnhsLWRldmljZS1jaGFuZ2VzLWxvY2siKTsK
PiArICAgIGlmIChyYykgewo+ICsgICAgICAgIGxpYnhsX191bmxvY2tfZG9tYWluX3FtcChsb2Nr
KTsKPiArICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gbG9j
azsKClRoaXMgaXMgYWxtb3N0IGlkZW50aWNhbCB0byB0aGUgbGlieGxfX2xvY2tfZG9tYWluX3Vz
ZXJkYXRhIHdoaWNoCmFwcGVhcmVkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gIFRoYXQgc3VnZ2Vz
dHMgdGhhdCB0aGUgZmFjdG9yaXNhdGlvbgpoZXJlIGlzIGF0IHRoZSB3cm9uZyBsYXllci4KCj4g
K3ZvaWQgbGlieGxfX3VubG9ja19kb21haW5fcW1wKGxpYnhsX19kb21haW5fcW1wX2xvY2sgKmxv
Y2spCj4gK3sKPiArICAgIGxpYnhsX191bmxvY2tfZ2VuZXJpYygmbG9jay0+bG9jayk7Cj4gKyAg
ICBmcmVlKGxvY2spOwo+ICt9CgpUaGlzIGlzIGNvbXBsZXRlbHkgaWRlbnRpY2FsIHRvIGxpYnhs
X191bmxvY2tfZG9tYWluX3VzZXJkYXRhLiAgVGhlCm9ubHkgcmVhc29uIHdlIGhhdmUgdG8gdHdv
IG9mIHRoZXNlIGlzIHNvIHRoYXQgdGhlIHR3byBsb2NrcyBhcmUKZGlzdGluZ3Vpc2hlZCBieSB0
aGUgdHlwZSBvZiB0aGUgbG9jayBzdHJ1Y3QuICBUaGF0IG1lYW5zIHRoYXQgeW91CmhhdmUgdG8g
Y2FsbAogICBsaWJ4bF9fdW5sb2NrX2RvbWFpbl9xbXAoZm9vLT5xbXBfbG9jaykKYnV0CiAgIGxp
YnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRlKGZvby0+dXNlcmRhdGFfbG9jaykKb3Igc29tZSBz
dWNoLCBhbmQgdGhlIGNvbXBpbGVyIHdpbGwgc3BvdCBpZiB5b3Ugd3JpdGUKICAgbGlieGxfX3Vu
bG9ja19kb21haW5fdXNlcmRhdGEoZm9vLT5xbXBfbG9jaykKb3Igc29tZXRoaW5nLiAgQnV0IGlz
IGl0IHJlYWxseSB1c2VmdWwgdG8gaGF2ZSB0byB3cml0ZSB0aGUgYHFtcCcgdnMKYHVzZXJkYXRh
JyB0aGluZyB0d2ljZSA/Cgo+ICsgKiBJdCBpcyB0byBiZSBhY3F1aXJlZCBieSBhbiBhbyBldmVu
dCBjYWxsYmFjay4KCkkgdGhpbmsgdGhlcmUgaXMgYSB3b3JzZSBwcm9ibGVtIGhlcmUsIHRob3Vn
aC4gIFRoaXMgbG9jayBpcyBwcm9iYWJseQoqaW5zaWRlKiBzb21lIGxvY2sgZnJvbSB0aGUgY2Fs
bGVyLiAgU28gdXN1YWwgbGlieGwgcnVsZXMgYXBwbHkgYW5kCnlvdSBtYXkgbm90IGJsb2NrIHRv
IGFjcXVhaXJlIGl0LgoKSWUgbGlieGxfX2xvY2tfZG9tYWluX3FtcCBtdXN0IGJlIG9uZSBvZiB0
aGVzZSB0aGluZ3MgdGhhdCB0YWtlcyBhCmxpdHRsZSBldiBzdGF0ZSBzdHJ1Y3QgYW5kIG1ha2Vz
IGEgY2FsbGJhY2suCgpBdCB0aGUgc3lzY2FsbCBsZXZlbCwgYWNxdWlyaW5nIGFuIGZjbnRsIGxv
Y2sgY2Fubm90IGJlIHNlbGVjdGVkIG9uLgpUaGUgb3B0aW9ucyBhcmUgdG8gcG9sbCwgb3IgdG8g
c3Bhd24gYSB0aHJlYWQsIG9yIHRvIGZvcmsuCgpDdXJyZW50bHkgbGlieGwgZG9lcyBub3QgY2Fs
bCBwdGhyZWFkX2NyZWF0ZSwgYWx0aG91Z2ggbWF5YmUgaXQgY291bGQKZG8uICBUbyBzYWZlbHkg
Y3JlYXRlIGEgdGhyZWFkIHlvdSBoYXZlIHRvIGRvIGEgZGFuY2Ugd2l0aApzaWdwcm9jbWFzaywg
dG8gYXZvaWQgc2lnbmFsIGRlbGl2ZXJ5IG9udG8geW91ciB0aHJlYWQuCgpNYXliZSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gdHJ5IG9uY2Ugd2l0aCBMT0NLX05CLCBhbmQgdG8gZm9yayBpZiB0aGlz
CmlzIG5vdCBzdWNjZXNzZnVsLiAgQnV0IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gYWx3YXlzIGZv
cmsuLi4KCj4gKyAqIE9yIGluIGNhc2UgUUVNVSBpcyB0aGUgcHJpbWFyeSBjb25maWcsIHRoaXMg
cGF0dGVybiBjYW4gYmUgdXNlOgo+ICsgKiAgIGxvY2sgcW1wIChxbXBfbG9jaykKPiArICogICAg
ICBsb2NrIGpzb24gY29uZmlnIChqc29uX2xvY2spCj4gKyAqICAgICAgICAgIHJlYWQganNvbiBj
b25maWcKPiArICogICAgICAgICAgdXBkYXRlIGluLW1lbW9yeSBqc29uIGNvbmZpZyB3aXRoIG5l
dyBlbnRyeSwgcmVwbGFjaW5nCj4gKyAqICAgICAgICAgICAgIGFueSBzdGFsZSBlbnRyeQo+ICsg
KiAgICAgIHVubG9jayBqc29uIGNvbmZpZwo+ICsgKiAgICAgIGFwcGx5IG5ldyBjb25maWcgdG8g
cHJpbWFyeSBjb25maWcKPiArICogICAgICBsb2NrIGpzb24gY29uZmlnIChqc29uX2xvY2spCj4g
KyAqICAgICAgICAgIHJlYWQganNvbiBjb25maWcKPiArICogICAgICAgICAgdXBkYXRlIGluLW1l
bW9yeSBqc29uIGNvbmZpZyB3aXRoIG5ldyBlbnRyeSwgcmVwbGFjaW5nCj4gKyAqICAgICAgICAg
ICAgIGFueSBzdGFsZSBlbnRyeQo+ICsgKiAgICAgICAgICB3cml0ZSBpbi1tZW1vcnkganNvbiBj
b25maWcgdG8gZGlzawo+ICsgKiAgICAgIHVubG9jayBqc29uIGNvbmZpZwo+ICsgKiAgIHVubG9j
ayBxbXAKClRoaXMgZG9lc24ndCBzaG93IHRoZSBjdHggbG9ja3MgYnV0IEkgdGhpbmsgdGhhdCBp
cyBmaW5lLiAgU28gSSB0aGluawp0aGlzIGRlc2NyaXB0aW9uIGlzIGNvcnJlY3QuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
