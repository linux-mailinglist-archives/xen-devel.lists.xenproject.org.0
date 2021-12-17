Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6F478F00
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 16:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248733.429047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEoi-0003P3-Cj; Fri, 17 Dec 2021 15:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248733.429047; Fri, 17 Dec 2021 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEoi-0003MZ-9B; Fri, 17 Dec 2021 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 248733;
 Fri, 17 Dec 2021 15:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZAj=RC=amazon.de=prvs=978e394f9=ahmeddan@srs-se1.protection.inumbo.net>)
 id 1myEld-00034H-Pp
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 15:03:29 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d6e7959-5f4a-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 16:03:28 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 17 Dec 2021 15:03:16 +0000
Received: from EX13D37EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-ff3df2fe.us-west-2.amazon.com (Postfix) with
 ESMTPS id 8B7294276B; Fri, 17 Dec 2021 15:03:15 +0000 (UTC)
Received: from EX13D24EUA001.ant.amazon.com (10.43.165.233) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1497.26; Fri, 17 Dec 2021 15:03:14 +0000
Received: from EX13D24EUA001.ant.amazon.com ([10.43.165.233]) by
 EX13D24EUA001.ant.amazon.com ([10.43.165.233]) with mapi id 15.00.1497.026;
 Fri, 17 Dec 2021 15:03:14 +0000
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
X-Inumbo-ID: 7d6e7959-5f4a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1639753409; x=1671289409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:mime-version:
   content-transfer-encoding;
  bh=Yckn2KgfMGO7T3K9/oAY9UiekEi0KqltBEAUWO9+7Ko=;
  b=STYWcz6TvBKQ3R1ZYKsywV1W0QX6KRCXR0mp1l/i2J4V3S0t5wizYKRf
   1Cdf2oG/6Do79Oqa5fhtL8YRJRyIggODeBsEe53YnBM1N4ib/R2sZGDrK
   /ZZ3OCh0MqJHB68PUTbKGGNDvqYlcDuajc8Nx/qouHuej9kHaLHaAIP/S
   8=;
X-IronPort-AV: E=Sophos;i="5.88,213,1635206400"; 
   d="scan'208";a="159724705"
From: "Ahmed, Daniele" <ahmeddan@amazon.de>
To: Dario Faggioli <dfaggioli@suse.com>, "julien@xen.org" <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "Grall, Julien"
	<jgrall@amazon.co.uk>
Subject: Re: NULL scheduler DoS
Thread-Topic: NULL scheduler DoS
Thread-Index: AQHX81c2Y/9DsiP900CdkkESOHPjGA==
Date: Fri, 17 Dec 2021 15:03:14 +0000
Message-ID: <3125A8D2-9299-4C31-8222-B20DC35AE241@amazon.com>
References: <ED25BE5E-D695-4763-B97A-78D6040E2341@amazon.com>
 <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
 <f3082b8c-1388-c92b-6175-e6d8b9d4cab4@xen.org>
 <6b5e28f427ccd89505a4448f2b9e5be992a08292.camel@suse.com>
In-Reply-To: <6b5e28f427ccd89505a4448f2b9e5be992a08292.camel@suse.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.70]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD47BD1DFF7A02479D72E4179EEC7939@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64

