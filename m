Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E169AB859
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 14:48:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Dcw-0006nN-OO; Fri, 06 Sep 2019 12:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XnaT=XB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i6Dcv-0006nI-8w
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 12:46:09 +0000
X-Inumbo-ID: 4bc32e26-d0a4-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bc32e26-d0a4-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567773969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CNqVm5L09mVl1aOuHN8b6AgHif7Hp3fWQN9isL9Hgas=;
 b=LLK9wJYY3GedL0WLFbD9Y7QsbC7JK1RW63sG+crINe/fUmKdC1Iea4B2
 UATVAliZgnkGmKdMQlE4bqedNrzn0vPvhJkoK76OJc2y481F//VJLb6pU
 o9Ws8a096fUufxzioZUids6bY/Mt85s2q1x8KIo64ViPn+KgY/p4FgsT7 g=;
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
IronPort-SDR: wnaZri19MTG281cd2hf3XZhUrH24ASu0m+1gYP4h/vVJ5DnIlOGIPhMVvwoss3RqJeSBA195I+
 U8rQsSCVH2QFxqXPT3oJFU6il1h8q8TGKxgHSjxC3KQYDw/bVNPTIKi7ULoBAISlUKolMddviX
 xvBj7TbAGBonWIHJRcXGaf7nAagiAAJSAdVLLgrPOe56r9tuv3Y8bQSWsHgLXiz8YkUyW5ENJc
 NlBiuuG2oEnkBnW0dpyROlapHTcm+lyKjFweP57gSx806LtGhZhw0ElHt77yYnoxRsM0eQkktA
 /K4=
