Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0052B234656
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UcF-0002P0-0z; Fri, 31 Jul 2020 12:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UcD-0002Op-L7
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:58:25 +0000
X-Inumbo-ID: 84c404ca-d32d-11ea-8e30-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84c404ca-d32d-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV3wLf96RYlKeb8gH691k9VjenLtEmtuxqc/HLtUFyg=;
 b=TYqv7LM4SmMSqxzTZ58McPqC/J3iJP/6FHTnlL2EAtQT/WyR+3waTLcK9pZGhKElQBiTpC+AGLDtueAhq8ETWr/kjvP2+j0154pXhieyIu7KF0L1AyLshqhxu3iz9VRmirF3/8hQcZaY8vth6e3CKiLvMP7MQASTmoumBGpN2/s=
Received: from DB6PR0501CA0016.eurprd05.prod.outlook.com (2603:10a6:4:8f::26)
 by AM4PR08MB2897.eurprd08.prod.outlook.com (2603:10a6:205:a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 12:58:22 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::ac) by DB6PR0501CA0016.outlook.office365.com
 (2603:10a6:4:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 12:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 12:58:22 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Fri, 31 Jul 2020 12:58:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d62cfa80a9dd849
X-CR-MTA-TID: 64aa7808
Received: from d95a03cd5078.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 298162C4-D54F-49FD-BCA1-FDD487DB344D.1; 
 Fri, 31 Jul 2020 12:58:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d95a03cd5078.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD4U3oJzEHmRzwmdKgOVr19gF97nFISzqDNH4OwxOx74Xu6w+wfVwegxtjHSr1EmyX35e0xB0OeT4f3QPdV3Bfx3hOYZM9PcLNyt2WniRxVZSFBLdveecCbuZSTGJEdBrNl/ZhOXH/4vaq+x+AZGX+lAPZZ2cUdABaKCRAUqh0/h/pSIbv6HyvdDSKz6rSkoU0zhhVu79TWQx7TWZsf2f82lzu9COfr+Kyu4xtTU21fXJ0Wt5Ct7tT1667xh+o8hwVKhOTVkHScPafC8/j3JhyFuB9A2WPA2JjrF2Yio77xMw2K+WwUWVWfa7j5KbPG7REIaxEiTDl1PtimfDGFUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV3wLf96RYlKeb8gH691k9VjenLtEmtuxqc/HLtUFyg=;
 b=M7f6h5KtvRLoaqur0x+/j9OWCQONchIHVo6xB8ARYHeyICK6jlu2z3CU1Co/7uBwSEihu2JET9QeZ8WHeFDQwejRC1kzQaL1JQJJAX0sf4fbfMvPiptfKYL7QGepcf6R2t9xoirv5abnCx+7G/3XkJk/WCFjEqIkcyZRmDs5tGrvp36wR1bBmAqfzoSsAWD/uaIOoqFzeAn/J0owxuwtEQA3ntDE3f0p0H6KzUu1+5Xf6pJGZ4WV9cTt5xKIKy3N8nJFR8Ys6EhKjIVjeEl0lAqdvNaYzcZite7ktQwnG9Xccgy1MG1wMwbvmMnr+e36dR3sI6IDgpL5mwYeARftbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV3wLf96RYlKeb8gH691k9VjenLtEmtuxqc/HLtUFyg=;
 b=TYqv7LM4SmMSqxzTZ58McPqC/J3iJP/6FHTnlL2EAtQT/WyR+3waTLcK9pZGhKElQBiTpC+AGLDtueAhq8ETWr/kjvP2+j0154pXhieyIu7KF0L1AyLshqhxu3iz9VRmirF3/8hQcZaY8vth6e3CKiLvMP7MQASTmoumBGpN2/s=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 31 Jul
 2020 12:58:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:58:10 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 2/7] xen/arm: kernel: Re-order the includes
