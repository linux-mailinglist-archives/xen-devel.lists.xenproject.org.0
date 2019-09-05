Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB3AA523
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sCS-0008Ae-GU; Thu, 05 Sep 2019 13:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4qbh=XA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i5sCR-0008AS-Ao
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:53:23 +0000
X-Inumbo-ID: 85de38c8-cfe4-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85de38c8-cfe4-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567691602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b8rc7H05tbhpnsb9M7i6h9CRSF1ofRp+inieBJU5LyM=;
 b=ZJJtdwnrqPy+zP6ct5LRNQ0OWAtxkIYlYbMrFaZVNFcNLZQf7v4BmnDl
 fR9A1/h5C0ph+1r0DyI2Ab8Rxi1l1q4ds52MZER0AWFuTGnZ0Lnh02uc4
 Oep5VX0S/Esj6bQzvSdGuSiaGCaA20shijNeIoOK3VaidrUfnBqH2C0P3 c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jVTZeWcWP+bMy5nyzN5pUqKiisc3uz1VCb7d21vQvfrQOzUYHS0qfBMQUAGaiYRvdpwq7z6tC5
 /IIsPteqXUTaUCG9paQavx+hbdnzSSZE8yZzsZ1QzMbS0tgn48jIFYOe9C09nZLUG/nXf8Uh78
 2H719c+5SRkX0xcid/Y3NHwdTzuXXFOrrBgBixG0Fszd5RHtGacELLt4mAGL9hMWHLAVlkreKp
 6hshwQn6bkobtXD2tehUDSZ7KMc9Mc1Txx8GkVgc5RTuQ4OrGFfJgka1m4t8j4vpKvxedlKGzT
 QUU=
X-SBRS: 2.7
X-MesageID: 5409813
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5409813"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 1/2] sysctl: report existing physcaps on
 ARM
Thread-Index: AQHVY+3XtrDgfVznh0CdU7Xwr5GC/qcdGnJA
Date: Thu, 5 Sep 2019 13:53:17 +0000
Message-ID: <6a10bf51ca454c16a3e9db17fd48dab8@AMSPEX02CL03.citrite.net>
References: <20190905132703.5554-1-roger.pau@citrix.com>
 <20190905132703.5554-2-roger.pau@citrix.com>
In-Reply-To: <20190905132703.5554-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] sysctl: report existing physcaps on
 ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm5lDQo+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDE5IDE0OjI3DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsN
Cj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0
aW1AeGVuLm9yZz47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgMS8yXSBzeXNjdGw6IHJlcG9y
dCBleGlzdGluZyBwaHlzY2FwcyBvbiBBUk0NCj4gDQo+IEN1cnJlbnQgcGh5c2NhcHMgaW4gWEVO
X1NZU0NUTF9waHlzaW5mbyBhcmUgb25seSB1c2VkIGJ5IHg4NiwgYWxiZWl0DQo+IHRoZSBjYXBh
YmlsaXRpZXMgdGhlbXNlbHZlcyBhcmUgbm90IHg4NiBzcGVjaWZpYy4NCj4gDQo+IFRoaXMgcGF0
Y2ggYWRkcyBzdXBwb3J0IGZvciBhbHNvIHJlcG9ydGluZyB0aGUgY3VycmVudCBjYXBhYmlsaXRp
ZXMgb24NCj4gQVJNIGhhcmR3YXJlLiBOb3RlIHRoYXQgb24gQVJNIFBIWVNDQVBfaHZtIGlzIGFs
d2F5cyByZXBvcnRlZCwgYW5kDQo+IHNldHRpbmcgUEhZU0NBUF9kaXJlY3RpbyBoYXMgYmVlbiBt
b3ZlZCB0byBjb21tb24gY29kZSBzaW5jZSB0aGUgc2FtZQ0KPiBsb2dpYyB0byBzZXQgaXQgaXMg
dXNlZCBieSB4ODYgYW5kIEFSTS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4g
IC0gTmV3IGluIHRoaXMgdmVyc2lvbi4NCj4gLS0tDQo+ICB4ZW4vYXJjaC9hcm0vc3lzY3RsLmMg
ICAgICAgfCA1ICsrKystDQo+ICB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgfCAyIC0tDQo+
ICB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAyICsrDQo+ICB4ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmggfCA2ICsrKy0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N5c2N0
bC5jIGIveGVuL2FyY2gvYXJtL3N5c2N0bC5jDQo+IGluZGV4IGZiZmRiNDRlZmYuLjkyYWM5OWM5
MjggMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYw0KPiArKysgYi94ZW4vYXJj
aC9hcm0vc3lzY3RsLmMNCj4gQEAgLTEyLDcgKzEyLDEwIEBADQo+ICAjaW5jbHVkZSA8eGVuL2h5
cGVyY2FsbC5oPg0KPiAgI2luY2x1ZGUgPHB1YmxpYy9zeXNjdGwuaD4NCj4gDQo+IC12b2lkIGFy
Y2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKSB7IH0NCj4gK3Zv
aWQgYXJjaF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpDQo+ICt7
DQo+ICsgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtOw0KPiAr
fQ0KPiANCj4gIGxvbmcgYXJjaF9kb19zeXNjdGwoc3RydWN0IHhlbl9zeXNjdGwgKnN5c2N0bCwN
Cj4gICAgICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3Rs
X3QpIHVfc3lzY3RsKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5c2N0bC5jIGIveGVu
L2FyY2gveDg2L3N5c2N0bC5jDQo+IGluZGV4IGM1MGQ5MTBhMWMuLjdlYzYxNzRlNmIgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvc3lz
Y3RsLmMNCj4gQEAgLTE2Myw4ICsxNjMsNiBAQCB2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3RydWN0
IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKQ0KPiAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9
IFhFTl9TWVNDVExfUEhZU0NBUF9odm07DQo+ICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19Q
VikgKQ0KPiAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9w
djsNCj4gLSAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQ0KPiAtICAgICAgICBwaS0+Y2FwYWJpbGl0
aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbzsNCj4gIH0NCj4gDQo+ICBsb25nIGFy
Y2hfZG9fc3lzY3RsKA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9j
b21tb24vc3lzY3RsLmMNCj4gaW5kZXggZmNmMmQyZmQ3Yy4uOTJiNGVhMGQyMSAxMDA2NDQNCj4g
LS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiArKysgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+
IEBAIC0yNjcsNiArMjY3LDggQEAgbG9uZyBkb19zeXNjdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQ0KPiAgICAgICAgICBwaS0+Y3B1X2toeiA9IGNwdV9r
aHo7DQo+ICAgICAgICAgIHBpLT5tYXhfbWZuID0gZ2V0X3VwcGVyX21mbl9ib3VuZCgpOw0KPiAg
ICAgICAgICBhcmNoX2RvX3BoeXNpbmZvKHBpKTsNCj4gKyAgICAgICAgaWYgKCBpb21tdV9lbmFi
bGVkICkNCj4gKyAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlT
Q0FQX2RpcmVjdGlvOw0KPiANCj4gICAgICAgICAgaWYgKCBjb3B5X3RvX2d1ZXN0KHVfc3lzY3Rs
LCBvcCwgMSkgKQ0KPiAgICAgICAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwu
aA0KPiBpbmRleCA5MWM0OGRjYWUwLi4zNmIzZjhjNDI5IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvc3lzY3RsLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5o
DQo+IEBAIC04MSwxMyArODEsMTMgQEAgc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7DQo+ICAg
KiBHZXQgcGh5c2ljYWwgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGhvc3QgbWFjaGluZQ0KPiAgICov
DQo+ICAvKiBYRU5fU1lTQ1RMX3BoeXNpbmZvICovDQo+IC0gLyogKHg4NikgVGhlIHBsYXRmb3Jt
IHN1cHBvcnRzIEhWTSBndWVzdHMuICovDQo+ICsgLyogVGhlIHBsYXRmb3JtIHN1cHBvcnRzIEhW
TSBndWVzdHMuICovDQo+ICAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfaHZtICAgICAgICAg
IDANCj4gICNkZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSAgICAgICAgICAgKDF1PDxfWEVO
X1NZU0NUTF9QSFlTQ0FQX2h2bSkNCj4gLSAvKiAoeDg2KSBUaGUgcGxhdGZvcm0gc3VwcG9ydHMg
UFYgZ3Vlc3RzLiAqLw0KPiArIC8qIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBQViBndWVzdHMuICov
DQo+ICAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfcHYgICAgICAgICAgIDENCj4gICNkZWZp
bmUgWEVOX1NZU0NUTF9QSFlTQ0FQX3B2ICAgICAgICAgICAgKDF1PDxfWEVOX1NZU0NUTF9QSFlT
Q0FQX3B2KQ0KPiAtIC8qICh4ODYpIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBkaXJlY3QgYWNjZXNz
IHRvIEkvTyBkZXZpY2VzIHdpdGggSU9NTVUuICovDQo+ICsgLyogVGhlIHBsYXRmb3JtIHN1cHBv
cnRzIGRpcmVjdCBhY2Nlc3MgdG8gSS9PIGRldmljZXMgd2l0aCBJT01NVS4gKi8NCj4gICNkZWZp
bmUgX1hFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgICAgMg0KPiAgI2RlZmluZSBYRU5fU1lT
Q1RMX1BIWVNDQVBfZGlyZWN0aW8gICgxdTw8X1hFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbykN
Cj4gIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvIHsNCj4gLS0NCj4gMi4yMi4wDQo+IA0KPiAN
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVu
LWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
