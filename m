Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F981F67C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 14:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjMA3-0002jq-NZ; Thu, 11 Jun 2020 12:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGgV=7Y=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jjMA2-0002jk-DT
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 12:18:22 +0000
X-Inumbo-ID: a3848f0a-abdd-11ea-b511-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3848f0a-abdd-11ea-b511-12813bfff9fa;
 Thu, 11 Jun 2020 12:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuV4oV0s5UHwF3XyaDbe5Pnaqv+vZxYkRgYxP653ZK47YUgHSObMBIkB4EbbHP9nyECIZUu4zazOfRDVvNx1f2NNlMT8/CPCOU7dwejVHUXbJXQxODSVR+kU3zQ/lNTOg0iTFDtpCZvSYleyKgPTgmezgRbywmFeSshZTdtQEW8JQdE+EvnjbtYlDmXaDxQ0ffzUKxrh/Pc3AUCIOg4XXrtceVPA+ynsXgJvJ9O/GMKQr69N+XcmXbcZfMKTvAslPQx7SiLcP1xveHf6H6VWj/W2LLJQdecCWARFEwiebYK42UqtgypFtAYnk6nREcAnKlFx96OJ6eGpV9V4jTr4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxjhrZ/jHmB4WOxIajiLtMregBOwhoysRuaJ/WsOvHo=;
 b=HEBGw3upNb9k0YcR3KOKLFnzUh9xvcp8yHPtzvfF687UYqnPCghdIBKcPqoU4z+0M1ZaJG6h5e5cpiQi7bkVhgceGkrVPAU2DKEjgjW0qGscK6BZNmyk2CZrmS61tZSFrkCzpfEL+QRIDCLyPDse5y178vVRhF8AEyo7CUaiDo0YeePx/bSV/vkFauCsGxorj70kw94YTaiBpXWJrW0g7bCPp0DVUxoNUjadJ4hDsn86uy8vgGaN3GwEWE/WEJSG6oN861PD/gFUcYAafGyOalTtsAutCXS5kDAT5ZtCDtOsDPL1jJawrTwCQ8xEtEF3Pmjr3LOCAFHaO4SxvqEgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxjhrZ/jHmB4WOxIajiLtMregBOwhoysRuaJ/WsOvHo=;
 b=C23HER/UCaRGJMWQZPrMkpUTuTRCfEurulJCCPDurTvGFFAUuswO9wUhByFON1B7BomMwO0GqlvTEdTXiWg1XD/3n6FgHNqk7dhQfkdVeMUgQ4f72Q0JmLgj6a/vSbXJtPdioz2a24AuEZ/yf2WkGHRZf9ALmVXDLKzEsDVpELmNRDshgfqm7zerra4gfQlpbE9WHkJUfKtp//5n5LOJVKGVg6el/0sbgkC1hPebp7UKMeqVgVq0dtDawxnNj7fIbDzzMutcg1/2rxXMnXB0215Oz933sM6wo5MFzl+1DESGArYGU630k1uA0JbqFZ7Bmn96Fr3c7RL6bN/5qyfhkg==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4895.eurprd03.prod.outlook.com (2603:10a6:803:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 12:18:18 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 12:18:18 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: HYPERVISOR_console_io + CONSOLEIO_write needs COPY_flush_dcache
Thread-Topic: HYPERVISOR_console_io + CONSOLEIO_write needs COPY_flush_dcache
Thread-Index: AQHWPv8SOx/IaSMb+EOuO5msEU03SajRzVWAgAGJcoA=
Date: Thu, 11 Jun 2020 12:18:18 +0000
Message-ID: <d0c976ad-2c16-436e-8906-ce217bc36e9c@epam.com>
References: <912a84d1-ca47-9c37-06e7-28bebe696b4d@epam.com>
 <b505db7c-494d-81ae-242f-e781430bd498@xen.org>
