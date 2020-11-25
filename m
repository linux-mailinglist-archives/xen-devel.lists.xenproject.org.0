Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6112C3EAD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 12:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37567.69993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsYv-00005I-MG; Wed, 25 Nov 2020 11:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37567.69993; Wed, 25 Nov 2020 11:02:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsYv-0008WT-Io; Wed, 25 Nov 2020 11:02:13 +0000
Received: by outflank-mailman (input) for mailman id 37567;
 Wed, 25 Nov 2020 11:02:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1khsYt-0008WO-FE
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:02:11 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 088478a3-1fda-4c1e-9d51-c495a195ed85;
 Wed, 25 Nov 2020 11:02:07 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 25 Nov 2020 11:02:00 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 18D87A1EB1; Wed, 25 Nov 2020 11:01:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 11:01:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 11:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
	id 1khsYt-0008WO-FE
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:02:11 +0000
X-Inumbo-ID: 088478a3-1fda-4c1e-9d51-c495a195ed85
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 088478a3-1fda-4c1e-9d51-c495a195ed85;
	Wed, 25 Nov 2020 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1606302128; x=1637838128;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=OIiiM2HU51UNYqzSXsup0GIZImJAvowKCm9OyLNZDuA=;
  b=AMkeZaHxP55aLJpWOkQ58knoU0P9mprcHRAI9wMVOohZIii3W/sJ9Gwr
   GxvSnfbH9VMNJK34ZQth5ghMdy1IjqX0XhDGxmmcg6S4AlDymH5Nofgfs
   fmLHhoN4lQpygA/9JKxa2W9VUPpRANwacsvYJSYU+MPTrSnCk8FCpaKgG
   k=;
X-IronPort-AV: E=Sophos;i="5.78,368,1599523200"; 
   d="scan'208";a="97775005"
Subject: RE: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Thread-Topic: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 25 Nov 2020 11:02:00 +0000
Received: from EX13D03EUC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS id 18D87A1EB1;
	Wed, 25 Nov 2020 11:01:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 11:01:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 11:01:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Elnikety, Eslam" <elnikety@amazon.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Thread-Index: AQHWwpaPMlIHtWtagUGiOXvRZvLCO6nYkyyAgAAEeICAABSW4A==
Date: Wed, 25 Nov 2020 11:01:55 +0000
Message-ID: <2fb04a18fa184e699aaf8b8c6604f396@EX13D32EUC003.ant.amazon.com>
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
 <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
 <19792219-22f0-e7ce-23ca-5c1b20d6f581@suse.com>
