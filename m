Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0AFDE35
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:44:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVauv-0000qD-R1; Fri, 15 Nov 2019 12:41:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9fPR=ZH=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iVauv-0000q7-5B
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:41:37 +0000
X-Inumbo-ID: 42a40b5c-07a5-11ea-adbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a40b5c-07a5-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573821696;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z/aT9MV+jGoTe3OhupyoZc7k/dzaHEMJcv0a1+RBNGo=;
 b=aOKeD9d0C5QBiOENUEpTLlJ+Pcuz5rJD3mb7Rsc+OgglrlzPs0/ycoZh
 zisQcKwFcLY9bYaGhe1PcCP1lYM00UmrhC5AdvLQsKijfrCHTe5zyDBMc
 hJiDFGCLaKb2qPmAtjfLsxBbaPPrCysAeWXzpUC4ZjQ/l4J+7H4pVQQbi 0=;
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
IronPort-SDR: 4d/Z1YJYthIUk1ZcPOM3bJ0LOEkcv1DP70XGz2cc3IDwAyM7PHH867wakExvFDhw4jNewL8vGY
 1MY4fNggWPVwdHWl1CO8yY/CL1EvbGtgG+N95nArd3Z729h7wvIN1FTLSXmiI2SFHXPLmwGla3
 F6PBmc64M8y9h7pzyxK2zgx7geDQFMEW4TAD0BOrecoxG7Daa2JewogH2CamgOftt/e38woIW6
 2QnzOmlL7vJsBYTrDcM/yHNgkLbLIcfWDeMrxPr31oYJp4pKyK//tA4OnWSTzTXGQ5tnAn2MmV
 OmQ=
