Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C240181ACE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:08:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC1zK-0007qL-Rv; Wed, 11 Mar 2020 14:05:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/gQI=44=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jC1zI-0007qG-H5
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:05:32 +0000
X-Inumbo-ID: 5d84d6ba-63a1-11ea-bec1-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.114]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d84d6ba-63a1-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 14:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxdtm9Le83LHq6H58vka0f8z+Wur4dmNtBxdvKIV/A0/a2iOIzUKkjNaPIViJOkuMwJWJtnqR9e+QCd05AtSj3h0+wPqz0DGwBOrfX1APNi+1w4P59XpSfLpWUJs9OQvtIHhqm6vyrcKyaOZ5Chkb0QyouzC7RNH51uFwApgMoJrMYECgeU1s91XVGH3TfuB4xDgvoBKUgQtCXNoe4x0xKU6SxCisV6v+QuBxoSJEI2VPBxJY+NWMLTJgbQHmfwoqArrVQiFA3bt2tyo+MpJqi/qTjO72lvyii03Xuzrxszr1JR5qGP0HULmIDkF/vSvDcK8CPODDah7HVRZiwr9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdNWddZboibVKNd6sn2CayHx7QjB6YmjHdswUZOo4qk=;
 b=Mo+esbpCcRIT20dhe6enwgozX2paiz8OtONsklj14/Fhb51ZzZgae0xX5iKyLBcRYvSEJmiMMU2N8gw4gLy04bAjBx6tuREKjlE4O7yqMV0bWutd6OvjexxPCCOoV06myo3RVPL3QsjHZWvwCeYpgKBdCvnBjmGn1uiVdiBcPuobFN9HVa1AfIAddh+s/nPPNMURAHaU0yu8B8EwvCybWXg+LRBjjQa/pEuVBhAqs23msst+bVLG6lvPcBotfLmj8qyJ5St6b23zTlrJl6rJpHhp8zz5Gz/jQMr/NjvAfVSL2V5HnHwnuisI8ZtTcyByIAxhypSxM/9yaOOgyGJ3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdNWddZboibVKNd6sn2CayHx7QjB6YmjHdswUZOo4qk=;
 b=Tjw+yfuI9KHtAFxvwn+UJfluBtOPcddikgnse5cWgxihOoeds0AS2RnsqfAvQ5BlHYd7kcgMiBqakyZ9lO/+N8hPMsUoGmGbV0oTKE/WMkKxbjm1SfzUWKZxfmWVd7zwbFcBVblqB7Oi0YaQE5Qg0FzdALJxmO5yUBt6p3pL4sg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3253.eurprd08.prod.outlook.com (52.135.165.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 14:05:28 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 14:05:28 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com>
 <87a74ngriw.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200311170524320
Message-ID: <71ada30b-c72b-6251-cc38-877ddd4156a8@virtuozzo.com>
Date: Wed, 11 Mar 2020 17:05:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87a74ngriw.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0802CA0021.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::31) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0802CA0021.eurprd08.prod.outlook.com (2603:10a6:3:bd::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Wed, 11 Mar 2020 14:05:26 +0000
X-Tagtoolbar-Keys: D20200311170524320
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81d41d6-9a70-47f0-acb9-08d7c5c540ca
X-MS-TrafficTypeDiagnostic: AM6PR08MB3253:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32536A60B1FE5EB6600AC378C1FC0@AM6PR08MB3253.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39850400004)(136003)(366004)(346002)(396003)(376002)(199004)(54906003)(81156014)(81166006)(2906002)(36756003)(316002)(52116002)(16576012)(8676002)(5660300002)(956004)(6486002)(8936002)(66946007)(66556008)(4326008)(31686004)(66476007)(478600001)(7416002)(86362001)(26005)(186003)(2616005)(6916009)(31696002)(16526019);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3253;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCWf3SSKGYw8HEtN9IGSa4I2QxkAi9X7uYWBBIwmSSQR2ALNnM6nLmXwlv4D9g8lKOOU8XvIRHt3YV9f7pX3CGjHQKzrpVICKKu9s++IGB8YnC8R2VKNCwI1cEhMjcDFxs7eCy93tt0FBEf8PqDzidkqtnnTIa7dD0USvXD2FiumQicj/j/sMjalKipHXEsPHJ3Qu19a005pbV1jqAPmHAcnZ22kxf/LPSqoJdUuPcMo2O6kVp60Q/7efRt92od0HkFjIO/1LIuFBfT0hGZVx6tp43PV92/0ArmA9tpbxm9kWy+zlCwA4ZhEwo7+FRsQlh7VwC5ITwRX8A8gaJ/ssPfty7T2DyVBOdIuKfjvpz51rk5QXynJaThXpmnzIxpRjIki2vO1gfN8YFbcEKrJUqRJ+IVLZ8pLCrtjS0BFjhHIouaIl0Y1o+UOprMMFEPq
X-MS-Exchange-AntiSpam-MessageData: DmADZP0MdiY4aIo9RrpvTooL8VYa94lr4hAHU5cgf/NQgbCgbGpyrSPZDJz4EnGOj6QUWhCveXpcgSDh3talH5/f65F++KxFkZRnrRgyBn5ZVj7w3uBLN22i2ktIFm1Q3/c7YeVNrdWlQxAdnNWh6Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81d41d6-9a70-47f0-acb9-08d7c5c540ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 14:05:28.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v48qwGu3nrzx1/lRhYWp/LltieU+A8XPZXiApWvPGjLecQC33UuRjCytUu/JW5kR5cWaY0FiN46D8vIgtf2dfcNg6KMRmTriyOm3IHwZsDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3253
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTEuMDMuMjAyMCAxMjozOCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gU3VnZ2VzdAo+
Pj4KPj4+ICAgICAgIHNjcmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBhdXRvLXByb3Bh
Z2F0ZWQgZXJycAo+Pj4KPj4+IG9yCj4+Pgo+Pj4gICAgICAgc2NyaXB0czogQ29jY2luZWxsZSBz
Y3JpcHQgdG8gdXNlIEVSUlBfQVVUT19QUk9QQUdBVEUoKQo+Pj4KPj4+IFZsYWRpbWlyIFNlbWVu
dHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4gd3JpdGVzOgo+IFsuLi5d
Cj4+Pj4gKy8vIE5vdGUsIHRoYXQgd2UgdXBkYXRlIGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBtYXRj
aGVkIGJ5IHJ1bGUxIGZ1bmN0aW9uIG5hbWUKPj4+PiArLy8gYW5kIGxvY2FsX2VyciBuYW1lLiBX
ZSBtYXkgbWF0Y2ggc29tZXRoaW5nIG5vdCByZWxhdGVkIHRvIHRoZSBwYXR0ZXJuCj4+Pj4gKy8v
IG1hdGNoZWQgYnkgcnVsZTEuIEZvciBleGFtcGxlLCBsb2NhbF9lcnIgbWF5IGJlIGRlZmluZWQg
d2l0aCB0aGUgc2FtZSBuYW1lCj4+Pj4gKy8vIGluIGRpZmZlcmVudCBibG9ja3MgaW5zaWRlIG9u
ZSBmdW5jdGlvbiwgYW5kIGluIG9uZSBibG9jayBmb2xsb3cgdGhlCj4+Pj4gKy8vIHByb3BhZ2F0
aW9uIHBhdHRlcm4gYW5kIGluIG90aGVyIGJsb2NrIGRvZXNuJ3QuIE9yIHdlIG1heSBoYXZlIHNl
dmVyYWwKPj4+PiArLy8gZnVuY3Rpb25zIHdpdGggdGhlIHNhbWUgbmFtZSAoZm9yIGRpZmZlcmVu
dCBjb25maWd1cmF0aW9ucykuCj4+Pgo+Pj4gQ29udGV4dDogcnVsZTEgbWF0Y2hlcyBmdW5jdGlv
bnMgdGhhdCBoYXZlIGFsbCB0aHJlZSBvZgo+Pj4KPj4+ICogYW4gRXJyb3IgKiplcnJwIHBhcmFt
ZXRlcgo+Pj4KPj4+ICogYW4gRXJyb3IgKmxvY2FsX2VyciA9IE5VTEwgdmFyaWFibGUgZGVjbGFy
YXRpb24KPj4+Cj4+PiAqIGFuIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpIG9yIGVy
cm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsCj4+PiAgICAgbG9jYWxfZXJyLCAuLi4pIGV4cHJl
c3Npb24sIHdoZXJlIEBlcnJwIGlzIHRoZSBwYXJhbWV0ZXIgYW5kCj4+PiAgICAgQGxvY2FsX2Vy
ciBpcyB0aGUgdmFyaWFibGUuCj4+Pgo+Pj4gSWYgSSB1bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHks
IHlvdSdyZSBwb2ludGluZyBvdXQgdHdvIHBvdGVudGlhbCBpc3N1ZXM6Cj4+Pgo+Pj4gMS4gVGhp
cyBydWxlIGNhbiBtYXRjaCBmdW5jdGlvbnMgcnVsZTEgZG9lcyBub3QgbWF0Y2ggaWYgdGhlcmUg
aXMKPj4+IGFub3RoZXIgZnVuY3Rpb24gd2l0aCB0aGUgc2FtZSBuYW1lIHRoYXQgcnVsZTEgZG9l
cyBtYXRjaC4KPj4+Cj4+PiAyLiBUaGlzIHJ1bGUgbWF0Y2hlcyBpbiB0aGUgZW50aXJlIGZ1bmN0
aW9uIG1hdGNoZWQgYnkgcnVsZTEsIGV2ZW4gd2hlbgo+Pj4gcGFydHMgb2YgdGhhdCBmdW5jdGlv
biB1c2UgYSBkaWZmZXJlbnQgQGVycnAgb3IgQGxvY2FsX2Vyci4KPj4+Cj4+PiBJIGZpZ3VyZSB0
aGVzZSBhcHBseSB0byBhbGwgcnVsZXMgd2l0aCBpZGVudGlmaWVyIHJ1bGUxLmZuLCBub3QganVz
dAo+Pj4gdGhpcyBvbmUuICBDb3JyZWN0Pwo+Pj4KPj4+IFJlZ2FyZGluZyAxLiAgVGhlcmUgbXVz
dCBiZSBhIGJldHRlciB3YXkgdG8gY2hhaW4gcnVsZXMgdG9nZXRoZXIsIGJ1dCBJCj4+PiBkb24n
dCBrbm93IGl0Lgo+Pgo+PiBIbW0sIHdoYXQgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4K
Pj4gQHJ1bGUxIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPj4gaWRlbnRpZmll
ciBmbiwgbG9jYWxfZXJyOwo+PiBzeW1ib2wgZXJycDsKPj4gQEAKPj4KPj4gICBmbiguLi4sIEVy
cm9yICoqCj4+IC0gZXJycAo+PiArIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGluZ19fXwo+PiAg
ICAgICwgLi4uKQo+PiAgIHsKPj4gICAgICAgLi4uCj4+ICAgICAgIEVycm9yICpsb2NhbF9lcnIg
PSBOVUxMOwo+PiAgICAgICAuLi4KPj4gKAo+PiAgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5k
KGVycnAsIGxvY2FsX2VyciwgLi4uKTsKPj4gfAo+PiAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJw
LCBsb2NhbF9lcnIpOwo+PiApCj4+ICAgICAgIC4uLgo+PiAgIH0KPj4KPj4KPj4gWy4uXQo+Pgo+
PiBtYXRjaCBzeW1ib2wgX19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fIGluIGZvbGxvd2lu
ZyBydWxlcyBpbiBmdW5jdGlvbiBoZWFkZXIKPj4KPj4gWy4uXQo+Pgo+Pgo+PiBAIGRpc2FibGUg
b3B0aW9uYWxfcXVhbGlmaWVyQAo+PiBpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7Cj4+IHN5bWJv
bCBlcnJwOwo+PiBAQAo+Pgo+PiAgIGZuKC4uLiwgRXJyb3IgKioKPj4gLSBfX19lcnJwX2NvY2Np
bmVsbGVfdXBkYXRpbmdfX18KPj4gKyBlcnJwCj4+ICAgICAgLCAuLi4pCj4+ICAgewo+PiAgICAg
ICAuLi4KPj4gICB9Cj4+Cj4+Cj4+IC0gaGFja3ksIGJ1dCBzZWVtcyBub3QgbW9yZSBoYWNreSB0
aGFuIHB5dGhvbiBkZXRlY3Rpb24sIGFuZCBzaG91bGQgd29yayBiZXR0ZXIKPiAKPiBBcyBzaW1w
bGUsIGZvcmNlZnVsIGFuZCB1bnN1YnRsZSBhcyBhIHNsZWRnZWhhbW1lci4gIEkgbGlrZSBpdCA6
KQo+IAoKCkhtbSwgbm90IHNvIHNpbXBsZS4KCkl0IGxlYWRzIHRvIHJlaW5kZW50aW5nIG9mIGZ1
bmN0aW9uIGhlYWRlciwgd2hpY2ggaXMgYmFkLgoKUG9zc2libGUgc29sdXRpb24gaXMgaW5zdGVh
ZAoKZm4oLi4uKQp7CisgICBfX19lcnJwX2NvY2NpbmVsbGVfdXBkYXRpbmdfX18oKTsKCgpidXQg
dGhpcyBzbG93IGRvd24gY29jY2luZWxsZS4gRm9yIGV4YW1wbGUsIG9uIGJsb2NrLmMgZnJvbSB+
M3MgdG8gMW0xNnMuCgouCgpTbywgSSdtIHJldHVybmluZyB0byBqdXN0IGEgd2FybmluZy4KCkkg
dGhpbmsgc29tZXRoaW5nIHNpbXBsZSBsaWtlCgpAQAppZGVudGlmaWVyIHJ1bGUxLmZuOwpwb3Np
dGlvbiBwICE9IHJ1bGUxLnA7CkBACgpmbkBwKC4uLikgey4uLn0KCkAgc2NyaXB0OnB5dGhvbkAK
CjxwcmludCB3YXJuaW5nPgoKc2hvdWxkIHdvcmsuCgotLSAKQmVzdCByZWdhcmRzLApWbGFkaW1p
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
