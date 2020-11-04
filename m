Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9242A6632
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19192.44410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJaJ-0002lI-Jj; Wed, 04 Nov 2020 14:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19192.44410; Wed, 04 Nov 2020 14:16:23 +0000
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
	id 1kaJaJ-0002ks-G4; Wed, 04 Nov 2020 14:16:23 +0000
Received: by outflank-mailman (input) for mailman id 19192;
 Wed, 04 Nov 2020 14:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJaI-0002km-2S
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dcdabb3-5564-4839-a402-ec156bf8094c;
 Wed, 04 Nov 2020 14:16:20 +0000 (UTC)
Received: from DB6PR0601CA0006.eurprd06.prod.outlook.com (2603:10a6:4:7b::16)
 by AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:18 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::62) by DB6PR0601CA0006.outlook.office365.com
 (2603:10a6:4:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:17 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Wed, 04 Nov 2020 14:16:17 +0000
Received: from 739ac3104fd4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5271CC01-2434-44DC-8D23-6C5D1A2F3577.1; 
 Wed, 04 Nov 2020 14:16:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:16:11 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:06 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJaI-0002km-2S
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:22 +0000
X-Inumbo-ID: 8dcdabb3-5564-4839-a402-ec156bf8094c
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.45])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8dcdabb3-5564-4839-a402-ec156bf8094c;
	Wed, 04 Nov 2020 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW2cmnJ4td5WLg2T2a7LdO1bQQWTx78DnYa+I7gXtlA=;
 b=RXisbY90pmz337GXmlaOE1WRnRZfVGpjc18Q9Bl8T1lQX41M6+GVttrITu3wlR6wZf1XU3cen/24Bk4TRYHnxtNsDsrsbux/waCUQF1vQegef8QA7kjiPDulnESSJSA68lu9NQbYCMNHqg5nBLswcs6PwN10l67MkPnmmkJNseI=
