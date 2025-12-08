Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385CCACD7F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 11:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180346.1503544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYMs-0008L2-Ep; Mon, 08 Dec 2025 10:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180346.1503544; Mon, 08 Dec 2025 10:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYMs-0008JL-C0; Mon, 08 Dec 2025 10:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1180346;
 Mon, 08 Dec 2025 10:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPsC=6O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vSYMp-0008JF-V1
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 10:21:20 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15d59b3-d41f-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 11:21:16 +0100 (CET)
Received: from AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33)
 by FRZPR08MB11022.eurprd08.prod.outlook.com (2603:10a6:d10:13d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 10:21:13 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:219:cafe::e0) by AM8P190CA0028.outlook.office365.com
 (2603:10a6:20b:219::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 10:21:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Mon, 8 Dec 2025 10:21:13 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA6PR08MB10419.eurprd08.prod.outlook.com (2603:10a6:102:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 10:20:09 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 10:20:09 +0000
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
X-Inumbo-ID: a15d59b3-d41f-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YdCAIJ+rhzeiYnMFlYlycv+uPBppJOSOaokYtu2qoJw1MsRF1zL8n6ZEjoJupvwhyBYJ+wUPU9o7NDA8h5cJKDtxdXIZKb5RzoePmWiFPuks+kViR30ND+WV/mMcZQ2iiUKLQBspix7Y6yIip5uVkWcFqs8mrgrfXx5sfBwItFPiMSMIy+pAjXHZE0oQI+HUgdVICVS0VBGxHg9iZ5Fh4TC+d6A9hkICKcGOiGMr2Jwylh9cjCVksyVTtqWa/Wi+KK7Eq36m/sYshd0UEUiScRQ3hMLlmk9qHTeIcYL1tOIY//aNmdqrdm5MZXtW2DEqobl04rnMtgpl0aT4Zb5RAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHefE14gMgmCvOQ4jeTpNoUNB7fqYP9fPVqof3NvQl0=;
 b=gvHxTZZKj7X8Un+S1kQQxlveTWIV8K8lIvpDLjHdjEFyY7o/GZZ1N/OjusBZrGnelCEwrW+89N6h+yFByKRINJwy4NA7x/xhJ6nDo6yHP1EQY25ysqD3ngQjKdcB24NC309EUXVTo6DAFM+SDJk0K2lSK+rwM6XkzA/onz3xVA4v7lBDxCOifoDd8gP3pMBY2ESpkfe0TkX+/hv+eB+SuZ586Etv9e0vmYm8Dxcpf0AzJXNjyk2bMyp1hfy9ZxGStXvgrbUyTNvv97YAk+1Ijrv36tZV7HGS4sBg8rafQOfJ60RPXnCTBSzyfcLfIg7q4J17PCXqg3S2nsQa5TlvaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHefE14gMgmCvOQ4jeTpNoUNB7fqYP9fPVqof3NvQl0=;
 b=lcsRe9nzx3vuQ9x/9l6gvr2VddDqgH2AvSx74L/cSKbsOxDOaQvwV9QM4Gbwf+rFMRDTg01ZNHHvnQJehPP1EJb+RiIyYxhRmM0R7kD8yMwottfWmDKy4LIXYUh9TKU+9xsAMRBHpEF6j1LJsSJkC+5l8YZNW1xBcI1HZMh+idE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y47I8Shsb/IPgGNjfz5vfEEt/q+TRsquDVysZYO0mdStWRyxbWQn3b1V80gZwE2bX6UrpdAhkuF89ADhmljAdaubQ4ZMNgxdbb5/dJfV9EegFOMunJERFfwwXcYSnF/OKvoBYAuoNksM7+htmQGabb0JZ/D0r+KPBiP8dR2CZG3AWpxMhzs4QnTyY0ogaDyiSnfqk7DNeNe11UJBUNf1JO9MMlUFDQkc4lZM5q1aG8O5VlvsPwIsDEWi3ktRLGLzjztbeWVWQ8eT7LYulcJKpt587OJzjWD19arS9+b4tuZKgm9i3TeOTMEbJTlPbrRfR3MfVoN72MzdzunhWqA4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHefE14gMgmCvOQ4jeTpNoUNB7fqYP9fPVqof3NvQl0=;
 b=IO6XWvpm2uD27xKmVpssbNtH5LxB3CjfCxFQWwILt8tChNwzjwBXkOrTwgQTfSvK2/D/sya3banYKQErfkWIEbReJW44S3p6UC8qoYxjgtlxkAyJDSYyX+93ft/dKUX6OD7vS2Qo0ltfvHXBVPz6Xb+1KGxwGNqQUyQbcPBhYXh21JW1zlwG+uTGvqOYF7cI56ro8V1KvrG57UHeoYILXUguPQfWSV3ZE70c0xvXC++VJYAsk7NFpcfY3Vrn/7pMoz/lZRn9U94KW5kqQdQDs+6I6Qkyuq9lSvAX5kHde3nI5n9DlhSYtoIrJ+tl6qBfstY3NJjgULNUjqTKmW/fUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHefE14gMgmCvOQ4jeTpNoUNB7fqYP9fPVqof3NvQl0=;
 b=lcsRe9nzx3vuQ9x/9l6gvr2VddDqgH2AvSx74L/cSKbsOxDOaQvwV9QM4Gbwf+rFMRDTg01ZNHHvnQJehPP1EJb+RiIyYxhRmM0R7kD8yMwottfWmDKy4LIXYUh9TKU+9xsAMRBHpEF6j1LJsSJkC+5l8YZNW1xBcI1HZMh+idE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/6] arm/mpu: Implement vmap functions for MPU
Thread-Topic: [PATCH 2/6] arm/mpu: Implement vmap functions for MPU
Thread-Index: AQHcaCiVsmELIMmqw0CIjLYoH4Hmo7UXiACA
Date: Mon, 8 Dec 2025 10:20:09 +0000
Message-ID: <04784EBA-BB67-495B-894E-A20A10569D8F@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-3-harry.ramsey@arm.com>
 <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
In-Reply-To: <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA6PR08MB10419:EE_|AM4PEPF00025F9C:EE_|FRZPR08MB11022:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8a5b04-9853-49fc-7805-08de364383a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eHFUYWFEajdJQUdFT0NKbkVEanRJSGs1b2pSaDhzT1J5cnIxQlZSZU1KeVZW?=
 =?utf-8?B?aG5Rd1d4ajFlKytvdXhnRWwzcVN1NDhkb3BhaTRrN1dGbHVOV2tTdzYzODFr?=
 =?utf-8?B?Vy8xZWdxNk9KTTN2MWRjWnJZN2RRN2VwenQvK0FlK2h2VWJkMDFvZktRR3NE?=
 =?utf-8?B?enpjcmRqQ3pRcWpqdERoQ01kb01IQXVRUS9PZUtRUzVRQlpmSHFma3RldElu?=
 =?utf-8?B?eFJmTklyL3EvWUREdUFQSGJsUGJJdGl4RDJkRnBEU2wwV1dxQW9PeElMcU9i?=
 =?utf-8?B?QWdkMHY4NmxSeEZTeldRMWorTHU3c25uZFh0L0UvM0dSaVBLYXZUWnpJYWF3?=
 =?utf-8?B?VnJsTFlzdTdzR0VGRyt3MHppR3lLbVE1ZHpKZXhSVVhyRk56ZERHVXVNallH?=
 =?utf-8?B?ZnhVNysybWdVcHZQd3RsVk5NMGc5S0ZGQ0pIZERMSnpHT1A2K2FyRHNkek9U?=
 =?utf-8?B?ME02clFHZ2hkVWx6UVZtNW5WMmhaSWs4d3d6SU80SElXajZ5MVR4c2t5bklF?=
 =?utf-8?B?UVRPQVE5U0MrVFVlcHJ3Y2pvS3RXay8rVXNad0piS2ZuRG42SjlidHJaSzV3?=
 =?utf-8?B?cnRxSkNWaC9tbWZQQXg4cU95WjZVZkxVSlJsZXNreG9Zb2lUcTdtZGh4YXRy?=
 =?utf-8?B?dEEyOWpwNXQ2YWgzUDZEMG03d3BoWWMrTjY5TWlXY01uNXN2TWxQVitma2lm?=
 =?utf-8?B?Y0Z3Z2xtamtBdUhYNUVXTlJISVhyMTBKZ3FhT2tMTmR4M2Jqc1RPdVR5MEZn?=
 =?utf-8?B?Yi92dDVjRHh4eHZOcGJJRS9JaVBFbU5JV1AzUzhaQ3hjMjNMYUZ3RHlJUkhx?=
 =?utf-8?B?MUhOZlFsQlI0aFk2TU12cGh1em8rRHI2SVpDRTMxK05BbmExajJPcXQxMFFF?=
 =?utf-8?B?eHN1MG5vaVpFamNpamdNTTNhV3BZeW1haW1tak53YmIrcEpSYVhkb2JHTHp4?=
 =?utf-8?B?aDYyVTVlellxbEdwMG5EYkZoREU3WU5xc05tL085VGpCdG95dVk4YnZMUXdh?=
 =?utf-8?B?MWJXQzRnVFI0bnJYWktyVllGWUVSNmFwMXJ3bVZCRWQrS0tSU0dKSDM1VS8z?=
 =?utf-8?B?S1ZRSGFiMTBwdlQwTmw5bzRzdzd1bDNPQVJSZVQzbXpUb000Z29xbzVBUWxu?=
 =?utf-8?B?ZG1ya1E5am93QTl6VWRMczZ2ditWWGpXZ3UzOE8vSTl0Y1QwL1BwWFpvR1hS?=
 =?utf-8?B?RW5xeEU4K0wvNFV4dTlBOWZ3ZU5TQ0FGWkJYenUwajE2dlBtSnVSSkRXUFZH?=
 =?utf-8?B?UmZveGdqSlJDWk53cFZ2ZU1EUDM3bDJxRmN0eFJOa2Z6L0FwOHNobHJxaUpQ?=
 =?utf-8?B?SEtBRVBxOUtPdGFqR2FOaUNkVWtya0RqWVc3M2loYmhwa3pOaHJSbXNra09a?=
 =?utf-8?B?YTE5NnlEZWRsdkd0U2NPeWt4bTluVG9PRnFKSWNyVG0reUhBeUExSUZ5Ui9G?=
 =?utf-8?B?OGlUeFptMlo2Q3VscndnZzRqTVROSXZNZ3I3STVuSnNudW1HcFFXUlRzTHBX?=
 =?utf-8?B?Mll6MzZmNlphMWtqeXFndTl4cXQ3S3Q4ZUFFK01yQUxheEtkSkhpUUg3WUJR?=
 =?utf-8?B?cUFmbjdlL1BIOEFNQjZxK3lkbGx5SmUzUUZqaU5TWFhwRmEzS2J1azRuMEV0?=
 =?utf-8?B?SzV0Wkh6cW9BTS9KdmswaTNKMTBUUFhWM3ZmS1JaeUsrWWU4N1NyTFBXdTlw?=
 =?utf-8?B?TmNkREtHZ2FqZXd2ZEF3cDVCVnRTRzJBcURuNDkwR3BzRXM2cW0vcTd0TzJW?=
 =?utf-8?B?TlhNeXA2a25XVTlaSnBTTXlnMkVDSEVwbXM1TWRhQWZieTVqZ3NrblJ3ZXRt?=
 =?utf-8?B?TU5xYUFSNUI1RnBjVmhuUVpJSHdYUVA1NnluNVMvVFV1bExPRDA0dmF1Z1FD?=
 =?utf-8?B?ejdVdVpudmF3eWdyQThFMjd0ZU8ycFg1MlRoRW5YOU9NZ014R2o5UVUxVCtL?=
 =?utf-8?B?VVN2TU5zd3pScUlSb3o0T05MMUZ1aGt1b3p0VWgzVW11TzN1WWc0dWM0SnRw?=
 =?utf-8?B?T0ZWYmQ3dVlyR2I5TkVtWW1CN2JCTnhNT3NUUVZ2c1poSHBjKzFzdncydGtl?=
 =?utf-8?Q?fGyIbA?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <88B6CCB1E266B84F8ED3F8F93A5D5AD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10419
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1aea263-daff-4260-9bf9-08de36435d96
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTRYTnJVNFhMRi8rY0JZbkJPdmUwWGFyNTFzMjAvY3Q4eXFCS1VWUm9zejFY?=
 =?utf-8?B?SFM2eSt1VVpiSkpuUlIzTTVpNGxVNFArblBzWVlUa2hXQTlpRDYya1ZaNmt2?=
 =?utf-8?B?YnoyMmlaSmRzQmhuZHh6Mk9heFdNY0RGZlFxcjBzNmhyL1JGQTI0L1FycHF4?=
 =?utf-8?B?SjM1d0t6NVlnQnUxcGVIT3ZNR0x2WnNLSVRFVXRJSk5PVnErdmUrWXAvbi90?=
 =?utf-8?B?VXhRbGFSTVlPc0xCbjRpQzN6WnBGSzNCWEN5cUJVSGZ3Tjd3TlBZS2NEa2NM?=
 =?utf-8?B?RGFYMDVKNVlyM0NhL0dNTWxaY1N1dDljV0wwejlRUXJIaHRLTEszOWR4WkJr?=
 =?utf-8?B?Tjc0QWFFUXFuK09HVTUxT3I4OWlYYitBTUdZU1F2Z2Q0b21CWXVWdXZ1UWxT?=
 =?utf-8?B?N1phMDRLUU91SDJIbzhQSFM2TlVEYW1mYXZ0WEZxVDM0bUdWMEdUVW1LUi9t?=
 =?utf-8?B?bjFYS1hGMFBaT0FyNzJCeU1acStvQUYzQ204VHNWRDVRUE5qZEtuYkpVQkkv?=
 =?utf-8?B?MXJVNEYzRDY2aUU5VTcwdVZrUFIwa2lrekMzSkd6T0hsd1pqanZFVVJEUDlS?=
 =?utf-8?B?ZXpEdElGaENsN1crUG91enZpd0dJR1JTaUNod09qaUhUTUpaWXZZS0t5aDhK?=
 =?utf-8?B?MzFrZk1XR3hUanVMNjlJK2pIMmF3T0hlUVFoVEJtaXFyYVdON3BtVUcyQThh?=
 =?utf-8?B?dVJ1QW80Vkc0bXhzZGdJblJmbWFoNHUzSFQ3RmxYbFVhN2h3SWRLMk5JVVg1?=
 =?utf-8?B?WDl4UzRpV0duYkZ2WWMzWnZVRmxEdzJBMXpOeTJVVjVPNTB1eEFYdldqcVJF?=
 =?utf-8?B?cHJmUjJvb0RlRFpNUjRid3VaNVdHeEF5aDVGTm9MWGg3UTRVUm5FL0l2a05l?=
 =?utf-8?B?b1hRNktHYWVjY0RMalhQbGlIYVRlUTZucnRuQ1FZWHY1MElvWDIzaVhnbGpT?=
 =?utf-8?B?MjV0amFXKzlvSDhRVkUvazcycFpaQzBOdGkvNTVyaTcycmNsRHIrNStXZ2ZF?=
 =?utf-8?B?UWxNTmIxdzlFR3dIUEl0NHhJeE1uU2FnLytjUHMyYmxUaEo3cFY0bEpTdlU3?=
 =?utf-8?B?aUs3VkZyU0FUSEpOV1lpZFlyMEFOWDcrdDllOVNRRG1OWWd0TCtkcHJCQ0pt?=
 =?utf-8?B?cEpiNTRrK0poUlBYaENRcC9FVWVUNHo5Y0Qzd1RFWDJyY1hUdFBtdnBraU4y?=
 =?utf-8?B?T3BnTldQNUk2NkNxYmZ4czk0NGRUdWpCSEpLbXpKeGpqWG0zMUUwR1ppTE8x?=
 =?utf-8?B?WVZmNDBFN3h4REk0eUNQZ3dyYVMxZGtQaHpLTE1XYUVDQnBmQ01SbG1OK1JI?=
 =?utf-8?B?UENPWXJhNmJxY3lTSUloa3NvcDI4ZGhDNHpEaWZvQy9rZm1wcnpoM0M0SEVQ?=
 =?utf-8?B?cnY2aFNBZ2tia2EyY0dHbGZGdGNueXFab3dtTzV4eVkxVGxFYUdpSkU1NmZj?=
 =?utf-8?B?RG5PbFc4RlExb2tyWitkYndKOFFhUkhEekc4c2djcG4rYmtDR0RRRnJia3dY?=
 =?utf-8?B?VmV0ZnV1SkhZSEZlR2xIRzI2R0tPWVREdlhvR1dTYjloNUpDRnV1amszcXFv?=
 =?utf-8?B?d2FDRmlzWVMvcE9jM1dWakZROGNFblF2SFF2d3lhVGdvZnBlcG5HRnVQMCtY?=
 =?utf-8?B?YXZSS0I5YlZvcmhqY09HK1dPdEpIQjVwVEtNMjJ2Z3Z0ZXVXWGtjeitiNHJr?=
 =?utf-8?B?aW90RVZ5SEZtTWtrQ3MrZmtKS2ZUSTlyVHc3T2dLWmQzSVY0R1pKMVZ4VjQ0?=
 =?utf-8?B?WHgzdzZ2eiszbFgzT1ZSaDh4Y1pUajkvSVJNQlFpNEllUnVyZk1xMEI3blZ6?=
 =?utf-8?B?NVpvaFlyOHJZQjFYcnVnZ3Zjcmg5cWY0cEVTMGcraWxKL1FXRnVsYlo4bFUv?=
 =?utf-8?B?RUEwYm9XMW53QlBPYnlpNzhnK0hYQlJtV0EvdTBvbXBPN3ZJT21uMnRpUlZy?=
 =?utf-8?B?UVpJWlBYR3B2R2haSm1MejMxWXdPc1V3RmdZWEdHN21jQ0lKVWJZZGlnc0Vk?=
 =?utf-8?B?UWp2Uzk0L0tOclV1WVVkZ0JTQmdOb1J4WFgwOEFGTjcvWWVmVDl5ZzFRc2Fa?=
 =?utf-8?B?RmkxSnpaWlIxcTVoM1ZzY0VwUzZGU3ZObHZqeXJqaW9VWWR4MWhtemc2eldw?=
 =?utf-8?Q?qKrk=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 10:21:13.1429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8a5b04-9853-49fc-7805-08de364383a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11022

SGkgTWljaGFsLA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LCBJ4oCZbGwgYW5zd2VyIG9ubHkg
ZmV3IG9mIHlvdXIgcG9pbnRzIGFuZCBJ4oCZbGwgbGV0IEhhcnJ5IHRha2UgdGhlIHJlc3QuDQoN
Cj4gT24gOCBEZWMgMjAyNSwgYXQgMDk6NTMsIE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBh
bWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjgvMTEvMjAyNSAxMDo1OCwgSGFycnkg
UmFtc2V5IHdyb3RlOg0KPj4gRnJvbTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0u
Y29tPg0KPj4gDQo+PiBIQVNfVk1BUCBpcyBub3QgZW5hYmxlZCBvbiBNUFUgc3lzdGVtcywgYnV0
IHRoZSB2bWFwIGZ1bmN0aW9ucyBhcmUgdXNlZA0KPiBKdXN0IGFzIGEgcmVtaW5kZXIsIHdlIGRv
bid0IGludGVuZCB0byBzdXBwb3J0IFZNQVAgb24gTVBVPyBBc2tpbmcgYmVjYXVzZSBpdA0KPiB3
b3VsZCBvdGhlcndpc2UgYmUgYSBkdXBsaWNhdGUgZWZmb3J0IHRvIGltcGxlbWVudCBvbmx5IHRo
ZXNlIHR3byBoZWxwZXJzLg0KDQpZZXMgd2UgYXJlIG5vdCBnb2luZyB0byBzdXBwb3J0IFZNQVAg
b24gTVBVLCBoZXJlIHdlIHdhbnQgb25seSB0byBwcm92aWRlIHRoZQ0KaW1wbGVtZW50YXRpb24g
b2YgdGhlc2UgdHdvIGhlbHBlciBzbyB0aGF0IHdlIGRvbuKAmXQgdG91Y2ggdGhlIGNvbW1vbiBj
b2RlIHVzaW5nIHRoZXNlLg0KQXJlIHlvdSBzdWdnZXN0aW5nIHNvbWUgcmV3b3JkaW5nIG9yIHdh
cyBpdCBvbmx5IGEgY3VyaW9zaXR5IG9uIHlvdXIgc2lkZT8NCg0KPj4gDQo+PiArLyoNCj4+ICsg
KiBGcmVlIGEgeGVuX21wdW1hcCBlbnRyeSBnaXZlbiB0aGUgaW5kZXguIEEgbXB1IHJlZ2lvbiBp
cyBhY3R1YWxseSBkaXNhYmxlZA0KPj4gKyAqIHdoZW4gdGhlIHJlZmNvdW50IGlzIDAgYW5kIHRo
ZSByZWdpb24gdHlwZSBpcyBNUFVNQVBfUkVHSU9OX0ZPVU5ELg0KPj4gKyAqDQo+PiArICogQHBh
cmFtIGlkeCAgICAgICAgICAgICAgICAgICBJbmRleCBvZiB0aGUgbXB1bWFwIGVudHJ5Lg0KPj4g
KyAqIEBwYXJhbSByZWdpb25fZm91bmRfdHlwZSAgICAgRWl0aGVyIE1QVU1BUF9SRUdJT05fRk9V
TkQgb3IgTVBVTUFQX1JFR0lPTl9JTkNMVVNJVkUuDQo+IEJvdGggb2YgdGhlc2UgYXJlIHVuc2ln
bmVkLCBzbyB3aHkgdGhlIHBhcmFtZXRlciBpcyBpbnQ/DQoNClVobSwgZ29vZCBjYXRjaCwgSSB0
aGluayB0aGlzIGlzIGEgZG9jdW1lbnRhdGlvbiBpc3N1ZSBiZWNhdXNlIGl0IG1pZ2h0IGJlIGFs
c28gTVBVTUFQX1JFR0lPTl9PVkVSTEFQIHdoaWNoIGlzDQotMSwgd2Ugc2hvdWxkIG5vdCBtYW5k
YXRlIHdoaWNoIHZhbHVlIG1pZ2h0IGJlIGhlcmUsIHdlIHNob3VsZCBvbmx5IHNheSBNUFVNQVBf
UkVHSU9OXyogdmFsdWVzLg0KDQoNCj4+IA0KPj4gDQo+PiB2b2lkIHZ1bm1hcChjb25zdCB2b2lk
ICp2YSkNCj4+IHsNCj4+IC0gICAgQlVHX09OKCJ1bmltcGxlbWVudGVkIik7DQo+PiArICAgIHBh
ZGRyX3QgYmFzZSA9IHZpcnRfdG9fbWFkZHIodmEpOw0KPj4gKw0KPj4gKyAgICBpZiAoIGRlc3Ry
b3lfZW50aXJlX3hlbl9tYXBwaW5nKGJhc2UpICkNCj4+ICsgICAgICAgIHBhbmljKCJGYWlsZWQg
dG8gdnVubWFwIHJlZ2lvblxuIik7DQo+IExvb2tpbmcgYXQgY29tbW9uIHZ1bm1hcCgpIHdlIGln
bm9yZSB0aGUgcmV0dXJuIGNvZGUgZnJvbQ0KPiBkZXN0cm95X3hlbl9tYXBwaW5ncygpLiBJcyBp
dCBvayB0byBkaXZlcmdlPw0KDQpJbiBvdXIgdGVzdHMgaXTigJlzIG9rLCBJIGFza2VkIEhhcnJ5
IHRvIGhhdmUgdGhpcyBzbyB0aGF0IHdlIGNhbiBjYXRjaCBhbnkgdnVubWFwIHRoYXQgaXMgbm90
IGJhbGFuY2VkDQp3aXRoIGEgcHJpb3IgbWFwcGluZy4gVG8gYmUgZmFpciBJ4oCZbSBub3QgcmVh
bGx5IHN1cmUgd2h5IGluIHRoZSB2bWFwLmMgaW1wbGVtZW50YXRpb24gd2UgYXJlIG5vdA0KcmVh
ZGluZyB0aGUgZXJyb3IgY29kZXMgZnJvbSBkZXN0cm95X3hlbl9tYXBwaW5ncy4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

