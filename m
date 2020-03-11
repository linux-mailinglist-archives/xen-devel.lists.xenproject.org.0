Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF632181597
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 11:14:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jByKi-0001oE-NI; Wed, 11 Mar 2020 10:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/gQI=44=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jByKh-0001o8-Io
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 10:11:23 +0000
X-Inumbo-ID: a7cfb83c-6380-11ea-92cf-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::709])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7cfb83c-6380-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 10:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1GdP5E/uPLu9EvbTtPUbcKs93xy5btDUIiw5iA/Sbbe290V5g7Zcir3LB7+4I8BM7VUfpTx0YZIx2+KNNFPQ+D013C7Y/bxFecltUSbLhrwvy/f1KFSinA0/V28f9vlNtiPoud2ZHWCiWhm5j43hS4WcHlgLKmN+TIJ3A/zoA6Lzm5lQ6ZqsI7uMMFaXAlYDcanKilKRP8EDLQlnZeloxS7HnHsCjfB9sB2NHhxCCdJQYamml+tLJ1NOWNXa/46POxNo9bxPaD9l+GZdbXpKKfsqLIy1DIF8yvnJsmHSMX9MUbsna4jVxVnE6osTVJCPHjaFxsQEl6ieYMx4kC8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBUQBS8DpUANyAqWYb9+wwAquIITxCdAAluuE0eK6k8=;
 b=TakvO4TAkl0EViwGe74Vn+STXj4GMFHrU1ARZT3x7dvGQKqJR0DrxK3UMFqvcwuO+5LukK4hARLIP2vTUBlI814cZD2yG/Fv3OaZxizMxzOWwhnJf7B1ogxNUDCHmBBKKGNYOxqnFQ8rQmgWIKCzwSUYufoJ1QLC29YopyKQ28T5Duo/Vf/SrT7GeNsGXYuOcG+YRulFmxQ/K3xT+n/QkEEHTR///k0rXwNIi8Pr8aghafobRr4+l0PvwgbJjRX4rIUAzqG2LM2VV/M+b/yv5+FG6kytFOi/nde0yO5l1Lv/ioIB+5fkFEFXSFk6lLfPNeZ1nQS4lKoTl7gjzBtuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBUQBS8DpUANyAqWYb9+wwAquIITxCdAAluuE0eK6k8=;
 b=ZXIAPbYbL1zxQF/FwDAV2Z6vH7mNxYyxG5d6u3/JlDMykYpnbLGY9Qm5WzB2qme5Wg57k4i02Erw5BKh6nqO7pB8V+N2WdiO/Hfc0+3v4/myfd2GX3ZoAJ+bt54sVKcqYqsS2eVnBWnH+QQ+WYpX62iJx+JFiGx/opI+NJF8xVw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB2967.eurprd08.prod.outlook.com (52.135.163.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11; Wed, 11 Mar 2020 10:11:19 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 10:11:19 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87r1xzfc9y.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200311131116572
Message-ID: <4ebcc5a5-4bc8-022b-8fe4-9ced0de08370@virtuozzo.com>
Date: Wed, 11 Mar 2020 13:11:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87r1xzfc9y.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0283.eurprd05.prod.outlook.com
 (2603:10a6:7:93::14) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0283.eurprd05.prod.outlook.com (2603:10a6:7:93::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 10:11:18 +0000
X-Tagtoolbar-Keys: D20200311131116572
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ab26d02-17f9-4da7-a123-08d7c5a48b20
X-MS-TrafficTypeDiagnostic: AM6PR08MB2967:
X-Microsoft-Antispam-PRVS: <AM6PR08MB2967463D7823538B6FCF78E6C1FC0@AM6PR08MB2967.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(136003)(39850400004)(376002)(366004)(396003)(346002)(199004)(956004)(31686004)(316002)(7416002)(26005)(8676002)(2616005)(16576012)(2906002)(6486002)(4326008)(81156014)(81166006)(478600001)(86362001)(52116002)(6916009)(36756003)(66556008)(66476007)(66946007)(5660300002)(8936002)(16526019)(54906003)(186003)(4744005)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB2967;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UcSgKfWTctJDBguePBhHs+vdhpPWBvGeCBktXe5tzaM6N85LZsSG0jrpySRJHQJmSmtDKna9QQnZ4sc4pIuXTlXl5uOTLNoF16caBphji6wZ5JUesjkeR1dJY0y62EX/znbS3NZadGP5H+BOhH+euS4B4uTLCuZymlC5H5TPNqe2p8Ei8RBpWLd279DOUfdqRPMOQ3w4zJS4aKJfKQGIagI4bpM9SXboo5L3Soa3/tiWIRfilNbxM4101xU9ebCqYPMBIjR5leohmS86V8jD38cexrOTWk+wPjE1lN98YpRFYRALZNGhoy0uHDER5DNMA18LHURAAwnTM2Yw8mcaFDlFKMjnz4bkY5GOpIAt47NFz7XpVUfVCl/pTpIEnVIASIju/FRO+fXg05J7AXc6yJBgn45JJ6wIb/ognWApsrjBN1VOXqZN4sQbstOuKoX0
X-MS-Exchange-AntiSpam-MessageData: kH7yW781IF4TkQ/MLFgx5sheIzBKBqd/FIL2kVqf36IEGAAtmubJdqCgIf+nETCnsev2YGK0LUzqmJvQqg7foTwY2NOky7fZ+oyKk1uhm01zViPdtQruzOqUYiXFxhll7+xfrws6fRs9DKgsNBsbEg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab26d02-17f9-4da7-a123-08d7c5a48b20
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 10:11:19.6963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOhKeMI4l0c66g2KBpBZs17tLQdCNaCxQO6VNYYvdNAef0qnAiO5Zot4OJ/JFlAXDdMTUD+YVwNyjukTLc/7yKZdWFld+Qd1jPtCQ6kDAsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2967
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

MTEuMDMuMjAyMCAxMjo1MywgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gSSB0aGluayBhIHY5
IG1ha2VzIHNlbnNlIG5vdy4KPiAKPiBJZiBhbnkgb2YgdGhlIGltcHJvdmVtZW50IGlkZWFzIHNo
b3VsZCB0dXJuIGludG8gdGltZSBzaW5rcyBmb3IgeW91LAo+IGxldCdzIHRhbGsuICBXZSBkb24n
dCBuZWVkIHBlcmZlY3Rpb24sIHdlIG9ubHkgbmVlZCB0byBnZXQgdG8gdGhlIHBvaW50Cj4gd2hl
cmUgd2UgdHJ1c3QgdGhlIHNjcmlwdCB0byBkbyB3aGF0IHdlIGJlbGlldmUgaXQgZG9lcywgdW5k
ZXJzdGFuZCBpdHMKPiBsaW1pdGF0aW9ucywgYW5kIGtub3cgaG93IHRvIGNvbXBlbnNhdGUgZm9y
IHRoZW0uCj4gCj4gUmlnaHQgbm93IEknbSBvcHRpbWlzdGljIHY5IHdpbGwgYmUgcmVhZHkgZm9y
IG1lcmdpbmcsIHBlcmhhcHMgd2l0aCBzb21lCj4gbWlub3IgdHdlYWtpbmcgaW4gbXkgdHJlZS4K
PiAKCkdvb2QuIEkgaG9wZSwgSSdsbCByZXNlbmQgdG9kYXkuCgotLSAKQmVzdCByZWdhcmRzLApW
bGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
