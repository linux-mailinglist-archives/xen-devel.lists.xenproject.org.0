Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47E98409
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 21:09:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VwP-0003HY-08; Wed, 21 Aug 2019 19:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0VwN-0003HJ-82
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 19:06:39 +0000
X-Inumbo-ID: ccf32e70-c446-11e9-adc9-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccf32e70-c446-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566414398; x=1597950398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=7pWRd1Ax7KLUYZafDdw8kRyqwTm62e1sfg7y1CJJXb0=;
 b=cxxqXd007VXsQBZgmDysRVLQ6cFOANpsV1p2G/7ghu0ZwxO8teCShcge
 ihFP8SQdpBxLez1jK8faP8nQNLUuseOddVSjLS6d3c9Oq59lrD1uoS4KQ
 S0fVIl7/8D/tTQ/Ly3VKdOiAL0GN4zL9tiO695mVR6FgYYbXnH0E87spW 0=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; 
 d="scan'208,217";a="822349163"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 19:06:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0EA7DA23CF; Wed, 21 Aug 2019 19:06:33 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:06:32 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:06:31 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 19:06:31 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH 06/14] livepatch: Add support for apply|revert action
 replacement hooks
Thread-Index: AQHVV/lCf/8zHPJfR06u5Vab7etLtqcF7XQAgAAJroA=
Date: Wed, 21 Aug 2019 19:06:31 +0000
Message-ID: <A902CEC6-0910-476F-9175-859B67D37959@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-7-wipawel@amazon.de>
 <b2f3dd25-f3ad-25f3-9015-caba9642f76f@oracle.com>
In-Reply-To: <b2f3dd25-f3ad-25f3-9015-caba9642f76f@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 06/14] livepatch: Add support for
 apply|revert action replacement hooks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============4001425597222027839=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4001425597222027839==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A902CEC60910476F9175859B67D37959amazoncom_"

--_000_A902CEC60910476F9175859B67D37959amazoncom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

