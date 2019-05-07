Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C41651A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0UJ-0007xC-QE; Tue, 07 May 2019 13:50:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hO0UI-0007x7-Cr
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:50:30 +0000
X-Inumbo-ID: 12b01bd0-70cf-11e9-843c-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12b01bd0-70cf-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557237028; x=1588773028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bcwLHA+Xpa3C7L0XwxFhH6zd/0/wMvubBAlJkp9uhlw=;
 b=ukLtpw1wC812KR0kLzu1JMQnE+dUSoxMkxslzMZRCx5kntQTsW9JqRO6
 DnqCfUVzoU+Yw3vhhlFOdhRf3JbnFaOGI+CfZZxIoZmd9R5g+GWGyMFEn
 BneqyGK9rOM8IUFhKxp/BQaICAu7kUwA4CqiiHwfkQ+FpO9d4pwsk1yxG s=;
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="401155246"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 13:50:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x47DoO8b003259
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 13:50:26 GMT
Received: from EX13D18EUA002.ant.amazon.com (10.43.165.184) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 13:50:25 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D18EUA002.ant.amazon.com (10.43.165.184) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 13:50:24 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Tue, 7 May 2019 13:50:24 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Wei Liu <wei.liu2@citrix.com>
Thread-Topic: [PATCH] libxl: make vkbd tunable for HVM guests
Thread-Index: AQHVBK/jlk7EemBa/E+46wzq4UoHSqZfpQ6AgAAqu4A=
Date: Tue, 7 May 2019 13:50:23 +0000
Message-ID: <166AAD28-5822-4938-A82C-C1E247D1C9DA@amazon.com>
References: <20190507083548.27883-1-elnikety@amazon.com>
 <20190507131727.GC2798@zion.uk.xensource.com>
In-Reply-To: <20190507131727.GC2798@zion.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.100]
Content-ID: <3B4F4839D6FFBA4C8AB2005EF328A2AD@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] libxl: make vkbd tunable for HVM guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Shah,
 Amit" <aams@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LjA1LjE5LCAxNToxNywgIldlaSBMaXUiIDx3ZWkubGl1MkBjaXRyaXguY29t
PiB3cm90ZToNCg0KICAgIE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDA4OjM1OjQ4QU0gKzAwMDAs
IEVzbGFtIEVsbmlrZXR5IHdyb3RlOg0KICAgID4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdl
dHMgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4NCiAgICA+
IFRoaXMgY29uc3VtZXMgaG9zdCByZXNvdXJjZXMgdW5uZWNlc3NhcmlseSBmb3IgZ3Vlc3RzIHRo
YXQgaGF2ZSBubyB1c2UgZm9yDQogICAgPiB2a2JkLiBNYWtlIHRoaXMgYmVoYXZpb3VyIHR1bmFi
bGUgdG8gYWxsb3cgYW4gYWRtaW5pc3RyYXRvciB0byBjaG9vc2UuIFRoZQ0KICAgID4gY29tbWl0
IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhWTSBndWVzdHMgc3RpbGwgZ2V0IHZr
ZGIgdW5sZXNzDQogICAgPiBzcGVjaWZpZWQgb3RoZXJ3aXNlLg0KICAgID4gDQogICAgPiBTaWdu
ZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4NCiAgICANCiAg
ICBXaG8gLyB3aGF0IGlzIHRvIHNldCB0aGlzIGZpZWxkPw0KICAgIA0KICAgIEl0IGFwcGVhcnMg
dGhpcyBwYXRjaCBvbmx5IGNvbnRhaW5zIG9uZSBjaGFuZ2UgdG8geGwgdG8gcHJpbnQgb3V0IGl0
cw0KICAgIHZhbHVlLg0KDQpNaXNzZWQgYSBodW5rIHdoZW4gcHJlcGFyaW5nIHRoZSBwYXRjaC4g
U2VuZGluZyB2MiBub3cgLi4NCiAgICANCiAgICA+IC0tLQ0KICAgID4gIHRvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jICB8IDkgKysrKysrLS0tDQogICAgPiAgdG9vbHMvbGlieGwvbGlieGxfdHlw
ZXMuaWRsIHwgMSArDQogICAgPiAgdG9vbHMveGwveGxfc3hwLmMgICAgICAgICAgIHwgMiArKw0K
ICAgID4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
ICAgID4gDQogICAgPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYw0KICAgID4gaW5kZXggODlmZTgwZmM5Yy4uYjA5MjQ0
MDU4ZiAxMDA2NDQNCiAgICA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jDQogICAg
PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYw0KICAgID4gQEAgLTMxMCw2ICszMTAs
NyBAQCBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpn
YywNCiAgICA+ICAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2
bS52cHRfYWxpZ24sICAgICAgICAgIHRydWUpOw0KICAgID4gICAgICAgICAgbGlieGxfZGVmYm9v
bF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLmFsdHAybSwgICAgICAgICAgICAgZmFsc2UpOw0K
ICAgID4gICAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnVz
YiwgICAgICAgICAgICAgICAgZmFsc2UpOw0KICAgID4gKyAgICAgICAgbGlieGxfZGVmYm9vbF9z
ZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnZrYl9kZXZpY2UsICAgICAgICAgdHJ1ZSk7DQogICAg
PiAgICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0ueGVuX3Bs
YXRmb3JtX3BjaSwgICB0cnVlKTsNCiAgICA+ICANCiAgICA+ICAgICAgICAgIGxpYnhsX2RlZmJv
b2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS5zcGljZS5lbmFibGUsIGZhbHNlKTsNCiAgICA+
IEBAIC0xNDE2LDkgKzE0MTcsMTEgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2xhdW5jaF9kbShs
aWJ4bF9fZWdjICplZ2MsIGxpYnhsX19tdWx0aWRldiAqbXVsdGlkZXYsDQogICAgPiAgICAgICAg
ICBsaWJ4bF9fZGV2aWNlX2NvbnNvbGVfYWRkKGdjLCBkb21pZCwgJmNvbnNvbGUsIHN0YXRlLCAm
ZGV2aWNlKTsNCiAgICA+ICAgICAgICAgIGxpYnhsX19kZXZpY2VfY29uc29sZV9kaXNwb3NlKCZj
b25zb2xlKTsNCiAgICA+ICANCiAgICA+IC0gICAgICAgIGxpYnhsX2RldmljZV92a2JfaW5pdCgm
dmtiKTsNCiAgICA+IC0gICAgICAgIGxpYnhsX19kZXZpY2VfYWRkKGdjLCBkb21pZCwgJmxpYnhs
X192a2JfZGV2dHlwZSwgJnZrYik7DQogICAgPiAtICAgICAgICBsaWJ4bF9kZXZpY2VfdmtiX2Rp
c3Bvc2UoJnZrYik7DQogICAgPiArICAgICAgICBpZiAoIGxpYnhsX2RlZmJvb2xfdmFsKGRfY29u
ZmlnLT5iX2luZm8udS5odm0udmtiX2RldmljZSkgKSB7DQogICAgDQogICAgTm8gc3BhY2UgaW5z
aWRlIGlmKCkgcGxlYXNlLg0KICAgIA0KWXVwIC0tIFdpbGwgZml4IGluIHYyLg0KDQogICAgV2Vp
Lg0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
