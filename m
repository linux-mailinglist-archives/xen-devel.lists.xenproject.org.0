Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82711E0A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 10:28:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifhBV-00006M-1g; Fri, 13 Dec 2019 09:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifhBT-00006H-Gy
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 09:24:27 +0000
X-Inumbo-ID: 5b1a27e8-1d8a-11ea-8ec5-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b1a27e8-1d8a-11ea-8ec5-12813bfff9fa;
 Fri, 13 Dec 2019 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576229066; x=1607765066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOI5D+6Qsp89fLJNSiePjd9aVYqvwjTs+8hPVGDGZg4=;
 b=Ip25ffDtBfXJ7/HsWfbciogXX+Lb5HXzOWHqLXG6g/Hfe04zh10G0L3A
 SgAYGy7l5hX9tjP+3mkLKHvyTBm16e+381341wpaScAYOQEqkLfA2NXq4
 KW16BUM4emDmtlgT3OBxRfpbp3iqNIfqdjUjOt2745+Q5ucYAKHq8op+F k=;
IronPort-SDR: ItgiI5YTcY9vcNkOGczRdSyvJ3au/2IDZzv+cjArheaPDCdiSDPdDCOsFIFR18iO1vLt74Nzg1
 KVojnTkUh4QQ==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; d="scan'208";a="14685483"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Dec 2019 09:24:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 08C9BA2F76; Fri, 13 Dec 2019 09:24:11 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 09:24:11 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 09:24:10 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 09:24:10 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, David Miller
 <davem@davemloft.net>
Thread-Topic: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
Thread-Index: AQHVsPOiKWT/MKpGekOkpRko3pMZ46e23EKAgACxiQCAADwwIA==
Date: Fri, 13 Dec 2019 09:24:10 +0000
Message-ID: <9f6d296e94744ce48d3f72fe4d3fd136@EX13D32EUC003.ant.amazon.com>
References: <20191212135406.26229-1-pdurrant@amazon.com>
 <20191212.110513.1770889236741616001.davem@davemloft.net>
 <cefcf3a4-fc10-d62a-cac9-81f0e47710a8@suse.com>
