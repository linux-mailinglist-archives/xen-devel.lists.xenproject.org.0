Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F257C14A69E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:55:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5l7-0005OD-5C; Mon, 27 Jan 2020 14:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw5l5-0005Nz-Hf
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:52:59 +0000
X-Inumbo-ID: b233cd6a-4114-11ea-8e9a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b233cd6a-4114-11ea-8e9a-bc764e2007e4;
 Mon, 27 Jan 2020 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580136773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x0lQYRInGv9oSH0xr2JzxBAIwArCF1yLH8sY8ALCZXA=;
 b=ihDlg8nXOc8YvSIJNNpAYGpYsJt5S4lq3cu/T20bSB+V8yAKsb61/NSf
 wrOckP/JZBdBG75BQVMCoh/XzJseSWU9GvXknuU/mTXpHcecdiHMkTYZx
 XAo3zqfQ6ECM+1VxENny4MdOaAi75RJ5a0g7Ec3tSO4pYXkR4ayFkjv/z Q=;
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
IronPort-SDR: tD3wNvSdfg6wpQyAW4PBAHeoV/f6B9bfQ9/Im8Dkkg+k4+KG4vFCo09irsoTe9Sn9v5DiGJI79
 3jDMBAVN11dPhNYgnLd2MRZ0fZuf8bc+x8BjLIynVUQ2FGflV47Uj0NJeJgvb0rFr6u/0VKZXQ
 1TRQnJsov4G/gRl4vPPOERWsIoZTMvAQ1TzxZdrrs5FUH0+C5LLrO+lwi/hduMxYQiz0zWqCSu
 gry4q7UvKLg464OhFnkO2WKTtTtB+tbjWzMtOSt/xkzBgHwA4Wu16WGPU/FdjGxi8qMlBer0Lv
 IKk=
X-SBRS: 2.7
X-MesageID: 11927201
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11927201"
Date: Mon, 27 Jan 2020 15:52:46 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20200127145246.GH57924@desktop-tdan49n.eng.citrite.net>
References: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
 <20200127122718.xz44jspb5wslprtt@debian>
 <20200127142836.GG57924@desktop-tdan49n.eng.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127142836.GG57924@desktop-tdan49n.eng.citrite.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PVH PCI passthrough for DomUs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yZ290IHRvIHNldCAnVG86JyBjb3JyZWN0bHkuCgpPbiBNb24sIEphbiAyNywgMjAyMCBhdCAw
MzoyODozNlBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDI3
LCAyMDIwIGF0IDEyOjI3OjE4UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiBDYyBSb2dlcgo+
IAo+IFRoYW5rcyA6KS4KPiAKPiA+IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDExOjMwOjQyUE0g
LTA4MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiA+IEhpIQo+ID4gPiAKPiA+ID4gSSd2
ZSBqdXN0IHRyaWVkIHRoaXMgd2l0aCBYZW4gNC4xMy4wIGFuZCBpdCBzZWVtcyBsaWtlIHRoYXQg
aXMgc3RpbGwKPiA+ID4gbm90IHN1cHBvcnRlZC4KPiAKPiBObywgdGhlcmUgaGFzbid0IGJlZW4g
bXVjaCBwcm9ncmVzcyBvbiB0aGlzIHNhZGx5Lgo+IAo+ID4gPiBUaGlzIG1ha2VzIG1lIGN1cmlv
dXMgaWYgYW55Ym9keSBpcyB3b3JraW5nIG9uIHRoaXMgYW5kIHdoZXRoZXIKPiA+ID4gdGhlcmUn
cyBhbnl0aGluZyB3ZSBjYW4gZG8gdG8gaGVscCBhY2NlbGVyYXRlIHRoZSBlZmZvcnQuCj4gCj4g
VGhlIGZpcnN0IHN0ZXAgd291bGQgYmUgdG8gZ2V0IHZQQ0kgaG9va2VkIGludG8gdGhlIGlvcmVx
IG1hY2hpbmVyeSwKPiBzbyB0aGF0IGEgZG9tYWluIGNhbiBoYXZlIGRldmljZXMgb24gdGhlIGVt
dWxhdGVkIFBDSSBidXMgaGFuZGxlZCBieQo+IHZQQ0kgd2hpbGUgb3RoZXJzIGFyZSBoYW5kbGVk
IGJ5IGV4dGVybmFsIGlvcmVxIGVtdWxhdG9ycy4gSSd2ZSBwb3N0ZWQKPiBhIHYzIG9mIHRoaXMg
d29yayBvbiBTZXB0ZW1iZXI6Cj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAzMjc4Lmh0bWwKPiAKPiBCdXQgSSBoYXZl
bid0IGdvdCB0aW1lIHRvIGdvIG92ZXIgdGhlIGNvbW1lbnRzIGFuZCBwb3N0IGEgbmV3IHZlcnNp
b24uCj4gCj4gT25jZSB0aGF0J3MgZG9uZSB0aGUgcmVtYWluaW5nIHN0ZXAgd291bGQgYmUgdG8g
bWFrZSB2UENJIHNhZmUgZm9yCj4gdW5wcml2aWxlZ2VkIGd1ZXN0cy4gV2UgbmVlZCB0byBhc3N1
cmUgdGhhdCBndWVzdHMgY2FuIG9ubHkgd3JpdGUgdG8KPiBzcGVjaWZpYyBiaXRzIG9mIHRoZSBj
b25maWcgc3BhY2UsIGFuZCBuZWVkIHRvIGxpbWl0IHRoZSBjYXBhYmlsaXRpZXMKPiB0aGF0IGFy
ZSBleHBvc2VkIHRvIHRoZSBvbmVzIFhlbiBrbm93cyB0byBiZSBzYWZlIHRvIGhhbmRsZS4gVGhp
cyBjYW4KPiBiZSB3b3JrZWQgYnkgbXVsdGlwbGUgcGVvcGxlIGNvbmN1cnJlbnRseSBJTU8sIGJ1
dCByZXF1aXJlcyBzdGVwIDEKPiAoaW50ZWdyYXRpb24gd2l0aCBpb3JlcSkgdG8gYmUgZmluaXNo
ZWQgZmlyc3QuCj4gCj4gSSdtIG1vcmUgdGhhbiBoYXBweSBmb3Igc29tZW9uZSB0byBwaWNrIGFu
eSBvZiB0aG9zZSB0YXNrcywgaW5jbHVkaW5nCj4gdGhlIGludGVncmF0aW9uIG9mIHZQQ0kgd2l0
aCB0aGUgaW9yZXEgbWFjaGluZXJ5LiBJZiBub3QsIEkgZXhwZWN0IEkKPiB3aWxsIGJlIGFibGUg
dG8gZG8gc29tZSB3b3JrIG9uIHRoaXMgaW4gYSBjb3VwbGUgb2Ygd2Vla3MsIGJ1dCB0aGF0Cj4g
ZGVwZW5kcyBvbiBub3RoaW5nIGVsc2UgZ2V0dGluZyBvbiBmaXJlLCBhbmQgbWUgYmVpbmcgYWJs
ZSB0byBmbHVzaCBteQo+IHF1ZXVlIG9mIHBlbmRpbmcgcGF0Y2hlcy4KPiAKPiBXb3VsZCB5b3Ug
YmUgdXAgdG8gcGljayBzb21lIG9mIHRoZXNlIHRhc2tzPwo+IAo+IEkgY2FuIHRyeSB0byBzcGVl
ZHVwIHRoZSB2UENJIGlvcmVxIGludGVncmF0aW9uIGlmIHRoZXJlJ3MgcGVvcGxlCj4gd2lsbGlu
ZyB0byB3b3JrIG9uIHRoZSByZW1haW5pbmcgc3RlcHMsIEkgaGF2ZW4ndCBkb25lIHNvIGJlY2F1
c2UgSQo+IGRpZG4ndCBzZWUgbXVjaCBpbnRlcmVzdCBpbiBnZW5lcmFsLCBhbmQgSSB3YXMgZXhw
ZWN0aW5nIHRvIGJlIHRoZQo+IG9ubHkgb25lIHdvcmtpbmcgb24gdGhlIHJlbWFpbmluZyBzdGVw
cyBhbnl3YXkuCj4gCj4gUmVnYXJkcywgUm9nZXIuCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
