Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3B188909
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:20:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDxj-0001fQ-3G; Tue, 17 Mar 2020 15:16:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fiuw=5C=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jEDxi-0001fL-1d
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 15:16:58 +0000
X-Inumbo-ID: 5604bd90-6862-11ea-bec1-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::71c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5604bd90-6862-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 15:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVEMCZv+ONK07qBJgPkDvTM7RfSk14a96c/4EdMRjEk2qkLwlnlbin8YNC8cjTbzsKHvAuZ6djMytumFOBdA1RnWR5XDv2Y9IBpl/gxvH2xCNuXBc88OddZv2PfMlQPjF64Wc06q+3QSdWlLzgcF7aZL/MxYuL//pCsLIdYgbbkJs+DHU/cxGl6AH405iFIg1x8qM8vWpf+W0DWFeYnLoqqB1dHtE8pK2IePTd57j2/jR1ZTYCG9SQ1LoFpRzGZzgMtgi1ko8aBHDI1JOGmkToWTcDFtoFbzxmCTTH80/U9EFA7STRjFfEdbff2y/b79qSZ4mLXwFP9k5D+P7Tejsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUsq6mR0U4wxUIuZKye6yt7jGndO+qzgMrMfGLSdFzs=;
 b=m2H59Chm4uAtheuYGErpNynN7uDHT5suK0H/yOAzedwxRPlB4O/MCkaEFU+lm/bN/VxsklJrZjbl5LkvOE81rcerCbhAzm0CRwK3JU64PztAuybTWEOu5hv3YZfvSRPr3rCexopcURqN9kfjdVpf+MsajkdahWObdrO6LK2LyTMzjnU84Y9IeLC8waJJ16Fz+2Q0HpdlfjxxAnlNcVDbflHzZoYgYchwOFMz6cOH/xi9prY+KngRyAX3jgmQLaUJz8DLu4q3B6OkUSraUoGjSPw3XV5SrtdN93d7MrJfOhQgJUDol4eB0wcv9ml9W+kxAZvwhCTPKfqYwjyfYlE4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUsq6mR0U4wxUIuZKye6yt7jGndO+qzgMrMfGLSdFzs=;
 b=pIzDgNM2VRDqJKmtTS+3vuiKCPjx5qNugj8Qd5qwm6+Y8evLDosUb29ZcE6Ldo+mstbzhRd6RNv68z9TqvkBKLBZ1hBagPzQESWL1fibEMyyezXKN7bODXoW0TepHkPZupLRO30Z5IoJVv5aCEV/+5xP+M4fIlZx783FQlUNSeE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2620.eurprd08.prod.outlook.com (10.175.36.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Tue, 17 Mar 2020 15:16:52 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2814.021; Tue, 17 Mar
 2020 15:16:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Mar 2020 18:16:16 +0300
Message-Id: <20200317151625.20797-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
X-ClientProxiedBy: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.248) by
 AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Tue, 17 Mar 2020 15:16:50 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.248]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600065ec-ee0e-4cbc-097b-08d7ca8638aa
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2620DB66CA79529558EFB236C1F60@HE1PR0802MB2620.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(199004)(66946007)(6666004)(1076003)(66556008)(54906003)(66476007)(86362001)(6486002)(16526019)(5660300002)(6916009)(186003)(966005)(6506007)(52116002)(4326008)(81166006)(6512007)(81156014)(8676002)(8936002)(316002)(7416002)(2906002)(26005)(478600001)(956004)(36756003)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0802MB2620;
 H:HE1PR0802MB2507.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54KyzpFy68TOS/M26bHvYqYr+edhElwjXOkwblYZ+sZGwOPh2PEpf9PetGsWmuPqsi+DighC/gjgkh3GweeLsTpXRu/NCiiNgf3hhpJOmpXDT54nxvwxM16S7bgFSJs8KHuxDZk2cPLlg58wM3hgwz/uXKlPG90GFvqBOFNweN6L6xG5QA4VpDWbnoNtv6DwymbxMva/X1yj0ItPZ9JNsYWTWVy2F5i/0fO9aVdGC9mg/vNbc8b/eiqpW00kX00FflmwkKxO2sz1EBSBQnK1k0jEbN6GgkmsL4xNKHwiCijx1cQxLbC2sdeBF+wuNekxzkAO8VXQ/uyWEMDTYzHWBn5a89jGZ7Se/1EsclVKaV+TNIv6LETjngY/RUu1wG5fq7sYxWAwMnn02Q+GdjI+vXcxtvCaoNrkUmxI5+ZX+mJk5iZnV4kfcD8gpIwtSluIo0SR7MEza+ouRnO6DZOE3QqYHVXiyD5aJncvaBISy9xi71rdO6PiRmNUcsir0dZpyef1yQHDMmb3Q+10P5EVKQ==
