Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC262AD283
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 10:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23116.49702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQ0L-00059B-TS; Tue, 10 Nov 2020 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23116.49702; Tue, 10 Nov 2020 09:31:57 +0000
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
	id 1kcQ0L-00058d-Pu; Tue, 10 Nov 2020 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 23116;
 Tue, 10 Nov 2020 09:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8v0f=EQ=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1kcQ0K-000578-2K
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:31:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236309b9-9dd4-4055-bb2a-f3e2adceed66;
 Tue, 10 Nov 2020 09:31:50 +0000 (UTC)
Received: from MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::13) by
 VI1PR0801MB1919.eurprd08.prod.outlook.com (2603:10a6:800:89::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 09:31:48 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::4c) by MR2P264CA0150.outlook.office365.com
 (2603:10a6:501:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 09:31:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 09:31:46 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Tue, 10 Nov 2020 09:31:45 +0000
Received: from 6ba7799d1be7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2DDF338-D78D-404A-B160-587F118C2D72.1; 
 Tue, 10 Nov 2020 09:31:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ba7799d1be7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Nov 2020 09:31:40 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3584.eurprd08.prod.outlook.com (2603:10a6:803:88::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 10 Nov
 2020 09:31:38 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::68c2:f9e0:49c5:7e18]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::68c2:f9e0:49c5:7e18%3]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 09:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8v0f=EQ=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
	id 1kcQ0K-000578-2K
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:31:56 +0000
X-Inumbo-ID: 236309b9-9dd4-4055-bb2a-f3e2adceed66
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.74])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 236309b9-9dd4-4055-bb2a-f3e2adceed66;
	Tue, 10 Nov 2020 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9IZsptPU/gTSzuYimH3onRmy2KghqqHJrBnEnUhsOQ=;
 b=zNEMX5wtoIR2xzMmrzUdd+75dMIqtIHlZ4iJ45DHhXyh7XX19Oc8aMgsN/rW7oKzl+Kr27YtVVEBZDOrfq5YoFOEAOziVZLP/J5qQ2MKAlGjepKZVhhIiw/Md3R3sROPErroKKYoSHpPdkm6/FYCITH5GFlyqs540WGn9lnImoA=
Received: from MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::13) by
 VI1PR0801MB1919.eurprd08.prod.outlook.com (2603:10a6:800:89::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 09:31:48 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::4c) by MR2P264CA0150.outlook.office365.com
 (2603:10a6:501:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 09:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 09:31:46 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 10 Nov 2020 09:31:45 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6ba7799d1be7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B2DDF338-D78D-404A-B160-587F118C2D72.1;
	Tue, 10 Nov 2020 09:31:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ba7799d1be7.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Nov 2020 09:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P55FmaBW4vOANJHuWDOjw2RlcVhicLAlBp9nxufjO/KjeyBitgPQKEVHBN6nkiVW/o+7ZjbTyvzTCfBHl4zWDCm2V6vsuW1dH/bUAdY5kiqbGyLiNlF8CNbwPZ2OWajPhMWAaB7zL5JpG0jHNPT9vKMED2hKRD9yATBBxev+0XhwEe/3JQ8SrYpgSO9aP+t1J7ZlpLMequE3zt0PQc6ZTt/PNCqlgWp+OXEm7k+HoL26QO3fDRuvkHid5NujQ5eaml0tCe5iU0qvqT2Jt1dm2lg4HD5Jwm0zGlVGSMs+ZDbqa56s8PwbqS78AZ2GYHwBHYEpEaJYWDNSAInfaCwTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9IZsptPU/gTSzuYimH3onRmy2KghqqHJrBnEnUhsOQ=;
 b=lmoH92UWeS487QAwi2yst0/njd10We5Z7NQ65aFZB2YoRChzoKwCkWMZD4JK+z+PaMxsPvM8Kp82IlSaisyxaZmPUgkyYU1qh6VAtgvYG3zd0oykRvS4j5wpWqFEbRlIdN3Yb+4OBrjw2QbbaIgTcW7avDz/Y/SoXHFFoQnn/QjJ5rDVanerarxtAKRqnQhP/y3Xxe8OxlWYocA4Lhwkz81yihnYAK77zM1OfdJTDodF3vnQRc0s2dH48QayzIRyLox2goDWsUB/ItlTUT6J3JMky6iGAxNPMBqzHX/G0knyOlfS/aSub9hOhX+otJuCQQCFM4v4k0BBJPM7Y+Bkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9IZsptPU/gTSzuYimH3onRmy2KghqqHJrBnEnUhsOQ=;
 b=zNEMX5wtoIR2xzMmrzUdd+75dMIqtIHlZ4iJ45DHhXyh7XX19Oc8aMgsN/rW7oKzl+Kr27YtVVEBZDOrfq5YoFOEAOziVZLP/J5qQ2MKAlGjepKZVhhIiw/Md3R3sROPErroKKYoSHpPdkm6/FYCITH5GFlyqs540WGn9lnImoA=
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3584.eurprd08.prod.outlook.com (2603:10a6:803:88::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 10 Nov
 2020 09:31:38 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::68c2:f9e0:49c5:7e18]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::68c2:f9e0:49c5:7e18%3]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 09:31:38 +0000
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Kaly Xin
	<Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index: AQHWtnF2vBhY4+4fg0iJYr/0WqjXm6m/tA6AgAFmnRA=
