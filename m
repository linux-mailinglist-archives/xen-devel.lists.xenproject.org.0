Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2148D4636
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:07:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyKo-0007w6-Sy; Fri, 11 Oct 2019 17:04:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIyKn-0007w1-2p
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:04:09 +0000
X-Inumbo-ID: 22e0cc64-ec49-11e9-bbab-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22e0cc64-ec49-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 17:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570813448;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=7jHePVI7MoN/a0dvRQBooKUVnAjxJeZUY0vjjyMreXA=;
 b=IO1scPwArMK5kgS5HV0vC5R1EoyDakWZV5Ew4CuLH0wO7RbbcUotkUX6
 2gTaDCnqErItCVLjrfvTR906hs39ebEBjLGDKk/QlUVigcsitPI4P6qxT
 loXRZzqfOGkAfGW70VpqWFNWjog4vjtjWqpL05037NBgdwE+iQPkxltPo g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rnQyqLcZ3sKT1ASzkN4tzHTzqsavBhKQsEMoVEUZTlyMyEMKhcBgi3B3qNHjDQRxfWD5yz+USv
 KPLrdhvCagHZdZgOkpJuVxFMLRgAD+kwqQfMjUUY1iosaCp6lLf6H7UxKwdsDb8shrqz+N4USl
 SlbyCpn8gZl21Ba6+tdbSwmd4A2XEihUzWkESPIyTFcFcWAmPDl4rorFJVgpWLLfKHZE3eMUvd
 3kkFBNVM7rJ3N1ckVsCZH8B0PK8K78KaK545Hi/M7R1VoMUabRl2DhwUQr87M5ZAON39rS/Erh
 I9I=
