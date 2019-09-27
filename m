Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0796C02C1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:57:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmwv-0003wb-CE; Fri, 27 Sep 2019 09:54:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+55=XW=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iDmwt-0003wR-VZ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:54:04 +0000
X-Inumbo-ID: b184aeb0-e10c-11e9-9674-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id b184aeb0-e10c-11e9-9674-12813bfff9fa;
 Fri, 27 Sep 2019 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569578025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oOxqcnAfl8DKlep5srI0Y1YgKTJNhv8KZZhULsKMvQc=;
 b=WZAqUw9ydfGIlQpQdqvTQMI+dXKZNd3rpF1S8nNpWsBDiutm0x0u9Pw0
 qrjP4sFLxALdxwrVcqWXOhNCJ4u1p7ndHBoaDD2unUMM6P1Ux3sMHTkIH
 5FluzCwNOzygGYO0h79BPpPByJiahGO8VvCJucJ3QClI99B58Y9yiyjLg I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KD8gwZV1hgXdgePQ6C80NN2bghuyBINFKo9mAO7FJdWirTHXpf21b0acdaz9zVqfJuhmed293U
 tKh8Zq05/63XmTYF/NYFu+GJwSSpieAhyZdAEWEJwMpicCwJy/omalgkmWGrDH0QUI2XnImrqw
 uSGR93sUE2dzPDRRQQVj8N7+w5/iiz97eQ/XwcoeUlWhS63g7YoSKVVKn3KjCofJHUQJJ9fmEF
 iA6tqRWhfNrCdgtw6RLdrdBn+RjRGsMKZFydSkpBXWfqWcba4DIBkMSIQRSYk4QTqq1F+EOM0o
 CSs=
