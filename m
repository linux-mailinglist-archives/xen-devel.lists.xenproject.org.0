Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4202C50EA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 10:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38340.71082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiDGt-0006sJ-Lr; Thu, 26 Nov 2020 09:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38340.71082; Thu, 26 Nov 2020 09:08:59 +0000
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
	id 1kiDGt-0006ru-Hx; Thu, 26 Nov 2020 09:08:59 +0000
Received: by outflank-mailman (input) for mailman id 38340;
 Thu, 26 Nov 2020 09:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiDGs-0006ro-Cf
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:08:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b23c29c5-6e38-41ed-a83d-cfb76bcf8eb4;
 Thu, 26 Nov 2020 09:08:57 +0000 (UTC)
Received: from DB8PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:10:be::41)
 by DB8PR08MB4122.eurprd08.prod.outlook.com (2603:10a6:10:ac::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 09:08:54 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::dd) by DB8PR03CA0028.outlook.office365.com
 (2603:10a6:10:be::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:08:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:08:53 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Thu, 26 Nov 2020 09:08:53 +0000
Received: from 9e185541e911.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 028BB808-99E6-40C2-879F-9B86C614F5DF.1; 
 Thu, 26 Nov 2020 09:08:48 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e185541e911.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Nov 2020 09:08:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB4137.eurprd08.prod.outlook.com (2603:10a6:10:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:08:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:08:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiDGs-0006ro-Cf
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:08:58 +0000
X-Inumbo-ID: b23c29c5-6e38-41ed-a83d-cfb76bcf8eb4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.45])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b23c29c5-6e38-41ed-a83d-cfb76bcf8eb4;
	Thu, 26 Nov 2020 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZc0iU4XJgomLAA7yeWFerjA4qG1+thulaxjrCx6OLU=;
 b=ufXTs9BX1HmZnaftQJNLdW7swQ5oGtz1r2pXvOZKZdwQlNR4fxBsvqe5Km1+OHpRF+J/+KLX4GVBFZQvK7rdCtmBn4TyA0DrXb/ojEUrTYqXD/uRPMsP5gowddUeoFsdvGqbVAEHmmLEBqmo47I4txK1TdXflWr8mRWf8BUdfhY=
