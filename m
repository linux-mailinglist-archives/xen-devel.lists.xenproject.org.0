Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53110D013
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 01:05:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaTk8-0007IC-KQ; Fri, 29 Nov 2019 00:02:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eJ48=ZV=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iaTk6-0007Hk-MO
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 00:02:38 +0000
X-Inumbo-ID: 83b80580-123b-11ea-a3da-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83b80580-123b-11ea-a3da-12813bfff9fa;
 Fri, 29 Nov 2019 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574985742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pUoHTUkg4Xb/2R4GYepUcc7k96nRW9fdt05C1nDEB8o=;
 b=LMZXDsXwIuBoB54w9K+WKxV16KzU3vJGB9pNrtv7mVOxFxrQeLtWOXDl
 LNqukQzMxfad5IwaNPtSdIiMzGH1HGSpH7O0UK1NSrNBo1zF112cAgU0h
 zJh+XH4kq8kd5XmHwOWgWP2BO8Omv8BnYnOKvjEpX2mFPPJk/vhqRX7pB M=;
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
IronPort-SDR: bjIHBhWIMaQT+NKwUMNG71/nf6Y80WpNwaDg71kPp9pJkfWNd2fK1LP76BWAm3fEZ0XSsvXsOt
 aPotMn2nxGk3qpXHy3bMcYFDw7t7DXPGJDx/gWuyqpFB9TqqnyaypDPpf+0DEgyQ59udkoiP8Y
 2ldST+Ab9sATXXFoJVj2gOhbEBvCV2J+drENuzwNzK340zU+xQUSQQ9sXyKlmgO02ZngtmaHY7
 trKoWCII3Wc5jwtAZ0YeZmLP7R4d0or+lf5ImAtFtunvVqG48+S0ZtNKMUzgKRwZsQvgV+ZEQR
 S1c=
X-SBRS: 2.7
X-MesageID: 9093276
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,255,1571716800"; 
   d="scan'208";a="9093276"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH v2 5/6] Add guide on Communication Best Practice
Thread-Index: AQHVdKIoBNlHjnrbLUK7o4oIKuieK6c/HQoAgGD5A4CAARvaAA==
Date: Fri, 29 Nov 2019 00:02:17 +0000
Message-ID: <4ABC1664-F80E-4A54-90A0-0F8C71FA2C4D@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
 <alpine.DEB.2.21.1911271659170.27669@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911271659170.27669@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BEA72AB66B86A345A5FE5FCD4F8ACA73@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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

