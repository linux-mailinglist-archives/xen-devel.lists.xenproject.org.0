Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50316AA3E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:36:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Fjb-0005vT-0V; Mon, 24 Feb 2020 15:33:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6FjY-0005vO-Og
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:33:24 +0000
X-Inumbo-ID: fdaf7ab6-571a-11ea-9210-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdaf7ab6-571a-11ea-9210-12813bfff9fa;
 Mon, 24 Feb 2020 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582558402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VThmXpZ3fl8a99JKgDAzTjDUoiZc1Cabu/XCWoLg8Gc=;
 b=UeN3VZZBxePafb5/CTTaZBU1pfk54sWSy14ItQu9NxeCvS4yMVMGenhe
 mVfy6do37B4XFMQTgneQKoWbFuW4B6Dab4MxanHWWMR2eWn5/1G82Md+Q
 3A4I8RNXYWnz0TmwybOmTCneD3YYzjheAd19B/jy2QX/sOMoR98KjzL8y Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1UZvsrHTlfInjZ4JDhrtRzwwUuZIsYvyDXZ2uE3bdYp4Nr32TULu3Yit0+l7QB7Z9GqdFXJQnk
 6ZvnxYbTD/G9oYtKu5g863uCeCyaoKKQ/kh2+Vyy6m9szEVzzXyo4Jh1kG2+pIqsDarKiZOaHZ
 Nv1YFyVlgUgG9/Q9mQNuWdiahdbTBehRfyovx4KdSV+W1tay7tZXaGu90BClp1oyKlwJ9k3iIs
 gWC8vaZEFH+BKr0YhCi+2AR2+I3ZpBNN94DcM9MuepPQTQTDFk5rcSMWSGeMJZsroPBD9dWyjR
 a/E=
X-SBRS: 2.7
X-MesageID: 13345220
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13345220"
Date: Mon, 24 Feb 2020 16:33:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200224153315.GT4679@Air-de-Roger>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, wl@xen.org,
 Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDc6MjY6NDlQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMjEvMDIvMjAyMCAxNjoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAx
OS4wMi4yMDIwIDE4OjI1LCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiA+PiAtLS0gYS94ZW4vYXJj
aC94ODYvc3lzY3RsLmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiA+PiBAQCAt
NzgsOCArNzgsMTEgQEAgc3RhdGljIHZvaWQgbDNfY2FjaGVfZ2V0KHZvaWQgKmFyZykKPiA+PiAg
bG9uZyBjcHVfdXBfaGVscGVyKHZvaWQgKmRhdGEpCj4gPj4gIHsKPiA+PiAgICAgIHVuc2lnbmVk
IGludCBjcHUgPSAodW5zaWduZWQgbG9uZylkYXRhOwo+ID4+IC0gICAgaW50IHJldCA9IGNwdV91
cChjcHUpOwo+ID4+ICsgICAgaW50IHJldDsKPiA+PiAgCj4gPj4gKyAgICAvKiBGbHVzaCBwb3Rl
bnRpYWxseSBzY2hlZHVsZWQgUkNVIHdvcmsgZnJvbSBwcmVjZWRpbmcgQ1BVIG9mZmxpbmUgKi8K
PiA+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4gPj4gKyAgICByZXQgPSBjcHVfdXAoY3B1KTsKPiA+
PiAgICAgIGlmICggcmV0ID09IC1FQlVTWSApCj4gPj4gICAgICB7Cj4gPj4gICAgICAgICAgLyog
T24gRUJVU1ksIGZsdXNoIFJDVSB3b3JrIGFuZCBoYXZlIG9uZSBtb3JlIGdvLiAqLwo+ID4+IEBA
IC0xMDQsNyArMTA3LDExIEBAIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQo+ID4+ICBs
b25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKQo+ID4+ICB7Cj4gPj4gICAgICBpbnQgY3B1
ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPiA+PiAtICAgIGludCByZXQgPSBjcHVfZG93bihjcHUp
Owo+ID4+ICsgICAgaW50IHJldDsKPiA+PiArCj4gPj4gKyAgICAvKiBGbHVzaCBwb3RlbnRpYWxs
eSBzY2hlZHVsZWQgUkNVIHdvcmsgZnJvbSBwcmVjZWRpbmcgQ1BVIG9ubGluZSAqLwo+ID4+ICsg
ICAgcmN1X2JhcnJpZXIoKTsKPiA+PiArICAgIHJldCA9IGNwdV9kb3duKGNwdSk7Cj4gPj4gICAg
ICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+ID4+ICAgICAgewo+ID4+ICAgICAgICAgIC8qIE9uIEVC
VVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8KPiA+Pgo+ID4gCj4g
PiBUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBjcHVfdXAoKSAvIGNwdV9kb3duKCksIG1vc3Qgbm90
YWJseSBpbgo+ID4gY29yZV9wYXJraW5nLmMuIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtYWtl
IHRoZSBiYXJyaWVyIHBhcnQKPiA+IG9mIHRoZSB0d28gZnVuY3Rpb25zPyBUaGlzIHdvdWxkIHRo
ZSBhbHNvIGNvdmVyIG5vbi14ODYgaW4KPiA+IGNhc2UgYW4gYXJjaCB3YW50cyB0byBzdXBwb3J0
IG9mZmxpbmluZy9vbmxpbmluZyBvZiBDUFVzLgo+IAo+IFRob3NlIGZ1bmN0aW9ucyBhcmUgY2Fs
bGVkIGZyb20gZWFybHkgaW5pdCBjb2RlIGFuZCByY3VfYmFycmllcigpIGlzCj4gYW4gZXhwZW5z
aXZlIG9wZXJhdGlvbi4gSSB0aGluayBpdCdzIGJldHRlciBpZiBjYWxsZXIgaXMgcmVzcG9uc2li
bGUKPiBmb3Igc3luY2luZyB0aGUgc3RhdGUuIFRoaXMgaXMgdGhlIHJlYXNvbiBJIG1vdmVkIHJj
dV9iYXJyaWVyKCkgaW4gZnJvbnQKPiBvZiBjcHVfdXAvZG93bi4KCkNvdWxkIHlvdSBnYXRlIHRo
ZSBjYWxsIHRvIHJjdV9iYXJyaWVyKCkgb24gc3lzdGVtX3N0YXRlID4KU1lTX1NUQVRFX3NtcF9i
b290PwoKSSB0aGluayB0aGF0IHdvdWxkIGF2b2lkIGNhbGxpbmcgdGhlbSBkdXJpbmcgZWFybHkg
Ym9vdCBhbmQgc21wCnN0YXJ0dXAgYnV0IHdvdWxkIHN0aWxsIGFsbG93IGZvciB0aGUgY2FsbCB0
byByY3VfYmFycmllcigpIHRvIGJlCmhpZGRlbiBpbnNpZGUgY3B1X3t1cC9kb3dufS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
