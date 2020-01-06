Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE51313C7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:36:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTSQ-0003uT-Vi; Mon, 06 Jan 2020 14:34:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HznK=23=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ioTSQ-0003uK-08
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:34:14 +0000
X-Inumbo-ID: 96ec9fd4-3091-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ec9fd4-3091-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578321245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pFQjoyJEFWnwfayN3um3RaI5CALkGxVMlWdJQMSvi/8=;
 b=WZYn4gdg+jwEw03VCAcTib9oDShslnZiZlfic4QpgpaSSpDqO1zumlXP
 cGvTAWGiE5PrVQCvsc3gBBpYdVk7wdYCpWetTVzYqXyfD3avs7f7NUUbf
 6hO3HzAH8UjPBDMgZVeHEwv/Q9Av/fiScJ/VdMAEmT78GMpytEfPE+JLq A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WVhdmsej9u0flaNFJuZhFWCKEsF08J8oVboXVwWspNxxDFfFWFcisYtah0H7oY08Lx8+l1qJYx
 WxB6zDicrSRYDVcTVXp5FR0U9Q4XyzpSwdr+RnQjXF03P5EsQ5dE22oXf3IDeOnF66Xr0Mgdw2
 Mjlvm57g45bo1BhVr+705nf8dp/PuFczgDCE6AnWR/x9+kUYShantPs4Rf8bSwd0IUr1/IFK9I
 kaCLBYnOCfQ3e8mN2W95VjWFO3TYdq4l0oErOWBXHwIdHNWByWoVCWOkQq79V9ahNP433c/WV2
 7ZU=
X-SBRS: 2.7
X-MesageID: 10923132
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10923132"
Date: Mon, 6 Jan 2020 14:34:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200106143402.GJ1267@perard.uk.xensource.com>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
 <20191219144217.305851-3-anthony.perard@citrix.com>
 <20200103142907.ylckq7fh2h536w72@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103142907.ylckq7fh2h536w72@debian>
