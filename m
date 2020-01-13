Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBD139B56
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir79Q-0005Kz-Dn; Mon, 13 Jan 2020 21:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nvmv=3C=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ir79O-0005Ku-Oy
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:21:30 +0000
X-Inumbo-ID: a87a9a77-364a-11ea-82e6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a87a9a77-364a-11ea-82e6-12813bfff9fa;
 Mon, 13 Jan 2020 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578950487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+pj4EEUukf7/4kyGD8iyx76t3hpSKXvn5KwE809+DWE=;
 b=VJYpahf/FqkhJbv0wfa0g54ZJnxvk7brpervcpVNYtXzXlJSLrAClUTm
 FMmng6kluMqxcE6Drx/T/N86wPXnVn3giuvkbqsEJcKk67HaVTtsvCuP7
 BIbTidl6ZP2VAT8pminYBVOFEi0GJ7T6QCP0IqkP1eVHytdZUvkG3V2/h A=;
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
IronPort-SDR: 7aEMYwuZmGUNucz6Q+jQXwURJZ+R2XRlTKmkWckk35JMVn+bI96LNMGowMeYDpYWfVccqWyPcc
 hgYjH/RrMKJUBAsBwmrZ2ymmnB3RxVxNyh1uqpiDsQ0XnVvv0ffBMbp6Rz9F7zrdgvQR//A/QY
 QofXv/C1IKK9YgeNRnuTqOPVGW2ZndVu1lvtxQr1V7G6aqHxPxuOjmxCKhfxfscErJwM8e2k7L
 Z3hR3WtUi4XoF3hETMQbFAXqigf2UAzfcUZC8tkJdgqansOIULog1PG/tAO48LzF5DsyrKGmwx
 Qnc=
X-SBRS: 2.7
X-MesageID: 11225389
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,430,1571716800"; d="scan'208";a="11225389"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Lars Kurth
 <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v4 6/7] Add guide on Communication Best Practice
Thread-Index: AQHVv0fmi2dQe5eEt0CCVQGdQsJt7KfpBzEAgAAYRIA=
Date: Mon, 13 Jan 2020 21:21:17 +0000
Message-ID: <8FA8F918-1B5B-40D5-93B6-0706FFB3F436@citrix.com>
References: <cover.1577733361.git.lars.kurth@citrix.com>
 <2d005116379febe0e6cfe0ea32792eb90bc74f9d.1577733361.git.lars.kurth@citrix.com>
 <B1A02147-899C-4A5E-BAF8-193A05F7B60C@citrix.com>
