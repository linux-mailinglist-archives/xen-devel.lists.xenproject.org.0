Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EBF105558
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:23:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXoGE-0003gQ-0s; Thu, 21 Nov 2019 15:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zto5=ZN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iXoGC-0003gL-70
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 15:20:44 +0000
X-Inumbo-ID: 7b4517a5-0c72-11ea-a33a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b4517a5-0c72-11ea-a33a-12813bfff9fa;
 Thu, 21 Nov 2019 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574349643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Og6HySbQC8sG+Sx8D5janTDc6+pJhJeXGpLXE9x87+Q=;
 b=Ta6YSEO3Y94G+gDXNshEo+dWBPL/tYrBoQBeCgNQGS5aXwgdrqE3mHbc
 fmElDtDyU8Y27U6tKIJnC7RpYYro9ezn5bJoezcm1aW/iUjWYjG94gd8r
 vtLZTOHKHrR1PXDcVAsei3dUktTgBEXC4ffyF6YCZmi/7RzEF0IwsXNF2 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: crGprJGf/XWOEqB00bOkDZSIUoft3K3ZxU3ajjIBULsheEazXljS+avXDZtmgo5lzd1wf20QNH
 zO1xGt3NXlW/ohN1eAxuD5BKW9naf6+CLXYrQlYZ0ExnPCifobF4vmL3mZGAYa0Usbr/itfEW4
 wDgPK6ggxCXatddYgUvO693N2lqI9m0N9KsO8T9a9z3ToAqkoT15m1QEiYdWVaodH2es4tFH5R
 Ajxi3S1uYuvcXSXjLrkce31/ai8nqquKYRIXIGce+xuHZ6vhXrdptHpGFsQo5O3EczahB7YIad
 B58=
X-SBRS: 2.7
X-MesageID: 8655707
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="8655707"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] Status of 4.13
Thread-Index: AQHVoDGv/PcGeXv6EE+0ufmOFHl3O6eVKdIAgAABsICAABJFAIAAb4cA
Date: Thu, 21 Nov 2019 15:20:38 +0000
Message-ID: <01D97001-4B2B-4AD7-9C0A-8E2EC03BC90D@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
 <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
 <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
In-Reply-To: <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <D5F26655DF88AE459EA1257DAEB2B95F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Steven Haigh <netwiz@crc.id.au>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDIxLCAyMDE5LCBhdCA4OjQxIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjEuMTEuMjAxOSAwODozNiwgSsO8cmdlbiBHcm/D
nyB3cm90ZToNCj4+IE9uIDIxLjExLjE5IDA4OjMwLCBTdGV2ZW4gSGFpZ2ggd3JvdGU6DQo+Pj4g
T24gMjAxOS0xMS0yMSAxNzowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4gV2hlcmUgZG8g
d2Ugc3RhbmQgd2l0aCBYZW4gNC4xMyByZWdhcmRpbmcgYmxvY2tlcnMgYW5kIHJlbGF0ZWQgcGF0
Y2hlcz8NCj4+Pj4gDQo+Pj4+IDIuIFJ5emVuL1JvbWUgZmFpbHVyZXMgd2l0aCBXaW5kb3dzIGd1
ZXN0czoNCj4+Pj4gICAgV2hhdCBpcyB0aGUgY3VycmVudGx5IHBsYW5uZWQgd2F5IHRvIGFkZHJl
c3MgdGhlIHByb2JsZW0/IFdobyBpcw0KPj4+PiAgICB3b3JraW5nIG9uIHRoYXQ/DQo+Pj4gDQo+
Pj4gQSB3b3JrYXJvdW5kIHdhcyBmb3VuZCBieSBzcGVjaWZ5aW5nIGNwdWlkIHZhbHVlcyBpbiB0
aGUgV2luZG93cyBWTSANCj4+PiBjb25maWcgZmlsZS4NCj4+PiANCj4+PiBUaGUgd29ya2Fyb3Vu
ZCBsaW5lIGlzOg0KPj4+IGNwdWlkID0gWyAiMHg4MDAwMDAwODplY3g9eHh4eHh4eHh4eHh4eHh4
eDAxMDB4eHh4eHh4eHh4eHgiIF0NCj4+PiANCj4+PiBJdCB3YXMgc3VnZ2VzdGVkIHRoYXQgdGhp
cyBiZSBkb2N1bWVudGVkIC0gYnV0IG5vIGltbWVkaWF0ZSBhY3Rpb24gDQo+Pj4gc2hvdWxkIGJl
IHRha2VuIC0gd2l0aCBhIHZpZXcgdG8gY29ycmVjdCB0aGlzIHByb3Blcmx5IGluIDQuMTQuDQo+
PiANCj4+IEknbSBhd2FyZSBvZiB0aGUgc3VnZ2VzdGlvbiwgYnV0IG5vdCBvZiBhbnkgZGVjaXNp
b24uIDotKQ0KPiANCj4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB3ZSdkIGNhcCB0aGUg
NC1iaXQgdmFsdWUgdG8gNyBmb3INCj4gdGhlIHRpbWUgYmVpbmcuIEkgdGhpbmsgR2VvcmdlIHdh
cyBwbGFubmluZyB0byBzZW5kIGEgcGF0Y2guDQoNCk9uIHRoYXQgYWxzbywgSeKAmW0gYXdhcmUg
b2YgdGhlIHN1Z2dlc3Rpb24sIGJ1dCBub3Qgb2YgYW55IGRlY2lzaW9uLiAgSSBkb27igJl0IHRo
aW5rIEkgZ290IG11Y2ggZmVlZGJhY2ssIHBvc2l0aXZlIG9yIG5lZ2F0aXZlLCBhYm91dCB0aGUg
aWRlYS4NCg0KU3VwcG9zZSB3ZSBpbXBsZW1lbnQgdGhlIGxpbWl0IGZvciA0LjEzLiBJZiBzb21l
b25lIHJ1bnMgTGludXggVk1zIG9uIDQuMTIgYSBzeXN0ZW0gd2l0aCBhIGhhcmR3YXJlIHZhbHVl
IG9mIDcgZm9yIGFwaWNfaWRfc2l6ZSwgdGhlIGd1ZXN0cyB3aWxsIHNlZSA4LiAgSWYgdGhleSB0
aGVuIG1pZ3JhdGUgdG8gNC4xMywgdGhlIHZhbHVlIHdpbGwgbWFnaWNhbGx5IGNoYW5nZSB1bmRl
ciB0aGVpciBmZWV0IHRvIDcuICBJcyB0aGF0IE9LPw0KDQogLUdlb3JnZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
