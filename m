Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8610D081
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 03:14:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaVkb-0001Md-KT; Fri, 29 Nov 2019 02:11:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eJ48=ZV=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iaVka-0001MV-R0
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 02:11:16 +0000
X-Inumbo-ID: 7b2e1d84-124d-11ea-a3db-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b2e1d84-124d-11ea-a3db-12813bfff9fa;
 Fri, 29 Nov 2019 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574993458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3cPGkvjFxrnt7mArXi98hp4XtgJhHmSPh6RmhQYO+2c=;
 b=NAkhMxibP0gYpIfwpRpMCSJXkVIA4InTLn9qMy6Os0OLz1+szz3Q1Laj
 7nIZVZyLr9mTOz/+Oe8XMEX03xsVr/4Rrx+tSl3eRyPjNJoZpIcHsO0MR
 JVAX5X6+Vpp3h6V0qL1ODvpAim4JPY4rbLLaYK7s8Fk4rzo4HHQqNRPX9 s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PFnbT/FyJRMEkMjEkUwxNcomifQ+KN9JIYT9y1j059/YkxX9Vmgx/TMa7nUxwujBOvmlzN3nzT
 s1Ng6rbdtcQWu9YsQtoCICge5/Al2ZGL7nIfTybNPumsEkWBb0sBAiGmDQoBXABfmFPmoofYSR
 9TKgfZaVjiiMJDjLujgFrEiAYgvmxJNx9BNyRQOUVLZv1FqHfWA9b8pKLa/Mbx5mbAM/KlLeMj
 X2owAxCuTc9ZFSLi6S38N7heGncMhKqc9IDXthHhnQ7LQP9/iNE8M4PShIyN22laEgGu8Ju5wL
 z4A=
X-SBRS: 2.7
X-MesageID: 9325828
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,255,1571716800"; 
   d="scan'208";a="9325828"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 6/6] Added Resolving Disagreement
