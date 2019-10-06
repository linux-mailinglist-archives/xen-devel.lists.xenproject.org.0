Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E1CD945
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2019 22:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHDYY-00063D-Qe; Sun, 06 Oct 2019 20:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jSo8=X7=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iHDYX-000638-N2
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2019 20:55:05 +0000
X-Inumbo-ID: 901872f5-e87b-11e9-9799-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.139]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 901872f5-e87b-11e9-9799-12813bfff9fa;
 Sun, 06 Oct 2019 20:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEpsVSSB6pKzLhYximZ0J7tRa4isziL3y2TLLVNwUxV4pAUnl1OFDja2NB7+G+/GTcdG15mq+p/+yu+wWnX3DXhrIN5U9+Nk7gYP3oiliS0W79fV1PvpuT9YkRn8OqXKbgr9BLjlO6en0RjA817xxKJGRxy8KdSeCi9/hVgkNSvVdaRWJ35805sLUiP/Y9k2d8g7TntS/Ab7xh6iOC+CL2yMEfEisdLdwoqefJjfuPTdYTBhLWKmgTi5KC+eDmn9av/HeEGl0wZIsFZWrsdkukyWSFasf62oN/klWsw9b7Na3IJkXqEh/Op49sLlAHKN3km8lELMY27faCwFsrULLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVjwL3V94WIaefkoXJALg7THycjkKaoRmQKDHFQpaW0=;
 b=Oc8Ogi8JywXpA5Q/dTXQMVjHmubpx+8sWdpKq7Wdw38iPQwDfythL5ntQ9VuA35QHIYxboP0FDbo9IHx/FpMvtQLDA3RXti/Ig3XHCOKDWDvxVvVdnajiXk/bhGavZoKVX3AvElnPTJVL8/Bfd15uMnao4nAwBUv5x15jSGKO/fKfq+/kqhjjRu6x7scrtPlre5uwHSXURUqO7rYGXzixAVyx4d/DQD299E+0uzirV8vRkMOknx/Euh074f9HpffUwgtETZaPTRZibY23InQlPnrecqIvtzoCF/Dppz22dR9tT8gD1ssL5/8VzqIgiwxbWvSsxJY2DpRKz/ZajxUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVjwL3V94WIaefkoXJALg7THycjkKaoRmQKDHFQpaW0=;
 b=j31vGn92kfMQP8mGkzAPEry34DkAgr3g/N1wb5gLaiwFMZEOIp3vzgJSoxCHhUwet3pgMG666VgP9rfTnWNLv10U6z/6YlN33KceSl7vbojoNN3K1n5A4VFULQvxFekRR0HpiBBnl6AGR+HJJdBcb4khl6xbVjyzkF02Gbnk1dc=
