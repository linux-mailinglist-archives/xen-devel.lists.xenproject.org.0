Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493928E3EB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6830.17969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjFR-0002xj-ER; Wed, 14 Oct 2020 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6830.17969; Wed, 14 Oct 2020 16:03:29 +0000
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
	id 1kSjFR-0002xK-Aq; Wed, 14 Oct 2020 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 6830;
 Wed, 14 Oct 2020 16:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSjFQ-0002xE-ER
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:03:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79cf0579-ec7c-4187-a30d-a33442a64657;
 Wed, 14 Oct 2020 16:03:26 +0000 (UTC)
Received: from AM6P195CA0083.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::24)
 by HE1PR0801MB1979.eurprd08.prod.outlook.com (2603:10a6:3:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 16:03:23 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::be) by AM6P195CA0083.outlook.office365.com
 (2603:10a6:209:86::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 16:03:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:03:22 +0000
Received: ("Tessian outbound d5e343850048:v64");
 Wed, 14 Oct 2020 16:03:21 +0000
Received: from 72698fdd898a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3251E851-1999-4E38-9789-611E9E81CDC1.1; 
 Wed, 14 Oct 2020 16:03:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72698fdd898a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 16:03:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Wed, 14 Oct
 2020 16:03:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSjFQ-0002xE-ER
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:03:28 +0000
X-Inumbo-ID: 79cf0579-ec7c-4187-a30d-a33442a64657
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.72])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79cf0579-ec7c-4187-a30d-a33442a64657;
	Wed, 14 Oct 2020 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GroZN5Oqf9xFuSrmWp1qhjNI82PUQGs7fZy6KTEnEic=;
 b=fgGAMUv24uR7C6++l5EY3jigeC1XTSTdWZV8De+q3hUROKSINiHm42cuhUn70ZEo1q8LjvtUntS2j8CRsM0JOB6rSjA7YmJNl4cyx+Ciq30nZ1/f0qxokvHPIzPNs0IimlInWRRWihlxFmI88OHbOP6/2N5hPc+9EKNuUQGWKV8=
