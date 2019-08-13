Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03838BB44
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:17:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXZ3-0008Ro-Mm; Tue, 13 Aug 2019 14:14:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FUCW=WJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxXZ2-0008Rj-TB
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:14:16 +0000
X-Inumbo-ID: a0c7aa7e-bdd4-11e9-972c-3778d8b0fe93
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0c7aa7e-bdd4-11e9-972c-3778d8b0fe93;
 Tue, 13 Aug 2019 14:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBSs6kIvRo9/Q4A0BSbw6QVZ8YHhaJUxx8MAq/Vb82QB86gbm777yEFygofxWGhcPoCTByZZ9yf/++emqoEqZFMjry00Qrmo8zzxzKmqqqKVK8amH1zV6N1cjVXzKZRDTqQaXC4anT4t+EFdVv4Lk49XFYeFt9Gfym3Im1wiL174cXMR0mLASKh8kFVvN4zd17bQyM/Y+AzHBe5klCzFkOwzCfz6jZwLM7bO2zaEEYPkSHDaEplj3NSC7UUN5FN2OS3feWONLCWHauBLaUm4CQnVxwK6kMIfw0y2opb14y1MEtBNKWafvn6KIrUTWhUOUQoluaoKtnlLeGYZaWrAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPxdfNwd2Gt0no78kWYS+KLyJciCvsXh3HL2SSBOQGE=;
 b=DZ7hNgLx4S4h31QLnG6QcmlVZmKPPzwah5Vm5t+IWg8TaaG65Tmhegvjs6u1AKQA0tBypVfqT55rDRrrWT4K4Kjje+Nj851TpvWq3hsP0HZkyJQNoc2R7G73LU45h+SmCCthk/BEIC9bKjsZ8l45l5V10CrlsxrypYh9xMoWLInsTNcuvN2u37CjkMcq8nX+sgJJYcCPzylKa4y7mX9my+aSTjFJ/GMgC0SanrA+vxKTcAocO6NF/0Y+dSIO2LFgqxLo+40oLeb0nW0SympfcW4wNB2SA/zAmTaYGJUMksa18g0JD5qkIj3MbHGuE+hchPWsgplWpzCcpGprbgM/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPxdfNwd2Gt0no78kWYS+KLyJciCvsXh3HL2SSBOQGE=;
 b=AwyX1AYrlYcOWdib2HtroJbE5t5RpV0brhNamX32Httg5eI/KnyZW1Etx8POkMzDO28lGN1Q3yzTV2cYqxi2jtLleTWev1RrhSC4Ie6TroRGoYAo5HVxPqI5OznNemzo0F/fl0vaPGBqDw7WaH+2I2k3qcKV1ZOhNU7B+V+A5IgnBpeU+1BYAE00EjRJnpbLFA8FKOtIu7EpGqtJC8Sv7cTlpHO3zxILn8t6n6FCoqEm2YEB7IMwFzUfm8W006UnxHApyBvFUwWphNfx3de61gZkfh2k02/Bcn3y6t/x6hO7ciyAvXlXxDzbVLgev5S+ZwmcmsAAEd6LvkavNTxSKQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5890.eurprd03.prod.outlook.com (10.255.29.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 14:14:12 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 14:14:12 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
Thread-Index: AQHVUV1R/d2bF3zaTUGfbkxrXQjKbab5IAaA
Date: Tue, 13 Aug 2019 14:14:12 +0000
Message-ID: <87ftm5gnkc.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org>
In-Reply-To: <20190812222844.9636-2-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70a590b4-dff9-444f-9368-08d71ff8840f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5890; 
x-ms-traffictypediagnostic: AM0PR03MB5890:|AM0PR03MB5890:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB589065F913BD41B319A84C40E6D20@AM0PR03MB5890.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(189003)(199004)(305945005)(26005)(99286004)(81166006)(66066001)(76176011)(55236004)(102836004)(2616005)(7736002)(80792005)(229853002)(6506007)(81156014)(8936002)(6436002)(2906002)(36756003)(446003)(6916009)(486006)(6512007)(6486002)(11346002)(476003)(4326008)(53936002)(71200400001)(71190400001)(25786009)(6246003)(86362001)(256004)(91956017)(76116006)(66946007)(66476007)(14454004)(478600001)(3846002)(316002)(8676002)(66556008)(186003)(54906003)(64756008)(6116002)(66446008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5890;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8qp19G/IRyocD7kiZBNsh/EUo/SGqB2KCXVq5zRshqtAR5ZSZr65EKISyLs69HfNY6bIKVg5qvz+Y/PiI2K3G6M6A/8QR1HSoRwjE3ZKuDPzYc2c3HNcowD7AW+sjEtcWSRolQG2rvGFlxNYfo4XHt9ZaqgnE0BfE+CzvnxLs+a+lcdtu4/R8Tahup0g5VnJRmqxhFEAiBkwj7QeVwTntXbJCRJpd6y+4dbmdD98WIqZl2crrM/28Zhsy7pe1pMbb8tYhj9P0n88lDQpPQLkgOW4/8EyyjaD33ddWPY0giC7fHHJJcJwfrWnuiTUZWRZSMatNzpmOKeBIvCikScumrm7RzQkKiDVvAkEOYoH0oDs05FLlhddZ7OSWW95bWa52uZE2eJ1TceGvou0ZronAuSaa3j6U85f3deomN0yidM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a590b4-dff9-444f-9368-08d71ff8840f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 14:14:12.2611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KeDLmBi3EqAGcQuSH3w9Cm6ZwaU5e3FEdlvgdZ/5wGb56FsUEpN9QgIl5tKBoUZLS26lL3g9JKjjLsrJb9LuopnSlORJAlBVx1jWeHMavgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5890
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBDaGFuZ2UgdGhlIHNp
Z25hdHVyZSBvZiBwcm9jZXNzX21lbW9yeV9ub2RlIHRvIG1hdGNoCj4gZGV2aWNlX3RyZWVfbm9k
ZV9mdW5jLiBUaGFua3MgdG8gdGhpcyBjaGFuZ2UsIHRoZSBuZXh0IHBhdGNoIHdpbGwgYmUKPiBh
YmxlIHRvIHVzZSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIHRvIGNhbGwgcHJvY2Vzc19tZW1v
cnlfbm9kZSBvbiBhbGwKPiB0aGUgY2hpbGRyZW4gb2YgYSBwcm92aWRlZCBub2RlLgo+Cj4gUmV0
dXJuIGVycm9yIGlmIHRoZXJlIGlzIG5vIHJlZyBwcm9wZXJ0eSBvciBpZiBucl9iYW5rcyBpcyBy
ZWFjaGVkLiBMZXQKPiB0aGUgY2FsbGVyIGRlYWwgd2l0aCB0aGUgZXJyb3IuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4g
Q2hhbmdlcyBpbiB2NToKPiAtIHJldHVybiAtRU5PRU5UIGlmIGFkZHJlc3NfY2VsbHMgb3Igc2l6
ZV9jZWxscyBhcmUgbm90IHByb3Blcmx5IHNldAo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAtIHJldHVy
biBlcnJvciBpZiB0aGVyZSBpcyBubyByZWcgcHJvcGVyeSwgcmVtb3ZlIHByaW50awo+IC0gcmV0
dXJuIGVycm9yIGlmIG5yX2JhbmtzIGlzIHJlYWNoZWQKPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBp
bXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gLSBjaGVjayByZXR1cm4gdmFsdWUgb2YgcHJvY2Vzc19t
ZW1vcnlfbm9kZQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIG5ldwo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vYm9vdGZkdC5jIHwgMjkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gaW5k
ZXggYTg3MmVhNTdkNi4uNTkwYjE0MzA0YyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IEBAIC0xMjUsOSArMTI1LDEw
IEBAIGludCBfX2luaXQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLAo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBfX2luaXQg
cHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMy
IHNpemVfY2VsbHMpCj4gK3N0YXRpYyBpbnQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29u
c3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpuYW1lLCBpbnQgZGVwdGgsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMiBzaXplX2NlbGxzLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gIHsK
PiAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnByb3A7Cj4gICAgICBpbnQgaTsKPiBA
QCAtMTM3LDE4ICsxMzgsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25v
ZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKPiAgICAgIHUzMiByZWdfY2VsbHMgPSBhZGRy
ZXNzX2NlbGxzICsgc2l6ZV9jZWxsczsKPgo+ICAgICAgaWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8
fCBzaXplX2NlbGxzIDwgMSApCj4gLSAgICB7Cj4gLSAgICAgICAgcHJpbnRrKCJmZHQ6IG5vZGUg
YCVzJzogaW52YWxpZCAjYWRkcmVzcy1jZWxscyBvciAjc2l6ZS1jZWxscyIsCj4gLSAgICAgICAg
ICAgICAgIG5hbWUpOwo+IC0gICAgICAgIHJldHVybjsKPiAtICAgIH0KPiArICAgICAgICByZXR1
cm4gLUVOT0VOVDsKPgo+ICAgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHkoZmR0LCBub2RlLCAi
cmVnIiwgTlVMTCk7Cj4gICAgICBpZiAoICFwcm9wICkKPiAtICAgIHsKPiAtICAgICAgICBwcmlu
dGsoImZkdDogbm9kZSBgJXMnOiBtaXNzaW5nIGByZWcnIHByb3BlcnR5XG4iLCBuYW1lKTsKPiAt
ICAgICAgICByZXR1cm47Cj4gLSAgICB9Cj4gKyAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAg
ICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsKPiAgICAgIGJhbmtzID0gZmR0
MzJfdG9fY3B1KHByb3AtPmxlbikgLyAocmVnX2NlbGxzICogc2l6ZW9mICh1MzIpKTsKPiBAQCAt
MTYyLDYgKzE1NiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShj
b25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+ICAgICAgICAgIGJvb3RpbmZvLm1lbS5iYW5rW2Jv
b3RpbmZvLm1lbS5ucl9iYW5rc10uc2l6ZSA9IHNpemU7Cj4gICAgICAgICAgYm9vdGluZm8ubWVt
Lm5yX2JhbmtzKys7Cj4gICAgICB9Cj4gKwo+ICsgICAgaWYgKCBib290aW5mby5tZW0ubnJfYmFu
a3MgPT0gTlJfTUVNX0JBTktTICkKPiArICAgICAgICByZXR1cm4gLUVOT1NQQzsKQXJlIHlvdSBz
dXJlIHRoYXQgdGhpcyBsb2dpYyBpcyBjb3JyZWN0PwoKRm9yIGV4YW1wbGUsIGlmIE5SX01FTV9C
QU5LUyBpcyAxLCBhbmQgd2UgaGF2ZSBleGFjdGx5IG9uZSBtZW1vcnkgbm9kZQppbiBkZXZpY2Ug
dHJlZSwgdGhpcyBmdW5jdGlvbiB3aWxsIGZhaWwuIEJ1dCBpdCBzaG91bGQgbm90LiBJIHRoaW5r
IHlvdQp3YW50IHRoaXMgY29uZGl0aW9uOiBib290aW5mby5tZW0ubnJfYmFua3MgPiBOUl9NRU1f
QkFOS1MKCj4gKyAgICByZXR1cm4gMDsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9j
ZXNzX211bHRpYm9vdF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gQEAgLTI5Mywx
NSArMjkxLDE4IEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5fbm9kZShjb25zdCB2b2lk
ICpmZHQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19j
ZWxscywgdTMyIHNpemVfY2VsbHMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2b2lkICpkYXRhKQo+ICB7Cj4gKyAgICBpbnQgcmMgPSAwOwo+ICsKPiAgICAgIGlmICggZGV2
aWNlX3RyZWVfbm9kZV9tYXRjaGVzKGZkdCwgbm9kZSwgIm1lbW9yeSIpICkKPiAtICAgICAgICBw
cm9jZXNzX21lbW9yeV9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgYWRkcmVzc19jZWxscywgc2l6ZV9j
ZWxscyk7Cj4gKyAgICAgICAgcmMgPSBwcm9jZXNzX21lbW9yeV9ub2RlKGZkdCwgbm9kZSwgbmFt
ZSwgZGVwdGgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJlc3NfY2Vs
bHMsIHNpemVfY2VsbHMsIE5VTEwpOwo+ICAgICAgZWxzZSBpZiAoIGRlcHRoIDw9IDMgJiYgKGRl
dmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQsIG5vZGUsICJ4ZW4sbXVsdGlib290LW1vZHVs
ZSIgKSB8fAo+ICAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQs
IG5vZGUsICJtdWx0aWJvb3QsbW9kdWxlIiApKSkKPiAgICAgICAgICBwcm9jZXNzX211bHRpYm9v
dF9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscyk7Cj4gICAg
ICBlbHNlIGlmICggZGVwdGggPT0gMSAmJiBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBu
b2RlLCAiY2hvc2VuIikgKQo+ICAgICAgICAgIHByb2Nlc3NfY2hvc2VuX25vZGUoZmR0LCBub2Rl
LCBuYW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsKPgo+IC0gICAgcmV0dXJuIDA7Cj4g
KyAgICByZXR1cm4gcmM7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJpbnRf
aW5mbyh2b2lkKQoKCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
