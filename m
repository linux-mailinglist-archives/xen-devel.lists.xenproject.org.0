Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C518134A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 09:37:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBwq2-0008Ou-Co; Wed, 11 Mar 2020 08:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/gQI=44=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jBwq0-0008Op-Hf
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 08:35:36 +0000
X-Inumbo-ID: 467b3a33-6373-11ea-af40-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.117]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 467b3a33-6373-11ea-af40-12813bfff9fa;
 Wed, 11 Mar 2020 08:35:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToUzIkSX0IwG1ytez3mwCSaXQL8oRVCdIXfojEevzWseXv4aLOAL8QkY/7ixymBodFoVVKhIDsY7CmwNISnrVWHgTruT9gsqSydOrhgjMhJe4JRCfH8FWFCyJNLWxqz+bFooqw8Io4F1WjgOii3FiWR+RmyXwhPXPSRhXUK3UZhXIAQKyu4Yt4xSkRuiXejVhTFKgfvKGegtQ60Cn+KxSmsXoQoTomWUqA5soaUYSaWDIWEEgtkm2+wBQpXV39RJHzzB3NZNM1mRkLBK8RpEzcUzJSi6Ia2NJvOnuDjpbDJ+ycOAaPI1VR0WoiKefeW1B9xhr5YxucmyEPu7W+sPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6p/eG7L7CphNYwpwo9W4bWRRk5pEuCL4cMVPkIakI4=;
 b=O2iCoXZk66v0Gm5gVNSY1VoYMKuIQtCqUs+jZ8GxWg+n1JrFOcsq+bz1iBbB1nXUd5WDtlc+U+SoIVEPfuXstvCRmGpoCgsb+kaWLnY7dQGo1nGIyw8yVDZga2QwR3n7TbLr12Eq8HIo5fLQoDrBiMjeNrlD51nr4qCpEqXyJ7kmMai+Tt0GWzYIGWbbX+Ju2mfUqeWoULbhImDmpy8Em3shSf2j8VjJxVbHb7lNDOZu9Fq8gOwxfpt3jltXdBoauQlNNL11BoWV2JaWwRth5GL7JRo2ud0rnk27aShfYIfQXyUx5VWWrQ5cpFjyb3WZMuz64Qx8ja7gP+Apf9JnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6p/eG7L7CphNYwpwo9W4bWRRk5pEuCL4cMVPkIakI4=;
 b=PLkFhn18SsmfQBXjmD3nZ9PH4h2JOOXEUHAJ3yPRdZx/Q/+eJmtVVVA+r07bdbTPVq8OoxdMmsX7fXNQwtiyjeqYxTuiLKNufw5Hc9QdjafJlWjYuKkIDO0w80pbULzCe7hYwspRe1brQc2/24ZHH6A9EH4tqRlidjGp3YpquUs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4533.eurprd08.prod.outlook.com (20.179.5.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 08:35:33 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 08:35:33 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200311113529850
Message-ID: <83b327b0-34d9-ad71-ba3c-156bd7b82836@virtuozzo.com>
Date: Wed, 11 Mar 2020 11:35:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87lfo997hs.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::28)
 To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Wed, 11 Mar 2020 08:35:31 +0000
X-Tagtoolbar-Keys: D20200311113529850
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20dca1d6-603a-4b3b-2949-08d7c59729da
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45331F7B2736BD29F5B9E15DC1FC0@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(136003)(346002)(366004)(396003)(199004)(66946007)(2906002)(66556008)(81166006)(6486002)(81156014)(956004)(66476007)(52116002)(5660300002)(86362001)(186003)(16526019)(31696002)(26005)(4326008)(8676002)(2616005)(4744005)(36756003)(54906003)(478600001)(16576012)(316002)(6916009)(8936002)(31686004)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4533;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOHmTsvbWRt0ib8nD8p/hvZibb96lUKhtmv1/L4it9WDJZ5JH2+uQP3ysJGy1DV89axXjn7R2qKFMwYL1bPgxFdcOi3t9ygVFUt3RTbdKN6ufuybp1YMe4md+WJ8Q1gEgY2dzugsblKTVaJ43qeFXUmUZhvSmE5IBEnjL5/YvpjFqnWtYoRBAawonMPZm0I2i041djnZvXh2CRGh9oZVMqMp1m4Kv570ULwEd8aDl/Lod1tyXRJHtny+ZMNFtBRBAb/1IFQF0tvgIHvgy8NF+UlFVwLqYn3lG8wc0Yg/7VBbq2oYYVC/Y7evf5Bz3KLOazw0NFBxULK+KtFp8LYuFGXzq+v4njhDHnrbIKw9ZDkRY9a+qcH1RGIBcHQk9UlphMj3qtES0RgccnvhwZ6DWmvn08ETrdGTO2xcWCyaXu/lZpcP03Mbzd4iYAPOenCp
X-MS-Exchange-AntiSpam-MessageData: JyDQ5wH/Ld+OnDq8Al4mDU3PwaFpwMtWogXAtrerx7WEUQ+ZJfabBMdD9yFWeePQEhjczIcVZjanL9pxK63g+2cez2EExMH2ujQFK3gA3eChyG8kAiVQgVH0ZZmmlI7OKk9cKs329j/KscTuP3zOug==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dca1d6-603a-4b3b-2949-08d7c59729da
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 08:35:33.0350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c6N1zqBmiltv6YCn8KUeLQG/dMY/ppxtovjwiCVlhozuxUg1z0+0uQW7FhkNQZeV7PpQfzPit5TB1KiHa5QO434af/yc8yaZSfnMmgWJvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
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

MDkuMDMuMjAyMCAxMjo1NiwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4+ICsKPj4gKy8vIENv
bnZlcnQgZXJyb3IgY2xlYXJpbmcgZnVuY3Rpb25zCj4gU3VnZ2VzdDogRW5zdXJlIEBsb2NhbF9l
cnIgaXMgY2xlYXJlZCBvbiBmcmVlCgpCdXQgdGhlcmUgaXMgbm8gbG9jYWxfZXJyIGFmdGVyIGNv
bnZlcnNpb24KCj4gCj4+ICsoCj4+ICstICAgIGVycm9yX2ZyZWUobG9jYWxfZXJyKTsKPj4gKysg
ICAgZXJyb3JfZnJlZV9lcnJwKGVycnApOwo+PiArfAo+PiArLSAgICBlcnJvcl9yZXBvcnRfZXJy
KGxvY2FsX2Vycik7Cj4+ICsrICAgIGVycm9yX3JlcG9ydF9lcnJwKGVycnApOwo+PiArfAo+PiAr
LSAgICBlcnJvcl9yZXBvcnRmX2Vycihsb2NhbF9lcnIsIGFyZ3MpOwo+PiArKyAgICBlcnJvcl9y
ZXBvcnRmX2VycnAoZXJycCwgYXJncyk7Cj4+ICt8Cj4+ICstICAgIHdhcm5fcmVwb3J0X2Vycihs
b2NhbF9lcnIpOwo+PiArKyAgICB3YXJuX3JlcG9ydF9lcnJwKGVycnApOwo+PiArfAo+PiArLSAg
ICB3YXJuX3JlcG9ydGZfZXJyKGxvY2FsX2VyciwgYXJncyk7CgoKLS0gCkJlc3QgcmVnYXJkcywK
VmxhZGltaXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