X-SBRS: 2.7
X-MesageID: 8493849
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8493849"
From: Lars Kurth <lars.kurth@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Thread-Topic: Call for new Release Manager for Xen 4.14+
Thread-Index: AQHVlbrSnQbXeRjO7U2yvrM4AIHL4KeMIuIA//+gUoA=
Date: Fri, 15 Nov 2019 12:41:31 +0000
Message-ID: <813FD47D-2E23-416D-9BE7-5CA36D60F15E@citrix.com>
References: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
 <10dd18cdc2874acebaeeed777a7a1aed@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <10dd18cdc2874acebaeeed777a7a1aed@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <2C874F0D8E913546B52FD7730EB2243D@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Call for new Release Manager for Xen 4.14+
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE1LzExLzIwMTksIDA1OjI2LCAiRHVycmFudCwgUGF1bCIgPHBkdXJyYW50QGFt
YXpvbi5jb20+IHdyb3RlOg0KDQogICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAg
ID4gRnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgID4gU2VudDog
MDcgTm92ZW1iZXIgMjAxOSAyMjozMA0KICAgID4gVG86IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnPjsgSnVlcmdlbiBHcm9zcw0KICAgID4gPGpncm9zc0BzdXNlLmNv
bT4NCiAgICA+IENjOiBjb21taXR0ZXJzQHhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgQnJpYW4NCiAgICA+IFdvb2RzIDxicmlhbi53b29kc0B4aWxp
bnguY29tPg0KICAgID4gU3ViamVjdDogQ2FsbCBmb3IgbmV3IFJlbGVhc2UgTWFuYWdlciBmb3Ig
WGVuIDQuMTQrDQogICAgPiANCiAgICA+IERlYXIgQ29tbXVuaXR5IE1lbWJlcnMsDQogICAgPiAN
CiAgICA+IEp1ZXJnZW4gd2lsbCBiZSBzdGVwcGluZyBkb3duIGFzIFJlbGVhc2UgTWFuYWdlciBh
ZnRlciBYZW4gNC4xMyBoYXMgYmVlbg0KICAgID4gZGVsaXZlcmVkLCBmb2xsb3dpbmcgdGhlIDQu
MTEgYW5kIDQuMTIgcmVsZWFzZS4gUmVsZWFzZSBtYW5hZ2VycyBwcmlvciB0bw0KICAgID4gSnVl
cmdlbiB3ZXJlIEp1bGllbiBHcmFsbCwgS29ucmFkIFdpbGssIFdlaSBMaXUgYW5kIEdlb3JnZSBE
dW5sYXAuIFdlIGFyZQ0KICAgID4gbG9va2luZyBmb3IgYWN0aXZlIGNvbW11bml0eSBtZW1iZXJz
IHRvIGZvbGxvdyBpbiBwcmV2aW91cyByZWxlYXNlDQogICAgPiBtYW5hZ2VycyBmb290c3RlcHMu
IEkgYWxzbyB3YW50ZWQgdG8gdGhhbmsgSnVlcmdlbiBmb3IgcGVyZm9ybWluZyB0aGUNCiAgICA+
IHJvbGUuDQogICAgPiANCiAgICA+IFdlIGhhdmUgZGlzY3Vzc2VkIHdpdGggYSBudW1iZXIgb2Yg
cGVvcGxlLCBob3dldmVyIFdlaSBtYWRlIHRoZSB2ZXJ5IHZhbGlkDQogICAgPiBwb2ludCB0aGF0
IHdlIHNob3VsZCBtYWtlIGFuIGFubm91bmNlbWVudCBhYm91dCB0aGUgcm9sZSBvbiB0aGUgbGlz
dC4gIEluDQogICAgPiB0ZXJtcyBvZiBlZmZvcnQsIHRoZSBlZmZvcnQgcmVxdWlyZWQgcHJpb3Ig
dG8gdGhlIHJlbGVhc2UgaXMgcmVsYXRpdmVseQ0KICAgID4gbG93ICgxLTIgZGF5cyBhIG1vbnRo
KSwgaG93ZXZlciBpbiB0aGUgbGFzdCB0d28gbW9udGhzIG9mIHRoZSByZWxlYXNlIGdvZXMNCiAg
ICA+IHVwIHRvIDEtMiBkYXlzIHBlciB3ZWVrLiBUeXBpY2FsbHkgcmVsZWFzZSBtYW5hZ2VycyBt
YW5hZ2UgMi0zIHJlbGVhc2VzLg0KICAgID4gDQogICAgPiBXaGF0IGlzIGludm9sdmVkIGluIHRo
ZSByb2xlIGlzIGRlc2NyaWJlZCBoZXJlOg0KICAgID4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj1kb2NzL3Byb2Nlc3MveGVuLQ0KICAgID4gcmVsZWFz
ZS0NCiAgICA+IG1hbmFnZW1lbnQucGFuZG9jO2g9ZDZhYmM5MGEwMjQ4Yjc2OTE2MWJjZTc5ZThk
YzY5MDRjNjU0OTA0YTtoYj1IRUFEDQogICAgPiANCiAgICA+IElmIHlvdSBhcmUgYSBjb21tdW5p
dHkgbWVtYmVyIHRoYXQgZmVlbHMgdGhlIHJlbGVhc2UgbWFuYWdlciByb2xlIHdvdWxkIGJlDQog
ICAgPiBhIGdvb2QgbWF0Y2ggZm9yIHlvdSwgcGxlYXNlIGNvbnRhY3QgbWU6IGFsc28gZmVlbCBm
cmVlIHRvIGFzayBtZSBvcg0KICAgID4gcHJldmlvdXMgcmVsZWFzZSBtYW5hZ2VycyBhbnkgcXVl
c3Rpb25zDQogICAgDQogICAgW1JlcGx5aW5nIHB1YmxpY2x5IGFzIHJlcXVlc3RlZCBieSBMYXJz
XQ0KICAgIA0KICAgIEkgd291bGQgYmUgaGFwcHkgdG8gZG8gdGhlIGpvYiwgc28geW91IGNhbiBj
b25zaWRlciBtZSBhIGNhbmRpZGF0ZS4NCiAgICANClRoYW5rIHlvdSBmb3Igc3RlcHBpbmcgdXAg
UGF1bC4gDQpBcyBuby1vbmUgZWxzZSBoYXMgZG9uZSBzbywgSSBzdWdnZXN0IHdlIGNhbiB2b3Rl
OiBhIGZldyBjb21taXR0ZXJzIGFyZSBvbiBQVE8gYW5kIHRoZW4gdGhlcmUgaXMgVGhhbmtzZ2l2
aW5nLg0KU28sIHdlIHNob3VsZCBhbGxvdyBmb3IgMiB3ZWVrcw0KDQpJZiBuby1vbmUgb2JqZWN0
cywgc2F5IGJ5IE1vbmRheSwgY2FuIEkgZ2V0IG9uZSBvZiB5b3UgdG8gcmVwbHkgdG8gdGhpcyB0
aHJlYWQgYW5kIGNoYW5nZSB0aGUgc3ViamVjdCB0byBzb21ldGhpbmcgbGlrZTogIltWb3RlXSBm
b3IgUGF1bCBEdXJyYW50IGFzIFJlbGVhc2UgTWFuYWdlciBmb3IgWGVuIDQuMTQrIg0KDQpSZWdh
cmRzDQpMYXJzICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
