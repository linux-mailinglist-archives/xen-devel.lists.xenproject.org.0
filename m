Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80277252893
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 09:47:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAq9A-00015k-Or; Wed, 26 Aug 2020 07:47:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ynE=CE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAq99-00015e-VN
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 07:47:04 +0000
X-Inumbo-ID: 52aca59c-3d0c-4e76-8664-33a3454926d6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52aca59c-3d0c-4e76-8664-33a3454926d6;
 Wed, 26 Aug 2020 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVfeEEvUOvFT7J3+IXlUJLwjmxijKnSAT9UlG4QZC7Q=;
 b=Twd7EG7aIjw3RJCUo/37fbGIpVXm+9TKjB+jotuevRohyw7zx9rDSuMoyK+RxVa2KZlFLp4AOcF6bj7hpFFChojBuGLqkKmxzctwY+sY1Nc1PxqCAn/HhlfkdxxOHtJqB+gR4zmzY7FNFgZzdedww3yHWAVIsLb04raGenWGEL4=
Received: from DB6P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::30) by
 DBBPR08MB4744.eurprd08.prod.outlook.com (2603:10a6:10:f6::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Wed, 26 Aug 2020 07:47:00 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::cf) by DB6P195CA0020.outlook.office365.com
 (2603:10a6:4:cb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 26 Aug 2020 07:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 07:46:59 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Wed, 26 Aug 2020 07:46:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a961c5d3463bcdbb
X-CR-MTA-TID: 64aa7808
Received: from 49cbd8dcf1bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2A09D4E-89FA-43BA-BF89-9D3EB3C136EA.1; 
 Wed, 26 Aug 2020 07:46:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49cbd8dcf1bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Aug 2020 07:46:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFn6hsd6GJhOMST2ny26GuHdDen8P9Lxu4ndywQrpRvjwU0TMC1cdS1NSZbhjfkFQxm+I2zjE3fK9NQSJNXySZ9hSom6aNlxFkvIswBimt9EyTXT9+tmI+YNASBJiTsSZNBopQyZpU9cDfI/n5ujkqYT8PGYCpOtlZuFe2naLz73or80rG67lMJrAYu0/HId66VyOGInb8kUnMmz2vC8hR/f+BPiqTQUfdWtOBtTcCfOHxhFZj3UwX8PvRek0dX5omQyw6scq7x9Rb4duYkkr8FxG9eKW+MdKYGBURfJajrSN4g+YpS6voQI/hWxzM+PaAZvKh9roVL9AJG5MdE2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVfeEEvUOvFT7J3+IXlUJLwjmxijKnSAT9UlG4QZC7Q=;
 b=hZRp5/CmpjEGY7/vK0aETVpV5hUoi4QAIIlx9Eyt4fruD0GwFbDyVGpIo7Fdcmu3p/gPtETVjdqID3rxdgN4du5vuDOONIXnGO1KbKufU7DkWEfQ8prtQGQIjz3VBehEXBhlKTVEicq439Yo6rvOFS7EsC2glYzIiIqPmQhUT7Vpp+AeYkSf7saTG7k8lmFdpu73x5zmSnj/NN2NTd9hSvfE/mrwskyQclgesuOaO21NSXc+O+HEesFic3XQwi5pnDIkNw4VnUuspD5FGTFVQcm+lGZY51WThfxaFWzt8cXePYvsKBK7U7bL2J0XxDJpJ/uimWcL95KnTRnYc9HOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVfeEEvUOvFT7J3+IXlUJLwjmxijKnSAT9UlG4QZC7Q=;
 b=Twd7EG7aIjw3RJCUo/37fbGIpVXm+9TKjB+jotuevRohyw7zx9rDSuMoyK+RxVa2KZlFLp4AOcF6bj7hpFFChojBuGLqkKmxzctwY+sY1Nc1PxqCAn/HhlfkdxxOHtJqB+gR4zmzY7FNFgZzdedww3yHWAVIsLb04raGenWGEL4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 07:46:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Wed, 26 Aug 2020
 07:46:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Topic: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Index: AQHWewnUkkU6H1K20kyXPZAlyrTVA6lKBAsA
Date: Wed, 26 Aug 2020 07:46:52 +0000
Message-ID: <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
References: <20200825174208.11070-1-julien@xen.org>
In-Reply-To: <20200825174208.11070-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b7fc5c2-d8b8-46be-9c95-08d8499436e8
x-ms-traffictypediagnostic: DBAPR08MB5752:|DBBPR08MB4744:
X-Microsoft-Antispam-PRVS: <DBBPR08MB474498B1D037538F0952FA619D540@DBBPR08MB4744.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cq7kyIkDOKe2ixsYpRsb7qnUtrLZOImA2tnlf/3OvEUJLl6q9T/ul/QD1G6vdnGXf0tBnlo/o3oHxWOETSkZPpn4v+29lw9kWJ3GwtMsVwkgTmPo7YROBCO/+D6T+NatAFTb2vxHHLyQZbTtIpUIfFzk9TOkg9yRdRrBYt4uH4yPhGsmtMjlHgWB1gOZhutn8H4FsnnRiLw9eh+3BqvC4MhaNm0wmr9cq1WXr8p934CsZEwSNsUB+BynngfiQWLnKM51AQcWXh/4kuk67Q9LGK4yZS5NGU3593Koj2HRbV4VtP58xUgeDsA0i7Rsi+fKx8KJxAO435XNmDDoVhBYhA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(2616005)(71200400001)(66946007)(66446008)(76116006)(66556008)(91956017)(8936002)(33656002)(15650500001)(53546011)(186003)(64756008)(5660300002)(66476007)(4326008)(54906003)(6486002)(26005)(36756003)(2906002)(8676002)(316002)(478600001)(6512007)(6916009)(86362001)(6506007)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1ou5tY7W+1jglDnuu+kR23xXor6StnPfvu1PrzP9POoSJUJ5Rsg0opEP47hRKqHeOPsEdJWPt7DtV0nqvltK8Qx/POXqVCCDatfldpqBwjw+azJOMaShYsBLBd9LKOXR4SBTOCAm8UxBslcF1NVY6GE+nNseOG13GZU6Qg3VEmb5M3mmoogvozR2XJPSv+ePt42qeHCDvtt86inpa589CTuC6ip2Xz6Yq0zIkzFDPKFCc6mikHPYeJJkGfAb3CCSTEY8iySCsHbCJ30nAHRG0zYcwBTAQ/qceRkMzJL3NPTOF6BBZpUJkcJeLCq9J4+jvA8k919Rb0b850lGJrdDvnN0bPaFOAR0BWjbijd9CufcedWGzX5+ezS4wnrhXHdtva7pr8if7qrg933HCE3uIJo72adE/kkjpyMnG7txD5I5FeYNwIctvs1vHFaPHN7748SBpBlnV6zmNvK+shfT3qCFROS0uwV5C3TSJRlwrxTnhwkQT2PUaBZi1Y2pL7qRd02lJhxopja5SQp3E8wYULX6hkJaB37CgIUnRprMgyPiYVe9ZpD0KeIFia7RPSOl6c2TdASqwdDZSOr/Y1DklPMvQdDAak7+UHiIKtZyz9m9YZugywAmgXXiQ14Zs/9/P5Cif9EpyWk4r7L+4Kwx4g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBECEE20F7AD884CB58EF3673790FFC6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a936ca29-8552-4ca0-fc95-08d8499432c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eqgDdXcCdBOx1KpEXakxDFUXS6z1Ww8rnVPa1HVHkaxTnXOG50m6GcOpKvSl4dxEO1cRZ9vTjTzg8PAYp+czFtZaG9Muv9o7QzWQAMpKkl/POIhQO9csGf87FXCZx+/BNykkWsqi5j35U/vYegVPTOpQ1wD+I3/p/gOJkesBmKduKr4Bd8FHN7YDodE6Hb8Jqgh2sYJsq9mL814P2smDsBubYq65E45lsw2HnI7hYLISGr8n5BVFX7NhMPxXNBemwF1I2ND/lIiLwpFSkrBSEsVtvLjfnOeZFIqyz87gJaTj0IctGKBKOdlWg1d+2MpylVXaCQGEeW14950M6JxKHf5wgZyM7nwFe2BDg5CnJX7h7sdJchnNMRb32ABMSVqzPTBUgXxOXseyPOiMlInBQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(70586007)(54906003)(6512007)(6486002)(356005)(15650500001)(8676002)(83380400001)(26005)(82310400002)(2616005)(5660300002)(8936002)(186003)(316002)(82740400003)(2906002)(86362001)(70206006)(6506007)(33656002)(53546011)(47076004)(4326008)(6862004)(478600001)(81166007)(36756003)(107886003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 07:46:59.8056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7fc5c2-d8b8-46be-9c95-08d8499436e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4744
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



> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
> added a new erratum but forgot to update silicon-errata.txt.
>
> Update the file accordingly to keep track of errata workaround in Xen.

Oh i should have done that as part of my patch.
Nice catch.

>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> docs/misc/arm/silicon-errata.txt | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index 11e5a9dcec2c..ee070e723a5f 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -51,4 +51,5 @@ stable hypervisors.
> | ARM            | Cortex-A57      | #1319537        | N/A               =
      |
> | ARM            | Cortex-A72      | #1319367        | N/A               =
      |
> | ARM            | Cortex-A76      | #1165522        | N/A               =
      |
> +| ARM            | Neoverse        | #1165522        | N/A

Should be Neoverse-N1 here (E1 for example is not impacted by this errata)

Cheers
Bertrand

> | ARM            | MMU-500         | #842869         | N/A               =
      |
> --
> 2.17.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

