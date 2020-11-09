Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B62AB4EC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22314.48587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4SO-00076B-KX; Mon, 09 Nov 2020 10:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22314.48587; Mon, 09 Nov 2020 10:31:28 +0000
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
	id 1kc4SO-00075m-H8; Mon, 09 Nov 2020 10:31:28 +0000
Received: by outflank-mailman (input) for mailman id 22314;
 Mon, 09 Nov 2020 10:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI6i=EP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kc4SN-00075h-A6
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:31:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44ce25a6-f2ea-478d-ae24-c6447e774c55;
 Mon, 09 Nov 2020 10:31:24 +0000 (UTC)
Received: from DB6PR0201CA0033.eurprd02.prod.outlook.com (2603:10a6:4:3f::43)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 10:31:22 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::96) by DB6PR0201CA0033.outlook.office365.com
 (2603:10a6:4:3f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 10:31:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 10:31:21 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Mon, 09 Nov 2020 10:31:21 +0000
Received: from 74f22f20d372.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6884EBC1-89D4-4972-9B63-6068B3548238.1; 
 Mon, 09 Nov 2020 10:31:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74f22f20d372.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Nov 2020 10:31:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1912.eurprd08.prod.outlook.com (2603:10a6:4:73::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 10:31:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 10:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TI6i=EP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kc4SN-00075h-A6
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:31:27 +0000
X-Inumbo-ID: 44ce25a6-f2ea-478d-ae24-c6447e774c55
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.47])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 44ce25a6-f2ea-478d-ae24-c6447e774c55;
	Mon, 09 Nov 2020 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpLhZKZMuech9rSN31ImuPnFc2gbkYROJlrKIvHDLwE=;
 b=aabSl3kMC2zwWLAi+qD9bWpadRx6qM6xdZtRyklzBTgNnImnbX5vOlhEHzU9x/kvFvIOLCkLy52J6uT7g9130K/TJQxaTxBAodH37Y1hX1ez32nrgdfUJ+XC2dZ+klxn2DnSpYuOmvbj9GG5zc6trTEMUM1W+nU2ksqpWWQivsE=