In-Reply-To: <b505db7c-494d-81ae-242f-e781430bd498@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f34def31-8923-441b-dfb2-08d80e01866f
x-ms-traffictypediagnostic: VI1PR03MB4895:
x-microsoft-antispam-prvs: <VI1PR03MB48951393CC502273537CC845E7800@VI1PR03MB4895.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZU04yykYlTxPqW5/7UleOkmEIfg+f/033AZMU4QzaeV8IVgXfueOEdtrrPiOP5pJBiszGjBeC/ZFPb1HBjFfoYqp76TaNsfcsmnzdmDHuIf/xiOD5yC4CmQl+/vy5tO4p3lzZ4ara8tP7AUc09+CRWUN19BMGecuR6ujOQ2jVU/Sx14/xuLSK9YQbL0/c4t9xJveOJvJEtWKeyW1ONFYaVb7OnexMF0bskgpXR77343/QPsRHe1Wyi4Bpc5My5ZJySiVWLMoN5ImbIA3RspRuny7ODmyhCnwHOdxenBYVB90HqJbsB8RMZHcgoJpFArdvVtKrLEJu69TfkJQ6l7aw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(316002)(110136005)(8936002)(6486002)(31696002)(86362001)(2616005)(31686004)(71200400001)(4326008)(54906003)(36756003)(64756008)(26005)(5660300002)(66476007)(6506007)(53546011)(8676002)(76116006)(66556008)(478600001)(83380400001)(66946007)(2906002)(91956017)(66446008)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vxZHB/wBG1gFg1OqkakdfQ0NkqRfKIFwDA90Bg+/LNWZK4F0U659VjatxbYo4jNLbsJmJv5lCDZfvn0uztWOX5FSXKIIwUd8E135VmHiV08YMx7Vymr+z7q8QNTeu1cCl8bcBKj9NRSe+o5FyVFBqfCrsOmdM37UU3Csu8uGZuJyUYDxRzCIiw4JaC7EMEVFHrQobKOOPNW0i+9PrPkfJfhgDZ6fsrFvrF4rIM687HzH9hnSDZj6TOJHvUNImuCwbr/8wP470P5h83Ah/fnaIfp9fWJxeW8/E/Kva5REPdlAAQSJzKU7CwW/Hk81g3WyKlYgENHU8Tb6/F+vTaXMdfzdaxP0Q9GUtrCw4opAFF/4MKLf1/GejV2UOiz3d8ngldlvwXT5jkQ3Y5RVgspRvAAxJQS+8ZLnOur7kxS0RX1WBOHMPYwJaZ8KQsX+EwAHS0WbmOvmdl7ZLTTvvMocsgu0heWWOfl19+iDKKlgcIQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B04FA7229C6084FBA0DA0B81AA9EF54@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34def31-8923-441b-dfb2-08d80e01866f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 12:18:18.4810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5iBTFMmhxw3D3iz3eb601DJH1LMjrbXLgJ1ZL2Fu4U9mtAz0slQIqnSLtR26gp+x97WHc3zg8nU6uZCZRKgvJhcWB28ly4Dg7khbt7LieSbNQsgYtMfM3SrPcadrMgZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4895
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzEwLzIwIDM6NTAgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gT24gMTAvMDYvMjAy
MCAwOToxMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIZWxsbywNCj4NCj4g
SGksDQo+DQo+PiBXaGlsZSBhZGRpbmcgc3VwcG9ydCBmb3IgcGFyYS12aXJ0dWFsaXplZCBibG9j
ayBkZXZpY2UgaW4gdS1ib290DQo+Pg0KPj4gSSBmYWNlZCBhbiBpc3N1ZSB3aXRoIEhZUEVSVklT
T1JfY29uc29sZV9pbyArIENPTlNPTEVJT193cml0ZS4NCj4+DQo+PiBJIHRyaWVkIHRvIHVzZSB0
aGUgaHlwZXJjYWxsIGR1cmluZyBNTVUgc2V0dXAgc3RhZ2Ugd2hpbGUgZW5hYmxpbmcgZGF0YSBj
YWNoZQ0KPj4NCj4+IG9uIGFybTY0IHBsYXRmb3JtIChlLmcuIGRhdGEgY2FjaGUgaXMgbm90IHll
dCBlbmFibGVkKSBhbmQgc2F3IGluIGd1ZXN0J3MgY29uc29sZQ0KPj4NCj4+IGVpdGhlciBvbGQg
ZGF0YSBvciBzb21lIHNvcnQgb2YgZ2FyYmFnZS4gUHJpbnRpbmcgY29uc3RhbnQgc3RyaW5ncywg
anVzdCBsaWtlIG1pbmktb3MNCj4+DQo+PiBkb2VzIG9uIGJvb3QsIHdvcmtzIGFzIGV4cGVjdGVk
LiANCj4NCj4gUGVyIHRoZSBoeXBlcmNhbGwgQUJJIChzZWUgaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaCkgYWxsIHRoZSBidWZmZXJzIG11c3QgcmVzaWRlIGluIG1lbW9yeSB3aGljaCBpcyBtYXBw
ZWQgYXMgTm9ybWFsIElubmVyIFdyaXRlLUJhY2sgSW5uZXItU2hhcmVhYmxlLg0KPg0KPiBZb3Ug
YXJlIHBhc3Npbmcgbm9uLWNhY2hlYWJsZSBtZW1vcnksIHNvIHRoZSBiZWhhdmlvciB5b3Ugc2Vl
IGlzIGV4cGVjdGVkLg0KVGhpcyBpcyB3aGF0IHdlIGNvbWUgdXAgd2l0aCBhcyB3ZWxsDQo+DQo+
PiBTbywgbG9va2luZyBhdCB0aGUgWGVuIGNvZGUgWzFdIGl0IHNlZW1zDQo+Pg0KPj4gdGhhdCB3
ZSBzaG91bGQgY29weSBndWVzdCdzIGJ1ZmZlciB3aXRoIENPUFlfZmx1c2hfZGNhY2hlIHNldCBp
biB0aGlzIGNhc2UNCj4NCj4gQ09QWV9mbHVzaF9kY2FjaGUgaXMgb25seSBtZWFudCB0byBiZSB1
c2VkIHdoZW4gY29weSB0byBndWVzdCBtZW1vcnkgdG8gbWFrZSBzdXJlIHRoZSBkYXRhIHJlYWNo
ZWQgdGhlIHBvaW50IG9mIGNvaGVyZW5jeSBpbiB5b3VyIHN5c3RlbS4gSXQgaXMgbm90IG1lYW50
IHRvIGJlIHVzZWQgd2hlbiBjb3B5aW5nIGZyb20gZ3Vlc3QuDQpVbmRlcnN0b29kIGFuZCBhZ3Jl
ZQ0KPg0KPj4gYXMgKHVzdWFsbHk/KSB0aGlzIGh5cGVyY2FsbCBpcyB1c2VkIGluIGd1ZXN0J3Mg
Y29kZSB3aGljaCBkb2Vzbid0IGhhdmUgYW55DQo+PiBvdGhlciBtZWFucyB0byBwcmludCB5ZXQs
IGUuZy4gZWFybHkgcHJpbnRrIGNhc2UuDQo+DQo+IEkgaGF2ZSBiZWVuIHVzaW5nIGl0IGFmdGVy
IHRoZSBNTVUgaXMgc2V0dXAgDQpUaGUgdGhpbmcgaXMgdGhhdCBpbiB1LWJvb3QgYSBsb3Qgb2Yg
dGhpbmdzIGhhcHBlbiBiZWZvcmUgdGhlIE1NVSBzZXR1cC4uLg0KPiBidXQgYmVmb3JlIHRoZSBj
b25zb2xlIGlzIHByb3Blcmx5IHNldHVwIGJ5IHRoZSBndWVzdCAodGhlcmUgaXMgYSBsb3QgdGhh
dCBjYW4gaGFwcGVuIGluIExpbnV4IGJldHdlZW4gdGhlIHR3bykuIEluIG15IGNhc2UsIHRoZSBm
bHVzaCBpcyBub3QgbmVjZXNzYXJ5IGFuZCB3b3VsZCBiZSB3cm9uZy4NCi4uLiBhbmQgd2l0aG91
dCB0aGUgZmx1c2ggeW91IGxvc2UgdGhlIGFiaWxpdHkgdG8gZGVidWcgdGhhdCBjb2RlLg0KPg0K
PiBJbiBnZW5lcmFsLCB0aGUgY2FjaGUgaXMgbmV2ZXIgb2ZmIG9uIEFybTY0IGJlY2F1c2UgeW91
IG1heSBoYXZlIHN5c3RlbSBjYWNoZSBvciwgaW4gdGhlIGNhY2hlIG9mIHZpcnR1YWxpemF0aW9u
LCBjYWNoZWFibGUgbWFwcGluZyBpbiB0aGUgaHlwZXJ2aXNvciAoYWxsIHRoZSBtZW1vcnkgaXMg
bWFwcGVkKS4NCj4NCj4gV2hlbiB1cGRhdGluZyBkYXRhIHdpdGggTU1VL0QtY2FjaGUgb2ZmIHRo
ZSBub3JtYWwgYXBwcm9hY2ggaXM6DQo+IMKgwqAgMSkgUmVtb3ZlIGFueSBkaXJ0eSBsaW5lcyBm
cm9tIHRoZSBjYWNoZSwgb3RoZXJ3aXNlIHRoZXkgbWF5IGdldCBldmljdGVkIHdoaWxlIHVwZGF0
aW5nIHRoZSBtZW1vcnkgYW5kIG92ZXJyaWRlIGFueSB2YWx1ZSB3cml0dGVuIHdpdGggTU1VIG9m
Zi4NCj4gwqDCoCAyKSBVcGRhdGUgdGhlIG1lbW9yeQ0KPiDCoMKgIDMpIFJlbW92ZSBhbnkgbGlu
ZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIHNwZWN1bGF0ZWQgc28gd2hlbiB5b3UgdHVybiBvbnRoZSBN
TVUgYW5kIEQtY2FjaGUsIFUtYm9vdCBjYW4gb2J2ZXJzZSB0aGUgY29ycmVjdCBkYXRhLg0KPg0K
PiBTdGVwIDEgaXMgb25seSBuZWNlc3NhcnkgaWYgeW91IGFyZSBnb2luZyB0byB3cml0ZSBvdXRz
aWRlIG9mIHRoZSBsb2FkZWQgSW1hZ2UgKEJTUyBpcyBub3QgcGFydCBvZiBpdCkuDQo+DQo+IFlv
dSBtb3N0IGxpa2VseSBhbHJlYWR5IGhhdmUgc2ltaWxhciBzdGVwcyBpbiBVLWJvb3QgZm9yIG90
aGVyIHBhcnQgb2YgdGhlIG1lbW9yeSBhY2Nlc3Mgd2l0aCBNTVUvRC1DYWNoZSBvZmYuIFNvIEkg
dGhpbmsgVS1ib290IGlzIHRoZSBiZXN0IHBsYWNlIHRvIGludmFsaWRhdGUgdGhlIGNhY2hlIGJl
Zm9yZSBpc3N1aW5nIHRoZSBoeXBlcmNhbGwuDQoNClllcywgSSBoYXZlIGludmFsaWRhdGVkIHRo
ZSBidWZmZXJzIGFuZCBldmVyeXRoaW5nIHdvcmtzIGxpa2UgYSBjaGFybSBub3csIHRoYW5rcw0K
DQpQcm9iYWJseSBteSB1c2UtY2FzZSBzaG91bGQgYmUgc29tZXdoZXJlIGRvY3VtZW50ZWQsIHNv
IGFub3RoZXIgdGltZSBzb21lb25lIHN0ZXBzIGludG8gc2ltaWxhciBpc3N1ZXMgaXQgaXMgZXhw
bGFpbmVkLg0KDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSBmb3IgaGVscGluZywNCg0KT2xl
a3NhbmRyDQo=

