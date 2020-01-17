Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB8140900
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:34:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPqP-0001eK-GM; Fri, 17 Jan 2020 11:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isPqO-0001eF-6Y
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:31:16 +0000
X-Inumbo-ID: da165992-391c-11ea-8e9a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da165992-391c-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579260667;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=cxEiIUItVKnXWyK1ZuNKJJU2YaAZkrztsavAwJQ/Gkw=;
 b=YQGFR8nR23tffoNd2asB7kHA1wQcmwblhjgIaGI1529QmtVc5NOiBrPj
 kiruE3aRXv2EYxORhwfkj9XrQrHiO5iEfAKYZVQT5ieFZdHM72AW00r/3
 ngTzbFb/UFQzI+7DnFMjobUA6lhT79u49oV1FF63KMYLHSIqw82Cncehq w=;
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
IronPort-SDR: 5f2Jv68Ye4Occ5E9ElJYt/pxChtD4kdJBrdZIciPFNrnJ0SJoUD+fElNx85Wb3u91PeokiSbVz
 qyJw7sRAzO8yuoqqQOOGFiClmJiSFcxx3m2i33GGdhE2oyvkuYuo/eiDjBpKAQ6PCAVPupHRhM
 Bsd6EZ44MocRjzmgbecLVYQtyahxhJTiOObNHnPfVaWDPtiM+0Tg8DkbQn7hxQ/UI5Tcs90/0w
 8WI9ywQ25ZUwmgnnjK7SFJsRx2/dwswLiuKVorbIC8tIrnVmVgd/Gw7ICKUmcgO5t5CKsxh8iJ
 H4Q=
X-SBRS: 2.7
X-MesageID: 11433525
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11433525"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.39671.946265.82488@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 11:31:03 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <57d659aacf3f4eb7ae69080aa5de90be@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-4-pdurrant@amazon.com>
 <24096.43806.179846.885653@mariner.uk.xensource.com>
 <57d659aacf3f4eb7ae69080aa5de90be@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 3/6] libxl: add infrastructure to track
 and query 'retired' domids
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHYzIDMvNl0gbGlieGw6IGFkZCBpbmZy
YXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JldGlyZWQnIGRvbWlkcyIpOgo+IFtJYW47
XQo+ID4gSSdtIG5vdCBzdXJlIHdoeSB5b3UgYm90aGVyIHdpdGggZmdldHMgaW50byBhIGJ1ZmZl
ciwgd2hlbiB5b3UgY291bGQKPiA+IGp1c3QgdXNlIGZzY2FuZiByYXRoZXIgdGhhbiBzc2NhbmYu
ICBZb3VyIGNvZGUgZG9lc24ndCBuZWVkIHRvIHRha2UKPiA+IG11Y2ggY2FyZSBhYm91dCB3ZWly
ZCBzeW50YXggd2hpY2ggbWlnaHQgb2NjdXIgKGFuZCBpbmRlZWQgeW91ciBjb2RlCj4gPiBoZXJl
IGRvZXNuJ3QgdGFrZSBzdWNoIGNhcmUpLgo+IAo+IFdlbGwsIEkgbmVlZCB0byBwdWxsIHRoZSBs
aW5lIGludG8gYSBidWZmZXIgaWYgSSdtIGdvaW5nIHRvIHdyaXRlIGl0IG91dCBhZ2FpbiwgYnV0
IG90aGVyd2lzZSBJIGNvdWxkIGluZGVlZCB1c2UgZnNjYW5mKCkuCgpXZWxsLCB5b3UgY291bGQg
anVzdCBmcHJpbnRmIHRoZSBpbmZvcm1hdGlvbi4KCj4gT2ssICdyZWNlbnQnIGlzIHByb2JhYmx5
IGNsZWFyZXIuIEknbGwgcy9yZXRpcmVkL3JlY2VudC9nLgoKVGhhbmtzLgoKPiA+IEkgZG9uJ3Qg
bXVjaCBsaWtlIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBjb25maWd1cmUgdGhpcy4gIEkg
ZG9uJ3QKPiA+IG9iamVjdCB0byBrZWVwaW5nIGl0IGJ1dCBjYW4gd2UgaGF2ZSBhIGNvbW1lbnQg
c2F5aW5nIHRoaXMgaXMgbm90Cj4gPiBpbnRlbmRlZCBmb3IgdXNlIGluIHByb2R1Y3Rpb24gPyAg
UGVyc29uYWxseSBJIHdvdWxkIHJhdGhlciBpdCB3YXMKPiA+IGhhcmRjb2RlZCwgb3IgZmFpbGlu
ZyB0aGF0LCB3cml0dGVuIHRvIHNvbWUgY29uZmlnIGZpbGUuCj4gCj4gVGhlIHByb2JsZW0gaXMg
dGhhdCBsaWJ4bCBoYXMgbm8gY29uZmlnIGZpbGUuIEVudiB2YXJpYWJsZXMgc2VlbSB0byBiZSB1
c2VkIGZvciBvdGhlciB0aGluZ3Mgc28gSSBmb2xsb3dlZCBzdWl0LiBJJ2QgcmF0aGVyIGtlZXAg
dGhlIG92ZXJyaWRlIGZvciBkZWJ1ZyBwdXJwb3NlczsgSSdsbCBzdGljayBhIGNvbW1lbnQgaW4g
dGhlIGhlYWRlciBzYXlpbmcgdGhhdCdzIHdoYXQgaXQncyBmb3IgdGhvdWdoLCBhcyB5b3Ugc3Vn
Z2VzdC4KCk9LLiAgWW91IGFyZSByaWdodCBhYm91dCB0aGUgbGFjayBvZiBhIGNvbmZpZyBmaWxl
IGJlaW5nIGEgcHJvYmxlbS4KCj4gPiBGaW5hbGx5LCBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMg
YW4gYWRkaXRpb24gdG8geGVuLWluaXQtZG9tMCB0bwo+ID4gcmVtb3ZlIG9yIGVtcHR5IHRoZSBy
ZWNvcmQgZmlsZS4gIFRoaXMgaXMgYmVjYXVzZSB3aGlsZSAvcnVuIGlzCj4gPiB1c3VhbGx5IGEg
dG1wZnMsIHRoaXMgaXMgbm90ICpuZWNlc3NhcmlseSogdHJ1ZS4KPiAKPiBPaywgaWYgd2UgY2Fu
bm90IHJlbHkgb24gaXQgYmVpbmcgdG1wZnMgdGhlbiBJIHdpbGwgZG8gdGhhdC4KClRoYW5rcy4K
ClRoYW5rcyBmb3IgdGhlIHJlc3Qgb2YgeW91ciByZXBseSwgdG9vLCB3aGljaCBJIHNuaXBwZWQg
YXMgSSBoYWQKbm90aGluZyBtb3JlIHRvIHNheSB0aGFuIGB0aGFua3MnLgoKUmVnYXJkcywKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