X-MS-Exchange-AntiSpam-MessageData: PZD43QbGR8vV34Dyn87Fuija2za1kCvIDdC1uU3+mFdKUlxZc4JGoXFhr/34jPsM7GU7Z7bKDqHBau+9wuiQRZq0lTHshQoQrpsfnpOJ7lMaYxpSddcz738q4sIpBRWScEMhT/LNVaEmP0QWigOT+g==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600065ec-ee0e-4cbc-097b-08d7ca8638aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 15:16:52.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2KMNcUJV88TNrSh52fl28gvkv+nKshGiDpzqkUec9IcJhl0b+OKxvXqUiy0Uj0xalvK8ViNOXhep5LqrKtRZsQYb49KNb9MSOQDIUPIOV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2620
Subject: [Xen-devel] [PATCH v10 0/9] error: auto propagated local_err part I
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 armbru@redhat.com, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

djEwOiAoYmFzZWQtb24gIltQQVRDSCAwLzNdIE1pbm9yIGVycm9yIGhhbmRsaW5nIGNsZWFudXBz
IiBpbmNsdWRpbmcgbXkgNC8zIGluIGl0KQowMjogQ2hhbmdlIHNvbWUgY29tbWVudHMuCiAgICBE
byBub3QgY2hhaW4gY2hlY2sxIGFuZCBjaGVjazIgcnVsZXMgdG8gcnVsZTEgdG8gY292ZXIgbW92
ZQogICAgdW51c3VhbCBjYXNlcyB0byB3YXJuIGFib3V0LgogICAgQWRkIHBvc2l0aW9ucyB0byBj
aGVjazEgcnVsZS4KICAgIE1vdmUgY2hlY2sxIGFuZCBjaGVjazIgYWJvdmUgcnVsZTEsIG90aGVy
d2lzZSBvdXIgX19fIGhhY2sgd2lsbCBicmVhayBjaGVjazIKICAgIHJ1bGUuCjAzOiBhZGQgaHVu
aywgZHVlIHRvIHJlYmFzaW5nIGFuZAowOTogcmViYXNlZC4gQ2hhbmdlIGlzIHRyaXZpYWwsIEkg
a2VlcCByLWIuCgoKdjEwIGlzIGF2YWlsYWJsZSBhdAogaHR0cHM6Ly9zcmMub3BlbnZ6Lm9yZy9z
Y20vfnZzZW1lbnRzb3YvcWVtdS5naXQgI3RhZyB1cC1hdXRvLWxvY2FsLWVyci1wYXJ0SS12MTAK
djkgaXMgYXZhaWxhYmxlIGF0CiBodHRwczovL3NyYy5vcGVudnoub3JnL3NjbS9+dnNlbWVudHNv
di9xZW11LmdpdCAjdGFnIHVwLWF1dG8tbG9jYWwtZXJyLXBhcnRJLXY5CgoKSW4gdGhlc2Ugc2Vy
aWVzLCB0aGVyZSBpcyBubyBjb21taXQtcGVyLXN1YnN5c3RlbSBzY3JpcHQsIGVhY2ggZ2VuZXJh
dGVkCmNvbW1pdCBpcyBnZW5lcmF0ZWQgaW4gc2VwYXJhdGUuCgpTdGlsbCwgZ2VuZXJhdGluZyBj
b21tYW5kcyBhcmUgdmVyeSBzaW1pbGFyLCBhbmQgbG9va3MgbGlrZQoKICAgIHNlZCAtbiAnL148
U3Vic3lzdGVtIG5hbWU+JC8sL14kL3tzL15GOiAvL3B9JyBNQUlOVEFJTkVSUyB8IFwKICAgIHhh
cmdzIGdpdCBscy1maWxlcyB8IGdyZXAgJ1wuW2hjXSQnIHwgXAogICAgeGFyZ3Mgc3BhdGNoIFwK
ICAgICAgICAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJw
LmNvY2NpIFwKICAgICAgICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmgg
XAogICAgICAgIC0taW4tcGxhY2UgLS1uby1zaG93LWRpZmYgLS1tYXgtd2lkdGggODAKCk5vdGUs
IHRoYXQgaW4gZWFjaCBnZW5lcmF0ZWQgY29tbWl0LCBnZW5lcmF0aW9uIGNvbW1hbmQgaXMgdGhl
IG9ubHkKdGV4dCwgaW5kZW50ZWQgYnkgOCBzcGFjZXMgaW4gJ2dpdCBsb2cgLTEnIG91dHB1dCwg
c28sIHRvIHJlZ2VuZXJhdGUgYWxsCmNvbW1pdHMgKGZvciBleGFtcGxlLCBhZnRlciByZWJhc2Us
IG9yIGNoYW5nZSBpbiBjb2NjaW5lbGxlIHNjcmlwdCksIHlvdQptYXkgdXNlIHRoZSBmb2xsb3dp
bmcgY29tbWFuZDoKCmdpdCByZWJhc2UgLXggInNoIC1jIFwiZ2l0IHNob3cgLS1wcmV0dHk9IC0t
bmFtZS1vbmx5IHwgeGFyZ3MgZ2l0IGNoZWNrb3V0IEhFQUReIC0tIDsgZ2l0IHJlc2V0OyBnaXQg
bG9nIC0xIHwgZ3JlcCAnXiAgICAgICAgJyB8IHNoXCIiIEhFQUR+NwoKV2hpY2ggd2lsbCBzdGFy
dCBhdXRvbWF0ZWQgaW50ZXJhY3RpdmUgcmViYXNlIGZvciBnZW5lcmF0ZWQgcGF0Y2hlcywKd2hp
Y2ggd2lsbCBzdG9wIGlmIGdlbmVyYXRlZCBwYXRjaCBjaGFuZ2VkCih5b3UgbWF5IGRvIGdpdCBj
b21taXQgLS1hbWVuZCB0byBhcHBseSB1cGRhdGVkIGdlbmVyYXRlZCBjaGFuZ2VzKS4KCk5vdGU6
CiAgZ2l0IHNob3cgLS1wcmV0dHk9IC0tbmFtZS1vbmx5ICAgLSBsaXN0cyBmaWxlcywgY2hhbmdl
ZCBpbiBIRUFECiAgZ2l0IGxvZyAtMSB8IGdyZXAgJ14gICAgICAgICcgfCBzaCAgIC0gcmVydW4g
Z2VuZXJhdGlvbiBjb21tYW5kIG9mIEhFQUQKCgpDaGVjayBmb3IgY29tcGlsYXRpb24gb2YgY2hh
bmdlZCAuYyBmaWxlcwpnaXQgcmViYXNlIC14ICJzaCAtYyBcImdpdCBzaG93IC0tcHJldHR5PSAt
LW5hbWUtb25seSB8IHNlZCAtbiAncy9cLmMkLy5vL3AnIHwgeGFyZ3MgbWFrZSAtajlcIiIgSEVB
RH43CgpWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5ICg5KToKICBlcnJvcjogYXV0byBwcm9w
YWdhdGVkIGxvY2FsX2VycgogIHNjcmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBFUlJQ
X0FVVE9fUFJPUEFHQVRFKCkKICBTRCAoU2VjdXJlIENhcmQpOiBpbnRyb2R1Y2UgRVJSUF9BVVRP
X1BST1BBR0FURQogIHBmbGFzaDogaW50cm9kdWNlIEVSUlBfQVVUT19QUk9QQUdBVEUKICBmd19j
Zmc6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCiAgdmlydGlvLTlwOiBpbnRyb2R1Y2Ug
RVJSUF9BVVRPX1BST1BBR0FURQogIFRQTTogaW50cm9kdWNlIEVSUlBfQVVUT19QUk9QQUdBVEUK
ICBuYmQ6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCiAgeGVuOiBpbnRyb2R1Y2UgRVJS
UF9BVVRPX1BST1BBR0FURQoKIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJy
cC5jb2NjaSB8IDMzNiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvYmxvY2svbmJkLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL3FhcGkvZXJyb3IuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMDggKysrKysrKysrLS0KIGJsb2NrL25iZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyMSArLQogaHcvOXBmcy85cC1sb2NhbC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICstCiBody85cGZzLzlwLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogaHcvYmxvY2svZGF0YXBsYW5lL3hl
bi1ibG9jay5jICAgICAgICAgICAgICAgIHwgIDE3ICstCiBody9ibG9jay9wZmxhc2hfY2ZpMDEu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGh3L2Jsb2NrL3BmbGFzaF9jZmkwMi5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogaHcvYmxvY2sveGVuLWJsb2NrLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTIyICsrKy0tLS0KIGh3L252cmFtL2Z3X2NmZy5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArLQogaHcvcGNpLWhvc3QveGVuX2lnZF9w
dC5jICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCiBody9zZC9zZGhjaS1wY2kuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGh3L3NkL3NkaGNpLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyMSArLQogaHcvc2Qvc3NpLXNkLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICstCiBody90cG0vdHBtX3V0aWwuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGh3L3hlbi94ZW4tYmFja2VuZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDkyICsrLS0tCiBody94ZW4veGVuLWhvc3QtcGNpLWRldmlj
ZS5jICAgICAgICAgICAgICAgICAgfCAgMjcgKy0KIGh3L3hlbi94ZW5fcHQuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyNSArLQogaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5j
ICAgICAgICAgICAgICAgICAgIHwgIDIwICstCiBuYmQvY2xpZW50LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDUgKwogbmJkL3NlcnZlci5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA1ICsKIHRwbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNyArLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKIDI1IGZpbGVzIGNoYW5nZWQsIDcxNSBpbnNlcnRpb25zKCsp
LCAyNzggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2NjaW5lbGxl
L2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCgpDYzogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhh
dC5jb20+CkNjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpDYzogTWF4IFJlaXR6IDxt
cmVpdHpAcmVkaGF0LmNvbT4KQ2M6IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+CkNjOiBDaHJp
c3RpYW4gU2Nob2VuZWJlY2sgPHFlbXVfb3NzQGNydWRlYnl0ZS5jb20+CkNjOiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgpDYzogIlBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+CkNjOiBMYXN6bG8gRXJzZWsgPGxlcnNl
a0ByZWRoYXQuY29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBT
dGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LmlibS5jb20+CkNjOiBNYXJrdXMgQXJtYnJ1c3Rl
ciA8YXJtYnJ1QHJlZGhhdC5jb20+CkNjOiBNaWNoYWVsIFJvdGggPG1kcm90aEBsaW51eC52bmV0
LmlibS5jb20+CkNjOiBxZW11LWRldmVsQG5vbmdudS5vcmcKQ2M6IHFlbXUtYmxvY2tAbm9uZ251
Lm9yZwpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgotLSAKMi4yMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
