Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5214035CB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 10:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181564.328724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNsWg-0001UP-LV; Wed, 08 Sep 2021 08:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181564.328724; Wed, 08 Sep 2021 08:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNsWg-0001SX-IK; Wed, 08 Sep 2021 08:01:46 +0000
Received: by outflank-mailman (input) for mailman id 181564;
 Wed, 08 Sep 2021 08:01:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6z62=N6=amazon.co.uk=prvs=8782002cc=ahmeddan@srs-us1.protection.inumbo.net>)
 id 1mNsWe-0001SR-DO
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 08:01:44 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 011f09b2-107b-11ec-b147-12813bfff9fa;
 Wed, 08 Sep 2021 08:01:43 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 08 Sep 2021 08:01:36 +0000
Received: from EX13D37EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 14C1CA1A39; Wed,  8 Sep 2021 08:01:33 +0000 (UTC)
Received: from EX13D24EUA001.ant.amazon.com (10.43.165.233) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Wed, 8 Sep 2021 08:01:32 +0000
Received: from EX13D24EUA001.ant.amazon.com ([10.43.165.233]) by
 EX13D24EUA001.ant.amazon.com ([10.43.165.233]) with mapi id 15.00.1497.023;
 Wed, 8 Sep 2021 08:01:32 +0000
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
X-Inumbo-ID: 011f09b2-107b-11ec-b147-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1631088104; x=1662624104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NNiwhOsw2/lA3gYN93p8XpwsNp5oh1ZqFV8csTQzejw=;
  b=mu1DWzIvAsz7313KTLrdbLv4lb6nRAS4ffnSYp8E6Zkp4IsRzaxeoyKP
   mLbtIIVlQrjKnPf6LHER497CvSoIYVm4DrP5l1XyILeHFN42RJsgtMQwk
   Y1ntYdr5qLeyUmkuqZfh4iIId6PbMiPXsqy1zJoMjEN1PYojPfi5C08iK
   4=;
X-IronPort-AV: E=Sophos;i="5.85,277,1624320000"; 
   d="scan'208";a="158343262"
From: "Ahmed, Daniele" <ahmeddan@amazon.co.uk>
To: Dario Faggioli <dfaggioli@suse.com>, "julien@xen.org" <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "Pohlack, Martin"
	<mpohlack@amazon.de>, "Grall, Julien" <jgrall@amazon.co.uk>, "Doebel, Bjoern"
	<doebel@amazon.de>
Subject: Re: NULL scheduler DoS
Thread-Topic: NULL scheduler DoS
Thread-Index: AQHXpIe8OXmLgpZp00yyIO6D9XnksA==
Date: Wed, 8 Sep 2021 08:01:32 +0000
Message-ID: <562980DD-ABAB-4082-A565-2E07F71292E5@amazon.com>
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
x-originating-ip: [10.43.166.178]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1E2687B92B3324CB802991D4E093699@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

SGksIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KSGVyZSBpcyB0aGUgZnVsbCBsb2cgZnJv
bSB0aGUgc2VyaWFsIGNvbnNvbGU6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9nOUVGdGszeQ0K
DQpUaGlzIHN0aWxsIGhhcHBlbnMgb24gdGhlIGN1cnJlbnQgdW5zdGFibGUgYXMgb2YgdG9kYXku
DQoNClRoYW5rIHlvdQ0KRGFuaWVsZQ0KDQrvu79PbiAxMS8wOC8yMDIxLCAxMjowOSwgIkRhcmlv
IEZhZ2dpb2xpIiA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToNCg0KICAgIE9uIE1vbiwgMjAy
MS0wOC0wOSBhdCAyMTozOCArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4gT24gMDkv
MDgvMjAyMSAxODozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4gPiANCiAgICA+ID4gVGhp
cyBpbXBsaWVzIHRoYXQgYSBwQ1BVIG1heSB0ZW1wb3JhcmlseSBiZSBhc3NpZ25lZCB0byB0d28g
dkNQVXMNCiAgICA+ID4gYW5kIHdlIA0KICAgID4gPiBleHBlY3QgdG8gYmUgZml4ZWQgdXAgYWZ0
ZXJ3YXJkcy4gSG93ZXZlciwgYSBkb21haW4gbWF5IGJlDQogICAgPiA+IGRlc3Ryb3llZCANCiAg
ICA+ID4gYmVmb3JlIHRoaXMgaXMgaGFwcGVuaW5nLg0KICAgID4gPiANCiAgICA+ID4gU28gaXQg
bG9va3MgbGlrZSB0aGF0IHVuaXRfZGVhc3NpZ24oKSBpcyBub3QgYWJsZSB0byBjb3BlIHdpdGgg
dGhpcw0KICAgID4gPiBjYXNlLiBGcm9tIGEgYnJpZWYgbG9vaywgSSB0aGluayB3ZSBtYXkgd2Fu
dCB0byBjaGVjayBpZiB0aGUgcENQVQ0KICAgID4gPiBpcyBpbiANCiAgICA+ID4gdGhlIHdhaXQg
bGlzdC4gSWYgaXQgaXMsIHRoZW4gd2Ugc2hvdWxkIGJhaWwgb3V0Lg0KICAgID4gDQogICAgPiBB
Y3R1YWxseSwgSSB3YXMgd3JvbmcuIEl0IGxvb2tzIGxpa2UgbnVsbF91bml0X3JlbW92ZSgpIGlz
IGFscmVhZHkgDQogICAgPiBjaGVja2luZyB0aGlzIGNvbmRpdGlvbi4gQWxzbywgdGhlIHZDUFUg
c2hvdWxkIGJlIG9mZmxpbmUgKGFuZCB0aGUNCiAgICA+IHVuaXQgDQogICAgPiBhcyB3ZWxsKSBi
ZWNhdXNlIHRoZXkgaGF2ZW4ndCBjb21lIG9ubGluZSB5ZXQ6DQogICAgPiANCiAgICBUaGF0J3Mg
d2hhdCBpcyBjdXJyZW50bHkgcHV6emxpbmcgbWUuDQoNCiAgICBJIG1lYW4sIHRoZSBjcmFzaCBo
YXBwZW5zIGluIHVuaXRfZGVhc3NpZ24oKSwgY2FsbGVkIGJ5DQogICAgbnVsbF91bml0X3JlbW92
ZSgpLCBjYWxsZWQgYnkgc2NoZWRfZGVzdHJveV92Y3B1KCkuDQoNCiAgICBBbmQgSSBhZ3JlZSB0
aGF0IHRoZSB1bml0IHNob3VsZCBiZSBvZmZsaW5lLCBidXQgbnVsbF91bml0X3JlbW92ZSgpDQog
ICAgY2FsbHMgdW5pdF9kZWFzc2lnbigpIG9ubHkgaWYgdGhlIHVuaXQgKmlzKiBvbmxpbmUsIHNv
Li4uIFdoYXQncyBnb2luZw0KICAgIG9uPyA6LS8NCg0KICAgIFJlZ2FyZHMNCiAgICAtLSANCiAg
ICBEYXJpbyBGYWdnaW9saSwgUGguRA0KICAgIGh0dHA6Ly9hYm91dC5tZS9kYXJpby5mYWdnaW9s
aQ0KICAgIFZpcnR1YWxpemF0aW9uIFNvZnR3YXJlIEVuZ2luZWVyDQogICAgU1VTRSBMYWJzLCBT
VVNFIGh0dHBzOi8vd3d3LnN1c2UuY29tLw0KICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAgICA8PFRoaXMgaGFw
cGVucyBiZWNhdXNlIF9JXyBjaG9vc2UgaXQgdG8gaGFwcGVuIT4+IChSYWlzdGxpbiBNYWplcmUp
DQoNCg==

