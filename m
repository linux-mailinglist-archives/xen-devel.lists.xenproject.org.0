Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001DD234652
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UaV-0002GH-Ch; Fri, 31 Jul 2020 12:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UaT-0002GA-9r
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:56:37 +0000
X-Inumbo-ID: 44019af6-d32d-11ea-8e30-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44019af6-d32d-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuFG/yDYzYkDX54/MavEWcUrDRVXztJYTHmRMNh2AZM=;
 b=Z6eorV+yl7gyAYQ1OjjXz/C4MQmI9K24c79QB/KJKhThUaoUi4a/d6P2stcyjdszgZjYsQ68L0/0lSvXI4wnw6696u+tGuXORJ1ZXwY977S3REezea0oJWYQAmrmyJcNRSrEtLz7j44e9d/hb4cPCiXrmFaDkNYPOQbFM5b20GE=
Received: from AM6PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:2e::47)
 by AM0PR08MB4994.eurprd08.prod.outlook.com (2603:10a6:208:15d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Fri, 31 Jul
 2020 12:56:34 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::4) by AM6PR05CA0034.outlook.office365.com
 (2603:10a6:20b:2e::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 12:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 12:56:34 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Fri, 31 Jul 2020 12:56:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 556d06a5833601a7
X-CR-MTA-TID: 64aa7808
Received: from 8eee29f2d773.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DFA96B6-B5CD-4275-8664-0E3931598F29.1; 
 Fri, 31 Jul 2020 12:56:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8eee29f2d773.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/n5tGSgz5Zgz6mdWtBOWMWUAxRRecW8HT+1VTW1MlaESgYX9atQvm3Gy5lz0cyBDxHHUE4pAzZro7Aa6JmMnz74HjRSp3HL4bfpS6OnnDsLREafd6Et2c9wKHPlDk3WW1qRquYC5H82u2LJGwKCnD3QrsjjSxildLMPthKnDaITBz9jgdLCfbk2tLJ9EG2ALK4pcVlbc90cUX926fDWAYAD76tIjT951C8fc63B7hR1IAUNJZH40shjbYBXXGOB6RGKi2bXJqCsi0XlyoJqrQD/7HV1FLN1gjGbgBOTYfwwxM+JdW1gYkixcpGvhVpESZf60IHxDNIuqdCqMhnArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuFG/yDYzYkDX54/MavEWcUrDRVXztJYTHmRMNh2AZM=;
 b=mSL1oi04BQMkbSYI+9ddNtEe2T0s1EqbVs7E6XKRGGD1/T9wyUjDWlWYcd4z5L6RU0rMQVhFUUja4Uvdg2VUNRSFFb2qSBMgPsLHbnrSTrDGO8wrQLupoPULQKRzhmjIh71zyt8j0Di8Rbh8VOE4vx+Pacnjz2guDpRLjsGYsRFvGaOK/8ahgvZar92mLSBOq3iHvp3AxKFn+EOlY23+gazOzJOMbyeYOgMQYFqap2miHWztkg4wAmoTZHVMX7Lj34UGTYpqjn4E+FI9AnxL4dD0LKJ2N7q+5Sm4kqDOOPsULCzGC/iFRVTLYJ8EHCIap7cUXGmqCTUhV7V7rV8xGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuFG/yDYzYkDX54/MavEWcUrDRVXztJYTHmRMNh2AZM=;
 b=Z6eorV+yl7gyAYQ1OjjXz/C4MQmI9K24c79QB/KJKhThUaoUi4a/d6P2stcyjdszgZjYsQ68L0/0lSvXI4wnw6696u+tGuXORJ1ZXwY977S3REezea0oJWYQAmrmyJcNRSrEtLz7j44e9d/hb4cPCiXrmFaDkNYPOQbFM5b20GE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5177.eurprd08.prod.outlook.com (2603:10a6:10:e3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 12:56:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:56:27 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
Thread-Topic: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
Thread-Index: AQHWZp4MdrEziqnOzkaNnp5sU1zHlakhpfCAgAAA0wA=
Date: Fri, 31 Jul 2020 12:56:27 +0000
Message-ID: <E6C3838C-EFBC-41B0-BE3D-852C1E1B65FB@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-5-julien@xen.org>
 <87E8FBB4-DFD2-4B10-9D90-D8628AB102F5@arm.com>
In-Reply-To: <87E8FBB4-DFD2-4B10-9D90-D8628AB102F5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52dde557-2703-4fab-0c09-08d835512776
x-ms-traffictypediagnostic: DB8PR08MB5177:|AM0PR08MB4994:
X-Microsoft-Antispam-PRVS: <AM0PR08MB49945BC356B95F51345A45089D4E0@AM0PR08MB4994.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5n7jAFhCMYYrwQY2vk1ofpYJwvyBNd3C9gWUy8cxEbTjShfCfadCMUfjNSYq+d6UnNgd/d83uxRJfhOxEJivSYI0lig/GYI6hmSBuheu4/mK3J/yjoA5sr8xqnNn0ahegytbWLURHWq3KUddUZo/hbMQwxCh9D08lBrB3iWlvv8fM1qBegXEnas7CeKmF2I2mqc+02oxbXBR9UQjaqlXjyU8EWwSZEyaICDJdMpoazfdfVYuWGtdgyg54v9Q5bqH3Etqwie7yTmQ7FrGh/tECJjT2eVmebuvqVC+nhlRo6dgMmFHKG4mX349ACNczPtaelE2kOZxLHuoNl+znnf9PfnNQLV7jvA4IlfW16TEAZ0s/gqAqXDSgVBsZNWDWZoO
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(186003)(66946007)(66476007)(66446008)(64756008)(2906002)(91956017)(26005)(66556008)(76116006)(8676002)(54906003)(36756003)(86362001)(71200400001)(6486002)(6512007)(6916009)(8936002)(2616005)(478600001)(4326008)(33656002)(5660300002)(53546011)(6506007)(316002)(83380400001)(169823001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ShrPJ5g3DTBI/WSu/Att76aoP7DaHf1AeyLhfH46t6rs4cKi/M1S/P/5dgL2SXZQsYKGo/KpRPkSpjdEJGgSsg9v/xNcU+/b33EcrB1iXgMnCrg5xPmnSAcc4jqX4DkQkwXYgxLc/QJw2NbH2elIDulwEhyRjqWQnbwdaP3i4r6Vy3WJBL/qb14ZkO3WSXSsfoh1TQ0Qs9X6dy4yDYvubYa9AHo+clBCK+lqGxTFbhxZrXxOnO1UA2S/lx9fz9Vpfr3+2TJeBtL7hbZj3A6hiGuA/MSOqsgU6ryDUvufHjo6eT+OhblE8qVVXuZY8DZGbPdOSqr3PlVH0pBD0XO5Rni6QYynSBWKeG4fnalkG8egCe01Lv7r1Uretjclg1Zfmd9wsLGzVnWOyQIOD0isTb7O1Q4+FgoRyQ/Dl0l0B1tbJ7zObJSLzpeZbd60eu0z2SVVB9h3GzIUSB0S5PvgzzVr0axmNYa9JqdpNqPYKh9ELWLHtxEgiBs22wV8flr/jGqrUjp4trOHp9/ipiaAjhDGoMC3pTnpQbTkneyVYMomE9/9vPyKHr52OxJG3/A2bdIXq/EJBLlvRKugQ12gUwEnGTfawp5FpM/qfZmecrCRxZo8dVrEOJt3VqM9Wv/1J0dlYVBSd5lBrnkAutQS5g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E4187FC06B0524C97348DB3F4CC3121@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5177
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d36c2feb-fa5d-4912-bcb4-08d83551232e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TmQeEoNF8WSrnxdls7LdWiK1xT3jUK0gLdncQGGRcE7ke9NPCu1MYymThVT5wfprZIbazyx/DpCbmukaBhPKnFE7IN9Q4TUOHkb+26Cd006D6IWHpLznegQGfhdMSjk6IY85Rcz7kc1sK3vgc6wvh87ZsKp2tttkOn821BgOwgtA29tYrml9uIjl4sO47P/LExwtWmjoS14QVGEuZCO45NazSN4EyZZvK1xknjV9pb+pepebsB2CgEOLviTR3VJsBrDBTcZgy8LYs63r7qsd9zBbLnCUZ2yEmf8GmjMKW61OM9zd4LVoPpa6Xv9tkkJ/Wr1A0/UEClaC3wJpD3ujePorZtxwcZEs98fHTgWodeGrOz08TWWCPinb9/7dYjbNgwG2tGNPRmHD+Pd7ZlKMy+j1h0mWjeNGITSanKnbHs=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(2906002)(53546011)(6506007)(86362001)(83380400001)(186003)(82740400003)(336012)(6486002)(8936002)(70206006)(70586007)(33656002)(8676002)(4326008)(26005)(6862004)(36906005)(5660300002)(82310400002)(356005)(47076004)(81166007)(2616005)(36756003)(6512007)(54906003)(478600001)(316002)(169823001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:56:34.2996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dde557-2703-4fab-0c09-08d835512776
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4994
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



> On 31 Jul 2020, at 14:53, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
>=20
>=20
>> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> We usually have xen/ includes first and then asm/. They are also ordered
>> alphabetically among themselves.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> This could have been merged in patch 3.
>=20
> But anyway:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
>=20
>> ---
>> xen/arch/arm/guestcopy.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
>> index 7a0f3e9d5fc6..c8023e2bca5d 100644
>> --- a/xen/arch/arm/guestcopy.c
>> +++ b/xen/arch/arm/guestcopy.c
>> @@ -1,7 +1,8 @@
>> -#include <xen/lib.h>
>> #include <xen/domain_page.h>
>> +#include <xen/lib.h>
>> #include <xen/mm.h>
>> #include <xen/sched.h>
>> +
>> #include <asm/current.h>
>> #include <asm/guest_access.h>
>>=20
>> --
>> 2.17.1
>>=20
>>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

sorry for the notice, i need to find a way to turn it off automatically :-)




