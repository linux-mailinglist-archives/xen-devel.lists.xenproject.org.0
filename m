Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21B16BDF4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 10:53:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Ws7-0005j3-Un; Tue, 25 Feb 2020 09:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=74be=4N=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1j6Ws6-0005iy-Rj
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 09:51:22 +0000
X-Inumbo-ID: 5abb821a-57b4-11ea-8cb6-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5abb821a-57b4-11ea-8cb6-bc764e2007e4;
 Tue, 25 Feb 2020 09:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GP0jrS5OcU8HZN9ek1L0sBz0KE3cv6MDrZT6xlvS6lpX3d7pMc9VXX2yFrBddx8VLjlps7n/CBwoCRpXzlkLVSGZoZgFFGyaWw2Fg4HeUo8V+M/o1kc9i81Y0xbHVqz65ByVZzYCgMKivDAcBov+C+Jgsu45CTz7no7I345G3E51ipDkBw1oJhbD5V2a01U2uZ7N27Rs9XK1BIcLPHo2xb8FSGC81zDSgwSi8AoehtUYv4quMEdWtmnxOPiPGBED+57nLh0RCrfQtKtMnNnXuzoKHngOchxMrBsGtZ8hnOuZM7X63IqtiWRa25PsVlCWJz6Kfys70ES04ieP1UvKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl2pCaR7v9sNXFQs4x9Vbrs+U3hGH4zw0dRG26AahNg=;
 b=ngDBaMWeef8TqWYSuoF+BuVNAbk1QlyDNxOSGvhbd2icNCs0vq4ZXLoJMFO5BthIP+qlB7ai5ZjelHLZjzJQ+jK1Gqqi2YaCB8WMuZ9wJTqmwy61KrfPM6aM6CMOSG86tENTRhrzgGqJxtrLFamX99gSLAKp9DkPpI6kDTqrJw7Y/gYHoa+RqtazaAB6cG/Xm9orqgB1CKtbv+BGUaUgukeKnGb+U2wMNmhefcenRSPSXPsFxfXvLLC9QprLZyWjwBDVLnHlVPErQWOv9PRNvm6ma2XCQBXqzJAVVgztzskySr6lxmmtctltH4vlrVjJEJZ3ILhh2nNDvnn+4q32eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl2pCaR7v9sNXFQs4x9Vbrs+U3hGH4zw0dRG26AahNg=;
 b=gq2h8BvGGkhwvrr3RBoOWkV8mkwEQue36ehrWyKYbEWQy0zkP1KRa86YXNsViA+Km6lB63lPJ6j+oW3JVZ6Af09q/HPQ2Gt8jqMO9oH+K1j0Ln4kCWJeCNrQoiyrX1qTMK4SMizloKS3R5pbFofkwja34xuWqK0mxlT/axvPdpU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3926.eurprd08.prod.outlook.com (20.179.1.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 09:51:10 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 09:51:10 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-4-vsementsov@virtuozzo.com>
 <87v9nxwulz.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200225125107800
Message-ID: <b4b0a029-372d-08e7-c126-2d8e67043dd7@virtuozzo.com>
Date: Tue, 25 Feb 2020 12:51:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87v9nxwulz.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR09CA0086.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::30) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR09CA0086.eurprd09.prod.outlook.com (2603:10a6:7:3d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 09:51:09 +0000
X-Tagtoolbar-Keys: D20200225125107800
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1cc2b0a-108f-4818-49c4-08d7b9d83e34
X-MS-TrafficTypeDiagnostic: AM6PR08MB3926:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3926CA2FA23815534642DE3EC1ED0@AM6PR08MB3926.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(52116002)(2616005)(31686004)(31696002)(26005)(81166006)(4744005)(86362001)(7416002)(8676002)(8936002)(81156014)(16576012)(316002)(66556008)(16526019)(54906003)(66946007)(186003)(4326008)(36756003)(6486002)(956004)(66476007)(478600001)(2906002)(6916009)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3926;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xR2H0HSk5gvgClAkpyF5fsaWdHCUkkOADqEfmBP8tHoBfy6xfNNIC6vhgoUyxiGFIY6c0t0d9h1DWh1seRQaoYrAd9rghQJl31OIgGfliX2gl4zlSCjG4vqinHtbZUVGmaMgSNUhIP2dZWWlfiQ+BawgxWxxnJCJLoscxsQ2eULAkfP6BwC27jTf2jyoZVLBpvMscRZoibRXmujqhrqZ4OS3g1Mw4JHOdvSfrT4QGlBxDOW6rmntc10dKBUCtiOtY6bBMNB5RCbqIYdLfTC5/rXjSpfw/84Nv3vNG4hHseqXQ+diMboSlNNFRLHLI0IIZ5l/KRNkhFLrbPu9blVfFPOQG35glqZa8Un1TxH/x3b4f0u/itt1qATs3EY9Bf5nQwtKEUhFJVMloSeKjNY9oVoBRDGWmvswCBORIqPW6xj9Sk/XJ/qncE0vcvz3rj9
X-MS-Exchange-AntiSpam-MessageData: npkfNXQtwCCTIj99rjj4yKOkTbCwdkSS2MTkFiqjVPhZyYa/4Qj1xn76Mg1c6+UAtX0n8xTsiXIA3JhhBz8Um0YXDIAjfXKlalTjACYIPMYCdOu7OJh4hRerRyvpVrPDKW6aVNfYoge+EuUtyiMwOQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cc2b0a-108f-4818-49c4-08d7b9d83e34
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 09:51:10.5532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOzOnd3s0MiCTpqFPSCJQs6mvobjV9wGh/0lwbp4Att01kYELZeHIRqwazhieNAAWP5TEGepX+ieVLGp0k9CUVfViiCC75NwebiJfbFDbv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3926
Subject: Re: [Xen-devel] [PATCH v7 03/11] scripts: add coccinelle script to
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

MjMuMDIuMjAyMCAxMTo1NSwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4+ICt8Cj4+ICstICAg
IHdhcm5fcmVwb3J0X2Vycihsb2NhbF9lcnIpOwo+PiArKyAgICB3YXJuX3JlcG9ydF9lcnJwKGVy
cnApOwo+IExpa2V3aXNlLgo+IAo+IFdoYXQgYWJvdXQgZXJyb3JfcmVwb3J0Zl9lcnIoKSwgd2Fy
bl9yZXBvcnRmX2VycigpPwoKSG1tIEknbSBhZnJhaWQsIHdlIGRvbid0IGhhdmUgY29ycmVzcG9u
ZGluZyBjYXNlcyB0byB1cGRhdGUuLgoKV2UgY2FuIHN0aWxsIGhhbmRsZSB0aGVtIGhlcmUsIGJ1
dCwgdGhlbiwgc2hvdWxkIHdlIHVzZSBub25leGlzdGVudCBlcnJvcl9yZXBvcnRmX2VycnAsIHNv
IGlmIGl0IG1hdGNoZWQsIHdlJ2xsIGhhdmUgY29tcGlsYXRpb24gZXJyb3I/Ck9yIG1heSBiZSBj
b2NjaW5lbGxlIGhhcyBzb21lIGtpbmQgb2YgImFib3J0KCkiIG9uIHRoZSBtYXRjaCwgdG8gZXJy
b3Itb3V0IHRoYXQgInBsZWFzZSBkZWZpbmUgZXJyb3JfcmVwb3J0Zl9lcnJwIGFuZCB1cGRhdGUg
Y29jY2luZWxsZSBzY3JpcHQgZmlyc3QiLi4uCgotLSAKQmVzdCByZWdhcmRzLApWbGFkaW1pcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
