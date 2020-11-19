Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571292B9A75
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 19:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31276.61634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfoU5-0007xP-T5; Thu, 19 Nov 2020 18:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31276.61634; Thu, 19 Nov 2020 18:16:41 +0000
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
	id 1kfoU5-0007x0-Pi; Thu, 19 Nov 2020 18:16:41 +0000
Received: by outflank-mailman (input) for mailman id 31276;
 Thu, 19 Nov 2020 18:16:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfoU4-0007wu-4u
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8011cd69-79c4-45da-8494-8a696e7cb93a;
 Thu, 19 Nov 2020 18:16:38 +0000 (UTC)
Received: from DB6PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::24)
 by DBAPR08MB5749.eurprd08.prod.outlook.com (2603:10a6:10:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 18:16:37 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::4f) by DB6PR1001CA0038.outlook.office365.com
 (2603:10a6:4:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:37 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Thu, 19 Nov 2020 18:16:37 +0000
Received: from 6896bc3e2f68.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5656127B-191C-42C8-8536-85DCDA36A230.1; 
 Thu, 19 Nov 2020 18:16:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6896bc3e2f68.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 18:16:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfoU4-0007wu-4u
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:40 +0000
X-Inumbo-ID: 8011cd69-79c4-45da-8494-8a696e7cb93a
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.82])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8011cd69-79c4-45da-8494-8a696e7cb93a;
	Thu, 19 Nov 2020 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADhZtYNBEr3niClwhOMsFJB7OZtTBz55UcV+VbqtfKA=;
 b=ZTUa+qxP3iE0g4Tjv9q5Pj12VyK4aOXYVLMh2PJxoImS9Dazao9Z2dEgO96WG9s5AFnZqR2RaTgm5S6iIuXwp2FtBPPKos9C53hxsPT8HfHYBceXwwaUcHJ7UYB6VHpopwLk4+iVNEmWJkagJ9V+BsefOAZG5CNA3g0yg5WZX9Y=
Received: from DB6PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::24)
 by DBAPR08MB5749.eurprd08.prod.outlook.com (2603:10a6:10:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 18:16:37 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::4f) by DB6PR1001CA0038.outlook.office365.com
 (2603:10a6:4:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:37 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Thu, 19 Nov 2020 18:16:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbf8cdda0acf4d7f
X-CR-MTA-TID: 64aa7808
Received: from 6896bc3e2f68.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5656127B-191C-42C8-8536-85DCDA36A230.1;
	Thu, 19 Nov 2020 18:16:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6896bc3e2f68.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 18:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ4l+MTdbD0hSR7bv7PIwucflJVmM5hcw5NQAfb09qIb/ZP1JHCBV8uSY4y3zf0Aef+s/1jrOidT6ybzbBw4upCxz6SvpJPvwUxjktRneQawUBAJj8yhzZruH3h9JcodCB0QCDXduobu8b6AEIDjxAu+ZbAg+KWd+H4RNhZS/YubdA7LQ5NpKQOAGlCH8kR0ievgbJKsthJqeHRwJR0u4UXeH/DQoYeUUbYULO2rAr+OpJnk2ZZk8+qnD+1O6/krPBCDd9M/KgHHFVzVZwWPxipSat33gdhqB2n6HB5EXZcrhPTfnNexGY/EPlTT7iBmcDkESDISKztves5RuBHDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADhZtYNBEr3niClwhOMsFJB7OZtTBz55UcV+VbqtfKA=;
 b=gi1KcQemqBn4pTUcD7Ty45yoAbIat23iENwoOZ6o8dRQ1cgzDZLq/kC+moZcv7pHOYwk6APjtxSaZeT+Wy10zLn6tKIcB8fPN+mjloPkVAjQDMJp6sODzg9o+DVUwM/MEV9fDrYcSAboxlAkL2AOr0+88Gt8uBoSSMQnvZgc0+a7vrzG6V6jjz8jdWIwPY5sAby3NISKCkPmI0mb9Zl+QM8Sf/aIb0mOtO55EDw+X+DT64JwkiGtgCg2Kx5Fi35yvbYEWNXeccBsFcgWwFXMOJ/hbwMZpDSuNeipsizcnOXkW4qag+n2X2n0/6/BTm/xgr2kBBx1VX30j1QbACAISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADhZtYNBEr3niClwhOMsFJB7OZtTBz55UcV+VbqtfKA=;
 b=ZTUa+qxP3iE0g4Tjv9q5Pj12VyK4aOXYVLMh2PJxoImS9Dazao9Z2dEgO96WG9s5AFnZqR2RaTgm5S6iIuXwp2FtBPPKos9C53hxsPT8HfHYBceXwwaUcHJ7UYB6VHpopwLk4+iVNEmWJkagJ9V+BsefOAZG5CNA3g0yg5WZX9Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:26 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, Andre Przywara <Andre.Przywara@arm.com>, Rahul
 Singh <Rahul.Singh@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 1/3] xen/arm: gic: acpi: Guard helpers to build the
 MADT with CONFIG_ACPI