X-SBRS: 2.7
X-MesageID: 6777594
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6777594"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.46591.386956.861918@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 18:03:59 +0100
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiUmU6IFtQQVRDSCB2MSAxLzJdIGxpYnhsOiBpbnRy
b2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQiKToKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBh
dCA1OjU4IFBNIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+
IEkgdGhpbmsgaXQgd2FzIGE0OGUwMGYxNGEyZCAibGlieGw6IGFkZCBiYWNrZW5kIHR5cGUgYW5k
IGlkIHRvIHZrYiIKPiA+IHdoaWNoIGludHJvZHVjZWQgd2hhdCB5b3UgYXJlIGNhbGxpbmcgInVz
ZXIgc3BhY2UiIGJhY2tlbmRzLiAgSXQKPiA+IGFwcGVhcnMgdGhhdCB0aGUgdmtiIGJhY2tlbmQg
dHlwZSBlbnVtIHdhcyBpbnRyb2R1Y2VkIHRoZXJlCj4gPiBzcGVjaWZpY2FsbHkgdG8gZGlzdGlu
Z3Vpc2ggYmV0d2VlbiB0aGVzZSB0d28gc2l0dWF0aW9ucy4gIEZvciByZWFzb25zCj4gPgo+ID4g
QW0gSSB3cm9uZyA/ICBJZiBub3QsIHdoeSBpcyB0aGlzIG5vdCB3b3JraW5nIG9yIG5vdCBzdWl0
YWJsZSA/Cj4gCj4gWW91IGFyZSByaWdodC4gSXQgaXMgbm90IHdvcmtpbmcgaW4gc29tZSBjYXNl
cyBkdWUgdG8gUUVNVV9CQUNLRU5EIG1hY3JvLgo+IFFFTVVfQkFDS0VORCB0cmVhdHMgYm90aCBi
YWNrZW5kcyBhcyBRRU1VLiBBcyByZXN1bHQgeGwgcGVyZm9ybXMgZGV2aWNlCj4gaG90cGx1ZyBv
biBhZGQvcmVtb3ZlIGRldmljZS4gV2hpY2ggaXMgbm90IGV4cGVjdGVkIGluIGNhc2UgInVzZXIK
PiBzcGFjZSIgYmFja2VuZC4KClRoZW4gcGVyaGFwcyB0aGlzIG1hY3JvIG5lZWRzIHRvIGJlIGFk
anVzdGVkIG9yIGNhbGxlZCBvbmx5CmNvbmRpdGlvbmFsbHkgb3Igc29tZXRoaW5nID8KCj4gSW4g
dGhpcyBwYXRjaCBJIHByb3Bvc2Ugc29sdXRpb24gc2ltaWxhciB0byBWVVNCIGRldmljZS4gV2hl
cmUgVlVTQgo+IHVzZWQgZm9yIGZyb250ZW5kIGFuZCBkZXBlbmRzIG9uIGJhY2tlbmQgKGtlcm5l
bCBvciBRRU1VKSBlaXRoZXIKPiBWVVNCIG9yIFFVU0IgdXNlZCBmb3IgYmFja2VuZCBkZXZpY2Ug
dHlwZSBlLmcuIHVzZSBkaWZmZXJlbnQgYmFja2VuZAo+IGRldmljZSB0eXBlIGZvciBkaWZmZXJl
bnQgYmFja2VuZHMuCgpJIGNvbmZlc3MgSSBkb24ndCBxdWl0ZSBmb2xsb3cgYWxsIHRoZSBWVVNC
IHN0dWZmIGJ1dCBJIGRvbid0IHRoaW5rIGl0CmlzIG5lY2Vzc2FyaWx5IGEgZ29vZCBtb2RlbC4K
Cj4gSW50cm9kdWNpbmcgbmV3IGJhY2tlbmQgZGV2aWNlIHR5cGUgZm9yIFZLQkQgYWxzbyBhbGxv
d3MgdG8gaGF2ZQo+IGJvdGggYmFja2VuZHMgKFFFTVUgYW5kIG5vbiBRRU1VKSBydW4gaW4gc2Ft
ZSBkb21haW4uIE5vdCBzdXJlIGlmIGl0Cj4gaXMgdXNlZnVsIHNjZW5hcmlvIGJ1dCB3aXRoIHRo
aXMgcHJvcG9zYWwgaXQgaXMgcG9zc2libGUgZnJvbQo+IHRlY2huaWNhbCBwb2ludCBvZiB2aWV3
LgoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIG5vdCBwb3NzaWJsZSBzaW1wbHkgYnkg
aGF2aW5nIGEKZGlmZmVyZW50IGJhY2tlbmQgdHlwZS4KCj4gPiBJIGFsc28gZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgdGhlICJ1c2VyIHNwYWNlIiBrYmQgYmFja2VuZCBzZWVtcyB0byBiZQo+ID4gImxp
bnV4IiBpbiB0aGUgZW51bS4KPiAKPiBJIGFncmVlIHRoaXMgaXMgbm90IHNvIGdvb2QgbmFtZS4g
QnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gY2FsbAo+IGJhY2tlbmRzIHdoaWNoIGFyZSBub3QgcnVu
bmluZwo+IGluc2lkZSBRRU1VIGluIGdlbmVyYWwuCgpJIHRoaW5rIHRoaXMgd291bGQgYmUgdXNl
YWJsZSBvbiBmcmVlYnNkID8gICJsaW51eCIgZGVmaW5pdGVseSBzZWVtcwp3cm9uZy4gIEkgc2Vl
IGl0IGhhc24ndCBiZWVuIGluIGEgcmVsZWFzZSBzbyBpdCBpcyBub3QgdG9vIGxhdGUgdG8KcmVu
YW1lIGl0LCBzdWJqZWN0IHRvIGRpc2N1c3Npb24gd2l0aCBKdWVyZ2VuIGFzIFJNLgoKPiA+IFdo
ZXJlIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHVzZXIgc3BhY2UKPiA+IGJhY2tlbmQg
Pwo+IAo+IFdlIGhhdmUgZXh0ZW5kZWQga2JkIGludGVyZmFjZSAoa2JkaWYuaCkgdG8gc3VwcG9y
dCBtdWx0aS10b3VjaCBldmVudHMKPiBhcyB3ZWxsLiBBbmQgd2UgaGF2ZQo+IGltcGxlbWVudGVk
IG93biBrYmQgYmFja2VuZCBodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9kaXNwbF9iZS8K
PiBJdCBpcyBpbnRlZ3JhdGVkIHdpdGggZGlzcGxheSBiYWNrZW5kIGFzIGJvdGggdXNlIHdheWxh
bmQgQVBJLgoKR3JlYXQuCgo+ID4gSXMgaXQgYmUgY29udHJvbGxlZCBlbnRpcmVseSB0aHJvdWdo
IHhlbnN0b3JlID8KPiAKPiBZZXMgaXQgaXMgY29udHJvbGxlZCBlbnRpcmVseSB0aHJvdWdoIHhl
bnN0b3JlOiBsaWIgeGwgY3JlYXRlcwo+IGZyb250ZW5kL2JhY2tlbmQgZW50cmllcyB3aXRoCj4g
aW5pdGlhbCBzdGF0ZXMgYW5kIGNvbmZpZ3VyYXRpb24uCgpBbmQgeW91ciBkaXNwbGF5IGJhY2tl
bmQgaW4gInRyb29wcyIgKGlzIHRoYXQgdGhlIG5hbWUgb2YgeW91cgpwcm9qZWN0KSBjaGVja3Mg
d2hldGhlciB0aGUgYmFja2VuZCB0eXBlIGlzIHNldCB0byAibGludXgiLCBzbyB0aGF0IGl0Cmtu
b3dzIHRvIGlnbm9yZSBvbmVzIHRoYXQgc2F5ICJxZW11IiA/CgpNYXliZSAibGludXgiIHNob3Vs
ZCBiZSAidHJvb3BzIi4uLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
