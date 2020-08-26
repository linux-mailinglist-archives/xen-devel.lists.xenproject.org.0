Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E42528B4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 09:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqHX-00025p-3n; Wed, 26 Aug 2020 07:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ynE=CE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAqHV-00025k-Bb
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 07:55:41 +0000
X-Inumbo-ID: 358e2c7e-f9a2-496c-88d8-dd92024ee9b5
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 358e2c7e-f9a2-496c-88d8-dd92024ee9b5;
 Wed, 26 Aug 2020 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL/B2knG1h6Q1LMTD9ZJOfUmQiRC4t/3vklVR4sFQQA=;
 b=bTW7/406Mvx7wi3x5shPqqif9HdGGb/Zmh8+VgoxytD3xCcKfGXaqpTb2ZR7AYNs7+gVUDEKrKxh8DPDtZ5nrfq4NcyAAuV4F9DWEYrTTNZUBy06cH3FWScODNHjMlGYam6StCBL5cEzfy2McsNo15tYQ/m5MU/hOm46LIr3yxI=
Received: from DB8PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:a0::38)
 by VI1PR08MB4559.eurprd08.prod.outlook.com (2603:10a6:803:100::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 07:55:37 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::7b) by DB8PR09CA0025.outlook.office365.com
 (2603:10a6:10:a0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Wed, 26 Aug 2020 07:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 07:55:36 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Wed, 26 Aug 2020 07:55:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7768ba0cb381b9d
X-CR-MTA-TID: 64aa7808
Received: from bfce5bd20ac3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 456D7C3E-BB57-4999-87F2-A6D612B2B7B7.1; 
 Wed, 26 Aug 2020 07:55:31 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfce5bd20ac3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Aug 2020 07:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmPKR1Oh6IReGaBYcnGwoi2SfNI0kJVaO0SsfwrHYTSscmF5sxbQLGaAhouRapvaae1wdwcxx/p63fdJiIIqsuyLkV2Frh/LjE9z6ApsK3pE9eKNCJptTEmOWF8u2dpS/+fK90E8xyICA2UtNZtsr+PSTf9eWi9Ji7yt/QIGPu9jM6BhYgvGg/RXEIziR6fPGHILRKF1j1h+GnCyQ4NPBvgmATtMy7a/rn/6UrEPZLk1koFl6teWejes2JMS2YI2+t4kH2gR9mpbW+BUL9msMCbCSNd/Suug0cx8nOlI5fJAuPgQ2/3COon3OfYifV3EluBk3qWf+u1oCPVF99uDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL/B2knG1h6Q1LMTD9ZJOfUmQiRC4t/3vklVR4sFQQA=;
 b=KON4UsgDvWn3NBS152AoowYZP7/SYxBKGIbGl0MglCVCnpLkCJ1IvgmvI9fDoj40PyYq9/VlGuV8D3d37x7tJDerU9Rcpe2etHb12gWOHchX1k3D4hZIfIRKQ5CR+MHFFZFHNfy31rpORWV/8jyZqziTAuJ0FixymQW/11uLUghj5w5NlcWomQNDb9nEYrMB7vbKCAu9GeQXFONCV5vTlLz1rTCMJ8z3oEvcHWw3aaBY4+AgRpUbegJnS1pwP9qeb48K/gtHz5kKiQOWI64wMWIAM+dlqpAvvbRlafry7C126baAdgWML6NZZpYtE3udYOIY0nNhPouvoDPcKzEcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL/B2knG1h6Q1LMTD9ZJOfUmQiRC4t/3vklVR4sFQQA=;
 b=bTW7/406Mvx7wi3x5shPqqif9HdGGb/Zmh8+VgoxytD3xCcKfGXaqpTb2ZR7AYNs7+gVUDEKrKxh8DPDtZ5nrfq4NcyAAuV4F9DWEYrTTNZUBy06cH3FWScODNHjMlGYam6StCBL5cEzfy2McsNo15tYQ/m5MU/hOm46LIr3yxI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 07:55:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Wed, 26 Aug 2020
 07:55:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, nd <nd@arm.com>
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Topic: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Index: AQHWewnUkkU6H1K20kyXPZAlyrTVA6lKBAsAgAACaAA=
Date: Wed, 26 Aug 2020 07:55:29 +0000
Message-ID: <E9EACCFB-3077-4813-AAF4-5E99481F68E6@arm.com>
References: <20200825174208.11070-1-julien@xen.org>
 <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
In-Reply-To: <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b56af99e-bdb8-4304-c388-08d849956b28
x-ms-traffictypediagnostic: DB8PR08MB5322:|VI1PR08MB4559:
X-Microsoft-Antispam-PRVS: <VI1PR08MB45598A0B77AC1CFB58537D4E9D540@VI1PR08MB4559.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 31glBzHO01SLmkyieVMRuhZ8ykuz7niHsfv6yrmnFfEm8YY89nQ9YimgTeTB5ZeNwQs9/hMQq9dSQhGYEGakYCWjxYmTg3QND6+nK588v2cHIs4cbOTbdyng0NBEc3OYmyrSfGcH8/zdYqjlDbZ0JPPsCIGP4/eWLRAz196XyJ1O7Rdb52cZVoSgB63ptl7Eg6vMU1+1IKJR1VlJZK8HRvO6+4m675TGM2biTMXVLxOSgQV9H3nmyLCSpnSiJlfbK+/ON1btb8t6cUx0BxcVU/OySxLcGrgySyFSFMTrb2eodXulqL1bho5AmMtikYwXvzNQzO95V8GBnc/fqFEk4g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(83380400001)(66446008)(71200400001)(66556008)(66946007)(64756008)(66476007)(76116006)(91956017)(316002)(186003)(6506007)(86362001)(26005)(54906003)(53546011)(15650500001)(2906002)(2616005)(8676002)(8936002)(6916009)(6486002)(4326008)(36756003)(6512007)(33656002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: t1EH9O91VrlK4xs7iGzylX48jMlOTA8jUnqMzGqpsyGdDmCohFM6+HChTaj1he2o4HZhMpNd3K7DykL7G/QQtlj/iVxUWHB1TkrrWaB30PhF6Hk0GCwhuSyVJdct6TVC02WHQ8Wm7TkmNYMNrUnE0BibeyUQy5jCqMCDn5qAdJC1hFk8+5HWV+vgqJc5s9aBLTTa8mf0XTU9Dp8TJHZRqBL5U5fhtUFxYWDCgxjAgnuDTsu1riL6/A4o4Ww8Y95mfOXUnEPffLir3IQCEYl73F3H5DO0zt5e+zAJwj/4/dSYRqxnM+ZXK7KOaSEgujpH20wQSyvxxVkOcmLhxCOSciIdyu7esYBGX5s/Tb8B47hf+B5FCb6REd9dD+bv/CULIRWTs/G1Lnpeki9adJmtiKxjh0WyAEadetiWhBhXNWWPA2QEKxuooD5kkMnrQQLTReXqIDlkvfIRhLMKD5vNFOfa+GcgaNpXPS2ZfIm9IzfMcHsBfzjzjgiqowQMU+Yhiwpoo0d2zJah7be8ecZbC8iEq7TwzBHnTL/zLvOGLb3HHYFGQ1fUFMXlxOMwQ2JNeGvqcXeGIzGnioKQOxepTpLsBsvTB+3k7yukt0wKwhwgxfrnSLMwbID+CJvbWZIWv7BP42vMl7Je236wKSinnw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <612B8EAEF290AC4882A870D961540A8B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 48472d22-52ee-4a9a-40c5-08d8499566c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /DCrzzKMASH8U5QLLvOd5aLtcNHgaZWLNODX/DdSMgzK1rdMNvHDvE+fsRIrXuSg4guExaD2PHw+gxjp71yZZvitHavWPv6pbe6sbHBMR86skLiCHFBYQNWWh4V5Q1E/tAm524g4tXkkcHqm630ImRL6tzdvXsg0582/kWTr7x/ALv/R3gDO37bOfCkZSNTNK4ZoSY94fBM+5dQQFqR7pn3Jrn92iJABzw5Ukzt4IHFNUWk33DSTIVzWHSLGeTyGbHMI0ItwOOzd9IpEHM2nNBdkB74IvdZ7L/9zLvUWPXzQWj5Yedr54younBjOrwWYf8AiEAPyiVr7BkG5RPTti997Lj74Y+WwY6ykdPkQcgTI5B+9pSkG2/S8PxRTgq+Bju3eW8c5YjQfs2f8WuAeBQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(15650500001)(83380400001)(186003)(36756003)(336012)(26005)(86362001)(6506007)(53546011)(6862004)(4326008)(6486002)(5660300002)(33656002)(2906002)(81166007)(82310400002)(8936002)(356005)(478600001)(54906003)(70586007)(6512007)(70206006)(8676002)(2616005)(47076004)(82740400003)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 07:55:36.9633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b56af99e-bdb8-4304-c388-08d849956b28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4559
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



> On 26 Aug 2020, at 08:46, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
>=20
>=20
>> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
>> added a new erratum but forgot to update silicon-errata.txt.
>>=20
>> Update the file accordingly to keep track of errata workaround in Xen.
>=20
> Oh i should have done that as part of my patch.
> Nice catch.
>=20
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> docs/misc/arm/silicon-errata.txt | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-er=
rata.txt
>> index 11e5a9dcec2c..ee070e723a5f 100644
>> --- a/docs/misc/arm/silicon-errata.txt
>> +++ b/docs/misc/arm/silicon-errata.txt
>> @@ -51,4 +51,5 @@ stable hypervisors.
>> | ARM            | Cortex-A57      | #1319537        | N/A              =
       |
>> | ARM            | Cortex-A72      | #1319367        | N/A              =
       |
>> | ARM            | Cortex-A76      | #1165522        | N/A              =
       |
>> +| ARM            | Neoverse        | #1165522        | N/A
>=20
> Should be Neoverse-N1 here (E1 for example is not impacted by this errata=
)
>=20
> Cheers
> Bertrand
>=20
>> | ARM            | MMU-500         | #842869         | N/A              =
       |
>> --
>> 2.17.1
>>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

Sorry forgot to remove the disclaimer (again).

Bertrand