Date: Tue, 10 Nov 2020 09:31:37 +0000
Message-ID:
 <VE1PR08MB521542C55E70B3280B51175DF7E90@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
In-Reply-To: <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 701A1A5E6FAD9B44A481112128DBD013.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fcc157b2-05cc-4eb4-6524-08d8855b7141
x-ms-traffictypediagnostic: VI1PR08MB3584:|VI1PR0801MB1919:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1919ABAD0540629D386B613EF7E90@VI1PR0801MB1919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HsIf1m3Nu0bQipYOw6A+I3j+3nBzNBYdqFotC1+GdYd1cFbK/expmIntfLZAPMSbWSQrnt2kERpYC3/LspjN5PJr6Yii/cFAiAK/lMgml2DxsvR2gkibQ+8CaL6YoJOguSzsQn+eJxZ5GiE1gRe5GO67PrxSGk0bqH0w6IGStoI4yMP2fhk9j7rMwHwmyoU/ObcOs3q9sW0alYo9trblv+BXMJCMv3nztOBocp1CtMffmfbvZlQCybGAlkJhouV4guUUL3VX3my5BQbb9jRUKBbcylYv76mCNxZPgZ25nQkrIyjhVkq6SCJJfq9j6dxLQzrhLFGKJ+t/ViiiVS/oTA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(53546011)(64756008)(8936002)(26005)(66946007)(6506007)(186003)(83380400001)(76116006)(66556008)(86362001)(66476007)(5660300002)(7696005)(8676002)(52536014)(33656002)(9686003)(54906003)(55016002)(2906002)(478600001)(4326008)(316002)(71200400001)(110136005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 7EDylir6ILKl5J93DpwZtBL/FJEkcAF4qYYEZoz7yQDrGECW62XS+xtXKilWSSETg/omkhTEAqRZUg5qCpFXyiVy7H15GBkVOdLj8JqNYC0zSxWyjZF0oQMVSYh3JKSfwJrGUe0vkrL1/SFHjWjJ9GuzWez5QNzR74EaorAmfP9EpeI2YRMA7hxg/TqluoDxSpGjdYkidHqTlkvQgnYZtcSOhlMYkx8DYSn3wl2d09LHN5tNkkgHoIf8CWlCDTl6P1E+Y8Yxwwz96PVrb83zhCfHW7FXIuY5yr3E8WuFUGeXcAiv+uNKOoVzE4Tm7FbkQBst46A54qfuy4eqHTi6C9PwNkcxFpFqXpHpUFhoVa0yoQM3HMnAkpYl+p7aHh4QYpnlBHZkp1hPBZp/zWcX7cOgs+fYHxb8d1UKbMPVPdS5CG+6alscGTLxdB0IaL2On6wUza9PTyq+wspRDPvDWCpqp1FqyGvPmr6XrYsTlaymap46iK8igRcoqzl7m5geOk2wxvW3Zpq5m0isThHwbHAvr2Kd5J8cvD/XmiaIlqAT6npJQpuur1IlN+9shxRfrWKg8x0kTXGa75nTyvlBPJPOO1QRriEnBbm+/xg15VHUadmpepXM+kRNLL+rNOCfYxNKmCj2xGozKIijHyoO3xphb/XY7sVVIZVctagv19Nps0OtmM32VcdyCgzMGwF8tJGuYsc9gLCCXWx/U1ZkOZLyUHNgh1N6ND2eduFi8PXHsEV8QGu1sqi5KvZXtleQ9sUaEDRry64NEMEauQGbvs3n0xuxFg0WRgob5cw4JqaqHBJ82pYX2QBzRAFJkkXHkCKb3brA+CqOrh5ywKiHrtKo/3O+lG0xWoRkTdoY31bdJaPxn6MeeUtFVT+FELp1nnKpqWJkMScPGNiOG+IgmA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3584
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36952f97-3d06-4bee-aa55-08d8855b6c83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0H1vbCtHx5/pGjA0nEFncp7Y7DAh7aLcG1kb9YsL2PlZFMSIV+xYPENJKTE6kXnkOOSigDuaV31u0PVBbnPqIYDCRv195Dej2oWMhriyHWs5MuSGNfrzeQDper4TiTLl0jrpfa+b4Rl5U8XpJ5GtjAB+C4q1srdn9n1uaZEVtttnayW0Na0WOYDlzN9G/XCOrlZN6s2jz+CgiZy2EX14CDkA+mHl86ax9JqoqgRV8VTM2cMeNNinmicXoEK8YPqrrY4G7g4UJqHq5uQzIA0JXsw6cIfWAJN1fJm0sTLpFjVyvKTpbh/j6Fsa8WXd/yO8xAr2f2iCFs3SN6uGrHc6GYUxpKmC3A6T0Kv8yyYWHoa2u8XF0uQuH2riC7TuM/rD2pWreYBES/JuaQHA/sb9Ew==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(336012)(53546011)(81166007)(6506007)(186003)(26005)(7696005)(70206006)(356005)(4326008)(55016002)(83380400001)(5660300002)(70586007)(8936002)(86362001)(2906002)(63370400001)(63350400001)(8676002)(9686003)(316002)(110136005)(82310400003)(54906003)(36906005)(47076004)(82740400003)(478600001)(33656002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 09:31:46.0255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc157b2-05cc-4eb4-6524-08d8855b7141
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1919

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA5LCAyMDIwIDg6MDQgUE0N
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBBbmRyZSBQ
cnp5d2FyYSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgS2Fs
eSBYaW4NCj4gPEthbHkuWGluQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0geGVuL2FybTogQWRkIENvcnRleC1BNzMgZXJyYXR1bSA4NTg5MjEgd29ya2Fy
b3VuZA0KPiANCj4gSGksDQo+IA0KPiBPbiAwOS8xMS8yMDIwIDA4OjIxLCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4gPiBDTlRWQ1RfRUwwIG9yIENOVFBDVF9FTDAgY291bnRlciByZWFkIGluIENvcnRl
eC1BNzMgKGFsbCB2ZXJzaW9ucykNCj4gPiBtaWdodCByZXR1cm4gYSB3cm9uZyB2YWx1ZSB3aGVu
IHRoZSBjb3VudGVyIGNyb3NzZXMgYSAzMmJpdCBib3VuZGFyeS4NCj4gPg0KPiA+IFVudGlsIG5v
dywgdGhlcmUgaXMgbm8gY2FzZSBmb3IgWGVuIGl0c2VsZiB0byBhY2Nlc3MgQ05UVkNUX0VMMCwg
YW5kDQo+ID4gaXQgYWxzbyBzaG91bGQgYmUgdGhlIEd1ZXN0IE9TJ3MgcmVzcG9uc2liaWxpdHkg
dG8gZGVhbCB3aXRoIHRoaXMNCj4gPiBwYXJ0Lg0KPiA+DQo+ID4gQnV0IGZvciBDTlRQQ1QsIHRo
ZXJlIGV4aXN0cyBzZXZlcmFsIGNhc2VzIGluIFhlbiBpbnZvbHZpbmcgcmVhZGluZw0KPiA+IENO
VFBDVCwgc28gYSBwb3NzaWJsZSB3b3JrYXJvdW5kIGlzIHRoYXQgcGVyZm9ybWluZyB0aGUgcmVh
ZCB0d2ljZSwNCj4gPiBhbmQgdG8gcmV0dXJuIG9uZSBvciB0aGUgb3RoZXIgZGVwZW5kaW5nIG9u
IHdoZXRoZXIgYSB0cmFuc2l0aW9uIGhhcw0KPiA+IHRha2VuIHBsYWNlLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+IA0KPiBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4NClRoYW5rIHlvdS4g8J+Y
iQ0KDQo+IE9uIGEgcmVsYXRlZCB0b3BpYywgZG8gd2UgbmVlZCBhIGZpeCBzaW1pbGFyIHRvIExp
bnV4IGNvbW1pdCA3NWExOWEwMjAyZGINCj4gImFybTY0OiBhcmNoX3RpbWVyOiBFbnN1cmUgY291
bnRlciByZWdpc3RlciByZWFkcyBvY2N1ciB3aXRoIHNlcWxvY2sgaGVsZCI/DQo+IA0KU3VyZSwg
SSdsbCBjaGVjayB0aGlzIGNvbW1pdCBhbmQgdGFsayB3aXRoIG15IHRlYW1zIGZvciBmdXJ0aGVy
IHdvcmsuDQoNCkNoZWVycw0KDQotLQ0KUGVubnkgWmhlbmcNCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQo=

