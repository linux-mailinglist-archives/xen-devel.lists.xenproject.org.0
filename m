Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B772516DB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWVA-0005Pf-FH; Tue, 25 Aug 2020 10:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAWV9-0005Pa-Dz
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:48:27 +0000
X-Inumbo-ID: 3f1e98dd-ed66-474d-b69e-a2ee6b08c702
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f1e98dd-ed66-474d-b69e-a2ee6b08c702;
 Tue, 25 Aug 2020 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYKi3U0oHF66ATXWdLmhGDbwJa2bBQUEYl5Qhw/SRN0=;
 b=oF+ADz62f+oePuuo0Kl9Xl5/4doQC/A6OrHC7e4HDZK/LSEF7A8MZOcP3mPTIMZnjhJEctwO1vcTlKEXukFSUjltDH1rddTPNFTnbJ6Be5UFY6QOFYetzjQeNSq27GDXgTf31vKfCj7ciNHkFG93mVAGzBMNUf8C9TGRkQhmSBA=
Received: from AM0PR04CA0124.eurprd04.prod.outlook.com (2603:10a6:208:55::29)
 by VI1PR0802MB2221.eurprd08.prod.outlook.com (2603:10a6:800:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 10:48:23 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:55:cafe::ed) by AM0PR04CA0124.outlook.office365.com
 (2603:10a6:208:55::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:48:22 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 25 Aug 2020 10:48:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16b1783384f3cc22
X-CR-MTA-TID: 64aa7808
Received: from 479f4e86f3f8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79D99C00-D541-4A8F-AB4D-23759D652AD8.1; 
 Tue, 25 Aug 2020 10:47:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 479f4e86f3f8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 10:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLPrFJFhf8DKQqeozcaTIbFsY7l/gsJ9+C1KA12y8xGiRTcbnZ2jr1in7L9WJnT15MVAqRukky2lFDcIRJ5yrgUP0BcGe3aqXLAwdf8pKWBDh315rKugLT1RcZmikZ7ppuSu04TUIRjD8QsX3D7lk3XhbBnWAadkKKQqnrc/JOWqxbV2dPi/w0o6riwbAxeJleVwce+nlWXw7MZNCX5zjl+34XFmrAzOX7P32A0jkMXCZzp+8kzwv/bXLaXhpXrbV6ChcfoiyWfKPIFb1du4qruBoORNuBdzGJ3egVJ2SbvIz1iaYtbWQJ2cU+3qE06XIIn2ekAr5G8KxQ6E4hKvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYKi3U0oHF66ATXWdLmhGDbwJa2bBQUEYl5Qhw/SRN0=;
 b=NNnITz7+7KWGzfxoiLeA4t/T/RaYGinqYMr88Ymm/0llhiNeULl523XrNiSBKXgCPCJIEiEntRp/PpComwFK+XzO2F8ROd2jPkLszpsz6ASM/OEK+BD/Z1Ty8UrLxMpHKXT9nLBX1qHVvlz3S5/X41ClwK0tsYsbcWh9N5jxC8klO3IoaPpt/cnAaQf4zOsUtGLg3VmcOs09MEYp8dbpREvDEeXsJV79FUZmLvf7bAOK8Ylmh7Zvy9/eN0dqwXQybarFB+lcoMRhbFG2FPt/7G3AhLeBUVSil8I94b2WqCPzQt6NkLFkKCyia91AyTSl5/VgDfCuKjmFHiOpbWpjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYKi3U0oHF66ATXWdLmhGDbwJa2bBQUEYl5Qhw/SRN0=;
 b=oF+ADz62f+oePuuo0Kl9Xl5/4doQC/A6OrHC7e4HDZK/LSEF7A8MZOcP3mPTIMZnjhJEctwO1vcTlKEXukFSUjltDH1rddTPNFTnbJ6Be5UFY6QOFYetzjQeNSq27GDXgTf31vKfCj7ciNHkFG93mVAGzBMNUf8C9TGRkQhmSBA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5178.eurprd08.prod.outlook.com (2603:10a6:10:ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 10:47:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 10:47:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
 "sstabellini@kernel.org" <sstabellini@kernel.org>, Andre Przywara
 <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWecazJFpryBm0PEiL+drgXPmkLqlHQwyAgAA4rQCAAAcGAIAAogEAgACCBIA=
Date: Tue, 25 Aug 2020 10:47:43 +0000
Message-ID: <7802A1FD-A70B-4B79-9C4F-7EC7D3B6FE47@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
 <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
 <4CEBEFBA-6AEB-4CFC-B569-79056AAE0E3D@arm.com>
 <76da7a94-d53c-804d-54c6-b7ca52ffe61e@xen.org>
 <AM0PR08MB374767BD9D9EDA9C199B44629E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB374767BD9D9EDA9C199B44629E570@AM0PR08MB3747.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6994494-cd3f-41a3-18c6-08d848e4633b
x-ms-traffictypediagnostic: DB8PR08MB5178:|VI1PR0802MB2221:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2221D82EE3342991E6FCB24C9D570@VI1PR0802MB2221.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UO6sc7JhJsfPgPE3IOPffv0k16ZtMDR4oGds/BW2HIsTXHmJYgrYOTF6JBVkbs/nVIWYS9CtLZrF9Fgd8+S6fuRf5G4HT0HZ0BJH+aiGYsCCttan+ea+n9znFbWa7EqWowkk/sU22TgPpQu2Tvotyu64rPg6Wg5H5gEWW/2uOaAs9jYFXqrfduHVLIAHaJqO2jkn6LBLBspbMLk+SJ2VywjEPDITdF+XjmFsMXxOSJyibTS2gDRuQVVNyO2pOfX/RpmqLcNLVl9gUIBRz6iq2BSlhJ9+zu9mZ83qZwLT8TbdjmQKeQN0wgNsrl9gj8YrQlkC2DaGB4j7an2MQMaDjA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(6636002)(76116006)(66556008)(8676002)(86362001)(478600001)(66476007)(71200400001)(64756008)(66946007)(36756003)(2906002)(66446008)(83380400001)(33656002)(26005)(53546011)(91956017)(6486002)(8936002)(6862004)(54906003)(37006003)(5660300002)(6512007)(4326008)(6506007)(2616005)(316002)(15650500001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4UWf5Wozd1BGTZ34d6CRAkseQcLDErkcXVTRnTERapw+JNal8j3nIayQNSOVeTawzLcixHls0j7Lgb0GaCjZmF+9z0klkt4i8jbd7XLEOQ/OvWWY4vigLG6zuaEeslAogB1pDmqk96tHfWHCwIp4I2NRo/btt7zUb6SCfCri2dPX+ry725+pC0yQ5FU/A5eP4K5xfiXbB+Z378Y594Dm+CQJamw39pXM1R4zXxtReGYh6QSNbDiDQJKGiZFhSc3O7EJnyS9e43NlX5PceiUI6AIfu3qcOYtFlxqoc1XThSKXzc5JSi5UvPa015dvVdsrNUHf/vWZdTeyVK9kT19DdrJVJa0CJ8rfJKzvDH+poxQ84Q0vewO3jStqHvoMrSq/fVQpvjSd9TxX0MoDq80wKh1x51MlacIG0rr+jECNSAsKd1/OhDsWQquPu8H+sTWfXwML+h/iIGYF/gzRxR5+PeM5QO/ei7783Lo7Zfvo4RK+fhScQ5zQkBTz1SnGFNT7dl8oPayuL51dDwnFMrrtkLTMUH2fMQtxs/pa+fSXheDs+QeJBm90PI1oduZiIBOnSOU+3LrmPBNKTrakafC2z5cJDBNLZW8DYtKWGOweFDCZEMOK6Eeuf1PC3omhtlsqEjSGhLYCHxf54P2La/uFhQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB214A90104DFF4CBDE29D0AAB388E86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5178
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 258c2666-70c8-4ae9-ae22-08d848e44c2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhZMzXiLDMXR7fq5Bktof3tkcoz4Nvi5WHCGAZBbJ2nWfJBiZrG27KEhPg1otxM+6AVX3yVixflo9yKL6qEJmGYwdRkuOl97ToQJxj/Y1uEVd16tljK6YFUsidvz0jXtG9gXG2izABYcm2ArKsebUZRnxnvLFLLB05dnv+B5cqndi834Erx+EzISSQj2Kuol0C1XgQWy4lrupSGTS3tIyhQAqcAhgaXioSkzCCJPUXq36Dubd2Bb7ymealp+CS/Sd5Ruhsv/gNZe46OVepMfGufs+GVqoyXrAyd5rNZws+jlrpAkfnmiSusqSCRmcnbsO/ZaF0QHc3iz4us01xD08eepc1t/B++VErT+My/DkNgJwtMeJg0g1e9ickPEwQ+rgVmqMfhquNf7bmLaN1xrZA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(336012)(6512007)(53546011)(6506007)(8936002)(26005)(86362001)(5660300002)(33656002)(2906002)(186003)(36756003)(8676002)(82740400003)(83380400001)(2616005)(54906003)(4326008)(15650500001)(6636002)(70206006)(478600001)(316002)(6862004)(70586007)(47076004)(81166007)(36906005)(6486002)(37006003)(356005)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 10:48:22.6366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6994494-cd3f-41a3-18c6-08d848e4633b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2221
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDA0OjAyLCBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT4gd3JvdGU6DQo+IA0KPiBIaSBKdWxpZW4sIEJlcnRyYW5kLA0KPiANCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0K
Pj4gU2VudDogMjAyMOW5tDjmnIgyNeaXpSAxOjIzDQo+PiBUbzogQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0u
Y29tPjsgWGVuLWRldmVsIDx4ZW4tDQo+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc7IEFuZHJlIFByenl3YXJhDQo+PiA8QW5kcmUuUHJ6eXdhcmFA
YXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgS2FseQ0KPj4gWGlu
IDxLYWx5LlhpbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDIvMl0geGVuL2FybTogVGhyb3cgbWVzc2FnZXMgZm9yIHVua25vd24NCj4+IEZQL1NJ
TUQgaW1wbGVtZW50IElEDQo+PiANCj4+IA0KPj4gDQo+PiBPbiAyNC8wOC8yMDIwIDE3OjU3LCBC
ZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IEhpIEp1bGllbiwNCj4+IA0KPj4gSGksDQo+PiAN
Cj4+PiANCj4+Pj4gT24gMjQgQXVnIDIwMjAsIGF0IDE0OjM0LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIFdlaSwNCj4+Pj4gDQo+Pj4+IE9uIDI0
LzA4LzIwMjAgMDQ6MjgsIFdlaSBDaGVuIHdyb3RlOg0KPj4+Pj4gQXJtIElEX0FBNjRQRlIwX0VM
MSByZWdpc3RlciBwcm92aWRlcyB0d28gZmllbGRzIHRvIGRlc2NyaWJlIENQVQ0KPj4+Pj4gRlAv
U0lNRCBpbXBsZW1lbnRhdGlvbnMuIEN1cnJlbnRseSwgd2UgZXhhY3RseSBrbm93IHRoZSBtZWFu
aW5nIG9mDQo+Pj4+PiAweDAsIDB4MSBhbmQgMHhmIG9mIHRoZXNlIGZpZWxkcy4gWGVuIHRyZWF0
cyB2YWx1ZSA8IDggYXMgRlAvU0lNRA0KPj4+Pj4gZmVhdHVyZXMgcHJlc2VudGVkLiBJZiB0aGVy
ZSBpcyBhIHZhbHVlIDB4MiBidW1wZWQgaW4gdGhlIGZ1dHVyZSwNCj4+Pj4+IFhlbiBiZWhhdmlv
cnMgZm9yIHZhbHVlIDw9IDB4MSBjYW4gYWxzbyB0YWtlIGVmZmVjdC4gQnV0IHdoYXQgWGVuDQo+
Pj4+PiBkb25lIGZvciB2YWx1ZSA8PSAweDEgbWF5IG5vdCBhbHdheXMgY292ZXIgbmV3IHZhbHVl
IDB4MiByZXF1aXJlZC4NCj4+Pj4gDQo+Pj4+IFJpZ2h0LCBidXQgdGhpcyB3aWxsIGFsc28gaGFw
cGVuIHdpdGggYWxsIHRoZSBvdGhlciBmZWF0dXJlcy4gVGhpcyBtYXkNCj4+IGFjdHVhbGx5IGNv
bmZ1c2UgdGhlIHVzZXJzIGFzIHRoZXkgbWF5IHRoaW5rIHRoZSByZXN0IG9mIHRoZSBmZWF0dXJl
cyBhcmUgZnVsbHkNCj4+IHN1cHBvcnRlZCB3aGljaCBpcyBub3QgY29ycmVjdC4gRm9yIGluc3Rh
bmNlLCBkb20wIHdpbGwgY3Jhc2ggaWYgeW91IGJvb3QgWGVuDQo+PiBvbiBhIFNWRS1jYXBhYmxl
IGhhcmR3YXJlLg0KPj4+IA0KPj4+IEkgd291bGQgc2VlIHRoaXMgYXMgYW4gaW1wcm92ZW1lbnQg
YWxyZWFkeS4NCj4+IA0KPj4gVEJILCBJIG9ubHkgdmlldyB0aGlzIHBhdGNoIGFzIGEgYmFuZC1h
aWQuIEkgYW0gT0sgd2l0aCB0aGVtIGJ1dCB0aGV5DQo+PiBuZWVkIHRvIGJlIHVzZWZ1bC4NCj4+
IA0KPj4gV2hlbiBJIHJlYWQgInVua25vd24gdmFsdWUuLi4iLCBJIGhhdmUgbm8gY2x1ZSB3aGV0
aGVyIHRoZSBtZXNzYWdlIGlzDQo+PiBnb29kIG9yIGJhZC4gSXQgd291bGQgYmUgYmV0dGVyIHRv
IGV4dGVuZCB0aGUgbWVzc2FnZSB3aXRoIHdoYXQgY291bGQgZ28NCj4+IHdyb25nLiBFLmcgIlVu
a25vd24gdmFsdWUgWCwgdGhpcyBtYXkgcmVzdWx0IHRvIGNvcnJ1cHRpb24gb24gdGhlIHBsYXRm
b3JtIi4NCj4+IA0KPiANCj4+IEkgd291bGQgYWxzbyBjb25zaWRlciB0byB0YWludCBYZW4gYXMg
aXQgbWF5IGJlY29tZSB1bnN0YWJsZSB3aXRoIHRoaXMNCj4+IG9wdGlvbiBzZXQuDQo+PiANCj4g
DQo+IEhtbSwgeWVzLCBpdCBzZWVtcyBjdXJyZW50IG1lc3NhZ2VzIGFyZSBwYWxlLiBUaGUgdXNl
ciBjb3VsZCBub3QgdW5kZXJzdGFuZA0KPiB3aGF0IHdlIHdhbnQgdGhlIG1lc3NhZ2UgZXhwcmVz
c2VkIHdoZW4gaGUgZ290IG9uZSBzdWNoIG1lc3NhZ2UuIEkgd2lsbCBpbXByb3ZlDQo+IHRoZW0g
dG8gZ2l2ZSB1c2VyIGEgY2xlYXIgbWVhbmluZy4gQW5kIEkgdGhpbmsgYSBYRU5MT0dfV0FSTklO
RyB3b3VsZCBiZSBiZXR0ZXINCj4gdG8gbm90aWNlIHVzZXIuIEkgd2lsbCBkbyB0aGVtIGluIHYz
Lg0KPiANCj4+PiBNb3JlIGNvdWxkIGJlIGRvbmUgZm9yIFNWRSAoYW5kIG90aGVyIGJpdHMpIGJ1
dCB0aGlzIHNob3VsZCBiZSBpbiBhbm90aGVyDQo+PiBwYXRjaCBzZXQuDQo+Pj4gDQo+Pj4+IA0K
Pj4+Pj4gV2UgdGhyb3cgdGhlc2UgbWVzc2FnZXMgdG8gYnJlYWsgdGhlIHNpbGVuY2Ugd2hlbiBY
ZW4gZGV0ZWN0ZWQNCj4+Pj4+IHVua25vd24gRlAvU0lNRCBJRHMgdG8gbm90aWNlIHVzZXIgdG8g
Y2hlY2suDQo+Pj4+IA0KPj4+PiBJdCBmZWVscyBhIGJpdCBvZGQgdG8gbWUgdG8gcHJpbnQgdW5r
bm93biBmb3IgdGhlIEZQL1NJTUQgZmVhdHVyZSBidXQgbm90DQo+PiBmb3IgYWxsIHRoZSByZXN0
Lg0KPj4+PiANCj4+Pj4gSU1ITywgdGhlIHJpZ2h0IGFwcHJvYWNoIGlzIHRvIHNhbml0aXplIElE
IHJlZ2lzdGVycyBleHBvc2VkIHRvIGRvbWFpbnMNCj4+IGFuZCBvbmx5IGV4cG9zZSBmZWF0dXJl
cyB3ZSBrbm93IGFyZSBjb3JyZWN0bHkgaGFuZGxlZC4NCj4+PiANCj4+PiBJIGFjdHVhbGx5IHN0
YXJ0ZWQgdG8gbG9vayBpbnRvIHRoaXMgbGFzdCB3ZWVrIGJlY2F1c2UgSSBjYW1lIHRvIGFuIGlz
c3VlDQo+PiBjb21wYXJhYmxlIHRvIFNWRSB3aXRoIHBvaW50ZXIgYXV0aGVudGljYXRpb24uDQo+
Pj4gTWF5YmUgd2Ugc2hvdWxkIGRpc2N1c3MgdGhpcyBzdWJqZWN0IHNlcGFyYXRlbHkgYXMgY2xl
YXJpbmcgVElEMyBiaXQgaW4gSENSDQo+PiBhbmQgZW11bGF0aW5nIGFsbCBJRCByZWdpc3RlcnMg
aXMgcG9zc2libGUNCj4+PiBidXQgSSB3YW50IHRvIGNoZWNrIGZpcnN0IGlmIHRoaXMgY291bGQg
aGF2ZSBiaWcgaW1wYWN0cyBvbiBwZXJmb3JtYW5jZXMNCj4+IA0KPj4gSSBkb24ndCBleHBlY3Qg
YW55IHBlcmZvcm1hbmNlIGRyb3AuIEluIExpbnV4LCB0aGV5IHdpbGwgY2FjaGUgYWxsIHRoZQ0K
Pj4gdmFsdWVzIGFuZCB1c2UgYWx0ZXJuYXRpdmUgdG8gYXZvaWQgcnVudGltZSBjaGVjay4NCj4+
IA0KPj4gSSBhbHNvIGRvbid0IGV4cGVjdCBhbnkgT1MgdG8gdXNlIHRoZW0gYXQgcnVudGltZSBp
biBob3RwYXRoLg0KPj4gDQo+IA0KPiBJIHRoaW5rIHRoaXMgd291bGQgbm90IGJlIGEgcHJvYmxl
bS4gTW9zdCBJRCBjaGVjayBvcGVyYXRpb25zIHdvdWxkIGJlIGRvbmUNCj4gaW4gc3lzdGVtL2Fw
cGxpY2F0aW9uIGluaXRpYWxpemF0aW9uIHN0YWdlLg0KPiANCj4+PiBhbmQgc2VlIGRpc2N1c3Mg
aG93IHRvIGRlc2lnbiB0aGlzIGFzIHRoZXJlDQo+Pj4gY291bGQgYmUgYSBodWdlIGFtb3VudCBv
ZiBjYXNlcyBmb3IgZXhhbXBsZSBpZiB3ZSB3YW50IHRvIGFsbG93IGRpZmZlcmVudA0KPj4gcGFy
YW1ldGVycyBmb3IgZGlmZmVyZW50IGRvbWFpbnMuDQo+PiANCj4+IEkgd291bGQgc3VnZ2VzdCB0
byBmaXJzdCBjb25zaWRlciBhIHNpbXBsZSBhcHByb2FjaCB3aGVyZSB3ZSBleHBvc2UgdGhlDQo+
PiBzYW1lIHZpZXcgb2YgdGhlIElEIHJlZ2lzdGVycyB0byBhbGwgdGhlIGd1ZXN0cyBidXQgaXQg
aXMgc2FuaXRpemVkLg0KPj4gDQo+IA0KPiBDYW4gSSBhc2sgdGhlIHJlYXNvbiB3aHkgd2UgZG9u
J3QgZXhwb3NlIG5hdGl2ZSBJRCByZWdpc3RlcnMgdG8gZ3Vlc3Q/IElzIGl0IGJlY2F1c2UNCj4g
d2Ugd2FudCB0byBhdm9pZCBndWVzdCB1c2luZyBzb21lIHVuYXdhcmUgZmVhdHVyZXMgb2YgWGVu
Pw0KDQpXZSBzaG91bGQgYXZvaWQgZ3Vlc3QgdXNpbmcgZmVhdHVyZXMgdGhhdCB3ZSBkbyBub3Qg
c3VwcG9ydCBvciB0aGF0IHdlIGRvIG5vdCBldmVuDQplbmFibGUuDQoNCklmIHlvdSB0YWtlIFNW
RSBvciBQb2ludGVyIEF1dGhlbnRpY2F0aW9uLCB3ZSBhcmUgbm90IGFjdGl2YXRpbmcgdGhlIGJp
dHMgaW4gSENSIG9yIENQVFINCnRvIGxldCBhIGd1ZXN0IHVzZSB0aG9zZSBzbyB0aGUgZmFjdCB0
aGF0IHdlIHN0aWxsIGxldCB0aG9zZSBiaXQgc2V0IGluIHRoZSBwcm9jZXNzb3INCmZlYXR1cmVz
IHJlZ2lzdGVycyBpcyBtYWtpbmcgZ3Vlc3RzIHRyeSB0byB1c2UgdGhlbSBhbmQgY3Jhc2guDQoN
Cj4gDQo+PiBXZSBjYW4gdGhlbiBkaXNjdXNzIHdoZXRoZXIgd2Ugd2FudCB0byBoYXZlIGEgcGVy
LWd1ZXN0IHZpZXcgb2YgdGhlIElEDQo+PiByZWdpc3RlcnMgYW5kIGhvdyB0byBjb25maWd1cmUg
aXQuDQo+PiANCj4+IFJlZ2FyZGluZyB0aGUgaW1wbGVtZW50YXRpb24sIEkgcGVyc29uYWxseSBx
dWl0ZSBsaWtlIHRoZSBMaW51eA0KPj4gY3B1ZmVhdHVyZSBmcmFtZXdvcmsuIEl0IGlzIHF1aXRl
IHBvd2VyZnVsIGFuZCBJIGJlbGlldmUgd291bGQgc3VpdA0KPj4gcXVpdGUgd2VsbCBYZW4uDQo+
PiANCj4gDQo+IEkgYWdyZWUgd2l0aCB5b3UuIEJ1dCBJIHRoaW5rIGlzIHF1aXRlIGh1Z2UsIGFu
ZCBvdXQgb2YgdGhpcyBwYXRjaCBzZXQncyBzY29wZS4NCj4gV2UgbmVlZCBhIHNlcGFyYXRlIHRo
cmVhZCB0byBkaXNjdXNzIHRoZSBkZXNpZ24gYW5kIGltcGxlbWVudC4NCg0KRGVmaW5pdGVseSB0
aGlzIGlzIG91dCBvZiBzY29wZSBvZiB0aGlzIHBhdGNoIEkgYWdyZWUuDQoNClJlZ2FyZHMNCkJl
cnRyYW5kDQoNCg==

