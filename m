Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC5C28107A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1831.5560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOI8i-00039i-VK; Fri, 02 Oct 2020 10:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1831.5560; Fri, 02 Oct 2020 10:18:12 +0000
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
	id 1kOI8i-00039I-Rf; Fri, 02 Oct 2020 10:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1831;
 Fri, 02 Oct 2020 10:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOI8g-00039D-F1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:18:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e6e044c-e586-442e-b840-3889dfbf8f21;
 Fri, 02 Oct 2020 10:18:09 +0000 (UTC)
Received: from AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17)
 by VI1PR08MB4128.eurprd08.prod.outlook.com (2603:10a6:803:e9::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 10:17:56 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::cb) by AM6PR04CA0004.outlook.office365.com
 (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 10:17:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:17:56 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 02 Oct 2020 10:17:55 +0000
Received: from 95ef19b0997f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB8927D8-2852-49A4-8A5E-5098021B946A.1; 
 Fri, 02 Oct 2020 10:17:18 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ef19b0997f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 10:17:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB2008.eurprd08.prod.outlook.com (2603:10a6:4:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 2 Oct
 2020 10:17:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOI8g-00039D-F1
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:18:10 +0000
X-Inumbo-ID: 8e6e044c-e586-442e-b840-3889dfbf8f21
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.52])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8e6e044c-e586-442e-b840-3889dfbf8f21;
	Fri, 02 Oct 2020 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6iwqQ3nWxRB8EcVfZ0Qyt74C59X1BrCxqRbVJ+m+MM=;
 b=SGB511ekcLQZL7kvgHSA1s4gcoJPCpsz9JA6jOV2jN00VefHzY8Qfig52IUN4j5eUN2H+JA1pK78Iyr8/7AaYPGUlzTcaCJ4NUtFeNXfMXN+nwsSC7usmHXAgJiCu2/pieFw+gTSNT2CWi8hLy9rWHwwkEFIKRv4Bf4atqbo3wM=
