Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CA288F33
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 18:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4865.12732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQvdl-00085k-Ko; Fri, 09 Oct 2020 16:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4865.12732; Fri, 09 Oct 2020 16:53:09 +0000
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
	id 1kQvdl-00085L-Hc; Fri, 09 Oct 2020 16:53:09 +0000
Received: by outflank-mailman (input) for mailman id 4865;
 Fri, 09 Oct 2020 16:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHyC=DQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQvdj-00085C-LX
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 16:53:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64b967e6-5484-4d2b-be8a-37f420d5449f;
 Fri, 09 Oct 2020 16:53:06 +0000 (UTC)
Received: from DB6PR0201CA0004.eurprd02.prod.outlook.com (2603:10a6:4:3f::14)
 by VI1PR08MB4510.eurprd08.prod.outlook.com (2603:10a6:803:fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 16:53:04 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::a) by DB6PR0201CA0004.outlook.office365.com
 (2603:10a6:4:3f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 16:53:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 16:53:04 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 09 Oct 2020 16:53:04 +0000
Received: from 491c1cbede1f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D0EDAE2-31B2-414A-BE4C-23B431B9658E.1; 
 Fri, 09 Oct 2020 16:52:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 491c1cbede1f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Oct 2020 16:52:42 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 16:52:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 16:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XHyC=DQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQvdj-00085C-LX
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 16:53:07 +0000
X-Inumbo-ID: 64b967e6-5484-4d2b-be8a-37f420d5449f
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.44])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 64b967e6-5484-4d2b-be8a-37f420d5449f;
	Fri, 09 Oct 2020 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVJrITW8CwGkDrhswFYdOGz5HdCluBOgNTFnJnmzA8g=;
 b=CjD/KsfLjM2+ZU874TgoHzb3KHfTxeP7NZRazpS5DnEZvY1ABzqiDUD6CNCUAV2cfz237k5WCG3GN8PI95XXmWWC4szDgaP7y5xVqUcvXS58Zdf66iuQHQGbdDfVSUnJkCaAlgBJhYtW0rqMOBMLpb2xii1waiaDKNrmrbj7nsc=
