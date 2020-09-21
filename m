Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2C2723D9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 14:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKsW-00045T-1L; Mon, 21 Sep 2020 12:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhes=C6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kKKsU-00045O-LM
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 12:25:06 +0000
X-Inumbo-ID: 60a4743d-25d1-49da-afc3-51d44d13e6dd
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60a4743d-25d1-49da-afc3-51d44d13e6dd;
 Mon, 21 Sep 2020 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNBBm1mANX89y44izPcFbe9YvEWtwXEwl73gldcT0jU=;
 b=X9061kSCph4PeuoCn4fh9/KeHhOIKPs2pYbqS47k9Ne2rHjHnkciiNneXb7cbzTGX/ffog7/7rt2wYe0rMhJmKhYVRpbgWoDkbjv0/MgvGu7Y1kS4z7anWpWXmIz8J4zWUCcTnrxZ5E3g9x2h416jrt6Um80R9SeTEIj8V5dF64=
Received: from DB8P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::40)
 by HE1PR0802MB2137.eurprd08.prod.outlook.com (2603:10a6:3:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Mon, 21 Sep
 2020 12:25:02 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::3e) by DB8P191CA0030.outlook.office365.com
 (2603:10a6:10:130::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Mon, 21 Sep 2020 12:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 12:25:02 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Mon, 21 Sep 2020 12:25:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7acc4b249b987268
X-CR-MTA-TID: 64aa7808
Received: from 120ccb808498.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19E024EF-DC86-409F-965F-CEA7B069B901.1; 
 Mon, 21 Sep 2020 12:24:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 120ccb808498.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Sep 2020 12:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en7lGEAsQyZcyRU2trxmVaUqx4o5i0r7FiDzQIQKgBOuTkDl9A792tAjohV12EOoX/a8ENTYOIItPFA/7o/Dur/J2UliCbUth6GhrtoysbPG+L25UZjufhVP2abBc2fweKYUgEqoeqviPj5VHfpI15X13+Q5Q4pKzSuJdeo6B9IzQ71mX7gWDisyrtG9V7KcluqHW5BJ+F31JM+jaxmr+YdRnpxZSBHLm1/nCzi28hJdxNMHApop5EuTr2V98PiR7UxsrqR8lVmwZQomSxBonlbxcjxb6+P4bRVYU3MUr6gl+vh+dxaCdeP2NGRFBNwx/22j2qoB14JInZdfnr6vHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNBBm1mANX89y44izPcFbe9YvEWtwXEwl73gldcT0jU=;
 b=gAEfKA8+BI6Z6Tqzc4MQpvqKc/YwTFKizDAs1fnI3V/dB5XpAD47aosokcXzbe3U7LLG7nDpJLO2UHY9lQonEa44POmtVPMWEC6eBRLCYEFQmGseab/Q5GuYa5I+1ZPlQ354OdD3JckzYalL6ib12tBCNSyD3rB8zUe6Cpuv9TdBVLiEy5w2A2rqLY/f/EH4DDpwHxW5VS3Lb7YXHayz1B9w3cbJxuxw0wlwdQJAodM9iZGNjz9dcJu3/DwzLEVZEpBSuxWWtipn3IUzAjCTPlt+jtXWJQtRe/9Ws2bdAouC4gbaSCte155IdW3QhRX+4/Xi9mO/kpMRbTQzdxgLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNBBm1mANX89y44izPcFbe9YvEWtwXEwl73gldcT0jU=;
 b=X9061kSCph4PeuoCn4fh9/KeHhOIKPs2pYbqS47k9Ne2rHjHnkciiNneXb7cbzTGX/ffog7/7rt2wYe0rMhJmKhYVRpbgWoDkbjv0/MgvGu7Y1kS4z7anWpWXmIz8J4zWUCcTnrxZ5E3g9x2h416jrt6Um80R9SeTEIj8V5dF64=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4823.eurprd08.prod.outlook.com (2603:10a6:10:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 12:24:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 12:24:24 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel Wagner
 <Daniel.Wagner2@itk-engineering.de>
Subject: Re: [PATCH] xen/arm: bootfdt: Ignore empty memory bank
Thread-Topic: [PATCH] xen/arm: bootfdt: Ignore empty memory bank
Thread-Index: AQHWjd7zyb31yIRDt0eFx2X6X5zVxKlzCIiA
Date: Mon, 21 Sep 2020 12:24:24 +0000
Message-ID: <0AAD50BD-D247-4909-84E2-BB8D39089F0D@arm.com>
References: <20200918171116.29005-1-julien@xen.org>
In-Reply-To: <20200918171116.29005-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 155bafd8-5111-49d3-fe65-08d85e295d3f
x-ms-traffictypediagnostic: DBBPR08MB4823:|HE1PR0802MB2137:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB213740DF02DDC6AB87DDC71B9D3A0@HE1PR0802MB2137.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aYZDygXlylVzeR3uV52dwu6P5VGQnToY+/3UznNoXfmjEEd79MyqHyKHTDVo5E+T3zNBPHrkdVolbawUJLUKW1Lij51Hhw2A4MGyu/+6syzyQCNBtpuqFC5G53c8SdYzCXkP4xjC27lvuROZaNMsBCAWY5aPkH3omkiG2Dq6CUNTzhhdpHu80/pikvjg0kJvpSXABNaRU+jGTqGojGKxOLMfYnU2SY9AI5+OlC1Tgkn13C5x6te8A9PBTfo+f/8VpkmUoV1cB82J61CpYkWvFdProY5iPZJiubxRzOkSQREhJoTpe+O1isJWSa7YwgnIsxh95P+2zgJtCjGyEuTczA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(66476007)(26005)(66446008)(66556008)(64756008)(54906003)(83380400001)(8936002)(86362001)(6916009)(76116006)(8676002)(91956017)(53546011)(5660300002)(6512007)(4326008)(66946007)(2906002)(478600001)(71200400001)(36756003)(6506007)(186003)(316002)(2616005)(15650500001)(6486002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7oQFQe4FKaiuJH3Lmt/MZ51HaLIsT/GFSwvaEwo7FZ04S3QB77hX+BaGq7YphRqftXpo4CkrnPNFsGo7VGlI+q6xHZ/CF/WzndiTIh3ieLoar8d4gO08kWGGC1Ah2d1guhLL+6UB+yLTka+n5m6NcnDRCptvz6bUxrFCgUO9ojtQ3ktWqWzWXTleqDK+2D7GQHcm1QCN3gZi1N7LEvYDC4DM2q8teTdboCFv665t+N38HLfsBo5mrr9O7Eg6fUVNOmCjZLUccpYaia+Pja7uZqNbW9GqkHgKjK3y0NYVZn6WWTlDpiZsbPykSStDy39l+4N3QCVZ5xZcGMGXHlDR1pAi41iAuq/llxsNzUxbmvwUb6qph4THwLqeH6HFKoa9TDH0t84QW9u6y3joXlfvS7UI+r9pjMmKsi60G2KTMiJgg7+zKCQHe0735d4hFfFOuEa2Sr8sxswg5ppBx5e6xve3pm9uZFhDS5FAkwaqfVoL6uJk2rqWWabdGfn1e4CeBsTnKlBNhg/gVwl2lSU1Qiif7qIz4+LjqFOJwgh2iniI8cft+QgH1LPjJq4zwQTR2nyt2nO4T9lss1WrPUZauy9iAl+aEBJZZd93niaZt9dp6SKZCKkKCb6SXxvB7WXcHwZer9xuE3mHP+aHgTLVPg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9477A573E390474A91E8AFB1D47A99C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4823
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7768c1e1-de29-44a4-a448-08d85e29466f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYe4ysS/TWLAbdVpnbXiPcfXwlLTu9eyynsl6TDOGV+bOGCfDUcYG27eZBswdyaXAa4Wh6enZz0mLfqMZ3bVkGuiJaPpcyjkTytNnIDQI9u4b8Cr6dN988EvDbg1xkgWGAX4Exn58+e4HQEJPlJg+TxN+vfExeRa1dTSa44o9yEcqDmsobz8YphAKk+xhtKDs1SW9pMeIC7hzGjbzAn8VCgJniMQTGKF5NsQygMZRtxCbncEWGhzaW3JieRwBA7gQ+KyjJv+R/ukzSAD8QoTLT1fs/klKY4k7IiHEbXXIB3ziEPvqukUXLnPFc3sg6i5lJXhIYqtAmCWifQB0lZQvfo9ZiZS8/nFDBSYWxq63zSQvh0MvWXURyfVlA+7ahM1O9DsjRSQzx6Z+WeodBd6kA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(70586007)(70206006)(82310400003)(36756003)(33656002)(2616005)(83380400001)(336012)(5660300002)(316002)(86362001)(6512007)(26005)(82740400003)(356005)(2906002)(478600001)(107886003)(54906003)(81166007)(53546011)(8936002)(47076004)(6506007)(6862004)(186003)(8676002)(4326008)(6486002)(15650500001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 12:25:02.4010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 155bafd8-5111-49d3-fe65-08d85e295d3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2137
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



> On 18 Sep 2020, at 18:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, Xen will stop processing the Device Tree if a memory
> bank is empty (size =3D=3D 0).
>=20
> Unfortunately, some of the Device Tree (such as on Colibri imx8qxp)
> may contain such a bank. This means Xen will not be able to boot
> properly.
>=20
> Relax the check to just ignore the banks. FWIW this also seems to be the
> behavior adopted by Linux.
>=20
> Reported-by: Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/arch/arm/bootfdt.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 08fb59f4e7a9..dcff512648a0 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -163,8 +163,9 @@ static int __init process_memory_node(const void *fdt=
, int node,
>     for ( i =3D 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
>     {
>         device_tree_get_reg(&cell, address_cells, size_cells, &start, &si=
ze);
> +        /* Some DT may describe empty bank, ignore them */
>         if ( !size )
> -            return -EINVAL;
> +            continue;
>         mem->bank[mem->nr_banks].start =3D start;
>         mem->bank[mem->nr_banks].size =3D size;
>         mem->nr_banks++;
> --=20
> 2.17.1
>=20
>=20