Thread-Topic: [RESEND][PATCH v2 2/7] xen/arm: kernel: Re-order the includes
Thread-Index: AQHWZp4EFvxlcjFwoE6yApIOnyEIgKkhpz6A
Date: Fri, 31 Jul 2020 12:58:10 +0000
Message-ID: <030C3314-A8E2-4FD6-8D1A-25C5734A6A80@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-3-julien@xen.org>
In-Reply-To: <20200730181827.1670-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90ad4fc0-f78f-4fb9-3e7d-08d8355167e4
x-ms-traffictypediagnostic: DBBPR08MB4776:|AM4PR08MB2897:
X-Microsoft-Antispam-PRVS: <AM4PR08MB2897AD331FC6CA6B0A70EC8F9D4E0@AM4PR08MB2897.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:345;OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JKWT5NH443bySKCZM4uO7uIBnFVBYZ6SNi9dSVkri6epIK7PtjXDLsQo/YHT+JpUTVPXApJzQTHAdtprPgF5RIZwnelohxyamm016toGVozEebE6Pd08+4XK815ckSetqv2WTrzSakmO7W1JKJJGDnxYi947mLfBk4PNN6wjGtv5RZKGIkcdIW3lkTEqwxWcEsd2sxFH46ORPAh+nw+1Drc33cpmHnO8rBP9/etr/5O74ErGES8+9NllryfO4BefVfFsTBoDfaC1q0ZdjjqkUB7+PT01vWluwLUKLt8r3mMTk9aNTK3z8ql+FnMPvIkFYXS/3HG0pvvbQ/XsrUcvlRgis+dqcQY99DGLrBpnPQeZmv6xkYZDLYRr0mYHMKNJ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(4326008)(478600001)(66446008)(54906003)(5660300002)(26005)(186003)(6506007)(6512007)(66556008)(53546011)(64756008)(8936002)(2616005)(4744005)(36756003)(71200400001)(86362001)(66476007)(6486002)(2906002)(316002)(66946007)(91956017)(76116006)(83380400001)(8676002)(33656002)(6916009)(169823001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: JRR+Hx2nd5JTURpb4nKwiEj91H2ia82XWKqFwcwAVQvoAXOkUhVzaPHDGdDtkQ2W7MLTIzpBz/jMmViYHK6+6+42YigfW3sF4OPLYItEakvdKWyHxxrd9aHvbixEHLUv0Ik8aJCeLw/eHjmqDuSPr7+UBUUOgQllm2SgXcD9vXJtloRHb1bSY/RYm+ARJ72tzrKJlv+flHwQrJncyQRol8m0WTN5som7rZX9qzN327GhQJbGGgo+jASB3Q43S3jogJEr1QCIIUpgEP+YduPnbNt5yq7Rf5h6C+X2iLk69wq2/DC1riLOWdriBQr7WDvnCNLl56CPyWDIrBh3BOxeXRHiFOTSDC9KrSnglTBmU84DPHRwwtnH0RB8KSJk9GkZsf/3cbwIfwPIw8ESRR+Yoca0p288Psgc7at8RLz9A+4XSqff+zbp0xxIpo14zZHeuunWKMCH/ZD9uLqjq//XiGpwgzPy2qcCQzTowSHEJ4ysyqV5D3EgNTp5I5uqsOtL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <637DF1DEAB000D4B88D4AB6A873A8660@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c7bbdc0f-041b-497a-e7d3-08d835516096
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Si3ftA9N3Xt3NIHPHRfiz6/ShZS13EtP/pMpTqjl9xc7d9IOjj05KCDeosPjnnej8QX1s8WM+NRB53eSWZ96tUq7/vpBUs5sd/7IBPBub4J0IaJT/I2dvbYFApvSKdgVGC4zOHANRIOnFK0pjCBKyf47M1oOwuX8VkeCT6z7Q2RhyL58MJBeWN2+n41psI5qREQF7CXyUGE/h1CbU6xQ+oj7TvL7WU/uz3Kg0Zu1foYfVrpDPiZd/b2R4G+kqfG2r9IbOSZJ8Gg81NIii7K20zFd125rxtMt0lVs+dmrKb1AIPk7vSyx/PWBDqfFdP2Tl/VXV+dsBmCLM4+8XngLfUONIyG8hA7hQY56X5bVG9F9X6h6njWaVPluo+PVsEIxVvlytk6a9tnP+UmdWQP4xfFv6S+gYngh6L3E/sUnjIw=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(26005)(4326008)(6486002)(86362001)(5660300002)(316002)(83380400001)(2906002)(70586007)(6512007)(478600001)(336012)(70206006)(6862004)(33656002)(82740400003)(186003)(82310400002)(36756003)(356005)(2616005)(53546011)(8676002)(6506007)(8936002)(54906003)(47076004)(81166007)(169823001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:58:22.4499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ad4fc0-f78f-4fb9-3e7d-08d8355167e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2897
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> We usually have xen/ includes first and then asm/. They are also ordered
> alphabetically among themselves.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/arch/arm/kernel.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 8eff0748367d..f95fa392af44 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -3,20 +3,20 @@
>  *
>  * Copyright (C) 2011 Citrix Systems, Inc.
>  */
> +#include <xen/domain_page.h>
> #include <xen/errno.h>
> +#include <xen/gunzip.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> #include <xen/mm.h>
> -#include <xen/domain_page.h>
> #include <xen/sched.h>
> -#include <asm/byteorder.h>
> -#include <asm/setup.h>
> -#include <xen/libfdt/libfdt.h>
> -#include <xen/gunzip.h>
> #include <xen/vmap.h>
>=20
> +#include <asm/byteorder.h>
> #include <asm/guest_access.h>
> #include <asm/kernel.h>
> +#include <asm/setup.h>
>=20
> #define UIMAGE_MAGIC          0x27051956
> #define UIMAGE_NMLEN          32
> --=20
> 2.17.1
>=20
>=20