Thread-Topic: [PATCH v4 1/3] xen/arm: gic: acpi: Guard helpers to build the
 MADT with CONFIG_ACPI
Thread-Index: AQHWvpal2Ywl5gacb02BE3lv2K8FPqnPwwIA
Date: Thu, 19 Nov 2020 18:16:26 +0000
Message-ID: <4F6A86BB-EA0B-4F7A-A1D9-5C5C469FB220@arm.com>
References: <20201119170829.9923-1-julien@xen.org>
 <20201119170829.9923-2-julien@xen.org>
In-Reply-To: <20201119170829.9923-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ba79cc7-2f75-4af7-1c55-08d88cb7411e
x-ms-traffictypediagnostic: DBBPR08MB4538:|DBAPR08MB5749:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5749CC8CAEF81800AC288CCC9DE00@DBAPR08MB5749.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oY+Xtc7YDhNWVpzmuDaQ4UhhJeUN9IW8gE4gJ6gwafIbqW91UYBLBkLya4fogo1zMJw0fdi/g37gH0bNU+eg+DJcHfvHnvHlFiAGcAe5Y8wjvBF/d69jpX+1C1NEq97jQlNUXyID+zlyk+vYBdlat0bwauEmCmYyJmUTlzqe6Xp4oZZnl5CcCbGxdrzNeIvWlfVnAif5BKlm1lsVkDJ+wLoR0it6+sGsATTvg3BYajoEcAStXBhQVXaO/z4QkO3+9NGL1vqVhYYZoDg29Rx2lbjcXfsrtpX5EYquigf+wtZURuosCFqUY8HATs6GmiKQIF6jckdIasJkx/qxzu126g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(2906002)(66446008)(66556008)(66476007)(6916009)(66946007)(8676002)(8936002)(71200400001)(6486002)(86362001)(76116006)(91956017)(36756003)(5660300002)(6512007)(33656002)(4326008)(54906003)(53546011)(6506007)(26005)(64756008)(186003)(2616005)(478600001)(83380400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Qr0EuBlxzxav8XkpRhSvBTcET/fwyyP5iSdmHUj3LbWFvCVxlDieDgA9EYel70OC8Fu32puKYEVsEjbstWMo/Z5ezjYRYcCj+rnI5ndfJM7WbNQZWYszOGQoD/fivZNsfNOsUPQwMeH6UoYlCZZDOMebnYlVI+NSYx7CRhwqG7uT0/HGQ7HZv/jgJ45eosZ9eAW1W7NBUV3uE4brWz2N3/uoRBqXJmgyONIvQN75bvnds9dfBh8EGzesU3NCQYdQQKwyFSFzB9VO/0rPAWmQq/C51trPahSrQz5Y6FbmXOXkGziRPJCcgd1dxkyHcJifPHIrjzX8N9QlDWFeEbVlARuUHWiWLQj8UJVrXb9c6tzlUV/uW4MpaOF2XenYnKYorO4Qpr+c3EAt18uGGMrJeqw5uoGdzbCXBE3wtlz1icEXdNHY+qo7G3HFQjrX9MUIKf96KNW5M1yL4AsncCI+zHK1g3VP9Uosf+gGv75kuPaK7oO8dCZllSoOUa4dSPDDrgVAe0aeZoln0V6+W6aQP7O1/S7/9CB1YZkxtOkpDRdL+V2ug768t9fja3FY3j+Xi3oFSTKeKnJFEoYjwNybk41q12eAJgaPYLuYEBLzEBAAgnvy2a9xoYrYZERrld2RmRbOO4m8qxxHJRWOg5kgPg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <96D93D78A9FB5A4C978131C6BC21360F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4538
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5846e27-3bb3-42ca-d86f-08d88cb73aed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TEN93U/yPphGPAJqoSPwE/1lmU7G68Xyli7rD9jBa1grf4gmad29cOAsdL3Y4bkaxp5arUJeaxaDzzGvPqi+NkQRh+7vPc35NJRNppF3LwpomJ57VMJ+Tn6roUMOLQRVqOxeZi/DdeFPg5oi8M+HeTuJoJDDU9pAiudRPuiSQ9H6+jZHPZtffDO/DCruySPwcYY69shyrtE++/W7U5nt5fITrj78xOvlVO2M/1Yg555HNwmM5iNzNZHRWVzgiwFpLtzp1GtWW+VeGbW0ol5tsMZA1w10do1YFD7bhmnAqF+ozlYqmLLg0yzdjs36UmGAlroSStf3k4X/AjyuEqK3J6+my7zE/6x3JHkrsH/y4g/apA3hpE3vcHISYBKzsAhp1Nifxqm/X2MOaQOMmgXrBA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(46966005)(82740400003)(47076004)(70206006)(81166007)(356005)(82310400003)(6512007)(2616005)(316002)(2906002)(54906003)(336012)(107886003)(86362001)(6506007)(478600001)(8936002)(186003)(6486002)(70586007)(8676002)(33656002)(4326008)(36756003)(26005)(6862004)(83380400001)(5660300002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:16:37.2251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba79cc7-2f75-4af7-1c55-08d88cb7411e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5749

Hi Julien,

> On 19 Nov 2020, at 17:08, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> gic_make_hwdom_madt() and gic_get_hwdom_madt_size() are ACPI specific.
>=20
> While they build fine today, this will change in a follow-up patch.
> Rather than trying to fix the build on ACPI, it is best to avoid
> compiling the helpers and the associated callbacks when CONFIG_ACPI=3Dn.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I also tested the serie on FVP without ACPI and Xen is still booting proper=
ly Dom0.

Cheers
Bertrand

>=20
> ---
>    Changes in v4:
>        - Patch added
> ---
> xen/arch/arm/gic-v2.c     |  8 +++-----
> xen/arch/arm/gic-v3.c     | 11 ++---------
> xen/arch/arm/gic.c        |  2 ++
> xen/include/asm-arm/gic.h | 10 ++++++++--
> 4 files changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 0f747538dbcd..581ea5ba6b2c 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1114,12 +1114,12 @@ static int gicv2_iomem_deny_access(const struct d=
omain *d)
>     return iomem_deny_access(d, mfn, mfn + nr);
> }
>=20
> +#ifdef CONFIG_ACPI
> static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain =
*d)
> {
>     return 0;
> }
>=20
> -#ifdef CONFIG_ACPI
> static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
> {
>     struct acpi_subtable_header *header;
> @@ -1248,10 +1248,6 @@ static void __init gicv2_acpi_init(void)
> }
> #else
> static void __init gicv2_acpi_init(void) { }
> -static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
> -{
> -    return 0;
> -}
> #endif
>=20
> static int __init gicv2_init(void)
> @@ -1357,8 +1353,10 @@ const static struct gic_hw_operations gicv2_ops =
=3D {
>     .read_apr            =3D gicv2_read_apr,
>     .read_pending_state  =3D gicv2_read_pending_state,
>     .make_hwdom_dt_node  =3D gicv2_make_hwdom_dt_node,
> +#ifdef CONFIG_ACPI
>     .make_hwdom_madt     =3D gicv2_make_hwdom_madt,
>     .get_hwdom_extra_madt_size =3D gicv2_get_hwdom_extra_madt_size,
> +#endif
>     .map_hwdom_extra_mappings =3D gicv2_map_hwdown_extra_mappings,
>     .iomem_deny_access   =3D gicv2_iomem_deny_access,
>     .do_LPI              =3D gicv2_do_LPI,
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 0f6cbf6224e9..2a344393a0e4 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1735,15 +1735,6 @@ static void __init gicv3_acpi_init(void)
> }
> #else
> static void __init gicv3_acpi_init(void) { }
> -static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
> -{
> -    return 0;
> -}
> -
> -static unsigned long gicv3_get_hwdom_extra_madt_size(const struct domain=
 *d)