DQpPbiAyMS4gQXVnIDIwMTksIGF0IDIwOjMxLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb208bWFpbHRvOmtvbnJhZC53aWxrQG9yYWNsZS5jb20+PiB3cm90ZToN
Cg0KT24gOC8yMS8xOSA0OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToNCkJ5IGRl
ZmF1bHQsIGluIHRoZSBxdWllc2Npbmcgem9uZSwgYSBob3RwYXRjaCBwYXlsb2FkIGlzIGFwcGxp
ZWQgd2l0aA0KYXBwbHlfcGF5bG9hZCgpIGFuZCByZXZlcnRlZCB3aXRoIHJldmVydF9wYXlsb2Fk
KCkgZnVuY3Rpb25zLiBCb3RoIG9mDQp0aGUgZnVuY3Rpb25zIHJlY2VpdmUgdGhlIHBheWxvYWQg
c3RydWN0IHBvaW50ZXIgYXMgYSBwYXJhbWV0ZXIuIFRoZQ0KZnVuY3Rpb25zIGFyZSBhbHNvIGEg
cGxhY2Ugd2hlcmUgc3RhbmRhcmQgJ2xvYWQnIGFuZCAndW5sb2FkJyBtb2R1bGUNCmhvb2tzIGFy
ZSBleGVjdXRlZC4NClRvIGluY3JlYXNlIGhvdHBhdGNoaW5nIHN5c3RlbSdzIGFnaWxpdHkgYW5k
IHByb3ZpZGUgbW9yZSBmbGV4aWFibGUNCmxvbmctdGVybSBob3RwYXRjaCBzb2x1dGlvbiwgYWxs
b3cgdG8gb3ZlcndyaXRlIHRoZSBkZWZhdWx0IGFwcGx5DQphbmQgcmV2ZXJ0IGFjdGlvbiBmdW5j
dGlvbnMgd2l0aCBob29rLWxpa2Ugc3VwcGxpZWQgYWx0ZXJuYXRpdmVzLg0KVGhlIGFsdGVybmF0
aXZlIGZ1bmN0aW9ucyBhcmUgb3B0aW9uYWwgYW5kIHRoZSBkZWZhdWx0IGZ1bmN0aW9ucyBhcmUN
CnVzZWQgYnkgZGVmYXVsdC4NClNpbmNlIHRoZSBhbHRlcm5hdGl2ZSBmdW5jdGlvbnMgaGF2ZSBk
aXJlY3QgYWNjZXNzIHRvIHRoZSBob3RwYXRjaA0KcGF5bG9hZCBzdHJ1Y3R1cmUsIHRoZXkgY2Fu
IGJldHRlciBjb250cm9sIGNvbnRleHQgb2YgdGhlICdsb2FkJyBhbmQNCid1bmxvYWQnIGhvb2tz
IGV4ZWN1dGlvbiBhcyB3ZWxsIGFzIGV4YWN0IGluc3RydWN0aW9ucyByZXBsYWNlbWVudA0Kd29y
a2Zsb3dzLiBUaGV5IGNhbiBiZSBhbHNvIGVhc2lseSBleHRlbmRlZCB0byBzdXBwb3J0IGV4dHJh
IGZlYXR1cmVzDQppbiB0aGUgZnV0dXJlLg0KVG8gc2ltcGxpZnkgdGhlIGFsdGVybmF0aXZlIGZ1
bmN0aW9uIGdlbmVyYXRpb24gbW92ZSBjb2RlIHJlc3BvbnNpYmxlDQpmb3IgcGF5bG9hZCBhbmQg
aG90cGF0Y2ggcmVnaW9uIHJlZ2lzdHJhdGlvbiBvdXRzaWRlIG9mIHRoZSBmdW5jdGlvbi4NClRo
YXQgd2F5IGl0IGlzIGd1YXJhbnRlZWQgdGhhdCB0aGUgcmVnaXN0cmF0aW9uIHN0ZXAgb2NjdXJz
IGV2ZW4gZm9yDQpuZXdseSBzdXBwbGllZCBmdW5jdGlvbnMuDQoNClRoaXMgbG9naWMgbG9va3Mg
bGVnaXQsIGJ1dCBJIHdhcyB3b25kZXJpbmcgaWYgeW91IHdvdWxkIGJlIHVwIGZvciBhIHdyaXRp
bmcgYSBzbWFsbCB0ZXN0LWNhc2UocykgbGl2ZXBhdGNoIHRoYXQgd291bGQgZXhlcmNpc2UgdGhl
c2UgcGFydHMganVzdCB0byBtYWtlIHN1cmUgbm90aGluZyBpbiB0aGUgZnV0dXJlIHdvdWxkIHNj
cmV3IGl0IHVwPw0KDQpZZXMsIEkgY291bGQgZG8gdGhhdC4gQnV0LCBJIHdvdWxkIGxpa2UgdG8g
ZGlzY3VzcyAoZ2V0IGd1aWRlbGluZXMgYWJvdXQpIHRoZSBleHBlY3RlZCB0ZXN0IGNvdmVyYWdl
Lg0KV2l0aCB0aGlzIHNvcnQgb2YgY2hhbmdlcywgdGhlcmUgaXMgYW4gdW5saW1pdGVkIHNldCBv
ZiB0ZXN0LWNhc2VzIHRvIGJlIGNyZWF0ZWQuIFNvLCBJIHdvdWxkIGxpa2UgdG8gZm9jdXMgb24g
YSBmZXcgbW9zdCBpbXBvcnRhbnQuDQpJIGFtIG1pc3Npbmcga25vd2xlZGdlIGhvdyB0aGVzZSB0
ZXN0IGNhc2VzIGFyZSBzdXBwb3NlZCB0byBiZSB1c2Vk4oCmIGhlbmNlIHRoZSBhc2suDQoNCkJl
c3QgUmVnYXJkcywNClBhd2VsIFdpZWN6b3JraWV3aWN6DQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQg
Q2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0
c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2Vu
IGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBC
ZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==

