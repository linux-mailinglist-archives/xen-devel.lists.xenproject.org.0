Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3738A119
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:30:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBI2-00072f-K1; Mon, 12 Aug 2019 14:27:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=an0M=WI=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hxBI1-00072Q-79
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:27:13 +0000
X-Inumbo-ID: 457f276d-bd0d-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 457f276d-bd0d-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565620032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LKpMvbBNwOmYH4QodmOpCDZCODAiRhcCOd7OwJWsdWc=;
 b=G9ncTsZOKS2n4TnFv0iQUd3+5ZOuSg0JsW0RFwmBO7MCdpDs/z2zrrFt
 MxKIuKJAFW0DpWXfTaLomWBWeM3wSKXXwCsfoaxZzQSRxYIG0lcyr7bBk
 VvllHBSrup07SWqh9JqoTADqQwmYaGanCPNRsIHX4L9Gpk9MwzRCeTSkY s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R5d3cTOhZseonaNSj7fjWCVcULy+sHChZcPnCJWbtRRkKoFdudlaFckKm3D25d7TQXR/NPsRLj
 m8sVHISmTSe54D29AiVNJ8QvRWuX7TgzKId3P4iK8pOycLv/CMAwYDIHpDkU51cDJ0S9NxlvP1
 ln4NTe0s1B+goEQxszmtL/ajus8g1BE1cU2EjUIOcdaAFIhObXnp6UAjSnSAd09tB+mzstDl7m
 Cu9V0P7/l09K576cK59E++4nRQyQ98JpZ27jByDjT1gXTdPktLiB+jvgpTyeuCEpd4sf8gNPWy
 cdk=
X-SBRS: 2.7
X-MesageID: 4168624
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4168624"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>, "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
Thread-Topic: [RFC] Code of Conduct
Thread-Index: AQHVUQIEIhpvkCdhBEeAXTHDoPJt4Kb3gUKA
Date: Mon, 12 Aug 2019 14:27:07 +0000
Message-ID: <BAD85CEA-27E1-48B2-A433-0D6BE2182DCC@citrix.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com-0>
 <32e7f4cd-78e9-dd43-a677-958d838f4f65@citrix.com>
