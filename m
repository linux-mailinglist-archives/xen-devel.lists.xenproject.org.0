Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3BD8BCD7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYV0-0006gN-Mg; Tue, 13 Aug 2019 15:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FUCW=WJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxYUz-0006gI-QP
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:14:09 +0000
X-Inumbo-ID: ff00aa5c-bddc-11e9-ba7f-df3cf5fdb688
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff00aa5c-bddc-11e9-ba7f-df3cf5fdb688;
 Tue, 13 Aug 2019 15:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7fi5Az4bbKMWYn28nmlbZTQMJbbuLjK/qKqO8RnEMP5kkDdN3NgcQCJ+YqUJAz/mLO/T7iusA94VMxQz1CgAuc47CUw8YVxwt+xorQEXXdJFKBd1BpJzbEsD9QubrvUH3mfteoQcwhkKOCWhA2KjzondqQyExwvQAFISq+W5KS8ZUmpze7P8JhZbjZDzVO/qbDlh6JrJLpWMDmzepNI7K++epGDF775VaU4x67c2gb8FYy7BX03TygQuX7vOQK3kdFjvsYjiX9Im12l4bWakWlHrUT9BQBtpG8/1h80oII1SGrCDyRX0zg7orZ+AWD06qleSbsb6drpkexZjkEhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoeR34J1BfbOETQxh+OBF3IQcf0Tk/VfJesjq8Oncu8=;
 b=MhYHyWBYCMPOMBDz0vwqeAfvTr9VO8AICARvCd7y7zlycLM6EX5bAJzhiYC+V/qbikwX4MN/7EGLijH8SUOKokLsNwz2wZDOWr200/qw1LdNRHgNd0y8wwv9jqMC0RfPfoRJ2xTz1Wftxe6ZPO2b6wMG8NtSnD+o7fi+77mwibWIeQpmPElRfaCPkxc/3WNVi/wRbD7ZdQ95lJ4lwJklMV1PFsqw1pMiDwX8FtDifZ4zqLQA9y0NPnbpLHXeek2p9mQNBxi/1+NpxuwARzQCj5JuchmG/6ziMKR4zQBaJEEi5Ja+R3EqpqNIPpQUkZ7Yvo/aMoX27BiiigUomAuXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoeR34J1BfbOETQxh+OBF3IQcf0Tk/VfJesjq8Oncu8=;
 b=baORA81mWMH6ujrCM3g/mQu9RAY2zeF2gwXaY5zlH0nzesUmYMYwOeymC8TMsSfBozLq1NwEow9ufC8rjkTfOS76jnK+FkJUrIRbov0Gru9IfXvIqbESvMGQ45n00w9/p6u9c5eJO2z8gQ6Nk5rmB6EST7mxM/XzPB7CsgMES1Bze989eFOxPyeiTFgQuuHNBzEVq/HRQwJnKGi8RmLjeIM86Lvyvuk0fD+rREVleMxW1F3WUof6ejeAGkO8abZu2TKkOn0lhNgIS9jZDLhvN0fKCm2xKXQVNEK5kleK0Pfv/6cLijDtTMO4xCNVjOiodplTiqN+Sd0iSkDjxFf9jg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4994.eurprd03.prod.outlook.com (20.178.21.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 15:14:07 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 15:14:07 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 3/7] xen/arm: keep track of reserved-memory regions
Thread-Index: AQHVUV1QMNfXhdMZzkSWk2vkeQwkS6b5IrWAgAAGPwCAAAfPgA==
Date: Tue, 13 Aug 2019 15:14:06 +0000
Message-ID: <87a7cdgksi.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-3-sstabellini@kernel.org> <87ef1pgn4c.fsf@epam.com>
 <75f9a42a-f691-2cf2-b9e8-289c05f66286@arm.com>
