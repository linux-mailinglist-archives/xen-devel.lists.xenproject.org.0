Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE4BB703
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:43:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPUj-0007ac-EW; Mon, 23 Sep 2019 14:39:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCPUh-0007aX-RX
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 14:39:15 +0000
X-Inumbo-ID: e9fdb516-de0f-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9fdb516-de0f-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569249554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B1GAnvkSQCwrQaLb5wpcn2v4hKJf+VvlzIIuGeJ2Fcg=;
 b=ZlUHD5abMr9kmnS78itjI3E0vliZhqUbiZoGrC+1bMJbeJQGlQtId2rK
 SaTcPviXnOj3JNLazHoNj+Sw6Y0igxdvWjIDWEtfk1Y78P/PW7Pi7dOUp
 /WwUxIHaKS68tYlCSkKFvdBMN6/YZERoWE+BajgUiOGf+ZGRlqPzAvh1n s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /RlxCmWgEX7dppiSPLqJMBQzbDoHCD8FsWbwahtUeg0vkoVNEiCdPkDU9O7sZjyQ7uijPlox4F
 wQlVSCo8XJXCW1U+6Fit7pSjDHUyofM/00ttoAUA1l4wMrO2f1xuI9MlPLTA8HPo5EdEcpwce5
 NUmqqZF7iBJyFwqkXGbn0XJH778RUZY4hhadndRAwg/En2Z4XMsZEkI6670wiaym3p42M0uEVt
 hfJdvgOiCIur7Ok1xX46it/Z6dXe1TERflt7vbSiip+Q4856u1uGHaCurfJbcvxVDjuQJSi9sD
 qME=
X-SBRS: 2.7
X-MesageID: 6262925
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="6262925"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Wei Liu' <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
Thread-Index: AQHVcfc0mf3MiCY5wEmvlk07Intk2qc5FCDA///qIQCAACrzIP//7WuAgAAK6oCAACOUgP//6ceAAATGnnA=
Date: Mon, 23 Sep 2019 14:39:10 +0000
Message-ID: <e715a67310164f59bc5a78e633b435af@AMSPEX02CL03.citrite.net>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
 <20190923125431.mpoyvjj7dz6ef4df@debian>
 <20190923133335.ktlnpbxqnanraytq@debian>
 <7266c9a91c7c4dcba0aab375fa5aad08@AMSPEX02CL03.citrite.net>
 <20190923142123.h6c36wvmujghrhtm@debian>