Received: from DB6PR0201CA0033.eurprd02.prod.outlook.com (2603:10a6:4:3f::43)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 10:31:22 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::96) by DB6PR0201CA0033.outlook.office365.com
 (2603:10a6:4:3f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 10:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 10:31:21 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Mon, 09 Nov 2020 10:31:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0359730d9299b187
X-CR-MTA-TID: 64aa7808
Received: from 74f22f20d372.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6884EBC1-89D4-4972-9B63-6068B3548238.1;
	Mon, 09 Nov 2020 10:31:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74f22f20d372.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 10:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpXz6yb3yHr5S6oD8/onJWSWxbATVa0U29LH8fd60Vjo0cKBS3ochU4HsUafKuTiSdBr0PDc3GzMsUlYeHvDOoD6y0R4jNSUpFwHyBNYCgKw/EX6lypxUizFHF+kOHaBVF5kSEpjQGBuN3kwwRiOdp+zN6xLqmefzv7zhfs1j5YjVtkJ44fI8Dhef1VknPByc9j0HQEPAFX+EelxXEnKFH+1h4r7baQI3oFS+zGqfcfbWP+jXWtpZ1nzCOcsLitbFAcTWU/ENkq/COnPHdfZv32T+5ZzpWxr3EJNfP13Zg7xeAvHEcjNvADE2Z+YU7JbD6F2L791FRVPL/1WuAbjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpLhZKZMuech9rSN31ImuPnFc2gbkYROJlrKIvHDLwE=;
 b=CtcHapp+d0poHDB1QIR5NuuQX+eHTnHG9lbRCw5hgm3oICP+bLPBJQoPMwz3psKoFgsx+8SE/AAckZfPaCV8+n4w+QZXgFQhbCvfqJ1KYMlvVsw+AvrwT/jmEWB97bsXOqQeyyo5d2Rj3fQ5BylhtcVoCpbQK8pHDkXb3MlR13QBa2JEMyZs1nPSPK3BcZskn+rOTyHPAUy+BCrrcvavsTZn22hd2sHHewHFABSRxzX1byyRU1jBWLPCT8LsdBoqMZcOZRfTi750lD8NwxqFAV/aCmAUW84/+01zpMmP6yBRJW4A6vSi5xLkDbiOupY75Yqo5v/EP/1uNS2QSNVMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpLhZKZMuech9rSN31ImuPnFc2gbkYROJlrKIvHDLwE=;
 b=aabSl3kMC2zwWLAi+qD9bWpadRx6qM6xdZtRyklzBTgNnImnbX5vOlhEHzU9x/kvFvIOLCkLy52J6uT7g9130K/TJQxaTxBAodH37Y1hX1ez32nrgdfUJ+XC2dZ+klxn2DnSpYuOmvbj9GG5zc6trTEMUM1W+nU2ksqpWWQivsE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1912.eurprd08.prod.outlook.com (2603:10a6:4:73::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 10:31:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 10:31:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Penny Zheng <Penny.Zheng@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Wei Chen <Wei.Chen@arm.com>, Kaly Xin
	<Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index: AQHWtnF2aLk0HNycw0Ccp4xeoLYWMam/mfqA
Date: Mon, 9 Nov 2020 10:31:07 +0000
Message-ID: <A6CE7288-A61F-4D99-966E-88A3F7A83EED@arm.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
In-Reply-To: <20201109082110.1133996-1-penny.zheng@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 070dfa4e-3fbb-4e6a-b57c-08d8849a9a28
x-ms-traffictypediagnostic: DB6PR0801MB1912:|AM7PR08MB5382:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB53823B90C84CFD106064821F9DEA0@AM7PR08MB5382.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y6KbrMQjlUwDTGq0aT9qoPbIE1kcXRr1biGNoKOZTsxWFuJW69UzO7Tk0fig1ijXpz3Ce/RsSC137FzLcAdBBeS5GZBAr2VZ+2wd8Yjo+UQo/zVJT1XncRXs4qyXIgWlvPK/10Y4U6Ixd1oDsM4QQqkisY7dDu4TSHt7xKenobwyWKtWiEWswWB3ryVG8+n59qLh+xZIIorTLXkrz5e2bCBbHCLQ6LYwnEF0+G2p73R8bWZWyKkUdkdz9IQqba3qPWwm1igZjKv9jQiOk6FgIyRkFWXWuMLTMmcNGelizaILdB0kmgoNAq36SkNwV7AtgCTGkfnzXySTu5R8NSaDew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(33656002)(66476007)(316002)(4326008)(37006003)(6512007)(6506007)(53546011)(66556008)(64756008)(66446008)(71200400001)(26005)(6486002)(8676002)(86362001)(66946007)(186003)(54906003)(6636002)(76116006)(91956017)(478600001)(8936002)(2906002)(5660300002)(2616005)(83380400001)(6862004)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 hfE3t5pGAXnp7UTinhRXniwk348Q9MnN0iVA6mEM+7a+nHLYSZ2GoULynKzRmFPdjQXNx3k3YeOzBJHtpxHGUgFkhE4VL7kQOwewKP9MXjHn5rKPstVunUhrwBTfUaxZUkbaNiJZ9Nw8c7xitXzKDyYNBGX+/D9alG8rYFx70Tta2o7ndC0Q6iOs27iQCG1KWhXUI6m4A+oFFiJhq5y8sUp5M87W2959qhPyUTKgd2uUtx/sfID2Gi5iN86KXIedaXA/4R1Fz3YjFvNHcVdzc03znNZIplkWQUVg/yINEFNVv1sZYECQN3tZ+hwZbNEN8pk6MbO7mteaC+2B2cFwXEz6DXEoSN86HzkJFtqLcLQ6CW+bCQClm0XUHuclDu21gngPifRQrxUJ0a4prpZqVBe+qoxDia9gRFDSoDnpGiJsX9aoSKHDy1UdUnf/iXVJIC8+tNs9nCoo0R/CqkdVvK4N+5m458kldXDPtwzmqcfzcPtfgabX850RqpAcv4xgDPURzabzFH/S+0+Xlmowu00zPxX8x1O/if6bit0J9cvtl79mXkAhLYfcnxbpbKSVk678u4Wnja8NkOnP/XW+SPSb3hNEbbwwTU8U6cfMhjfoBNjg1WXcgEawfbNu+Z1VoW2GKNvAUZEV6E9dX0/9Vw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B4A54530AB43C45874981F338CB77B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1912
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6806492-9388-4bea-a7e5-08d8849a91ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	obawSiu9lVHaZXmHxWWPWw5muuQmoYM0O7KNKY8cIOTXZ2VnvS2D2GbOMx3GzYhvrcjUPuYtzI/0Bb9pcinpaYcb689Y5qwtdKLe/mJ/mHV7TZ76ZGWEWvJgtw4TDEbbINctxtok+NnRhEumCol2sr7djkEIlKUrqxJElE0HuGlXv0iPVBRhPQMp5OEJwxct1PfaTubYj3dizaizwDLVQQopql/vIYousdvlwMusciquPpdJqF0ENe02dXCOw6Y2o//k/aKTSZmuPWOYNQTM9MZaIsBSvhI+l6i+a0kI01k+6wCPaRQKPRTUfmMd2sb9kgRzaH0LgGyLoGo/k+Ze0tCcEVJ2W0vfGiGC3XNVJhq/jRTA76eU9DeKYEVa9ASIV5kKS2Tom2fs7xVpreGW5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(336012)(70206006)(8936002)(53546011)(4326008)(6862004)(81166007)(54906003)(6512007)(2906002)(37006003)(5660300002)(6486002)(82740400003)(47076004)(186003)(2616005)(82310400003)(26005)(36756003)(478600001)(83380400001)(6636002)(86362001)(8676002)(356005)(316002)(70586007)(33656002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 10:31:21.9044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070dfa4e-3fbb-4e6a-b57c-08d8849a9a28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382

Hi,

> On 9 Nov 2020, at 08:21, Penny Zheng <Penny.Zheng@arm.com> wrote:
>=20
> CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
> might return a wrong value when the counter crosses a 32bit boundary.
>=20
> Until now, there is no case for Xen itself to access CNTVCT_EL0,
> and it also should be the Guest OS's responsibility to deal with
> this part.
>=20
> But for CNTPCT, there exists several cases in Xen involving reading
> CNTPCT, so a possible workaround is that performing the read twice,
> and to return one or the other depending on whether a transition has
> taken place.
>=20
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Regards
Bertrand

> ---
> docs/misc/arm/silicon-errata.txt |  1 +
> xen/arch/arm/Kconfig             | 18 ++++++++++++++++++
> xen/arch/arm/cpuerrata.c         |  8 ++++++++
> xen/arch/arm/vtimer.c            |  2 +-
> xen/include/asm-arm/cpuerrata.h  |  2 ++
> xen/include/asm-arm/cpufeature.h |  3 ++-
> xen/include/asm-arm/time.h       | 22 +++++++++++++++++++++-
> 7 files changed, 53 insertions(+), 3 deletions(-)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index 1f18a9df58..552c4151d3 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -51,6 +51,7 @@ stable hypervisors.
> | ARM            | Cortex-A57      | #1319537        | N/A               =
      |
> | ARM            | Cortex-A72      | #1319367        | N/A               =
      |
> | ARM            | Cortex-A72      | #853709         | N/A               =
      |
> +| ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_85892=
1      |
> | ARM            | Cortex-A76      | #1165522        | N/A               =
      |
> | ARM            | Neoverse-N1     | #1165522        | N/A
> | ARM            | MMU-500         | #842869         | N/A               =
      |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2777388265..f938dd21bd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -226,6 +226,24 @@ config ARM64_ERRATUM_834220
>=20
> 	  If unsure, say Y.
>=20
> +config ARM_ERRATUM_858921
> +	bool "Cortex-A73: 858921: Possible wrong read value for CNTVCT or CNTPC=
T"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around ARM
> +	  erratum 858921 on Cortex-A73 (all versions).
> +
> +	  Affected Cortex-A73 might return wrong read value for CNTVCT or CNTPC=
T
> +	  when the counter crosses a 32bit boundary.
> +
> +	  The workaround involves performing the read twice, and to return
> +	  one or the other value depending on whether a transition has taken pl=
ace.
> +	  Please note that this does not necessarily enable the workaround,
> +	  as it depends on the alternative framework, which will only patch
> +	  the kernel if an affected CPU is detected.
> +
> +	  If unsure, say Y.
> +
> endmenu
>=20
> config ARM64_HARDEN_BRANCH_PREDICTOR
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 6731d873e8..567911d380 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -469,6 +469,14 @@ static const struct arm_cpu_capabilities arm_errata[=
] =3D {
>         .capability =3D ARM_SSBD,
>         .matches =3D has_ssbd_mitigation,
>     },
> +#endif
> +#ifdef CONFIG_ARM_ERRATUM_858921
> +    {
> +        /* Cortex-A73 (all versions) */
> +        .desc =3D "ARM erratum 858921",
> +        .capability =3D ARM_WORKAROUND_858921,
> +        MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
> +    },
> #endif
>     {
>         /* Neoverse r0p0 - r2p0 */
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 6d39fc944f..c2b27915c6 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -62,7 +62,7 @@ static void virt_timer_expired(void *data)
>=20
> int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *co=
nfig)
> {
> -    d->arch.virt_timer_base.offset =3D READ_SYSREG64(CNTPCT_EL0);
> +    d->arch.virt_timer_base.offset =3D get_cycles();
>     d->time_offset.seconds =3D ticks_to_ns(d->arch.virt_timer_base.offset=
 - boot_count);
>     do_div(d->time_offset.seconds, 1000000000);
>=20
> diff --git a/xen/include/asm-arm/cpuerrata.h b/xen/include/asm-arm/cpuerr=
ata.h
> index 88ef3ca934..8d7e7b9375 100644
> --- a/xen/include/asm-arm/cpuerrata.h
> +++ b/xen/include/asm-arm/cpuerrata.h
> @@ -28,6 +28,8 @@ static inline bool check_workaround_##erratum(void)    =
         \
> CHECK_WORKAROUND_HELPER(766422, ARM32_WORKAROUND_766422, CONFIG_ARM_32)
> CHECK_WORKAROUND_HELPER(834220, ARM64_WORKAROUND_834220, CONFIG_ARM_64)
> CHECK_WORKAROUND_HELPER(ssbd, ARM_SSBD, CONFIG_ARM_SSBD)
> +CHECK_WORKAROUND_HELPER(858921, ARM_WORKAROUND_858921,
> +                        CONFIG_ARM_ERRATUM_858921)
>=20
> #undef CHECK_WORKAROUND_HELPER
>=20
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 10878ead8a..016a9fe203 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -45,8 +45,9 @@
> #define ARM_SSBD 7
> #define ARM_SMCCC_1_1 8
> #define ARM64_WORKAROUND_AT_SPECULATE 9
> +#define ARM_WORKAROUND_858921 10
>=20
> -#define ARM_NCAPS           10
> +#define ARM_NCAPS           11
>=20
> #ifndef __ASSEMBLY__
>=20
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 9cb6f9b0b4..1b2c13614b 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -3,6 +3,7 @@
>=20
> #include <asm/sysregs.h>
> #include <asm/system.h>
> +#include <asm/cpuerrata.h>
>=20
> #define DT_MATCH_TIMER                      \
>     DT_MATCH_COMPATIBLE("arm,armv7-timer"), \
> @@ -13,7 +14,26 @@ typedef uint64_t cycles_t;
> static inline cycles_t get_cycles (void)
> {
>         isb();
> -        return READ_SYSREG64(CNTPCT_EL0);
> +        /*
> +         * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
> +         * can return a wrong value when the counter crosses a 32bit bou=
ndary.
> +         */
> +        if ( !check_workaround_858921() )
> +            return READ_SYSREG64(CNTPCT_EL0);
> +        else
> +        {
> +            /*
> +             * A recommended workaround for erratum 858921 is to:
> +             *  1- Read twice CNTPCT.
> +             *  2- Compare bit[32] of the two read values.
> +             *      - If bit[32] is different, keep the old value.
> +             *      - If bit[32] is the same, keep the new value.
> +             */
> +            cycles_t old, new;
> +            old =3D READ_SYSREG64(CNTPCT_EL0);
> +            new =3D READ_SYSREG64(CNTPCT_EL0);
> +            return (((old ^ new) >> 32) & 1) ? old : new;
> +        }
> }
>=20
> /* List of timer's IRQ */
> --=20
> 2.25.1
>=20