DQoNCu+7v09uIDI3LzExLzIwMTksIDE5OjA2LCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBGcmksIDI3IFNlcCAyMDE5LCBKYW4g
QmV1bGljaCB3cm90ZToNCiAgICA+IE9uIDI2LjA5LjIwMTkgMjE6MzksIExhcnMgS3VydGggd3Jv
dGU6DQogICAgPiA+ICsjIyMgVmVyYm9zZSB2cy4gdGVyc2UNCiAgICA+ID4gK0R1ZSB0byB0aGUg
dGltZSBpdCB0YWtlcyB0byByZXZpZXcgYW5kIGNvbXBvc2UgY29kZSByZXZpZXdlciwgcmV2aWV3
ZXJzIG9mdGVuIGFkb3B0IGENCiAgICA+ID4gK3RlcnNlIHN0eWxlLiBJdCBpcyBub3QgdW51c3Vh
bCB0byBzZWUgcmV2aWV3IGNvbW1lbnRzIHN1Y2ggYXMNCiAgICA+ID4gKz4gdHlwbw0KICAgID4g
PiArPiBzL3Jlc2lvbnMvcmVnaW9ucy8NCiAgICA+ID4gKz4gY29kaW5nIHN0eWxlDQogICAgPiA+
ICs+IGNvZGluZyBzdHlsZTogYnJhY2tldHMgbm90IG5lZWRlZA0KICAgID4gPiArZXRjLg0KICAg
ID4gPiArDQogICAgPiA+ICtUZXJzZSBjb2RlIHJldmlldyBzdHlsZSBoYXMgaXRzIHBsYWNlIGFu
ZCBjYW4gYmUgcHJvZHVjdGl2ZSBmb3IgYm90aCB0aGUgcmV2aWV3ZXIgYW5kDQogICAgPiA+ICt0
aGUgYXV0aG9yLiBIb3dldmVyLCBvdmVydXNlIGNhbiBjb21lIGFjcm9zcyBhcyB1bmZyaWVuZGx5
LCBsYWNraW5nIGVtcGF0aHkgYW5kDQogICAgPiA+ICtjYW4gdGh1cyBjcmVhdGUgYSBuZWdhdGl2
ZSBpbXByZXNzaW9uIHdpdGggdGhlIGF1dGhvciBvZiBhIHBhdGNoLiBUaGlzIGlzIGluIHBhcnRp
Y3VsYXINCiAgICA+ID4gK3RydWUsIHdoZW4geW91IGRvIG5vdCBrbm93IHRoZSBhdXRob3Igb3Ig
dGhlIGF1dGhvciBpcyBhIG5ld2NvbWVyLiBUZXJzZQ0KICAgID4gPiArY29tbXVuaWNhdGlvbiBz
dHlsZXMgY2FuIGFsc28gYmUgcGVyY2VpdmVkIGFzIHJ1ZGUgaW4gc29tZSBjdWx0dXJlcy4NCiAg
ICA+IA0KICAgID4gQW5kIGFub3RoZXIgcmVtYXJrIGhlcmU6IE5vdCBiZWluZyB0ZXJzZSBpbiBz
aXR1YXRpb25zIGxpa2UgdGhlIG9uZXMNCiAgICA+IGVudW1lcmF0ZWQgYXMgZXhhbXBsZXMgYWJv
dmUgaXMgYSBkb3VibGUgd2FzdGUgb2YgdGhlIHJldmlld2VyJ3MgdGltZToNCiAgICA+IFRoZXkg
c2hvdWxkbid0IGV2ZW4gbmVlZCB0byBtYWtlIHN1Y2ggY29tbWVudHMsIGVzcGVjaWFsbHkgbm90
IG1hbnkNCiAgICA+IHRpbWVzIGZvciBhIHNpbmdsZSBwYXRjaCAoc2VlIHlvdXIgbWVudGlvbiBv
ZiAib3ZlcnVzZSIpLiBJIHJlYWxpemUNCiAgICA+IHdlIHN0aWxsIGhhdmUgbm8gYXV0b21hdGVk
IG1lY2hhbmlzbSB0byBjaGVjayBzdHlsZSBhc3BlY3RzLCBidXQNCiAgICA+IGFueWJvZHkgY2Fu
IGVhc2lseSBsb29rIG92ZXIgdGhlaXIgcGF0Y2hlcyBiZWZvcmUgc3VibWl0dGluZyB0aGVtLg0K
ICAgID4gQW5kIGZvciBhbiBvY2Nhc2lvbmFsIGlzc3VlIEkgdGhpbmsgYSB0ZXJzZSByZXBseSBp
cyBxdWl0ZSByZWFzb25hYmxlDQogICAgPiB0byBoYXZlLg0KICAgID4gDQogICAgPiBPdmVyYWxs
IEknbSBzZWVpbmcgdGhlIGdvb2QgaW50ZW50aW9ucyBvZiB0aGlzIGRvY3VtZW50LCB5ZXQgSSdk
IHN0aWxsDQogICAgPiB2b3RlIGF0IGxlYXN0IC0xIG9uIGl0IGlmIGl0IGNhbWUgdG8gYSB2b3Rl
LiBGb2xsb3dpbmcgZXZlbiBqdXN0IGENCiAgICA+IGZhaXIgcGFydCBvZiBpdCBpcyBhIGNvbnNp
ZGVyYWJsZSBleHRyYSBhbW91bnQgb2YgdGltZSB0byBpbnZlc3QgaW4NCiAgICA+IHJldmlld3Ms
IHdoZW4gd2UgYWxyZWFkeSBoYXZlIGEgc2V2ZXJlIHJldmlld2luZyBib3R0bGVuZWNrLiBJZiBJ
IGhhdmUNCiAgICA+IHRvIGp1ZGdlIGJldHdlZW4gZG9pbmcgYSBiYWQgKHN0eWxpc3RpY2FsbHkg
YWNjb3JkaW5nIHRvIHRoaXMgZG9jLCBub3QNCiAgICA+IHRlY2huaWNhbGx5KSByZXZpZXcgb3Ig
bm9uZSBhdCBhbGwgKGJlY2F1c2Ugb2YgdGltZSBjb25zdHJhaW50cyksIEknZA0KICAgID4gZmF2
b3IgdGhlIGZvcm1lci4gVW5sZXNzIG9mIGNvdXJzZSBJJ20gYXNrZWQgdG8gc3RvcCBkb2luZyBz
bywgaW4NCiAgICA+IHdoaWNoIGNhc2UgSSdkIGV4cGVjdCB3aG9ldmVyIGFza3MgdG8gYXJyYW5n
ZSBmb3IgdGhlIHJldmlld3MgdG8gYmUNCiAgICA+IGRvbmUgYnkgc29tZW9uZSBlbHNlIGluIGR1
ZSBjb3Vyc2UuDQogICAgDQogICAgUmVhZGluZyB0aGUgZG9jdW1lbnQsIEkgdGhpbmsgSmFuIGhh
cyBhIHBvaW50IHRoYXQgaXQgZ2l2ZXMgdGhlDQogICAgaW1wcmVzc2lvbiB0aGF0IGZvbGxvd2lu
ZyB0aGUgc3VnZ2VzdGlvbnMgd291bGQgdGFrZSBzaWduaWZpY2FudA0KICAgIGVmZm9ydHMsIHdo
aWxlIGFjdHVhbGx5IEkgZG9uJ3QgdGhpbmsgTGFycyBtZWFudCBpdCB0aGF0IHdheSBhdCBhbGws
IGFuZA0KICAgIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIHRoZSBjYXNlIGVpdGhlci4NCg0K
WWVzLiBVbHRpbWF0ZWx5IHRoZSBlZmZlY3Qgb2YgYSBiZXR0ZXIgY29tbXVuaWNhdGlvbiBzaG91
bGQgb3ZlcmFsbCBiZSBhIG5ldC1wb3NpdGl2ZSBpbiB0ZXJtcyBvZiBlZmZvcnQuIA0KICAgIA0K
ICAgIE1heWJlIHdlIHNob3VsZCBoaWdobGlnaHQgYW5kIGVuY291cmFnZSAiY2xhcml0eSIgaW5z
dGVhZCBvZiAidmVyYm9zaXR5Ig0KICAgIG9mIHRoZSBjb21tdW5pY2F0aW9uLCBhbmQgZW5jb3Vy
YWdlICJleHByZXNzaW5nIGFwcHJlY2lhdGlvbiIgdG8NCiAgICBuZXdjb21lcnMsIG5vdCBuZWNl
c3NhcmlseSB0byBzZWFzb25lZCBjb250cmlidXRvcnMuDQoNCkdvb2QgaWRlYQ0KICAgIA0KICAg
IFRoZSB1bHRpbWF0ZSBnb2FsIG9mIHRoaXMgZG9jdW1lbnQgaXMgYWN0dWFsbHkgdG8gKnJlZHVj
ZSogb3VyIG92ZXJhbGwNCiAgICBlZmZvcnRzIGJ5IG1ha2luZyBvdXIgY29tbXVuaWNhdGlvbiBt
b3JlIGVmZmljaWVudCwgbm90IHRvIGluY3JlYXNlDQogICAgZWZmb3J0cy4gTWF5YmUgaXQgaXMg
d29ydGggc2F5aW5nIHRoaXMgdG9vLg0KICAgIA0KSXQgaXMgd29ydGggc2F5aW5nIHRoaXMuIA0K
DQpSZWdhcmRzDQpMYXJzDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