SGkhDQoNCklzIHRoZXJlIGFueSB1cGRhdGUgb24gdGhpcyBpc3N1ZT8gSG93IHNob3VsZCB3ZSBt
b3ZlIGZvcndhcmQ/DQoNClRoYW5rIHlvdSwNCg0KDQrvu79PbiAxMS8wOC8yMDIxLCAxMjowOSwg
IkRhcmlvIEZhZ2dpb2xpIiA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToNCg0KICAgIE9uIE1v
biwgMjAyMS0wOC0wOSBhdCAyMTozOCArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4g
T24gMDkvMDgvMjAyMSAxODozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4gPiANCiAgICA+
ID4gVGhpcyBpbXBsaWVzIHRoYXQgYSBwQ1BVIG1heSB0ZW1wb3JhcmlseSBiZSBhc3NpZ25lZCB0
byB0d28gdkNQVXMNCiAgICA+ID4gYW5kIHdlIA0KICAgID4gPiBleHBlY3QgdG8gYmUgZml4ZWQg
dXAgYWZ0ZXJ3YXJkcy4gSG93ZXZlciwgYSBkb21haW4gbWF5IGJlDQogICAgPiA+IGRlc3Ryb3ll
ZCANCiAgICA+ID4gYmVmb3JlIHRoaXMgaXMgaGFwcGVuaW5nLg0KICAgID4gPiANCiAgICA+ID4g
U28gaXQgbG9va3MgbGlrZSB0aGF0IHVuaXRfZGVhc3NpZ24oKSBpcyBub3QgYWJsZSB0byBjb3Bl
IHdpdGggdGhpcw0KICAgID4gPiBjYXNlLiBGcm9tIGEgYnJpZWYgbG9vaywgSSB0aGluayB3ZSBt
YXkgd2FudCB0byBjaGVjayBpZiB0aGUgcENQVQ0KICAgID4gPiBpcyBpbiANCiAgICA+ID4gdGhl
IHdhaXQgbGlzdC4gSWYgaXQgaXMsIHRoZW4gd2Ugc2hvdWxkIGJhaWwgb3V0Lg0KICAgID4gDQog
ICAgPiBBY3R1YWxseSwgSSB3YXMgd3JvbmcuIEl0IGxvb2tzIGxpa2UgbnVsbF91bml0X3JlbW92
ZSgpIGlzIGFscmVhZHkgDQogICAgPiBjaGVja2luZyB0aGlzIGNvbmRpdGlvbi4gQWxzbywgdGhl
IHZDUFUgc2hvdWxkIGJlIG9mZmxpbmUgKGFuZCB0aGUNCiAgICA+IHVuaXQgDQogICAgPiBhcyB3
ZWxsKSBiZWNhdXNlIHRoZXkgaGF2ZW4ndCBjb21lIG9ubGluZSB5ZXQ6DQogICAgPiANCiAgICBU
aGF0J3Mgd2hhdCBpcyBjdXJyZW50bHkgcHV6emxpbmcgbWUuDQoNCiAgICBJIG1lYW4sIHRoZSBj
cmFzaCBoYXBwZW5zIGluIHVuaXRfZGVhc3NpZ24oKSwgY2FsbGVkIGJ5DQogICAgbnVsbF91bml0
X3JlbW92ZSgpLCBjYWxsZWQgYnkgc2NoZWRfZGVzdHJveV92Y3B1KCkuDQoNCiAgICBBbmQgSSBh
Z3JlZSB0aGF0IHRoZSB1bml0IHNob3VsZCBiZSBvZmZsaW5lLCBidXQgbnVsbF91bml0X3JlbW92
ZSgpDQogICAgY2FsbHMgdW5pdF9kZWFzc2lnbigpIG9ubHkgaWYgdGhlIHVuaXQgKmlzKiBvbmxp
bmUsIHNvLi4uIFdoYXQncyBnb2luZw0KICAgIG9uPyA6LS8NCg0KICAgIFJlZ2FyZHMNCiAgICAt
LSANCiAgICBEYXJpbyBGYWdnaW9saSwgUGguRA0KICAgIGh0dHA6Ly9hYm91dC5tZS9kYXJpby5m
YWdnaW9saQ0KICAgIFZpcnR1YWxpemF0aW9uIFNvZnR3YXJlIEVuZ2luZWVyDQogICAgU1VTRSBM
YWJzLCBTVVNFIGh0dHBzOi8vd3d3LnN1c2UuY29tLw0KICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAgICA8PFRo
aXMgaGFwcGVucyBiZWNhdXNlIF9JXyBjaG9vc2UgaXQgdG8gaGFwcGVuIT4+IChSYWlzdGxpbiBN
YWplcmUpDQoNCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVz
ZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hs
YWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3
IDg3OQoKCg==