Received: from DB6PR0201CA0004.eurprd02.prod.outlook.com (2603:10a6:4:3f::14)
 by VI1PR08MB4510.eurprd08.prod.outlook.com (2603:10a6:803:fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 16:53:04 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::a) by DB6PR0201CA0004.outlook.office365.com
 (2603:10a6:4:3f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 16:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 16:53:04 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 09 Oct 2020 16:53:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58f9a50300b4ec21
X-CR-MTA-TID: 64aa7808
Received: from 491c1cbede1f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D0EDAE2-31B2-414A-BE4C-23B431B9658E.1;
	Fri, 09 Oct 2020 16:52:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 491c1cbede1f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Oct 2020 16:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXcBw/6WiTJRGigSbDt37ZmGZi+WUo4Gcy/I/zWh40M4QpludOnlj8wndKPpxyA8Y1X4BTZF+agLVtXHIQjDDVqmRDmFoowcOzck52aDqyNnMx+1SdAId7P+/IGe2oE68l6p4GjBQS7I4EAhxvxSN/8Z8zZZIhq+KKh+HnwvFVvsSHDzPxW/Hf2Aczif2CIyGgi8Oa/j7wIqO+1J+Yl9LaNInbBuJOxxY/+nNapWdLrLQxpyHhESltX+Z/SNKMvxIftnnRHbUEkm7NYVPrugN/WyDm5RpY/bhlxtjE60iqN1Mirve4Da9JJ9R4TtphhWbMETKRSQGv81w2oMTB/LnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVJrITW8CwGkDrhswFYdOGz5HdCluBOgNTFnJnmzA8g=;
 b=AToywdoJzy1AXsCuYXI1gBqugo1+oJ1VevHIf43/MPUf4nBcEWYqsJfvqeWCsw0vi4/1DuGeDhL2ckT7Ujxou1WU1qcqUkvSKohkHvY+oB7iwCRidXA2FTUJJyIpDFyZCUwQetYEvsZwJW9isXNJDThQzqc9Ox2kNlC/0eZXifCwBhHstFOziCQcByG1xuQZzC1j3x0yHmWx/Xm3wSCJeQjPBBCKTNd4P3llNPxILLyqqZt5O7VqqpdGnVdOeEiKcgG/Siq2K9o/ZnevVXjrunwbyaaXHzJkEX58P7gq+r7lU4C3rFvIbIEUKnob0aPDvUbBAZ0HBSPnbltHGjlC2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVJrITW8CwGkDrhswFYdOGz5HdCluBOgNTFnJnmzA8g=;
 b=CjD/KsfLjM2+ZU874TgoHzb3KHfTxeP7NZRazpS5DnEZvY1ABzqiDUD6CNCUAV2cfz237k5WCG3GN8PI95XXmWWC4szDgaP7y5xVqUcvXS58Zdf66iuQHQGbdDfVSUnJkCaAlgBJhYtW0rqMOBMLpb2xii1waiaDKNrmrbj7nsc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 16:52:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 16:52:40 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"roman@zededa.com" <roman@zededa.com>
Subject: Re: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Topic: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Index: AQHWnPqc7v70BAMN4EaAQA/1huLhsamNV4yAgACv0gCAAN+3gIAAkuUAgAAFQwA=
Date: Fri, 9 Oct 2020 16:52:40 +0000
Message-ID: <4DE99283-89F3-4FA1-84D9-88F37ED236A6@arm.com>
References: <20201007223813.1638-1-sstabellini@kernel.org>
 <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com>
 <alpine.DEB.2.21.2010081103110.23978@sstabellini-ThinkPad-T480s>
 <B196761E-78D7-4891-A28E-E04E0B85A202@arm.com>
 <alpine.DEB.2.21.2010090933240.23978@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010090933240.23978@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1b86fd0-c769-49ea-3470-08d86c73ca28
x-ms-traffictypediagnostic: DB6PR0802MB2566:|VI1PR08MB4510:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB45104A4D276C888A40F168349D080@VI1PR08MB4510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UVhblb4U/1kD+zWxQS7zewSoXiEXLsrPq4qiSwS1LivqtNPL0TqYLTQD9nLYMboROH6FXzSOWHJ+ez965MWLlaW3YNgqrQlOpa71yjttuVlLg6Zu2vfu2SGfsY/ZNvdM1H/eGUcKHQ9lzadAC9TBSKga0Yw0dNR9It1NB1Rhk0V+hlVO/2BAvGGue9YxOpGqPrI0G9xoShm1ERR6AtlF9NanU2d7+K9EuT3KS6Xe3PwQy2o2n2ams+yv39iV7uQRB78KEk8iuA2JguK7Oqt/13op1gX5mN0azQPOeGY2mhD771b/M53Wqi4/DPVeQ+ftfpviwFo0kVjfXTK1rxldGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(83380400001)(5660300002)(66476007)(6486002)(66446008)(33656002)(64756008)(478600001)(6916009)(4326008)(66946007)(316002)(91956017)(66556008)(54906003)(6506007)(186003)(53546011)(36756003)(76116006)(26005)(2906002)(71200400001)(8676002)(6512007)(2616005)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 MAYZ45Bbq6fwXCxJngiFQ1V8W5AZb71NF2MyyY3ClsPk6SBWqBuH1DYPu8u1sJNRPFfuuWUgqNKuxhnOETgk91nXU/JI70v9hxlk/O571fqFcStfP/1wB7yRIkx4HoZQFIMYw6s02XYcDF9bD3bVfctEFN8L5FsazocJVERHPLdExiFcIeJKmLhmG0iFU80E1R8sJPj5NTZvv1pZkGU8AloVutMJc7sQZm7dQ6ejZPyV8owGgFP/BKrPeX0CnlSYPRxzXjyisBB9BvMd6K2WJcQUDmhHcdhOEP32H8PBLK3G/ZxrPLi9x9GQ53yB3qETHex7xhJa8uk0cibHwN37lZA5c45JknQ6cqzT66U4tLLjc3ryxo0ZFn21L/YupqLqCrrDMmZOkSE1I552e0SROH7dz41MwZxUuTtXI8p8thQkFMOnvJfxGjFQHh4pbqC5r4lf/lpgfeMgV9t7UHLehFmMz3FV2ERBgGPL7ohopXnm99N6rcTAe9mRLLn+fEYnjMss5tIRcYUGKBjpa6WrS5uplpN/Hng2kT2VPBwEBTkBzGMu/QOh0bDaccSbYcf1ra1HocTt8ANs/YUF/Xx4LYF8M4HNAd8lVby8yKT2RTphcA9+nS6cFye+XWs+CXBYFuoznjNALze6XVswzPgICw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F55BA0551CB4C7479135208A99C510C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2566
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89e2f452-989a-40b1-d020-08d86c73bc4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q/Hc+88erewkKk98fwy3b/iFCP1SIGTBOosAdGX5QQYriQkzXo3eg1QkLKpktz1sAttus6F5Dxrje5qawyuvwaS+uNLC6QRItfa1UH5sX4rSgG1rPdooe13f+v+GYyC32WdJ946658bNhh//29O+VFrYATjd1GsuE0Vq6rrE1owheW8VkQadK3qirCwYM3VPkScU5Cg/AoxHqebtpkMuDlZiGWJjM4cb9s8Bum0Hqj911UrmrVDGoZNiKvVbFlc33NjNJVFUP+9v/wBiciQpcJtmF2ndBD16FRFk0d3gA7xY5Hb2GQO9bRWdSGszTAycFWz3c3givoVpNlVDttaaKcoSJRht8+9ozWKWQ7C1itp0TaIHFGNJZ3qTBW0eShsmwkwq4spGm4CRqLmI3znCKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(107886003)(53546011)(8676002)(47076004)(86362001)(82310400003)(26005)(6486002)(70206006)(5660300002)(478600001)(70586007)(81166007)(2906002)(6862004)(36756003)(2616005)(82740400003)(33656002)(186003)(336012)(54906003)(356005)(316002)(83380400001)(6506007)(6512007)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 16:53:04.1536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b86fd0-c769-49ea-3470-08d86c73ca28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4510

Hi Stefano,

> On 9 Oct 2020, at 17:33, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Fri, 9 Oct 2020, Bertrand Marquis wrote:
>>> On 8 Oct 2020, at 19:27, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Thu, 8 Oct 2020, Bertrand Marquis wrote:
>>>>> On 7 Oct 2020, at 23:38, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>>>>>=20
>>>>> The preferred method to reboot RPi4 is PSCI. If it is not available,
>>>>> touching the watchdog is required to be able to reboot the board.
>>>>>=20
>>>>> The implementation is based on
>>>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.
>>>>>=20
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>>=20
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>=20
>>>> Maybe a printk if reset was not successful ?
>>>=20
>>> That not quite platform specific but we could add a printk to
>>> xen/arch/arm/shutdown.c:machine_restart if we are still alive after
>>> 100ms.
>>=20
>> Even nicer :-)
>> Definitely usefull to see something if for one reason reset/restart did
>> not succeed for whatever reason.
>>=20
>>>=20
>>> I'll commit this patch as is and maybe send another one for
>>> machine_restart.
>>=20
>> Please tell me if you want me to handle that one (at the end I did reque=
st
>> that so not really fare to ask you to do it:-) ).
>=20
> Since you are volunteering, yes please :-)
Fare enough

I will add this to my small fixes list :-)

Cheers
Bertrand=