--_000_A902CEC60910476F9175859B67D37959amazoncom_
Content-Type: text/html; charset="utf-8"
Content-ID: <50A75A802BAEDC478F178BDE2F47113F@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+DQo8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+T24gMjEuIEF1ZyAyMDE5
LCBhdCAyMDozMSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrICZsdDs8YSBocmVmPSJtYWlsdG86a29u
cmFkLndpbGtAb3JhY2xlLmNvbSIgY2xhc3M9IiI+a29ucmFkLndpbGtAb3JhY2xlLmNvbTwvYT4m
Z3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5lIj4N
CjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZv
bnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFs
OyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXIt
c3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4
dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4
OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsg
ZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+T24NCiA4
LzIxLzE5IDQ6MTkgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOjwvc3Bhbj48YnIgc3R5
bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZv
bnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9y
bWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFs
aWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRl
LXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIgc3R5bGU9ImZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJw
eDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdl
aWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiBhdXRvOyB0ZXh0
LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdo
aXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogYXV0bzsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJr
aXQtdGV4dC1zaXplLWFkanVzdDogYXV0bzsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4
OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCkJ5IGRlZmF1bHQsIGluIHRoZSBx
dWllc2Npbmcgem9uZSwgYSBob3RwYXRjaCBwYXlsb2FkIGlzIGFwcGxpZWQgd2l0aDxiciBjbGFz
cz0iIj4NCmFwcGx5X3BheWxvYWQoKSBhbmQgcmV2ZXJ0ZWQgd2l0aCByZXZlcnRfcGF5bG9hZCgp
IGZ1bmN0aW9ucy4gQm90aCBvZjxiciBjbGFzcz0iIj4NCnRoZSBmdW5jdGlvbnMgcmVjZWl2ZSB0
aGUgcGF5bG9hZCBzdHJ1Y3QgcG9pbnRlciBhcyBhIHBhcmFtZXRlci4gVGhlPGJyIGNsYXNzPSIi
Pg0KZnVuY3Rpb25zIGFyZSBhbHNvIGEgcGxhY2Ugd2hlcmUgc3RhbmRhcmQgJ2xvYWQnIGFuZCAn
dW5sb2FkJyBtb2R1bGU8YnIgY2xhc3M9IiI+DQpob29rcyBhcmUgZXhlY3V0ZWQuPGJyIGNsYXNz
PSIiPg0KVG8gaW5jcmVhc2UgaG90cGF0Y2hpbmcgc3lzdGVtJ3MgYWdpbGl0eSBhbmQgcHJvdmlk
ZSBtb3JlIGZsZXhpYWJsZTxiciBjbGFzcz0iIj4NCmxvbmctdGVybSBob3RwYXRjaCBzb2x1dGlv
biwgYWxsb3cgdG8gb3ZlcndyaXRlIHRoZSBkZWZhdWx0IGFwcGx5PGJyIGNsYXNzPSIiPg0KYW5k
IHJldmVydCBhY3Rpb24gZnVuY3Rpb25zIHdpdGggaG9vay1saWtlIHN1cHBsaWVkIGFsdGVybmF0
aXZlcy48YnIgY2xhc3M9IiI+DQpUaGUgYWx0ZXJuYXRpdmUgZnVuY3Rpb25zIGFyZSBvcHRpb25h
bCBhbmQgdGhlIGRlZmF1bHQgZnVuY3Rpb25zIGFyZTxiciBjbGFzcz0iIj4NCnVzZWQgYnkgZGVm
YXVsdC48YnIgY2xhc3M9IiI+DQpTaW5jZSB0aGUgYWx0ZXJuYXRpdmUgZnVuY3Rpb25zIGhhdmUg
ZGlyZWN0IGFjY2VzcyB0byB0aGUgaG90cGF0Y2g8YnIgY2xhc3M9IiI+DQpwYXlsb2FkIHN0cnVj
dHVyZSwgdGhleSBjYW4gYmV0dGVyIGNvbnRyb2wgY29udGV4dCBvZiB0aGUgJ2xvYWQnIGFuZDxi
ciBjbGFzcz0iIj4NCid1bmxvYWQnIGhvb2tzIGV4ZWN1dGlvbiBhcyB3ZWxsIGFzIGV4YWN0IGlu
c3RydWN0aW9ucyByZXBsYWNlbWVudDxiciBjbGFzcz0iIj4NCndvcmtmbG93cy4gVGhleSBjYW4g
YmUgYWxzbyBlYXNpbHkgZXh0ZW5kZWQgdG8gc3VwcG9ydCBleHRyYSBmZWF0dXJlczxiciBjbGFz
cz0iIj4NCmluIHRoZSBmdXR1cmUuPGJyIGNsYXNzPSIiPg0KVG8gc2ltcGxpZnkgdGhlIGFsdGVy
bmF0aXZlIGZ1bmN0aW9uIGdlbmVyYXRpb24gbW92ZSBjb2RlIHJlc3BvbnNpYmxlPGJyIGNsYXNz
PSIiPg0KZm9yIHBheWxvYWQgYW5kIGhvdHBhdGNoIHJlZ2lvbiByZWdpc3RyYXRpb24gb3V0c2lk
ZSBvZiB0aGUgZnVuY3Rpb24uPGJyIGNsYXNzPSIiPg0KVGhhdCB3YXkgaXQgaXMgZ3VhcmFudGVl
ZCB0aGF0IHRoZSByZWdpc3RyYXRpb24gc3RlcCBvY2N1cnMgZXZlbiBmb3I8YnIgY2xhc3M9IiI+
DQpuZXdseSBzdXBwbGllZCBmdW5jdGlvbnMuPGJyIGNsYXNzPSIiPg0KPC9ibG9ja3F1b3RlPg0K
PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0
aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNh
cHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsg
dGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25l
OyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFu
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNh
OyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4
dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3
aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9r
ZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5
OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPlRoaXMNCiBsb2dpYyBsb29rcyBsZWdpdCwg
YnV0IEkgd2FzIHdvbmRlcmluZyBpZiB5b3Ugd291bGQgYmUgdXAgZm9yIGEgd3JpdGluZyBhIHNt
YWxsIHRlc3QtY2FzZShzKSBsaXZlcGF0Y2ggdGhhdCB3b3VsZCBleGVyY2lzZSB0aGVzZSBwYXJ0
cyBqdXN0IHRvIG1ha2Ugc3VyZSBub3RoaW5nIGluIHRoZSBmdXR1cmUgd291bGQgc2NyZXcgaXQg
dXA/PC9zcGFuPjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxi
ciBjbGFzcz0iIj4NCjwvZGl2Pg0KWWVzLCBJIGNvdWxkIGRvIHRoYXQuIEJ1dCwgSSB3b3VsZCBs
aWtlIHRvIGRpc2N1c3MgKGdldCBndWlkZWxpbmVzIGFib3V0KSB0aGUgZXhwZWN0ZWQgdGVzdCBj
b3ZlcmFnZS4NCjxkaXYgY2xhc3M9IiI+V2l0aCB0aGlzIHNvcnQgb2YgY2hhbmdlcywgdGhlcmUg
aXMgYW4gdW5saW1pdGVkIHNldCBvZiB0ZXN0LWNhc2VzIHRvIGJlIGNyZWF0ZWQuIFNvLCBJIHdv
dWxkIGxpa2UgdG8gZm9jdXMgb24gYSBmZXcgbW9zdCBpbXBvcnRhbnQuPC9kaXY+DQo8ZGl2IGNs
YXNzPSIiPkkgYW0gbWlzc2luZyBrbm93bGVkZ2UgaG93IHRoZXNlIHRlc3QgY2FzZXMgYXJlIHN1
cHBvc2VkIHRvIGJlIHVzZWTigKYgaGVuY2UgdGhlIGFzay48L2Rpdj4NCjxkaXYgY2xhc3M9IiI+
DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJ3b3Jk
LXdyYXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazog
YWZ0ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXYgc3R5bGU9ImNhcmV0LWNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5CZXN0IFJlZ2FyZHMsPGJyIGNsYXNz
PSIiPg0KUGF3ZWwgV2llY3pvcmtpZXdpY3o8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8YnI+PGJyPjxicj5BbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdl
cm1hbnkgR21iSAo8YnI+S3JhdXNlbnN0ci4gMzgKPGJyPjEwMTE3IEJlcmxpbgo8YnI+R2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCjxicj5FaW5n
ZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIK
PGJyPlNpdHo6IEJlcmxpbgo8YnI+VXN0LUlEOiBERSAyODkgMjM3IDg3OQo8YnI+PGJyPjxicj4K
PC9ib2R5Pg0KPC9odG1sPg0K

--_000_A902CEC60910476F9175859B67D37959amazoncom_--



--===============4001425597222027839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4001425597222027839==--


