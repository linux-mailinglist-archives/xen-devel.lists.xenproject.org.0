Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E861717F0C3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 07:51:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBYfX-0006Ju-IX; Tue, 10 Mar 2020 06:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyu8=43=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jBYfV-0006Jp-MH
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 06:47:10 +0000
X-Inumbo-ID: f54fbe90-629a-11ea-b383-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.110]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f54fbe90-629a-11ea-b383-bc764e2007e4;
 Tue, 10 Mar 2020 06:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVRn/JpWJwDk+jXNu1qvMBr3cTbQPkHXU36f75MhKDp444yTTLlkwkx17+evUkRfRt7nOjSIHGiagSY2KZdGL9gQqq6F2Z3EPjsoYxDJ+S7qoSjc4N3bA7F0g3Ij7+TXDYtgnG+zTDDC+pZXepuRojx8DiKuCEM65aWiS/dxpLhSQ+z2mq6oQr6XIqkWrepKvfBVjHZgqexJpCfgSLh1Wj5e+eDo811P6WiCrQRrdoP+ifZ7/qkTXdMZcTEVelAgtDCM5zyauaoWiANe1FEHZ8oVIlS78Yr3Pb18bKLqw7gy8XAd6IjDilcuhS9Y4/rZveA4qckgmGfvM1Ul0LnIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkRSGu1l0xSemgRLhlV9PX/SDiy8sJCdZflsNGYtWfc=;
 b=k8gvO6c7yaci4dbyuX1+npir5oDc/BKpwoZddanC1v2UIqaZBQDO81p3bIKb8UesFRR+aYwv1oxQA5QMbuX9Xao5ECLI3/P01ERzhuSVqrHL2TSrkREiOo9tOyjEpIVeQ8C7KT3orxZ92x49BA3zYE2EJlbj1UxnKCdrfDOJV0BswNLHcWmxw80Xidt4l6lMhoyyuB3YmqTWqC2lDjXdvBtfRP2JzF5+keMULxdKVpwNiQ5Bywv+Pb7MapK5OIw6/BUgbQcpCvcUojnnw4767Iwgk12C9zxHRiWY4PdKUdg/sTGcbnRB1Q75FbXqX1xnuWJqIm+OEJbA3aefJeRnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkRSGu1l0xSemgRLhlV9PX/SDiy8sJCdZflsNGYtWfc=;
 b=Cut52tIuRCX0lRWsxd9OX0ehaL1Eju8xxPbdiR3ut5Yo9oJsyjGpNybTS/S+p3eFw15KbnpCWJeRSSbmGWSUgQw/y6RSAjQMmDNQ+BlXNDPfLTl88ZLuCqmrU5a6vjmjytmAsUpr7jFodl+GYta5lcRt2rZyq84Xn4tvIZCXCA8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB5111.eurprd08.prod.outlook.com (10.255.122.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 06:47:05 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2793.018; Tue, 10 Mar 2020
 06:47:05 +0000
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com> <2464375.yLZ1CyT5Wr@silver>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200310094702631
Message-ID: <12482a0b-28f8-0a4b-cf3f-b2b390bf238e@virtuozzo.com>
Date: Tue, 10 Mar 2020 09:47:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <2464375.yLZ1CyT5Wr@silver>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0902CA0040.eurprd09.prod.outlook.com
 (2603:10a6:7:15::29) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0902CA0040.eurprd09.prod.outlook.com (2603:10a6:7:15::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Tue, 10 Mar 2020 06:47:04 +0000
X-Tagtoolbar-Keys: D20200310094702631
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8729c123-68a8-4951-9bc5-08d7c4bed8ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB5111:
X-Microsoft-Antispam-PRVS: <AM6PR08MB51119DC80AF35922FA1249D4C1FF0@AM6PR08MB5111.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(376002)(366004)(396003)(136003)(199004)(189003)(16526019)(2906002)(186003)(6486002)(52116002)(8676002)(26005)(16576012)(54906003)(36756003)(316002)(31686004)(5660300002)(4744005)(31696002)(66476007)(81156014)(2616005)(478600001)(7416002)(81166006)(956004)(8936002)(66946007)(66574012)(4326008)(66556008)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB5111;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgaOukhwEahABcGPAs9ARbVIdBdoW//mP9vmhc270HIa4LKSoLNsipnnT1vjJoJN+oJ6vjb9dxl5hZk7FOc8yfFZ1Zl8ZRuZTvakxhWaOTA6m6HAorK0KJ7lO7lD9FaunNfSyshSeW6uJKU4js1/ek6RvFErDWWf48Ko6Wp3UpZrAGfjREsRuhvQzGRtlxve+RDxninGiJleIr2Xi8LFh7/0ZglEqzpKp9FczJRCVGgAXhjlldm6IUOW8QCXHp+BFdjciwrPOtpHO4CTddAr8Xla+eMVS0bJwiJf5CSkVKQhSXbGDavltNoZBS2g5LSZYEy1yUpdPz2sOGEu7fZstm2ormj0oMxsblF/yP8T7EwzwUE+LhUX9OWwAhYFIklahfPhmKJfEkkdRLLvdZmtxsL1d1OWnmv2DG8H7tbgXN+gknhGUFRgqD7qz998ew0p
X-MS-Exchange-AntiSpam-MessageData: hBcwFhI5lsMLRzm4b/6RaWEpIsLMaOUI+XcfmqXJsalX8+C8ASbVFXJFMJrrBb11nocP19Hl/sVAUyauXNV2p0yGibh/ppWQ8kmeVI/jrnST1Orf+AqBA+WD0T6+q1PbhfGUBPd3tXRTmCZKuYRxBQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8729c123-68a8-4951-9bc5-08d7c4bed8ac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 06:47:05.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 133W/ecAWhfGl2NSDwCwhKIPJiRbHHO20rTuhu7LTqzHgwuyKThJtet8yoKqsVBqwjhpj4xv9lSgar3O99e3G3QNeKltqcc6cv5hk9Eb/og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5111
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Greg Kurz <groug@kaod.org>, armbru@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MDguMDMuMjAyMCAyMjowOSwgQ2hyaXN0aWFuIFNjaG9lbmViZWNrIHdyb3RlOgo+IE9uIEZyZWl0
YWcsIDYuIE3DpHJ6IDIwMjAgMDY6MTU6MjggQ0VUIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNr
aXkgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdh
dGVkLWVycnAuY29jY2kKPj4gYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVy
cnAuY29jY2kgbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uYmZmMjc0
YmQ2ZAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXBy
b3BhZ2F0ZWQtZXJycC5jb2NjaQo+PiBAQCAtMCwwICsxLDIzMSBAQAo+PiArLy8gVXNlIEVSUlBf
QVVUT19QUk9QQUdBVEUgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkKPj4gKy8vCj4+ICsvLyBD
b3B5cmlnaHQgKGMpIDIwMjAgVmlydHVvenpvIEludGVybmF0aW9uYWwgR21iSC4KPiAKPiBKdXN0
IGluIGNhc2U6Cj4gCj4gV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwg
ZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwoKSG1tLCBzZWVtcyB0aGlzLCBhbmQgc29t
ZSBvdGhlciBjb2NjaW5lbGxlIHNjcmlwdHMgc2hvdWxkIGJlIGFkZGVkIHRvICJFcnJvciByZXBv
cnRpbmciCnNlY3Rpb24uCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBDaHJpc3RpYW4gU2Nob2VuZWJl
Y2sKPiAKPiAKPiAKCgotLSAKQmVzdCByZWdhcmRzLApWbGFkaW1pcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
