Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19D29CF90
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 11:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13521.34191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXivj-00054a-47; Wed, 28 Oct 2020 10:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13521.34191; Wed, 28 Oct 2020 10:43:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXivj-00054B-0v; Wed, 28 Oct 2020 10:43:47 +0000
Received: by outflank-mailman (input) for mailman id 13521;
 Wed, 28 Oct 2020 10:43:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kXivh-000546-CC
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:43:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bd61bbe-094d-47fe-b4f1-2adbe0506b5d;
 Wed, 28 Oct 2020 10:43:41 +0000 (UTC)
Received: from AM6P193CA0104.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::45)
 by DB6PR0801MB1896.eurprd08.prod.outlook.com (2603:10a6:4:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 10:43:39 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::9e) by AM6P193CA0104.outlook.office365.com
 (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24 via Frontend
 Transport; Wed, 28 Oct 2020 10:43:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 10:43:38 +0000
Received: ("Tessian outbound c579d876a324:v64");
 Wed, 28 Oct 2020 10:43:38 +0000
Received: from 8a2f2841c1e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB750250-8116-48BF-B724-4806D14E1944.1; 
 Wed, 28 Oct 2020 10:43:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a2f2841c1e9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 10:43:30 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM4PR08MB2803.eurprd08.prod.outlook.com (2603:10a6:205:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 28 Oct
 2020 10:41:57 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 10:41:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kXivh-000546-CC
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:43:45 +0000
X-Inumbo-ID: 4bd61bbe-094d-47fe-b4f1-2adbe0506b5d
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [40.107.13.84])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4bd61bbe-094d-47fe-b4f1-2adbe0506b5d;
	Wed, 28 Oct 2020 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs7F69O9QoS00esJRc3gJv0VF6Rg8v0f/788uBjM3OY=;
 b=suyoFX60CpXSYBvrZimOMQ5bVFzyxTibPXOjnM600k/zbdWaU/C8iYlZtEls9W+BIQJ+Tcj8fo5trFHSHt62AfEhSv610qCC+C0yT4+zBAiVyaZxj7uxDZ7B2VFRS6Lj/lG+UExhqfp7jmU1a9QUBnAGIZdGsOgrB5k2nqMgPfE=
Received: from AM6P193CA0104.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::45)
 by DB6PR0801MB1896.eurprd08.prod.outlook.com (2603:10a6:4:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 10:43:39 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::9e) by AM6P193CA0104.outlook.office365.com
 (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24 via Frontend
 Transport; Wed, 28 Oct 2020 10:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 10:43:38 +0000
Received: ("Tessian outbound c579d876a324:v64"); Wed, 28 Oct 2020 10:43:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acc32d9821f80553
X-CR-MTA-TID: 64aa7808
Received: from 8a2f2841c1e9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB750250-8116-48BF-B724-4806D14E1944.1;
	Wed, 28 Oct 2020 10:43:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a2f2841c1e9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 10:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDqCdut410/4+XCKQmLaX/NdR7ggr7+/6nyR6JhIOPOESOUt+ixy4a6A3kPQe5F7nSaaLB0fV0YVi5qpVVoSanwgxDsUYeL1VDxSzkzZ7jwqkW7UAqYiyg5Gu4j8AepucgdHOx3l7Op+YB0l5szWDlLEyCYVmRqcGXDCJhDIrXV0ZNjQQu62iUmo3GB7haYm2c8s7GUFsdasbIsdc+wZiIWRXMnOeqksQ7Iz+TR3Fpk8hLK3v0gQ1zA7Ufdj1Ula5sE4z0Iq7YdG+yi+QF0ofXNDS4xKpTTIbLYB6U7Jt3WGGr6ARPTlqIEWT6cdiA9Ih8LnbPgnbl7F0+3Q8t2lCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs7F69O9QoS00esJRc3gJv0VF6Rg8v0f/788uBjM3OY=;
 b=MHIa2mHRkXWPfJQWeN1yMkQ/rSQmWDYsYmnCFpVpZBYoxf8w43tJ+z7zvUXrsTP7cd2hwUT6B4vHBQFxQV+HdKVsFl1fnKpHjPWYuDGf1qJvE2iMq7A0xlfjwMAluOp++gYp8oi2m92HAY7rQfLI9CEpyQduz5WZgZNtbM6gCmCuuLlNN6onanINofYnUCJd72Hlf9EU7gsH17SCW1qfiW+lmEBQvMLQmc/HhTTfqnQ7nEz65wMKj9NcEj/LyyvSROVov+ZhOpitObvTaULZ8MmD2jXVPbpfR1hSroIvEmeL7/evBtiqW2plCpZcocxwCDBrD60uJhdZutogvUBz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs7F69O9QoS00esJRc3gJv0VF6Rg8v0f/788uBjM3OY=;
 b=suyoFX60CpXSYBvrZimOMQ5bVFzyxTibPXOjnM600k/zbdWaU/C8iYlZtEls9W+BIQJ+Tcj8fo5trFHSHt62AfEhSv610qCC+C0yT4+zBAiVyaZxj7uxDZ7B2VFRS6Lj/lG+UExhqfp7jmU1a9QUBnAGIZdGsOgrB5k2nqMgPfE=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM4PR08MB2803.eurprd08.prod.outlook.com (2603:10a6:205:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 28 Oct
 2020 10:41:57 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 10:41:57 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Topic: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Index: AQHWq7waQtOOhLtUwkWCA6LhLv3lTamsG2AAgACCJwCAADjrgA==
Date: Wed, 28 Oct 2020 10:41:57 +0000
Message-ID: <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
 <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
In-Reply-To: <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4af4e108-e5a3-48c2-5d75-08d87b2e5484
x-ms-traffictypediagnostic: AM4PR08MB2803:|DB6PR0801MB1896:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB18965FD008816D2E22E1492BFC170@DB6PR0801MB1896.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0pYyEzA5UoZJ4EwuF/i/kTRKEYYRSw71tvPyoovxnyC/OT1ISEKobByQuEJqr9yKCQGtn5WnxqQOUDylMgJxd4xpu7IIV6wZC3YkdNkn56cDn94IU/3RKNd2+mgHbNwAie2s8mT44Cvk4Kt/QRTdHol+ACn7ZWH78PQnqxrMCvLCrJBk1NCEaiFyG5BOyvz2J+2iq/5uWoed8W968rN0rmDFoOCTLzO+E1WZH/DhWr1dmFGUS0UUA6RyBjoBAUanwD8T4dUytaLAga2O3/W5sheQ5MwYhS8TeUOCenrKCCFDJ18PGST0l1a8ua/fnGCcpAlNmoRkmpdJjVy/IMdtBA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(54906003)(316002)(86362001)(6916009)(5660300002)(66946007)(36756003)(66446008)(66476007)(66556008)(76116006)(91956017)(71200400001)(2616005)(8676002)(6512007)(53546011)(186003)(64756008)(33656002)(2906002)(6486002)(8936002)(4326008)(6506007)(26005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 EcHxc3aJf5HAakQErZLK2pz0Kq7G0wMZ9QjnZ2ORgzgzlaQC3OOTF9u5zcfcaLZs1BHgft4fDaxIynn255LyYm90cZfQGBLxtR3kNoNg45PhiRhLT7ebxmeG2aSEhx3Adsq9j77rtNO/UjjosDGsuhu3y9SkVOmOEPq6l3uAuiDQFcsukYPg7bdIBn2qsWbdLJz9FohMOIhVZv2PsUohkaT+kOQcmhZftSZCC6uFbPcdHiCklZcrNxFSTdUSAnXu9vNSertls2PmkRqdpxp+1raoQhUvtP5j9EIXq7T+xd/YU0oMnVL5ymzfET17OWf/GEOkmbhpN8NdJ1URFTCzO/oiuu+Ylvmko7BoNy+ra7CAYH0oNtptd2wNumsp8YkVfasLMbCOZo/SZIGVUFcnb8iT9QLTRdomXUPuFnZaHtFsHUD41AhY29djAcxUeuVLmvGRPJSZZl7vUZGsZ2PjSO2hsxW+HVteiTPcN1l5Q4wU0ZRu5Id4AX/rALZgccA+r7sPY7fitVMiZVHef6vw4eK6GGLuAkwU2904oE2bIQFYCnUDXrx7rOtelIPdLBo3Irz+w+jTnHsdwUFi5xA/R5VkN2tk/cgcTJA6mvcVb240tzi0isIkShL5LJrO0chTV3eI/qukQEkoz44G15OCXg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DEB15AEC5641241A529044A4096E841@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2803
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e4be5d01-ff8c-43a8-ebca-08d87b2e1833
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q27Xs5lNSVG6xOC3n6Y/IxoDtUzXrQrMH193qa9lRb+0QwtaHN0RUrTqpx7UaiWxYY27nD2eBdTO20PisQayuC6qTvzKhLyc31TjaETDiAlcPLb5dTUHoUux5YBsIrT/b5B4RWvjj54MTYSOJJReIXFotVuEcQ60AgM+/bi59bLJFcVJAlPRTkgUoKDHs4K9EuEY1ARmYDRlpilDP0F7UJMq8MCF5kEdTb+OiO+Yxtwe7OPEypO2R0Lto0BmqLGfxB5nn7O3aIVUq9fRr5UIYeOYdq11yZjwgUyqBP5+P2ffr4U4IlBPF1eXdAq/GcKuvFqR6uTTQpwCwjzJKsPr4ouiu6zlQ3a7BaMbAxvw0awqd8bNEt3CZPwtT1PHBWco0DCwtCbMHOEXojyvpvvaJQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(336012)(86362001)(8936002)(70206006)(82740400003)(47076004)(54906003)(81166007)(478600001)(6506007)(8676002)(53546011)(356005)(4326008)(316002)(2906002)(2616005)(33656002)(36756003)(186003)(6486002)(36906005)(6862004)(70586007)(5660300002)(6512007)(82310400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 10:43:38.8978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af4e108-e5a3-48c2-5d75-08d87b2e5484
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1896

Hello Jan,

> On 28 Oct 2020, at 7:18 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.10.2020 00:32, Stefano Stabellini wrote:
>> On Mon, 26 Oct 2020, Rahul Singh wrote:
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -4,6 +4,13 @@ config HAS_NS16550
>>> 	help
>>> 	  This selects the 16550-series UART support. For most systems, say Y.
>>>=20
>>> +config HAS_NS16550_PCI
>>> +	bool "NS16550 UART PCI support" if X86
>>> +	default y
>>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>>> +	help
>>> +	  This selects the 16550-series UART PCI support. For most systems, s=
ay Y.
>>=20
>> I think that this should be a silent option:
>> if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
>> otherwise -> automatically disable
>>=20
>> No need to show it to the user.
>=20
> I agree in principle, but I don't see why an X86 dependency gets
> added here. HAS_PCI really should be all that's needed.
>=20

Yes you are right . I will remove the X86 and make HAS_NS16550_PCI depend o=
n "HAS_NS16550 && HAS_PCI"
> Jan

Regards,
Rahul=

