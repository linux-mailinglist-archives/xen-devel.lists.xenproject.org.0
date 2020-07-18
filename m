Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83A224A7A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 11:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwjcR-0001Wy-EZ; Sat, 18 Jul 2020 09:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwjcP-0001Wt-P9
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 09:58:57 +0000
X-Inumbo-ID: 4b0e9fb0-c8dd-11ea-bb8b-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b0e9fb0-c8dd-11ea-bb8b-bc764e2007e4;
 Sat, 18 Jul 2020 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s0tH+pup/xz/4DK8QhSXxnJtPEAg9Ps42z57ZPsKYA=;
 b=8Y3Ammtw4XIDax8ChOtAu17c4m+xdP1x01j7dlJFSB2bZEH+Fq5bGgQhhHYB3hhCrofBToy/AzXKwa0t4Hnhw1P4M8spnxILaU/KuTtg0OcGgfy7S7TuD8NaD/XmreNU2tYc+E+Gs/XLwY3aCnLgN9gvCKZZH4Ldab64Z9IOeR4=
Received: from AM7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:20b:100::15)
 by VI1PR0801MB1662.eurprd08.prod.outlook.com (2603:10a6:800:52::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Sat, 18 Jul
 2020 09:58:54 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::c2) by AM7PR02CA0005.outlook.office365.com
 (2603:10a6:20b:100::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Sat, 18 Jul 2020 09:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Sat, 18 Jul 2020 09:58:53 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Sat, 18 Jul 2020 09:58:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cd7f1c1245bc840
X-CR-MTA-TID: 64aa7808
Received: from 0609c9818d35.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC71D507-F3BC-496B-8D78-9D7C91C60BBB.1; 
 Sat, 18 Jul 2020 09:58:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0609c9818d35.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 18 Jul 2020 09:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUiVuJioMUDB4dPMF42QAagdgmqB1mWKy0rHuP8oVS6mkqvxWD0lkQsXBW3mMePPGL5lJLKjp1/Y90Tteboesei9pXUo8H5UZyRFdwXPb9f1MAlCWy0gKF699rypOQRgpIPs7iap2VSqCMXg33egsY2iffIFlDHGVoMNAY2IjxHO8Ds6nisfnGykkkj2slKgDKbGehE2zQeYzlcezeYqgnkzp4Cfuv5pvXA50RGMaPeF/oTMNzqCawF8k7BtHfL+iVrpsIpn+ORY3jxyxJItKZ4a7p1oPfLFF3Di1yDnDD2KCLk++sQkqEtQIAjVcyUGjIldthZ7C/jgwRcej/ANcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s0tH+pup/xz/4DK8QhSXxnJtPEAg9Ps42z57ZPsKYA=;
 b=mIk9UNqtcRcGsF87Wx8K7Qjru9P1Mch25WhIHZTQn7UrGyOWHzFO0d86haksU+zIV25zONn4zpHrupylSvwB2JSoqYTUl/sotkoaU823wknt2aBHkbarO+6ncuIZgC2AtVaLerYrzQBz7MY/fevLAngisIgH/McmnvwTM3nTi5JxO5ue/ubCd7niNN3ylEiRD62+JOH3N52zgVTgV5Or6Fb2GvjycfViPSpA9ISLrfsigkhmjJ08qREQPUCseNA/JghxtzpIGCof1EYdoWYQOADw5MhGe2Zrtpvn6FFBRoM83jm05COdZVCtMG2JVyUY3IzmbSmuuAY5lKt350ymFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s0tH+pup/xz/4DK8QhSXxnJtPEAg9Ps42z57ZPsKYA=;
 b=8Y3Ammtw4XIDax8ChOtAu17c4m+xdP1x01j7dlJFSB2bZEH+Fq5bGgQhhHYB3hhCrofBToy/AzXKwa0t4Hnhw1P4M8spnxILaU/KuTtg0OcGgfy7S7TuD8NaD/XmreNU2tYc+E+Gs/XLwY3aCnLgN9gvCKZZH4Ldab64Z9IOeR4=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3684.eurprd08.prod.outlook.com (2603:10a6:208:106::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Sat, 18 Jul
 2020 09:58:45 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3174.029; Sat, 18 Jul 2020
 09:58:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQCAAAHigIAAAiYAgAAEaYCAAAVDgIAAAeSAgAAF4gCAAASxAIAAAtoAgAAyDwCAAPYZgA==
Date: Sat, 18 Jul 2020 09:58:45 +0000
Message-ID: <92495B3F-CCF4-40BE-9414-02DA2F338E64@arm.com>
References: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
 <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
In-Reply-To: <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:f1a2:5155:728:f8e7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f33773f-ded9-4fbf-bbf3-08d82b012de0
x-ms-traffictypediagnostic: AM0PR08MB3684:|VI1PR0801MB1662:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB166292D8FFD7D4323DAE08BA9D7D0@VI1PR0801MB1662.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 87hyaN7HASS8PGaAL0kJYgxTwY4pAQZ9RGwE7tFDjPWCHRnyaZEQQpsOpXMOdBCmMLOCEmA8wrNRFbTR1sma87WjqzUJuAu/XeCBvFtuazHkrxagmi1OTGHKiiJX2DbeOCqxKxjAwcMoKidKh6nYtUR75giXPjbfomhuFazDfGYHRBSZ+yrIpGOIw4H8KeXBSME+B53wNs6DQKgiawGZlbXrB1bG8/m7IrpW1JjWDTsGJ515eu4JBH0SIGOpMHwgsGcC1QrdU/apcQNP8kx+mMlZJsXNeBbpeWFpb4XPzquk1fLBkvFvC6t3SVPIXUNgyoRP/k0IktsB9LBVyiWcjQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(66946007)(86362001)(66476007)(64756008)(76116006)(53546011)(66446008)(6486002)(6916009)(66556008)(6506007)(91956017)(478600001)(36756003)(2906002)(2616005)(8936002)(4326008)(33656002)(5660300002)(71200400001)(8676002)(186003)(316002)(6512007)(83380400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BfkmrwTEvcLkd9IoKgFimfN4FpSBQ/5q2Oyx8muxWj1FXcbAwohHI3wYeHQx2O2YgK9ablf7Ke6cnhLHR5cyL/ffiblqaS3I2stktL6b5h66s+3+9m3unwCAKCVA+J2bQrKS/f9p3g6UgOPyWhuyPqPWSNBv4XSQ/zI7XfoHJ+ay1Bpl+4cwTwyJ05hNlCerrQz7pLTk6S9UEpIXtD8IYM3AcSL9zVNh80K6Eh4M9VCvYJ0fESqwiKwQtGqP4C8FFS+9yX3pYNElewoDisrN3xiM6AcIsoGha//NHfWnRkD5xY1ZKE/wZhilTQyRQyaKR14fsS8kHeZlgUOGc8glQcxs2vjS8kq8WKTVnrdC3JOgpWtXIp7YWkIwAxfFpxBgWYgMH8qjXuYpIGnv8q2CuSm8WvLMV12bxwli5fDYjQmnA+xdB0G1MGASp0r/tSjQzSnBgsscErFznW7D8IvgL77+V6PAIadwmBO5t3r8U0gnwMFWGY+hgxCfusZtJKjy+AKq9n3sgJhUFQER0wNKUDb+du9ZY0MTNe4AHn3oj6I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9674439EC461FC409BFC2A3119C21105@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3684
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(5660300002)(36756003)(336012)(33656002)(6506007)(82740400003)(26005)(186003)(2616005)(81166007)(82310400002)(53546011)(83380400001)(356005)(86362001)(47076004)(70586007)(70206006)(8676002)(478600001)(54906003)(6486002)(316002)(107886003)(36906005)(6512007)(4326008)(6862004)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 28a1bdbe-9247-4641-8c98-08d82b01290e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zc/YJJpKKo9OF7TXCDMHeeUDKEae3En+PzGfnH5L7k3K+Ii6gXEvuj3sNz2ylrEQk4Y4WZCwmVrMLHAQV5vlV8DC/+TDJJj0+GUcLLX6x/zhkU45GAH0DDeIgESyarpAHpGUss2BeGtq9Yb8kWEj8Fk+xpd8lu6SF5LsZm2OAVrld6sbBqFgDaBs4aLehi3kBQPlhXFilX2MRtVKpNoGnwjFhAjGnWWujbThe6UPwT4JlacvBf5fzpAUVIVF/uf5xWeUqavZi+ASNWLkKJf2C8ZWsMQQuhcpKFvTea7IbCddxy5Daqpgm1WOhjgp+MYTkmYaX83A82irWUziXRP2x71gbRECNNK+KsRYjBX5H1qkwo9aSnt9ZxXNNrzpbxZfDrdRYGymHAQerLUe4fh4yQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2020 09:58:53.5920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f33773f-ded9-4fbf-bbf3-08d82b012de0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1662
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
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDIxOjE3LCBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDE3LjA3LjIwIDE5OjE4LCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+IA0KPiBIZWxsbyBCZXJ0cmFuZA0KPiANCj4gW3R3byB0aHJlYWRzIHdpdGggdGhl
IHNhbWUgbmFtZSBhcmUgc2hvd24gaW4gbXkgbWFpbCBjbGllbnQsIHNvIG5vdCBjb21wbGV0ZWx5
IHN1cmUgSSBhbSBhc2tpbmcgaW4gdGhlIGNvcnJlY3Qgb25lXQ0KPiANCj4+IA0KPj4gDQo+PiBP
biAxNy8wNy8yMDIwIDE3OjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIEZyaSwg
SnVsIDE3LCAyMDIwIGF0IDAzOjUxOjQ3UE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6
DQo+Pj4+IA0KPj4+PiANCj4+Pj4+IE9uIDE3IEp1bCAyMDIwLCBhdCAxNzozMCwgUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiBG
cmksIEp1bCAxNywgMjAyMCBhdCAwMzoyMzo1N1BNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdy
b3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTc6MDUs
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IE9uIEZyaSwgSnVsIDE3LCAyMDIwIGF0IDAyOjQ5OjIwUE0gKzAwMDAsIEJlcnRy
YW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIDE3
IEp1bCAyMDIwLCBhdCAxNjo0MSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIEZyaSwgSnVsIDE3LCAyMDIwIGF0
IDAyOjM0OjU1UE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IE9uIDE3IEp1bCAyMDIwLCBhdCAxNjowNiwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
Pj4gT24gMTcuMDcuMjAyMCAxNTo1OSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+Pj4gT24gMTcgSnVsIDIwMjAsIGF0IDE1
OjE5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+
PiANCj4+Pj4+Pj4+Pj4+Pj4gT24gMTcuMDcuMjAyMCAxNToxNCwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4+PiBPbiAxNyBKdWwgMjAyMCwgYXQgMTA6MTAsIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4+Pj4gT24gMTYuMDcu
MjAyMCAxOToxMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICMgRW11bGF0
ZWQgUENJIGRldmljZSB0cmVlIG5vZGUgaW4gbGlieGw6DQo+Pj4+Pj4+Pj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+Pj4+Pj4+PiBMaWJ4bCBpcyBjcmVhdGluZyBhIHZpcnR1YWwgUENJIGRldmljZSB0cmVl
IG5vZGUgaW4gdGhlIGRldmljZSB0cmVlIHRvIGVuYWJsZSB0aGUgZ3Vlc3QgT1MgdG8gZGlzY292
ZXIgdGhlIHZpcnR1YWwgUENJIGR1cmluZyBndWVzdCBib290LiBXZSBpbnRyb2R1Y2VkIHRoZSBu
ZXcgY29uZmlnIG9wdGlvbiBbdnBjaT0icGNpX2VjYW0iXSBmb3IgZ3Vlc3RzLiBXaGVuIHRoaXMg
Y29uZmlnIG9wdGlvbiBpcyBlbmFibGVkIGluIGEgZ3Vlc3QgY29uZmlndXJhdGlvbiwgYSBQQ0kg
ZGV2aWNlIHRyZWUgbm9kZSB3aWxsIGJlIGNyZWF0ZWQgaW4gdGhlIGd1ZXN0IGRldmljZSB0cmVl
Lg0KPj4+Pj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+Pj4+IEkgc3VwcG9ydCBTdGVmYW5vJ3Mg
c3VnZ2VzdGlvbiBmb3IgdGhpcyB0byBiZSBhbiBvcHRpb25hbCB0aGluZywgaS5lLg0KPj4+Pj4+
Pj4+Pj4+Pj4+IHRoZXJlIHRvIGJlIG5vIG5lZWQgZm9yIGl0IHdoZW4gdGhlcmUgYXJlIFBDSSBk
ZXZpY2VzIGFzc2lnbmVkIHRvIHRoZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IGd1ZXN0IGFueXdheS4gSSBh
bHNvIHdvbmRlciBhYm91dCB0aGUgcGNpXyBwcmVmaXggaGVyZSAtIGlzbid0DQo+Pj4+Pj4+Pj4+
Pj4+Pj4gdnBjaT0iZWNhbSIgYXMgdW5hbWJpZ3VvdXM/DQo+Pj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+
Pj4+Pj4+Pj4+IFRoaXMgY291bGQgYmUgYSBwcm9ibGVtIGFzIHdlIG5lZWQgdG8ga25vdyB0aGF0
IHRoaXMgaXMgcmVxdWlyZWQgZm9yIGEgZ3Vlc3QgdXBmcm9udCBzbyB0aGF0IFBDSSBkZXZpY2Vz
IGNhbiBiZSBhc3NpZ25lZCBhZnRlciB1c2luZyB4bC4NCj4+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4+Pj4+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kOiBXaGVuIHRoZXJlIGFyZSBubyBQ
Q0kgZGV2aWNlIHRoYXQgZ2V0DQo+Pj4+Pj4+Pj4+Pj4+IGhhbmRlZCB0byBhIGd1ZXN0IHdoZW4g
aXQgZ2V0cyBjcmVhdGVkLCBidXQgaXQgaXMgc3VwcG9zZWQgdG8gYmUgYWJsZQ0KPj4+Pj4+Pj4+
Pj4+PiB0byBoYXZlIHNvbWUgYXNzaWduZWQgd2hpbGUgYWxyZWFkeSBydW5uaW5nLCB0aGVuIHdl
IGFncmVlIHRoZSBvcHRpb24NCj4+Pj4+Pj4+Pj4+Pj4gaXMgbmVlZGVkIChhZmFpY3QpLiBXaGVu
IFBDSSBkZXZpY2VzIGdldCBoYW5kZWQgdG8gdGhlIGd1ZXN0IHdoaWxlIGl0DQo+Pj4+Pj4+Pj4+
Pj4+IGdldHMgY29uc3RydWN0ZWQsIHdoZXJlJ3MgdGhlIHByb2JsZW0gdG8gaW5mZXIgdGhpcyBv
cHRpb24gZnJvbSB0aGUNCj4+Pj4+Pj4+Pj4+Pj4gcHJlc2VuY2Ugb2YgUENJIGRldmljZXMgaW4g
dGhlIGd1ZXN0IGNvbmZpZ3VyYXRpb24/DQo+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4gSWYg
dGhlIHVzZXIgd2FudHMgdG8gdXNlIHhsIHBjaS1hdHRhY2ggdG8gYXR0YWNoIGluIHJ1bnRpbWUg
YSBkZXZpY2UgdG8gYSBndWVzdCwgdGhpcyBndWVzdCBtdXN0IGhhdmUgYSBWUENJIGJ1cyAoZXZl
biB3aXRoIG5vIGRldmljZXMpLg0KPj4+Pj4+Pj4+Pj4+IElmIHdlIGRvIG5vdCBoYXZlIHRoZSB2
cGNpIHBhcmFtZXRlciBpbiB0aGUgY29uZmlndXJhdGlvbiB0aGlzIHVzZSBjYXNlIHdpbGwgbm90
IHdvcmsgYW55bW9yZS4NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gVGhhdCdzIHdoYXQgZXZl
cnlvbmUgbG9va3MgdG8gYWdyZWUgd2l0aC4gWWV0IHdoeSBpcyB0aGUgcGFyYW1ldGVyIG5lZWRl
ZA0KPj4+Pj4+Pj4+Pj4gd2hlbiB0aGVyZSBfYXJlXyBQQ0kgZGV2aWNlcyBhbnl3YXk/IFRoYXQn
cyB0aGUgIm9wdGlvbmFsIiB0aGF0IFN0ZWZhbm8NCj4+Pj4+Pj4+Pj4+IHdhcyBzdWdnZXN0aW5n
LCBhaXVpLg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gSSBhZ3JlZSBpbiB0aGlzIGNhc2UgdGhl
IHBhcmFtZXRlciBjb3VsZCBiZSBvcHRpb25hbCBhbmQgb25seSByZXF1aXJlZCBpZiBub3QgUENJ
IGRldmljZSBpcyBhc3NpZ25lZCBkaXJlY3RseSBpbiB0aGUgZ3Vlc3QgY29uZmlndXJhdGlvbi4N
Cj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBXaGVyZSB3aWxsIHRoZSBFQ0FNIHJlZ2lvbihzKSBhcHBl
YXIgb24gdGhlIGd1ZXN0IHBoeXNtYXA/DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gQXJlIHlvdSBn
b2luZyB0byByZS11c2UgdGhlIHNhbWUgbG9jYXRpb25zIGFzIG9uIHRoZSBwaHlzaWNhbA0KPj4+
Pj4+Pj4+IGhhcmR3YXJlLCBvciB3aWxsIHRoZXkgYXBwZWFyIHNvbWV3aGVyZSBlbHNlPw0KPj4+
Pj4+Pj4gDQo+Pj4+Pj4+PiBXZSB3aWxsIGFkZCBzb21lIG5ldyBkZWZpbml0aW9ucyBmb3IgdGhl
IEVDQU0gcmVnaW9ucyBpbiB0aGUgZ3Vlc3QgcGh5c21hcCBkZWNsYXJlZCBpbiB4ZW4gKGluY2x1
ZGUvYXNtLWFybS9jb25maWcuaCkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEkgdGhpbmsgSSdtIGNvbmZ1
c2VkLCBidXQgdGhhdCBmaWxlIGRvZXNuJ3QgY29udGFpbiBhbnl0aGluZyByZWxhdGVkDQo+Pj4+
Pj4+IHRvIHRoZSBndWVzdCBwaHlzbWFwLCB0aGF0J3MgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeSBs
YXlvdXQgb24gQXJtDQo+Pj4+Pj4+IEFGQUlDVD8NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IERvZXMgdGhp
cyBzb21laG93IHJlbGF0ZSB0byB0aGUgcGh5c2ljYWwgbWVtb3J5IG1hcCBleHBvc2VkIHRvIGd1
ZXN0cw0KPj4+Pj4+PiBvbiBBcm0/DQo+Pj4+Pj4gDQo+Pj4+Pj4gWWVzIGl0IGRvZXMuDQo+Pj4+
Pj4gV2Ugd2lsbCBhZGQgbmV3IGRlZmluaXRpb25zIHRoZXJlIHJlbGF0ZWQgdG8gVlBDSSB0byBy
ZXNlcnZlIHNvbWUgYXJlYXMgZm9yIHRoZSBWUENJIEVDQU0gYW5kIHRoZSBJT01FTSBhcmVhcy4N
Cj4+Pj4+IA0KPj4+Pj4gWWVzLCB0aGF0J3MgY29tcGxldGVseSBmaW5lIGFuZCBpcyB3aGF0J3Mg
ZG9uZSBvbiB4ODYsIGJ1dCBhZ2FpbiBJDQo+Pj4+PiBmZWVsIGxpa2UgSSdtIGxvc3QgaGVyZSwg
dGhpcyBpcyB0aGUgWGVuIHZpcnR1YWwgbWVtb3J5IG1hcCwgaG93IGRvZXMNCj4+Pj4+IHRoaXMg
cmVsYXRlIHRvIHRoZSBndWVzdCBwaHlzaWNhbCBtZW1vcnkgbWFwPw0KPj4+PiANCj4+Pj4gU29y
cnkgbXkgYmFkLCB3ZSB3aWxsIGFkZCB2YWx1ZXMgaW4gaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aCwgd3JvbmcgaGVhZGVyIDotKQ0KPj4+IA0KPj4+IE9oIHJpZ2h0LCBub3cgSSBzZWUgaXQgOiku
DQo+Pj4gDQo+Pj4gRG8geW91IHJlYWxseSBuZWVkIHRvIHNwZWNpZnkgdGhlIEVDQU0gYW5kIE1N
SU8gcmVnaW9ucyB0aGVyZT8NCj4+IA0KPj4gWW91IG5lZWQgdG8gZGVmaW5lIHRob3NlIHZhbHVl
cyBzb21ld2hlcmUgOikuIFRoZSBsYXlvdXQgaXMgb25seSBzaGFyZWQgYmV0d2VlbiB0aGUgdG9v
bHMgYW5kIHRoZSBoeXBlcnZpc29yLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGV5
IGFyZSBkZWZpbmVkIGF0IHRoZSBzYW1lIHBsYWNlIGFzIHRoZSByZXN0IG9mIHRoZSBsYXlvdXQs
IHNvIGl0IGlzIGVhc2llciB0byByZXdvcmsgdGhlIGxheW91dC4NCj4+IA0KPj4gQ2hlZXJzLA0K
PiANCj4gDQo+IEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHJlZ2FyZGluZyBhbiBJT01NVSBkcml2
ZXIgY2hhbmdlcyB3aGljaCBzaG91bGQgYmUgZG9uZSB0byBzdXBwb3J0IFBDSSBwYXNzLXRocm91
Z2ggcHJvcGVybHkuDQo+IA0KPiBEZXNpZ24gZG9jdW1lbnQgbWVudGlvbnMgYWJvdXQgU01NVSwg
YnV0IFhlbiBhbHNvIHN1cHBvcnRzIElQTU1VLVZNU0EgKHVuZGVyIHRlY2ggcHJldmlldyBub3cp
LiBJdCB3b3VsZCBiZSByZWFsbHkgbmljZSBpZiB0aGUgcmVxdWlyZWQgc3VwcG9ydCBpcyBleHRl
bmRlZCB0byB0aGF0IGtpbmQgb2YgSU9NTVUgYXMgd2VsbC4NCg0KV2Ugd2lsbCB0cnkgdG8gbWFr
ZSB0aGUgY29kZSBhcyBnZW5lcmljIGFzIHBvc3NpYmxlLiBGb3Igbm93IFNNTVUgaXMgdGhlIG9u
bHkgaGFyZHdhcmUgd2UgaGF2ZSAoYW5kIGlzIGEgc3RhbmRhcmQgYXJtIG9uZSkgc28gd2Ugd2ls
bCBzdGFydCB3aXRoIHRoYXQuDQpCdXQgd2UgYXJlIHdlbGNvbWluZyBvdGhlcnMgdG8gaW1wcm92
ZSBhbmQgYWRkIHN1cHBvcnQgZm9yIG1vcmUgZGlmZmVyZW50IGhhcmR3YXJlLg0KDQo+IA0KPiBN
YXkgSSBjbGFyaWZ5IHdoYXQgc2hvdWxkIGJlIGltcGxlbWVudGVkIGluIHRoZSBYZW4gZHJpdmVy
IGluIG9yZGVyIHRvIHN1cHBvcnQgUENJIHBhc3MtdGhyb3VnaCBmZWF0dXJlIG9uIEFybT8gU2hv
dWxkIHRoZSBJT01NVSBIL1cgYmUgIlBDSS1hd2FyZSIgZm9yIHRoYXQgcHVycG9zZT8NCg0KV2Ug
YXJlIHN0aWxsIG5vdCBvbiB0aGUgU01NVSBpbXBsZW1lbnRhdGlvbiBwYXJ0IGJ1dCBzaG91bGQg
YmUgb3VyIG5leHQgc3RlcC4NCkZlZWwgZnJlZSB0byBleHBsYWluIHVzIHdoYXQgd291bGQgYmUg
cmVxdWlyZWQgc28gdGhhdCB3ZSBjYW4gdGFrZSB0aGF0IGludG8gYWNjb3VudC4NCg0KUmVnYXJk
cw0KQmVydHJhbmQNCg0K