Received: from AM6P195CA0083.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::24)
 by HE1PR0801MB1979.eurprd08.prod.outlook.com (2603:10a6:3:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 16:03:23 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::be) by AM6P195CA0083.outlook.office365.com
 (2603:10a6:209:86::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 16:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:03:22 +0000
Received: ("Tessian outbound d5e343850048:v64"); Wed, 14 Oct 2020 16:03:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb43d7e5e12a3e86
X-CR-MTA-TID: 64aa7808
Received: from 72698fdd898a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3251E851-1999-4E38-9789-611E9E81CDC1.1;
	Wed, 14 Oct 2020 16:03:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72698fdd898a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 16:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lp7ObyWYb73RaX2wEIYA0VozMEjCUbcd9BN+pSgq9LiScvpXioC+SMEqSoZkadIG7j1sMncWqbxRCJtt8WhQrFQv58lt8GZG1SZ+UnbbUv+2X/GZNQaaJG0OVx1LQ9B2XGiFypzdKwqcJlADB7D0mAnMs14F4jnouIvzkBeQGPmhuGfi6jkWI0KBWB+JsJb8u2gvEQvkjAxw/MajCF8LK12xfNUWph0xYl71UhGwonpv1xxn8BH/f7zOXB1bmf0Wb2ibtE8F73yhxWJZXIFkbkTpMcfmeust/JRni3E4pqS/Z3m3UmAk7Y+fzz0vskQGFi5tJ/NcwTpQM0lJ18PZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GroZN5Oqf9xFuSrmWp1qhjNI82PUQGs7fZy6KTEnEic=;
 b=CKqbunyaF5epRNEaqaNOuM1M4JPm9LVNTFO8JbvNDCDjzmKwS6Pko1rE412Op8ADpBWH9/y+HKQvk3unnswvyfhIYO3jsE7rFoTkUAGVpCuVGJ/6JTAvZTik7vPMKefiOOAY+QPpHWkVgKvlX7Xihhy9zCghjv1sJdN9Wnr6G7BjW2a/RNeDc1NExrjHeGOLC+KtfR8NzFPwSqHMYrpd4oQLIJESh+2udEjVA37D2nJGN9LmRFCM/uim3YONs6kKtgU8gLoQVKadRDbkdqBumYH/o4GbBgIS+wz3UfN8FiufXyU7c/4eeiWpQLG+Tae4m8X7+VKCWgBr5kXeGhaI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GroZN5Oqf9xFuSrmWp1qhjNI82PUQGs7fZy6KTEnEic=;
 b=fgGAMUv24uR7C6++l5EY3jigeC1XTSTdWZV8De+q3hUROKSINiHm42cuhUn70ZEo1q8LjvtUntS2j8CRsM0JOB6rSjA7YmJNl4cyx+Ciq30nZ1/f0qxokvHPIzPNs0IimlInWRRWihlxFmI88OHbOP6/2N5hPc+9EKNuUQGWKV8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Wed, 14 Oct
 2020 16:03:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:03:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWohbM+uoR14U9oEmwJFjy+kmnIqmW9/2AgABK1AA=
Date: Wed, 14 Oct 2020 16:03:04 +0000
Message-ID: <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
References:
 <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
In-Reply-To: <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e072503-51d8-4d44-967e-08d8705aad1b
x-ms-traffictypediagnostic: DBBPR08MB6025:|HE1PR0801MB1979:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB19799B12A2021DD2C47463659D050@HE1PR0801MB1979.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:773;OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jg0bkKLsd7dgSb83f6lScRWVVfZwkhZGGju1ZYWR4mRZ1Jn0tM/HOP+IJBLW9IpXqvOLmJbHXcCm4KiFxLyoCFIQS+HgN4Hu/EJOmMTZSgZ+rsUCN643ffDwvWTEXwH0SgjHfjxiDLd7qjQ5+s18ekQYwAzAzX4shgeK5cm+d67L6mtTFw90dakLtwM7KoMVrtCs+VJD49iNNXLqMOd7neafzAbD1iKYMtnVeJU058nvxEdrlgZrlKW/NsC+tE9FCghHiZH+suWh14Gu/HY3PQjHOmnmcP06SaRSE7FrIKzN+Kj1zdmcDMOEDlallGO+N8sIY59xKzPKA04YkNwTeg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(83380400001)(36756003)(2906002)(4326008)(8936002)(478600001)(316002)(64756008)(33656002)(5660300002)(54906003)(66556008)(66446008)(2616005)(186003)(6512007)(66946007)(66476007)(86362001)(6916009)(71200400001)(76116006)(8676002)(6486002)(53546011)(6506007)(26005)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 V3RjnXN3jMj+ppdq6W7ankN23tVui07YJ4XvE9aiWu3Y5IRvlBN3QMuF11H7No2OGwiLET7B14NGFSPUvmyGjK8zyBFVZuOaE6CoErmu5PtPp249h9ZaBnczS+jNeZDxrfYdMQoM6WJPoNQY6gbAKoT4i+o6xQaWjIAs2gHlC4vlsY34nE2BpL3H96YnNTUwyu2aHVOXqTzsuJ/0aJqC3ml9V0O1kjD2DybxoLUApE02Qe8U9pEqBd2gvjbnx9m7pkDWrlcmqluSAUUU6/qc+Y3ifO65ddOZmL1QbvE1ABSVdwBN9MSe8nWXKf2OA1bSxUARvthLd42NtJ3MTP5eOHYTHhaAdLING3PY7EViM/3hiJyxVBevnMJ+I+r0ZKOS+5G7Bf+nCnhr9cfX113sjdmwvHAYTXwuwkccrPnQB4C3bOlVPsEC6uPihxNbRXp5fW9lyMOhRuEfMmfcEPPim8GU3uYIKMHI658JFbZ97Qbq4NyxbbT+hpV7+iNhwcP4mpkgJJKuyY024Jz3bpSLWGaVx2LCbXShZvh2lVBg13xQDi+7fcXKBVPv68WNqtAxYR6HMhxoA2qH3PI30CUxsrO3jz1P+7uVc4it1vE+bz6RxSMScuG9oqhOEXbs5QzdG0/siIVd9em9wiRmy3Ig2w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6BDF892ABF61347BACF906A5285FDE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f67589db-9ca5-4047-20c0-08d8705aa24a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e1fvdU5afs1HkIeSKx4zoukwpPuYB/ngo7UDWDPb9gc2HNZGMPeddJYYx6JQqbMEqg7b7o32WGy4WwCkUwbH/m8LDJ62KrML4iJGgTac6UgAeFigtS2Fxt4pID6mzJgPrthGvQtBUHrpGOt3hFLC3PDqXT7qwN1oHuAr8e/NCi5fKlkorGkOf+iqCllqCurqDZfBechLhrf7IP/xHtnEhczI8/80ajeSOayOpmpwQkQta1nqWNrQz2FbpBXcJB9vUQcUG2eX5bMQWCGQftvY0WJOvlRyKmkHmJr6EERGBt+TA6GKZcynohv5qBdQwnn5XaYq3eDDwU5V3wGkbGaalLaagYYU56U8OMdEZx3FRgsYkms+kJzCf1iudcX0LZ0jyPlr/bKjUTsyS85AqMSIVQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(6486002)(316002)(6862004)(70206006)(36756003)(478600001)(8936002)(5660300002)(8676002)(86362001)(70586007)(4326008)(81166007)(356005)(336012)(33656002)(2906002)(54906003)(2616005)(82740400003)(82310400003)(186003)(26005)(6512007)(6506007)(107886003)(83380400001)(47076004)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 16:03:22.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e072503-51d8-4d44-967e-08d8705aad1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1979



> On 14 Oct 2020, at 12:35, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 14/10/2020 11:41, Bertrand Marquis wrote:
>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>> not implementing the workaround for it could deadlock the system.
>> Add a warning during boot informing the user that only trusted guests
>> should be executed on the system.
>> An equivalent warning is already given to the user by KVM on cores
>> affected by this errata.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
>> 1 file changed, 21 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 6c09017515..8f9ab6dde1 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
>>=20
>> #endif
>>=20
>> +#ifdef CONFIG_ARM64_ERRATUM_832075
>> +
>> +static int warn_device_load_acquire_errata(void *data)
>> +{
>> +    static bool warned =3D false;
>> +
>> +    if ( !warned )
>> +    {
>> +        warning_add("This CPU is affected by the errata 832075.\n"
>> +                    "Guests without required CPU erratum workarounds\n"
>> +                    "can deadlock the system!\n"
>> +                    "Only trusted guests should be used on this system.=
\n");
>> +        warned =3D true;
>=20
> This is an antipattern, which probably wants fixing elsewhere as well.
>=20
> warning_add() is __init.  It's not legitimate to call from a non-init
> function, and a less useless build system would have modpost to object.
>=20
> The ARM_SMCCC_ARCH_WORKAROUND_1 instance asserts based on system state,
> but this provides no safety at all.
>=20
>=20
> What warning_add() actually does is queue messages for some point near
> the end of boot.  It's not clear that this is even a clever thing to do.
>=20
> I'm very tempted to suggest a blanket change to printk_once().

If this is needed then this could be done in an other serie ?
Would be good to keep this patch as purely handling the errata.

Regards
Bertrand

>=20
> ~Andrew
>=20
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +#endif
>> +
>> #ifdef CONFIG_ARM_SSBD
>>=20
>> enum ssbd_state ssbd_state =3D ARM_SSBD_RUNTIME;
>> @@ -419,6 +439,7 @@ static const struct arm_cpu_capabilities arm_errata[=
] =3D {
>>         .capability =3D ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
>>         MIDR_RANGE(MIDR_CORTEX_A57, 0x00,
>>                    (1 << MIDR_VARIANT_SHIFT) | 2),
>> +        .enable =3D warn_device_load_acquire_errata,
>>     },
>> #endif
>> #ifdef CONFIG_ARM64_ERRATUM_834220