In-Reply-To: <32e7f4cd-78e9-dd43-a677-958d838f4f65@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A41694544FE49D43BCF2739088832BEC@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLA0KDQrvu79PbiAxMi8wOC8yMDE5LCAxMjozNSwgIkdlb3JnZSBEdW5sYXAiIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgT24gOC85LzE5IDY6NDggUE0s
IExhcnMgS3VydGggd3JvdGU6DQogICAgPiBIaSBhbGwsDQogICAgPiANCiAgICA+IEZvbGxvd2lu
ZyB0aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgYXQgdGhlIERldmVsb3BlciBTdW1taXQgKHNlZSBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9EZXNpZ25fU2Vzc2lvbnNfMjAxOSNDb21tdW5p
dHlfSXNzdWVzXy4yRl9JbXByb3ZlbWVudHNfLV9Db21tdW5pY2F0aW9uLjJDX0NvZGVfb2ZfQ29u
ZHVjdC4yQ19ldGMuIGZvciBub3RlcykgSSBwdXQgdG9nZXRoZXIgYSBkcmFmdCBmb3IgdGhlIENv
ZGUgb2YgQ29uZHVjdCB3aGljaCBjYW4gYmUgZm91bmQgaGVyZSBhcyB3ZWxsIGFzIGlubGluZWQg
YmVsb3cNCiAgICA+IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2QvMU5uV2RVX1Zu
QzFOX1p6eFFHNmpVOWZuWTJHUFZDY2ZQSlQ1S1k2MVdYSk0vZWRpdD91c3A9c2hhcmluZyANCiAg
ICA+IA0KICAgID4gSXQgaXMgYmFzZWQgb24gdGhlIExGIEV2ZW50cyBDb0MgYXMgd2UgYWdyZWVk
IG9uICh0aGUgZGlmZiBpcyBhdHRhY2hlZCkuIEkgdG9vayB0aGUgc2NvcGUgYW5kIGVuZm9yY2Vt
ZW50IHNlY3Rpb25zIGZyb20gaHR0cHM6Ly93d3cuY29udHJpYnV0b3ItY292ZW5hbnQub3JnL3Zl
cnNpb24vMS80L2NvZGUtb2YtY29uZHVjdC5odG1sIGFuZCBzaW1wbGlmaWVkIGl0IHJhdGhlciB0
aGFuIGludmVudGluZyBzb21ldGhpbmcgbmV3Lg0KICAgID4gDQogICAgPiBZb3UgY2FuIHByb3Zp
ZGUgZmVlZGJhY2sgYnkgY29tbWVudGluZyBvbiB0aGUgZ29vZ2xlIGRvYyBvciBieSByZXBseWlu
ZyB0byB0aGUgaW4tbGluZWQgdmVyc2lvbiBiZWxvdy4gDQogICAgPiBJIGV4cGVjdCBpdCB3aWxs
IHNvbWUgbW9yZSBkaXNjdXNzaW9uIHRvIGdldCBjb25zZW5zdXMuIA0KICAgID4gDQogICAgPiBO
b3RlIHRoYXQgSSBhbSBub3QgdmVyeSBhdHRhY2hlZCB0byBzb21lIG9mIHRoZSB0ZXJtcywgc3Vj
aCBhcyAiWGVuIFByb2plY3QgQ29DICBUZWFtIiBhbmQgaW4gc29tZSBjYXNlcyAicGFydGljaXBh
bnQiIHNob3VsZCBwcm9iYWJseSBiZSByZXBsYWNlZCBieSBjb21tdW5pdHkgDQogICAgPiBtZW1i
ZXJzLiANCiAgICA+IA0KICAgID4gQnV0IEkgZmVsdCwgd2Ugc2hvdWxkIGhhdmUgc29tZXRoaW5n
IG1vcmUgY29uY3JldGUgdG8gZGlzY3VzcyBjb21wYXJlZCB0byBwcmV2aW91cyBkaXNjdXNzaW9u
cy4NCiAgICA+IA0KICAgID4gQSBDb2RlIG9mIENvbmR1Y3QgaXMgYSBwcm9qZWN0IHdpZGUgcG9s
aWN5IGNoYW5nZTogdGh1cywgYWxsIHN1YnByb2plY3RzIGxpc3RzIGFyZSBDQydlZA0KICAgIA0K
ICAgIFRoYW5rcyBmb3IgZG9pbmcgdGhpcyBMYXJzLiAgSSB0aGluayB0aGlzIGlzIGEgc3RlcCBm
b3J3YXJkLg0KICAgIA0KICAgIEkgaGF2ZSBhIGNvdXBsZSBvZiBjb21tZW50cywgYnV0IG9ubHkg
b24gdGhlIHdvcmRpbmcuDQogICAgDQogICAgPiANCiAgICA+IFJlZ2FyZHMNCiAgICA+IExhcnMN
CiAgICA+IA0KICAgID4gSGVyZSBpcyB0aGUgYWN0dWFsIHRleHQNCiAgICA+IC0tLQ0KICAgID4g
IyBPdXIgUGxlZGdlDQogICAgPiBJbiB0aGUgaW50ZXJlc3Qgb2YgZm9zdGVyaW5nIGFuIG9wZW4g
YW5kIHdlbGNvbWluZyBlbnZpcm9ubWVudCwgd2UgYXMgY29tbXVuaXR5IA0KICAgID4gbWVtYmVy
cyBvZiB0aGUgWGVuIFByb2plY3QgcGxlZGdlIHRvIG1ha2luZyBwYXJ0aWNpcGF0aW9uIGluIG91
ciBwcm9qZWN0IGFuZCBvdXIgDQogICAgPiBjb21tdW5pdHkgYSBoYXJhc3NtZW50LWZyZWUgZXhw
ZXJpZW5jZSBmb3IgZXZlcnlvbmUuDQogICAgDQogICAgVG8gbWUgInBsZWRnZSIgbWVhbnMgInBy
b21pc2UiOyBhbmQgSSBkb24ndCB0aGluayB3ZSBjYW4gcHJvbWlzZSBhbnlvbmUNCiAgICB0aGF0
IHRoZXknbGwgaGF2ZSBhIGhhcmFzc21lbnQtZnJlZSBleHBlcmllbmNlLiAgSSBtaWdodCBzYXks
ICJ3ZSAuLi4NCiAgICBhcmUgY29tbWl0dGVkIHRvIG1ha2luZyBwYXJ0aWNpcGF0aW9uIC4uLiBh
IGhhcmFzc21lbnQtZnJlZSBleHBlcmllbmNlIjsNCiAgICBvciAid2UgLi4uIHBsZWRnZSB0byBt
YWludGFpbiBhIGhhcmFzc21lbnQtZnJlZSBleHBlcmllbmNlIiBvciBzb21ldGhpbmcNCiAgICBs
aWtlIHRoYXQuDQoNClRoaXMgY29tZXMgZGlyZWN0bHkgZnJvbSB0aGUgQ29udHJpYnV0b3IgQ292
ZW5hbnQgdjEuNA0KQnV0IEkgYWxzbyBsaWtlICJ3ZSAuLi4gYXJlIGNvbW1pdHRlZCB0byBtYWtp
bmcgcGFydGljaXBhdGlvbiAuLi4gYSBoYXJhc3NtZW50LWZyZWUgDQpleHBlcmllbmNlIiBiZXR0
ZXIgdGhlbiBwbGVkZ2UuDQogICAgDQogICAgPiAjIFVuYWNjZXB0YWJsZSBCZWhhdmlvcg0KICAg
ID4gSGFyYXNzbWVudCB3aWxsIG5vdCBiZSB0b2xlcmF0ZWQgaW4gdGhlIFhlbiBQcm9qZWN0IENv
bW11bml0eSBpbiBhbnkgZm9ybSwgDQogICAgPiBpbmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRv
IGhhcmFzc21lbnQgYmFzZWQgb24gZ2VuZGVyLCBnZW5kZXIgaWRlbnRpdHkgYW5kIA0KICAgID4g
ZXhwcmVzc2lvbiwgc2V4dWFsIG9yaWVudGF0aW9uLCBkaXNhYmlsaXR5LCBwaHlzaWNhbCBhcHBl
YXJhbmNlLCBib2R5IHNpemUsIHJhY2UsIA0KICAgID4gYWdlLCByZWxpZ2lvbiwgZXRobmljaXR5
LCBuYXRpb25hbGl0eSwgbGV2ZWwgb2YgZXhwZXJpZW5jZSwgZWR1Y2F0aW9uLCBvciANCiAgICA+
IHNvY2lvLWVjb25vbWljIHN0YXR1cyBvciBhbnkgb3RoZXIgc3RhdHVzIHByb3RlY3RlZCBieSBs
YXdzIGluIGp1cmlzZGljdGlvbnMgaW4gDQogICAgPiB3aGljaCBjb21tdW5pdHkgbWVtYmVycyBh
cmUgYmFzZWQuDQogICAgDQogICAgPiBIYXJhc3NtZW50IGluY2x1ZGVzIHRoZSB1c2Ugb2YgYWJ1
c2l2ZSwgDQogICAgPiBvZmZlbnNpdmUgb3IgZGVncmFkaW5nIGxhbmd1YWdlLCBpbnRpbWlkYXRp
b24sIHN0YWxraW5nLCBoYXJhc3NpbmcgcGhvdG9ncmFwaHkgDQogICAgPiBvciByZWNvcmRpbmcs
IGluYXBwcm9wcmlhdGUgcGh5c2ljYWwgY29udGFjdCwgc2V4dWFsIGltYWdlcnkgYW5kIHVud2Vs
Y29tZSANCiAgICA+IHNleHVhbCBhZHZhbmNlcywgcmVxdWVzdHMgZm9yIHNleHVhbCBmYXZvcnMs
IHB1Ymxpc2hpbmcgb3RoZXJzJyBwcml2YXRlIA0KICAgID4gaW5mb3JtYXRpb24gc3VjaCBhcyBh
IHBoeXNpY2FsIG9yIGVsZWN0cm9uaWMgYWRkcmVzcyB3aXRob3V0IGV4cGxpY2l0IHBlcm1pc3Np
b24gDQogICAgPiBhbmQgb3RoZXIgY29uZHVjdCB3aGljaCBjb3VsZCByZWFzb25hYmx5IGJlIGNv
bnNpZGVyZWQgaW5hcHByb3ByaWF0ZSBpbiBhIA0KICAgID4gcHJvZmVzc2lvbmFsIHNldHRpbmcu
IA0KICAgIA0KICAgIFNob3VsZCB3ZSBwdXQgInN1Y2ggYXMgcGh5c2ljYWwgb3IgZWxlY3Ryb25p
YyBhZGRyZXNzW2VzXSIgaW4gcGFyZW50aGVzZXM/DQoNCkZpbmUgd2l0aCBtZQ0KICAgIA0KICAg
IEFsc28sIEknbSBpbiBmYXZvciBvZiB0aGUgT3hmb3JkIENvbW1hIChzbyBhIGNvbW1hIGFmdGVy
ICdwZXJtaXNzaW9uJykuDQogICAgDQogICAgSSBtaWdodCBzYXkgIm9yIGFueSBvdGhlciBjb25k
dWN0IjsgZm9yIHNvbWUgcmVhc29uIGl0IHNvdW5kcyBtb3JlDQogICAgbmF0dXJhbCB0byBtZS4N
Cg0KRWl0aGVyIHdvcmtzDQogICAgDQogICAgPiBBbnkgcmVwb3J0IG9mIGhhcmFzc21lbnQgd2l0
aGluIHRoZSBYZW4gUHJvamVjdCBjb21tdW5pdHkgd2lsbCBiZSBhZGRyZXNzZWQgDQogICAgPiBz
d2lmdGx5LiBQYXJ0aWNpcGFudHMgYXNrZWQgdG8gc3RvcCBhbnkgaGFyYXNzaW5nIGJlaGF2aW9y
IGFyZSBleHBlY3RlZCB0byANCiAgICA+IGNvbXBseSBpbW1lZGlhdGVseS4gQW55b25lIHdobyB3
aXRuZXNzZXMgb3IgaXMgc3ViamVjdGVkIHRvIHVuYWNjZXB0YWJsZSANCiAgICA+IGJlaGF2aW9y
IHNob3VsZCBub3RpZnkgdGhlIFhlbiBQcm9qZWN04oCZcyBDb0MgdGVhbSB2aWEgY29uZHVjdEB4
ZW5wcm9qZWN0Lm9yZy4NCiAgICA+IA0KICAgID4gIyBDb25zZXF1ZW5jZXMgb2YgVW5hY2NlcHRh
YmxlIEJlaGF2aW9yDQogICAgPiBJZiBhIHBhcnRpY2lwYW50IGVuZ2FnZXMgaW4gaGFyYXNzaW5n
IGJlaGF2aW9yLCB0aGUgWGVuIFByb2plY3TigJlzIENvQyB0ZWFtIG1heSANCiAgICA+IHRha2Ug
YW55IGFjdGlvbiBpdCBkZWVtcyBhcHByb3ByaWF0ZSwgcmFuZ2luZyBmcm9tIGlzc3VhbmNlIG9m
IGEgd2FybmluZyB0byB0aGUgDQogICAgPiBvZmZlbmRpbmcgaW5kaXZpZHVhbCB0byBleHB1bHNp
b24gZnJvbSB0aGUgWGVuIFByb2plY3QgY29tbXVuaXR5Lg0KICAgIA0KICAgIEkgcmVhbGl6ZSBi
eSBzYXlpbmcgInJhbmdlIiB5b3UgcHJvYmFibHkgbWVhbnQgdG8gaW5jbHVkZSB0aGlzLCBidXQg
SQ0KICAgIHRoaW5rIHNwZWxsaW5nIG91dCAidGVtcG9yYXJ5IHN1c3BlbnNpb24iIGFzIGEgcG9z
c2libGUgY29uc2VxdWVuY2UuICBFLmcuOg0KICAgIA0KICAgICJJZiBhIHBhcnRpY2lwYW50IGVu
Z2FnZXMgaW4gaGFyYXNzaW5nIGJlaGF2aW9yLCB0aGUgWGVuIFByb2plY3QncyBDb0MNCiAgICB0
ZWFtIHdpbGwgaW52ZXN0aWdhdGUgYW5kIHRha2UgYW4gYWN0aW9uIGl0IGRlZW1zIGFwcHJvcHJp
YXRlIGFnYWluc3QNCiAgICB0aGUgb2ZmZW5kaW5nIGluZGl2aWR1YWwuICBUaGlzIG1heSBpbmNs
dWRlIGlzc3VpbmcgYSB3YXJuaW5nLCB0ZW1wb3JhcnkNCiAgICBzdXNwZW5zaW9uIGZyb20gbWFp
bGluZyBsaXN0cyBvciBjb21taXQgcmlnaHRzLCBvciBleHB1bHNpb24gZnJvbSB0aGUNCiAgICBY
ZW5Qcm9qZWN0IGNvbW11bml0eS4iDQoNClRoYXQgbG9va3MgZ29vZA0KICAgIA0KICAgIFRoYXQn
cyBhbGwgSSBoYWQ7IHRoYW5rcyBhZ2FpbiwgTGFycy4NCg0KSSBhbSB3b25kZXJpbmcgaG93IHlv
dSBmZWVsIGFib3V0IHRoZSB1c2FnZSBvZiAgInBhcnRpY2lwYW50Ii4gVGhlcmUgYXJlIA0KYSBm
ZXcgaW5zdGFuY2VzIGxlZnQgaW4gdGhlIHRleHQuIA0KDQoiQW55IHJlcG9ydCBvZiBoYXJhc3Nt
ZW50IHdpdGhpbiB0aGUgWGVuIFByb2plY3QgY29tbXVuaXR5IHdpbGwgYmUgYWRkcmVzc2VkDQpz
d2lmdGx5LiBQYXJ0aWNpcGFudHMgYXNrZWQgdG8gc3RvcCAuLi4iDQoNCiMgQ29uc2VxdWVuY2Vz
IG9mIFVuYWNjZXB0YWJsZSBCZWhhdmlvcg0KSWYgYSBwYXJ0aWNpcGFudCBlbmdhZ2VzIGluIGhh
cmFzc2luZyBiZWhhdmlvdXINCg0KSSB3b3VsZCBwcm9iYWJseSBhbHNvIHdhbnQgdG8gcmVwbGFj
ZSB0aGlzIHdpdGggIkNvbW11bml0eSBtZW1iZXIgYXNrZWQgLi4uIiBhbmQgIklmIGEgY29tbXVu
aXR5IG1lbWJlciBlbmdhZ2VzIGluIC4uLiINCg0KUmVnYXJkcw0KTGFycw0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
