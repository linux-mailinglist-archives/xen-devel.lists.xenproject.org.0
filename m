Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADD2C3F7C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:02:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37643.70105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtV0-0006U3-1C; Wed, 25 Nov 2020 12:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37643.70105; Wed, 25 Nov 2020 12:02:13 +0000
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
	id 1khtUz-0006Td-Tq; Wed, 25 Nov 2020 12:02:13 +0000
Received: by outflank-mailman (input) for mailman id 37643;
 Wed, 25 Nov 2020 12:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtXg=E7=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khtUx-0006TW-PA
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:02:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d64cbb68-fdc3-4358-a0d4-4ec5dd25b7a9;
 Wed, 25 Nov 2020 12:02:09 +0000 (UTC)
Received: from AM6P193CA0125.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::30)
 by DBBPR08MB4663.eurprd08.prod.outlook.com (2603:10a6:10:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 12:02:07 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::93) by AM6P193CA0125.outlook.office365.com
 (2603:10a6:209:85::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 12:02:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 12:02:07 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71");
 Wed, 25 Nov 2020 12:02:07 +0000
Received: from 1503ee4a42a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FA5C22A-3FBC-421B-BCA1-3C8B2547DF21.1; 
 Wed, 25 Nov 2020 12:02:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1503ee4a42a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Nov 2020 12:02:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5084.eurprd08.prod.outlook.com (2603:10a6:10:38::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 12:02:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 12:02:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NtXg=E7=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khtUx-0006TW-PA
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:02:11 +0000
X-Inumbo-ID: d64cbb68-fdc3-4358-a0d4-4ec5dd25b7a9
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [40.107.15.52])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d64cbb68-fdc3-4358-a0d4-4ec5dd25b7a9;
	Wed, 25 Nov 2020 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66bNHCUSp1na50mlvQ0gb3LddztgjRpB4XfrDIKnsr4=;
 b=4/VMHplmL1tAZVrR9Yg0SxnqQJ7O7h2Uk8we+bExUJQ6jNfiZQ0ds6zlD+TU65TBsTQR2ugmKLgMMCRCwzKFR/sikFjt/BzbOfp2NMz/2vKjCAPJfw8zVuOKEAIN8TpIY94ZjPM7JIonS1op6B1gjTVu8Qxr6TfSddsZjig0BaY=
Received: from AM6P193CA0125.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::30)
 by DBBPR08MB4663.eurprd08.prod.outlook.com (2603:10a6:10:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 12:02:07 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::93) by AM6P193CA0125.outlook.office365.com
 (2603:10a6:209:85::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 12:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 12:02:07 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Wed, 25 Nov 2020 12:02:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31816d201b33c789
X-CR-MTA-TID: 64aa7808
Received: from 1503ee4a42a5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8FA5C22A-3FBC-421B-BCA1-3C8B2547DF21.1;
	Wed, 25 Nov 2020 12:02:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1503ee4a42a5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 12:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqr1ppsQANHInChesDhTTcOELIWE3wuqhVG0dhycOCmEelT85w/LGEOLL1Hw3VKUQiyV+3x0PnEIabVuhoVlu+O/EslgZP6ymicYflXCPvq6+ZlTPk95hxuG7EbeZ61HjM5Zy64t2GF7z54ic2zjfskxMlHloafT3mzf2frYTWPuGdlKMDCwzJhVyk/+FP+XYFQdh/h9PT/k9xqXirqpIiZe0axc3uOv/aIMxmTWHMy0pXkJczkeCQs3Jjlg11oveg1+ZsRvPTItJSaZqa0m8Maxi1aR9uDXulgaTOJjaYtEbkF+2rnBJX8HgLZH7GMrWOK/bMzq6n9r/IZuoPelNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66bNHCUSp1na50mlvQ0gb3LddztgjRpB4XfrDIKnsr4=;
 b=GTk8yf/tCJZcbdvuD+0ehViBrInx8cL7GRoYUDxV02rxGy0Fb/iEGbdscTK4ULYsfHq5RK/D35G8WDwJJwXBCoIKQkjbEowDSIYu6JP8ixcu7aqmLY7BOlglhUXI49gFNt6czG6YlJy/+9nHrwCf8i45aL6w+zv/MqnJY2EYwLbImVywEcfU/GevDtj2iorJBAeX4JLFCVHWVaZpZFzaxCdUWE9Hq2eTnhGlOEJ494psHbwg8Iuc67IPmYLtp0gXjQ8JCCVLn5Tx8c1laV3p9C1ErVyghaCGlyUamx/17N5m2VW+ULcEo4Yqj1cWfACqvOn9BxGjuiC5qQEVH0N52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66bNHCUSp1na50mlvQ0gb3LddztgjRpB4XfrDIKnsr4=;
 b=4/VMHplmL1tAZVrR9Yg0SxnqQJ7O7h2Uk8we+bExUJQ6jNfiZQ0ds6zlD+TU65TBsTQR2ugmKLgMMCRCwzKFR/sikFjt/BzbOfp2NMz/2vKjCAPJfw8zVuOKEAIN8TpIY94ZjPM7JIonS1op6B1gjTVu8Qxr6TfSddsZjig0BaY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5084.eurprd08.prod.outlook.com (2603:10a6:10:38::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 12:02:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 12:02:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
Thread-Index: AQHWwlLLNjr+48XzOEqJDwYwnQ/h+6nXSiYAgABEOYCAASjCgIAACceA
Date: Wed, 25 Nov 2020 12:02:00 +0000
Message-ID: <4D139BCF-873B-4AFA-B187-894520EF6718@arm.com>
References:
 <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com>
 <E5A460E5-7D10-4314-98B4-0D90CD173940@arm.com>
 <alpine.DEB.2.21.2011240944400.7979@sstabellini-ThinkPad-T480s>
 <7b05cb84-a9c3-10b2-5713-42259695e9b1@xen.org>
In-Reply-To: <7b05cb84-a9c3-10b2-5713-42259695e9b1@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: 2a6d3034-da2c-4cec-db23-08d89139ee8d
x-ms-traffictypediagnostic: DB8PR08MB5084:|DBBPR08MB4663:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4663ABC00051D481629323469DFA0@DBBPR08MB4663.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YAah3qDfxgCFRn5O6rSptTU4aTCGZ5+APB1oNIMa/oTSIo41amBTFlgQY1PCqRqAVRtBAK4C2Ab9EAeb/iJAoVw27lF4pdVM7UIgetJAVs6uUn0plYfeDWBuEGjFWAguhTs+OAAuDhgHEBxfMiabxfxJhsAJFA/Z5KHfof5WcigkhCJHggdDw6KCM8z6nFgnCOGs06zcEUJZUhgeqlEnngAvv/0rZDbL9kHI3z0KicSBnuZjCTf9rinPR2QhrAsVuKanl8CuGOQylu2viDTPHFt0KGYwIlTrM4BpTnET3OYwG0d7qpNWrHVEXY342XMtg/Oo9bFpqBZak4CPXdn4iA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(66446008)(64756008)(66556008)(2616005)(4326008)(6486002)(66946007)(36756003)(186003)(54906003)(6512007)(316002)(2906002)(53546011)(6506007)(478600001)(26005)(6916009)(33656002)(76116006)(66476007)(91956017)(8936002)(86362001)(5660300002)(8676002)(4744005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 EeU0ULv85bbD222Z4O/b6DUryldmIqD4g1TM/o0RquU+xUIM3BcvJ06cBNhTRyyZu0cxa+MZ8KiACwp+cmjhHTK2zqQvb87BCaslPXlBql5MWOi18hKWxQ9nsePW0qT+WlLLDxy7Gzr7ee9MlwQSiVStBU4F9RUWBJt6m7DY5Ha2Pd3IdfgLR2C2sr8aQ18cFjf3qI8tZipSOqi7mU3TRyDSB12cS1J1xtOITufXs9fHyPEosF2hVw2WyRqHTCqiQUeYjthCNt6MVnF0uOQXvJppTDgNnr31R0JlK1QpbV9orwNTSy45D5JFXjIgNlnUzNAnARsxVlXOEtuAanYyarOJrl55MjDF5F80DblOH4910iERQl0i+q9Opd1n+ltV49f1ow/u5i6F6Ijed+CAWVik7eYDu6vcH0Lt/dQUE72KwWXH/9sHtCBipFQzOFjJOQU5OWVlZOsAIzuP8DfZL9nLtz7ymvNBv0RoDZOKzYOE03u4Sv4ZtGbvFJvudgy65E+v8KIKavc9Lfkga25h64LjNwrqLywAsYgVCaeQfYFEeKZTOXPrQRrmwDBtnxygjZ9yWwvixXJRPEIVQcD4I8JuUIllga8io5Qn7KF2w+lv5g6ZPe6hsztuFuTXhr3Nq43/E55dNRI9KZbrDCXUAmmQI//wZHCNNKInDnJDY5iaLesqmZRHIIIMZYK87Oyr6VK34QzDb02CWZJhHuVy2/3jiC/NpQ3HpH5pxYZ0XiDSBbc0ogpxbjWACZSdjWMGpIFROrqySTpm0RlA98JqsR7Ti4DQqN+R/AhKZ9zzy5M6xX/FoQrAABk1rPhT6kSHpgLeoHQqHiKkscmflWfWS1N0nwpuNSimXG8WmcTXc5OO0kQ+sQEqSyNkK/9BRF0TqK1xjUjRbVL3bAEEfAGHug==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <14EDCD9E965D1F4B87D280AE347DC07C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5084
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82b3a4f0-9944-4e9b-2d03-08d89139ea72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WpPc8c/kk6jaZF1z9YhvzECDI1cxfhxIunaZQue24UfMMo7jZldl9lKIcwQXBygOdozdXqlTpFoX+J5Hx1CqrWT1itMA2ACzDvEVsKZsIi+JgeUipdAGTq0rALC/tMxssFBOf+2C4krIb8WSRVbgeuNHW5wtAKlWV64Fc52gK7bpscx7alhoksUuWDKrKWX1m/gauVJ08r+qgXjqs/MB/GMu9egw8mhMSss+KC6tDnjZWpQyOVJ2XACtBJNLpqmPdIsIgrbqJjjpC0xeuWSPJrxgB9Pet2XTGCmmsW47op5o3QEMUDMejuAD/jmAywEjMey4JedM2DpHLMcYScZuYPMQ992KrwAk+KrGVaxrYpFc/CQ4tQBcB8GuMJTYbddpxulU2qbP9Bi/eJJ1RgR5Lw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(70586007)(2906002)(356005)(186003)(70206006)(33656002)(36756003)(47076004)(5660300002)(86362001)(82310400003)(82740400003)(2616005)(316002)(6506007)(478600001)(4326008)(81166007)(36906005)(54906003)(6486002)(6512007)(8676002)(8936002)(26005)(53546011)(336012)(6862004)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 12:02:07.3872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6d3034-da2c-4cec-db23-08d89139ee8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4663



> On 25 Nov 2020, at 11:26, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 24/11/2020 17:44, Stefano Stabellini wrote:
>> On Tue, 24 Nov 2020, Rahul Singh wrote:
>>>> On 24 Nov 2020, at 11:12 am, Bertrand Marquis <Bertrand.Marquis@arm.co=
m> wrote:
>>>>=20
>>>> On the Cortex A55, TLB entries can be allocated by a speculative AT
>>>> instruction. If this is happening during a guest context switch with a=
n
>>>> inconsistent page table state in the guest, TLBs with wrong values mig=
ht
>>>> be allocated.
>>>> The ARM64_WORKAROUND_AT_SPECULATE workaround is used as for erratum
>>>> 1165522 on Cortex A76 or Neoverse N1.
>>>>=20
>>>> This change is also introducing the MIDR identifier for the Cortex-A55=
.
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> And committed.

Thanks :-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


