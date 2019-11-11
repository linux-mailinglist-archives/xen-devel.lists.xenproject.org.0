Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB394F8102
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 21:18:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUG5j-0005pu-A7; Mon, 11 Nov 2019 20:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQsP=ZD=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iUG5i-0005pp-6i
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 20:15:14 +0000
X-Inumbo-ID: f70c9840-04bf-11ea-984a-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70c9840-04bf-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573503313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IUIJazWlNDEjF+1drtiHNsFGTwfS2BFu37/sC5bYNRY=;
 b=HRSxGLbEM/Rme+xdjDMF8gGaYXpscsl1q4L0iqIzCSgJCvDdI8ruqxYa
 CgEloEla6aX74zH+fs6tLij1lU31ecIngk+3q5cE8/byOdEJE8KZcJ4w7
 rVUT91FYSBUQIXuNzn8gk8IthqElwqKHBYH1bd7TpxWJyiGbmDKA+dYiu 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qas7uZk/ZQhhmtSppbhtd7KKMuUjolrmP53GbzHLwH5vlEip6yvl7MCQ6VL4lGsfHJ7ihLIkjX
 2+yD1wLU0Nvc4AxVhwkqrmp6y5RsJOJXsLwyCA9nkas5hFB36k4c1Ze2zi+GtoKWJ5+4L9OvgB
 koLqNXAszOXYbXtai9YNrZkp/Zpt1Ta7+KfOBw0ZKEnQOClJSbejDFAaAW7wiokQCdaJGJPm2V
 /r+fQlFysHg6KCpyy/7mfHFGmT0gxPdUssZPxjz2Us803N4k/rw0HINfhaHDTG7ZHHmOw4+nlc
 Sd8=
X-SBRS: 2.7
X-MesageID: 8267386
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,293,1569297600"; 
   d="scan'208";a="8267386"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] Introduce a description of a new optional tag for
 Backports
Thread-Index: AQHVlmgfiNV0BAuOmESFGDJkYFUlYaeF9p0A//+dM4CAAJJ8AP//0PaA
Date: Mon, 11 Nov 2019 20:15:07 +0000
Message-ID: <C6F01F7B-3A4B-48C1-B7F9-24D4298A4648@citrix.com>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <a161d23f-391d-3547-4949-ccb95fb09384@citrix.com>
 <D214323D-A890-45D6-B07B-F975FF88FC4D@citrix.com>
 <alpine.DEB.2.21.1911110859110.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911110859110.2677@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <AE7278B95C1E6A4793D5CD042A0830BE@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDExLzExLzIwMTksIDExOjAzLCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBNb24sIDExIE5vdiAyMDE5LCBMYXJz
