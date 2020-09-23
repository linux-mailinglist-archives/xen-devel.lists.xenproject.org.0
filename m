Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B027569A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:52:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL2MV-0002dS-2E; Wed, 23 Sep 2020 10:50:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6iF=DA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kL2MT-0002dN-Jy
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:50:57 +0000
X-Inumbo-ID: 09fa3ca7-14b5-42d1-8fe4-bb9e3d818b57
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::604])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09fa3ca7-14b5-42d1-8fe4-bb9e3d818b57;
 Wed, 23 Sep 2020 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYQDhLwYn73lR/b4do0W5uev0Q0pjZWjyyWoemNvoko=;
 b=HlKvZatRPhnMrc63BqQFfJ9QkmTORX9mOHnGZYTuYUBnX1Nb5dwqIgkeNoR7BxlSkxgqMJqNDezlSsLh1yzI1euRC81LHcqljYdCMtN50j3vNc1OKuOzWFZVUTO/6Vr7HpXr+e1Ab0qXvFKSpxXmPSFFq7TxDp+bJfhrkJMtd9Q=
Received: from DB6PR0501CA0028.eurprd05.prod.outlook.com (2603:10a6:4:67::14)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 10:50:53 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::2d) by DB6PR0501CA0028.outlook.office365.com
 (2603:10a6:4:67::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 10:50:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 10:50:53 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Wed, 23 Sep 2020 10:50:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78b153cdb021cd12
X-CR-MTA-TID: 64aa7808
Received: from 5bc17875a188.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4729A49-CDDE-453D-A12C-2B767C1D8169.1; 
 Wed, 23 Sep 2020 10:50:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5bc17875a188.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Sep 2020 10:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqS0kBIYdU7//roqa1Llu7FK86H2nM0gLRDhZg+Xz5W7OM4Zi0AnItUy5KW335GZmGQ6YRjgqxw0K27IyOxhP9KUux/h+obafgA7tdPvaw046zuPVLxoW+YIYEoXsHR+YIqpMdTAHYSaUIo49YH0uGllrED6BRT7YOyX7XbfndrtScWWGMHg1I0ggrjJoIwfxj4cTM7/o/wTqUvzNOJNEd19IgNAYTiYhw6vqST67fuOcG0UnxJN9Umgm8ihput1t5JG7vZavFCaYZi7pd0XH/rmBm4UKkG3TmOp7xAFi88MnzxHc1ZfTnPyNNFJ2txYFuD894ht2pcHJuGxtFMw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYQDhLwYn73lR/b4do0W5uev0Q0pjZWjyyWoemNvoko=;
 b=h/kZ+z8aBBkTKuAbOosm0ijyk49BNcgZTkavfqbNjP++4VDgWbWhB6lRRKC5iJBuFp2RMeeVTlWBGH/mh6ke53TFM0IhLI8QUBfB0SViuTZzJGYxRh47xPcu09fDqpCoeE2Agx45YPgLFjrwBuaszMI+oTMwhaPEUj8sj/TYbrXmc+LmPJ9GXVvl65zrVTubkDmhgB6SDbqP98IzMtG1ksga3pXJ0l5aUKs4FVNRUoLT2DRx5I6O8J07KHdbPCXYTxv/NYE0UjG3o+xgPeNffamFR9Qq75vRouJTJhby/8EK1Y1edv00wzwH8yeiUkW1cGg1rNdZ+XGNBp8K9rLWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYQDhLwYn73lR/b4do0W5uev0Q0pjZWjyyWoemNvoko=;
 b=HlKvZatRPhnMrc63BqQFfJ9QkmTORX9mOHnGZYTuYUBnX1Nb5dwqIgkeNoR7BxlSkxgqMJqNDezlSsLh1yzI1euRC81LHcqljYdCMtN50j3vNc1OKuOzWFZVUTO/6Vr7HpXr+e1Ab0qXvFKSpxXmPSFFq7TxDp+bJfhrkJMtd9Q=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 10:50:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 10:50:43 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Topic: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Index: AQHWkYOU18uuLvRXIEaUzkgFl/gQ5Kl2C72A
Date: Wed, 23 Sep 2020 10:50:43 +0000
Message-ID: <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
References: <20200923082832.20038-1-julien@xen.org>
In-Reply-To: <20200923082832.20038-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92cb6e39-fd20-41ac-a435-08d85fae8b21
x-ms-traffictypediagnostic: DB7PR08MB3161:|PR3PR08MB5676:
X-Microsoft-Antispam-PRVS: <PR3PR08MB567662B69D150BF7470A7ADF9D380@PR3PR08MB5676.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bFrG3kd4WBIXzGH+3k5BT3s2dTQP2xaVBkkgx6dax8Bd71nnKixprnbhMKymgiTxQ8O9WPkAKUyd/e8qQgo39m8oi6+9A1GHO51nHVSzTb8DnYcW++WIVnbGCsnP2p4bHt0f2B+aadLC3e9QBkB5MisN9mi9CiBBbL7LafW3OB/R6OpDdA1ZLnox9ENvdA/ircuwuXDC4D6Fldu8mVjFQwK3kE2y2cDhuk7mp+THMmM6ZUqQVwQCgkjlzSl3DGo/sIAqcngJKrxSjyiUlx1/WsN91F36nTSZQWv1BnlQ1wPwE64MU7KElR+XB8XHoldZu6gc2Tw/fWMvA0SatydlJg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(54906003)(64756008)(83380400001)(2616005)(478600001)(6916009)(66476007)(66446008)(2906002)(6512007)(8676002)(86362001)(8936002)(6486002)(66556008)(36756003)(5660300002)(26005)(6506007)(71200400001)(91956017)(4326008)(66946007)(316002)(186003)(53546011)(76116006)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /f/fqFMWyHfZDTTvnCTAhZpL7yOPRofFlT+7kMXQckY60qjvkjVMQ9laU+AIsD9m6b9I4YcWXq39PwxIFclYGS+4P5fsssbFMvKms8gJ1w+7AC/hs/JnEGHNkqIDIWj2bC284pccb2aaTXToR9otmGtRGOz7HKCnCDdMPCJiuxzsMooon3L6JiqofAobBMnaohYraQ69X20ke0M507AaxpGzAFgQmrjM0uhxt4iFrfhu2wpvPyk5OLysSeoDD87hFa+yHG4uv4MdxHE3OZCpeOOT2vE56ik5bFstXxzRP49N3kFdvsHUHvYDTY+4cVBVJ/neBmNfckRKoptPXTDSB++pT3AERAVjICVp2Skyjj0RQUVqf3/1Bx+zLaGFGPYJJci+eepW7KhzeNbe4e7IAKxVjrb8P5jEys//KSebGTFijztoTuAPV52d9ea0qWa2UCyJbpjwMvtfceRaIY8iDZvTcXZBbV/8yOFfFFWkr/2fMrBOHOzF+a57tnqHQaL23nUhklo1JibKni0RGy3WuBEHr8QjZG24p0SHG0Ln4EftHAK9hYK0Jt8zy7vMsjC2Xi6X23JSTRxxtOihe21DzStSqpGj2rC5cpxfn5aENkWsm85vChOCOByHiVw01ohaa9XDxo1gaMtxtzT5sQqqAg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2133F6170A4F384C872D23F5DED92C58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3161
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c26c8a8-7096-4f72-f8d2-08d85fae855c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZSAhJpfUEQWVrU0NwAb7EUOgagmJSMkeEbnkP0yYGtvsIfsxwqEZvSD2ZUyqcCkdRCBh5m/FppH/ND9QbUdjkcgkI9IUCeA0HBE7cKJ8+mjVlwXK3JpICLb/UHmIZ8x4XE2VRr74zbxw9GIHADA144Ni/8/k4QAynXDLbqf+6Tz1YcmnpNmSynkDtvkcNaTFQsEFL3J21f1yrng8uqATHWfN9VMEN1eNBAnNXvWS/cFos4nA/XFWpd56ENDrNVhrlW3hVlrV17pzoLeS65wlD19ZeT6c7HpFgvwfy1OYiExZxl6Q+rx67inYjBeDWMtU/Wkvi8y/ll3uJ4vFFo2hrXepaj2NdwH2rUtW1rsNDg6/cUgxHR8D1fX0i5hkGGEPxAyCtrfslZpEAKg28IbGT8HqFMdKou6zaXFR7SgIoOXyQPCjWitiDVDP1IFd8Ca
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(86362001)(82310400003)(2906002)(54906003)(5660300002)(478600001)(6486002)(70586007)(36756003)(4326008)(6512007)(33656002)(8676002)(82740400003)(83380400001)(336012)(186003)(81166007)(356005)(70206006)(26005)(2616005)(316002)(6506007)(8936002)(53546011)(47076004)(6862004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 10:50:53.6041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cb6e39-fd20-41ac-a435-08d85fae8b21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676
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

Hi,

> On 23 Sep 2020, at 09:28, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> SMMUv{1, 2} are both marked as security supported, so we would
> technically have to issue an XSA for any IOMMU security bug.
>=20
> However, at the moment, device passthrough is not security supported
> on Arm and there is no plan to change that in the next few months.
>=20
> Therefore, mark Arm SMMUv{1, 2} as supported but not security supported.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

We will publish in the next week a first implementation of SMMUv3 support w=
hich might make sense to have fully Supported.

Cheers,
Bertrand

>=20
> ---
>=20
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> ---
> SUPPORT.md | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 25987ec1dfb6..f35943a432f7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -62,8 +62,8 @@ supported in this document.
>=20
>     Status, AMD IOMMU: Supported
>     Status, Intel VT-d: Supported
> -    Status, ARM SMMUv1: Supported
> -    Status, ARM SMMUv2: Supported
> +    Status, ARM SMMUv1: Supported, not security supported
> +    Status, ARM SMMUv2: Supported, not security supported
>     Status, Renesas IPMMU-VMSA: Supported, not security supported
>=20
> ### ARM/GICv3 ITS
> --=20
> 2.17.1
>=20


