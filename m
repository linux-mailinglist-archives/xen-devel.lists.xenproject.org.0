Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFCA1260F3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:38:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihu6c-0007Cf-Qc; Thu, 19 Dec 2019 11:36:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4R/5=2J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ihu6a-0007CK-FW
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:36:32 +0000
X-Inumbo-ID: c08deb96-2253-11ea-918a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c08deb96-2253-11ea-918a-12813bfff9fa;
 Thu, 19 Dec 2019 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576755370;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DSnjdcQ6zUvacmAXj7X7bgqjb4A7jKwTfIlZqQmCSV0=;
 b=IkRKBNYnjUU0rIWK2lbYff0JwB4Uypxs8wxK4mpl0LWtCOFD8FIhxmnJ
 PPfomJ8LWmrkMLMe5gj5AUDEEEt5OHFVEn5LloQG05X17zNPpI84MRQOK
 rcZIADVuXykocTuJw19aR5n1Q1jX8k/wJHuoznl25q9EY0PwTB4CXLxLK c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LHCbfNOqcDM4esth/KHQuiGoMYuaXW7w+s7Z94mYK9JFe9cMYESw5vZfsk58+uRxHYnvUfYF1y
 TnpkSWuAok0UhTwsTzC+lcPWNVCxuttxXp0t7wlINavj2NGH8cgLSZ4JzQL0OSvXsjeUXQySDy
 +en7jPrtvARfaz0/wJxIic/Ci0cB6UGQM57uAJ6t38riGjsC87spwhMD/42A3L2qJ3IDrx0OJp
 DKb8F0/5uxzyFwqmZ+NU2K1jO5vHwAtqMqkVGeypYew+1/eRiHpZqPoiizCb/8rQ/tAsTDCs15
 0SY=
X-SBRS: 2.7
X-MesageID: 10293118
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; d="scan'208";a="10293118"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24059.24742.522746.897867@mariner.uk.xensource.com>
Date: Thu, 19 Dec 2019 11:36:06 +0000
To: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
 <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
 <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien@xen.org>,
 "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIIHYzIDUvN10gQWRkIENvZGUgUmV2aWV3IEd1
