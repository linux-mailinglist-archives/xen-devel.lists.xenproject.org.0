Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C8AB9FF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Egu-0005GI-N4; Fri, 06 Sep 2019 13:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i6Egt-0005Fu-7Z
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:54:19 +0000
X-Inumbo-ID: d051300a-d0ad-11e9-abf6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d051300a-d0ad-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567778056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U4l+cRbNjMoqZXAEbWx9pwCdqf88S3huXMfe7MniF0A=;
 b=PJsLFUfqSA6e47pk7e2Tw4U20n56VVMWm2FTU6XP4Tn6vDQ9niV3DBoH
 X9UBwATwgPqrvBjNtDPLdCf162gAAMaR1fV85ejoHfrtbKYS9EnRo+MgT
 oR02kGKWMlKZakqYC13aS8CkRStYKVC76A4heSuDyCK3PE3omkuJvgQ70 c=;
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
IronPort-SDR: quoGAgOfajyOxSbz5zx9yHMEVFYkHoZSO1vODrXrvBEiwaC0JDGzlU1TJ5hnhKF7aZUvmKPS3+
 x1aoD0peQCnODku7oTZjtn+NjK7dW6IO7I2PwHGcnR5IUsC2HJM/Q2Cv8Xu+c301HBg0CcP3Pp
 kwW8QEBjZC3KbIlyNDGCPSlpcQVfuf/MO8nGCcmAx8sgE0mAroJBS7Gv7hazQoN9CuyIUvYazM
 wpxNdAC4HXYFy5sY/wIP5xCnpM2MO9C22nKH+lSiFP7VKoqDKXXzyffWGFkx9SozABg0z83Ddm
 cAI=
X-SBRS: 2.7
X-MesageID: 5513871
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5513871"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] sysctl/libxl: choose a sane default for HAP
Thread-Index: AQHVY+2kulpdNsGnPUakfYe0VyFh2KcdGg+AgAGSqKA=
Date: Fri, 6 Sep 2019 13:54:10 +0000
Message-ID: <e87637a4f50248b8be5f5057223c9cbe@AMSPEX02CL03.citrite.net>
References: <20190905132703.5554-1-roger.pau@citrix.com>
 <20190905132703.5554-3-roger.pau@citrix.com>
 <ca15dc5b2939422889c91e6783f0bbfb@AMSPEX02CL03.citrite.net>
