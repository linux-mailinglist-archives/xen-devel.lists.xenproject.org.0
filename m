Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41C16BDDF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 10:51:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Wp0-0004y3-EH; Tue, 25 Feb 2020 09:48:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=74be=4N=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1j6Woy-0004xy-85
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 09:48:08 +0000
X-Inumbo-ID: eb86f66a-57b3-11ea-92c2-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.107]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb86f66a-57b3-11ea-92c2-12813bfff9fa;
 Tue, 25 Feb 2020 09:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQs3eHUzwP0B8ainXtPMy0zbPWvP/6dVBWN10jizORrSrvu0ThUQV6EKoetM67UDANjhcqs0uzFsdZN9lxL8pTP4mexgNEdlp4r+0noU4wooYnmbddU6E84My20reJK37CWBI2jbR55VY+9muZzdaOb0VeR1PAHA6OJPH1Eaeg6w0uaZ7BmIYf2x2bhe5j9gWEaU0YxG/aL7CGK35hMghzmbZr1Kqbt18gm8waTBAxadvwUlZr50KfwZcgmNv8yANmwdm2I8Qxth5rHLMor8GLoIfMN/H0B2+6y2PW05+zKvKoEd2puXDfmccu72OD4xoYk27cmrvLtc90LMwFglnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzFzDdFhNuYA0H1WYMx7O2tIPlVjTUw4Ta9jGgofKbo=;
 b=LuJ/Nf0giYmZaRhN3teNBmNZC5+p/oYtzzNT0cgHQhGrUgteiiad+wIFcO1mGiuWuZYRnSCsxnmgpUtqkoxazSrFbX8Rsy4M6ijKw/NgQ45dZXvjf4jB3g/uABiiJk+39v7w5Ji0OmT8Cion4F4+R1EnYcmTIc9maN/VmNKImP4G06XCOjzjOuHVudPt1qwFXVB4tXGG6G0XHoTsn6yA8o2OcSjEyug51/tp+oOCD+n1vZmzmZPoJqy8wMT9em7TNbq+DATOVnkGcPbzKtQREAVXlabgFOE7iH/myEB94vQmcy4+si1Ib6xH5qy7bMFq02Qm1A9GI9juo5USZRQVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzFzDdFhNuYA0H1WYMx7O2tIPlVjTUw4Ta9jGgofKbo=;
 b=QCR75oqw0Mc3PjAFd1wvT93YBrykiaJcqSn0YHxI2QF5HlUXSS+xNyJINvtv3zbgbmKKTQBpcxgDVeeH1bqoolXbqdMMlAnTKLt5YpVffSsiuHKAUp7WBy1QXZQYxWe6yWrFapg8RzDKDiLMPsfFGcgfdr84BjugLt6Pfgj1YnQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3303.eurprd08.prod.outlook.com (52.135.161.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 09:48:05 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 09:48:05 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
 <875zfz6gsh.fsf@dusky.pond.sub.org>
 <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com>
 <87sgj31140.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200225124802252
Message-ID: <4da07feb-5c78-8a09-8d88-c324c76ebc02@virtuozzo.com>
Date: Tue, 25 Feb 2020 12:48:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87sgj31140.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::34) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0502CA0024.eurprd05.prod.outlook.com (2603:10a6:3:e3::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 09:48:04 +0000
X-Tagtoolbar-Keys: D20200225124802252
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f947fbd6-4ff9-417f-4a91-08d7b9d7cfb5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3303:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33034B30FBB81CB81D6DA906C1ED0@AM6PR08MB3303.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(396003)(39850400004)(136003)(366004)(376002)(346002)(189003)(199004)(956004)(2616005)(26005)(6486002)(316002)(66476007)(66556008)(7416002)(186003)(16576012)(16526019)(66946007)(478600001)(31696002)(2906002)(54906003)(5660300002)(86362001)(52116002)(81156014)(8936002)(31686004)(8676002)(6916009)(36756003)(81166006)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3303;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akj98jl3JKy7yMQ9LuIxebm1X/gR3djWHI9z2zNxEa0pV7u9jugv0dvQv9o/QC+PXqMEDe/uF8GpRlavRWcScILGLJ3VdmxIEsWiS8tX+xTR0cPMrym+T/XWQOEASvsBgyr/GQYC4ng2P17ztZNv34d2gE3k8q6EMCBFkG4gK+60tAfyyuMfuzmke6dhBeXwDomXlzGe19K0qro20HZ9/Z6GBfcxW74JTtr8C9XMeNmEEt5/mwjLw/bF4lN4WdBOyi5poFGu+M1g7G2DzEgPDdwhRBRodARutCU7Fmcp7tnYukTWfLBIIhKHSn2j4TWX2/2oVAVL6yMJCwgynBg1n0aB0C5xuBFLSh5uA9Ulu09Nw1xkfPyoKAo1YJirYKl7s1c8fW5DsyG2la3ZuqWi2HqLzFGYKyJzjho+jf9CNC1oJvzRVywOxrDBa552y+m9
X-MS-Exchange-AntiSpam-MessageData: rR2l7kte+Gbo27oyz08nd+nzzBQDwfDE366t0u6yircd7AI7bOIpgbrU6GCYSGm8sB0lQSwX23dDRDE+WbfBu9K8oTCijYRZfCl6JrwM0OL8Re+6OWxeshOalNMBpcL8jPXDTic/b+NNuAKoeUOhPA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f947fbd6-4ff9-417f-4a91-08d7b9d7cfb5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 09:48:05.1635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7WBzBlpC+LXitylKP9EToDlsPb2r+zQs8L9MPYq6oQehMULH2n2EpXsRI01nIad+nQRM3ihL/QDbI91VBeJ+iwk2bZjrLGhU9v4SZ/4pg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3303
Subject: Re: [Xen-devel] [PATCH v7 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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
 Laszlo Ersek <lersek@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MjIuMDIuMjAyMCAxMToyMywgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDIxLjAyLjIwMjAgMTk6MzQsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gVmxhZGltaXIg
U2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4+
Pgo+Pj4+IDIxLjAyLjIwMjAgMTA6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4+Pj4KPj4+Pj4+IEFkZCBmdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBj
YWxsIGNvcnJlc3BvbmRpbmcgRXJyb3IgKmVycgo+Pj4+Pj4gY2xlYW5pbmcgZnVuY3Rpb24gYW4g
c2V0IHBvaW50ZXIgdG8gTlVMTC4KPj4+Pj4+Cj4+Pj4+PiBOZXcgZnVuY3Rpb25zOgo+Pj4+Pj4g
ICAgICBlcnJvcl9mcmVlX2VycnAKPj4+Pj4+ICAgICAgZXJyb3JfcmVwb3J0X2VycnAKPj4+Pj4+
ICAgICAgd2Fybl9yZXBvcnRfZXJycAo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFZsYWRp
bWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KPj4+Pj4+
IFJldmlld2VkLWJ5OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+Pj4+Pj4gUmV2aWV3ZWQt
Ynk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+Pgo+Pj4+
Pj4gQ0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgo+Pj4+Pj4gQ0M6IEtldmluIFdv
bGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4+Pj4+PiBDQzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0
LmNvbT4KPj4+Pj4+IENDOiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+Pj4+Pj4gQ0M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+Pj4+IENDOiBBbnRo
b255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+Pj4+IENDOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KPj4+Pj4+IENDOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+Cj4+Pj4+PiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1k
QHJlZGhhdC5jb20+Cj4+Pj4+PiBDQzogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4K
Pj4+Pj4+IENDOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4+Pj4+IENDOiBT
dGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LmlibS5jb20+Cj4+Pj4+PiBDQzogTWFya3VzIEFy
bWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+Pj4+Pj4gQ0M6IE1pY2hhZWwgUm90aCA8bWRy
b3RoQGxpbnV4LnZuZXQuaWJtLmNvbT4KPj4+Pj4+IENDOiBxZW11LWJsb2NrQG5vbmdudS5vcmcK
Pj4+Pj4+IENDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+Pj4+Cj4+Pj4+PiAg
ICAgaW5jbHVkZS9xYXBpL2Vycm9yLmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgK
Pj4+Pj4+IGluZGV4IGFkNWI2ZTg5NmQuLmQzNDk4NzE0OGQgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9p
bmNsdWRlL3FhcGkvZXJyb3IuaAo+Pj4+Pj4gKysrIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPj4+
Pj4+IEBAIC0zMDksNiArMzA5LDMyIEBAIHZvaWQgd2Fybl9yZXBvcnRmX2VycihFcnJvciAqZXJy
LCBjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+Pj4+ICAgICB2b2lkIGVycm9yX3JlcG9ydGZfZXJy
KEVycm9yICplcnIsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4gICAgICAgICBHQ0NfRk1U
X0FUVFIoMiwgMyk7Cj4+Pj4+PiAgICAgKy8qCj4+Pj4+PiArICogRnVuY3Rpb25zIHRvIGNsZWFu
IEVycm9yICoqZXJycDogY2FsbCBjb3JyZXNwb25kaW5nIEVycm9yICplcnIgY2xlYW5pbmcKPj4+
Pj4+ICsgKiBmdW5jdGlvbiwgdGhlbiBzZXQgcG9pbnRlciB0byBOVUxMLgo+Pj4+Pj4gKyAqLwo+
Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9mcmVlX2VycnAoRXJyb3IgKiplcnJwKQo+
Pj4+Pj4gK3sKPj4+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+Pj4+Pj4gKyAgICBl
cnJvcl9mcmVlKCplcnJwKTsKPj4+Pj4+ICsgICAgKmVycnAgPSBOVUxMOwo+Pj4+Pj4gK30KPj4+
Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfcmVwb3J0X2VycnAoRXJyb3Ig
KiplcnJwKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+Pj4+
Pj4gKyAgICBlcnJvcl9yZXBvcnRfZXJyKCplcnJwKTsKPj4+Pj4+ICsgICAgKmVycnAgPSBOVUxM
Owo+Pj4+Pj4gK30KPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBv
cnRfZXJycChFcnJvciAqKmVycnApCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBhc3NlcnQoZXJycCAm
JiAqZXJycCk7Cj4+Pj4+PiArICAgIHdhcm5fcmVwb3J0X2VycigqZXJycCk7Cj4+Pj4+PiArICAg
ICplcnJwID0gTlVMTDsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArCj4+Pj4+PiAgICAgLyoK
Pj4+Pj4+ICAgICAgKiBKdXN0IGxpa2UgZXJyb3Jfc2V0ZygpLCBleGNlcHQgeW91IGdldCB0byBz
cGVjaWZ5IHRoZSBlcnJvciBjbGFzcy4KPj4+Pj4+ICAgICAgKiBOb3RlOiB1c2Ugb2YgZXJyb3Ig
Y2xhc3NlcyBvdGhlciB0aGFuIEVSUk9SX0NMQVNTX0dFTkVSSUNfRVJST1IgaXMKPj4+Pj4KPj4+
Pj4gVGhlc2UgYXBwZWFyIHRvIGJlIHVudXNlZCBhcGFydCBmcm9tIHRoZSBDb2NjaW5lbGxlIHNj
cmlwdCBpbiBQQVRDSCAwMy4KPj4+Pj4KPj4+Pj4gVGhleSBhcmUgdXNlZCBpbiB0aGUgZnVsbCAi
W1JGQyB2NSAwMDAvMTI2XSBlcnJvcjogYXV0byBwcm9wYWdhdGVkCj4+Pj4+IGxvY2FsX2VyciIg
c2VyaWVzLiAgT3B0aW9uczoKPj4+Pj4KPj4+Pj4gMS4gUGljayBhIGZldyBtb3JlIHBhdGNoZXMg
aW50byB0aGlzIHBhcnQgSSBzZXJpZXMsIHNvIHRoZXNlIGd1eXMgY29tZQo+Pj4+PiAgICAgICB3
aXRoIHVzZXJzLgo+Pj4+Cj4+Pj4gSXQgbmVlZHMgc29tZSBhZGRpdGlvbmFsIGVmZm9ydCBmb3Ig
dGhpcyBzZXJpZXMuLiBCdXQgaXQncyBwb3NzaWJsZS4gU3RpbGwsCj4+Pj4gSSB0aGluayB0aGF0
IHdlIGF0IGxlYXN0IHNob3VsZCBub3QgcHVsbCBvdXQgcGF0Y2hlcyB3aGljaCBzaG91bGQgYmUg
aW4KPj4+PiBmdXR1cmUgc2VyaWVzIChmb3IgZXhhbXBsZSBmcm9tIHBwYyBvciBibG9jay8pLi4K
Pj4+Cj4+PiBZZXMsIHdlIHdhbnQgdG8ga2VlcCByZWxhdGVkIHN0dWZmIHRvZ2V0aGVyLgo+Pj4K
Pj4+PiBHcmVwcGluZyB0aHJvdWdoIHY1Ogo+Pj4+ICAgIGZvciB4IGluIHt3YXJuX3JlcG9ydF9l
cnJwLGVycm9yX3JlcG9ydF9lcnJwLGVycm9yX2ZyZWVfZXJycH07IGRvIGVjaG8gPT0gJHggPT07
IGdpdCBncmVwIC1sICR4IHwgZ3JlcCAtdiBjb2NjaW5lbGxlIHwgZ3JlcCAtdiAnZXJyb3JcLmgn
OyBlY2hvOyBkb25lCj4+Pj4gPT0gd2Fybl9yZXBvcnRfZXJycCA9PQo+Pj4+IGJsb2NrL2ZpbGUt
cG9zaXguYwo+Pj4+IGh3L3BwYy9zcGFwci5jCj4+Pj4gaHcvcHBjL3NwYXByX2NhcHMuYwo+Pj4+
IGh3L3BwYy9zcGFwcl9pcnEuYwo+Pj4+IGh3L3ZmaW8vcGNpLmMKPj4+PiBuZXQvdGFwLmMKPj4+
PiBxb20vb2JqZWN0LmMKPj4+Pgo+Pj4+ID09IGVycm9yX3JlcG9ydF9lcnJwID09Cj4+Pj4gaHcv
YmxvY2svdmhvc3QtdXNlci1ibGsuYwo+Pj4+IHV0aWwvb3NsaWItcG9zaXguYwo+Pj4+Cj4+Pj4g
PT0gZXJyb3JfZnJlZV9lcnJwID09Cj4+Pj4gYmxvY2suYwo+Pj4+IGJsb2NrL3FhcGkuYwo+Pj4+
IGJsb2NrL3NoZWVwZG9nLmMKPj4+PiBibG9jay9zbmFwc2hvdC5jCj4+Pj4gYmxvY2tkZXYuYwo+
Pj4+IGNoYXJkZXYvY2hhci1zb2NrZXQuYwo+Pj4+IGh3L2F1ZGlvL2ludGVsLWhkYS5jCj4+Pj4g
aHcvY29yZS9xZGV2LXByb3BlcnRpZXMuYwo+Pj4+IGh3L3BjaS1icmlkZ2UvcGNpX2JyaWRnZV9k
ZXYuYwo+Pj4+IGh3L3BjaS1icmlkZ2UvcGNpZV9wY2lfYnJpZGdlLmMKPj4+PiBody9zY3NpL21l
Z2FzYXMuYwo+Pj4+IGh3L3Njc2kvbXB0c2FzLmMKPj4+PiBody91c2IvaGNkLXhoY2kuYwo+Pj4+
IGlvL25ldC1saXN0ZW5lci5jCj4+Pj4gbWlncmF0aW9uL2NvbG8uYwo+Pj4+IHFnYS9jb21tYW5k
cy1wb3NpeC5jCj4+Pj4gcWdhL2NvbW1hbmRzLXdpbjMyLmMKPj4+PiB1dGlsL3FlbXUtc29ja2V0
cy5jCj4+Pj4KPj4+PiBXaGF0IGRvIHlvdSB3YW50IHRvIGFkZD8KPj4+Cj4+PiBQQVRDSCB2NSAw
MzIgdXNlcyBib3RoIGVycm9yX3JlcG9ydF9lcnJwKCkgYW5kIGVycm9yX2ZyZWVfZXJycCgpLgo+
Pj4gQWRkaW5nIHdhcm5fcmVwb3J0X2VycnAoKSB3aXRob3V0IGEgdXNlciBpcyBva2F5IHdpdGgg
bWUuICBXaGF0IGRvIHlvdQo+Pj4gdGhpbms/Cj4+Pgo+Pj4gSWYgdGhlcmUgYXJlIHBhdGNoZXMg
eW91IGNvbnNpZGVyIHJlbGF0ZWQgdG8gMDMyLCBmZWVsIGZyZWUgdG8gdGhyb3cKPj4+IHRoZW0g
aW4uCj4+Cj4+IDAzMiBpcyBxZ2EvY29tbWFuZHMtd2luMzIuYyBhbmQgdXRpbC9vc2xpYi1wb3Np
eC5jCj4+Cj4+IFNlZW1zIHRoYXQgdGhleSBhcmUgd3JvbmdseSBncm91cGVkIGludG8gb25lIHBh
dGNoLgo+Pgo+PiBxZ2EvY29tbWFuZHMtd2luMzIuYyBtYXRjaGVzIHFnYS8gKE1pY2hhZWwgUm90
aCkKPj4gYW5kICB1dGlsL29zbGliLXBvc2l4LmMgbWF0Y2hlcyBQT1NJWCAoUGFvbG8gQm9uemlu
aSkKPj4KPj4gU28sIGl0IHNob3VsZCBiZSB0d28gc2VwYXJhdGUgcGF0Y2hlcyBhbnl3YXkuCj4+
Cj4+IEZvciBbMS5dIEkgb25seSBhZnJhaWQgdGhhdCB3ZSdsbCBoYXZlIHRvIHdhaXQgZm9yIG1h
aW50YWluZXJzLCB3aG8gd2VyZQo+PiBub3QgaW50ZXJlc3RlZCBpbiBwcmV2aW91cyBpdGVyYXRp
b25zLCB0byByZXZpZXcgdGhlc2UgbmV3IHBhdGNoZXMuLgo+IAo+IFdlIHdvbid0Lgo+IAo+IFdl
IHNob3VsZCBhbmQgd2Ugd2lsbCBnaXZlIGV2ZXJ5IG1haW50YWluZXIgYSBjaGFuY2UgdG8gcmV2
aWV3IHRoZXNlCj4gcGF0Y2hlcywgZXZlbiB0aG91Z2ggdGhlIGNoYW5nZXMgYXJlIG1lY2hhbmlj
YWwuICBNYWludGFpbmVycyBhcmUgZnJlZQo+IHRvIGRlY2xpbmUgb3IgaWdub3JlIHRoaXMgb2Zm
ZXIuICBJIHdpbGwgZmVlbCBmcmVlIHRvIGludGVycHJldCB0aGF0IGFzCj4gImdvIGFoZWFkIGFu
ZCBtZXJnZSB0aGlzIHRocm91Z2ggeW91ciB0cmVlIi4KPiAKPiBJbiBmYWN0LCBJIGZ1bGx5IGV4
cGVjdCB0aGUgYnVsayBvZiB0aGUgY2hhbmdlcyB0byBnbyB0aHJvdWdoIG15IHRyZWUuCj4gQ2hh
c2luZyB1bXB0ZWVuIG1haW50YWluZXJzIGZvciBlYWNoIG9uZSB0byBtZXJnZSBhIHRyaXZpYWwg
cGFydCBvZiB0aGlzCj4gbWFzc2l2ZSB0cmVlLXdpZGUgY2hhbmdlIHdvdWxkIHRha2UgYWdlcyBh
bmQgYWNjb21wbGlzaCBub3RoaW5nLgo+IAo+IFsuLi5dCj4gCgpIbW0sIHRoZW4gT0suIEknbGwg
YWRkIHRoZXNlIHR3byBwYXRjaGVzLi4gU3RpbGwsIHlvdSBwb2ludGVkIG1pc3NlZCBpbiBjb2Nj
aSBzY3JpcHQKY2FzZXMgYWJvdXQgZXJyb3JfcmVwb3J0Zl9lcnIoKSBhbmQgd2Fybl9yZXBvcnRm
X2VycigpLi4uIEknbSBhZnJhaWQgd2UganVzdCBkb24ndCBoYXZlCmNvcnJlc3BvbmRpbmcgZmls
ZXMsIGFuZCB0aGVyZWZvcmUgZG9uJ3Qgd2FudCB0byBhZGQgdW51c2VkIGVycnAgd3JhcHBlcnMg
Zm9yIHRoZW0uLgoKLS0gCkJlc3QgcmVnYXJkcywKVmxhZGltaXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