aWRlIik6Cj4gSW4gYSBudXRzaGVsbCwgaW4gc3VjaCBhIHJldmlldyB0aGUgcG9zc2libGUgaW50
ZXJwcmV0YXRpb25zIGFyZQo+ICogSSByZXZpZXdlZCwgYnV0IGRpZG4ndCBmZWVsIHF1YWxpZmll
ZCB0byBkbyB0aGUgcmVzdAo+ICogSSByZXZpZXdlZCwgYnV0IGRpZCBub3QgZ2V0IHJvdW5kIHRv
IGdpdmUgaXQgZnVsbCBhdHRlbnRpb24KPiAqIEkgcmV2aWV3ZWQsIGJ1dCBiZWZvcmUgSSBtYWtl
IGEgZmluYWwgZGVjaXNpb24gd2FudCB0byBsb29rIGF0IHRoZSBuZXh0IHZlcnNpb24KPiAuLi4K
PiAqIEkgcmV2aWV3ZWQgYW5kIGRvbid0IG9iamVjdCB0aGUgcmVzdAo+ICogSSByZXZpZXdlZCBh
bmQgYWdyZWVkIHdpdGggdGhlIHJlc3QgCj4gVGhlIGxhdHRlciB0d28gYXJlIGVxdWl2YWxlbnQg
dG8gQWNrL1ItYgo+IAo+IFRoYXQgaXMgcXVpdGUgYSBsYXJnZSByYW5nZSBvZiBwb3NzaWJpbGl0
aWVzIGFuZCBraW5kIG9mIGxlYXZlcyB0aGUgYXV0aG9yIGd1ZXNzaW5nIHdoYXQgc3RhdGUgdGhl
IHJldmlldyBpcyBpbgoKVGhlcmUgYXJlIG9ubHkgdGhyZWUgcG9zc2liaWxpdGllczoKCkFja2Vk
LWJ5OgogIEkgaGVyZWJ5IGJsZXNzIHRoaXMgd2l0aCBteSBtYWludGFpbmVyIHBvd2Vycy4KICBJ
IG1heSBvciBtYXkgbm90IGhhdmUgcmV2aWV3ZWQgaXQuICBUaGUgYm9keSB0ZXh0IG1heSBjb250
YWluCiAgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGF0LgoKUmV2aWV3ZWQtYnk6CiAgSSBoYXZl
IHJldmlld2VkIHRoaXMgdG8gbXkgb3duIHNhdGlzZmFjdGlvbiBhbmQgdGhpcyBtYWlsIGNvbnRh
aW5zCiAgYWxsIHRoZSBjb21tZW50cyBJIGhhdmUgb24gaXQuICBJZiBJIGFtIGEgbWFpbnRhaW5l
ciwgSSBoZXJlYnkKICBibGVzcyBpdCB3aXRoIG15IG1haW50YWluZXIgcG93ZXJzLiAgKFRoaXMg
aXMgYSB3ZWlyZCB1c2Ugb2YgdGhlCiAgd29yZCAiUmV2aWV3ZWQiIHNpbmNlIGluIHVzdWFsIHVz
YWdlIG9uZSBjYW4gcmV2aWV3IHNvbWV0aGluZyBhbmQKICBlbmQgdXAgZGlzYXBwcm92aW5nIG9m
IGl0OyBuZXZlcnRoZWxlc3MgdGhpcyBpcyB0aGUgY29udmVudGlvbi4pCgpJbiBib3RoIG9mIHRo
ZSBhYm92ZSBjYXNlcywgYWRkaXRpb25hbGx5CiAgSWYgbXkgYXBwcm92YWwgaXMgY29uZGl0aW9u
YWwgKGVnIG9uIGNoYW5nZXMpIHRoaXMgd2lsbCBiZQogIHN0YXRlZCBleHBsaWNpdGx5IGluIHRo
ZSBib2R5IHRleHQgb2YgbXkgbWVzc2FnZS4KCk5laXRoZXIgb2YgdGhlIGFib3ZlOgogIEkgaGF2
ZSByZWFkIGF0IGxlYXN0IHNvbWUgb2YgdGhpcyBhbmQgZmVsdCBtb3RpdmF0ZWQgdG8gbWFrZSBz
b21lCiAgb2JzZXJ2YXRpb25zLiAgSWYgSSBoYXZlIHJldmlld2VkIGl0IHByb3Blcmx5IHRoaXMg
d291bGQgdXN1YWxseSBiZQogIHN0YXRlZCBpbiB0aGUgYm9keSB0ZXh0LiAgSWYgSSBhbSB0YWtp
bmcgZW5vdWdoIG9mIGFuIGludGVyZXN0IGluCiAgdGhpcyBwYXRjaCwgdGhlIGJvZHkgdGV4dCBt
YXkgYWxzbyBzYXkgd2hhdCBJIHRoaW5rIHRoZSBjdXJyZW50CiAgc3RhdGUgYW5kL29yIG5leHQg
c3RlcHMgc2hvdWxkIGJlLiAgSW4gYW55IGNhc2UsIEkgZG8gKm5vdCogYmxlc3MKICB0aGlzIHBh
dGNoIChpbiBpdHMgY3VycmVudCBmb3JtKSB3aXRoIGFueSBtYWludGFpbmVyIHBvd2VycyBJIG1h
eQogIGhhdmUuCgpJT1c6IGlmIHlvdSBkbyBub3QgZ2V0IGFuIEEtYiBvciBSLWIsIHRoZW4gdGhl
IHBlcnNvbiB3cml0aW5nIGlzIG5vdApuZWNlc3NhcmlseSBtYWtpbmcgYW55IG9mIHRoZSBzdGF0
ZW1lbnRzIHlvdSBwb3NpdCB3aGljaCBzdGFydCAiSQpyZXZpZXdlZCIuCgpIYXZpbmcgc2FpZCB0
aGF0IGl0IGlzIGEgZ29vZCBpZGVhIGZvciBwZW9wbGUgY29tbWVudGluZyBvbiBwYXRjaGVzIHRv
Cm1ha2UgY2xlYXIgd2hhdCB0aGV5IGhhdmUgYW5kIGhhdmVuJ3QgZG9uZS4gIEkgb2Z0ZW4gc3Rh
cnQgYSBtZXNzYWdlCndpdGggIlRoYW5rcyBmb3IgdGhpcyBwYXRjaCB3aGljaCBJIGhhdmUgcmV2
aWV3ZWQuICBJIGhhdmUgc29tZQpjb21tZW50cyIgb3Igd29yZHMgdG8gdGhhdCBlZmZlY3QuCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