> -{
> -    return 0;
> -}
> #endif
>=20
> static bool gic_dist_supports_lpis(void)
> @@ -1858,8 +1849,10 @@ static const struct gic_hw_operations gicv3_ops =
=3D {
>     .read_pending_state  =3D gicv3_read_pending_state,
>     .secondary_init      =3D gicv3_secondary_cpu_init,
>     .make_hwdom_dt_node  =3D gicv3_make_hwdom_dt_node,
> +#ifdef CONFIG_ACPI
>     .make_hwdom_madt     =3D gicv3_make_hwdom_madt,
>     .get_hwdom_extra_madt_size =3D gicv3_get_hwdom_extra_madt_size,
> +#endif
>     .iomem_deny_access   =3D gicv3_iomem_deny_access,
>     .do_LPI              =3D gicv3_do_LPI,
> };
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index d623c57cb9fa..fe60619e99cf 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -443,6 +443,7 @@ int gic_make_hwdom_dt_node(const struct domain *d,
>     return gic_hw_ops->make_hwdom_dt_node(d, gic, fdt);
> }
>=20
> +#ifdef CONFIG_ACPI
> int gic_make_hwdom_madt(const struct domain *d, u32 offset)
> {
>     return gic_hw_ops->make_hwdom_madt(d, offset);
> @@ -459,6 +460,7 @@ unsigned long gic_get_hwdom_madt_size(const struct do=
main *d)
>=20
>     return madt_size;
> }
> +#endif
>=20
> int gic_iomem_deny_access(const struct domain *d)
> {
> diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
> index ba870523bb2a..ad0f7452d005 100644
> --- a/xen/include/asm-arm/gic.h
> +++ b/xen/include/asm-arm/gic.h
> @@ -378,12 +378,14 @@ struct gic_hw_operations {
>     /* Create GIC node for the hardware domain */
>     int (*make_hwdom_dt_node)(const struct domain *d,
>                               const struct dt_device_node *gic, void *fdt=
);
> +#ifdef CONFIG_ACPI
>     /* Create MADT table for the hardware domain */
>     int (*make_hwdom_madt)(const struct domain *d, u32 offset);
> -    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware doma=
in. */
> -    int (*map_hwdom_extra_mappings)(struct domain *d);
>     /* Query the size of hardware domain madt table */
>     unsigned long (*get_hwdom_extra_madt_size)(const struct domain *d);
> +#endif
> +    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware doma=
in. */
> +    int (*map_hwdom_extra_mappings)(struct domain *d);
>     /* Deny access to GIC regions */
>     int (*iomem_deny_access)(const struct domain *d);
>     /* Handle LPIs, which require special handling */
> @@ -435,8 +437,12 @@ void register_gic_ops(const struct gic_hw_operations=
 *ops);
> int gic_make_hwdom_dt_node(const struct domain *d,
>                            const struct dt_device_node *gic,
>                            void *fdt);
> +
> +#ifdef CONFIG_ACPI
> int gic_make_hwdom_madt(const struct domain *d, u32 offset);
> unsigned long gic_get_hwdom_madt_size(const struct domain *d);
> +#endif
> +
> int gic_map_hwdom_extra_mappings(struct domain *d);
> int gic_iomem_deny_access(const struct domain *d);
>=20
> --=20
> 2.17.1
>=20


