Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE5ADC51D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017979.1394888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRRmO-0003ac-OD; Tue, 17 Jun 2025 08:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017979.1394888; Tue, 17 Jun 2025 08:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRRmO-0003Xy-LT; Tue, 17 Jun 2025 08:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1017979;
 Tue, 17 Jun 2025 08:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5XJT=ZA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uRRmN-0003Xs-O0
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 08:34:52 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd13904-4b55-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 10:34:48 +0200 (CEST)
Received: from AM9P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::15)
 by GV2PR08MB8728.eurprd08.prod.outlook.com (2603:10a6:150:b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 08:34:44 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:20b:21c:cafe::ec) by AM9P250CA0010.outlook.office365.com
 (2603:10a6:20b:21c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 08:34:43 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 08:34:43 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB10118.eurprd08.prod.outlook.com (2603:10a6:102:368::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 08:34:09 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:34:09 +0000
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
X-Inumbo-ID: edd13904-4b55-11f0-a309-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I/q1GtTXD7Uy0GetUiKK93Wy2itF5q2mVJxNfpCjXxXRGag2SQQH+l4DO+5XfVFtBp/KxxxoI91lRo9s6Z1Z9cCEq4FcshlwGenL9NX1yd8hvzfWQ/q1EzAeSsqGEgfMRxrmD8UDDd9rGAS3qXrTJ89bZCdB/QJCp0cPWJStd6dzX+VZCXnqXhrnjwFBThO5xR4pHno57+pDz5oBEbOH08I3Ow9uoLZ/T7YhsKIm2yjSmyE4+/K/I4xbSRr3AD6opJt9Cjc+907x35BJIfqCIsf9D6u5og+02Q9IZAvZ7IoSyVvtBMU3d+87YAWs9kBGASOx22B27HzH1Q/LVlsCbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CqsIrdGBjKGPG7A2+c9dkfoIZsjNWgoPUATn9f4q8E=;
 b=cf9FPJC7/jqp1+ba8FtQMOBoce/iB1NNcyE1BXWFA4sKlVo/tcUjRfCyXQCO8Z3ynsTkF9npKBv8ThZt3Nqbcacf2hCrSMW94kFg9YwB+DCXmnjw5+HcKUrFTDRbCf8cVyTH3M8TjVROmi7x95kcd9bYaWCjsNSGtn4zXmOlf4dmtTpeu4NcdDrHdDYkTla/9xj6SNIILIzswiMRBxg4oUb4mSk50ZlNZZTbHdHQkfAZlV3babEzasJuvrC1HZQuvtCQyGh8KfBzBr8tlhclnyL4BT/o9f2LXpzQXapgrkZdEPWoifHaF7Yj0ZPiYzaMwKktFGZbrp4C/7fkvT4shw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CqsIrdGBjKGPG7A2+c9dkfoIZsjNWgoPUATn9f4q8E=;
 b=atmT+zTS37W9fP99WCVXoM1gXrJPjDl0dhNu81gzJB+KQqQ2u9CNhQ0HPYHPPggqYJYG7jtP4qD5E3pcMSy6Et227RQT1VPOCojBJyPKq9OuFPHfcAKKCLQtGr4IH2R5GvZbl67BGyVcyoxF5PuEZqyGA39VKSS88hZHEbPxVCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSeTIF9ojrNkXYiNcQzP/lQnVSCDOd3MWvnzknjd55LkQa2sg6xu1ZsoM988uLKrEbEmu5pZq9O2Yo3aFi3f+671+8rhIGJCuWJ9DAm+mHHvqB1QchmnIwT3ykmL9xkIUF1OqD4r6V5B6EpsBK8WoPlP/SA8Dy3UhITrgG1f5RYerh+T7qaCQXQ5gRfswLqpAEYtT7FwzDVc6q86sJHTPLfsQab9mXCwtk8YEuMKDMXJxWtGWQ0y3xgmbsmC0dGK5TiBRLsWdvQDvNJKWHCJdHrMRvN8mhRtPAW6XsRUavMcVWK9Qun5Q9NNJVU5CqomC4LU9yQBDMvld/OZmeIdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CqsIrdGBjKGPG7A2+c9dkfoIZsjNWgoPUATn9f4q8E=;
 b=hmCRc8IT8ajwypnulvJOB6eHIro+fPxJhJ/xZ2mnRA8BhHsKknTU0VFSdU3CULUvr6Gx/EsCt33O9twOBfEu6DGTqx0WC7ketkoXfKXaumf8xav2XWdgKe+/5flY0iBeWSTkmGN49PzPUWEizpJeVZoAZjdj/hrKDdqGSYZcpo/EKZGILJzmOPt+xDxUvQkPIsoAhMlGHgzYZ3W+seq28eR8gug/q8IOjbJwJWrSVpMZLFZEug+k1gVDw/1n9OlXaAjiZoX64GBBjgNev3YhlfzCK/XMqvI14OXDJkDNogxO4a3WaU5WcDTzNr6cbYuQZtuIM9QJI3BW44t0eJdJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CqsIrdGBjKGPG7A2+c9dkfoIZsjNWgoPUATn9f4q8E=;
 b=atmT+zTS37W9fP99WCVXoM1gXrJPjDl0dhNu81gzJB+KQqQ2u9CNhQ0HPYHPPggqYJYG7jtP4qD5E3pcMSy6Et227RQT1VPOCojBJyPKq9OuFPHfcAKKCLQtGr4IH2R5GvZbl67BGyVcyoxF5PuEZqyGA39VKSS88hZHEbPxVCA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] console: Do not duplicate early printk messages on
 conring flush
Thread-Topic: [PATCH] console: Do not duplicate early printk messages on
 conring flush
Thread-Index: AQHb31hHwh97vWYji0Krd5CV3ZKI8LQHBluA
Date: Tue, 17 Jun 2025 08:34:09 +0000
Message-ID: <46A1D85C-483B-4386-91F7-FD59A9698052@arm.com>
References: <20250617071940.10445-1-michal.orzel@amd.com>
In-Reply-To: <20250617071940.10445-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB10118:EE_|DB5PEPF00014B8B:EE_|GV2PR08MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be5b115-a2f4-4e0f-9194-08ddad79cf51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZEFYN0RIRndqUnFESWtGNWhhWmluMHdPTnRLRFYrdE8wRmtmYTBodkUraVV1?=
 =?utf-8?B?TDN4RndNUmlINnYrYkN5ZUs1aHRHOXJOV0NWTXdzZ0h3ZVdJYTRhV2Zad0tz?=
 =?utf-8?B?QzJvN2V2Uk8veG96SkZlcjRaVnJaVTJaTjFNWnNZaTdVM0laTVBwMnpSb2dj?=
 =?utf-8?B?bktUMGdkRDlMNER4QVltU29JNERsVXF6L0l4bG9MSWFZeEVHbml3VEk4WnQ4?=
 =?utf-8?B?RzJwSWluRkRaWDlNTk1WVGRZaHhzNTUzZ1dhL1A1d3ZaYjRyWjA3YTg1TXBV?=
 =?utf-8?B?ZlZzelR5ZlF1UHpMd3RkWHMyc0JZL25RTVFLcXNNL3F2T1dJWEd3TEtFZW1U?=
 =?utf-8?B?OTd2MlZjNXFxOGxraGhmdUdXaXRGTEtKOGpaeTNiSHZxTWp1bDljZndTdjJH?=
 =?utf-8?B?K3lrOUkwVlNPNmRYdmY2am9HaWlNb2VSM3BWMW04N3JFMldzc1kweDdEbUZ5?=
 =?utf-8?B?SjJ0QTBXWVNoUk83VWIyTUMxbkQvRWVFZVdsczJIRHBWR01sYTVoOWczUlpv?=
 =?utf-8?B?KzB1MWZ2Y0RMWDlnaVZseklMb2J3V25iaTJPNEtuWDhWbEc2Y2JZRGNneC93?=
 =?utf-8?B?aUxBQk83NTJGUXg0Z1VqT0duSFROaHNZM3ZXUFcwa0tGUUpUdEdYTEgwdVJQ?=
 =?utf-8?B?UXdwcGd5RGkrMVJHMWJ6N3czZVNYcGtpRm1XbURzZDZBOTUzMjFMVHdpRmNl?=
 =?utf-8?B?dkhZYk1xS2d2bHZhQXFvdnhSZmd1S2tNbGlabVY4M0dSbXcrUHVVQjZBdVds?=
 =?utf-8?B?eEJxUEJyN3hvbm5IRnFnRGlGckxzSlkxQVpJTHBvQTFoOEM3eEJmamZ6TWQr?=
 =?utf-8?B?RFBHR3pqTlZYdm83b0JoK21MM2UvbWZWaFdydGwrZjJtZENCN2JTUTBORGtj?=
 =?utf-8?B?MzF0SnZveEF6TGlXSk1iSzRBK3lQNnk2MStWdDdEeUVSZEh2cWhhNXVDNUxI?=
 =?utf-8?B?czZlVGJUZ2pYVy95UmQ2Mkw2L3RRcHd0UGZLaThSVlJheG5wZnJEYW14MDJE?=
 =?utf-8?B?a3RGYlBZbkdSTGhWY3NPdlRqcmNkdUdDSWtINUVBcUljcmNFR2czK0hrZjhv?=
 =?utf-8?B?U3AycUV3aDVEdi9IOVpvM05aU1RiUGpEOWpPdEVuTmp2d0F6TXVtNitQWld5?=
 =?utf-8?B?UW52QjVJdWV2ZlJ3eEtYK0h4STRUYnR5OUpZVkxscUFCZlF6UU1uc2FsSmZY?=
 =?utf-8?B?WWZDWms2ZUFlQW5XK0JobVhCQThBM3Nud3BzaTVVaStwUXd4OURuVWlSYzlu?=
 =?utf-8?B?WXBPY2xqZzJwWHY2TFVPdjlBaVYrL1RQTEVnUE5jSHQwcS9jSVZSeldaOG50?=
 =?utf-8?B?dE1VQzRMR1JhN3Nkdis5dG5UOWUxYjQ1SnNaUmd1WlRRRExyZjA3amNwdFVV?=
 =?utf-8?B?QnhjVUlXRTZ4S1RsZEdSL1o1eFllZkZ3a3FwVkx5Q1VSUys3VWpRK0pNcGg5?=
 =?utf-8?B?eTlad3MvZU0vOHVwNEQvcnVJMnlxQ1MwWlEzSkdVSXprR1E2cTUzdU4zbklm?=
 =?utf-8?B?VFhoMHJEY2g2Vi82T1NPVEdILzhRMlBFL0k5VkVybjM1eXJnT1VZTkV5eHJI?=
 =?utf-8?B?bVBpU01wbm1UY2NSWGc0Nit3a2JPWFVpYTArUGtSSENtM1RKdkdONk54SWZp?=
 =?utf-8?B?TS9kcjk3ZnlqUHRuOEUxbkNVQzFKZ1M2aVUzU25ObHZMdm8rOTRSdnBuR1Y5?=
 =?utf-8?B?MmRqSkg0SEdKUkRvbTJhczl0VmhUUTVERkF5RzExZWtBNnp2TTJMN2lJYmlB?=
 =?utf-8?B?NCt3VnZHcXVSb3hFaEk3ekpxaFZxMk5saktUSkV6ekxMRDM0WGJUWk8xSW9N?=
 =?utf-8?B?b2dCeGp2WUpRYXNlbkhMZ3Rad0JJMmdteXVITnY5ay9qM2VWYXl5UjBKcktv?=
 =?utf-8?B?eXE5cVZjcGFxQ3l4OU5ZbWlMUTdaeGVFSGpKcnhZdCtJMnEzZnhDcC9YaXNH?=
 =?utf-8?B?Qnp4eVBMWWxjQnhzVWZLUU8xemszVno2VUhscllkZXoyWW1BTUEwVVVXR0FO?=
 =?utf-8?B?RkkyTnRjVFRBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E4DD83C74B3724A8760CD151B15E3C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10118
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60a74e1a-95b2-41ba-885c-08ddad79baea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlErOGFIQ3hFd2FMUnY2K3JCMzdVMkpBcmdTWjNPSzVVdHZNZWFaWTZSUU5x?=
 =?utf-8?B?cE04blhRd3ZJMWhDSTVZT2R4M29FeFhodGRjTEE4ZVJiVXV0d1RlL1IyM25x?=
 =?utf-8?B?RThpbWJzaDJmMFFaRENrcWpYL3l6bHB2RjZ1djlsU3J5SEhuSXpWclJFRkN5?=
 =?utf-8?B?cEg1bVlRanNpZ3VFTmZvRUpSeGdiYmZwMVB0OXljSUZ2NGwva2lNdVNHVFFQ?=
 =?utf-8?B?OTM2ck1kS0hpUHpJaXBxQ0wrTXhGMUcwZDdCSnBYUDVMQkY4elArSkJkdmFj?=
 =?utf-8?B?YnB4Mk1mZjM0RkZ2ajNldWVqMDI4MDJJY01lRjVpUWtJZmtPM09kMExlcW81?=
 =?utf-8?B?UElGMEVvdWR1S2FXaXh0QkxIVHVhYVcrcEVTQUk1RTRraUpnR0RZQytDeGxt?=
 =?utf-8?B?ZUU2RHZXdTBIakhGSHcvellsaGpDclZpUFVuNWczVlNSQkdqNEE3b0tRbHBj?=
 =?utf-8?B?clVCSmQ2U2t6ZjdMNmdoT1Q0UXhyQngrMjcwT2pGZCtGSW9IYjNoYSsrYkRi?=
 =?utf-8?B?OEc1eGFVMHVOY1ByRDEvMGdKSXRTMXIvaFpmUUZ5ZnpQUjk3SiswalI1b0Jx?=
 =?utf-8?B?OVoybjJWeWdzb2kyVmJUZ0MwUUh0cVloVXY3d2pHWCtHSWFzL1FxZjFHUytW?=
 =?utf-8?B?dEdFWmdNYS9hV0ppeTFCQlZBUE4rbGVneXpnN1FHalpmTUI1am84RDVpT1FV?=
 =?utf-8?B?QlFjenBqeDFQWWw0L1NsVmdTK2ZHUTRWRkJjTnkrWm02ZU5tV3ZGSVVMb2My?=
 =?utf-8?B?MmpmK3pMWlUyWGIvTEQzVld6ZHpPck81SWI4V1k5NDdRZmttS1V2Yk1hdWVE?=
 =?utf-8?B?MUxGaVdUZmdYWlRsY0dBRnl5MXdicFozS2UzRktDTU5SeWJ0YjZzSzduL2ow?=
 =?utf-8?B?VXZxSStpWEl6N3pKSXVidFRnRjFZZU1UanJMYXpRcHRCZFMvYlpJSExOa0U1?=
 =?utf-8?B?VXcxZUpha2RBb0pCa0xlREhqQzhQOHVSZngyNkNQTXRicHNDNHEyNXovNFJl?=
 =?utf-8?B?ZG1xUjRYaXFCL2pUaEpkSGVKQWY3NldrQ05rNWRyeWFUZzhkQWJJdi9namhT?=
 =?utf-8?B?UTNWaGxlMk1YaU1HTURvSGdOZkZweWlWNUFZQ1ZuVk5oYUNIQ2JtR2tNam9w?=
 =?utf-8?B?QVd2NEdYRXdYTkRlRlh3OGtmOHpYSWlzUTlkdjBtN0UyOWQwZzJBTU1SODFY?=
 =?utf-8?B?TlRZTFFWZVdob1Jpajh1RlpONGdNN1UvRzhTTVZTK3JoZWpwZWt2RTBPQW5H?=
 =?utf-8?B?cWJmZGc0L2dldTJvd2puZXZRVWlFM2ZjTXJIVGduWW1BdzU4ZExYdEpTNEdk?=
 =?utf-8?B?cExLT2tlem1Vazl4TFZrR3ljdExQMVBFck1wVFA0ZXFuZjNhM3FGS1RmKzJu?=
 =?utf-8?B?ajVoTUlBbFRrenpWQ2hSaDczL3VFbVcxQTRrNUpudXFxb2lUTm82bjMzQko1?=
 =?utf-8?B?N0R3ZHRYOWt2d3hNSGQ5VE5wQ1ZVek9LcjVCRFplV2FDd0NhN0w4YitvTmtl?=
 =?utf-8?B?eWpMYzA2cjZVUThJMk8vSERqb3Y4Wm50T2J0VXdlUk5CWUV5VTVDd3J0djJ0?=
 =?utf-8?B?SmFheFJYNTFTNGQrWW5Ia0M0enA3Qm44YUc1MGxSM3ordWF4dHZpckZzeE9p?=
 =?utf-8?B?amJhdGVhaGIvRHdnRTc0RWthYXpxaXgrd1E1YzdOMG5oL0dXaWRleHNFTnkw?=
 =?utf-8?B?Ym5xaWxNekYrb0tHYmhmTTdDeVhGQXBFR2x2RGRjc3FDOXlSaSsxQ3Z4UHFK?=
 =?utf-8?B?U1RQSTlzQStNbmJUcDRaQkZrSjFGZUhpZTk3eWhNcUIrS1ZpTHppeUpTVTl3?=
 =?utf-8?B?TjE3S3dza2pxOHNEWHpJSG9PMm9VSmpYVmpnN3lPdkJKR0dGNGZzTUdmZ3B0?=
 =?utf-8?B?RHkxN1h4WWhQSGgzMnp2YzNDeXY1ZG1od3BucjB3b010cjBKV3VFMjYyTHVX?=
 =?utf-8?B?dTNyNnY2UDdNb2R2QVNjWENMVUxJNmtrN1NQZERyMXBLMEY5KytjL0EzSmFq?=
 =?utf-8?B?NHlQcFpLY0N2L3pycUJDeG4rdHZwd0QzeGpucXg0dkc4cHl1bWVLYmd1bVJs?=
 =?utf-8?Q?A9VIM4?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:34:43.6238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be5b115-a2f4-4e0f-9194-08ddad79cf51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8728

SGkgTWljaGFsLA0KDQo+IE9uIDE3IEp1biAyMDI1LCBhdCAwODoxOSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBDb21taXQgZjZkMWJmYTE2MDUyIGlu
dHJvZHVjZWQgZmx1c2hpbmcgY29ucmluZyBpbiBjb25zb2xlX2luaXRfcHJlaXJxKCkuDQo+IEhv
d2V2ZXIsIHdoZW4gQ09ORklHX0VBUkxZX1BSSU5USyBpcyBlbmFibGVkLCB0aGUgZWFybHkgYm9v
dCBtZXNzYWdlcw0KPiBoYWQgYWxyZWFkeSBiZWVuIHNlbnQgdG8gc2VyaWFsIGJlZm9yZSBtYWlu
IGNvbnNvbGUgaW5pdGlhbGl6YXRpb24uIFRoaXMNCj4gcmVzdWx0cyBpbiBhbGwgdGhlIGVhcmx5
IGJvb3QgbWVzc2FnZXMgYmVpbmcgZHVwbGljYXRlZC4NCj4gDQo+IENoYW5nZSBjb25yaW5nX2Zs
dXNoKCkgdG8gYWNjZXB0IGFyZ3VtZW50IGxpc3RpbmcgZGV2aWNlcyB0byB3aGljaCB0bw0KPiBm
bHVzaCBjb25yaW5nLiBXZSBkb24ndCB3YW50IHRvIHNlbmQgdG8gc2VyaWFsIGF0IGNvbnNvbGUg
aW5pdGlhbGl6YXRpb24NCj4gd2hlbiB1c2luZyBlYXJseSBwcmludGssIGJ1dCB3ZSB3YW50IHRo
ZXNlIG1lc3NhZ2VzIHRvIGJlIHNlbmQgYXQgY29ucmluZw0KDQpOSVQ6IHMvc2VuZC9zZW50Lw0K
DQo+IGR1bXAgdHJpZ2dlcmVkIGJ5IGtleWhhbmRsZXIuDQo+IA0KPiBGaXhlczogZjZkMWJmYTE2
MDUyICgieGVuL2NvbnNvbGU6IGludHJvZHVjZSBjb25yaW5nX2ZsdXNoKCkiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiAtLS0NCj4geGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQ0KPiAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQoNClRoaXMg
TEdUTSwgSeKAmXZlIGFsc28gdGVzdGVkIHdpdGggZnZwLWJhc2UgZm9yIGFybTY0IHdpdGggQ09O
RklHX0VBUkxZX1BSSU5USy4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFu
Y2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

