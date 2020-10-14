Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BEC28DF87
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6581.17509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeXQ-0006iC-Fw; Wed, 14 Oct 2020 11:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6581.17509; Wed, 14 Oct 2020 11:01:44 +0000
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
	id 1kSeXQ-0006hn-Ci; Wed, 14 Oct 2020 11:01:44 +0000
Received: by outflank-mailman (input) for mailman id 6581;
 Wed, 14 Oct 2020 11:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSeXP-0006hh-7U
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:01:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64d4c300-d1c0-44d1-8681-6a6ccfdd0c6e;
 Wed, 14 Oct 2020 11:01:42 +0000 (UTC)
Received: from AM5PR0701CA0065.eurprd07.prod.outlook.com (2603:10a6:203:2::27)
 by AM4PR0802MB2370.eurprd08.prod.outlook.com (2603:10a6:200:63::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:01:40 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::97) by AM5PR0701CA0065.outlook.office365.com
 (2603:10a6:203:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.12 via Frontend
 Transport; Wed, 14 Oct 2020 11:01:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:01:39 +0000
Received: ("Tessian outbound c579d876a324:v64");
 Wed, 14 Oct 2020 11:01:39 +0000
Received: from bf9827b9c574.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6D03DD1-0FCD-4C73-8CCC-099460D32D02.1; 
 Wed, 14 Oct 2020 11:01:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf9827b9c574.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 11:01:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 11:01:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 11:01:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSeXP-0006hh-7U
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:01:43 +0000
X-Inumbo-ID: 64d4c300-d1c0-44d1-8681-6a6ccfdd0c6e
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.49])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 64d4c300-d1c0-44d1-8681-6a6ccfdd0c6e;
	Wed, 14 Oct 2020 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v81OGU/oYynWnpyl4yVM4oQHFkexGrHYGKU0kzcxm3Q=;
 b=s/RdB0OOjBgV4DWScI1t5nAHwNyhjIvUbKggRf3a2bWz/lbcMsmcZXo/v7lfAHyGunBfgoApVNSFE8Tc2qlwRwEfe1lpwMUgS/fltbxKSUG5QrVPLcqiwwwwZIT2gyoLK4kMFRjU+Z8tfQSPNZsTyN/nZHxFUxg4W5zmLDW/83o=