Received: from AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17)
 by VI1PR08MB4128.eurprd08.prod.outlook.com (2603:10a6:803:e9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 10:17:56 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::cb) by AM6PR04CA0004.outlook.office365.com
 (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 10:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:17:56 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 02 Oct 2020 10:17:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb89d826696a2197
X-CR-MTA-TID: 64aa7808
Received: from 95ef19b0997f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB8927D8-2852-49A4-8A5E-5098021B946A.1;
	Fri, 02 Oct 2020 10:17:18 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ef19b0997f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 10:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5HpHLBaWm4a3w5At3G0x2VzevBsrfgal2TqOJU+i0zX1B6D8BCZYRPdn6QX6G3DIW9Cz1Iyihf52G+4hdIT4FI9asOKd0jgI7KsgdK+1Hw7asMkzeCKlOC8XZTSvBVzAmTuv+LdsyO3qXcw7/a5GyRgfD9EtNDafA+TS74lsMEtqlmOv1HbkYbkWLefmYx+5hVGQiyPnfDx9fzsBBqMmyxdSjLbUBRYS6rhRghWFnHWA4z98zas6PH89B/RBHiXg0Wg/wBRFthLOIpcBER2jGw3WVDlpmsrvYG7mV1gDb5/F/qe+yJ3FFu0zNvn/ddjLvRk9g2KwOOnuSn/dl6JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6iwqQ3nWxRB8EcVfZ0Qyt74C59X1BrCxqRbVJ+m+MM=;
 b=cQB2RZsWockKVNUdtRhcMB50kSrTLubwVH3q61LMHseQCLJvpO4/1zuQzi0ClWoCvIZljuoXMi59pmY5NB3q+lQx/xPsX0HpkQpt8zbI8wGAhAWrg9YXxdcX8MFROO7AbNT9ZdGrn2EXMo04W0ije1RRJT3zigJILI7Tt4H87hN9logwfDH0i+tC1zcdKS1H2xGH7r3CKd1B4e/BeOzFilasCgIJQPz+C/2jyOeLheBH5KZkvaSCjGVVX4HbgVbg+x8ZqLVLkOj2v7EPMTWecGvYPQaOxWRD4wTxEsyWHu0CIkM+hJXANff4I+cLW3vlzzFm/SUV2cNPG+niayhucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6iwqQ3nWxRB8EcVfZ0Qyt74C59X1BrCxqRbVJ+m+MM=;
 b=SGB511ekcLQZL7kvgHSA1s4gcoJPCpsz9JA6jOV2jN00VefHzY8Qfig52IUN4j5eUN2H+JA1pK78Iyr8/7AaYPGUlzTcaCJ4NUtFeNXfMXN+nwsSC7usmHXAgJiCu2/pieFw+gTSNT2CWi8hLy9rWHwwkEFIKRv4Bf4atqbo3wM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB2008.eurprd08.prod.outlook.com (2603:10a6:4:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 2 Oct
 2020 10:17:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:17:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
Thread-Topic: Ping: [PATCH 0/6] tools/include: adjustments to the population
 of xen/
Thread-Index:
 AQHWh2uA51KvLc+DNUCjQhMwaVDUdqmDCd+AgAAHWYCAAAQLgIAAxK+AgABY4YCAAAi8gA==
Date: Fri, 2 Oct 2020 10:17:16 +0000
Message-ID: <B41B6364-77EE-4CD2-AB1D-081A4EA099A0@arm.com>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
 <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
 <6B9403A3-66DC-4A69-8006-096420649768@arm.com>
 <dea68b56-990d-a13f-a2c4-171e67eaaf73@suse.com>
 <A4993E3A-6529-4239-ABF8-DD89A01A54D1@arm.com>
In-Reply-To: <A4993E3A-6529-4239-ABF8-DD89A01A54D1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77b31b13-8c0a-41da-d2f7-08d866bc6e35
x-ms-traffictypediagnostic: DB6PR0801MB2008:|VI1PR08MB4128:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4128CC587FC9A90CD607275E9D310@VI1PR08MB4128.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zmhEYaCFvMAs9g9SoUcMEU58hkUHRYjty/hr8yf5dR2t/HcRD3jM/3700dD+QbDLKuBR0psnL002CLuuhxhvUlJ4+QjsEDYcI4UY0Wm59HiycdW/hAPgckqYnGr5hp2Xrb7kWSiyIPTeo9e/n1nHjEomA0UNGG4bReI0R9cWG/S4AR7Uoap2H9Cfny8dLy1raYDHFfoW/1dB6d1SjmE0qvtk6q7+g2tQNug40lWah90BXWtXosnMLNIDcPm5EoFJ9iZXfBurDtqugdSGJYKyHb8G7R0m67X7DqxJggkES0NIpCy//o6kAdzAA2YVrTKL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(66446008)(66556008)(66476007)(64756008)(8936002)(6512007)(71200400001)(6506007)(66946007)(91956017)(4326008)(186003)(66574015)(2616005)(83380400001)(6486002)(33656002)(2906002)(54906003)(26005)(86362001)(8676002)(5660300002)(316002)(53546011)(76116006)(6916009)(478600001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 rQap2tqNT15CU0nrDZhgwtG0tKsqxg1u9X1q3KdMCd29GZdQPtW223kHdTYtloUeRdXUKHrIV92Z5JTjC8Et9aLfGDG4ohYMNisc0ja3praTqfB2YGttFSaHnw6ZO9o23yUkvdx9F1bG5kmrUwFN/GOR9B4ebwV9t4QYcmRtHNkKo7RajlKeNZ9xHVZiL8RN/GkZhhpqOQvsXV5FS8J+tDl6WInw8Ay/5+4Buse4AlaIBogUhDT6lu7ZeG7bqShQcEw1jl3ub3hk0W0VNFj4vopRF2cs/QCRWEOMc3JZtFNxQgWPoz5TAJOzvrez+qbT4ywydQoBdgewHWk0NK7jSArXcmTWTgtRAhxuz9AzxOKHHC3lGb+jhakaRBjDSPXDDrg9+5HHxiPhZKIzB6eEoffAVuVuA21FQJWv9VhYMo8IpW+LwsoZmzluz4jegnbSl3dYrS7VwyDngrXCwfbpBmXPdrk3+R9gmWfDXP9MLNuyQBCBtU3MnPyWnUKYjfbP8b/EztEaHpSWdn0d8Lq9VZHmwwUYv5MwtYcD9jpq7oWljelpO6VrE+0WsvmjxubLDGncUCYOrrDK0CCnHk6stX8GDusP91YldZeKL1uyDgvwSsQObwLG3VoZXija8QIaeMIhBR1ZzxnyuTSFYFdzbw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0107AEB7603BA4681991B461E6399C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2008
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a326dbf2-0970-466a-c132-08d866bc56ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9IPGnKsCrYhIPI6tf5OQ5sOkB0QIFnnnoR1FiMHgfEe7k4+xnvHaXUWIYbqiGGcn6/flWs4EZZB61A6ZKVc8gZO39XEAQwf/93UAkKn2GqhTbXfJIJo6R1a1szezzsc8HTYWvf3+rS/nb9ddlSzQ9Y7OW2x/oLillbbFEGnmG0mVDWT34KokeY7H8zseaL5x8FGCYz+64BzU1H0vOzNMo/N8mHI9ABRPlirc8K6+Yi83oB0cEr7N8iA+OvDANzAEa8YHtYJWbEe1NfD3lHn673E5BQrRN1G1JIg9xwF1XVffoqMjX88Lte5YC2Tf/x1eDQqxw3FV4zsdlnzhqHSvXyWHAD4xpl4+r3YP9UYqPJQlf0AMS1k4E0AQUra0ojWhhvEZcN5K08bC0ILS0JtEnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(46966005)(83380400001)(70586007)(6486002)(82740400003)(356005)(478600001)(26005)(81166007)(316002)(70206006)(33656002)(186003)(54906003)(36906005)(6862004)(2906002)(4326008)(2616005)(6512007)(6506007)(336012)(86362001)(82310400003)(8936002)(5660300002)(36756003)(66574015)(53546011)(47076004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 10:17:56.1231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b31b13-8c0a-41da-d2f7-08d866bc6e35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4128

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMTA6NDUsIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAyIE9jdCAyMDIwLCBh
dCAwNToyNywgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+IA0KPj4g
T24gMDEuMTAuMjAgMTg6NDMsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gSGksDQo+Pj4+
IE9uIDEgT2N0IDIwMjAsIGF0IDE3OjI5LCBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJx
dWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gSGkgSmFuLA0KPj4+PiANCj4+Pj4+IE9u
IDEgT2N0IDIwMjAsIGF0IDE3OjAzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiAxMC4wOS4yMDIwIDE0OjA5LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+PiBXaGlsZSBsb29raW5nIGF0IHdoYXQgaXQgd291bGQgdGFrZSB0byBtb3ZlIGFy
b3VuZCBsaWJlbGYvDQo+Pj4+Pj4gaW4gdGhlIGh5cGVydmlzb3Igc3VidHJlZSwgSSd2ZSBydW4g
aW50byB0aGlzIHJ1bGUsIHdoaWNoIEkNCj4+Pj4+PiB0aGluayBjYW4gZG8gd2l0aCBhIGZldyBp
bXByb3ZlbWVudHMgYW5kIHNvbWUgc2ltcGxpZmljYXRpb24uDQo+Pj4+Pj4gDQo+Pj4+Pj4gMTog
YWRqdXN0IHBvcHVsYXRpb24gb2YgYWNwaS8NCj4+Pj4+PiAyOiBmaXggKGRyb3ApIGRlcGVuZGVu
Y2llcyBvZiB3aGVuIHRvIHBvcHVsYXRlIHhlbi8NCj4+Pj4+PiAzOiBhZGp1c3QgcG9wdWxhdGlv
biBvZiBwdWJsaWMgaGVhZGVycyBpbnRvIHhlbi8NCj4+Pj4+PiA0OiBwcm9wZXJseSBpbnN0YWxs
IEFybSBwdWJsaWMgaGVhZGVycw0KPj4+Pj4+IDU6IGFkanVzdCB4ODYtc3BlY2lmaWMgcG9wdWxh
dGlvbiBvZiB4ZW4vDQo+Pj4+Pj4gNjogZHJvcCByZW1haW5pbmcgLWYgZnJvbSBsbiBpbnZvY2F0
aW9ucw0KPj4+Pj4gDQo+Pj4+PiBNYXkgSSBhc2sgZm9yIGFuIGFjayBvciBvdGhlcndpc2UgaGVy
ZT8NCj4+Pj4gDQo+Pj4+IFRoaXMgaXMgZ29pbmcgdGhlIHJpZ2h0IHdheSBidXQgd2l0aCB0aGlz
IHNlcmllIChvbiB0b3Agb2YgY3VycmVudCBzdGFnaW5nDQo+Pj4+IHN0YXR1cyksIEkgaGF2ZSBh
IGNvbXBpbGF0aW9uIGVycm9yIGluIFlvY3RvIHdoaWxlIGNvbXBpbGluZyBxZW11Og0KPj4+PiBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gL21lZGlhL2V4dGVuZC1kcml2ZS9iZXJtYXIwMS9EZXZlbG9w
bWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2RvbTAtZnZwLnByai90bXAvd29yay9hcm12
OGEtcG9reS1saW51eC9xZW11LzUuMS4wLXIwL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3hl
bmd1ZXN0Lmg6MjUsDQo+Pj4+IHwgICAgICAgICAgICAgICAgICBmcm9tIC9tZWRpYS9leHRlbmQt
ZHJpdmUvYmVybWFyMDEvRGV2ZWxvcG1lbnQveGVuLWRldi95b2N0by1idWlsZC9idWlsZC9kb20w
LWZ2cC5wcmovdG1wL3dvcmsvYXJtdjhhLXBva3ktbGludXgvcWVtdS81LjEuMC1yMC9xZW11LTUu
MS4wL2h3L2kzODYveGVuL3hlbl9wbGF0Zm9ybS5jOjQxOg0KPj4+PiB8IC9tZWRpYS9leHRlbmQt
ZHJpdmUvYmVybWFyMDEvRGV2ZWxvcG1lbnQveGVuLWRldi95b2N0by1idWlsZC9idWlsZC9kb20w
LWZ2cC5wcmovdG1wL3dvcmsvYXJtdjhhLXBva3ktbGludXgvcWVtdS81LjEuMC1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvaW5jbHVkZS94ZW5jdHJsX2RvbS5oOjE5OjEwOiBmYXRhbCBlcnJvcjogeGVu
L2xpYmVsZi9saWJlbGYuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPj4+PiB8ICAgIDE5
IHwgI2luY2x1ZGUgPHhlbi9saWJlbGYvbGliZWxmLmg+DQo+Pj4+IHwgICAgICAgfCAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+Pj4gfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0K
Pj4+PiB8IC9tZWRpYS9leHRlbmQtZHJpdmUvYmVybWFyMDEvRGV2ZWxvcG1lbnQveGVuLWRldi95
b2N0by1idWlsZC9idWlsZC9kb20wLWZ2cC5wcmovdG1wL3dvcmsvYXJtdjhhLXBva3ktbGludXgv
cWVtdS81LjEuMC1yMC9xZW11LTUuMS4wL3J1bGVzLm1hazo2OTogcmVjaXBlIGZvciB0YXJnZXQg
J2h3L2kzODYveGVuL3hlbl9wbGF0Zm9ybS5v4oCZIGZhaWxlZA0KPj4+PiANCj4+Pj4gWGVuIGlz
IHVzaW5nIHhlbmN0cmxfZG9tLmggd2hpY2ggbmVlZCB0aGUgbGliZWxmLmggaGVhZGVyIGZyb20g
eGVuLg0KPj4+IEFjdHVhbGx5IHRoaXMgaXMgbm90IGNvbWluZyBmcm9tIHlvdXIgc2VyaWUgYW5k
IHRoaXMgaXMgYWN0dWFsbHkgYSBwcm9ibGVtIGFscmVhZHkgcHJlc2VudCBvbiBtYXN0ZXIuDQo+
PiANCj4+IC4uLiBhbmQgZml4ZWQgb24gc3RhZ2luZy4NCj4gDQo+IEkgY2FuIGNvbmZpcm0gdGhh
dCB3aXRoIHRvbmlnaHQgc3RhZ2luZyBzdGF0dXMgdGhpcyBpc3N1ZSBpcyBub3QgcHJlc2VudCBh
bnltb3JlLg0KDQrigKYgYW5kIHRoZSBzZXJpZSBpcyBidWlsZGluZyBhbmQgd29ya2luZyBwcm9w
ZXJseSBmb3IgYXJtIChpbmNsdWRpbmcgY29tcGlsaW5nIGV2ZXJ5dGhpbmcNCm9uIFlvY3RvKS4N
Cg0KU286DQpUZXN0ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT4NCg0KQW5kIGkgdGhpbmsgaXQgaXMgYSBnb29kIGltcHJvdmVtZW50Lg0KDQpDaGVlcnMN
CkJlcnRyYW5kDQoNCg==