In-Reply-To: <19792219-22f0-e7ce-23ca-5c1b20d6f581@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMjAgMDk6MzYNCj4gVG86IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBFbG5pa2V0eSwgRXNsYW0gPGVsbmlrZXR5QGFtYXpv
bi5jb20+OyBDaHJpc3RpYW4gTGluZGlnDQo+IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+
OyBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPjsgSWFuIEphY2tzb24gPGl3akB4ZW5wcm9q
ZWN0Lm9yZz47IFdlaQ0KPiBMaXUgPHdsQHhlbi5vcmc+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFu
bw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU3ViamVjdDog
UkU6IFtFWFRFUk5BTF0gW1BBVENIIHY0IDEvM10gZG9tY3RsOiBpbnRyb2R1Y2UgYSBuZXcgZG9t
YWluIGNyZWF0ZSBmbGFnLA0KPiBYRU5fRE9NQ1RMX0NERl9kaXNhYmxlX2ZpZm8sIC4uLg0KPiAN
Cj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3Jn
YW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMjUuMTEuMjAyMCAxMDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+ID4gT24gMjQuMTEuMjAyMCAyMDoxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAtLS0g
YS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oDQo+ID4+IEBAIC03MCw5ICs3MCwxMSBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9j
cmVhdGVkb21haW4gew0KPiA+PiAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9pb21tdSAgICAgICAg
ICAoMVU8PF9YRU5fRE9NQ1RMX0NERl9pb21tdSkNCj4gPj4gICNkZWZpbmUgX1hFTl9ET01DVExf
Q0RGX25lc3RlZF92aXJ0ICAgNg0KPiA+PiAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9uZXN0ZWRf
dmlydCAgICAoMVUgPDwgX1hFTl9ET01DVExfQ0RGX25lc3RlZF92aXJ0KQ0KPiA+PiArI2RlZmlu
ZSBfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICA3DQo+ID4+ICsjZGVmaW5lIFhFTl9ET01D
VExfQ0RGX2Rpc2FibGVfZmlmbyAgICgxVSA8PCBfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZv
KQ0KPiA+DQo+ID4gRGVzcGl0ZSBnZXR0aW5nIGxvbmdpc2gsIEkgdGhpbmsgdGhpcyBuZWVkcyAi
ZXZ0Y2huIiBzb21ld2hlcmUgaW4NCj4gPiB0aGUgbmFtZS4gVG8ga2VlcCBzaXplIGJvdW5kZWQs
IG1heWJlIFhFTl9ET01DVExfQ0RGX25vX2ZpZm9fZXZ0Y2huPw0KPiA+DQoNCkknbSBvayB3aXRo
IHRoYXQgbmFtZTsgSSdsbCBzZW5kIGEgdjUuDQoNCj4gPj4gIC8qIE1heCBYRU5fRE9NQ1RMX0NE
Rl8qIGNvbnN0YW50LiAgVXNlZCBmb3IgQUJJIGNoZWNraW5nLiAqLw0KPiA+PiAtI2RlZmluZSBY
RU5fRE9NQ1RMX0NERl9NQVggWEVOX0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQNCj4gPj4gKyNkZWZp
bmUgWEVOX0RPTUNUTF9DREZfTUFYIFhFTl9ET01DVExfQ0RGX2Rpc2FibGVfZmlmbw0KPiA+DQo+
ID4gV2hpbGUgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgSSdtIHB1enpsZWQg
YnkgdGhlDQo+ID4gcHJlc2VuY2Ugb2YgdGhpcyBjb25zdGFudDogSSd2ZSBub3QgYmVlbiBhYmxl
IHRvIGZpbmQgYW55IHVzZSBvZg0KPiA+IGl0LiBJbiBwYXJ0aWN1bGFyIHlvdSBkaWQgaGF2ZSBh
IG5lZWQgdG8gbW9kaWZ5DQo+ID4gc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpLg0KPiANCj4gU28g
aXQgd2FzIHlvdSB0byBpbnRyb2R1Y2UgdGhpcywgcmlnaHQgYXdheSB3aXRob3V0IGFueSB1c2Vy
LCBpbg0KPiA3ZmIwZTEzNGY4YzYgKCJ0b29scy9vY2FtbDogYWJpOiBVc2UgZm9ybWFsIGNvbnZl
cnNpb24gYW5kIGNoZWNrDQo+IGluIG1vcmUgcGxhY2VzIikuIFRoZSBvbmx5IHJlZmVyZW5jZSBp
cyBmcm9tIHdoYXQgSSByZWdhcmQgYXMgYQ0KPiBjb21tZW50IChJIGRvbid0IHNwZWFrIGFueSBv
Y2FtbCwgc28gSSBtYXkgYmUgd3JvbmcpLiBDb3VsZCB5b3UNCj4gY2xhcmlmeSB3aHkgd2UgbmVl
ZCB0byBtYWludGFpbiB0aGlzIGNvbnN0YW50Pw0KPiANCg0KSSBjYW4ndCByZW1lbWJlciB0aGUg
ZXhhY3Qgc2VxdWVuY2Ugb2YgZXZlbnRzIGJ1dCBpdCBiZWNhbWUgYXBwYXJlbnQgYXQgc29tZSBw
b2ludCB0aGF0IHRoZSBvY2FtbCBiaW5kaW5ncyB3ZXJlIG91dCBvZiBzeW5jIGFuZCB0aGV5IHJl
bHkgb24gYSBsaXN0IG9mIGRvbWFpbiBjcmVhdGUgZmxhZ3Mgd2hlcmUgdGhlIG51bWJlciBoYXMg
dG8gbWF0Y2ggdGhlIGJpdC1zaGlmdCB2YWx1ZSBpbiBkb21jdGwuaCAoYW1vbmcgb3RoZXIgdGhp
bmdzKS4gVGh1cyB0aGVyZSBpcyBhbiBhdXRvLWdlbmVyYXRlZCBoZWFkZXIgY2FsbGVkICJ4ZW5j
dHJsX2FiaV9jaGVjay5oIiB3aGljaCBpcyBpbmNsdWRlZCBieSB4ZW5jdHJsX3N0dWJzLmMuIFRo
aXMgaGVhZGVyIGlzIGdlbmVyYXRlZCBmcm9tIHhlbmN0cmwubWwgYnkgdGhlIHBlcmwgc2NyaXB0
ICJhYmktY2hlY2siIGFuZCBpdCByZWxpZXMgdGhlIFhFTl9ET01DVExfQ0RGX01BWCBjb25zdGFu
dCB0byBmb3JtIHBhcnQgb2YgdGhlIGNoZWNrcyBpdCBnZW5lcmF0ZXMuDQoNCkFzIGFuIGV4YW1w
bGUsIGhlcmUgaXMgdGhlIGdlbmVyYXRlZCBoZWFkZXIgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQ6
DQoNCi8vIGZvdW5kIG9jYW1sIHR5cGUgeDg2X2FyY2hfZW11bGF0aW9uX2ZsYWdzIGF0IHhlbmN0
cmwubWw6MzgNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfTEFQSUMgICAgICAgICAgICAgICE9
ICgxdSA8PCAwKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfSFBFVCAgICAgICAgICAg
ICAgICE9ICgxdSA8PCAxKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfUE0gICAgICAg
ICAgICAgICAgICE9ICgxdSA8PCAyKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfUlRD
ICAgICAgICAgICAgICAgICE9ICgxdSA8PCAzKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9F
TVVfSU9BUElDICAgICAgICAgICAgICE9ICgxdSA8PCA0KSAgKTsNCkJVSUxEX0JVR19PTiggWEVO
X1g4Nl9FTVVfUElDICAgICAgICAgICAgICAgICE9ICgxdSA8PCA1KSAgKTsNCkJVSUxEX0JVR19P
TiggWEVOX1g4Nl9FTVVfVkdBICAgICAgICAgICAgICAgICE9ICgxdSA8PCA2KSAgKTsNCkJVSUxE
X0JVR19PTiggWEVOX1g4Nl9FTVVfSU9NTVUgICAgICAgICAgICAgICE9ICgxdSA8PCA3KSAgKTsN
CkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfUElUICAgICAgICAgICAgICAgICE9ICgxdSA8PCA4
KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfVVNFX1BJUlEgICAgICAgICAgICE9ICgx
dSA8PCA5KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfVlBDSSAgICAgICAgICAgICAg
ICE9ICgxdSA8PCAxMCkgKTsNCkJVSUxEX0JVR19PTiggWEVOX1g4Nl9FTVVfQUxMICAgICAgICAg
ICAgICAgICE9ICgxdSA8PCAxMSktMXUgKTsNCi8vIGZvdW5kIG9jYW1sIHR5cGUgZG9tYWluX2Ny
ZWF0ZV9mbGFnIGF0IHhlbmN0cmwubWw6NjANCkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9DREZf
aHZtICAgICAgICAgICAgICE9ICgxdSA8PCAwKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX0RPTUNU
TF9DREZfaGFwICAgICAgICAgICAgICE9ICgxdSA8PCAxKSAgKTsNCkJVSUxEX0JVR19PTiggWEVO
X0RPTUNUTF9DREZfczNfaW50ZWdyaXR5ICAgICE9ICgxdSA8PCAyKSAgKTsNCkJVSUxEX0JVR19P
TiggWEVOX0RPTUNUTF9DREZfb29zX29mZiAgICAgICAgICE9ICgxdSA8PCAzKSAgKTsNCkJVSUxE
X0JVR19PTiggWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICAgICAgICE9ICgxdSA8PCA0KSAgKTsN
CkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9DREZfaW9tbXUgICAgICAgICAgICE9ICgxdSA8PCA1
KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQgICAgICE9ICgx
dSA8PCA2KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICAg
ICE9ICgxdSA8PCA3KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9DREZfTUFYICAgICAg
ICAgICAgICE9ICgxdSA8PCA3KSAgKTsNCi8vIGZvdW5kIG9jYW1sIHR5cGUgZG9tYWluX2NyZWF0
ZV9pb21tdV9vcHRzIGF0IHhlbmN0cmwubWw6NzANCkJVSUxEX0JVR19PTiggWEVOX0RPTUNUTF9J
T01NVV9ub19zaGFyZXB0ICAgICE9ICgxdSA8PCAwKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX0RP
TUNUTF9JT01NVV9NQVggICAgICAgICAgICE9ICgxdSA8PCAwKSAgKTsNCi8vIGZvdW5kIG9jYW1s
IHR5cGUgcGh5c2luZm9fY2FwX2ZsYWcgYXQgeGVuY3RybC5tbDoxMTMNCkJVSUxEX0JVR19PTigg
WEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSAgICAgICAgICE9ICgxdSA8PCAwKSAgKTsNCkJVSUxEX0JV
R19PTiggWEVOX1NZU0NUTF9QSFlTQ0FQX3B2ICAgICAgICAgICE9ICgxdSA8PCAxKSAgKTsNCkJV
SUxEX0JVR19PTiggWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvICAgICE9ICgxdSA8PCAyKSAg
KTsNCkJVSUxEX0JVR19PTiggWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcCAgICAgICAgICE9ICgxdSA8
PCAzKSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1NZU0NUTF9QSFlTQ0FQX3NoYWRvdyAgICAgICE9
ICgxdSA8PCA0KSAgKTsNCkJVSUxEX0JVR19PTiggWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hh
cF9wdF9zaGFyZSAhPSAoMXUgPDwgNSkgICk7DQpCVUlMRF9CVUdfT04oIFhFTl9TWVNDVExfUEhZ
U0NBUF9NQVggICAgICAgICAhPSAoMXUgPDwgNSkgICk7DQoNCiAgUGF1bA0K