In-Reply-To: <B1A02147-899C-4A5E-BAF8-193A05F7B60C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C2ACDC97CE949F4C8EF60CE73B548EC2@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 6/7] Add guide on Communication Best
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDEzLzAxLzIwMjAsIDE5OjU0LCAiR2VvcmdlIER1bmxhcCIgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICA+IE9uIERlYyAzMCwgMjAxOSwgYXQg
NzozMiBQTSwgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6DQog
ICAgPiANCiAgICA+IEZyb206IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAg
ICA+IA0KICAgID4gVGhpcyBndWlkZSBjb3ZlcnMgdGhlIGJ1bGsgb24gQmVzdCBQcmFjdGljZSBy
ZWxhdGVkIHRvIGNvZGUgcmV2aWV3DQogICAgPiBJdCBwcmltYXJpbHkgZm9jdXNzZXMgb24gY29k
ZSByZXZpZXcgaW50ZXJhY3Rpb25zDQogICAgPiBJdCBhbHNvIGNvdmVycyBob3cgdG8gZGVhbCB3
aXRoIE1pc3VuZGVyc3RhbmRpbmdzIGFuZCBDdWx0dXJhbA0KICAgID4gRGlmZmVyZW5jZXMNCiAg
ICA+IA0KICAgID4gKyMjIyBBdm9pZCBvcGluaW9uOiBzdGljayB0byB0aGUgZmFjdHMNCiAgICAN
CiAgICBJbiBteSB0YWxrIG9uIHRoaXMgc3ViamVjdCBJIHNhaWQg4oCcQXZvaWQgKmluZmxhbW1h
dG9yeSBsYW5ndWFnZSrigJ0uICBBdCBzb21lIGxldmVsIGl04oCZcyBnb29kIHRvIGhhdmUgc3Ry
b25nIG9waW5pb25zIG9uIHdoYXQgY29kZSBzaG91bGQgbG9vayBsaWtlLiAgSXTigJlzIG5vdCBv
cGluaW9ucyB0aGF0IGFyZSBhIHByb2JsZW0sIG9yIGV2ZW4gZXhwcmVzc2luZyBvcGluaW9ucywg
YnV0IGV4cHJlc3NpbmcgdGhlbSBpbiBhIHByb3ZvY2F0aXZlIG9yIGluZmxhbW1hdG9yeSB3YXku
DQoNCkxldCBtZSBsb29rIGF0IHRoaXMgYWdhaW46IEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBhYm91
dCBpdA0KDQpJIGNoYW5nZWQgdGhlIHRpdGxlIGJlY2F1c2UgSSBmZWx0IHRoYXQgdGhlIGJ1bGsg
b2YgdGhlIA0KZXhhbXBsZSBpcyBhY3R1YWxseSBhYm91dCBzdGlja2luZyB0byB0aGUgZmFjdHMg
YW4gb3BpbmlvbiANCmFuZCB0aGUgaW5mbGFtbWF0b3J5IGVsZW1lbnQgd2FzIHNlY29uZGFyeS4g
U28gaXQgZmVsdCBtb3JlDQpuYXR1cmFsIHRvIG1lIHRvIGNoYW5nZSB0aGUgdGl0bGUuDQoNCkJ1
dCB0aGVuIGxvb2tpbmcgYXQgdGhlIGRlZmluaXRpb24gb2YgaW5mbGFtbWF0b3J5IGxhbmd1YWdl
LA0KYWthICAiYW4gaW5mbGFtbWF0b3J5IHF1ZXN0aW9uIG9yIGFuIGluZmxhbW1hdG9yeSBzdGF0
ZW1lbnQNCndvdWxkIGJlIG9uZSB3aGljaCB3b3VsZCBzb21laG93IHByZWRpc3Bvc2UgdGhlIGxp
c3RlbmVycw0KdG93YXJkcyBhIHN1YmplY3QgaW4gYW4gdW5yZWFzb25hYmxlLCBwcmVqdWRpY2Vk
IHdheS4iDQpJdCBpcyBjbGVhcmx5IGFsc28gdHJ1ZSB0aGF0IHRoZSBleGFtcGxlIGlzIGluZmxh
bW1hdG9yeS4NCg0KSSB0aGluayBJIG1heSBoYXZlIHRyaXBwZWQgb3ZlciBhbiBhcmVhIHdoZXJl
IHRoZXJlIGlzIG5vIGdvb2QNCmxhbmd1YWdlIG1hdGNoOiB0aGUgR2VybWFuIHRyYW5zbGF0aW9u
cyBvZiBpbmZsYW1tYXRvcnkNCmF1ZnLDvGhyZXJpc2NoICYgYXVmd2llZ2xlcmlzY2ggaGF2ZSBh
biBlbGVtZW50IG9mIHJlYmVsbGlvbg0KYW5kIG1pc2NoaWVmIHRvIHRoZW0gKGF0IGxlYXN0IHdo
ZW4gSSBncmV3IHVwKS4NCg0KSSBhbSB3b25kZXJpbmcgdGhvdWdoLCB3aGV0aGVyIGl0IGlzIG5l
Y2Vzc2FyeSB0byBpbmNsdWRlIA0KYSBkZWZpbml0aW9uIG9mIGFuIGluZmxhbW1hdG9yeSBxdWVz
dGlvbiBvciBhbiBpbmZsYW1tYXRvcnkNCnN0YXRlbWVudCBpZiB3ZSBzdGljayB3aXRoIGl0IGlu
IHRoZSB0aXRsZQ0KDQogICAgPiANCiAgICA+ICs+IEZvb3QgYmluZGluZyB3YXMgdGhlIGN1c3Rv
bSBvZiBhcHBseWluZyB0aWdodCBiaW5kaW5nIHRvIHRoZSBmZWV0IG9mIHlvdW5nDQogICAgPiAr
PiBnaXJscyB0byBtb2RpZnkgdGhlIHNoYXBlIGFuZCBzaXplIG9mIHRoZWlyIGZlZXQuIC4uLiBm
b290IGJpbmRpbmcgd2FzIGENCiAgICA+ICs+IHBhaW5mdWwgcHJhY3RpY2UgYW5kIHNpZ25pZmlj
YW50bHkgbGltaXRlZCB0aGUgbW9iaWxpdHkgb2Ygd29tZW4sIHJlc3VsdGluZw0KICAgID4gKz4g
aW4gbGlmZWxvbmcgZGlzYWJpbGl0aWVzIGZvciBtb3N0IG9mIGl0cyBzdWJqZWN0cy4gLi4uIEJp
bmRpbmcgdXN1YWxseQ0KICAgID4gKz4gc3RhcnRlZCBkdXJpbmcgdGhlIHdpbnRlciBtb250aHMg
c2luY2UgdGhlIGZlZXQgd2VyZSBtb3JlIGxpa2VseSB0byBiZSBudW1iLA0KICAgID4gKz4gYW5k
IHRoZXJlZm9yZSB0aGUgcGFpbiB3b3VsZCBub3QgYmUgYXMgZXh0cmVtZS4g4oCmVGhlIHRvZXMg
b24gZWFjaCBmb290DQogICAgPiArPiB3ZXJlIGN1cmxlZCB1bmRlciwgdGhlbiBwcmVzc2VkIHdp
dGggZ3JlYXQgZm9yY2UgZG93bndhcmRzIGFuZCBzcXVlZXplZA0KICAgID4gKz4gaW50byB0aGUg
c29sZSBvZiB0aGUgZm9vdCB1bnRpbCB0aGUgdG9lcyBicm9rZeKApg0KICAgIA0KICAgIEluIG15
IHRhbGsgSSBjb3ZlcmVkIHRoZSBsYXN0IHRocmVlIHdvcmRzIGJlaGluZCBhIGJsdWUgc3F1YXJl
LCBzaW5jZSB0aGlzIGltYWdlIGlzIHByZXR0eSB2aW9sZW50IOKAlCBhbmQgaXMgZ2VuZGVyZWQg
dmlvbGVuY2UgYXQgdGhhdC4gIFNvbWUgcGVvcGxlIGpva2UgYWJvdXQg4oCcdHJpZ2dlcmluZ+KA
nSwgYnV0IHRoZXJlIGFyZSBjZXJ0YWlubHkgcGVvcGxlIHdobyAgaGF2ZSBleHBlcmllbmNlZCB2
aW9sZW5jZSwgd2hvIHdoZW4gdGhleSBjb21lIGFjcm9zcyBkZXNjcmlwdGlvbnMgb2YgaXQgdW5l
eHBlY3RlZGx5IHN1ZGRlbmx5IGhhdmUgbG9hZHMgb2YgdW53ZWxjb21lIGVtb3Rpb25zIHRvIGRl
YWwgd2l0aDsgYW5kIEkgdmVudHVyZSB0byBndWVzcyB0aGF0IG1vc3QgcGVvcGxlIHNraW1taW5n
IHRocm91Z2ggc3VjaCBhIGd1aWRlIHdvdWxkbuKAmXQgYmUgZXhwZWN0aW5nIHRvIGNvbWUgYWNy
b3NzIHNvbWV0aGluZyBsaWtlIHRoaXMuDQogICAgDQogICAgUGVyc29uYWxseSBJIHdvdWxkIHJl
cGxhY2UgdGhlIGxhc3QgdGhyZWUgd29yZHMgd2l0aCBbcmVkYWN0ZWRdLiAgVGhlIHBvaW50IGNh
biBiZSBtYWRlIHdpdGhvdXQgYmVpbmcgc28gZXhwbGljaXQuICBBbnlvbmUgd2hvIHdhbnRzIHRv
IGtub3cgd2hhdCBoYXBwZW5zIGNhbiBnbyBsb29rIHVwIHRoZSBlbnRyeSB0aGVtc2VsdmVzLg0K
DQpPSy4gSSBjYW4gZG8gdGhhdC4gDQpJIGNvcGllZCB0aGUgdGV4dCBmcm9tIHRoZSBjb250ZW50
IG91dGxpbmUgb24gc2xpZGUgc2hhcmUgYW5kIHdhc24ndCBldmVuIGxvb2tpbmcgYXQgdGhlIHNs
aWRlcyB0aGVtc2VsdmVzDQogICAgDQpMYXJzDQogICAgDQogICAgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