IEt1cnRoIHdyb3RlOg0KICAgID4gT24gMTEvMTEvMjAxOSwgMDg6MTIsICJHZW9yZ2UgRHVubGFw
IiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgIE9u
IDExLzgvMTkgNzowOSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KICAgID4gICAgID4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGls
aW54LmNvbT4NCiAgICA+ICAgICA+IENDOiBqYmV1bGljaEBzdXNlLmNvbQ0KICAgID4gICAgID4g
Q0M6IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbQ0KICAgID4gICAgID4gQ0M6IGp1bGllbkB4ZW4u
b3JnDQogICAgPiAgICAgPiBDQzogbGFycy5rdXJ0aEBjaXRyaXguY29tDQogICAgPiAgICAgPiBD
QzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQ0KICAgID4gICAgID4gQ0M6IGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20NCiAgICA+ICAgICA+IENDOiBrb25yYWQud2lsa0BvcmFjbGUuY29tDQog
ICAgPiAgICAgPiBDQzogd2xAeGVuLm9yZw0KICAgID4gICAgID4gLS0tDQogICAgPiAgICAgPiAg
ZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRhZy5wYW5kb2MgfCAyMyArKysrKysrKysrKysrKysrKysr
KysrKw0KICAgID4gICAgID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspDQogICAg
PiAgICAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvcHJvY2Vzcy9iYWNrcG9ydC10YWcucGFu
ZG9jDQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IGRpZmYgLS1naXQgYS9kb2NzL3Byb2Nlc3Mv
YmFja3BvcnQtdGFnLnBhbmRvYyBiL2RvY3MvcHJvY2Vzcy9iYWNrcG9ydC10YWcucGFuZG9jDQog
ICAgPiAgICAgPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KICAgID4gICAgID4gaW5kZXggMDAwMDAw
MDAwMC4uZTU3MGVmZGNjOA0KICAgID4gICAgID4gLS0tIC9kZXYvbnVsbA0KICAgID4gICAgID4g
KysrIGIvZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRhZy5wYW5kb2MNCiAgICA+ICAgICA+IEBAIC0w
LDAgKzEsMjMgQEANCiAgICA+ICAgICA+ICtCYWNrcG9ydCBUYWcNCiAgICA+ICAgICA+ICstLS0t
LS0tLS0tLS0NCiAgICA+ICAgICA+ICsNCiAgICA+ICAgICA+ICtBIGJhY2twb3J0IHRhZyBpcyBh
biBvcHRpb25hbCB0YWcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJlcXVlc3QgYQ0KICAgID4g
ICAgID4gK2dpdmVuIGNvbW1pdCB0byBiZSBiYWNrcG9ydGVkIHRvIHRoZSBzdGFibGUgdHJlZXM6
DQogICAgPiAgICAgPiArDQogICAgPiAgICAgPiArICAgIEJhY2twb3J0OiBhbGwNCiAgICA+ICAg
ICA+ICsNCiAgICA+ICAgICA+ICtJdCBtYXJrcyBhIGNvbW1pdCBmb3IgYmVpbmcgYSBjYW5kaWRh
dGUgZm9yIGJhY2twb3J0cyB0byBhbGwgcmVsZXZhbnQNCiAgICA+ICAgICA+ICt0cmVlcy4NCiAg
ICA+ICAgICA+ICsNCiAgICA+ICAgICA+ICsgICAgQmFja3BvcnQ6IDQuOSsNCiAgICA+ICAgICA+
ICsNCiAgICA+ICAgICA+ICtJdCBtYXJrcyBhIGNvbW1pdCBmb3IgYmVpbmcgYSBjYW5kaWRhdGUg
Zm9yIGJhY2twb3J0cyB0byBhbGwgc3RhYmxlDQogICAgPiAgICAgPiArdHJlZXMgZnJvbSA0Ljkg
b253YXJkLg0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gK01haW50YWluZXJzIHJlcXVlc3Qg
dGhlIEJhY2twb3J0IHRhZyB0byBiZSBhZGRlZCBvbiBjb21taXQuDQogICAgPiAgICAgPiArQ29u
dHJpYnV0b3JzIGFyZSBhbHNvIHdlbGNvbWUgdG8gbWFyayB0aGVpciBwYXRjaGVzIHdpdGggdGhl
IEJhY2twb3J0DQogICAgPiAgICAgPiArdGFnIHdoZW4gdGhleSBkZWVtIGFwcHJvcHJpYXRlLiBN
YWludGFpbmVycyB3aWxsIHJlcXVlc3QgZm9yIGl0IHRvIGJlDQogICAgPiAgICAgPiArcmVtb3Zl
ZCB3aGVuIHRoYXQgaXMgbm90IHRoZSBjYXNlLg0KICAgID4gICAgID4gKw0KICAgID4gICAgID4g
K1BsZWFzZSBub3RlIHRoYXQgdGhlIEJhY2twb3J0IHRhZyBpcyBhICoqcmVxdWVzdCoqIGZvciBi
YWNrcG9ydCwgd2hpY2gNCiAgICA+ICAgICA+ICt3aWxsIHN0aWxsIG5lZWQgdG8gYmUgZXZhbHVh
dGVkIGJ5IHRoZSBzdGFibGUgdHJlZSBtYWludGFpbmVycy4NCiAgICA+ICAgICANCiAgICA+ICAg
ICBUaGUgdGV4dCBhbmQgdGhlIGlkZWEgYm90aCBsb29rIGdvb2QgdG8gbWUuDQogICAgDQogICAg
VGhhbmsgeW91IQ0KICAgIA0KICAgIA0KICAgID4gICAgIEJ1dCBpdCBzZWVtcyBraW5kIG9mIGJh
bGthbml6ZWQgdG8gcHV0IGl0IGluIGl0cyBvd24gZmlsZS4gIFdvdWxkIGl0IGJlDQogICAgPiAg
ICAgYmV0dGVyIHRvIHRyeSB0byBtYWtlIGEgc2xpZ2h0bHkgbW9yZSBnZW5lcmFsIGJpdCBvZiBj
b250ZW50PyAgRWl0aGVyDQogICAgPiAgICAgYWJvdXQgdGhlIGJhY2twb3J0IHByb2Nlc3MsIG9y
IGFib3V0IHRhZ3MgaW4gZ2VuZXJhbD8NCiAgICANCiAgICBZZWFoLCBpdCB3YXMgbmV2ZXIgbWVh
bnQgdG8gc3RheSBpbiBpdHMgb3duIHNlcGFyYXRlIGZpbGUuIEkgdGhvdWdodCBpdA0KICAgIHdv
dWxkIGdldCBtZXJnZWQgaW50byBhIGJpZ2dlciBmaWxlIGFib3V0IHRoZSB3aG9sZSBwcm9jZXNz
IHdoZW4gaXQgZ2V0cw0KICAgIHN1Ym1pdHRlZC4NCiAgICANCiAgICANCiAgICA+IEl0IHNob3Vs
ZCBiZSBpbiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Q
cm9qZWN0X1BhdGNoZXMjV2hhdF9pc19pbl9hX3BhdGNoLjNGDQogICAgPiBXaGF0IGlzIGN1cnJl
bnRseSBtaXNzaW5nIGlzDQogICAgPiAtIFJlbGVhc2UtQWNrZWQtYnkNCiAgICA+IC0gVGhlIG5l
dyBwcm9wb3NlZCB0YWcgDQogICAgPiANCiAgICA+IEJ1dCBtYXliZSB3ZSBzaG91bGQgaGF2ZSBh
IG1hc3RlciBkb2N1bWVudCBpbiB0cmVlLCB3aGljaCBkZWZpbmVzIHRoZSB0YWdzIGluIHVzZQ0K
ICAgID4gQW5kIHRoZW4gSSBjYW4gcmVmZXIgdG8gaXQgZnJvbSBodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjV2hhdF9pc19pbl9h
X3BhdGNoLjNGIA0KICAgIA0KICAgIEZvciBub3csIHdvdWxkIHlvdSBsaWtlIG1lIHRvIGFkZCB0
aGUgdGV4dCB0byB0aGUgd2lraSBhdA0KICAgIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93
aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyNXaGF0X2lzX2luX2FfcGF0Y2guM0Yg
Pw0KICAgIE9yIHdvdWxkIHlvdSByYXRoZXIgZG8gaXQ/DQoNCk5vOiBJIGNhbiBkbyBpdC4gSnVz
dCBwaW5nIG1lIHdoZW4gd2UgYXJlIGluIGFncmVlbWVudCBhYm91dCB0aGUgcHJvcG9zYWwNCkxh
cnMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
