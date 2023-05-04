Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E046F6A63
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 13:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529697.824382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puXTb-0001R8-LK; Thu, 04 May 2023 11:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529697.824382; Thu, 04 May 2023 11:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puXTb-0001On-Ih; Thu, 04 May 2023 11:50:23 +0000
Received: by outflank-mailman (input) for mailman id 529697;
 Thu, 04 May 2023 11:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0QJ=AZ=amazon.co.uk=prvs=4812655cd=hakor@srs-se1.protection.inumbo.net>)
 id 1puXPA-0000SM-H5
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 11:45:48 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c92210-ea71-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 13:45:44 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 11:45:41 +0000
Received: from EX19D002EUA001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com (Postfix)
 with ESMTPS id CB41564DCA; Thu,  4 May 2023 11:45:39 +0000 (UTC)
Received: from EX19D037EUB003.ant.amazon.com (10.252.61.119) by
 EX19D002EUA001.ant.amazon.com (10.252.50.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 May 2023 11:45:39 +0000
Received: from EX19D017EUB002.ant.amazon.com (10.252.51.51) by
 EX19D037EUB003.ant.amazon.com (10.252.61.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 May 2023 11:45:38 +0000
Received: from EX19D017EUB002.ant.amazon.com ([fe80::5ea2:5e50:d1b:734c]) by
 EX19D017EUB002.ant.amazon.com ([fe80::5ea2:5e50:d1b:734c%3]) with mapi id
 15.02.1118.026; Thu, 4 May 2023 11:45:38 +0000
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
X-Inumbo-ID: 33c92210-ea71-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1683200745; x=1714736745;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=J0akEHc9aLCPKI1M4DlhScOC9UUiHnTvk5Sz2yRXswQ=;
  b=ginojQnXZR7cTsaj/KbEX48jTf4KZyoRRlIyhaIhJ6gP/IapAMO/un2P
   GhtZZHCEIzjFrDdkMEIOciC2QZ5s7xPnpGDGRSSsNUw6dZ01HiFyBTQ4/
   +gh6imdtkIwXfESNw2OlAvCzeLrR+SxU+bZ783t721XvlZBSFBkgCxNO0
   0=;
X-IronPort-AV: E=Sophos;i="5.99,249,1677542400"; 
   d="scan'208";a="321455840"
From: "Hakobyan, Ruben" <hakor@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.co.uk>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] x86/msi: dynamically map pages for MSI-X tables
Thread-Topic: [PATCH] x86/msi: dynamically map pages for MSI-X tables
Thread-Index: AQHZfn3ya9GP9+Vv7EWd6l/G5jjEQQ==
Date: Thu, 4 May 2023 11:45:38 +0000
Message-ID: <04EE5E8F-19DF-49B2-A63F-AC640D4BF9AE@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.106.82.18]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1E7D2ED24D5354F96DF0B6F94376B92@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gMDIvMDUvMjAyMywgMTE6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
TWF5IDAyLCAyMDIzIGF0IDEyOjE4OjA2UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
IE9uIDAyLjA1LjIwMjMgMTI6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4gPiBPbiBX
ZWQsIEFwciAyNiwgMjAyMyBhdCAwMjo1NToyMFBNICswMDAwLCBSdWJlbiBIYWtvYnlhbiB3cm90
ZToNCj4gPiA+PiBYZW4gcmVzZXJ2ZXMgYSBjb25zdGFudCBudW1iZXIgb2YgcGFnZXMgdGhhdCBj
YW4gYmUgdXNlZCBmb3IgbWFwcGluZw0KPiA+ID4+IE1TSS1YIHRhYmxlcy4gVGhpcyBsaW1pdCBp
cyBkZWZpbmVkIGJ5IEZJWF9NU0lYX01BWF9QQUdFUyBpbiBmaXhtYXAuaC4NCj4gPiA+Pg0KPiA+
ID4+IFJlc2VydmluZyBhIGZpeGVkIG51bWJlciBvZiBwYWdlcyBjb3VsZCByZXN1bHQgaW4gYW4g
LUVOT01FTSBpZiBhDQo+ID4gPj4gZGV2aWNlIHJlcXVlc3RzIGEgbmV3IHBhZ2Ugd2hlbiB0aGUg
Zml4bWFwIGxpbWl0IGlzIGV4aGF1c3RlZCBhbmQgd2lsbA0KPiA+ID4+IG5lY2Vzc2l0YXRlIG1h
bnVhbGx5IGFkanVzdGluZyB0aGUgbGltaXQgYmVmb3JlIGNvbXBpbGF0aW9uLg0KPiA+ID4+DQo+
ID4gPj4gVG8gYXZvaWQgdGhlIGlzc3VlcyB3aXRoIHRoZSBjdXJyZW50IGZpeG1hcCBpbXBsZW1l
bnRhdGlvbiwgd2UgbW9kaWZ5DQo+ID4gPj4gdGhlIE1TSS1YIHBhZ2UgbWFwcGluZyBsb2dpYyB0
byBpbnN0ZWFkIGR5bmFtaWNhbGx5IG1hcCBuZXcgcGFnZXMgd2hlbg0KPiA+ID4+IHRoZXkgYXJl
IG5lZWRlZCBieSBtYWtpbmcgdXNlIG9mIGlvcmVtYXAoKS4NCj4gPiA+DQo+ID4gPiBJIHdvbmRl
ciBpZiBBcm0gcGxhbnMgdG8gcmV1c2UgdGhpcyBjb2RlLCBhbmQgd2hldGhlciB0aGVuIGFybTMy
IHdvdWxkDQo+ID4gPiBiZXR0ZXIga2VlcCB0aGUgZml4bWFwIGltcGxlbWVudGF0aW9uIHRvIGF2
b2lkIGV4aGF1c3RpbmcgdmlydHVhbA0KPiA+ID4gYWRkcmVzcyBzcGFjZSBpbiB0aGF0IGNhc2Uu
DQo+ID4NCj4gPiBJIHRoaW5rIHRoaXMgd291bGQgdGhlbiBuZWVkIHRvIGJlIHNvbWV0aGluZyB0
aGF0IDMyLWJpdCBhcmNoaXRlY3R1cmVzDQo+ID4gZG8gc3BlY2lhbGx5LiBSaWdodCBub3cgYWl1
aSBQQ0kgKGFuZCBoZW5jZSBNU0ktWCkgd29yayBvbiBBcm0gdGFyZ2V0cw0KPiA+IG9ubHkgQXJt
NjQuDQo+ID4NCj4gPiA+IFRoaXMgYWxzbyBoYXZlIHRoZSBzaWRlIGVmZmVjdCBvZiBpb3JlbWFw
KCkgbm93IHBvc3NpYmx5IGFsbG9jYXRpbmcgYQ0KPiA+ID4gcGFnZSBpbiBvcmRlciB0byBmaWxs
IHRoZSBwYWdlIHRhYmxlIGZvciB0aGUgbmV3bHkgYWxsb2NhdGVkIFZBLg0KPiA+DQo+ID4gSW5k
ZWVkLCBidXQgSSB0aGluayB0aGUgKHZhZ3VlKSBwbGFuIHRvIHN3aXRjaCB0byBpb3JlbWFwKCkg
aGFzIGJlZW4NCj4gPiBhcm91bmQgZm9yIGEgcHJldHR5IGxvbmcgdGltZSAocGVyaGFwcyBmb3Jl
dmVyIHNpbmNlIDMyLWJpdCBzdXBwb3J0DQo+ID4gd2FzIHB1cmdlZCkuDQo+DQo+DQo+IFl1cCwg
SSdtIG5vdCBzYXlpbmcgdGhlIGFib3ZlIHNob3VsZCBibG9jayB0aGUgcGF0Y2gsIGJ1dCBtaWdo
dCBiZQ0KPiB3b3J0aCBtZW50aW9uaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4NCj4NCj4g
Um9nZXIuDQoNClN1cmUsIEkgd2lsbCBhZGQgYSBub3RlIGluIHRoZSBjb21taXQgbWVzc2FnZSBy
ZWdhcmRpbmcgdGhlIHBvc3NpYmxlIHVzZQ0Kb2YgdGhpcyBwYXRjaCBmb3IgMzItYml0IGFyY2hp
dGVjdHVyZXMuDQoNClJlZ2FyZGluZyBvdGhlciBjb21tZW50cyB5b3UgbWFkZSBvbiB0aGUgcGF0
Y2gsIEkgaGF2ZSBub3RlZCB0aGVtIGFsbA0KYW5kIGFncmVlIHdpdGggeW91ciBzdWdnZXN0aW9u
cy4gSSB3aWxsIHNlbmQgb3V0IGEgbmV3IHZlcnNpb24uDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5n
IHRoZSBwYXRjaCENCg0KUnViZW4uDQoNCg==