In-Reply-To: <20190923142123.h6c36wvmujghrhtm@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMjMgU2VwdGVtYmVyIDIwMTkgMTU6MjEKPiBUbzogUGF1bCBEdXJyYW50IDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgWGVuIERl
dmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUK
PiA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci1uZXh0IFJG
QyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiAKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAw
MTo0NzoxNFBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IFNlbnQ6
IDIzIFNlcHRlbWJlciAyMDE5IDE0OjM0Cj4gPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgo+ID4gPiBDYzogJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgWGVuIERl
dmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUK
PiA+ID4gPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPjsgTWljaGFlbCBLZWxsZXkKPiA+ID4gPG1pa2VsbGV5QG1pY3Jvc29mdC5j
b20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENI
IGZvci1uZXh0IFJGQyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiA+ID4KPiA+ID4gQW5kIGEg
Yml0IG1vcmUgdGhvdWdodC4KPiA+ID4KPiA+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDE6
NTQ6MzFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gWy4uLl0KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gUGVyIFRMRlMsIGVWTUNTIHNob3VsZCBiZSB1c2VkIGJ5IEwxIFhlbi4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBZZXMsIEkgZ3Vlc3MgaXQgb25seSBuZWVkcyB0byBiZSB1c2VkIGJ5IEwx
LCBidXQgV2luZG93cyBpcyB1c2luZyBhbgo+ID4gPiA+ID4gaW5jcmVhc2luZyBudW1iZXIgb2Yg
Vk1zIGZvciB2YXJpb3VzIHB1cnBvc2VzIHNvIEkgdGhpbmsgbWFraW5nIGl0Cj4gPiA+ID4gPiBz
dGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IE5vdCBzdXJlIHdoYXQgeW91IG1lYW50IGJ5IEVQVCBmbHVzaC4gSWYgeW91IG1lYW4gdGhp
bmdzIGxpa2UKPiA+ID4gPiA+ID4gSHZGbHVzaEd1ZXN0UGh5c2ljYWxBZGRyZXNzU3BhY2UsIEkg
dGhpbmsgdGhleSBzaG91bGQgYmUgdXNlZCBieSBYZW4KPiA+ID4gPiA+ID4gb25seSBhcyB3ZWxs
LiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGV5IHNob3VsZCBiZSBleHBvc2UgdG8gTDIgZ3Vlc3Rz
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFllcywgdGhhdCdzIHdoYXQgSSBtZWFu
dCBhbmQsIGFnYWluLCBJIHdhcyB0aGlua2luZyBhYm91dCB0aGUgbmVzdGVkCj4gPiA+ID4gPiBX
aW5kb3dzIGd1ZXN0IHVzaW5nIFZNcyBpdHNlbGYuCj4gPiA+ID4KPiA+ID4gPiBTbyB0aGlzIGlz
IGJhc2ljYWxseSBuZXN0ZWQgb24gbmVzdGVkLiBJJ20gbm90IHN1cmUgaG93IHRvIG1ha2UgdGhh
dAo+ID4gPiA+IHdvcmsgeWV0LiAgSSdtIGFsc28gbm90IHN1cmUgaG93IHdlbGwgdGhlc2UgaW50
ZXJmYWNlcyBzdGFjay4gVExGUyBvbmx5Cj4gPiA+ID4gZGVzY3JpYmVzIG9uZSBsZXZlbCBvZiBu
ZXN0aW5nLiBJIHdpbGwgbmVlZCB0byBhc2sgaWYgd2UgY2FuIG1ha2UgbmVzdGVkCj4gPiA+ID4g
b24gbmVzdGVkIHdvcmsuCj4gPiA+ID4KPiA+ID4KPiA+ID4gU2luY2UgTDIgUm9vdCBpcyBXaW5k
b3dzIGluIGEgSHlwZXItViBzZXR1cCwgY2hhbmNlcyBhcmUgd2hhdCB5b3Ugd2FudAo+ID4gPiBh
bHJlYWR5IHdvcmtzLiBPZiBjb3Vyc2UgdGhpcyBkZXBlbmRzIG9uIHdoZXRoZXIgV2luZG93cywg
d2hlbiBydW5uaW5nCj4gPiA+IGFzIFJvb3Qgb3IgQ2hpbGQsIHVzZXMgVk0gcmVsYXRlZCBmZWF0
dXJlcy4KPiA+ID4KPiA+ID4gSSdtIG5vdCB2ZXJzZWQgaW4gV2luZG93cyBmZWF0dXJlcy4gSWYg
eW91IGhhdmUgc3BlY2lmaWMgdGhpbmdzIGluIG1pbmQsCj4gPiA+IEkgY2FuIGFzayBmb3IgbW9y
ZSBkZXRhaWxzIGFuZCB0aGluayBhYm91dCBob3cgdG8gaW1wbGVtZW50IHRoZW0gaW4gWGVuLgo+
ID4KPiA+IFdlbGwsIGVWTUNTIHdvdWxkIGJlIGEgbWFqb3Igb25lLiBJZiB0aGUgTDIgV2luZG93
cyBjb3VsZCBiZSB0b2xkIHRvCj4gPiB1c2UgdGhhdCByYXRoZXIgdGhhbiBMMCBoYXZlIHRvIGJv
dW5jZSBpbmRpdmlkdWFsIFZNUkVBRC9WTVdSSVRFcyB1cAo+ID4gdG8gTDEgdGhlbiB0aGF0IHdv
dWxkIGJlIGEgd2luLgo+IAo+IE9oLCBJIHdhcyB0aGlua2luZyBtb3JlIGFib3V0IG5hbWVzIG9m
IFdpbmRvd3Mgc3BlY2lmaWMgaGlnaC1sZXZlbAo+IGZlYXR1cmVzLiBZZXMgSSBjYW4gZGVmaW5p
dGVseSBhc2sgd2hldGhlciBlVk1DUyBpcyBleHBvc2VkIHRvIEwyIERvbTAgLwo+IFJvb3QuCgpP
aCwgSSBzZWUuIFRoZSBtYWluIG9uZXMgYXJlICdjcmVkZW50aWFsIGd1YXJkJyBhbmQgdGhlIG1v
cmUgcmVjZW50ICdzYW5kYm94Jy4KCiAgUGF1bAoKPiAKPiBXZWkuCj4gCj4gPgo+ID4gICBQYXVs
Cj4gPgo+ID4gPgo+ID4gPiBXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