Received: from DB7PR06MB4711.eurprd06.prod.outlook.com (20.177.123.92) by
 DB7PR06MB4540.eurprd06.prod.outlook.com (20.178.42.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Sun, 6 Oct 2019 20:55:00 +0000
Received: from DB7PR06MB4711.eurprd06.prod.outlook.com
 ([fe80::5a8:924:85d2:4009]) by DB7PR06MB4711.eurprd06.prod.outlook.com
 ([fe80::5a8:924:85d2:4009%6]) with mapi id 15.20.2327.023; Sun, 6 Oct 2019
 20:55:00 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
Thread-Index: AQHVaLmneE0cD0Ow4Em9Ga7dczqbiqdOPygA
Date: Sun, 6 Oct 2019 20:54:59 +0000
Message-ID: <alpine.LFD.2.21.1910062127110.2837@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au> <1566956155.3344.0@crc.id.au>
 <23929.6485.711561.46507@mariner.uk.xensource.com>
In-Reply-To: <23929.6485.711561.46507@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:921a:2100:1097:224c:243b:f186]
x-clientproxiedby: LO2P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::22) To DB7PR06MB4711.eurprd06.prod.outlook.com
 (2603:10a6:10:55::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53b80e08-8767-4cc5-601a-08d74a9f7319
x-ms-traffictypediagnostic: DB7PR06MB4540:
x-microsoft-antispam-prvs: <DB7PR06MB45406E473D9D34B7D65A646887980@DB7PR06MB4540.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0182DBBB05
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(52314003)(51914003)(52544003)(76114002)(189003)(199004)(58126008)(6512007)(9686003)(6916009)(71190400001)(71200400001)(54906003)(256004)(2906002)(86362001)(6486002)(478600001)(14444005)(6246003)(81156014)(81166006)(8936002)(8676002)(229853002)(66446008)(66556008)(66946007)(66476007)(64756008)(786003)(316002)(76176011)(6506007)(186003)(11346002)(446003)(5660300002)(46003)(53546011)(36756003)(52116002)(102836004)(386003)(6436002)(99286004)(476003)(15650500001)(25786009)(4326008)(6116002)(7736002)(305945005)(14454004)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR06MB4540;
 H:DB7PR06MB4711.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ugPID6MKQhZ7MfykUagWMnECQzISw8wuLnig/p24MbK6eE9/W3D/xya4bDCgVafcMlkka4on22MPcWCw9XAA3r15cfVFjSj/SDeqi6F0d2IeI2qGTMlfKfkrr6lrwY7W3Kr0/pGoWuLafNEiga2EyfU9Jx2Iltmis02Y9oWKs6IEfijqd09DTuT4FGCxZogWcUw5JvxNKioj7VvmQjpDbQYF9w1dyLJy6grT/X5UZwRwfDR1v5pIBi06x5Z6MeQUgXQLOyuej7AxFw+iTLUwIoPdtM4e/8OnAQDT5ggbGfr8ZN55S2yBed9i7MvgTSuhZ+hJG9Cc4IDt/Kjm3fiJBxqMAXHsKVUf7HBUfxREOMa8RK4vgcOaYQLuhC6uPvJcMfMwIQ2fGIvFqI0OdsQ4zzJw7XptZaX+hOh5LDV2Wp0=
x-ms-exchange-transport-forked: True
Content-ID: <2EEF6B6113CB93428C0C4546509EC5A5@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b80e08-8767-4cc5-601a-08d74a9f7319
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2019 20:54:59.9596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs2d0gUYIDQJyGq6a13jadj0p0srmJAoOivLtp2k7qWNrC0p7qwW83HLt5gsmgtU5dEkV+bu4m2GCYJcvOoPHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4540
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBTZXAgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cgo+IFN0ZXZlbiBIYWlnaCB3
cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSByZWFkIGdydWJlbnYgYW5kIHNldCBkZWZh
dWx0IGZyb20gc2F2ZWRfZW50cnkgb3IgbmV4dF9lbnRyeSIpOgo+PiBKdXN0IHdhbnRlZCB0byBn
aXZlIHRoaXMgYSBxdWljayBmb2xsb3d1cC4uLiBEaWQgdGhpcyBlbmQgdXAKPj4gcHJvZ3Jlc3Np
bmc/Cj4KPiBIaS4gIEknbSBhIHRvb2xzIG1haW50YWluZXIgYW5kIHByb2JhYmx5IHlvdXIgYmVz
dCBiZXQgZm9yIGEgcmV2aWV3Cj4gZXRjIG9mIHRoaXMgcGF0Y2guICBJZiwgbmV4dCB0aW1lLCB5
b3UgdXNlIGFkZF9tYWludGFpbmVycy5wbCBvcgo+IHNvbWV0aGluZywgeW91J2xsIGVuZCB1cCBD
Q2luZyB0aGUgbWFpbnRhaW5lciBhbmQgeW91ciBtYWlsIHdvbid0IGdldAo+IGRyb3BwZWQuICBB
bnl3YXksIHRoYW5rcyBmb3IgY2hhc2luZyBpdCB1cCB0aHJvdWdoIGEgYmFjayBjaGFubmVsIDot
KS4KPgo+IE1pY2hhZWwgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+Ogo+PiBGcm9tIDUx
YTlkY2U5ZGUzZWExNTkwMTE5MjhlMmRiODU0MWYzYzdlODM4M2EgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4+IEZyb206IE1pY2hhZWwgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+Cj4+
IERhdGU6IFRodSwgMTUgQXVnIDIwMTkgMTk6NTU6MzAgKzAxMDAKPj4gU3ViamVjdDogW1BBVENI
XSByZWFkIGdydWJlbnYgYW5kIHNldCBkZWZhdWx0IGZyb20gc2F2ZWRfZW50cnkgb3IgbmV4dF9l
bnRyeQo+Pgo+PiBUaGlzIHBhdGNoIGxvb2tzIGZvciBhIGdydWJlbnYgZmlsZSBpbiB0aGUgc2Ft
ZSBkaXJlY3RvcnkgYXMgdGhlCj4+IGdydWIuY2ZnIGZpbGUgYW5kIGluY2x1ZGVzIGl0IGF0IGZy
b250IG9mIHRoZSBncnViLmNmZyBmaWxlIHdoZW4gcGFzc2VkCj4+IHRvIHBhcnNlKCkKPgo+IFRo
YW5rcyBmb3IgdGhlIGNvbnRyaWJ1dGlvbi4gIEkgcmV2aWV3ZWQgdGhlIHBhdGNoIGFuZCBJIGhh
dmUgc29tZQo+IGNvbW1lbnRzLgo+Cj4gSSB0aGluayB0aGlzIHBhdGNoIHdvdWxkIGJlIGxlc3Mg
Y29uZnVzaW5nIGlmIGl0IHdlcmUgdHdvIHBhdGNoZXMuCj4gT25lIHdoaWNoIGRvZXMgdGhlIHNh
dmVkL25leHQgZW50cnksIGFuZCBvbmUgd2hpY2ggcmVhZHMgZ3J1YmVudi4gIERvCj4geW91IHRo
aW5rIHRoYXQgd291bGQgbWFrZSBzZW5zZSA/ICBJZiBzbyBJIHdvdWxkIGFwcHJlY2lhdGUgaXQg
aWYgeW91Cj4gd291bGQgc3BsaXQgaXQgdXAgKGFuZCB3cml0ZSBhIG5pY2UgZXhwbGFuYXRvcnkg
Y29tbWl0IG1lc3NhZ2UgYWJvdXQKPiB0aGUgc2F2ZWRfZW50cnkgc3R1ZmYpLgoKWWVzLCBpdCBt
YWtlcyBzZW5zZSB0byBzcGxpdCBpdCB1cCwgcGVyaGFwcyB3aXRoIGEgdGhpcmQgcGF0Y2ggZm9y
IGEgCmZvcm1hdCBjaGFuZ2Ugb2Ygd2hhdCBpcyBwYXNzZWQgZnJvbSBweWdydWIgdG8gdGhlIGJh
Y2tlbWRzLgoKPj4gQXMgdGhlIGdydWJlbnYgZmlsZSBjb25zaXN0cyBvZiB2YXJpYWJsZT12YWx1
ZSBsaW5lcyBwYWRkZWQgYnkgaGFzaGVzIHRoZXNlCj4+IGFyZSB0cmVhdGVkIGFzIGNvbW1hbmRz
IGluIHBhcnNlKCkgd2hlcmUgaXQgdXNlcyB0aGUgdmFsdWUgb2Ygc2F2ZWRfZW50cnkKPj4gb3Ig
bmV4dF9lbnRyeSAoaWYgc2V0KSB0byBzZXQgdGhlIGRlZmF1bHQgZW50cnkgaWYgYSB0aXRsZSBt
YXRjaGVzIG9yIGlzCj4+IGEgbnVtYmVyLgo+Cj4gSSBsaWtlIHJldXNpbmcgdGhlIHBhcnNlci4K
Pgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcHlncnViL3NyYy9weWdydWIgYi90b29scy9weWdydWIv
c3JjL3B5Z3J1Ygo+PiBpbmRleCBjZTdhYjBlYjhjLi4yNjc3ODg3OTViIDEwMDc1NQo+PiAtLS0g
YS90b29scy9weWdydWIvc3JjL3B5Z3J1Ygo+PiArKysgYi90b29scy9weWdydWIvc3JjL3B5Z3J1
Ygo+PiBAQCAtNDU0LDggKzQ1NCwxOSBAQCBjbGFzcyBHcnViOgo+PiAgICAgICAgICBpZiBzZWxm
Ll9fZGljdF9fLmdldCgnY2YnLCBOb25lKSBpcyBOb25lOgo+PiAgICAgICAgICAgICAgcmFpc2Ug
UnVudGltZUVycm9yKCJjb3VsZG4ndCBmaW5kIGJvb3Rsb2FkZXIgY29uZmlnIGZpbGUgaW4gdGhl
IGltYWdlIHByb3ZpZGVkLiIpCj4+ICAgICAgICAgIGYgPSBmcy5vcGVuX2ZpbGUoc2VsZi5jZi5m
aWxlbmFtZSkKPj4gKyAgICAgICAgZmVudiA9IHNlbGYuY2YuZmlsZW5hbWUucmVwbGFjZSgiZ3J1
Yi5jZmciLCJncnViZW52IikKPgo+IEkgZmluZCB0aGlzIGZpbGVuYW1lIGhhY2tlcnkgcmF0aGVy
IHVucHJpbmNpcGxlZC4gIEknbSBub3QgZW50aXJlbHkKPiBzdXJlIEkgY2FuIHNlZSBhIGJldHRl
ciB3YXksIGdpdmVuIHRoZSB3YXkgY2ZnX2xpc3QgaXMgY29uc3RydWN0ZWQuCj4gQ2FuIHlvdSB0
aGluayBvZiBhIGxlc3MgaGFja3kgYXBwcm9hY2ggPwo+Cj4gV2hhdCB3b3VsZCBoYXBwZW4gaW4g
ZnV0dXJlIGlmIHdlIHByb3ZpZGVkIGEgd2F5IHRvIGNvbnRyb2wgdGhlCj4gZ3J1Yi5jZmcgcmVh
ZCBieSBweWdydWIgYW5kIGEgdXNlciBjb25maWd1cmVkIGl0IHRvIChzYXkpCj4gYGdydWIuY2Zn
Lm9sZCcgPyAgV291bGQgd2UgcmVhbGx5IHdhbnQgaXQgdG8gcmVhZCBgZ3J1YmVudi5vbGQnID8K
PgoKT25lIG9wdGlvbiB3b3VsZCBiZSB0byBkbyBhIGZyZXNoIHNlYXJjaCBmb3IgZ3J1YmVudiBp
biB0aGUgc2FtZSBwbGFjZXMKd2UgbG9va2VkIGZvciBncnViLmNmZy4KQWx0ZXJuYXRpdmVseSwg
aXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGRvIGEgbW9yZSBwcmVjaXNlIGVkaXQgdXNpbmcKZi5y
cGFydGl0aW9uKCIvIikuCgo+PiArICAgICAgICBpZiBmZW52ICE9IHNlbGYuY2YuZmlsZW5hbWUg
YW5kIGZzLmZpbGVfZXhpc3RzKGZlbnYpOgo+PiArICAgICAgICAgICAgIyBpZiBncnViZW52IGZp
bGUgZXhpc3RzIG5leHQgdG8gZ3J1Yi5jZmcgcHJlcGVuZCBpdAo+PiArICAgICAgICAgICAgZmVu
dmYgPSBmcy5vcGVuX2ZpbGUoZmVudikKPj4gKyAgICAgICAgICAgIGlmIHN5cy52ZXJzaW9uX2lu
Zm9bMF0gPCAzOgo+PiArICAgICAgICAgICAgICAgIGZzZXAgPSAiXG4iCj4+ICsgICAgICAgICAg
ICBlbHNlOgo+PiArICAgICAgICAgICAgICAgIGZzZXAgPSBiIlxuIgo+PiArICAgICAgICAgICAg
YnVmID0gZnNlcC5qb2luKChmZW52Zi5yZWFkKEZTX1JFQURfTUFYKSxmLnJlYWQoRlNfUkVBRF9N
QVgpKSkKPj4gKyAgICAgICAgICAgIGRlbCBmZW52Zgo+PiAgICAgICAgICAjIGxpbWl0IHJlYWQg
c2l6ZSB0byBhdm9pZCBwYXRob2xvZ2ljYWwgY2FzZXMKPj4gLSAgICAgICAgYnVmID0gZi5yZWFk
KEZTX1JFQURfTUFYKQo+PiArICAgICAgICBlbHNlOgo+PiArICAgICAgICAgICAgYnVmID0gZi5y
ZWFkKEZTX1JFQURfTUFYKQo+PiAgICAgICAgICBkZWwgZgo+PiAgICAgICAgICBpZiBzeXMudmVy
c2lvbl9pbmZvWzBdIDwgMzoKPj4gICAgICAgICAgICAgIHNlbGYuY2YucGFyc2UoYnVmKQo+Cj4g
Q2FuIHdlIGluc3RlYWQgbWFrZSB0aGUgcGFyc2VyIHRha2UgYSBsaXN0ID8gIFRoaXMgYnVzaW5l
c3Mgb2YKPiBjb25zdHJ1Y3RpbmcgYSBjb25jYXRlbmF0ZWQgc3RyaW5nIGlzIG5vdCB2ZXJ5IG5p
Y2UuCgpZZXMgYSBsaXN0IGlzIHByb2JhYmx5IHRoZSB3YXkgdG8gZ28sIHBhcnRpY3VsYXJseSBh
cyB3ZSBtaWdodCB3YW50IHRvIApwYXNzIG1vcmUgZmlsZSBjb250ZW50cyBsYXRlciBmb3IgQkxT
IHN1cHBvcnQuCgogCU1pY2hhZWwgWW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