Subject: Re: [Xen-devel] [XEN PATCH 2/2] automation: Cache sub-project git
 tree in build jobs
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDI6Mjk6MDdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIERlYyAxOSwgMjAxOSBhdCAwMjo0MjoxN1BNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IEdpdExhYiBoYXZlIGEgY2FjaGluZyBjYXBhYmlsaXR5LCBzZWUgWzFdLiBM
ZXQncyB1c2UgaXQgdG8gYXZvaWQgdXNpbmcKPiA+IEludGVybmV0IHRvbyBvZnRlbi4KPiA+IAo+
ID4gVGhlIGNhY2hlIGlzIHNldHVwIHNvIHRoYXQgd2hlbiB4ZW4uZ2l0L0NvbmZpZy5tayBpcyBj
aGFuZ2VkLCB0aGUKPiA+IGNhY2hlIHdpbGwgbmVlZCB0byBiZSByZWNyZWF0ZWQuIFRoaXMgaGFz
IGJlZW4gY2hvc2VuIGJlY2F1c2UgdGhhdCBpcwo+ID4gd2hlcmUgdGhlIGluZm9ybWF0aW9uIGFi
b3V0IGhvdyB0byBjbG9uZSBzdWItcHJvamVjdCB0cmVlcyBpcyBlbmNvZGVkCj4gPiAocmV2aXNp
b25zKS4gVGhhdCBtYXkgbm90IHdvcmsgZm9yIHFlbXUteGVuIHRyZWUgd2hpY2ggdXN1YWxseSBp
cwo+ID4gYG1hc3RlcicsIGJ1dCB0aGF0IHNob3VsZCBiZSBmaW5lIGZvciBub3cuCj4gPiAKPiA+
IFRoZSBjYWNoZSBpcyBwb3B1bGF0ZWQgb2YgImdpdCBidW5kbGUiIHdoaWNoIHdpbGwgY29udGFp
biBhIG1pcnJvciBvZgo+ID4gdGhlIG9yaWdpbmFsIHJlcG8sIGFuZCBjYW4gYmUgY2xvbmVkIGZy
b20uIElmIHRoZSBidW5kbGUgZXhpc3QsIHRoZQo+ID4gc2NyaXB0IGhhdmUgdGhlIFhlbiBtYWtl
ZmlsZXMgY2xvbmUgZnJvbSBpdCwgb3RoZXJ3aXNlIGl0IHdpbGwgY2xvbmUKPiA+IGZyb20gdGhl
IG9yaWdpbmFsIFVSTCBhbmQgdGhlIGJ1bmRsZXMgd2lsbCBiZSBjcmVhdGVkIGp1c3QgYWZ0ZXIu
Cj4gPiAKPiA+IFdlIGhhdmUgbW9yZSB0aGFuIG9uZSBydW5uZXIgaW4gR2l0TGFiLCBhbmQgbm8g
c2hhcmVkIGNhY2hlIGJldHdlZW4KPiA+IHRoZW0sIHNvIGV2ZXJ5IGJ1aWxkIGpvYnMgd2lsbCBi
ZSByZXNwb25zaWJsZSB0byBjcmVhdGUgdGhlIGNhY2hlLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9k
b2NzLmdpdGxhYi5jb20vZWUvY2kveWFtbC9SRUFETUUuaHRtbCNjYWNoZQo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAK
PiBUaGlzIGlzIGEgZ29vZCBpbXByb3ZlbWVudC4KPiAKPiBIYXZlIHlvdSBydW4gdGhpcyBpbiBH
aXRsYWIgQ0k/IENhbiB5b3UgcG9pbnQgbWUgdG8gYSBydW4/CgpJIGhhdmUgdXNlIHRoZSBDSSB0
byBkZXZlbG9wIHRoZSBwYXRjaCwgc28geWVzIEkgaGF2ZSBhIHJ1biBvZiBpdC4gQnV0Cml0IGlz
IGEgcnVuIG1hZGUgd2l0aCBteSB3aXAgYnJhbmNoLCBzdGlsbCBpdCBzaG91bGQgYmUgdGhlIHNh
bWUgcmVzdWx0CmlmIGl0IHdhcyBkb25lIHdpdGggdGhlIGZpbmFsIHBhdGNoOgpodHRwczovL2dp
dGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FudGhvbnlwZXIveGVuL3BpcGVsaW5lcy8xMDQz
NDM2MjEKCj4gPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUu
c2ggYi9hdXRvbWF0aW9uL3NjcmlwdHMvcHJlcGFyZS1jYWNoZS5zaAo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA3NTUKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDE3ZjFiOGYwNjcyCj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvcHJlcGFyZS1jYWNoZS5zaAo+ID4g
QEAgLTAsMCArMSw1MiBAQAo+ID4gKyMhL2Jpbi9iYXNoCj4gPiArCj4gPiArc2V0IC1leAo+ID4g
Kwo+ID4gK2NhY2hlZGlyPSIke0NJX1BST0pFQ1RfRElSOj1gcHdkYH0vY2lfY2FjaGUiCj4gPiAr
bWtkaXIgLXAgIiRjYWNoZWRpciIKPiA+ICsKPiA+ICtkZWNsYXJlIC1BIHIKPiA+ICtyW2V4dHJh
cy9taW5pLW9zXT1NSU5JT1NfVVBTVFJFQU1fVVJMCj4gPiArclt0b29scy9xZW11LXhlbi1kaXJd
PVFFTVVfVVBTVFJFQU1fVVJMCj4gPiArclt0b29scy9xZW11LXhlbi10cmFkaXRpb25hbC1kaXJd
PVFFTVVfVFJBRElUSU9OQUxfVVJMCj4gPiArclt0b29scy9maXJtd2FyZS9vdm1mLWRpcl09T1ZN
Rl9VUFNUUkVBTV9VUkwKPiA+ICtyW3Rvb2xzL2Zpcm13YXJlL3NlYWJpb3MtZGlyXT1TRUFCSU9T
X1VQU1RSRUFNX1VSTAo+IAo+IERvZXMgdGhpcyBtZWFuIGlmIGluIHRoZSBmdXR1cmUgd2UgYWRk
IG9yIHJlbW92ZSB0cmVlcyB3ZSB3aWxsIG5lZWQgdG8KPiBtb2RpZnkgdGhpcyBwYXJ0IGluIHRo
ZSBzYW1lIGNvbW1pdD8KCldlIHdvdWxkIG5lZWQgdG8gbW9kaWZ5IHRoZSBzY3JpcHQgd2hlbiB0
cmVlcyBhcmUgcmVtb3ZlZCwgYmVjYXVzZSBJCmhhdmVuJ3QgdGhvdWdodCBvZiB0aGF0LiBCdXQg
d2hlbiB0cmVlcyBhcmUgYWRkZWQsIHRoZSBzY3JpcHQgY2FuIGJlCmNoYW5nZWQgaW4gYSBmb2xs
b3ctdXAuCgpJZGVhbGx5LCB3ZSB3b3VsZCB1c2UgdGhlIE1ha2VmaWxlcyB0byBkaXNjb3ZlcnMg
dGhlIGdpdCBjbG9uZXMgdGhhdCBjYW4KYmUgY2FjaGVkLCBidXQgdGhhdCdzIG5vdCBwb3NzaWJs
ZSBqdXN0IHlldC4KCkluIHRoZSBtZWFuIHRpbWUsIEkgdGhpbmsgSSBzaG91bGQgbWFrZSB0aGUg
c2NyaXB0IG1vcmUgcm9idXN0IGFnYWluc3QKcmVtb3ZhbCBvZiB0cmVlcywgc28gaXQgZG9lc24n
dCBoYXZlIHRvIGJlIG1vZGlmaWVkIGluIHRoZSBzYW1lIGNvbW1pdC4KClRoYW5rcywKCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