X-SBRS: 2.7
X-MesageID: 6229932
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6229932"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v2 5/6] Add guide on Communication Best Practice
Thread-Index: AQHVdKIoBNlHjnrbLUK7o4oIKuieK6c/GOUAgAAf64A=
Date: Fri, 27 Sep 2019 09:53:39 +0000
Message-ID: <8B4C0CAE-98AC-48C8-91B0-C33998D5E47D@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <10b633de-2238-bad7-3d2a-13899b7497d6@suse.com>
In-Reply-To: <10b633de-2238-bad7-3d2a-13899b7497d6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0570CBF598F239429B8B5DEB08E2157B@citrix.com>
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI3LzA5LzIwMTksIDA5OjU5LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAyNi4wOS4yMDE5IDIxOjM5LCBMYXJzIEt1cnRoIHdyb3Rl
Og0KICAgID4gKyMjIyBFeHByZXNzIGFwcHJlY2lhdGlvbg0KICAgID4gK0FzIHRoZSBuYXR1cmUg
b2YgY29kZSByZXZpZXcgdG8gZmluZCBidWdzIGFuZCBwb3NzaWJsZSBpc3N1ZXMsIGl0IGlzIHZl
cnkgZWFzeSBmb3INCiAgICA+ICtyZXZpZXdlcnMgdG8gZ2V0IGludG8gYSBtb2RlIG9mIG9wZXJh
dGlvbiB3aGVyZSB0aGUgcGF0Y2ggcmV2aWV3IGVuZHMgdXAgYmVpbmcgYSBsaXN0DQogICAgPiAr
b2YgaXNzdWVzLCBub3QgbWVudGlvbmluZyB3aGF0IGlzIHJpZ2h0IGFuZCB3ZWxsIGRvbmUuIFRo
aXMgY2FuIGxlYWQgdG8gdGhlIGNvZGUNCiAgICA+ICtzdWJtaXR0ZXIgaW50ZXJwcmV0aW5nIHlv
dXIgZmVlZGJhY2sgaW4gYSBuZWdhdGl2ZSB3YXkuDQogICAgPiArDQogICAgPiArVGhlIG9wZW5p
bmcgb2YgYSBjb2RlIHJldmlldyBwcm92aWRlcyBhbiBvcHBvcnR1bml0eSB0byBhZGRyZXNzIHRo
aXMgYW5kIGFsc28gc2V0cyB0aGUNCiAgICA+ICt0b25lIGZvciB0aGUgcmVzdCBvZiB0aGUgY29k
ZSByZXZpZXcuIFN0YXJ0aW5nICoqZXZlcnkqKiByZXZpZXcgb24gYSBwb3NpdGl2ZSBub3RlLCBo
ZWxwcw0KICAgID4gK3NldCB0aGUgdG9uZSBmb3IgdGhlIHJlc3Qgb2YgdGhlIHJldmlldy4NCiAg
ICA+ICsNCiAgICA+ICtGb3IgYW4gaW5pdGlhbCBwYXRjaCwgeW91IGNhbiB1c2UgcGhyYXNlcyBz
dWNoIGFzDQogICAgPiArPiBUaGFua3MgZm9yIHRoZSBwYXRjaA0KICAgID4gKz4gVGhhbmtzIGZv
ciBkb2luZyB0aGlzDQogICAgPiArDQogICAgPiArRm9yIGZ1cnRoZXIgcmV2aXNpb25zIHdpdGhp
biBhIHJldmlldywgcGhyYXNlcyBzdWNoIGFzDQogICAgPiArPiBUaGFuayB5b3UgZm9yIGFkZHJl
c3NpbmcgdGhlIGxhc3Qgc2V0IG9mIGNoYW5nZXMNCiAgICA+ICsNCiAgICA+ICtJZiB5b3UgYmVs
aWV2ZSB0aGUgY29kZSB3YXMgZ29vZCwgaXQgaXMgZ29vZCBwcmFjdGljZSB0byBoaWdobGlnaHQg
dGhpcyBieSB1c2luZyBwaHJhc2VzDQogICAgPiArc3VjaCBhcw0KICAgID4gKz4gTG9va3MgZ29v
ZCwganVzdCBhIGZldyBjb21tZW50cw0KICAgID4gKz4gVGhlIGNoYW5nZXMgeW91IGhhdmUgbWFk
ZSBzaW5jZSB0aGUgbGFzdCB2ZXJzaW9uIGxvb2sgZ29vZA0KICAgID4gKw0KICAgID4gK0lmIHlv
dSB0aGluayB0aGVyZSB3ZXJlIGlzc3VlcyB0b28gbWFueSB3aXRoIHRoZSBjb2RlIHRvIHVzZSBv
bmUgb2YgdGhlIHBocmFzZXMsDQogICAgPiAreW91IGNhbiBzdGlsbCBzdGFydCBvbiBhIHBvc2l0
aXZlIG5vdGUsIGJ5IGZvciBleGFtcGxlIHNheWluZw0KICAgID4gKz4gSSB0aGluayB0aGlzIGlz
IGEgZ29vZCBjaGFuZ2UNCiAgICA+ICs+IEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgZmVhdHVyZSBw
cm9wb3NhbA0KICAgID4gKw0KICAgID4gK0l0IGlzIGFsc28gZW50aXJlbHkgZmluZSB0byBoaWdo
bGlnaHQgc3BlY2lmaWMgY2hhbmdlcyBhcyBnb29kLiBUaGUgYmVzdCBwbGFjZSB0bw0KICAgID4g
K2RvIHRoaXMsIGlzIGF0IHRvcCBvZiBhIHBhdGNoLCBhcyBhZGRyZXNzaW5nIGNvZGUgcmV2aWV3
IGNvbW1lbnRzIHR5cGljYWxseSByZXF1aXJlcw0KICAgID4gK2EgY29udHJpYnV0b3IgdG8gZ28g
dGhyb3VnaCB0aGUgbGlzdCBvZiB0aGluZ3MgdG8gYWRkcmVzcyBhbmQgYW4gaW4tbGluZWQgcG9z
aXRpdmUNCiAgICA+ICtjb21tZW50IGlzIGxpa2VseSB0byBicmVhayB0aGF0IHdvcmtmbG93Lg0K
ICAgID4gKw0KICAgID4gK1lvdSBzaG91bGQgYWxzbyBjb25zaWRlciwgdGhhdCBpZiB5b3UgcmV2
aWV3IGEgcGF0Y2ggb2YgYW4gZXhwZXJpZW5jZWQNCiAgICA+ICtjb250cmlidXRvciBwaHJhc2Vz
IHN1Y2ggYXMgKlRoYW5rcyBmb3IgdGhlIHBhdGNoKiBjb3VsZCBjb21lIGFjcm9zcyBhcw0KICAg
ID4gK3BhdHJvbml6aW5nLCB3aGlsZSB1c2luZyAqVGhhbmtzIGZvciBkb2luZyB0aGlzKiBpcyBs
ZXNzIGxpa2VseSB0byBiZSBpbnRlcnByZXRlZA0KICAgID4gK2FzIHN1Y2guDQogICAgPiArDQog
ICAgPiArQXBwcmVjaWF0aW9uIHNob3VsZCBhbHNvIGJlIGV4cHJlc3NlZCBieSBwYXRjaCBhdXRo
b3JzIHdoZW4gYXNraW5nIGZvciBjbGFyaWZpY2F0aW9ucw0KICAgID4gK3RvIGEgcmV2aWV3IG9y
IHJlc3BvbmRpbmcgdG8gcXVlc3Rpb25zLiBBIHNpbXBsZQ0KICAgID4gKz4gVGhhbmsgeW91IGZv
ciB5b3VyIGZlZWRiYWNrDQogICAgPiArPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkNCiAgICA+
ICs+IFRoYW5rIHlvdSBYWFghDQogICAgPiArDQogICAgPiAraXMgbm9ybWFsbHkgc3VmZmljaWVu
dC4NCiAgICANCiAgICBUbyBhbGwgb2YgdGhpcyBJIGNhbid0IHJlc2lzdCBnaXZpbmcgYSByZW1h
cmsgdGhhdCBJJ3ZlIGFscmVhZHkgZ2l2ZW4NCiAgICB3aGVuIGRpc2N1c3NpbmcgdGhlIG1hdHRl
ciBpbiBwZXJzb246IEknbSBub3Qgc3VyZSBhYm91dCBFbmdsaXNoLCBidXQNCiAgICBpbiBHZXJt
YW4gdGhlIHdvcmQgIlBocmFzZSIgYWxzbyBoYXMgYW4sIGF0IHRpbWVzIHZlcnksIG5lZ2F0aXZl
DQogICAgbWVhbmluZy4gV2hlbiBJIGdldCByZXZpZXcgZmVlZGJhY2sgc3RhcnRpbmcgbGlrZSBz
dWdnZXN0ZWQgYWJvdmUsIGl0DQogICAgZGVmaW5pdGVseSBmZWVscyB0byBtZSBtb3JlIGxpa2Ug
dGhpcyAodGhlIHN0YXRlbWVudCB3YXMgYWRkZWQgdGhlcmUNCiAgICBqdXN0IGZvciBpdCB0byBi
ZSB0aGVyZSkuIEkgcmVhbGl6ZSB0aGlzIG1heSBub3QgYWx3YXlzIChhbmQgcGVyaGFwcw0KICAg
IGV2ZW4gaW4gYSBtYWpvcml0eSBvZiBzaXR1YXRpb25zKSBiZSB0aGUgY2FzZSwgYnV0IHRoYXQn
cyBob3cgaXQgZmVlbHMNCiAgICB0byBtZSBuZXZlcnRoZWxlc3MuIEFzIGEgcmVzdWx0IEkgd291
bGQgcmF0aGVyIHJhcmVseSwgaWYgZXZlciwgc3RhcnQNCiAgICBsaWtlIHRoaXMgKG9uIHRoZSBi
YXNpcyBvZiAiZG9uJ3QgZG8gdG8gb3RoZXJzIHdoYXQgeW91IGRpc2xpa2UNCiAgICB5b3Vyc2Vs
ZiIpOyBhIGNhc2Ugd2hlcmUgSSBtaWdodCBkbyBzbyB3b3VsZCBiZSB3aGVuIEkgaGFkIGFza2Vk
IGZvcg0KICAgIChvciBvZmZsb2FkZWQpIHRoZSBwdXR0aW5nIHRvZ2V0aGVyIG9mIGEgcGFydGlj
dWxhciBjaGFuZ2UuDQoNCkkgdGhpbmsgeW91ciByZXBseSBwcm92ZXMgYWxtb3N0IGVudGlyZWx5
IHRoZSBwb2ludCBvZiB0aGUgYXJ0aWNsZS4gSW4gdGhlDQplbmQgYWxsIG9mIHRoaXMgZGVwZW5k
cyBvbiBjb21tdW5pY2F0aW9uIHN0eWxlcyAoYm90aCBwZXJzb25hbCBhbmQNCmN1bHR1cmFsKS4g
TXkgdGFrZSB0byBpdCBpcyB0aGF0IHRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuDQoNCmEp
IFNvbWVvbmUgeW91IGtub3c6IHdoYXQgdWx0aW1hdGVseSB3aWxsIGhhcHBlbiBpcyB0aGF0IA0K
d2hlbiB5b3UgZW5nYWdlIHdpdGggc29tZW9uZSB5b3Uga25vdyBhbmQgaGFkIGRvbmUgcmV2aWV3
cyBiZWZvcmUNCnlvdSB1bHRpbWF0ZWx5IGJlY29tZSBtb3JlIHRlcnNlIGFuZCBhbHNvIGRyb3Ag
bmljZXRpZXMuDQpXaGljaCBpcyBPSw0KDQpiKSBTb21lb25lIHlvdSBkb27igJl0IGtub3c6IGlu
IHRoYXQgY2FzZSwgd2Ugc2hvdWxkIHN0YXJ0IGZyb20NCmEgcmVhc29uYWJsZSBtaWRkbGUgZ3Jv
dW5kIGFuZCBwdXQgaW4gYSBiaXQgbW9yZSBlZmZvcnQNCg0KICAgIEV2ZW4gd29yc2UsIHRoZXJl
IGhhdmUgYmVlbiAoYWxzbyB2ZXJ5IHJlY2VudCkgZXhhbXBsZXMgd2hlcmUgcmVwbGllcw0KICAg
IGNvbWUgYmFjayBzYXlpbmcganVzdCAiVGhhbmsgeW91IiAoZS5nLiBmb3IgYW4gYWNrKS4gU3Vj
aCBjZXJ0YWlubHkNCiAgICBnZXQgc2VudCB3aXRoIGdvb2QgaW50ZW50aW9ucywgYnV0IHBlb3Bs
ZSBkb2luZyBzbyBsaWtlbHkgb3Zlcmxvb2sNCiAgICB0aGUgZmFjdCB0aGF0IHRoZXJlJ3MgYWxy
ZWFkeSB3YXkgdG9vIG11Y2ggZW1haWwgdG8gcmVhZCBmb3IgbWFueSBvZg0KICAgIHVzLiAoVGhl
IHNhbWUgYXBwbGllcyB0byBvdGhlciBuZXRpcXVldHRlIGFzcGVjdHMgdGhhdCBJIGtlZXANCiAg
ICBtZW50aW9uaW5nIG9uIGUuZy4gc3VtbWl0cywgYnV0IHdpdGggYXBwYXJlbnRseSBsaXR0bGUg
dG8gbm8gZWZmZWN0Og0KICAgIFBlb3BsZSBmcmVxdWVudGx5IGZhaWwgdG8gc3RyaXAgdW5uZWNl
c3NhcnkgY29udGV4dCB3aGVuIHJlcGx5aW5nLA0KICAgIHJlcXVpcmluZyBfZXZlcnlfIHJlYWRl
ciB0byBzY3JvbGwgdGhyb3VnaCBhIHBlcmhhcHMgbG9uZyBtYWlsIGp1c3QNCiAgICB0byBmaW5k
IHRoYXQgdGhlcmUncyBhbG1vc3Qgbm90aGluZyBvZiBpbnRlcmVzdC4gUGVvcGxlIGFsc28gc2Vl
bSB0bw0KICAgIGhhdmUgZGlmZmljdWx0eSB1bmRlcnN0YW5kaW5nIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gVG8gYW5kIENjLikNCg0KVGhhdCBpcyBhIGdvb2QgcG9pbnQgYW5kIEkgaGFkIGZvcmdv
dHRlbiBhYm91dCBpdA0KVGhhbmtzIGZvciByZW1pbmRpbmcgbWUNCg0KSSBjYW4gYWRkIGEgc2Vj
dGlvbiBvbiB0aGlzIHdoaWNoIGxvb2tzIGZvciBiYWxhbmNlIGluIHRoZSBpbnRlcmVzdA0Kb2Yg
c2F2aW5nIHlvdXIgY29tbXVuaWNhdGlvbiBwYXJ0bmVyJ3MgdGltZS4gVWx0aW1hdGVseSB0aGlz
IGlzIGENCmFsc28gc2hvd2luZyBhIGRlZ3JlZSBvZiB0aG91Z2h0ZnVsbmVzcy4gDQoNCkFuZCB3
ZSBjYW4gc3RhdGUgaW4gdGhlcmUgdGhpbmdzIGxpa2UgdGhlIENDL1RPIGxpc3QNCkFuZCBub3Qg
dG8gdGhhbmsgY29kZSByZXZpZXdlcnMgZm9yIEFDS3Mgb3Igb3RoZXJ3aXNlIGluIGEgDQpzdGFu
ZC1hbG9uZSBlLW1haWwNCiAgICANCiAgICBUaGUgYm90dG9tIGxpbmUgb2YgdGhpcyBpcyAtIHRo
ZSAiYmVpbmcga2luZCB0byBvbmUgYW5vdGhlciIgYXNwZWN0DQogICAgb2YgYXNraW5nIGZvciB0
aGlzIGJlaGF2aW9yIG5lZWRzIHRvIGJlIHdlaWdoZWQgY2FyZWZ1bGx5IGFnYWluc3QgaXRzDQog
ICAgZWZmZWN0cyBvZiB1bmR1bHkgY29uc3VtaW5nIGV2ZXJ5Ym9keSdzIHRpbWUuDQogICAgDQpJ
IGFtIGZ1bGx5IGF3YXJlIG9mIHRoaXMsIGFuZCB3YXMgdHJ5aW5nIHRvIGFwcHJvYWNoIHRoaXMg
ZnJvbSB0aGlzDQp2aWV3cG9pbnQgb2YgdHJ5aW5nIHRvIGFjaGlldmUgYSBzZW5zaWJsZSBiYWxh
bmNlDQoNCkJ1dCBhZnRlciB5b3VyIGNvbW1lbnQsIG1heWJlIHRoYXQgd2FzIG5vdCBjbGVhciBl
bm91Z2gNCg0KQmVzdCBSZWdhcmRzDQpMYXJzICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