X-SBRS: 2.7
X-MesageID: 5237361
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5237361"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: Criteria for checking in core scheduling series
Thread-Index: AQHVZKOODIJhnveOpkmyTNeWZxT44aceiAqA
Date: Fri, 6 Sep 2019 12:46:03 +0000
Message-ID: <ABC38D35-2227-467D-BE3C-B5459B52B199@citrix.com>
References: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
In-Reply-To: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C98D3FFBF0FE0E47B915B561F7866827@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Criteria for checking in core scheduling series
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Dario Faggioli <dario.faggioli@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>, 'Jan Beulich' <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA2LzA5LzIwMTksIDEyOjA5LCAiR2VvcmdlIER1bmxhcCIgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBUaGVyZSB3YXMgYSBkaXNjdXNzaW9uIG9uIHRo
ZSBjb21tdW5pdHkgY2FsbCBhYm91dCB0aGUgY29yZSBzY2hlZHVsaW5nDQogICAgc2VyaWVzIGJl
aW5nIGRldmVsb3BlZCBieSBKdWVyZ2VuIEdyb3NzIFsxXS4gIFRoZSBjb25jbHVzaW9uIGNhbiBi
ZQ0KICAgIHN1bW1hcml6ZWQgYXMgZm9sbG93czoNCiAgICANCiAgICAqIFdlIG5vcm1hbGx5IHdh
aXQgdG8gY2hlY2sgaW4gc2VyaWVzIHVudGlsIHRoZXkgYXJlIHF1aXRlIGdvb2QgLS0gYWxsDQog
ICAgdGhlIGkncyBkb3R0ZWQgYW5kIGFsbCB0aGUgdCdzIGNyb3NzZWQNCiAgICANCiAgICAqIFRo
aXMgaXMgZm9yIHNldmVyYWwgcmVhc29uczsgcHJpbWFyaWx5IGJlY2F1c2Ugb25jZSBjb2RlIGdl
dHMgY2hlY2tlZA0KICAgIGluLCBpdCByYXJlbHkgZ2V0cyBsb29rZWQgYXQgYWdhaW4uICBJbiBw
YXJ0aWN1bGFyLCB0aGVyZSdzIG5vdGhpbmcNCiAgICBzdG9wcGluZyB0aGUgc3VibWl0dGVyIGZy
b20gbmVnbGVjdGluZyB0byBkbyBpbXBvcnRhbnQgY2xlYW4tdXBzLCBpbg0KICAgIHNwaXRlIG9m
IHRoZWlyIGJlc3QgaW50ZW50aW9uczsgbGVhdmluZyB0aGUgbWFpbnRhaW5lciBvciB0aGUgcmVz
dCBvZg0KICAgIHRoZSBjb21tdW5pdHkgdG8gZG8gaXQuDQogICAgDQogICAgKiBIb3dldmVyLCBm
b3IgcGFydGljdWxhcmx5IGxvbmcsIGNvbXBsaWNhdGVkIHNlcmllcyBsaWtlIHRoZSBjb3JlDQog
ICAgc2NoZWR1bGluZyBzZXJpZXMsIHRoaXMgY2FuIGhhdmUgc2lnbmlmaWNhbnQgZG93bnNpZGVz
LiAgUmViYXNpbmcgYQ0KICAgIDYwLXBhdGNoIGJyYW5jaCByZWd1bGFybHkgaXMgYSBsb3Qgb2Yg
Y2h1cm4gZm9yIGxpdHRsZSB2YWx1ZTsgYW5kIGNvcmUNCiAgICBwYXJ0cyBvZiB0aGUgc2VyaWVz
IHdoaWNoIGFyZSBtb3N0bHkgY29tcGxldGUgYXJlIGN1cnJlbnRseSBvbmx5IGdldHRpbmcNCiAg
ICBzcG9yYWRpYyBkZXYgdGVzdGluZyByYXRoZXIgdGhhbiB0aGUgd2lkZSByYW5nZSBvZiB0ZXN0
aW5nIHRoZXkgd291bGQNCiAgICBnZXQgZnJvbSBiZWluZyBpbiBzdGFnaW5nLg0KICAgIA0KICAg
ICogWGVuU2VydmVyIGFuZCBTdVNFIGFyZSBib3RoIGxvbmctdGVybSBjb21tdW5pdHkgbWVtYmVy
cyB3aXRoIGEgc3Ryb25nDQogICAgaW5jZW50aXZlIHRvIG1haW50YWluIGFuZCBpbXByb3ZlIHRo
ZSBmZWF0dXJlOyBzbyB0aGUgcmlzayBvZiB0aGUNCiAgICBmZWF0dXJlIGJlaW5nIGxlZnQgZm9y
IHRoZSBjb21tdW5pdHkgdG8gbWFpbnRpYW4gaXMgcmVsYXRpdmVseSBub3cuDQogICAgDQogICAg
V2l0aCBhbGwgdGhvc2UgdGhpbmdzIGluIG1pbmQsIHRoZSBjb25jbHVzaW9uIHdhcyB0byBsb3dl
ciB0aGUNCiAgICAiY2hlY2staW4iIHRocmVzaG9sZCBmcm9tIHdoYXQgaXQgbm9ybWFsbHkgaXMs
IGluIG9yZGVyIHRvIGFsbG93IHRoZQ0KICAgIHNlcmllcyB0byBiZSBjaGVja2VkIGluIGluIHRo
ZSBuZWFyIGZ1dHVyZSwgaW4gZW5vdWdoIHRpbWUgYXQgbGVhc3QgZm9yDQogICAgdGhlICJkZWZh
dWx0IG9mZiIgdG8gYmUgd2VsbC10ZXN0ZWQgYnkgdGhlIDQuMTMgcmVsZWFzZS4NCiAgICANCiAg
ICBUaGUgY3JpdGVyaWEgd2Ugc2tldGNoZWQgb3V0IHdlcmU6DQogICAgDQogICAgKiBBbGwgdGhl
IHBhdGNoZXMgc3RpbGwgbmVlZCBhcHByb3ByaWF0ZSBBY2sgLyBSLWIncw0KICAgIA0KICAgICog
VGhlcmUgc2hvdWxkIGJlIHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgdGhlIHNlcmllcyB3aWxsIGhh
dmUgbGl0dGxlIHRvDQogICAgbm8gaW1wYWN0IG9uICJ0aHJlYWQgbW9kZSIgKHRocmVhZHMgYmVp
bmcgdGhlIHVuaXQgb2Ygc2NoZWR1bGluZzsgaS5lLiwNCiAgICB0aGUgc3RhdHVzIHF1bykNCiAg
ICANCiAgICBXUlQgdGhlIHNlY29uZCBwb2ludCwgYXBwYXJlbnRseSBYZW5TZXJ2ZXIgaGF2ZSBi
ZWVuIHRlc3RpbmcgdGhlIHNlcmllcw0KICAgIHJlZ3VsYXJseSBmb3Igc29tZSB0aW1lLCBhbmQg
YXJlIHNhdGlzZmllZCBmcm9tIGEgdGVzdGluZyBwZXJzcGVjdGl2ZQ0KICAgIHRoYXQgdGhlcmUg
aXMgbm8gc2lnbmlmaWNhbnQgZGVncmFkYXRpb24gZm9yIHRoZSBzZXJpZXMgd2hlbiBpbiAidGhy
ZWFkDQogICAgbW9kZSIuDQogICAgDQogICAgU28gdGhpcyB3b3VsZCByZWFsbHkgYmUgYSByZWNv
bW1lbmRhdGlvbiAvIGxpY2Vuc2UgdG8gdGhlIHZhcmlvdXMNCiAgICBtYWludGFpbmVycyBpbnZv
bHZlZDsgcHJpbWFyaWx5IERhcmlvLCBJIHRoaW5rIChzaW5jZSBJIHByb2JhYmx5IHdvbid0DQog
ICAgaGF2ZSB0aW1lIHRvIHJldmlldyB0aGUgc2VyaWVzKS4NCiAgICANCiAgICBObyBkZWNpc2lv
bnMgYXJlIG9mZmljaWFsIHVudGlsIGRpc2N1c3NlZCBvbiB4ZW4tZGV2ZWw7IHNvIHRoZSBkZWNp
c2lvbg0KICAgIHdpbGwgbm90IGJlIGNvbnNpZGVyZWQgb2ZmaWNpYWwgdW50aWwgYSBmZXcgZGF5
cyBoYXZlIHBhc3NlZCB3aXRob3V0DQogICAgb2JqZWN0aW9uLiAgQW5kIG9mIGNvdXJzZSwgaWYg
YW55b25lIGF0IHRoZSBtZWV0aW5nIGhhZCBhIGRpZmZlcmVudA0KICAgIHVuZGVyc3RhbmRpbmcg
b2Ygd2hhdCB3YXMgc2FpZCwgb3IgaGFzIHNvbWV0aGluZyB0byBhZGQsIHBsZWFzZSBkbyBzby4N
CiAgICANCkkgYmVsaWV2ZSB0aGUgZm9sbG93aW5nIHBlb3BsZSB3ZXJlIG9uIHRoZSBjb21tdW5p
dHkgY2FsbCBhbmQgZGlkIE5PVCBoYXZlIG9iamVjdGlvbnMgd2hlbiBhc2tlZA0KU2VyZ2V5LCBK
YW4sIEp1ZXJnZW4sIEFuZHJldywgR2VvcmdlLCBSb2dlciwgQ2hyaXN0b3BoZXIgQ2xhcmssIERh
bmllbCBQIFNtaXRoLCBSaWNoIChsaXN0IG1heSBiZSBpbmNvbXBsZXRlKQ0KDQpXZSBhcmUgYXNr
aW5nIGJlY2F1c2Uga2V5IHBlb3BsZSBoYXZlIG5vdCBiZWVuIG9uIHRoZSBjb21tdW5pdHkgY2Fs
bA0KDQpSZWdhcmRzDQpMYXJzICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