Thread-Index: AQHVdKIlkhvO00R580a3wEu9+2XsyaegEysAgACdNQCAAI8ZAIAAFkkA
Date: Fri, 29 Nov 2019 02:10:36 +0000
Message-ID: <AEBBF7E3-B40A-48E2-9B0F-647F0F79E3A9@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <2e4b36afaa73277d246d7e84037db1532a136ec7.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271549140.27669@sstabellini-ThinkPad-T480s>
 <22b7f67c-c3dc-5450-999f-e79168175d39@suse.com>
 <alpine.DEB.2.21.1911281021460.15579@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911281021460.15579@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <E8C9C86189420640B4220B346AAAE5DB@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 6/6] Added Resolving Disagreement
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI4LzExLzIwMTksIDEyOjUwLCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUaHUsIDI4IE5vdiAyMDE5LCBKYW4g
QmV1bGljaCB3cm90ZToNCiAgICA+IE9uIDI4LjExLjIwMTkgMDE6NTYsIFN0ZWZhbm8gU3RhYmVs
bGluaSB3cm90ZToNCiAgICA+ID4gT24gVGh1LCAyNiBTZXAgMjAxOSwgTGFycyBLdXJ0aCB3cm90
ZToNCg0KICAgID4gPiBJIHRoaW5rIGEgZ29vZCByZWNvbW1lbmRhdGlvbiB3b3VsZCBiZSBmb3Ig
dGhlIGNvbnRyaWJ1dG9yIHRvIHRyeSB0bw0KICAgID4gPiBmb2xsb3cgdGhlIG1haW50YWluZXJz
IHJlcXVlc3RzLCBldmVuIGlmIHRoZXkgY291bGQgYmUgY29uc2lkZXJlZA0KICAgID4gPiAic3R5
bGUiLCB0cnVzdGluZyB0aGVpciBleHBlcmllbmNlIG9uIHRoZSBtYXR0ZXIuIEFuZCBhIGdvb2QN
CiAgICA+ID4gcmVjb21tZW5kYXRpb24gZm9yIHRoZSBtYWludGFpbmVyIHdvdWxkIGJlIHRvIHRy
eSB0byBsZXQgdGhlIGNvbnRyaWJ1dG9yDQogICAgPiA+IGhhdmUgZnJlZWRvbSBvZiBpbXBsZW1l
bnRhdGlvbiBjaG9pY2Ugb24gdGhpbmdzIHRoYXQgZG9uJ3QgbWFrZSBhDQogICAgPiA+IHNpZ25p
ZmljYW50IGRpZmZlcmVuY2UuDQogICAgPiANCiAgICA+IEkgdGhpbmsgd2UgdHJ5IHRvLCBidXQg
SSBhbHNvIHRoaW5rIHdlIHN1ZmZlciBmcm9tIHRvbyBsaXR0bGUNCiAgICA+IGNsZWFyIGRvY3Vt
ZW50YXRpb24gb24gZS5nLiBzdHlsZSBhc3BlY3RzLiBBdHRlbXB0cyBvbiBteSBwYXJ0DQogICAg
PiB0byBhZGRyZXNzIHRoaXMgaGF2ZSBtb3N0bHkgKG5vdCBlbnRpcmVseSkgbGVhZCBuby13aGVy
ZSAobGFjayBvZg0KICAgID4gZmVlZGJhY2sgb24gcHJvcG9zZWQgcGF0Y2hlcyB0byAuL0NPRElO
R19TVFlMRSkuIFNvIGZvciB0aGUgdGltZQ0KICAgID4gYmVpbmcgdGhlcmUgYXJlIChtYW55KSBh
c3BlY3RzIHdoZXJlIHdlIGhhdmUgZGUtZmFjdG8gZXhwZWN0YXRpb25zDQogICAgPiB0aGF0IGFy
ZW4ndCB3cml0dGVuIGRvd24gYW55d2hlcmUsIHdpdGggdGhlIHJlc3VsdCBvZiAoaW4gYSBzdWJz
ZXQNCiAgICA+IG9mIGNhc2VzKSBkaXNhZ3JlZW1lbnQgb24gd2hhdCB0aGUgcGVyY2VpdmVkIGRl
LWZhY3RvIHN0YW5kYXJkDQogICAgPiBhY3R1YWxseSBpcy4NCiAgICANCiAgICBJIHJlY29nbml6
ZSB0aGF0IGl0IGNvdWxkIGJlIGNoYWxsZW5naW5nIGZpbmRpbmcgYSBjb25zZW5zdXMgdG8gdXBk
YXRlDQogICAgQ09ESU5HX1NUWUxFIGJ1dCBpdCBtaWdodCBiZSB3b3J0aCBkb2luZyB0byByZWR1
Y2UgZnJpY3Rpb25zIHdpdGggYm90aA0KICAgIGNvbnRyaWJ1dG9ycyBhbmQgb3RoZXIgcmV2aWV3
ZXJzLg0KICAgIA0KICAgIEJ1dCB0byBiZSBjbGVhciwgSSB3YXMgYWxzbyByZWZlcnJpbmcgdG8g
dGhpbmdzIHRoYXQgbWlnaHQgYmUgYWN0dWFsbHkNCiAgICBoYXJkIHRvIGFkZCB0byBDT0RJTkdf
U1RZTEUsIHN1Y2ggYXMgbWFjcm8gdnMuIHN0YXRpYyBpbmxpbmVzLCB3aGVuIHRvDQogICAgc3Bs
aXQgYSBzaW5nbGUgZnVuY3Rpb24gaW50byBtdWx0aXBsZSBzbWFsbGVyIGZ1bmN0aW9ucywgZXRj
Lg0KICAgIA0KSSB0aGluayB0aGlzIGlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHdlIG91Z2h0IHRv
IGRvLiBJIGFtIHZvbHVudGVlcmluZyB0bw0KcGljayB0aGlzIHVwLCBidXQgY2hhbmdpbmcvY2xh
cmlmeWluZyB0aGUgQ09ESU5HX1NUWUxFIG5lZWRzIHRvIGJlIA0KY29uc2lkZXJlZCBpbiBjb25q
dW5jdGlvbiB3aXRoIGNoZWNraW5nIHRvb2xzDQoNCkkgaGF2ZSBwYXJrZWQgdGhpcyBmb3Igbm93
LCBhcw0KYSkgSSBkaWQgbm90IHdhbnQgdG8gZGlzcnVwdCA0LjEzIA0KYikgYW5kIHVudGlsIHJl
Y2VudGx5IEkgYWxzbyBkaWRu4oCZdCBmdWxseSB1bmRlcnN0YW5kIHdoYXQga2luZCBvZiBjb2Rp
bmcNCnN0YW5kYXJkcyB3b3VsZCBoZWxwIHdpdGggc2FmZXR5IGNlcnRpZmljYXRpb24NCg0KQW5k
IG9mIGNvdXJzZSwgaGF2aW5nIGEgYm90IGRvIHRoZSBjaGVja2luZyB3b3VsZCByZW1vdmUgdGhl
IGZyaWN0aW9uDQplbnRpcmVseS4gDQoNCkxhcnMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