In-Reply-To: <ca15dc5b2939422889c91e6783f0bbfb@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] sysctl/libxl: choose a sane default
 for HAP
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
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDE5IDE0OjUyDQo+IFRvOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFRpbSAo
WGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsNCj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBj
aXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbiBCZXVs
aWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+Ow0KPiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBSb2dlciBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENIIHYyIDIvMl0gc3lzY3RsL2xpYnhsOiBjaG9vc2UgYSBzYW5lIGRlZmF1bHQgZm9yIEhB
UA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gU2VudDogMDUgU2VwdGVtYmVyIDIw
MTkgMTQ6MjcNCj4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gQ2M6
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFu
LkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUNCj4gPiA8d2xAeGVuLm9yZz47IEFudGhvbnkg
UGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT47DQo+ID4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBj
aXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdyYWxs
DQo+ID4gPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4gPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFZvbG9keW15ciBCYWJj
aHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47DQo+ID4gUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8yXSBzeXNj
dGwvbGlieGw6IGNob29zZSBhIHNhbmUgZGVmYXVsdCBmb3IgSEFQDQo+ID4NCj4gPiBDdXJyZW50
IGxpYnhsIGNvZGUgd2lsbCBhbHdheXMgZW5hYmxlIEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAo
SEFQKSwNCj4gPiBleHBlY3RpbmcgdGhhdCB0aGUgaHlwZXJ2aXNvciB3aWxsIGZhbGxiYWNrIHRv
IHNoYWRvdyBpZiBIQVAgaXMgbm90DQo+ID4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRv
IHRoZSBkb21haW4gYnVpbGRlciB0aGF0J3Mgbm90IHRoZSBjYXNlDQo+ID4gYW55IGxvbmdlciwg
YW5kIHRoZSBoeXBlcnZpc29yIHdpbGwgcmFpc2UgYW4gZXJyb3IgaWYgSEFQIGlzIG5vdA0KPiA+
IGF2YWlsYWJsZSBpbnN0ZWFkIG9mIHNpbGVudGx5IGZhbGxpbmcgYmFjayB0byBzaGFkb3cuDQo+
ID4NCj4gPiBJbiBvcmRlciB0byBrZWVwIHRoZSBwcmV2aW91cyBmdW5jdGlvbmFsaXR5IHJlcG9y
dCB3aGV0aGVyIEhBUCBpcw0KPiA+IGF2YWlsYWJsZSBvciBub3QgaW4gWEVOX1NZU0NUTF9waHlz
aW5mbywgc28gdGhhdCB0aGUgdG9vbHN0YWNrIGNhbg0KPiA+IHNlbGVjdCBhIHNhbmUgZGVmYXVs
dCBpZiB0aGVyZSdzIG5vIGV4cGxpY2l0IHVzZXIgc2VsZWN0aW9uIG9mIHdoZXRoZXINCj4gPiBI
QVAgc2hvdWxkIGJlIHVzZWQuDQo+ID4NCj4gPiBOb3RlIHRoYXQgb24gQVJNIGhhcmR3YXJlIEhB
UCBjYXBhYmlsaXR5IGlzIGFsd2F5cyByZXBvcnRlZCBzaW5jZSBpdCdzDQo+ID4gYSByZXF1aXJl
ZCBmZWF0dXJlIGluIG9yZGVyIHRvIHJ1biBYZW4uDQo+ID4NCj4gPiBGaXhlczogZDBjMGJhN2Qz
ZGUgKCd4ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcnKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
PiANCj4gTEdUTQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgdjE6DQo+ID4gIC0g
QWxzbyByZXBvcnQgSEFQIGNhcGFiaWxpdHkgZm9yIEFSTS4NCj4gPiAgLSBQcmludCBoYXAgY2Fw
YWJpbGl0eSBpbiB4bCBpbmZvLg0KPiA+IC0tLQ0KPiA+ICB0b29scy9saWJ4bC9saWJ4bC5jICAg
ICAgICAgfCAxICsNCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgOCArKysrKysr
LQ0KPiA+ICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgfCAxICsNCj4gPiAgdG9vbHMveGwv
eGxfaW5mby5jICAgICAgICAgIHwgNSArKystLQ0KPiA+ICB4ZW4vYXJjaC9hcm0vc3lzY3RsLmMg
ICAgICAgfCAyICstDQo+ID4gIHhlbi9hcmNoL3g4Ni9zeXNjdGwuYyAgICAgICB8IDIgKysNCj4g
PiAgeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgNCArKysrDQo+ID4gIDcgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bC5jIGIvdG9vbHMvbGlieGwvbGlieGwuYw0KPiA+IGluZGV4
IGVjNzE1NzRlOTkuLjVjMGZjZjMyMGUgMTAwNjQ0DQo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGli
eGwuYw0KPiA+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmMNCj4gPiBAQCAtMzk5LDYgKzM5OSw3
IEBAIGludCBsaWJ4bF9nZXRfcGh5c2luZm8obGlieGxfY3R4ICpjdHgsIGxpYnhsX3BoeXNpbmZv
ICpwaHlzaW5mbykNCj4gPiAgICAgIHBoeXNpbmZvLT5jYXBfcHYgPSAhISh4Y3BoeXNpbmZvLmNh
cGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NBUF9wdik7DQo+ID4gICAgICBwaHlzaW5mby0+
Y2FwX2h2bV9kaXJlY3RpbyA9DQo+ID4gICAgICAgICAgISEoeGNwaHlzaW5mby5jYXBhYmlsaXRp
ZXMgJiBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8pOw0KPiA+ICsgICAgcGh5c2luZm8tPmNh
cF9oYXAgPSAhISh4Y3BoeXNpbmZvLmNhcGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NBUF9o
YXApOw0KPiA+DQo+ID4gICAgICBHQ19GUkVFOw0KPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMNCj4gPiBpbmRleCAwM2NlMTY2ZjRmLi42YTU1NmRlYThmIDEwMDY0NA0KPiA+IC0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jDQo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMNCj4gPiBAQCAtMzgsNyArMzgsMTMgQEAgaW50IGxpYnhsX19kb21haW5fY3Jl
YXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLA0KPiA+ICAgICAgbGlieGxfX2FyY2hf
ZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2MsIGNfaW5mbyk7DQo+ID4NCj4gPiAgICAg
IGlmIChjX2luZm8tPnR5cGUgIT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHsNCj4gPiAtICAgICAg
ICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmNfaW5mby0+aGFwLCB0cnVlKTsNCj4gPiArICAg
ICAgICBsaWJ4bF9waHlzaW5mbyBpbmZvOw0KPiA+ICsgICAgICAgIGludCByYyA9IGxpYnhsX2dl
dF9waHlzaW5mbyhDVFgsICZpbmZvKTsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKHJjKQ0KPiA+
ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+ID4gKw0KPiA+ICsgICAgICAgIGxpYnhsX2RlZmJv
b2xfc2V0ZGVmYXVsdCgmY19pbmZvLT5oYXAsIGluZm8uY2FwX2hhcCk7DQo+ID4gICAgICAgICAg
bGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZjX2luZm8tPm9vcywgdHJ1ZSk7DQo+ID4gICAgICB9
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9v
bHMvbGlieGwvbGlieGxfdHlwZXMuaWRsDQo+ID4gaW5kZXggYjYxMzk5Y2UzNi4uOWUxZjg1MTVk
MyAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwNCj4gPiArKysg
Yi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwNCj4gPiBAQCAtMTAyNSw2ICsxMDI1LDcgQEAg
bGlieGxfcGh5c2luZm8gPSBTdHJ1Y3QoInBoeXNpbmZvIiwgWw0KPiA+ICAgICAgKCJjYXBfaHZt
IiwgYm9vbCksDQo+ID4gICAgICAoImNhcF9wdiIsIGJvb2wpLA0KPiA+ICAgICAgKCJjYXBfaHZt
X2RpcmVjdGlvIiwgYm9vbCksICMgTm8gbG9uZ2VyIEhWTSBzcGVjaWZpYw0KPiA+ICsgICAgKCJj
YXBfaGFwIiwgYm9vbCksDQoNCkFjdHVhbGx5IEp1bGllbidzIHJldmlldyBvZiBvbmUgb2YgbXkg
cGF0Y2hlcyBwb2ludHMgb3V0IHRoYXQgdGhpcyBpZGwgY2hhbmdlIHNob3VsZCBiZSBhY2NvbXBh
bmllZCBieSBhbiBhc3NvY2lhdGVkIExJQlhMX0hBVkVfQ0FQX0hBUCBkZWZpbml0aW9uLg0KDQog
IFBhdWwNCg0KPiA+ICAgICAgXSwgZGlyPURJUl9PVVQpDQo+ID4NCj4gPiAgbGlieGxfY29ubmVj
dG9yaW5mbyA9IFN0cnVjdCgiY29ubmVjdG9yaW5mbyIsIFsNCj4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGwveGxfaW5mby5jIGIvdG9vbHMveGwveGxfaW5mby5jDQo+ID4gaW5kZXggNDZkOWM5Zjcx
Mi4uYWE2NzI0YmM3ZiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy94bC94bF9pbmZvLmMNCj4gPiAr
KysgYi90b29scy94bC94bF9pbmZvLmMNCj4gPiBAQCAtMjEwLDExICsyMTAsMTIgQEAgc3RhdGlj
IHZvaWQgb3V0cHV0X3BoeXNpbmZvKHZvaWQpDQo+ID4gICAgICAgICAgIGluZm8uaHdfY2FwWzRd
LCBpbmZvLmh3X2NhcFs1XSwgaW5mby5od19jYXBbNl0sIGluZm8uaHdfY2FwWzddDQo+ID4gICAg
ICAgICAgKTsNCj4gPg0KPiA+IC0gICAgbWF5YmVfcHJpbnRmKCJ2aXJ0X2NhcHMgICAgICAgICAg
ICAgIDolcyVzJXMlc1xuIiwNCj4gPiArICAgIG1heWJlX3ByaW50ZigidmlydF9jYXBzICAgICAg
ICAgICAgICA6JXMlcyVzJXMlc1xuIiwNCj4gPiAgICAgICAgICAgaW5mby5jYXBfcHYgPyAiIHB2
IiA6ICIiLA0KPiA+ICAgICAgICAgICBpbmZvLmNhcF9odm0gPyAiIGh2bSIgOiAiIiwNCj4gPiAg
ICAgICAgICAgaW5mby5jYXBfaHZtICYmIGluZm8uY2FwX2h2bV9kaXJlY3RpbyA/ICIgaHZtX2Rp
cmVjdGlvIiA6ICIiLA0KPiA+IC0gICAgICAgICBpbmZvLmNhcF9wdiAmJiBpbmZvLmNhcF9odm1f
ZGlyZWN0aW8gPyAiIHB2X2RpcmVjdGlvIiA6ICIiDQo+ID4gKyAgICAgICAgIGluZm8uY2FwX3B2
ICYmIGluZm8uY2FwX2h2bV9kaXJlY3RpbyA/ICIgcHZfZGlyZWN0aW8iIDogIiIsDQo+ID4gKyAg
ICAgICAgIGluZm8uY2FwX2hhcCA/ICIgaGFwIiA6ICIiDQo+ID4gICAgICAgICAgKTsNCj4gPg0K
PiA+ICAgICAgdmluZm8gPSBsaWJ4bF9nZXRfdmVyc2lvbl9pbmZvKGN0eCk7DQo+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYyBiL3hlbi9hcmNoL2FybS9zeXNjdGwuYw0KPiA+
IGluZGV4IDkyYWM5OWM5MjguLmY4Nzk0NGU4NDcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL3N5c2N0bC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3N5c2N0bC5jDQo+ID4gQEAgLTE0
LDcgKzE0LDcgQEANCj4gPg0KPiA+ICB2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9z
eXNjdGxfcGh5c2luZm8gKnBpKQ0KPiA+ICB7DQo+ID4gLSAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9
IFhFTl9TWVNDVExfUEhZU0NBUF9odm07DQo+ID4gKyAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9odm0gfCBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwOw0KPiA+ICB9DQo+
ID4NCj4gPiAgbG9uZyBhcmNoX2RvX3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsLA0K
PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMgYi94ZW4vYXJjaC94ODYvc3lz
Y3RsLmMNCj4gPiBpbmRleCA3ZWM2MTc0ZTZiLi41Nzc3YTA1ZmZjIDEwMDY0NA0KPiA+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9zeXNjdGwuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYw0K
PiA+IEBAIC0xNjMsNiArMTYzLDggQEAgdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5f
c3lzY3RsX3BoeXNpbmZvICpwaSkNCj4gPiAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9odm07DQo+ID4gICAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BW
KSApDQo+ID4gICAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBf
cHY7DQo+ID4gKyAgICBpZiAoIGh2bV9oYXBfc3VwcG9ydGVkKCkgKQ0KPiA+ICsgICAgICAgIHBp
LT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcDsNCj4gPiAgfQ0KPiA+DQo+
ID4gIGxvbmcgYXJjaF9kb19zeXNjdGwoDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KPiA+IGluZGV4IDM2
YjNmOGM0MjkuLmUwMmQ3Y2U0YzYgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGlj
L3N5c2N0bC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+ID4gQEAg
LTkwLDYgKzkwLDEwIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3Agew0KPiA+ICAgLyogVGhl
IHBsYXRmb3JtIHN1cHBvcnRzIGRpcmVjdCBhY2Nlc3MgdG8gSS9PIGRldmljZXMgd2l0aCBJT01N
VS4gKi8NCj4gPiAgI2RlZmluZSBfWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvICAgICAyDQo+
ID4gICNkZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvICAoMXU8PF9YRU5fU1lTQ1RM
X1BIWVNDQVBfZGlyZWN0aW8pDQo+ID4gKy8qIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBIYXJkd2Fy
ZSBBc3Npc3RlZCBQYWdpbmcuICovDQo+ID4gKyNkZWZpbmUgX1hFTl9TWVNDVExfUEhZU0NBUF9o
YXAgICAgICAgICAgMw0KPiA+ICsjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9oYXAgICAgICAg
ICAgICgxdTw8X1hFTl9TWVNDVExfUEhZU0NBUF9oYXApDQo+ID4gKw0KPiA+ICBzdHJ1Y3QgeGVu
X3N5c2N0bF9waHlzaW5mbyB7DQo+ID4gICAgICB1aW50MzJfdCB0aHJlYWRzX3Blcl9jb3JlOw0K
PiA+ICAgICAgdWludDMyX3QgY29yZXNfcGVyX3NvY2tldDsNCj4gPiAtLQ0KPiA+IDIuMjIuMA0K
PiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
WGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