Received: from AM5PR0701CA0065.eurprd07.prod.outlook.com (2603:10a6:203:2::27)
 by AM4PR0802MB2370.eurprd08.prod.outlook.com (2603:10a6:200:63::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:01:40 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::97) by AM5PR0701CA0065.outlook.office365.com
 (2603:10a6:203:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.12 via Frontend
 Transport; Wed, 14 Oct 2020 11:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:01:39 +0000
Received: ("Tessian outbound c579d876a324:v64"); Wed, 14 Oct 2020 11:01:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec7c5979650c06fc
X-CR-MTA-TID: 64aa7808
Received: from bf9827b9c574.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6D03DD1-0FCD-4C73-8CCC-099460D32D02.1;
	Wed, 14 Oct 2020 11:01:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf9827b9c574.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 11:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njqmeoFZnQxHI2ayxPSKtrWUYRQ6iy0AA1MKxSPd961H9RtFKry5k1H5DmqJOOKCNcK0m58pMD3iUGVOuzACTe6PoO2JiEebP0kEMppZA8ov0Jb9cPU2J1+5/9EWbVGrw+FUrWGoIlwpEVXH5WnV2M38ESzmvicGnzjmTMkoM7AAWhEjwJNRLq8HfjnOC/RAAFdcojJbaTCVyw7XxBo+PSdvi4+MeoB4XlKgg3Fa74DIRJEmuWj5BhbWKCHgGtoIyMfJKdAMeA1+LPaoIqm/PCAHUh9amICP663hqvNeapkKYgHIxgTFvSxG9tn0L2Ycd84eTP1oEU1LfFAGXFoyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v81OGU/oYynWnpyl4yVM4oQHFkexGrHYGKU0kzcxm3Q=;
 b=ZIK3Zp9faqs3fRO9c7FtEEfAYyqPU1vQTHE1/NCR/8IOSv2Y04REtqj2WzIjoKRcg3gHsP2tDURcOJJoY3c78KSXg8LwgF0Kf02YDwELTx6B7KijLzLzl5UMa2pxqadhaw2imy0riOvb2NiMEAX+DieR+1DsgBmMIIWQiPTj4sPEHtW6J7LiSrojXO9WmgVUkkkl8S955dago7scEIRSp28ruilQ92sjwaK5FyR3h3s0SRccob0N/uj7j5C8nqFZoeRWpqDkOLvh4DxvfS66ba80x1WtufPWj04Wgk6lHvsqh85+gwXo5N9p6yiuMCr78AD0FoUu4PeBbLlqm8Ogtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v81OGU/oYynWnpyl4yVM4oQHFkexGrHYGKU0kzcxm3Q=;
 b=s/RdB0OOjBgV4DWScI1t5nAHwNyhjIvUbKggRf3a2bWz/lbcMsmcZXo/v7lfAHyGunBfgoApVNSFE8Tc2qlwRwEfe1lpwMUgS/fltbxKSUG5QrVPLcqiwwwwZIT2gyoLK4kMFRjU+Z8tfQSPNZsTyN/nZHxFUxg4W5zmLDW/83o=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 11:01:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 11:01:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
Thread-Topic: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
Thread-Index: AQHWohGs6LiftGVtsEyTPb4Ao6iKoqmW7pwA
Date: Wed, 14 Oct 2020 11:01:33 +0000
Message-ID: <0A013228-01C5-4EC4-A464-85F7C8CB531F@arm.com>
References: <20201014100541.11687-1-michal.orzel@arm.com>
In-Reply-To: <20201014100541.11687-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21d8ba9b-3541-4c38-2f07-08d8703086e6
x-ms-traffictypediagnostic: DBAPR08MB5816:|AM4PR0802MB2370:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB23700BBEF1AF537FE3F669899D050@AM4PR0802MB2370.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Dal/kIrpPaJE254KuHbOXn64prVXdmrLih1OaU9lcXZAItre+l9D7vSA9HXz1SxkfvbsiihLnVc3Qkr/utaY4ggEafJshs26E4PTxzYzA7Y22sHL1MWtniGDLOLJdKk+fnqvOu7embOcAncc1VVesMImlW3Bgv9WngAwaLmQhjWyMVp7WwnBl28l47pDTfc6W9S2fOzpYv409pVIk9rMkqh20s4R4+8p7tWptK0aXYyR1Z1vW1/wK3ll8nDPQDG72uCFfHKKLK1rmruHmfjmHmh2JeEVszhlI0/u9BOe8/Lo74KS74IVbV8CM/92V+rb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(33656002)(6506007)(2616005)(6486002)(83380400001)(6512007)(53546011)(36756003)(66946007)(76116006)(66476007)(91956017)(66446008)(6636002)(71200400001)(86362001)(5660300002)(64756008)(37006003)(54906003)(316002)(66556008)(478600001)(4326008)(6862004)(26005)(186003)(8676002)(2906002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 UW5xqdASljewRHuPo7/A+lILIK4nLd5oyRVYAl8UihHHHB2YK0hJVmAlKQj5nM89W6YMhrnaMVBckgMmTDMunNAB0agMGRa5efGbs/thOKInCxqSqX1arujkAvfne0YH7DsV+3F35H70ISZtwEHkhCXgPSdmOuAzNOwz521Ym12we9AjKoJqzonlQ4zpws1pAWN+bxt10u0/gWE+CCZ44vrAtI+zvXKNGnxFf7tvHeU0VGUC/I1vVn6SG03GCnGk5BdNsTpnhsVAfUY7dUyVwnkdnxSX/V+foKtfNya/7xSdt8ue5JFTb/ltPO0f87xkrutYo/wGCsT+siQYEoEVi+nY7l+MMhsbvuqzJIdjuBRVATb9F+4kirglo6tasqFiqcd9zh3ttQWsWcZKkbs2aKy+cSw1MrmfCozrzAfYW8SFCwyKRZKa4JRHga+DBPInfHnZo17VIqvbiO3vqAv8aRi3iWvTFWNiY7eXZlFjChwXy5z+yz7ep2mfFH3e2GUqRXLVXbAYQQmV5jrEDJmZUiK6vl9y/U46dd2rJrJhgbJaPSl62jnm6MCwqoDwW6hzufNndRV22jHtxQs+9CkDlQJyAWRsF/34gjRg47VMXxXyq97WciLtX7xISbrFsyx1gScQRvRE6n3JOcerGTlrXQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D7C09EE9129794FA9FEB4C9D02AC730@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df8f4d95-89d7-41cf-2ad1-08d87030830b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QxOMYsAKG8IU6lIK/4wHo5TTg28jKc4HQAw5j1f/MJf0G3s2A8W6/FBYqrtGRpH+4sBQlzFogtFP7AqtBxTUE2Tk0BiR8Egs+jrYWUoCV84uy/+VpwwKSiT71cg5L6hG+oFKWMCEHKknYVhZ8IvlDbMZBahQZoYZlbxahMKP0EtOjXpjT4dcCyM/eXBV1uXP6IQ5N1GMEW+n02yGmEF5z34u2sz4w7B+nTZeEXlvXok9EYYqquZj9UtYfjHJD6XSedyBi8WSremucPm31lqj2yBeyrh/pgNyAo0vg4Ih133V9fG9aNAmNE+wm3+jzoyWkirxSAHG7E7TZd7TIqtMS4O6dPiIeApu0BbrLjknVLX8BYM3UyTuqjkq7YClobYCJIi2GcDRSu0hYvGcS04b1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(82310400003)(83380400001)(4326008)(186003)(8936002)(86362001)(356005)(81166007)(6862004)(107886003)(2906002)(6486002)(2616005)(336012)(47076004)(8676002)(36756003)(82740400003)(70206006)(6512007)(33656002)(70586007)(54906003)(6636002)(37006003)(5660300002)(478600001)(316002)(26005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 11:01:39.5779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d8ba9b-3541-4c38-2f07-08d8703086e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2370

Hi,

> On 14 Oct 2020, at 11:05, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Workaround for Cortex-A57 erratum #852523 is already
> in Xen but Cortex-A72 erratum #853709 is not although
> it applies to the same issue.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Change in commit message suggested by Julien is quite right and
should be added.

Bertrand

> ---
> docs/misc/arm/silicon-errata.txt | 1 +
> xen/arch/arm/domain.c            | 6 ++++--
> 2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index e15d0923e9..1f18a9df58 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -50,6 +50,7 @@ stable hypervisors.
> | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_8342=
20    |
> | ARM            | Cortex-A57      | #1319537        | N/A               =
      |
> | ARM            | Cortex-A72      | #1319367        | N/A               =
      |
> +| ARM            | Cortex-A72      | #853709         | N/A              =
       |
> | ARM            | Cortex-A76      | #1165522        | N/A               =
      |
> | ARM            | Neoverse-N1     | #1165522        | N/A
> | ARM            | MMU-500         | #842869         | N/A               =
      |
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3b37f899b9..18cafcdda7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -216,7 +216,8 @@ static void ctxt_switch_to(struct vcpu *n)
>     WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
>=20
>     /*
> -     * Erratum #852523: DACR32_EL2 must be restored before one of the
> +     * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
> +     * DACR32_EL2 must be restored before one of the
>      * following sysregs: SCTLR_EL1, TCR_EL1, TTBR0_EL1, TTBR1_EL1 or
>      * CONTEXTIDR_EL1.
>      */
> @@ -245,7 +246,8 @@ static void ctxt_switch_to(struct vcpu *n)
>=20
>     /*
>      * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
> -     * #852523. I.e DACR32_EL2 is not correctly synchronized.
> +     * #852523 (Cortex-A57) or #853709 (Cortex-A72).
> +     * I.e DACR32_EL2 is not correctly synchronized.
>      */
>     WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
>     WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
> --=20
> 2.28.0
>=20


