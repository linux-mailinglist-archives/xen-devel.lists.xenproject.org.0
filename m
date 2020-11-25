Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D473D2C3F50
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 12:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37613.70069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtJH-00052z-Sb; Wed, 25 Nov 2020 11:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37613.70069; Wed, 25 Nov 2020 11:50:07 +0000
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
	id 1khtJH-00052a-Nl; Wed, 25 Nov 2020 11:50:07 +0000
Received: by outflank-mailman (input) for mailman id 37613;
 Wed, 25 Nov 2020 11:50:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1khtJG-0004yt-0z
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:50:06 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bdb7f1d-62a6-4c4b-aa89-ead1607bc409;
 Wed, 25 Nov 2020 11:50:04 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 25 Nov 2020 11:49:58 +0000
Received: from EX13D03EUC004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7EE7A206C; Wed, 25 Nov 2020 11:49:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 11:49:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 11:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
	id 1khtJG-0004yt-0z
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:50:06 +0000
X-Inumbo-ID: 2bdb7f1d-62a6-4c4b-aa89-ead1607bc409
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2bdb7f1d-62a6-4c4b-aa89-ead1607bc409;
	Wed, 25 Nov 2020 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1606305005; x=1637841005;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=0Xp+Ld/00tFOv4jMqEHbRqWMFmZJkCjUUSRudyIJZ6U=;
  b=MCTuO7KvnOGfmop0S4STVAhL018Os0jj/gWhBh/XcUtGdShdsA4LifV+
   gFNzSFBNCnWhgamUwE/QCa7geyEL/PhZ7rQZI2rXncApQ94s/SupGPOwB
   daIF7oNfQlMm+mgDjEHSXVSBFK6w9SVPkmILhtyb4bfRm6QRNVcVms3wT
   A=;
X-IronPort-AV: E=Sophos;i="5.78,368,1599523200"; 
   d="scan'208";a="97787018"
Subject: RE: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Thread-Topic: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 25 Nov 2020 11:49:58 +0000
Received: from EX13D03EUC004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS id D7EE7A206C;
	Wed, 25 Nov 2020 11:49:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 11:49:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 11:49:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Elnikety, Eslam" <elnikety@amazon.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Thread-Index: AQHWwpaPMlIHtWtagUGiOXvRZvLCO6nYt6KAgAAEHQA=
Date: Wed, 25 Nov 2020 11:49:54 +0000
Message-ID: <fc5c13e8e8f349ad9c005313bbe60d07@EX13D32EUC003.ant.amazon.com>
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
 <2b2e3737-ecd7-907f-3c72-f31835dc5cb8@citrix.com>
In-Reply-To: <2b2e3737-ecd7-907f-3c72-f31835dc5cb8@citrix.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyNSBOb3ZlbWJlciAyMDIwIDExOjMxDQo+
IFRvOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgRWxu
aWtldHksIEVzbGFtIDxlbG5pa2V0eUBhbWF6b24uY29tPjsgQ2hyaXN0aWFuIExpbmRpZw0KPiA8
Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9y
Zz47IElhbiBKYWNrc29uIDxpd2pAeGVucHJvamVjdC5vcmc+OyBXZWkNCj4gTGl1IDx3bEB4ZW4u
b3JnPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UkU6IFtFWFRFUk5BTF0gW1BBVENIIHY0IDEvM10gZG9tY3RsOiBpbnRyb2R1Y2UgYSBuZXcgZG9t
YWluIGNyZWF0ZSBmbGFnLA0KPiBYRU5fRE9NQ1RMX0NERl9kaXNhYmxlX2ZpZm8sIC4uLg0KPiAN
Cj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3Jn
YW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMjQvMTEvMjAyMCAxOToxNywgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5j
bHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiBpbmRleCA2NjZhZWI3MWJmMWIuLjcwNzAxYzU5ZDA1
MyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiBAQCAtNzAsOSArNzAsMTEgQEAgc3Ry
dWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsNCj4gPiAgI2RlZmluZSBYRU5fRE9NQ1RMX0NE
Rl9pb21tdSAgICAgICAgICAoMVU8PF9YRU5fRE9NQ1RMX0NERl9pb21tdSkNCj4gPiAgI2RlZmlu
ZSBfWEVOX0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQgICA2DQo+ID4gICNkZWZpbmUgWEVOX0RPTUNU
TF9DREZfbmVzdGVkX3ZpcnQgICAgKDFVIDw8IF9YRU5fRE9NQ1RMX0NERl9uZXN0ZWRfdmlydCkN
Cj4gPiArI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICA3DQo+ID4gKyNkZWZp
bmUgWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICAgKDFVIDw8IF9YRU5fRE9NQ1RMX0NERl9k
aXNhYmxlX2ZpZm8pDQo+IA0KPiBUaGUgc2Vuc2UgaXMgYmFja3dhcmRzLiAgSXQgc2hvdWxkIGJl
IGEgInBlcm1pdCB0aGUgdXNlIG9mIEZJRk8iDQo+IGNvbnRyb2wuICBJZiB0aGUgY29kZSBoYWQg
YmVlbiB3cml0dGVuIHRoaXMgd2F5IHRvIGJlZ2luIHdpdGgsIHRoZSBidWcNCj4geW91IGZvdW5k
IHdvdWxkbid0IGhhdmUgZXhpc3RlZC4NCj4gDQo+IEdpdmVuIHRoYXQgdGhlcmUgaXMgbm90IGN1
cnJlbnRseSBhIHdheSB0byBkaXNhYmxlIEZJRk8sIHlvdSBjYW4NCj4gcHJvYmFibHkgZG8gd2l0
aG91dCBhbiBlbnVtZXJhdGlvbiBvZiB3aGV0aGVyIHRoZSBoeXBlcnZpc29yIHN1cHBvcnRzIGl0
DQo+IG9yIG5vdC4NCj4gDQoNCk9rLCBJIGNhbiByZXZlcnNlIHRoZSBzZW5zZS4NCg0KSSBmb3Vu
ZCBhbm90aGVyIG9uZSB0aGF0IHdlIG91Z2h0IHRvIGNvbnRyb2wgaW4gYSBzaW1pbGFyIHdheS4u
LiB0aGUgcGVyLWNwdSBldnRjaG4gdXBjYWxscy4gQUZBSUsgb25seSB0aGUgV2luZG93cyBQViBk
cml2ZXJzIG1ha2UgdXNlIG9mIGl0IChhbmQgSSBjYW4gYXJyYW5nZSB0byBzcXVhc2ggdGhhdCB3
aXRoIGEgcmVnaXN0cnkgZmxhZykgYnV0IGl0IHJlYWxseSBmYWxscyBpbnRvIHRoZSBzYW1lIGNh
dGVnb3J5IGFzIEZJRk8uLi4gc28gbWF5YmUgd2UgbmVlZCBhIHNlcGFyYXRlIGJpdC1maWVsZCBm
b3IgdGhlc2Ugc29ydHMgb2YgdGhpbmc/DQoNCiAgUGF1bA0KDQo+IH5BbmRyZXcNCg==

