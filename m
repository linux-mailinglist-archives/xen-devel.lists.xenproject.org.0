Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D964181BAD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:49:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2cm-0003Td-Hj; Wed, 11 Mar 2020 14:46:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/gQI=44=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jC2ck-0003TY-Kt
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:46:18 +0000
X-Inumbo-ID: 0fa96414-63a7-11ea-92cf-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fa96414-63a7-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 14:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cly4sW/UavUu6zX/E6LdneGvvGT4X3GRCZxdhMQv5f2t5WqwG2UHz6BBmRDVtmIwq7olCJxgdy+n8GOHxjP1I3LRV7s6CxAtL1MIS3+uIsswYrp+BOjHBXvjESY+Lm3nDbXayd/PT0ygWjbbl5bdTSRndhQULOzvmkpmdxIrTZO8ww8O71mWuaNRI624qBKO9jQPODoCyBgKVGo2Mo/9EYSzfFDqEKvA0WEmBe8moIa7B2HWqeL+uzSwr6trAE6YajH38/0rFa+pg6w49yJOQ2yMkevSKkasjXbVFsB7dhBpxKJ9tTUOiil/0sDd1SIAmltYiboBiuvtggRd1eSAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzSVwZC4T7EmlDuBOo+cCzHoP3zUSdHBA1XijoS2cBs=;
 b=DVMwxc2zrYXekN3dXIuwYysFPW1khmFwC1MjXlUXlABbT6TbI28zFVbKwFlj8b3sKvKUet8S+/3YEN0e5fINmWKjCopCGmWRfwCTfBeBlgEBQAiRT9+Iah4kcALnTszkTfVP00BMrKusYj6abZrreLQxWPk0YYyjulPf77fqUIatstmHF8Pod5lkAUxwZzByb4HDqLeOyLl4mfJAS9E7BPi0fuKvIWnEJMLvRUZ3v4yBT5M9kpGRMUdf49/wpWeuGrHgtnVXpBaH7D9X40Q01TTDfOASAitLJdK+HSEDYRRudxkXoMtmV9RVfwBEHiLY5IOmM34UboAWB3iXjFbBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzSVwZC4T7EmlDuBOo+cCzHoP3zUSdHBA1XijoS2cBs=;
 b=lSyiNKB/trOfLFPIWO/miRIcuuQypRd1/HLf5Zo4b5ywc/e/8sWRLEYQq3b+XhFQzcpyCjxCbDNx0poRu++tzoJQdGjnpU4PzEr7ntoH3FW9qhHNgz6JC2m+XfiHYpqMIFTRkNRYEnjZXspkoVgqApiEXOMTo6hzkbyeJ1KWzXs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4214.eurprd08.prod.outlook.com (20.178.91.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 14:46:14 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 14:46:14 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com>
 <87a74ngriw.fsf@dusky.pond.sub.org>
 <71ada30b-c72b-6251-cc38-877ddd4156a8@virtuozzo.com>
 <87h7yvx8ce.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200311174610793
Message-ID: <a16e5dee-7f2b-236d-1e71-f40c75cb5902@virtuozzo.com>
Date: Wed, 11 Mar 2020 17:46:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87h7yvx8ce.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0701CA0054.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::22) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0701CA0054.eurprd07.prod.outlook.com (2603:10a6:3:9e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.9 via Frontend Transport; Wed, 11 Mar 2020 14:46:12 +0000
X-Tagtoolbar-Keys: D20200311174610793
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5f4e7e4-c8ce-474d-94c0-08d7c5caf2a6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4214DD13A05AF2526FA4F2B9C1FC0@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(346002)(136003)(366004)(376002)(199004)(36756003)(186003)(7416002)(6916009)(66476007)(16526019)(31686004)(66556008)(6486002)(52116002)(478600001)(86362001)(5660300002)(316002)(8676002)(81156014)(16576012)(81166006)(4326008)(8936002)(31696002)(66946007)(54906003)(2906002)(26005)(2616005)(956004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4214;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2zTuep/AHJIOjfHrqer4fxCsWxiQ7YOHUrYGyPHrhqlOc8TCwPnexfa8/WdSx18co9yz/DD2z/UHBS1CvXWXyZcS4ARMRUXcnAPMu/wibI0riKmv/fRZ192BtqTsoK6g6K/CkOf5sU4CBAJg3bA7vwXDadnIXZjlbDuSSELsZhVfb0OkuSZDHPTKrkuu5cRUSgI4tOMXwooUDU30VQj8hw/KX89nc6DrP5n1Mwgs+XHKDyNSOZeqWQLgeea9Vhf9L4i5ePMYp+BUKkIiDGKdTXmhuYBKjxeoulnpHG7WcgDv3OYalQiPNIi8/8DLbrbFNlcDObbRPCqzULL8OiBLEJwL1+Vn4DeePIfSPoOFKiY4gkuO5PBLX0+XEQIHmql8JiNSVvYeSfMWNzkuoAxyWOV+YivQ364SsuAeluKt5uhemS3/YbaELj3qr4zCe3d
X-MS-Exchange-AntiSpam-MessageData: S8dVByeqhjFM3z/2VGfKa4JS4WWy/kBaP0rOVzDZIENZpVyXtTnoyEzfpyjr5gsCFGiqz2KEQpdHYZ1IvWVc+jR2y06eqDoeYj8VZO9UUo+xauqwd2NowVxuDG8OHhqX/CyIgvOW1jtinEHWo7Erkw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f4e7e4-c8ce-474d-94c0-08d7c5caf2a6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 14:46:14.6270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIKVCGpz21JajaEgVDqpXdbU9ee5DzzdXR9txbo49z72IUtz/KR44HK4XNK0FP46RN1mgeKgg3HFsYKwHnijxbHkRIyXN411CmKMfCIn8Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Subject: Re: [Xen-devel] [PATCH v8 02/10] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTEuMDMuMjAyMCAxNzo0MSwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDExLjAzLjIwMjAgMTI6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gVmxhZGltaXIg
U2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4+
Pgo+Pj4+IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4+PiBT
dWdnZXN0Cj4+Pj4+Cj4+Pj4+ICAgICAgICBzY3JpcHRzOiBDb2NjaW5lbGxlIHNjcmlwdCB0byB1
c2UgYXV0by1wcm9wYWdhdGVkIGVycnAKPj4+Pj4KPj4+Pj4gb3IKPj4+Pj4KPj4+Pj4gICAgICAg
IHNjcmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBFUlJQX0FVVE9fUFJPUEFHQVRFKCkK
Pj4+Pj4KPj4+Pj4gVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0
dW96em8uY29tPiB3cml0ZXM6Cj4+PiBbLi4uXQo+Pj4+Pj4gKy8vIE5vdGUsIHRoYXQgd2UgdXBk
YXRlIGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBtYXRjaGVkIGJ5IHJ1bGUxIGZ1bmN0aW9uIG5hbWUK
Pj4+Pj4+ICsvLyBhbmQgbG9jYWxfZXJyIG5hbWUuIFdlIG1heSBtYXRjaCBzb21ldGhpbmcgbm90
IHJlbGF0ZWQgdG8gdGhlIHBhdHRlcm4KPj4+Pj4+ICsvLyBtYXRjaGVkIGJ5IHJ1bGUxLiBGb3Ig
ZXhhbXBsZSwgbG9jYWxfZXJyIG1heSBiZSBkZWZpbmVkIHdpdGggdGhlIHNhbWUgbmFtZQo+Pj4+
Pj4gKy8vIGluIGRpZmZlcmVudCBibG9ja3MgaW5zaWRlIG9uZSBmdW5jdGlvbiwgYW5kIGluIG9u
ZSBibG9jayBmb2xsb3cgdGhlCj4+Pj4+PiArLy8gcHJvcGFnYXRpb24gcGF0dGVybiBhbmQgaW4g
b3RoZXIgYmxvY2sgZG9lc24ndC4gT3Igd2UgbWF5IGhhdmUgc2V2ZXJhbAo+Pj4+Pj4gKy8vIGZ1
bmN0aW9ucyB3aXRoIHRoZSBzYW1lIG5hbWUgKGZvciBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMp
Lgo+Pj4+Pgo+Pj4+PiBDb250ZXh0OiBydWxlMSBtYXRjaGVzIGZ1bmN0aW9ucyB0aGF0IGhhdmUg
YWxsIHRocmVlIG9mCj4+Pj4+Cj4+Pj4+ICogYW4gRXJyb3IgKiplcnJwIHBhcmFtZXRlcgo+Pj4+
Pgo+Pj4+PiAqIGFuIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMIHZhcmlhYmxlIGRlY2xhcmF0aW9u
Cj4+Pj4+Cj4+Pj4+ICogYW4gZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycikgb3IgZXJy
b3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJycCwKPj4+Pj4gICAgICBsb2NhbF9lcnIsIC4uLikgZXhw
cmVzc2lvbiwgd2hlcmUgQGVycnAgaXMgdGhlIHBhcmFtZXRlciBhbmQKPj4+Pj4gICAgICBAbG9j
YWxfZXJyIGlzIHRoZSB2YXJpYWJsZS4KPj4+Pj4KPj4+Pj4gSWYgSSB1bmRlcnN0YW5kIHlvdSBj
b3JyZWN0bHksIHlvdSdyZSBwb2ludGluZyBvdXQgdHdvIHBvdGVudGlhbCBpc3N1ZXM6Cj4+Pj4+
Cj4+Pj4+IDEuIFRoaXMgcnVsZSBjYW4gbWF0Y2ggZnVuY3Rpb25zIHJ1bGUxIGRvZXMgbm90IG1h
dGNoIGlmIHRoZXJlIGlzCj4+Pj4+IGFub3RoZXIgZnVuY3Rpb24gd2l0aCB0aGUgc2FtZSBuYW1l
IHRoYXQgcnVsZTEgZG9lcyBtYXRjaC4KPj4+Pj4KPj4+Pj4gMi4gVGhpcyBydWxlIG1hdGNoZXMg
aW4gdGhlIGVudGlyZSBmdW5jdGlvbiBtYXRjaGVkIGJ5IHJ1bGUxLCBldmVuIHdoZW4KPj4+Pj4g
cGFydHMgb2YgdGhhdCBmdW5jdGlvbiB1c2UgYSBkaWZmZXJlbnQgQGVycnAgb3IgQGxvY2FsX2Vy
ci4KPj4+Pj4KPj4+Pj4gSSBmaWd1cmUgdGhlc2UgYXBwbHkgdG8gYWxsIHJ1bGVzIHdpdGggaWRl
bnRpZmllciBydWxlMS5mbiwgbm90IGp1c3QKPj4+Pj4gdGhpcyBvbmUuICBDb3JyZWN0Pwo+Pj4+
Pgo+Pj4+PiBSZWdhcmRpbmcgMS4gIFRoZXJlIG11c3QgYmUgYSBiZXR0ZXIgd2F5IHRvIGNoYWlu
IHJ1bGVzIHRvZ2V0aGVyLCBidXQgSQo+Pj4+PiBkb24ndCBrbm93IGl0Lgo+Pj4+Cj4+Pj4gSG1t
LCB3aGF0IGFib3V0IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4KPj4+PiBAcnVsZTEgZGlzYWJs
ZSBvcHRpb25hbF9xdWFsaWZpZXIgZXhpc3RzQAo+Pj4+IGlkZW50aWZpZXIgZm4sIGxvY2FsX2Vy
cjsKPj4+PiBzeW1ib2wgZXJycDsKPj4+PiBAQAo+Pj4+Cj4+Pj4gICAgZm4oLi4uLCBFcnJvciAq
Kgo+Pj4+IC0gZXJycAo+Pj4+ICsgX19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fCj4+Pj4g
ICAgICAgLCAuLi4pCj4+Pj4gICAgewo+Pj4+ICAgICAgICAuLi4KPj4+PiAgICAgICAgRXJyb3Ig
KmxvY2FsX2VyciA9IE5VTEw7Cj4+Pj4gICAgICAgIC4uLgo+Pj4+ICgKPj4+PiAgICAgICBlcnJv
cl9wcm9wYWdhdGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsIC4uLik7Cj4+Pj4gfAo+Pj4+ICAg
ICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+Pj4+ICkKPj4+PiAgICAgICAg
Li4uCj4+Pj4gICAgfQo+Pj4+Cj4+Pj4KPj4+PiBbLi5dCj4+Pj4KPj4+PiBtYXRjaCBzeW1ib2wg
X19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fIGluIGZvbGxvd2luZyBydWxlcyBpbiBmdW5j
dGlvbiBoZWFkZXIKPj4+Pgo+Pj4+IFsuLl0KPj4+Pgo+Pj4+Cj4+Pj4gQCBkaXNhYmxlIG9wdGlv
bmFsX3F1YWxpZmllckAKPj4+PiBpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7Cj4+Pj4gc3ltYm9s
IGVycnA7Cj4+Pj4gQEAKPj4+Pgo+Pj4+ICAgIGZuKC4uLiwgRXJyb3IgKioKPj4+PiAtIF9fX2Vy
cnBfY29jY2luZWxsZV91cGRhdGluZ19fXwo+Pj4+ICsgZXJycAo+Pj4+ICAgICAgICwgLi4uKQo+
Pj4+ICAgIHsKPj4+PiAgICAgICAgLi4uCj4+Pj4gICAgfQo+Pj4+Cj4+Pj4KPj4+PiAtIGhhY2t5
LCBidXQgc2VlbXMgbm90IG1vcmUgaGFja3kgdGhhbiBweXRob24gZGV0ZWN0aW9uLCBhbmQgc2hv
dWxkIHdvcmsgYmV0dGVyCj4+Pgo+Pj4gQXMgc2ltcGxlLCBmb3JjZWZ1bCBhbmQgdW5zdWJ0bGUg
YXMgYSBzbGVkZ2VoYW1tZXIuICBJIGxpa2UgaXQgOikKPj4+Cj4+Cj4+Cj4+IEhtbSwgbm90IHNv
IHNpbXBsZS4KPj4KPj4gSXQgbGVhZHMgdG8gcmVpbmRlbnRpbmcgb2YgZnVuY3Rpb24gaGVhZGVy
LCB3aGljaCBpcyBiYWQuCj4gCj4gQmVjYXVzZSBfX19lcnJwX2NvY2NpbmVsbGVfdXBkYXRpbmdf
X18gaXMgbG9uZ2VyIHRoYW4gZXJycCwgSSBndWVzcy4KPiBUcnkgX19fXz8KCkknbSBhZnJhaWQg
bm90LiBJdCdzIGJlY2F1c2UgaXQganVzdCBhZGRzIFxuLCB3aGVuIEkgZG8KCi4uLiwKCi0gZXJy
cAorIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGluZ19fXwosLi4uCgo+IAo+PiBQb3NzaWJsZSBz
b2x1dGlvbiBpcyBpbnN0ZWFkCj4+Cj4+IGZuKC4uLikKPj4gewo+PiArICAgX19fZXJycF9jb2Nj
aW5lbGxlX3VwZGF0aW5nX19fKCk7Cj4+Cj4+Cj4+IGJ1dCB0aGlzIHNsb3cgZG93biBjb2NjaW5l
bGxlLiBGb3IgZXhhbXBsZSwgb24gYmxvY2suYyBmcm9tIH4zcyB0byAxbTE2cy4KPj4KPj4gLgo+
Pgo+PiBTbywgSSdtIHJldHVybmluZyB0byBqdXN0IGEgd2FybmluZy4KPj4KPj4gSSB0aGluayBz
b21ldGhpbmcgc2ltcGxlIGxpa2UKPj4KPj4gQEAKPj4gaWRlbnRpZmllciBydWxlMS5mbjsKPj4g
cG9zaXRpb24gcCAhPSBydWxlMS5wOwo+PiBAQAo+Pgo+PiBmbkBwKC4uLikgey4uLn0KPj4KPj4g
QCBzY3JpcHQ6cHl0aG9uQAo+Pgo+PiA8cHJpbnQgd2FybmluZz4KPj4KPj4gc2hvdWxkIHdvcmsu
Cj4gCj4gVXAgdG8geW91Lgo+IAoKCi0tIApCZXN0IHJlZ2FyZHMsClZsYWRpbWlyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
