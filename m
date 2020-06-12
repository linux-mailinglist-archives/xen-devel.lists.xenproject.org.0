Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA421F7518
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 10:14:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjeor-0007f9-ML; Fri, 12 Jun 2020 08:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj+H=7Z=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjeoq-0007f0-JV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 08:13:44 +0000
X-Inumbo-ID: a14b3e94-ac84-11ea-bca7-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a14b3e94-ac84-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuVIUdtNApXqzcE2Mpd2ddkUfC/c6IBk8nU/VC/09k=;
 b=fjQs/QBCTgxsSoQhErPq8ZNkVAT6dnJpE8YpIlaNZ4tauahccKwVz8edtIXDi9j4X81TiJ6jy0T7Lhdwv2nOdXdrFHwweF5zQ+jR/jl8IJ3MfyzbWtHW188mvy6HsaLdX44nJtoc8q3Ig9+/Z00qmke+VdHjCaYFbNhu15P5gCM=
Received: from AM6P195CA0048.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::25)
 by DB8PR08MB5196.eurprd08.prod.outlook.com (2603:10a6:10:ee::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 08:13:40 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::e7) by AM6P195CA0048.outlook.office365.com
 (2603:10a6:209:87::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Fri, 12 Jun 2020 08:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 08:13:40 +0000
Received: ("Tessian outbound fb809da9b456:v59");
 Fri, 12 Jun 2020 08:13:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f419176ede4c70c
X-CR-MTA-TID: 64aa7808
Received: from e213b64003be.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFB9E382-A45C-4AB8-B40C-B15C1C2FB1ED.1; 
 Fri, 12 Jun 2020 08:13:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e213b64003be.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Jun 2020 08:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CADSmU/zxgAyW9gxqbMoiQueWxWm0pPp6FRx+uO3eX586YniTh1HoN1b36U2j7ioYUT1/6/j2Ckx2eSp8HUAusdyFe70yqAFbGOiGPPhOG5vsU6fbtYHcsbutIYOjlFFISVNilEWsSPZyEqS2998VwPuf7woL4OA7hVGVuxhm/BN+2SArqvhQITtFtO8FLBOsDxhwiGlOZ0qbLWxnRaCZt+xykhademe1w/O4hVtlay0R3zAnzONcJlVPKWDnyQz+eJ+4yZQAYTLD4Z6+94BOnOICOWMJnIdcZA1u65jiVJIspSzKevOwNoR7Fy4vR1O1gx06g4HxxD3biCFO/T2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuVIUdtNApXqzcE2Mpd2ddkUfC/c6IBk8nU/VC/09k=;
 b=iYJN72fX3EoC8w6+kvcHcvTG15pNG/xcdxV1es7GhbFvlUn8bSW/vN5XZSkpatO2kgpW9DpBh2KvWK0HGXFycvL07pknVCqekdq2wcfG/q7PLl3NkSKwDT2liOBUFKzH52gzlvMO9VQr4K8wmspwky34Y39FjREYZXEqTMjaXt1bIwq2bdTuPtXXVB57B3xRz+DJFE7+jLLL+NPEtSV5iL3TEeMaWQYNdRbZYqBkC4Ct2scbhKhC+V2KMYC+KCS2yI54v0n/TN/+I3AKnKQODCEThrnA3FQm90cFX2M8HPKFnbo2Lzy09C9OEcm0mEJlzwE5RwdDWM1fMWsGuQzFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuVIUdtNApXqzcE2Mpd2ddkUfC/c6IBk8nU/VC/09k=;
 b=fjQs/QBCTgxsSoQhErPq8ZNkVAT6dnJpE8YpIlaNZ4tauahccKwVz8edtIXDi9j4X81TiJ6jy0T7Lhdwv2nOdXdrFHwweF5zQ+jR/jl8IJ3MfyzbWtHW188mvy6HsaLdX44nJtoc8q3Ig9+/Z00qmke+VdHjCaYFbNhu15P5gCM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3418.eurprd08.prod.outlook.com (2603:10a6:10:27::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 08:13:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 08:13:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWP+e0l1aGgjLKI0+XFOOVnv/iZKjTuR6AgAACMICAAActAIAADWwAgABcfQCAAHaFAA==
Date: Fri, 12 Jun 2020 08:13:33 +0000
Message-ID: <48F66B8F-3AEF-4E54-A572-C246F5A7C117@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5081cb1-9407-4240-d5b3-08d80ea883e9
x-ms-traffictypediagnostic: DB7PR08MB3418:|DB8PR08MB5196:
X-Microsoft-Antispam-PRVS: <DB8PR08MB51963F21D4CFCCC22F8C21DE9D810@DB8PR08MB5196.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YjSLTgcPzmOdYf3Zh9arqmz4iL72ByhTrb2wfgjlyrLMFSEbS8plaUvGa9OndKHDbrBMakIk2A4zd6MfUad3fo/0lX6v57dH5L5OrVCsHKFEIVCZb9awPGaScxAI0/EsO6CmHbv3yz+g8RMf7P2Zd1K45sUXdPChoqrROgL7DSa2/sNujSHdDCYveF1z7eRmJrFOI1m5+yHViYp87ESZCv1UM9m9I4gpIJDcKJctzZN1HSMFgeNJ8dpVgzMNrL7kSpjqqv3/KHr0FH+NPinaaKZC8D1AfE6EX3NlO8iMS4HlVKveo7m3ugxKujMd4PVlhpOGBfqzHwHbNmOkJmal4R2kbOa99qZNRG58QkNF8vOSXX0E/2x+dJhaUWb6mLR9
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(5660300002)(186003)(71200400001)(4326008)(83380400001)(86362001)(26005)(2906002)(66476007)(66446008)(53546011)(36756003)(76116006)(316002)(91956017)(6512007)(478600001)(64756008)(66556008)(33656002)(6506007)(66946007)(8936002)(2616005)(6916009)(54906003)(7416002)(8676002)(6486002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9zELu9p5KsBeNZSX4kcVt+U2Xlte2qjP6x8NEuqrRIK3P/HkRuyEvJrT5Yivc9RiGCmTeZG3Jl4+XRshAVo7IHL6Ls33AVBdwqIrnqjb43ScjNJS5mD5zXAVCZvzfKYNhQzRefv1PsKPcfVH4F9QSdID5LiRtpgMTkxcedQLyBdxMUm0vC1z3M6HIjM1aEpW5kx8qRsSsxRr06hO3U26oRyj3YsPEWCaIGOxigPxESAZxzXx8YJPisUyLWKxY7LVxQqlNyW2gquUE+0id9vqjwmZsfMx2+S42fH3qJED3ODi1Lcdg0amKEc4C6u389GBY2yf0TERjXfJ0B5+fUKzLjw/hwkLmLMZP44ZFTqIYEfI0m3rOd1G6+TvpMMPLoer4IT7WvQUVAcO6P/S7Vrpk+WsnsUZ5CWwmStb8kq/e0Zdr3hYpQvOZ3PNH0Z3co6vPTii/oE3dJh8h7nfRL2nA6TCNCm+7i3mQJJ6ZORDK/du7QMlyEeBdCkI9/Zv9Bil
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <63BE20181203A642A97560CE24E25108@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3418
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966005)(8936002)(8676002)(316002)(4326008)(6512007)(5660300002)(2906002)(6862004)(107886003)(36906005)(54906003)(6486002)(82740400003)(47076004)(86362001)(82310400002)(2616005)(83380400001)(478600001)(356005)(81166007)(53546011)(26005)(36756003)(6506007)(336012)(70206006)(33656002)(186003)(70586007)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8edfc835-6c0e-45b7-f078-08d80ea87fea
X-Forefront-PRVS: 0432A04947
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZU6CA3bHtw5HAtNtl7u4fwMTrb5rdGOQ79PFyHQbBmpThX2mfTABs7XQAtul8MyjArwDh7AkxPZcNAgJ4/SVVFUczZaF6y9LZ1+X0ZdNlElZ0jnygmdHTtMuk8mpLT3wwoVQpleFrbJdOEbuFWDiTAS132IOiFV2sm+b4dzpJAKMcV0/zZdTFLLMaZZlPUFc3yx2DVE5koitn9uvFR5+cV3YRDuFoPVANodKYMKlAbAKtv67pvl8cO68rMPhxyuvcJErLHkXbJQqJWR6/M0dS7xXzkzk5YhzOVoXd2uIFA8NVRWeYU0ilpYA/7Pi2bNS5691tnw7Ajr7QOQJZ1U2KL/2TfLxf4EsBY1hY7AyJRxvGqes4JbLKivMlcBqEDshqlxUJpsEZrmkJp4Vm4zlFKMGs4o7ysjKyRc3Zhmtkw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 08:13:40.2220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5081cb1-9407-4240-d5b3-08d80ea883e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5196
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTIgSnVuIDIwMjAsIGF0IDAyOjA5LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxMSBKdW4gMjAyMCwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4gSGkgU3RlZmFubywNCj4+IA0KPj4gT24gMTEvMDYvMjAyMCAx
OTo1MCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFRodSwgMTEgSnVuIDIwMjAs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+
Pj4+PiAgICAgIH0NCj4+Pj4+PiANCj4+Pj4+PiAtICAgIF9fY29weV90b19ndWVzdChydW5zdGF0
ZV9ndWVzdCh2KSwgJnJ1bnN0YXRlLCAxKTsNCj4+Pj4+PiArICAgIHYtPmFyY2gucnVuc3RhdGVf
Z3Vlc3QucGFnZSA9IHBhZ2U7DQo+Pj4+Pj4gKyAgICB2LT5hcmNoLnJ1bnN0YXRlX2d1ZXN0Lm9m
ZnNldCA9IG9mZnNldDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBzcGluX3VubG9jaygmdi0+YXJj
aC5ydW5zdGF0ZV9ndWVzdC5sb2NrKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICByZXR1cm4gMDsN
Cj4+Pj4+PiArfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArDQo+Pj4+Pj4gKy8qIFVwZGF0ZSBwZXItVkNQ
VSBndWVzdCBydW5zdGF0ZSBzaGFyZWQgbWVtb3J5IGFyZWEgKGlmIHJlZ2lzdGVyZWQpLg0KPj4+
Pj4+ICovDQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2
Y3B1ICp2KQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZv
ICpndWVzdF9ydW5zdGF0ZTsNCj4+Pj4+PiArICAgIHZvaWQgKnA7DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICsgICAgc3Bpbl9sb2NrKCZ2LT5hcmNoLnJ1bnN0YXRlX2d1ZXN0LmxvY2spOw0KPj4+Pj4+IA0K
Pj4+Pj4+IC0gICAgaWYgKCBndWVzdF9oYW5kbGUgKQ0KPj4+Pj4+ICsgICAgaWYgKCB2LT5hcmNo
LnJ1bnN0YXRlX2d1ZXN0LnBhZ2UgKQ0KPj4+Pj4+ICAgICAgew0KPj4+Pj4+IC0gICAgICAgIHJ1
bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgJj0gflhFTl9SVU5TVEFURV9VUERBVEU7DQo+Pj4+Pj4g
KyAgICAgICAgcCA9IF9fbWFwX2RvbWFpbl9wYWdlKHYtPmFyY2gucnVuc3RhdGVfZ3Vlc3QucGFn
ZSk7DQo+Pj4+Pj4gKyAgICAgICAgZ3Vlc3RfcnVuc3RhdGUgPSBwICsgdi0+YXJjaC5ydW5zdGF0
ZV9ndWVzdC5vZmZzZXQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgICAgIGlmICggVk1fQVNTSVNU
KHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBkYXRlX2ZsYWcpICkNCj4+Pj4+PiArICAgICAgICB7DQo+
Pj4+Pj4gKyAgICAgICAgICAgIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgfD0gWEVOX1JV
TlNUQVRFX1VQREFURTsNCj4+Pj4+PiArICAgICAgICAgICAgZ3Vlc3RfcnVuc3RhdGUtPnN0YXRl
X2VudHJ5X3RpbWUgfD0gWEVOX1JVTlNUQVRFX1VQREFURTsNCj4+Pj4+IA0KPj4+Pj4gSSB0aGlu
ayB0aGF0IHRoaXMgd3JpdGUgdG8gZ3Vlc3RfcnVuc3RhdGUgc2hvdWxkIHVzZSB3cml0ZV9hdG9t
aWMgb3INCj4+Pj4+IGFub3RoZXIgYXRvbWljIHdyaXRlIG9wZXJhdGlvbi4NCj4+Pj4gDQo+Pj4+
IEkgdGhvdWdodCBhYm91dCBzdWdnZXN0aW5nIHRoZSBzYW1lLCBidXQgIGd1ZXN0X2NvcHlfKiBo
ZWxwZXJzIG1heSBub3QNCj4+Pj4gZG8gYSBzaW5nbGUgbWVtb3J5IHdyaXRlIHRvIHN0YXRlX2Vu
dHJ5X3RpbWUuDQo+Pj4+IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcHJldmVudCB3aXRoIHRoZSB3
cml0ZV9hdG9taWMoKT8NCj4+PiANCj4+PiBJIGFtIHRoaW5raW5nIHRoYXQgd2l0aG91dCB1c2lu
ZyBhbiBhdG9taWMgd3JpdGUsIGl0IHdvdWxkIGJlIChhdCBsZWFzdA0KPj4+IHRoZW9yZXRpY2Fs
bHkpIHBvc3NpYmxlIGZvciBhIGd1ZXN0IHRvIHNlZSBhIHBhcnRpYWwgd3JpdGUgdG8NCj4+PiBz
dGF0ZV9lbnRyeV90aW1lLCB3aGljaCBpcyBub3QgZ29vZC4gDQo+PiANCj4+IEl0IGlzIGFscmVh
ZHkgdGhlIGNhc2Ugd2l0aCBleGlzdGluZyBpbXBsZW1lbnRhdGlvbiBhcyBYZW4gbWF5IHdyaXRl
IGJ5dGUgYnkNCj4+IGJ5dGUuIFNvIGFyZSB5b3Ugc3VnZ2VzdGluZyB0aGUgZXhpc3RpbmcgY29k
ZSBpcyBhbHNvIGJ1Z2d5Pw0KPiANCj4gV3JpdGluZyBieXRlIGJ5IGJ5dGUgaXMgYSBkaWZmZXJl
bnQgY2FzZS4gVGhhdCBpcyBPSy4gSW4gdGhhdCBjYXNlLCB0aGUNCj4gZ3Vlc3QgY291bGQgc2Vl
IHRoZSBzdGF0ZSBhZnRlciAzIGJ5dGVzIHdyaXR0ZW4gYW5kIGl0IHdvdWxkIGJlIGZpbmUgYW5k
DQo+IGNvbnNpc3RlbnQuIElmIHRoaXMgaGFkbid0IGJlZW4gdGhlIGNhc2UsIHRoZW4geWVzLCB0
aGUgZXhpc3RpbmcgY29kZQ0KPiB3b3VsZCBhbHNvIGJlIGJ1Z2d5Lg0KPiANCj4gU28gaWYgd2Ug
ZGlkIHRoZSB3cml0ZSB3aXRoIGEgbWVtY3B5LCBpdCB3b3VsZCBiZSBmaW5lLCBubyBuZWVkIGZv
cg0KPiBhdG9taWNzOg0KPiANCj4gIG1lbWNweSgmZ3Vlc3RfcnVuc3RhdGUtPnN0YXRlX2VudHJ5
X3RpbWUsDQo+ICAgICAgICAgJnYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUsDQo+ICAgICAg
ICAgWFhYKTsNCj4gDQo+IA0KPiBUaGUgfD0gY2FzZSBpcyBkaWZmZXJlbnQ6IEdDQyBjb3VsZCBp
bXBsZW1lbnQgaXQgaW4gYW55IHdheSBpdCBsaWtlcywNCj4gaW5jbHVkaW5nIGdvaW5nIHRocm91
Z2ggYSB6ZXJvLXdyaXRlIHRvIGFueSBvZiB0aGUgYnl0ZXMgaW4gdGhlIHdvcmQsIG9yDQo+IGRv
aW5nIGFuIGFkZGl0aW9uIHRoZW4gYSBzdWJ0cmFjdGlvbi4gR0NDIGRvZXNuJ3QgbWFrZSBhbnkg
Z3VhcmFudGVlcy4NCj4gSWYgd2Ugd2FudCBndWFyYW50ZWVzIHdlIG5lZWQgdG8gdXNlIGF0b21p
Y3MuDQoNCldvdWxkbuKAmXQgdGhhdCByZXF1aXJlIGFsbCBhY2Nlc3NlcyB0byBzdGF0ZV9lbnRy
eV90aW1lIHRvIHVzZSBhbHNvIGF0b21pYyBvcGVyYXRpb25zID8NCkluIHRoaXMgY2FzZSB3ZSBj
b3VsZCBub3QgcHJvcGFnYXRlIHRoZSBjaGFuZ2VzIHRvIGEgZ3Vlc3Qgd2l0aG91dCBjaGFuZ2lu
ZyB0aGUgaW50ZXJmYWNlIGl0c2VsZi4NCg0KQXMgdGhlIGNvcHkgdGltZSBuZWVkcyB0byBiZSBw
cm90ZWN0ZWQsIHRoZSB3cml0ZSBiYXJyaWVycyBhcmUgdGhlcmUgdG8gbWFrZSBzdXJlIHRoYXQg
ZHVyaW5nIHRoZSBjb3B5IHRoZSBiaXQgaXMgc2V0IGFuZCB0aGF0IHdoZW4gd2UgdW5zZXQgaXQs
IHRoZSBjb3B5IGlzIGRvbmUuDQpJIGFkZGVkIGZvciB0aGlzIHB1cnBvc2UgYSBiYXJyaWVyIGFm
dGVyIHRoZSBtZW1jcHkgdG8gbWFrZSBzdXJlIHRoYXQgd2hlbi9pZiB3ZSB1bnNldCB0aGUgYml0
IHRoZSBjb3B5IGhhcyBhbHJlYWR5IGJlZW4gZG9uZS4NCg0KQ2hlZXJzDQoNCkJlcnRyYW5kDQoN
Cg0K