Received: from DB6PR0601CA0006.eurprd06.prod.outlook.com (2603:10a6:4:7b::16)
 by AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:18 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::62) by DB6PR0601CA0006.outlook.office365.com
 (2603:10a6:4:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:17 +0000
Received: ("Tessian outbound c189680f801b:v64"); Wed, 04 Nov 2020 14:16:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb9f7c4593f37762
X-CR-MTA-TID: 64aa7808
Received: from 739ac3104fd4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5271CC01-2434-44DC-8D23-6C5D1A2F3577.1;
	Wed, 04 Nov 2020 14:16:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:16:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAADdRQdj9bO0ckwZnyesmilnhbOjHtGS6iVpyxUpL4p+v/zGT2Dmc25nt/YGt334ZKg648ykVFLxdi2X7co6JdOXWo2FDFW0qbooqSBA2OKsMRf7SsEhn3702JZAsZgRSQIrxUOih/Th8D7swcI9uXLQlJo1T6ATzFgb0RIM7eESTxtjNy9KnFI+UFNndxaz48dYIEGDL22cKFkFk8VTDq5WODinvNaExRSjVlOosXAxlReUjJZNv9Mmc3AvgFKo7SyF+6tbiZnYAkYFmimDLrg15avnmKBHz/rnYLnBxVYLyXGy0XUcxY89G6yvxcO8AskqTO052wHDOcpa0yZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW2cmnJ4td5WLg2T2a7LdO1bQQWTx78DnYa+I7gXtlA=;
 b=OaaZh6cln8mCre9oRXM/gXuRGRRzdWNA5AUmlOyFLKdszONUv18fAlv09bEiAxjdveqrua5yrbA5l7aSD+t6HehSElOhqbz/oJe9uFAR141DG4FloPjGtLnCwNwmkycoGfE14HsVmGTKoWrVlCdmbxC+4x7tP9dFQEr1ZiN5vG2huufzg8dp8eaK4mJL96czcEhKUuKlY5IB7ahdUk+BtNBau2WZsjpgO08pLQu7CRwod7iIVS1gGhoD8hsncq7VNPGvuNbCesTv28llFMTgmpWEUfYGr9qy+/qSt+y/KQxtOKW6EK9u7ODfNaRkS20PdVmMOBIJ2/79k98crs3NGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW2cmnJ4td5WLg2T2a7LdO1bQQWTx78DnYa+I7gXtlA=;
 b=RXisbY90pmz337GXmlaOE1WRnRZfVGpjc18Q9Bl8T1lQX41M6+GVttrITu3wlR6wZf1XU3cen/24Bk4TRYHnxtNsDsrsbux/waCUQF1vQegef8QA7kjiPDulnESSJSA68lu9NQbYCMNHqg5nBLswcs6PwN10l67MkPnmmkJNseI=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:06 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:06 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Topic: [PATCH v2 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Index: AQHWsfp6PdgZRIW/7EK8sYDcgU4ri6m4BhwA
Date: Wed, 4 Nov 2020 14:16:06 +0000
Message-ID: <E02CAC20-7E95-458A-9B91-F4C9C400DED5@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <2aa79510731918d78d515a1679cc141fcf16883e.1604417224.git.rahul.singh@arm.com>
In-Reply-To:
 <2aa79510731918d78d515a1679cc141fcf16883e.1604417224.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a61ff4e6-ed7d-40b3-69c8-08d880cc3254
x-ms-traffictypediagnostic: AM0PR08MB2963:|AM9PR08MB6114:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB61144452AB01CBA93C37CBF39DEF0@AM9PR08MB6114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 icXjoqASnSZQF8K+Z+PqjNRG55QFjqKS8U6v91YDgn94Yt350w9mIo/leeHPt/kvPbyNyciFhQ4/7JPjX+H+RV7tcnmD7+1MBopaSlQw3qIm0eslA7N6zUPTYZbYdzXpfuUMAon85XGzmpgdAoy3bf5QTrYjDHov8cT0ylk0XmJBaGy+VJD7qCVwwjyfCcOX8XRte+ERmuxeEnlVm/xpTM6vj7DYy8QSwXMCEY0ItK1kvEYFjMFc9bUgIoH54vh+1Z8ueshe+OeiZA9cOx4Yzo3RHpUL35HeCXV14evBo/h5vI4XuTOg9+rjdLdbiRyhhv+x3Uij7nbIo+ZIpNfYUA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(4326008)(36756003)(76116006)(66476007)(66556008)(26005)(2906002)(66946007)(6862004)(83380400001)(71200400001)(66446008)(91956017)(64756008)(5660300002)(6486002)(33656002)(86362001)(53546011)(186003)(6636002)(37006003)(6506007)(8676002)(54906003)(6512007)(2616005)(478600001)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ao0kNHyCvb8wbBqGLAIPghTa66MKAPZ8DFMvVpY7iGalnmysuRZawGFSzkxtuAP1QY03mXWdYcaN9EQSbbZzcVqMybzJIpG6ErrNIultbll0Yt1NPrzf+GKiQbuqSY73R73NTLezmSRiPspVJVHbXdg7m0wDfdDY3d8MLL+JTSvNlrWHbmD7q/UDfcqAxtC2sVJMB+JvJFdXe0HTtXmnRNvwzLaUXZOdpfAT9p20Oh6fdwRhQ6fgpipTN/gQrNVQvy/9zS32H+9Hvu6N2XhW5dSglTYVuucJz2YBiNzLebyQS4EeQZfXPQYHkUpPrjBRy/UuVOFl9PBqXEaLvoucTuCPs0ycxw/bID9FSPbRNugFLqD8xbknk6SlvFawSQdEnWxAJr26o6j55J7cL/cDZU9WEDGZ0oVo5NNqPCEwRmiBTOT8n+ONwNl92gkSYD9FUO6Mj+glovGLQzO5PeKJVVcYbIa488bg/NzL/ZmwvipFn4hhMJIFeLHF+B4eQPJ/5WyffOpmgsHQEI4w+gSUMdhbNABz7nCvIjUNi29pIZZroG6V0MzclB5SNbpfWVHb594PAMCUF0oWnto3Vk6IGD0IwS9kmQsKwDJO10+7X+7QbfbFeN2BoE99K19cPI4h38cDLRMSEQP08gNsusrg9A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBBD6C253931AE4F8A4A69EF2A5ACC2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92c7899f-0e06-45ca-bee4-08d880cc2b95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xckOn7QzFpVLLVnPlqZMEF2ApkCrs0QeljeVNjmwVG49YvnQKU0dwK7ygoblZVkvKmF6mlaGnmqF5RfoODQYDk9/TwDLhCovAGw9in44JkVV2NBW+f96sFkTwsa8bn/WPOzygHaiqcwQULF10YmbGrcWrzvJma2AY7uQctGapMknCj6oUcKL+xwKtoNzhlJ1nR14adW+7nYSW+W2TCycKK59OJAcnW5wTDhXUPCWfOiCvHgeRmx16QbVA0R4F9cAw27C9FimUsc4yzSS5+CsM4xwkoX9WJ6Z9Swzr12NhpEm4LX4FgfHaPZ0lcGeCD8q2JqJzAjhYO1BklMEkI9s6te61xfnVR7zBQ1Njq17Y2lAuCDQ7sul33GMdtOFP0hQOEQGoz8VXk51BD7kah+F6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(26005)(336012)(82740400003)(8676002)(53546011)(6862004)(6506007)(186003)(47076004)(8936002)(2616005)(6486002)(81166007)(86362001)(82310400003)(356005)(83380400001)(36756003)(70206006)(33656002)(4326008)(5660300002)(2906002)(37006003)(6512007)(316002)(54906003)(6636002)(478600001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:16:17.8931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61ff4e6-ed7d-40b3-69c8-08d880cc3254
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6114



> On 3 Nov 2020, at 15:59, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> ARM platforms do not have PCI support available. When CONFIG_HAS_PCI
> is enabled for ARM a compilation error is observed for ns16550 driver.
>=20
> Fixed compilation error after introducing new kconfig option
> CONFIG_HAS_NS16550_PCI to support ns16550 PCI for X86.
>=20
> For X86 platforms it is enabled by default. For ARM platforms it is
> disabled by default, once we have proper support for NS16550 PCI for
> ARM we can enable it.
>=20
> No functional change.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes in v2:
> - Silently enable the HAS_NS16550_PCI for x86 by default.=20
>=20
> ---
> xen/drivers/char/Kconfig   |  7 +++++++
> xen/drivers/char/ns16550.c | 32 ++++++++++++++++----------------
> 2 files changed, 23 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index b572305657..12a53607d1 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -4,6 +4,13 @@ config HAS_NS16550
> 	help
> 	  This selects the 16550-series UART support. For most systems, say Y.
>=20
> +config HAS_NS16550_PCI
> +	def_bool y
> +	depends on X86 && HAS_NS16550 && HAS_PCI
> +	help
> +	  This selects the 16550-series UART PCI support.For most systems,
> +	  say Y.
> +
> config HAS_CADENCE_UART
> 	bool "Xilinx Cadence UART driver"
> 	default y
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index d8b52eb813..bd1c2af956 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -16,7 +16,7 @@
> #include <xen/timer.h>
> #include <xen/serial.h>
> #include <xen/iocap.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
> #include <xen/pci.h>
> #include <xen/pci_regs.h>
> #include <xen/pci_ids.h>
> @@ -54,7 +54,7 @@ enum serial_param_type {
>     reg_shift,
>     reg_width,
>     stop_bits,
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     bridge_bdf,
>     device,
>     port_bdf,
> @@ -83,7 +83,7 @@ static struct ns16550 {
>     unsigned int timeout_ms;
>     bool_t intr_works;
>     bool_t dw_usr_bsy;
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     /* PCI card parameters. */
>     bool_t pb_bdf_enable;   /* if =3D1, pb-bdf effective, port behind bri=
dge */
>     bool_t ps_bdf_enable;   /* if =3D1, ps_bdf effective, port on pci car=
d */
> @@ -117,14 +117,14 @@ static const struct serial_param_var __initconst sp=
_vars[] =3D {
>     {"reg-shift", reg_shift},
>     {"reg-width", reg_width},
>     {"stop-bits", stop_bits},
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     {"bridge", bridge_bdf},
>     {"dev", device},
>     {"port", port_bdf},
> #endif
> };
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
> struct ns16550_config {
>     u16 vendor_id;
>     u16 dev_id;
> @@ -620,7 +620,7 @@ static int ns16550_getc(struct serial_port *port, cha=
r *pc)
>=20
> static void pci_serial_early_init(struct ns16550 *uart)
> {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     if ( !uart->ps_bdf_enable || uart->io_base >=3D 0x10000 )
>         return;
>=20
> @@ -719,7 +719,7 @@ static void __init ns16550_init_preirq(struct serial_=
port *port)
>=20
> static void __init ns16550_init_irq(struct serial_port *port)
> {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     struct ns16550 *uart =3D port->uart;
>=20
>     if ( uart->msi )
> @@ -761,7 +761,7 @@ static void __init ns16550_init_postirq(struct serial=
_port *port)
>     uart->timeout_ms =3D max_t(
>         unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     if ( uart->bar || uart->ps_bdf_enable )
>     {
>         if ( uart->param && uart->param->mmio &&
> @@ -841,7 +841,7 @@ static void ns16550_suspend(struct serial_port *port)
>=20
>     stop_timer(&uart->timer);
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     if ( uart->bar )
>        uart->cr =3D pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps=
_bdf[1],
>                                   uart->ps_bdf[2]), PCI_COMMAND);
> @@ -850,7 +850,7 @@ static void ns16550_suspend(struct serial_port *port)
>=20
> static void _ns16550_resume(struct serial_port *port)
> {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     struct ns16550 *uart =3D port->uart;
>=20
>     if ( uart->bar )
> @@ -1013,7 +1013,7 @@ static int __init check_existence(struct ns16550 *u=
art)
>     return 1; /* Everything is MMIO */
> #endif
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     pci_serial_early_init(uart);
> #endif
>=20
> @@ -1044,7 +1044,7 @@ static int __init check_existence(struct ns16550 *u=
art)
>     return (status =3D=3D 0x90);
> }
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
> static int __init
> pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> {
> @@ -1305,7 +1305,7 @@ static bool __init parse_positional(struct ns16550 =
*uart, char **str)
>=20
>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>     {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>         if ( strncmp(conf, "pci", 3) =3D=3D 0 )
>         {
>             if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_co=
m) )
> @@ -1327,7 +1327,7 @@ static bool __init parse_positional(struct ns16550 =
*uart, char **str)
>=20
>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>     {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>         if ( strncmp(conf, "msi", 3) =3D=3D 0 )
>         {
>             conf +=3D 3;
> @@ -1339,7 +1339,7 @@ static bool __init parse_positional(struct ns16550 =
*uart, char **str)
>             uart->irq =3D simple_strtol(conf, &conf, 10);
>     }
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>     {
>         conf =3D parse_pci(conf, NULL, &uart->ps_bdf[0],
> @@ -1419,7 +1419,7 @@ static bool __init parse_namevalue_pairs(char *str,=
 struct ns16550 *uart)
>             uart->reg_width =3D simple_strtoul(param_value, NULL, 0);
>             break;
>=20
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>         case bridge_bdf:
>             if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
>                             &uart->ps_bdf[1], &uart->ps_bdf[2]) )
> --=20
> 2.17.1
>=20