Received: from DB8PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:10:be::41)
 by DB8PR08MB4122.eurprd08.prod.outlook.com (2603:10a6:10:ac::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 09:08:54 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::dd) by DB8PR03CA0028.outlook.office365.com
 (2603:10a6:10:be::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:08:53 +0000
Received: ("Tessian outbound 814be617737e:v71"); Thu, 26 Nov 2020 09:08:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff531dbd146ce837
X-CR-MTA-TID: 64aa7808
Received: from 9e185541e911.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 028BB808-99E6-40C2-879F-9B86C614F5DF.1;
	Thu, 26 Nov 2020 09:08:48 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e185541e911.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Nov 2020 09:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BItqkU2mZv7R6POemE2PvrIpnJqgZO52yjb+CkdWqEewglBf0bPzLVQlKBye3QUt0j0w22cuyXAs4V8e77TnCeXLzYLv17+EOh15T0TEmwitNInPvsFbjQEKKhnC0jc/8UtTLZTrDiRRu3k18rh9x/9l/CHLKG76a1wqrwAQ8wUhzRGvfFOMkA3vDYCtxXZTV9S7OCf31R7WqEen6s5lA1tQpSoV1bnIoquTgedjxC0CJjU5wncNxOf/nC4JS9/huUrLZ/mEpGzGkgRWFMkXGJ3a+ndFdByFdBKJboVjrJz5JWy1E+Ydo9Uni1XvT7EAsoRcgsxxj4hJClZb0Z21HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZc0iU4XJgomLAA7yeWFerjA4qG1+thulaxjrCx6OLU=;
 b=efeo3ZWuc9XKtNxznUzHSAzU4XfymXrt4uPiAGXKQk6vwxbTuSsRo6ID8Zh9AX/J849UwLQ+DAraD6GW3WLCxej2qDCjs04dFb4imXgmx8PZE9Ld/C0HXHfoSY1mkSOa6Ycp48OsGhHSy1Pa8//y+gyQfFoXEjjcKyUsjNMzSSWAXGKuYYWdzFLGwav7X/PFGVy/nvUTXani7LSJxZ7EOf6DEN+HrH3LWEmAyKcAx7kqwpLwKyeLQGbCZ7kXJTwOninvUoOeH86z1R6lxcKyjT2ENmA82juLlVr2gx7LIXFOPbHUar3uUT3fqrmMC3k2p1jbhuQ2PkvOxrsnfaXN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZc0iU4XJgomLAA7yeWFerjA4qG1+thulaxjrCx6OLU=;
 b=ufXTs9BX1HmZnaftQJNLdW7swQ5oGtz1r2pXvOZKZdwQlNR4fxBsvqe5Km1+OHpRF+J/+KLX4GVBFZQvK7rdCtmBn4TyA0DrXb/ojEUrTYqXD/uRPMsP5gowddUeoFsdvGqbVAEHmmLEBqmo47I4txK1TdXflWr8mRWf8BUdfhY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB4137.eurprd08.prod.outlook.com (2603:10a6:10:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:08:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:08:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Topic: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Index: AQHWw1cvptOzj+DOhEKKe2XksTlGiKnZKPiAgAD31YA=
Date: Thu, 26 Nov 2020 09:08:45 +0000
Message-ID: <909A3998-A7C1-4A4F-A842-BBC53EC662D6@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
 <A24BBAFF-2D6C-448A-955E-4471902C6413@arm.com>
In-Reply-To: <A24BBAFF-2D6C-448A-955E-4471902C6413@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e84ce56-353a-4418-8bfa-08d891eae5dc
x-ms-traffictypediagnostic: DB8PR08MB4137:|DB8PR08MB4122:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4122A3EABD0336A609540EA79DF90@DB8PR08MB4122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +N6gVK3Qtvje2cMuNKblbhN7/2z8lxCveTRGVbNKUibMZzBfcG0d3lylPBBJZ6Hzy+oOgv92jtEbFOtHWU1fqmITQ72RXRLvOIZOkJIdPp5ylQ+7W28og+J5yNgrXcNwciM5bW92lDpyjsIw0FgRBbZr80sn92UFt6P59gUTLjIqN5s2cnKXUxf1VY7Y6PbgjmWtEPrVHfg8csc8pRORiXSVNTRlmxFQm3Pf0Yu6btgqxhxjM2e1bWjo0UiGgBQwGCf4bJCP8r/1K1KAwfmIfvqAOA98BPh9PQYl+qvyKDupeG0Bh26o9X3LB0qm3DX8zPpgb5mirPazjLcUkZ65+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(64756008)(6636002)(66446008)(5660300002)(66946007)(6862004)(71200400001)(91956017)(36756003)(66556008)(76116006)(86362001)(4326008)(66476007)(83380400001)(478600001)(37006003)(6486002)(8676002)(33656002)(186003)(2616005)(8936002)(26005)(316002)(6506007)(6512007)(2906002)(54906003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UktPWVhKSGdOSkVUdUNOSG1USWZEcVNTOGsyeU84N0lXOTdPZEg4aGt5UEVU?=
 =?utf-8?B?eWNXRXJpY21iK3FLS2xySnZYeit3TlMrS1l1Y09rRkRDcnBDM2tzYlpibzYv?=
 =?utf-8?B?VjMyQUJyQWhYRVRzRVZ1VnNaNGJBc2VvZHQxVDVMbktCeFQ0VjlNbW4wbVU0?=
 =?utf-8?B?M2xUR1lRN0MvYWdqMHZqZlVWR00zam5UVERtYVFGOE1vd3JTQ3ZOV2pEc1c5?=
 =?utf-8?B?UEthU3RBVUZETFM1MkFmajREczVSYjlobXFnT2hodGs5UnJGUmpFWHJObjJv?=
 =?utf-8?B?b0QwZzBncnFEa0hXLzY5L0tkc1BNWVc5ckdFbDhibWwrZVZyQllYYnhGVndP?=
 =?utf-8?B?K29JRktpdVRJTUZHbUR1eWE5dW5MVktXZCtHTExVWkpWanFXMVZqM1RUQWVF?=
 =?utf-8?B?bHdYL1ZET1RHZmtyMlZ2WDMvcDZ3TVhtejRNODErSFpyNXB3MkRoN3pvSC95?=
 =?utf-8?B?cHR2UWJxbW4xNmRBTWdTUnJxL0h3d3NGRlNBMzRqRFo0SFpPTHdwRmxlZkJs?=
 =?utf-8?B?YVNOdHgzR0Nxc05mTlNHTG9TUzlKbVZHeXcvWGtqMk0ydDdsaG5QRVc3UHAy?=
 =?utf-8?B?MUJyeTlTcG5aTHdIQUY0eDFqb0t2NW14ZmQvYlhYVG9QUFRVM24reGZ6d0s1?=
 =?utf-8?B?KzQvU3pFREJmbDV6SDc2TitUUlBGenBDRzFad2dqc0FvdlBqWkZMcTJMa0xq?=
 =?utf-8?B?UFdGQytDMjhHajNnZnl0RHlhMW5odUpJdHJmV2RKeEZ0ZzZ5ck9hQ1JUakF1?=
 =?utf-8?B?aHJ1TmVsN2R5bDN4aTlpVUorSmQ5MXJXTUJzdFpVWjErM2V5ek5uQmhQWmdr?=
 =?utf-8?B?RHFNWXpmYm41UUdDODhHSDZZZm5ISE1nbDBBWUgveE5oZkVaU2ViNm8zb2xZ?=
 =?utf-8?B?TFpYQ05Rdkw4RllWZ21ESGpWencvZk9yTFkxZ3ZRdkpmMDJOUGJsR1dJVDBM?=
 =?utf-8?B?cjV2dng1d0hGSWtWT3grb0xwWlJ4dElZNWJ4N1NKY3UxTDdSWnhmRGJkWFdS?=
 =?utf-8?B?VVR4UmFuSm5SbEdJM3g2TkJUblZDVFZHT1IvU1g3Qk5XcG8vODJKQ3lTeXRO?=
 =?utf-8?B?T2lBa3c0c2o0MEliUllIV05odDczV2I1U3kxcTF5MlJ1NUVVUHRLY0I4c0di?=
 =?utf-8?B?M0V3c3NuRFJPcWR5Q3ZBTlhrNngxejdNY1pnQ0dYOUxwRDhqdHdENE5FcjdD?=
 =?utf-8?B?RnNHUkI4UWMyMTFLMXI2V29VMHIvM3FsNVoyc3VZYVRlY1BTYjF4YVcxcVFM?=
 =?utf-8?B?L1d0M1g2SkFnTnhGNUVpVE1weGo0cU10dkZpUndYcVlVL0RaenFVYVlkYzRG?=
 =?utf-8?Q?bZd8yRKwbKqLJ0A7xrhQQHjszqjyNVfqf/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E13AE35FDA730D4A9330D4DFF86C0933@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4137
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7e19a34-3a08-4fd7-cb9e-08d891eae124
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/Rrd9UsJfAvt43KFAMgfKBI+JdvaiKd9iBFPoYSj2i4HFvgFYCvol4nKdO7ZePXZ528jTi9ZzUJMrMYHPMHCtB5v08/fk1yXoPw19s2VAU3HgRC63B+trtHNadMyDnwXGUzz0GcqTx1C7QYnHtNs1U/gmXHuvNIDd/hEZuwMe/xhMzI6Fyo2DeQ5ANM6gzYlwkpH1LkaIeIagiioEzxLqDbYC09Mkoj3CZ2CQZ6FhhKWJYABJYjBXUC6p/cmCxr8q9tmgXPFjjggNIEK3RxK9kvd0jv9vNx8UBMcZ5a8Z/GH4cMtjUzbJefNSj2Mbiz1MDUo4zgH2NgIkBO2NMYr9Jc2qvPNOrxjG0y8d8onfPKiknrDHyKr9ME9g4tdmZ2IdrvlKu/Jh5uoPm5RNSKQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(8936002)(2616005)(6512007)(4326008)(478600001)(6486002)(53546011)(6862004)(36756003)(6506007)(336012)(186003)(54906003)(5660300002)(8676002)(26005)(316002)(356005)(81166007)(82310400003)(70586007)(70206006)(6636002)(37006003)(33656002)(86362001)(2906002)(83380400001)(47076004)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 09:08:53.7666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e84ce56-353a-4418-8bfa-08d891eae5dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4122

DQoNCj4gT24gMjUgTm92IDIwMjAsIGF0IDE4OjIxLCBSYWh1bCBTaW5naCA8UmFodWwuU2luZ2hA
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbyBKdWxpZW4sDQo+IA0KPj4gT24gMjUgTm92IDIw
MjAsIGF0IDY6MTYgcG0sIFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPiB3cm90ZToN
Cj4+IA0KPj4gVGhlIE5TMTY1NTAgZHJpdmVyIGlzIGFzc3VtaW5nIHRoYXQgTlMxNjU1MCBQQ0kg
Y2FyZCBhcmUgdXNhYmxlIGlmIHRoZQ0KPj4gYXJjaGl0ZWN0dXJlIHN1cHBvcnRzIFBDSSAoaS5l
LiBDT05GSUdfSEFTX1BDST15KS4gSG93ZXZlciwgdGhlIGNvZGUgaXMNCj4+IHZlcnkgeDg2IGZv
Y3VzIGFuZCB3aWxsIGZhaWwgdG8gYnVpbGQgb24gQXJtICgvIVwgaXQgaXMgbm90IGFsbCB0aGUN
Cj4+IGVycm9ycyk6DQo+PiANCj4+IG5zMTY1NTAuYzogSW4gZnVuY3Rpb24g4oCYbnMxNjU1MF9p
bml0X2lyceKAmToNCj4+IG5zMTY1NTAuYzo3MjY6MjE6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhjcmVhdGVfaXJx4oCZOw0KPj4gZGlkIHlvdSBtZWFuIOKAmHJl
bGVhc2VfaXJx4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+
ICAgICAgICAgdWFydC0+aXJxID0gY3JlYXRlX2lycSgwLCBmYWxzZSk7DQo+PiAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn4NCj4+ICAgICAgICAgICAgICAgICAgICAgcmVsZWFzZV9pcnEN
Cj4+IG5zMTY1NTAuYzo3MjY6MjE6IGVycm9yOiBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0aW9uIG9m
IOKAmGNyZWF0ZV9pcnHigJkNCj4+IFstV2Vycm9yPW5lc3RlZC1leHRlcm5zXQ0KPj4gbnMxNjU1
MC5jOiBJbiBmdW5jdGlvbiDigJhuczE2NTUwX2luaXRfcG9zdGlyceKAmToNCj4+IG5zMTY1NTAu
Yzo3Njg6MzM6IGVycm9yOiDigJhtbWlvX3JvX3Jhbmdlc+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1
c2UgaW4gdGhpcw0KPj4gZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYbW1pb19oYW5kbGVy4oCZ
Pw0KPj4gICAgICAgICAgICAgIHJhbmdlc2V0X2FkZF9yYW5nZShtbWlvX3JvX3JhbmdlcywgdWFy
dC0+aW9fYmFzZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW1pb19oYW5kbGVyDQo+
PiBuczE2NTUwLmM6NzY4OjMzOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyBy
ZXBvcnRlZCBvbmx5IG9uY2UNCj4+IGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4NCj4+
IG5zMTY1NTAuYzo3ODA6MjA6IGVycm9yOiB2YXJpYWJsZSDigJhtc2nigJkgaGFzIGluaXRpYWxp
emVyIGJ1dCBpbmNvbXBsZXRlDQo+PiB0eXBlDQo+PiAgICAgICAgICAgICBzdHJ1Y3QgbXNpX2lu
Zm8gbXNpID0gew0KPj4gICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+DQo+PiANCj4+IEVuYWJs
aW5nIHN1cHBvcnQgZm9yIE5TMTY1NTAgUENJIGNhcmQgb24gQXJtIHdvdWxkIHJlcXVpcmUgbW9y
ZSBwbHVtYmluZw0KPj4gaW4gYWRkaXRpb24gdG8gZml4aW5nIHRoZSBjb21waWxhdGlvbiBlcnJv
ci4NCj4+IA0KPj4gQXJtIHN5c3RlbXMgdGVuZCB0byBoYXZlIHBsYXRmb3JtIFVBUlQgYXZhaWxh
YmxlIHN1Y2ggYXMgTlMxNjU1MCwgUEwwMTEuDQo+PiBTbyB0aGVyZSBhcmUgbGltaXRlZCByZWFz
b25zIHRvIGdldCBOUzE2NTUwIFBDSSBzdXBwb3J0IGZvciBub3cgb24gQXJtLg0KPj4gDQo+PiBH
dWFyZCBhbGwgcmVtYWluaW5nIFBDSSBjb2RlIHRoYXQgaXMgbm90IHVuZGVyIHg4NiBmbGFnIHdp
dGggQ09ORklHX1g4Ni4NCj4+IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+
PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
UmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cg0KPiANCj4gU29ycnkgSSBtaXNzZWQgdG8gYWRkIHRoZSBzaWduZWQgb2ZmIGZvciB0aGUgY29t
bWl0IG1zZy4gSSB3aWxsIHNlbmQgdGhlIG5leHQgdmVyc2lvbiBvbmNlIHJldmlld2VkIGRvbmUu
DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0K
DQpJIGd1ZXNzIHRoZSBjb21taXRlciBjYW4gYWRkIHRoaXMgd2hpbGUgY29tbWl0aW5nIHRoaXMg
cGF0Y2ggPw0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IFJlZ2FyZHMsDQo+IFJhaHVsDQo+PiAt
LS0NCj4+IA0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+IC0gQXMgcGVyIHRoZSBkaXNjdXNzaW9uIGd1
YXJkIGFsbCByZW1haW5pbmcgUENJIGNvZGUgd2l0aCBDT05GSUdfWDg2DQo+PiANCj4+IC0tLQ0K
Pj4geGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgfCAxNiArKysrKysrKy0tLS0tLS0tDQo+PiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgYi94ZW4vZHJpdmVycy9jaGFy
L25zMTY1NTAuYw0KPj4gaW5kZXggOTIzNWQ4NTRmZS4uMjZlNjAxODU3YSAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9jaGFy
L25zMTY1NTAuYw0KPj4gQEAgLTE2LDcgKzE2LDcgQEANCj4+ICNpbmNsdWRlIDx4ZW4vdGltZXIu
aD4NCj4+ICNpbmNsdWRlIDx4ZW4vc2VyaWFsLmg+DQo+PiAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+
DQo+PiAtI2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiArI2lmIGRlZmluZWQoQ09ORklHX1g4Nikg
JiYgZGVmaW5lZChDT05GSUdfSEFTX1BDSSkNCj4+ICNpbmNsdWRlIDx4ZW4vcGNpLmg+DQo+PiAj
aW5jbHVkZSA8eGVuL3BjaV9yZWdzLmg+DQo+PiAjaW5jbHVkZSA8eGVuL3BjaV9pZHMuaD4NCj4+
IEBAIC01MSw3ICs1MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbnMxNjU1MCB7DQo+PiAgICB1bnNpZ25l
ZCBpbnQgdGltZW91dF9tczsNCj4+ICAgIGJvb2xfdCBpbnRyX3dvcmtzOw0KPj4gICAgYm9vbF90
IGR3X3Vzcl9ic3k7DQo+PiAtI2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiArI2lmIGRlZmluZWQo
Q09ORklHX1g4NikgJiYgZGVmaW5lZChDT05GSUdfSEFTX1BDSSkNCj4+ICAgIC8qIFBDSSBjYXJk
IHBhcmFtZXRlcnMuICovDQo+PiAgICBib29sX3QgcGJfYmRmX2VuYWJsZTsgICAvKiBpZiA9MSwg
cGItYmRmIGVmZmVjdGl2ZSwgcG9ydCBiZWhpbmQgYnJpZGdlICovDQo+PiAgICBib29sX3QgcHNf
YmRmX2VuYWJsZTsgICAvKiBpZiA9MSwgcHNfYmRmIGVmZmVjdGl2ZSwgcG9ydCBvbiBwY2kgY2Fy
ZCAqLw0KPj4gQEAgLTY2LDcgKzY2LDcgQEAgc3RhdGljIHN0cnVjdCBuczE2NTUwIHsNCj4+ICNl
bmRpZg0KPj4gfSBuczE2NTUwX2NvbVsyXSA9IHsgeyAwIH0gfTsNCj4+IA0KPj4gLSNpZmRlZiBD
T05GSUdfSEFTX1BDSQ0KPj4gKyNpZiBkZWZpbmVkKENPTkZJR19YODYpICYmIGRlZmluZWQoQ09O
RklHX0hBU19QQ0kpDQo+PiBzdHJ1Y3QgbnMxNjU1MF9jb25maWcgew0KPj4gICAgdTE2IHZlbmRv
cl9pZDsNCj4+ICAgIHUxNiBkZXZfaWQ7DQo+PiBAQCAtMjU2LDcgKzI1Niw3IEBAIHN0YXRpYyBp
bnQgbnMxNjU1MF9nZXRjKHN0cnVjdCBzZXJpYWxfcG9ydCAqcG9ydCwgY2hhciAqcGMpDQo+PiAN
Cj4+IHN0YXRpYyB2b2lkIHBjaV9zZXJpYWxfZWFybHlfaW5pdChzdHJ1Y3QgbnMxNjU1MCAqdWFy
dCkNCj4+IHsNCj4+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+ICsjaWYgZGVmaW5lZChDT05G
SUdfWDg2KSAmJiBkZWZpbmVkKENPTkZJR19IQVNfUENJKQ0KPj4gICAgaWYgKCAhdWFydC0+cHNf
YmRmX2VuYWJsZSB8fCB1YXJ0LT5pb19iYXNlID49IDB4MTAwMDAgKQ0KPj4gICAgICAgIHJldHVy
bjsNCj4+IA0KPj4gQEAgLTM1NSw3ICszNTUsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbnMxNjU1
MF9pbml0X3ByZWlycShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpDQo+PiANCj4+IHN0YXRpYyB2
b2lkIF9faW5pdCBuczE2NTUwX2luaXRfaXJxKHN0cnVjdCBzZXJpYWxfcG9ydCAqcG9ydCkNCj4+
IHsNCj4+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfWDg2
KSAmJiBkZWZpbmVkKENPTkZJR19IQVNfUENJKQ0KPj4gICAgc3RydWN0IG5zMTY1NTAgKnVhcnQg
PSBwb3J0LT51YXJ0Ow0KPj4gDQo+PiAgICBpZiAoIHVhcnQtPm1zaSApDQo+PiBAQCAtMzk3LDcg
KzM5Nyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBuczE2NTUwX2luaXRfcG9zdGlycShzdHJ1Y3Qg
c2VyaWFsX3BvcnQgKnBvcnQpDQo+PiAgICB1YXJ0LT50aW1lb3V0X21zID0gbWF4X3QoDQo+PiAg
ICAgICAgdW5zaWduZWQgaW50LCAxLCAoYml0cyAqIHVhcnQtPmZpZm9fc2l6ZSAqIDEwMDApIC8g
dWFydC0+YmF1ZCk7DQo+PiANCj4+IC0jaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+ICsjaWYgZGVm
aW5lZChDT05GSUdfWDg2KSAmJiBkZWZpbmVkKENPTkZJR19IQVNfUENJKQ0KPj4gICAgaWYgKCB1
YXJ0LT5iYXIgfHwgdWFydC0+cHNfYmRmX2VuYWJsZSApDQo+PiAgICB7DQo+PiAgICAgICAgaWYg
KCB1YXJ0LT5wYXJhbSAmJiB1YXJ0LT5wYXJhbS0+bW1pbyAmJg0KPj4gQEAgLTQ3Nyw3ICs0Nzcs
NyBAQCBzdGF0aWMgdm9pZCBuczE2NTUwX3N1c3BlbmQoc3RydWN0IHNlcmlhbF9wb3J0ICpwb3J0
KQ0KPj4gDQo+PiAgICBzdG9wX3RpbWVyKCZ1YXJ0LT50aW1lcik7DQo+PiANCj4+IC0jaWZkZWYg
Q09ORklHX0hBU19QQ0kNCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiBkZWZpbmVkKENP
TkZJR19IQVNfUENJKQ0KPj4gICAgaWYgKCB1YXJ0LT5iYXIgKQ0KPj4gICAgICAgdWFydC0+Y3Ig
PSBwY2lfY29uZl9yZWFkMTYoUENJX1NCREYoMCwgdWFydC0+cHNfYmRmWzBdLCB1YXJ0LT5wc19i
ZGZbMV0sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5wc19iZGZb
Ml0pLCBQQ0lfQ09NTUFORCk7DQo+PiBAQCAtNDg2LDcgKzQ4Niw3IEBAIHN0YXRpYyB2b2lkIG5z
MTY1NTBfc3VzcGVuZChzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpDQo+PiANCj4+IHN0YXRpYyB2
b2lkIF9uczE2NTUwX3Jlc3VtZShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpDQo+PiB7DQo+PiAt
I2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiArI2lmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgZGVm
aW5lZChDT05GSUdfSEFTX1BDSSkNCj4+ICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0ID0gcG9ydC0+
dWFydDsNCj4+IA0KPj4gICAgaWYgKCB1YXJ0LT5iYXIgKQ0KPj4gLS0NCj4+IDIuMTcuMQ0KDQo=

