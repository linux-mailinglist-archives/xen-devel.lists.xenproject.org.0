Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF82B7A14
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:06:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAw5b-0003Pl-7y; Thu, 19 Sep 2019 13:03:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAw5Z-0003PV-Vt
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:03:14 +0000
X-Inumbo-ID: d5dadadb-dadd-11e9-965d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5dadadb-dadd-11e9-965d-12813bfff9fa;
 Thu, 19 Sep 2019 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568898192;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xi2Wo85Em2HaJYgcI44PzaT3WRbvoF+vay3W3Wymk4Q=;
 b=gjjNkX1BvDux21fBxfdpyQCqM493NOXHNUF+B/gSLSP/CAouUZNaZp5z
 D0Qx+Wsb8SYaCXoJc2bK7rk2qEYpPTiBRojfhrkRHee8g9OeaJoMnUm79
 KuAASwG6Ncij8Gz7/Ge8VcfrN/8fTOeap1iRhiFNKfmCOwAXI/E9o+KeO 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hFhYm6Q7OGoJAwcyNMbiSESXyAHWzQyIgOHwBqf3MYwsJLuuTuF6oLojHq4WAma8JnlbSVX5j0
 tq5W4sfXdrfwSF+Vv7M9rbc+M/85lhTW/B44Avm6RuJBraYbbc4H0EAlib+yhqH6ULLnVn1/bW
 X73i/fWn6XZ1j6ONUsdNm79AJVrFOxTmkcJDicG4kRKWOZs2i1uv3gQdLBghVKaY7ZwiAsktnY
 zKvx2Dck4Mb+5RoEfqMbt9zXtFzjrZc5mHeplcioUengZB0d/4pcLJ+G7g3D5Fv0hE+zItLAbI
 qIU=
X-SBRS: 2.7
X-MesageID: 6103187
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="6103187"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.31886.16367.162328@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 14:03:10 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919125859.GR1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
 <23937.3912.874830.653579@mariner.uk.xensource.com>
 <20190919125859.GR1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAwNi8zNV0gbGlieGw6IFVzZSBldl9x
bXAgZm9yIHN3aXRjaF9xZW11X3hlbl9sb2dkaXJ0eSIpOgo+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5
IGF0IDA1OjUyOjI0UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSSBoYXRlIHRvIHN1
Z2dlc3QgdGhpcyBhdCB0aGlzIHN0YWdlLCBidXQ6IG1heWJlIHRoZSB0aW1lb3V0IGNvdWxkIGJl
Cj4gPiBpbmNvcnBvcmF0ZWQgaW50byBsaWJ4bF9fZXZfcW1wID8KPiA+IAo+ID4gSSB0aGluayBl
dmVyeSBsaWJ4bF9fcW1wIGNhbGxlciBpcyBnb2luZyB0byBuZWVkIGEgdGltZW91dCA/Cj4gCj4g
WWVzLCBldmVyeSB1c2VyIG9mIGxpYnhsX19ldl9xbXAgc2hvdWxkIGhhdmUgYSB0aW1lb3V0IHNl
dCB1cC4gQnV0Cj4gdGhlcmUgYXJlIGRpZmZlcmVudCB3YXkgdG8gc2V0IGl0IHVwLiBXaGVuIHdl
IGhhdmUgc2V2ZXJhbCBjb21tYW5kIHRvCj4gc2VuZCB2aWEgUU1QIHNob3VsZCB3ZSBoYXZlIGEg
bmV3IHRpbWVvdXQgZm9yIGV2ZXJ5IGNvbW1hbmQgb3Igc2V0IG9ubHkKPiBvbmUgd2hlbiBzZW5k
aW5nIHRoZSBmaXJzdCBjb21tYW5kLCBhbmQgb25seSBzdG9wcGluZyB0aGUgdGltZW91dCB3aGVu
Cj4gdGhlIGxhc3QgY29tbWFuZCdzIHJlc3BvbnNlIGhhdmUgYmVlbiByZWNlaXZlZD8gSW4gdGhp
cyBwYXRjaCBzZXJpZXMKPiBJJ3ZlIGNob29zZSB0aGUgc2Vjb25kIG9wdGlvbi4KPiAKPiBJIGNh
biBzZWUgc2V2ZXJhbCBjYXNlczoKPiAtIE9uZSBRTVAgY29tbWFuZAo+ICAgLT4gZWFzeSwgb25l
IHRpbWVvdXQgZm9yIGl0Lgo+IC0gc2V2ZXJhbCBjb21tYW5kcywgcmVsYXRlZCBvciBub3QuCj4g
ICAtPiBvbmUgdGltZW91dCBwZXIgY29tbWFuZD8gb3Igb25lIHRpbWVvdXQgd2hpY2ggY292ZXIg
YWxsIG9mIHRoZW0/Cj4gICAgICBvbmUgcGVyIGNvbW1hbmRzIG1lYW5zIHRoYXQgYSBiYWQgcWVt
dSBjb3VsZCBkZWxheSB0aGUgb3BlcmF0aW9uCj4gICAgICBzZXZlcmFsIHRpbWUgbG9uZ2VyIHRo
YW4gaWYgdGhlcmUgd2VyZSBhIHNpbmdsZSB0aW1lb3V0IGNvdmVyaW5nCj4gICAgICBhbGwgdGhl
IGNvbW1hbmRzLgo+IC0gb3RoZXIgc2xvdyBvcGVyYXRpb24gYXJlIGRvbmUgYmVzaWRlIGEgcW1w
IGNvbW1hbmQKPiAgIC0+IEluIHRoaXMgY2FzZSwgaXQgbWlnaHQgbm90IGJlIHByYWN0aWNhbCB0
byBoYXZlIGEgdGltZW91dCBhdHRhY2gKPiAgICAgIHRvIHRoZSBxbXAgY29tbWFuZCwgd2UgYXJl
IGdvaW5nIHRvIG5lZWQgYSB0aW1lb3V0IGZvciB0aGUgb3RoZXIKPiAgICAgIG9wZXJhdGlvbnMu
CgpIbW1tLiAgWWVzLiAgWW91IGhhdmUgb2J2aW91c2x5IGNvbnNpZGVyZWQgdGhpcyBiZXR0ZXIg
dGhhbiBtZS5xCgo+IEkgZ3Vlc3Mgd2UgY291bGQgdHJ5IHRvIG9wdGltaXNlIHRoZSBzaW1wbGVy
IGNhc2Ugd2hlbiB0aGVyZSBpcyBvbmx5IG9uZQo+IHFtcCBvcGVyYXRpb24sIGJlY2F1c2UgdGhh
dCdzIHRoZSBtb3N0IGNvbW1vbiwgYnV0IGFsbG93IHRvIHNlbmQKPiBjb21tYW5kcyB3aXRob3V0
IGhhdmluZyBsaWJ4bF9fcW1wIHNldHRpbmcgYSB0aW1lb3V0LgoKVGhhdCB3b3VsZCBiZSBuaWNl
LiAgSSB0aGluayB0aGlzIGlzIGEgbmljZS10by1oYXZlLCBub3QgYSBibG9ja2VyLgoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
