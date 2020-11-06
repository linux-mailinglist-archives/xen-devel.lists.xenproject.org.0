Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8C2A9595
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 12:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20679.46710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb09r-0005WM-Gn; Fri, 06 Nov 2020 11:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20679.46710; Fri, 06 Nov 2020 11:43:55 +0000
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
	id 1kb09r-0005Vx-DQ; Fri, 06 Nov 2020 11:43:55 +0000
Received: by outflank-mailman (input) for mailman id 20679;
 Fri, 06 Nov 2020 11:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kb09q-0005Vs-Bg
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:43:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::61a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f600e120-28e3-4f68-8562-a130a2f95e18;
 Fri, 06 Nov 2020 11:43:52 +0000 (UTC)
Received: from AM6P193CA0058.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::35)
 by AM8PR08MB5697.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:43:49 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::9c) by AM6P193CA0058.outlook.office365.com
 (2603:10a6:209:8e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 11:43:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 11:43:48 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Fri, 06 Nov 2020 11:43:48 +0000
Received: from d1ce32fd145c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6075E167-8020-4CF6-AE9C-01E4F2A9BCE1.1; 
 Fri, 06 Nov 2020 11:43:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1ce32fd145c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 11:43:26 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 11:43:25 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kb09q-0005Vs-Bg
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:43:54 +0000
X-Inumbo-ID: f600e120-28e3-4f68-8562-a130a2f95e18
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7e1b::61a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f600e120-28e3-4f68-8562-a130a2f95e18;
	Fri, 06 Nov 2020 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJId46Y3T+sH6uEXxNLxlE0u6JQeSseFyzKydePrehA=;
 b=c7Oj7kaXullaylvW9reHWS7ufNzzFl2lYBs0n9U4VQI7rNKwWRq3kGZpP+E+mTE55oXzAm/AwG2ilh7pN/ZO842hqzxzWwivvlQ+qtb7FTVwjBmuwG9iAV9L62IX5QT1/EUcNxm9ArVtSdEdYSpLNT8YcLSYSGsgn5ugfY5JY0A=
Received: from AM6P193CA0058.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::35)
 by AM8PR08MB5697.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:43:49 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::9c) by AM6P193CA0058.outlook.office365.com
 (2603:10a6:209:8e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 11:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 11:43:48 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Fri, 06 Nov 2020 11:43:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaff8c02ab7ec0e2
X-CR-MTA-TID: 64aa7808
Received: from d1ce32fd145c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6075E167-8020-4CF6-AE9C-01E4F2A9BCE1.1;
	Fri, 06 Nov 2020 11:43:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1ce32fd145c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 11:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROydsg4X2tjIodwb9R4DZYugOEt9gR/JGaWAIvO1v8mgW0+DMAdsg7+129Vh3Qoy0LL4omn6jyJ5zDUMGwQRxXzX1S73Sv63l5XIXVy61OJ+FzJzDWiGdPjrWfTzSRxOfThXuxO/8C/AWzJjNhtp7r8XhzaR42/uyoPlrJgoyBsK7WRHrjSG+k/oeWM4uvat0S5KGx28sJaTLoxTAZ2srK9jh19tv1uNjEspBvan7cTVqzRlNh5VLkqaWqJsXN4u59LzZzdGYLjE5hxPy2+EasVp9inJhaFA08cRx56MyToKKDfjYTSRt3aDqe/DHUsD1RSKl+7A+XBYAtgMsxxMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJId46Y3T+sH6uEXxNLxlE0u6JQeSseFyzKydePrehA=;
 b=eP4HHnGZtl8r0nIRFjcrQdje2vSLyrbL+MBlpjeNauu8dnOi4hHtROvDzLbGC7HRIu5jBJyeQLTs4cj59UqyC0Vkz8RavbSPiLaphc2ysaA5avVRV0Q2raxcqdTievync+od0hd6t3iD0ChHoaN+0xVEY3KjKgoIWi6YStITJyeenq8DWxJ3YQ1WvuPbciOYT+wbn5oizSCViU76HnYLJGXc2NPeqF1fTKiQSCA2EMX4PbZydjQE89A97FMbL6b/1HFhlxJ6PW1/lrAoLrAWcLZuOC2eKSxX6umwj+/vUtzMxRWDLK8nzqcg7TPUI/KR/g70ulaICorSKgNqGc4yEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJId46Y3T+sH6uEXxNLxlE0u6JQeSseFyzKydePrehA=;
 b=c7Oj7kaXullaylvW9reHWS7ufNzzFl2lYBs0n9U4VQI7rNKwWRq3kGZpP+E+mTE55oXzAm/AwG2ilh7pN/ZO842hqzxzWwivvlQ+qtb7FTVwjBmuwG9iAV9L62IX5QT1/EUcNxm9ArVtSdEdYSpLNT8YcLSYSGsgn5ugfY5JY0A=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 11:43:25 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:43:25 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
Thread-Topic: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for
 PCI ATS functionality.
Thread-Index: AQHWsfqLVPZUjJyJak+hwdAAN0KToam4HooAgAABtgCAAt/dgA==
Date: Fri, 6 Nov 2020 11:43:25 +0000
Message-ID: <73189992-EC5B-493D-BB23-6DFB2F11A580@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
 <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com>
 <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
In-Reply-To: <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63b21911-5888-48a6-9de4-08d8824939ec
x-ms-traffictypediagnostic: DB6PR0802MB2375:|AM8PR08MB5697:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB569733B0E59DEE46DBD9BD01FCED0@AM8PR08MB5697.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oXaAncseH50J6k3Pki6Q0PN8MCT/jcEAmDDZolx//o9q2FHZDtbApmShv9xnw2GYAl0KAxDNN47dGOVWa2VIJ7aalogN89ngSte1Us27qxKJOv/ZJg9H2WgPMv6K7EOF+h9KlAOAmFqi/tbq0arkwbCY7JFENRSw3/7+Rt4xOOiXGmoR22TaUJ6FFRhS32QhVtHF/AKP55ZRQG7BbaKz9ajetrgMuY27HZVL+dGvg3SYxEEzilvncljxDQkfoQ68EnAXOgevWlbMCF2K/IMOHrUdmkFqWn/lREtKIrOFITpkEdMqYKr5KHPIcyJahkS2ZRvGxqu6Vmfd+YlSu28FGw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(2616005)(86362001)(8676002)(6486002)(55236004)(26005)(2906002)(6512007)(478600001)(186003)(5660300002)(8936002)(66556008)(4326008)(36756003)(83380400001)(33656002)(76116006)(64756008)(66446008)(66476007)(66946007)(71200400001)(91956017)(316002)(6506007)(53546011)(6916009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 UBXPr7vA0C1+YRl2IZA+oHWYR8nEaYrk/Vme7gNx9d3XsLnLIzBqQReyjl2pG/qYXLTAgHnheV0EdWbOFHNgbWsnCpW7l2h8d9Tet2Ogsh7ldGzylbH/5h9cj0BnQkNsGhsJUfHLanp+CUKoYRzPl0qP0NEtYJvWf3ONFfRMllNFaKBo/eGj0YSnYV/kqawcXiMGrgyc3c2/njTMqIzU4KJzISZhsfe4zht8d+RVBVDOMoav0QIgKNBtrxAh/+vFoILpKOMhiCwZpD1CYHMNQFiifA5Wr76MT10C/hOARiGjoNqSNJ7vPCZ8155rVL+P0AVVWhfKBXOx+hKPjlXZXOl+lgZOlETonb0hlxl1DMbUeKcwifw5XiIwqp8T3mX3cdpVKao1UPYIoJhkZRanX3LV7zKirxfGYbFfzEQEIT9vteRU9AzXVjlgluQI1WsUP/Wogg6RursDU0CpS7BCDflaYJrhYGtan8XOk32r56GPTMiXkaDd+2Q1H+LynqYotXSMki7xszqRuOmYLdK7YZAg4bbHenX9HSnrI7F4+ZTjYQjRrozJtK/eRA+pBXnapZ+o4lKka8qtvSJRW++90zpXGqmE4ELwFJ7vRaxliiqs09chKVCUizAXcDERqiIvMPrkoruD3kzlZ4tSwJIFUw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6C6948EEA227F4BADABF2C2AA412626@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2375
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	658aac9d-4696-4edd-fb48-08d882492c2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JKxWkyIfDJ0l+DtE44VhuvlpDrTAFpdCoTtJYWZgA0pYZxjUiO3fq0fNA2J3TX0k9xoieSL1+oqJeGIp/K4/bCr9KafMJ4DZsEUBlzg5YRxvbYio6t62YxScWeCBZIe6q/NpMWCU83ngINoUksOh7Ydq98M7SzGNiDWkxj58fgX2vxwODzVPLW+jXs9NeHwWNlIx2UmEOvJATy/uojTSTYkQzY5w5PflpYVIYZi0cclfH7+2iIcr8gwR+uX/4AJxZBeCmjWWWsqWfw+OXwN57zTQA8lUmscKNkci7tAOweWZxcQfUsXc7Z4vml5cgD/Fq/NKQrQOtEw973cNPCRqpkJNW570ueVyFU2kMgg6qzj3GYlleNl7TJR5eoGvxuEIfDvpv1Hc2uDu5P5d6st58Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(82310400003)(55236004)(86362001)(83380400001)(54906003)(6512007)(6506007)(8936002)(53546011)(36906005)(5660300002)(316002)(6486002)(8676002)(2906002)(26005)(81166007)(186003)(47076004)(478600001)(356005)(70586007)(70206006)(336012)(4326008)(6862004)(2616005)(36756003)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 11:43:48.8307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b21911-5888-48a6-9de4-08d8824939ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5697

SGVsbG8gSmFuLA0KDQo+IE9uIDQgTm92IDIwMjAsIGF0IDM6NDkgcG0sIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNC4xMS4yMDIwIDE2OjQzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+IE9uIDAzLjExLjIwMjAgMTY6NTksIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3BjaS9LY29uZmlnDQo+Pj4gKysrIGIveGVuL2RyaXZl
cnMvcGNpL0tjb25maWcNCj4+PiBAQCAtMSwzICsxLDEyIEBADQo+Pj4gDQo+Pj4gY29uZmlnIEhB
U19QQ0kNCj4+PiAJYm9vbA0KPj4+ICsNCj4+PiArY29uZmlnIFBDSV9BVFMNCj4+PiArCWJvb2wg
IlBDSSBBVFMgc3VwcG9ydCINCj4+PiArCWRlZmF1bHQgeQ0KPj4+ICsJZGVwZW5kcyBvbiBYODYg
JiYgSEFTX1BDSQ0KPj4+ICsJLS0taGVscC0tLQ0KPj4+ICsJIEVuYWJsZSBQQ0kgQWRkcmVzcyBU
cmFuc2xhdGlvbiBTZXJ2aWNlcy4NCj4+PiArDQo+Pj4gKwkgSWYgdW5zdXJlLCBzYXkgWS4NCj4+
IA0KPj4gU3VwcG9ydCBmb3IgIi0tLWhlbHAtLS0iIGhhdmluZyBnb25lIGF3YXkgaW4gTGludXgs
IEkgdGhpbmsgd2UnZA0KPj4gYmV0dGVyIG5vdCBhZGQgbmV3IGluc3RhbmNlcy4gQWxzbyBpbmRl
bnRhdGlvbiBvZiBoZWxwIGNvbnRlbnQNCj4+IHR5cGljYWxseSBpcyBieSBhIHRhYiBhbmQgdHdv
IHNwYWNlcy4gV2l0aCB0aGVzZSB0d28gYWRqdXN0ZWQNCj4+IA0KPj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IEluaXRpYWxseSBJIHdhbnRlZCB0
byBtZXJlbHkgcmVwbHkgaW5kaWNhdGluZyBJJ2QgYmUgZmluZSBtYWtpbmcNCj4gdGhlc2UgY2hh
bmdlcyB3aGlsZSBjb21taXR0aW5nLCBidXQgdGhlcmUgYXJlIHR3byBtb3JlIHRoaW5ncw0KPiAo
YW5kIEkgd2l0aGRyYXcgbXkgUi1iKTogRm9yIG9uZSwgaXNuJ3Qgc3RyaWN0IHBjaV9kZXYncyBh
dHMNCj4gZmllbGQgbm93IHVudXNlZCB3aGVuICFQQ0lfQVRTPyBJZiBzbywgaWYgc2hvdWxkIGdl
dCBhbiAjaWZkZWYNCj4gYWRkZWQuDQoNClllcywgSSB0cmllZCB0byAjaWZkZWYgYXRzIGZpZWxk
IGluIHN0cnVjdCBwY2lfZGV2IGJ1dCBhZnRlciBkb2luZyB0aGF0IEkgZm91bmQgdGhhdCBJIGhh
dmUgdG8gbW9kaWZ5IHRoZSANCmNvZGUgcmVsYXRlZCB0byB4ODYgIGlvdGxiIGZsdXNoLCBhcyBJ
IGhhdmUgbGltaXRlZCBrbm93bGVkZ2UgYWJvdXQgaG93IGlvdGxiIGZsdXNoIHdvcmtzIGZvciAN
Cng4NiBzbyBJIGRlY2lkZWQgbm90IHRvIG1vZGlmeSB0aGF0IHBhcnQgb2YgdGhlIGNvZGUuIA0K
DQpJIGFscmVhZHkgY29tcGlsZWQgdGhlIHg4NiB3aXRoICFQQ0lfQVRTIGFuZCBpcyBoYXZpbmcg
c2FtZSBiZWhhdmlvdXIgYXMgY29tbWFuZCBsaW5lIG9wdGlvbnMgImF0cz1mYWxzZeKAnSB3aXRo
IHVudXNlZCBzdHJ1Y3QgcGNpX2RldiBhdHMgZmllbGQuDQoNCj4gQW5kIHRoZW4sIHdoYXQgZXhh
Y3RseSBpcyBpdCBpbiBhdHMuYyB0aGF0J3MgeDg2LXNwZWNpZmljPw0KPiBTaG91bGRuJ3QgdGhl
IHdob2xlIGZpbGUgaW5zdGVhZCBiZSBtb3ZlZCBvbmUgbGV2ZWwgdXAsIGFuZCBiZQ0KPiB1c2Fi
bGUgYnkgQXJtIHJpZ2h0IGF3YXk/DQoNClllcywgeW91IGFyZSByaWdodCBhdHMuYyBmaWxlIGlz
IG5vdCB4ODYgc3BlY2lmaWMsIGJ1dCBub3QgdGVzdGVkIGZvciBBUk0gc28gSSB0aG91Z2h0IHdl
IHdpbGwgbW92ZSB0aGUgYXRzLmMgZmlsZSB0byBjb21tb24gY29kZSBvbmNlIEFUUyBjb2RlIGlz
IHRlc3RlZC9pbXBsZW1lbnRlZCBmb3IgQVJNLg0KDQpkaXNhYmxlX2F0c19kZXZpY2UoKSBpcyBy
ZWZlcmVuY2VkIGluIGNvbW1vbiAicGFzc3Rocm91Z2gvcGNpLmMiIGZpbGUgIGFuZCBkZWZpbmVk
IGluICJ4ODYvYXRzLmMiIHRoZXJlZm9yZSBJIGRlY2lkZWQgdG8gaW50cm9kdWNlIHRoZSBQQ0lf
QVRTIG9wdGlvbiBmb3IgWDg2LiANCkFzIEkgYW0gbm90IHN1cmUgb24gQVJNIGhvdyB0aGUgQVRT
IGZ1bmN0aW9uYWxpdHkgaXMgZ29pbmcgdG8gYmUgaW1wbGVtZW50ZWQuIA0KDQpUaGVyZSBhcmUg
dGhyZWUgd2F5cyB0byBmaXggdGhlIGNvbXBpbGF0aW9uIGVycm9yIGZvciBBUk0gcmVsYXRlZCB0
byBkaXNhYmxlX2F0c19kZXZpY2UoKSBmdW5jdGlvbi4NCg0KMS4gSW50cm9kdWNlIHRoZSBQQ0lf
QVRTIGNvbmZpZyBvcHRpb24gZm9yIHg4NiBhbmQgZW5hYmxlZCBpdCBieSBkZWZhdWx0IGZvciBY
ODYgYW5kIGhhdmluZyBzYW1lIGJlaGF2aW91ciBhcyAgY29tbWFuZCBsaW5lIG9wdGlvbnMgZm9y
ICFQQ2lfQVRTICBhcyAiYXRzPWZhbHNl4oCdDQoNCjIuIGRpc2FibGVfYXRzX2RldmljZSgpIGlz
IGNhbGxlZCBieSBpb21tdV9kZXZfaW90bGJfZmx1c2hfdGltZW91dCAoKSB0aGF0IGlzIGFzIHBl
ciBteSB1bmRlcnN0YW5kaW5nIGlzIHg4NiBzcGVjaWZpYyAoIG5vdCBzdXJlIHBsZWFzZSBjb25m
aXJtKS4NCk1vdmUgaW9tbXVfZGV2X2lvdGxiX2ZsdXNoX3RpbWVvdXQgKCkgdG8gInBhc3N0aHJv
dWdoL3g4Ni9pb21tdS5j4oCdIG5vdyBhbmQgbW92ZSB0aGUgYXRzLmMgZmlsZSB0byBjb21tb24g
Y29kZSBvbmNlIEFUUyBjb2RlIGlzIHRlc3RlZCBmb3IgQVJNLg0KDQozLiBNb3ZlIHg4Ni9hdHMu
YyBmaWxlIG9uZSBsZXZlbCB1cCAsIGZpeGVkIGNvbXBpbGF0aW9uIGVycm9yIG5vdyBhbmQgaWYg
b24gQVJNIHBsYXRmb3JtcyBnb2luZyB0byBpbXBsZW1lbnQgdGhlIEFUUyBmdW5jdGlvbmFsaXR5
IGRpZmZlcmVudCBmcm9tDQp4ODYgd2UgaGF2ZSB0byBtb3ZlIGF0cy5jIGZpbGUgYmFjayB0byB4
ODYgZGlyZWN0b3J5IA0KDQpQbGVhc2Ugc3VnZ2VzdCB1cyBob3cgd2UgY2FuIHByb2NlZWQgZnVy
dGhlciBvbiB0aGlzLg0KDQo+IA0KPiBKYW4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