In-Reply-To: <cefcf3a4-fc10-d62a-cac9-81f0e47710a8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMDU6NDENCj4gVG86IERhdmlk
IE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50
QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHdlaS5s
aXVAa2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5ldGRldkB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBuZXQtbmV4
dF0geGVuLW5ldGJhY2s6IGdldCByaWQgb2Ygb2xkIHVkZXYNCj4gcmVsYXRlZCBjb2RlDQo+IA0K
PiBPbiAxMi4xMi4xOSAyMDowNSwgRGF2aWQgTWlsbGVyIHdyb3RlOg0KPiA+IEZyb206IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiBEYXRlOiBUaHUsIDEyIERlYyAyMDE5
IDEzOjU0OjA2ICswMDAwDQo+ID4NCj4gPj4gSW4gdGhlIHBhc3QgaXQgdXNlZCB0byBiZSB0aGUg
Y2FzZSB0aGF0IHRoZSBYZW4gdG9vbHN0YWNrIHJlbGllZCB1cG9uDQo+ID4+IHVkZXYgdG8gZXhl
Y3V0ZSBiYWNrZW5kIGhvdHBsdWcgc2NyaXB0cy4gSG93ZXZlciB0aGlzIGhhcyBub3QgYmVlbiB0
aGUNCj4gPj4gY2FzZSBmb3IgbWFueSByZWxlYXNlcyBub3cgYW5kIHJlbW92YWwgb2YgdGhlIGFz
c29jaWF0ZWQgY29kZSBpbg0KPiA+PiB4ZW4tbmV0YmFjayBzaG9ydGVucyB0aGUgc291cmNlIGJ5
IG1vcmUgdGhhbiAxMDAgbGluZXMsIGFuZCByZW1vdmVzDQo+IG11Y2gNCj4gPj4gY29tcGxleGl0
eSBpbiB0aGUgaW50ZXJhY3Rpb24gd2l0aCB0aGUgeGVuc3RvcmUgYmFja2VuZCBzdGF0ZS4NCj4g
Pj4NCj4gPj4gTk9URTogeGVuLW5ldGJhY2sgaXMgdGhlIG9ubHkgeGVuYnVzIGRyaXZlciB0byBo
YXZlIGEgZnVuY3Rpb25hbA0KPiB1ZXZlbnQoKQ0KPiA+PiAgICAgICAgbWV0aG9kLiBUaGUgb25s
eSBvdGhlciBkcml2ZXIgdG8gaGF2ZSBhIG1ldGhvZCBhdCBhbGwgaXMNCj4gPj4gICAgICAgIHB2
Y2FsbHMtYmFjaywgYW5kIGN1cnJlbnRseSBwdmNhbGxzX2JhY2tfdWV2ZW50KCkgc2ltcGx5IHJl
dHVybnMNCj4gMC4NCj4gPj4gICAgICAgIEhlbmNlIHRoaXMgcGF0Y2ggYWxzbyBmYWNpbGl0YXRl
cyBmdXJ0aGVyIGNsZWFudXAuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPg0KPiA+IElmIHVzZXJzcGFjZSBldmVyIHVzZWQg
dGhpcyBzdHVmZiwgSSBzZXJpb3VzbHkgZG91YnQgeW91IGNhbiByZW1vdmUgdGhpcw0KPiA+IGV2
ZW4gaWYgaXQgaGFzbid0IGJlZW4gdXNlZCBpbiA1KyB5ZWFycy4NCj4gDQo+IEhtbSwgZGVwZW5k
cy4NCj4gDQo+IFRoaXMgaGFzIGJlZW4gdXNlZCBieSBYZW4gdG9vbHMgaW4gZG9tMCBvbmx5LiBJ
ZiB0aGUgbGFzdCB1c2FnZSBoYXMgYmVlbg0KPiBpbiBhIFhlbiB2ZXJzaW9uIHdoaWNoIGlzIG5v
IGxvbmdlciBhYmxlIHRvIHJ1biB3aXRoIGN1cnJlbnQgTGludXggaW4NCj4gZG9tMCBpdCBjb3Vs
ZCBiZSByZW1vdmVkLiBCdXQgSSBndWVzcyB0aGlzIHdvdWxkIGhhdmUgdG8gYmUgYSByYXRoZXIg
b2xkDQo+IHZlcnNpb24gb2YgWGVuIChsaWtlIDMueD8pLg0KPiANCj4gUGF1bCwgY2FuIHlvdSBn
aXZlIGEgaGludCBzaW5jZSB3aGljaCBYZW4gdmVyc2lvbiB0aGUgdG9vbHN0YWNrIG5vDQo+IGxv
bmdlciByZWxpZXMgb24gdWRldiB0byBzdGFydCB0aGUgaG90cGx1ZyBzY3JpcHRzPw0KPiANCg0K
VGhlIHVkZXYgcnVsZXMgd2VyZSBpbiBhIGZpbGUgY2FsbGVkIHRvb2xzL2hvdHBsdWcvTGludXgv
eGVuLWJhY2tlbmQucnVsZXMgKGluIHhlbi5naXQpLCBhbmQgYSBjb21taXQgZnJvbSBSb2dlciBy
ZW1vdmVkIHRoZSBOSUMgcnVsZXMgaW4gMjAxMjoNCg0KY29tbWl0IDU3YWQ2YWZlMmEwOGEwM2M0
MGJjZDMzNmJmYjI3ZTAwOGUxZDNlNTMNCkF1dGhvcjogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCkRhdGU6ICAgVGh1IEp1bCAyNiAxNjo0NzozNSAyMDEyICswMTAwDQoN
CiAgICBsaWJ4bDogY2FsbCBob3RwbHVnIHNjcmlwdHMgZm9yIG5pYyBkZXZpY2VzIGZyb20gbGli
eGwNCg0KICAgIFNpbmNlIG1vc3Qgb2YgdGhlIG5lZWRlZCB3b3JrIGlzIGFscmVhZHkgZG9uZSBp
biBwcmV2aW91cyBwYXRjaGVzLA0KICAgIHRoaXMgcGF0Y2ggb25seSBjb250YWlucyB0aGUgbmVj
ZXNzYXJ5IGNvZGUgdG8gY2FsbCBob3RwbHVnIHNjcmlwdHMNCiAgICBmb3IgbmljIGRldmljZXMs
IHRoYXQgc2hvdWxkIGJlIGNhbGxlZCB3aGVuIHRoZSBkZXZpY2UgaXMgYWRkZWQgb3INCiAgICBy
ZW1vdmVkIGZyb20gYSBndWVzdC4NCg0KICAgIEFkZGVkIGFub3RoZXIgcGFyYW1ldGVyIHRvIGxp
YnhsX19nZXRfaG90cGx1Z19zY3JpcHRfaW5mbywgdGhhdCBpcw0KICAgIHVzZWQgdG8ga25vdyB0
aGUgbnVtYmVyIG9mIHRpbWVzIGhvdHBsdWcgc2NyaXB0cyBoYXZlIGJlZW4gY2FsbGVkIGZvcg0K
ICAgIHRoYXQgZGV2aWNlLiBUaGlzIGlzIGN1cnJlbnRseSB1c2VkIGJ5IElPRU1VIG5pY3Mgb24g
TGludXguDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KICAgIEFja2VkLWJ5OiBJYW4gSmFja3NvbjxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPg0KICAgIENvbW1pdHRlZC1ieTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0
cml4LmNvbT4NCg0KVGhlIGxhc3QgY29tbWl0IEkgY291bGQgZmluZCB0byB0aGF0IGZpbGUgbW9k
aWZpZWQgaXRzIG5hbWUgdG8geGVuLWJhY2tlbmQucnVsZXMuaW4sIGFuZCB0aGlzIHdhcyBmaW5h
bGx5IHJlbW92ZWQgYnkgR2VvcmdlIGluIDIwMTU6DQoNCmNvbW1pdCAyYmEzNjhkMTM4OTM0MDJi
MmYxZmIzYzI4M2RkY2M3MTQ2NTlkZDliDQpBdXRob3I6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAZXUuY2l0cml4LmNvbT4NCkRhdGU6ICAgTW9uIEp1bCA2IDExOjUxOjM5IDIwMTUgKzAx
MDANCg0KICAgIGxpYnhsOiBSZW1vdmUgbGludXggdWRldiBydWxlcw0KDQogICAgVGhleSBhcmUg
bm8gbG9uZ2VyIG5lZWRlZCwgaGF2aW5nIGJlZW4gcmVwbGFjZWQgYnkgYSBkYWVtb24gZm9yDQog
ICAgZHJpdmVyZG9tYWlucyB3aGljaCB3aWxsIHJ1biBzY3JpcHRzIGFzIG5lY2Vzc2FyeS4NCg0K
ICAgIFdvcnNlIHlldCwgdGhleSBzZWVtIHRvIGJlIGJyb2tlbiBmb3Igc2NyaXB0LWJhc2VkIGJs
b2NrIGRldmljZXMsIHN1Y2gNCiAgICBhcyBibG9jay1pc2NzaS4gIFRoaXMgd291bGRuJ3QgbWF0
dGVyIHNvIG11Y2ggaWYgdGhleSB3ZXJlIG5ldmVyIHJ1bg0KICAgIGJ5IGRlZmF1bHQ7IGJ1dCBp
ZiB5b3UgcnVuIGJsb2NrLWF0dGFjaCB3aXRob3V0IGhhdmluZyBjcmVhdGVkIGENCiAgICBkb21h
aW4sIHRoZW4gdGhlIGFwcHJvcHJpYXRlIG5vZGUgdG8gZGlzYWJsZSBydW5uaW5nIHVkZXYgc2Ny
aXB0cyB3aWxsDQogICAgbm90IGhhdmUgYmVlbiB3cml0dGVuIHlldCwgYW5kIHRoZSBhdHRhY2gg
d2lsbCBzaWxlbnRseSBmYWlsLg0KDQogICAgUmF0aGVyIHRoYW4gdHJ5IHRvIHNvcnQgb3V0IHRo
YXQgaXNzdWUsIGp1c3QgcmVtb3ZlIHRoZW0gZW50aXJlbHkuDQoNCiAgICBTaWduZWQtb2ZmLWJ5
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+DQogICAgQWNrZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQoNClNvLCBJIHRoaW5rIHRoaXMgbWVh
bnMgYW55b25lIHVzaW5nIGEgdmVyc2lvbiBvZiB0aGUgWGVuIHRvb2xzIHdpdGhpbiByZWNlbnQg
bWVtb3J5IHdpbGwgYmUgaGF2aW5nIHRoZWlyIGhvdHBsdWcgc2NyaXB0cyBjYWxsZWQgZGlyZWN0
bHkgYnkgbGlieGwgKGFuZCBoYXZpbmcgdWRldiBydWxlcyBwcmVzZW50IHdvdWxkIGFjdHVhbGx5
IGJlIGNvdW50ZXItcHJvZHVjdGl2ZSwgYXMgR2VvcmdlJ3MgY29tbWl0IHN0YXRlcyBhbmQgYXMg
SSBkaXNjb3ZlcmVkIHRoZSBoYXJkIHdheSB3aGVuIHRoZSBjaGFuZ2Ugd2FzIG9yaWdpbmFsbHkg
bWFkZSkuDQoNCiAgUGF1bA0KDQoNCg0KPiANCj4gSnVlcmdlbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
