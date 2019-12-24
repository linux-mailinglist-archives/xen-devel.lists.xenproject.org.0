Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034512A16C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 13:47:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjWr-0003R1-1G; Tue, 24 Dec 2019 12:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijjWp-0003Qw-T1
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 12:43:11 +0000
X-Inumbo-ID: f125ee8e-264a-11ea-97b4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f125ee8e-264a-11ea-97b4-12813bfff9fa;
 Tue, 24 Dec 2019 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577191391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FUoRHs8x+YRQNaajg9NN1c9oU9yLx8xJ+1n1i7Zdi3A=;
 b=GBJ0aDugEae+2rz7ButS7ECD3Izb4NZExgYG7uxKpx9QKoEmA/GQbV3P
 K1gu1yS+HrlzkvsCCuPAhWgnT8wteLJi+Fp8FZUGRApOuXS3FOiWHBQm6
 YtQ79iGXx3BsTNhPdpTZoTgnkEk1roXVFmjhLkZKoxTAVsYPFS0ljAd5V s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uoAjy4xBufJBgIfcSyN+rBVHElZFA3EDb90wq4DUITYJznbUNcyhMaDlLdThsV5QkoGpN9NFBF
 FjtoSmxi8/AIzTsmwV+wcwLio+HIHhxSMKbDHKMyAceyMgWq6+n9UDToSzHF2lSEmNTIApuSzl
 nNjJLGmqAVo7M+Jky6D1/in8SGp+ukPEU6+rD6rrgDiUlHwBZsvtOOsg/uBAlihqgRc4mzfFUP
 LxomRiues1Rt52X55l1fDec8xU4Kh18oGK9zUinZ4xgDwJ7aBJVE5Gm2aJlllfjl8FALgbfy2D
 xeA=
X-SBRS: 2.7
X-MesageID: 10123025
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10123025"
Date: Tue, 24 Dec 2019 13:42:58 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191224124258.GC11756@Air-de-Roger>
References: <20191224101810.45915-1-roger.pau@citrix.com>
 <8264d39f-4f5e-e7c0-f0e0-6be23feba3c3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8264d39f-4f5e-e7c0-f0e0-6be23feba3c3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] x86/hvm: always expose x2APIC feature in
 max HVM cpuid policy
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMTI6MjM6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8xMi8yMDE5IDEwOjE4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBP
biBoYXJkd2FyZSB3aXRob3V0IHgyQVBJQyBzdXBwb3J0IFhlbiBlbXVsYXRlZCBsb2NhbCBBUElD
IHdpbGwKPiA+IHByb3ZpZGUgc3VjaCBtb2RlLCBhbmQgaGVuY2UgdGhlIGZlYXR1cmUgc2hvdWxk
IGJlIHNldCBpbiB0aGUgbWF4aW11bQo+ID4gSFZNIGNwdWlkIHBvbGljeS4KPiA+Cj4gPiBOb3Qg
ZXhwb3NpbmcgaXQgaW4gdGhlIG1heGltdW0gcG9saWN5IHJlc3VsdHMgaW4gSFZNIGRvbWFpbnMg
bm90Cj4gPiBnZXR0aW5nIHN1Y2ggZmVhdHVyZSBleHBvc2VkIHVubGVzcyBpdCdzIGFsc28gc3Vw
cG9ydGVkIGJ5IHRoZQo+ID4gdW5kZXJseWluZyBoYXJkd2FyZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiB4MmFwaWMg
aGFzIG5ldmVyIGJlZW4gZXhwb3NlZCB2aWEgdGhpcyBtZWNoYW5pc20sIGR1ZSB0byBpdHMgZWZm
ZWN0cyBvbgo+IHRvcG9sb2d5IGNhbGN1bGF0aW9ucy4KCldlbGwsIGl0J3MgZXhwb3NlZCBpbiBo
dm1fbWF4X2NwdWlkX3BvbGljeSBpZiBpdCdzIHByZXNlbnQgaW4gdGhlCmhhcmR3YXJlLiBJTU8g
aXQncyBraW5kIG9mIHdlaXJkIHRoYXQgdGhlIHByZXNlbmNlIG9mIHRoZSB4MkFQSUMgZmVhdHVy
ZQpvbiB0aGUgbWF4IHBvbGljeSBkZXBlbmRzIG9uIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlLCB3
aGVuIGl0J3MgYWx3YXlzCnN1cHBvcnRlZCBieSB0aGUgZW11bGF0ZWQgdmxhcGljLgoKSSB0aGlu
ayB4MkFQSUMgbXVzdCBlaXRoZXIgYWx3YXlzIGJlIHBhcnQgb2YgdGhlIG1heCBwb2xpY3ksIG9y
IG5ldmVyLApvciBlbHNlIGl0J3MgdmVyeSBlYXN5IHRvIGNhdXNlIHJlZ3Jlc3Npb25zIGJlY2F1
c2UgaXQncyBub3Qgc28gZWFzeQp0byBmaW5kIGEgYm94IHdpdGhvdXQgeDJBUElDLgoKPiBJdCBo
YXMgaG93ZXZlciBhbHdheXMgYmVlbiBkb3duIHRvIHRoZSB0b29sc3RhY2sgdG8gb3B0IGluLCBh
bmQgWGVuCj4gcGVybWl0cyB0aGlzIHZpYSByZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koKSwgb24g
dGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlCj4gdG9vbHN0YWNrIGtuZXcgd2hhdCBpdCB3YXMgZG9p
bmcgV1JUIHRvcG9sb2d5IChhbGwgZXZpZGVuY2UgYWN0dWFsbHkgdG8KPiB0aGUgY29udHJhcnkp
LgoKSG0sIEkgY2FuIHRyeSB0byBmb3JjZSB0aGUgc2V0dGluZyBpbiBsaWJ4Yy4KCj4gSWYgd2Un
cmUgc2VlaW5nIGEgcmVjZW50IGNoYW5nZSBpbiBiZWhhdmlvdXIsIHRoZW4gaXQgd2lsbCBiZSBm
cm9tIGxpYnhjLgoKSUlSQyB4MkFQSUMgd2FzIGFsd2F5cyBleHBvc2VkIHRvIEhWTSBndWVzdHMg
cmVnYXJkbGVzcyBvZiB0aGUKdW5kZXJseWluZyBoYXJkd2FyZSBzdXBwb3J0LgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