In-Reply-To: <75f9a42a-f691-2cf2-b9e8-289c05f66286@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 989419f3-aca3-4809-6d52-08d72000e29b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4994; 
x-ms-traffictypediagnostic: AM0PR03MB4994:|AM0PR03MB4994:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4994F48FEDA5E1F76AC6B074E6D20@AM0PR03MB4994.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(476003)(486006)(2616005)(66066001)(14444005)(76116006)(66556008)(256004)(91956017)(36756003)(66476007)(6436002)(6916009)(5660300002)(6486002)(8936002)(14454004)(229853002)(71190400001)(71200400001)(54906003)(11346002)(66446008)(64756008)(446003)(478600001)(80792005)(316002)(53936002)(81156014)(4326008)(6246003)(76176011)(66946007)(3846002)(53546011)(86362001)(6506007)(81166006)(6512007)(8676002)(7736002)(102836004)(305945005)(6116002)(186003)(55236004)(26005)(99286004)(25786009)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4994;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z0a//+FbCgKdAireOBSS+zPGS5JpHMAtKDFWRLAXPE0b5K5V4KKHuIMCaS7z39B8ZsCmlA1lynSgCFwRRCh+h4hXsMEMJBTRZqyovYvbAIjkHx/HRjrDgyXsRT28hKjCobVnca0zyP56bsfd2v4KSf5NdA2emTk7UBcyNCIOsPrWv/NuTIs0m+tV1296uGEO/oqa9S1rVvKxCtO1wToTGMYX0fBmy8S+m+MDLoYYEqTPo3e8Lb5iqEqrzap1UqUnV17Gy7/4JwXGtOTPX2cCIgyU5+MgU9dUaQfTaNfd8lcoYJms9rCWCPw1A824i5fxW33l8tH/hV6mbwBCMubNb39VmSzLQMmqWVA2llxELO4yIgCpLcWZhQU6yT+GwJUEGhmvt1HnJZyzDg448uUrpLI8mF4P1vdKlt4VXOK2FtQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989419f3-aca3-4809-6d52-08d72000e29b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 15:14:06.9276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUiYADOA8pDm25G4Z0s9DXsQSsVVn+ZSQayWj5zbk2TVmxWvHI9Jd94BhKzkOEkr9wW/thYGUnZyz+Ft6CJ1zwwkcjO0/ep2tegmrgb/YiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4994
Subject: Re: [Xen-devel] [PATCH v5 3/7] xen/arm: keep track of
 reserved-memory regions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gOC8xMy8xOSAz
OjIzIFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4KPj4gU3RlZmFubyBTdGFiZWxsaW5p
IHdyaXRlczoKPj4KPj4+IEFzIHdlIHBhcnNlIHRoZSBkZXZpY2UgdHJlZSBpbiBYZW4sIGtlZXAg
dHJhY2sgb2YgdGhlIHJlc2VydmVkLW1lbW9yeQo+Pj4gcmVnaW9ucyBhcyB0aGV5IG5lZWQgc3Bl
Y2lhbCB0cmVhdG1lbnQgKGZvbGxvdy11cCBwYXRjaGVzIHdpbGwgbWFrZSB1c2UKPj4+IG9mIHRo
ZSBzdG9yZWQgaW5mb3JtYXRpb24uKQo+Pj4KPj4+IFJldXNlIHByb2Nlc3NfbWVtb3J5X25vZGUg
dG8gYWRkIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHRvIHRoZQo+Pj4gYm9vdGluZm8ucmVzZXJ2
ZWRfbWVtIGFycmF5Lgo+Pj4KPj4+IFJlZnVzZSB0byBjb250aW51ZSBvbmNlIHdlIHJlYWNoIHRo
ZSBtYXggbnVtYmVyIG9mIHJlc2VydmVkIG1lbW9yeQo+Pj4gcmVnaW9ucyB0byBhdm9pZCBhY2Np
ZGVudGFsbHkgbWFwcGluZyBhbnkgcG9ydGlvbnMgb2YgdGhlbSBpbnRvIGEgVk0uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+
Pj4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2NToKPj4+IC0gcmVtb3ZlIHVubmVlZGVkIGNhc3QK
Pj4+IC0gcmVtb3ZlIHVubmVlZGVkIHN0cmxlbiBjaGVjawo+Pj4gLSBkb24ndCBwYXNzIGFkZHJl
c3NfY2VsbHMsIHNpemVfY2VsbHMsIGRlcHRoIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUK
Pj4+Cj4+PiBDaGFuZ2VzIGluIHY0Ogo+Pj4gLSBkZXB0aCArIDEgaW4gcHJvY2Vzc19yZXNlcnZl
ZF9tZW1vcnlfbm9kZQo+Pj4gLSBwYXNzIGFkZHJlc3NfY2VsbHMgYW5kIHNpemVfY2VsbHMgdG8g
ZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZQo+Pj4gLSBwYXNzIHN0cnVjdCBtZW1pbmZvICogaW5z
dGVhZCBvZiBhIGJvb2xlYW4gdG8gcHJvY2Vzc19tZW1vcnlfbm9kZQo+Pj4gLSBpbXByb3ZlIGlu
LWNvZGUgY29tbWVudAo+Pj4gLSB1c2UgYSBzZXBhcmF0ZSBwcm9jZXNzX3Jlc2VydmVkX21lbW9y
eV9ub2RlIChzZXBhcmF0ZSBmcm9tCj4+PiAgICBwcm9jZXNzX21lbW9yeV9ub2RlKSBmdW5jdGlv
biB3cmFwcGVyIHRvIGhhdmUgZGlmZmVyZW50IGVycm9yIGhhbmRsaW5nCj4+Pgo+Pj4gQ2hhbmdl
cyBpbiB2MzoKPj4+IC0gbWF0Y2ggb25seSAvcmVzZXJ2ZWQtbWVtb3J5Cj4+PiAtIHB1dCB0aGUg
d2FybmluZyBiYWNrIGluIHBsYWNlIGZvciByZWcgbm90IHByZXNlbnQgb24gYSBub3JtYWwgbWVt
b3J5Cj4+PiAgICByZWdpb24KPj4+IC0gcmVmdXNlIHRvIGNvbnRpbnVlIG9uY2Ugd2UgcmVhY2gg
dGhlIG1heCBudW1iZXIgb2YgcmVzZXJ2ZWQgbWVtb3J5Cj4+PiAgICByZWdpb25zCj4+Pgo+Pj4g
Q2hhbmdlcyBpbiB2MjoKPj4+IC0gY2FsbCBwcm9jZXNzX21lbW9yeV9ub2RlIGZyb20gcHJvY2Vz
c19yZXNlcnZlZF9tZW1vcnlfbm9kZSB0byBhdm9pZAo+Pj4gICAgZHVwbGljYXRpb24KPj4+IC0t
LQo+Pj4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tCj4+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCB8
ICAxICsKPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYwo+Pj4gaW5kZXggNTkwYjE0MzA0Yy4uMGIwZTIyYTNkMCAxMDA2NDQK
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKPj4+IEBAIC0xMzYsNiArMTM2LDcgQEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vz
c19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+Pj4gICAgICAgY29uc3Qg
X19iZTMyICpjZWxsOwo+Pj4gICAgICAgcGFkZHJfdCBzdGFydCwgc2l6ZTsKPj4+ICAgICAgIHUz
MiByZWdfY2VsbHMgPSBhZGRyZXNzX2NlbGxzICsgc2l6ZV9jZWxsczsKPj4+ICsgICAgc3RydWN0
IG1lbWluZm8gKm1lbSA9IGRhdGE7Cj4+Pgo+Pj4gICAgICAgaWYgKCBhZGRyZXNzX2NlbGxzIDwg
MSB8fCBzaXplX2NlbGxzIDwgMSApCj4+PiAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4+PiBA
QCAtMTQ3LDIxICsxNDgsNDYgQEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9k
ZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+Pj4gICAgICAgY2VsbCA9IChjb25zdCBfX2Jl
MzIgKilwcm9wLT5kYXRhOwo+Pj4gICAgICAgYmFua3MgPSBmZHQzMl90b19jcHUocHJvcC0+bGVu
KSAvIChyZWdfY2VsbHMgKiBzaXplb2YgKHUzMikpOwo+Pj4KPj4+IC0gICAgZm9yICggaSA9IDA7
IGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkrKyAp
Cj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgYmFua3MgJiYgbWVtLT5ucl9iYW5rcyA8IE5SX01F
TV9CQU5LUzsgaSsrICkKPj4gV2hhdCBpcyBsb2dpYyBiZWhpbmQgdGhlIHNlY29uZCBwYXJ0IG9m
IHRoZSBsb29wIGNvbmRpdGlvbj8KPj4KPj4gWW91IGtub3cgdGhhdCBpZiAoYmFua3MgPiBOUl9N
RU1fQkFOS1MpIHRoZW4geW91IHdpbGwgZXhpdCB3aXRoIGVycm9yLiBEbwo+PiB5b3UgcmVhbGx5
IG5lZWQgdG8gaXRlcmF0ZSBvdmVyIGxvb3AgaW4gdGhpcyBjYXNlPwo+Cj4gV2VsbCwgdGhlIGVy
cm9yIGlzIGlnbm9yZWQgaW4gdGhlIGNhc2Ugb2YgbWVtb3J5IGJhbmtzLiBTbyBpdGVyYXRpbmcK
PiBvdmVyIHRoZSBmaXJzdCBiYW5rcyBhbGxvd3MgeW91IHRvIGZpbGwgdXAgYm9vdGluZm8gd2l0
aCBhcyBtdWNoIGFzCj4gcG9zc2libGUgYXMgUkFNLiBUaGUgcmVzdCBvZiB0aGUgUkFNIHdpbGwg
bm90IGJlIHVzZWQgYnkgWGVuLgpGYWlyIGVub3VnaC4KCj4+Cj4+PiAgICAgICB7Cj4+PiAgICAg
ICAgICAgZGV2aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxs
cywgJnN0YXJ0LCAmc2l6ZSk7Cj4+PiAgICAgICAgICAgaWYgKCAhc2l6ZSApCj4+PiAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+Pj4gLSAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8u
bWVtLm5yX2JhbmtzXS5zdGFydCA9IHN0YXJ0Owo+Pj4gLSAgICAgICAgYm9vdGluZm8ubWVtLmJh
bmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+IC0gICAgICAgIGJvb3Rp
bmZvLm1lbS5ucl9iYW5rcysrOwo+Pj4gKyAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3Nd
LnN0YXJ0ID0gc3RhcnQ7Cj4+PiArICAgICAgICBtZW0tPmJhbmtbbWVtLT5ucl9iYW5rc10uc2l6
ZSA9IHNpemU7Cj4+PiArICAgICAgICBtZW0tPm5yX2JhbmtzKys7Cj4+PiAgICAgICB9Cj4+Pgo+
Pj4gLSAgICBpZiAoIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9PSBOUl9NRU1fQkFOS1MgKQo+Pj4g
KyAgICBpZiAoIG1lbS0+bnJfYmFua3MgPT0gTlJfTUVNX0JBTktTICkKPj4gTG9va3MgbGlrZSB5
b3UgaGF2ZSB0aGUgc2FtZSBvZmYtYnktb25lIGVycm9yLCBhcyBpbiBwcmV2aW91cyBwYXRjaC4K
Pj4gSSBjYW4gc2VlIHRoYXQgaXQgd2FzIHRoZXJlIGVhcmxpZXIuIEJ1dCBpdCBpcyBnb29kIHRp
bWUgdG8gZml4IGl0Lgo+Cj4gSSBkb24ndCB0aGluayB0aGVyZSB3YXMgYW4gb2ZmLWJ5LW9uZSBl
cnJvciBiZWZvcmUgdGhpcyBzZXJpZXMuIFNvCj4gd2hhdCBkbyB5b3UgbWVhbj8KSSBleHBsYWlu
ZWQgdGhpcyBpbiBwYXRjaCAjMi4gSW1hZ2luZSB0aGF0IE5SX01FTV9CQU5LUyA9IDEgYW5kIHlv
dSBoYXZlCm9uZSBtZW1vcnkgbm9kZSBpbiB0aGUgZHRiLiBZb3UnbGwgZmlsbCB0aGUgZmlyc3Qg
ZWxlbWVudCBvZiB0aGUgYXJyYXkKYW5kIG1lbS0+bnJfYmFua3Mgd2lsbCBiZWNvbWUgMS4gVGhp
cyBpcyBhYnNvbHV0ZWx5IG5vcm1hbC4gQnV0IGNoZWNrCmFib3ZlIHdpbGwgZmFpbCwgd2hpY2gg
aXMgbm90IHJpZ2h0LgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
