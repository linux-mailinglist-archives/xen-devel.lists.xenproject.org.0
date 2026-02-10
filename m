Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJDWOSlbi2ljUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:22:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645C11D146
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226645.1533163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqUo-0006DV-97; Tue, 10 Feb 2026 16:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226645.1533163; Tue, 10 Feb 2026 16:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqUo-0006AK-5m; Tue, 10 Feb 2026 16:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1226645;
 Tue, 10 Feb 2026 16:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpqUm-00069o-QQ
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:21:48 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98ba3cb9-069c-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:21:47 +0100 (CET)
Received: from DUZP191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::24)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:21:39 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::d9) by DUZP191CA0049.outlook.office365.com
 (2603:10a6:10:4fa::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 16:21:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 16:21:39 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB10402.eurprd08.prod.outlook.com (2603:10a6:150:15d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 10 Feb
 2026 16:20:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:20:32 +0000
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
X-Inumbo-ID: 98ba3cb9-069c-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y0WLSR6trpH6mQj+hYCCYmfTyIZi5eOdmT65qzpiXVstDriuqH6Mo83tqWatUFGEQMDcahdV2TOgLXjIxx18kXvlSv8BEmuqcM/SuOgl8bxPuEtORnTWKmQnQhc3QIzhHyswzrbIOXnvcg5nRLTVAdB3o8NpNnO5kHrRxAI9AVvN3YhpjiHtIbuTPTpaMaF0kNMPmjXiR+wRt6oApYVjcjCtXiYydx+zIuXCb4hYQCw8bsdBIS1X7ZQgSqyDXSkxZm27k0iOpbxx/1VpT/Kn73bCZUiE8+5xJNf35XYCzPtU/Jvqz/Blcom91jm9VGv6fNZZA9xkWXvhQoUidrEODg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMdoimyC4nMbT+zUkxxxLe5Fsxq9SjQQ8ubcb2Hmxsk=;
 b=VRBoea16/JB9rIj6fpi6c9/oTu1oMLtXyG/FnuylmZFyQ/QE47fWoUvllwwq35rwuGepaPxSj8+TC+V2PZv3xWasAD3rVyp88Rp79c4LXuCNwYgKLNUq6jb9AisXyW+M86e8WcXiXDOpuhtirTfPN756RaWk76+g7OnBxTmHxinsxvsXCXnsFtcYPb5m3fnhjYu4hS77ckR9qtXimfhVZmx4kh8w9/8YqicHFRj9HUPG2YgU3RVd7QbkYfXsT01veRuOc+6ZFeWNc6BcOVTwIIlzJ0X83fbSfq4AZrhmQV2a4m+VAEZt8XZFwProwUpsdbzc3K+49uqQJ8H3M8J2Pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMdoimyC4nMbT+zUkxxxLe5Fsxq9SjQQ8ubcb2Hmxsk=;
 b=AemnQ8R06aSToAR//EZQz8Oise6QkIuCzD7KTmABRy7GWwIAegXYCPMaoqTI72tWlU1tY52/OjPgU0XJD5GTBilSBMSINmmbe2xKSo9CSJLU8uSUFA0M4okRjx1IpTWwrKltpCaXWkLyi8E8s3ETJb0wPlME9YZct/jMqGwkYag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIiMSrMl+3UqEHZ8Y2YL/N4i/AWeiS8rAUUwqXyNo7EJdioPOwDA3m1L3FOZNuaiIKl/fcUo1apBL68nCbzIc0QxyL2dKBYmIt8mLTinXK0wqu1AiVXUtl92PiXECRl8b9cPTgL/+Kw4dYsHVXiqVyYr7V6ztzWVM+p3VjEY1Vs8DXzvkGqzQQV77imV///8aEFQbDH1NZCCX/IwuvUiZHIemRnEF5Y8E64WfBiQPhdqhTOQS3owcAwC34O6HuK54H/vbHD7HJA2Jrm43DVqTL4WIYs+dUMzq3hwFw2W8KZbWg8cEJde5FEqhEJvniNJ7wz0aJIAJZ0AcryBaAiKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMdoimyC4nMbT+zUkxxxLe5Fsxq9SjQQ8ubcb2Hmxsk=;
 b=kXZXvvWGuUqC4qOmuUokXrcD54yY6LNSPDTUNAeVqy7Rr04uuJYnP0Rs41vG9t22KuOAS3T0x53dW2bh2bqcF3iRBEH5xdwn1RV52ZJCORE6SqfR0C6M9EOHm+inVv645Nmmpo8bqfL30UWK44ygAPkmZ0AQjDlq2AwvYemyJRsH5KQHwWj/Xd0OsRD6SDWvPNGiArejx1lCwAxp8DjA+I2Mv78GF+Z7LcxpNkos01NvDyVCJsi6IYX4p4GvrDqcS2SCGDH6bFMLLIveyWREgR2+YwNYbh+ex4Wc1Cu7K4J0TnYtUJwCBdlFIJgMAKMSMf+2Eu/TQj9yWab1ghVj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMdoimyC4nMbT+zUkxxxLe5Fsxq9SjQQ8ubcb2Hmxsk=;
 b=AemnQ8R06aSToAR//EZQz8Oise6QkIuCzD7KTmABRy7GWwIAegXYCPMaoqTI72tWlU1tY52/OjPgU0XJD5GTBilSBMSINmmbe2xKSo9CSJLU8uSUFA0M4okRjx1IpTWwrKltpCaXWkLyi8E8s3ETJb0wPlME9YZct/jMqGwkYag=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Thread-Topic: [PATCH] xen: always consider '/' as a division in assembly
Thread-Index: AQHcmp+J15vvFrxtUEGxE7lRiZXN1rV8EwEAgAADNACAAABcgIAAA2IAgAADHQA=
Date: Tue, 10 Feb 2026 16:20:32 +0000
Message-ID: <5A9C90C3-47B2-424E-A2CE-3B010DC5D8DB@arm.com>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com> <aYtVBuHVcfZE-L-a@Mac.lan>
 <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com> <aYtYKlcoVAFvn8jh@Mac.lan>
In-Reply-To: <aYtYKlcoVAFvn8jh@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB10402:EE_|DB1PEPF00050A00:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 450868ff-1c91-4535-9afd-08de68c0783a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WFpuWWcwNWxvanpibEZOeXg0dnQvcWRqcUdMdjBLcm1KbWErRjZvbEFlTG1a?=
 =?utf-8?B?ZzBMcGp0NWV3KzVPSGlpYlkwYmlud003eFd5dkV4eGFKeHFheFlhQyt5WndQ?=
 =?utf-8?B?ZnZkMHRiRHVBY3RaNnF6R2lHODhDaE5LMGdtOGZwMWc5RThycmdybEkrNGpK?=
 =?utf-8?B?M2o5eWFMazc5cFBFUStsUllPb1NjZEV2dVVQM0EvVEV4ay9zemVYbjJmaWN0?=
 =?utf-8?B?dTliOWZEbGJGZWlZdVIwSWNhNEJlS3NldHVoNzl3RjJRUC9ray9PTSs5S0dJ?=
 =?utf-8?B?Qm9NQ0V1am9UaGh3ZzEwMjllSHRWYllhd1hqWk5NTmQ0OTZaZ0tvVkdIblRz?=
 =?utf-8?B?blZsSm5qMWsrc3RyM1VxYUtIQU5iYVpraTFBRlJWZTVZSlc3c01wNUVORjJJ?=
 =?utf-8?B?ZGZXNnU1a0d0ZWFhMk5UbW5Cdm0vMm1MNm90SVRqeEpIM01kU2srK3ZKU2lj?=
 =?utf-8?B?dXozc05FQ0hVYXlrd29VNnl4QloxQjlrcEwzQWt0dytKYW41aTZhbWdneTRV?=
 =?utf-8?B?L0VGZWoxbmlYeC9QSGFJZGFoTFgxTkczYjk1M3BtYWJ1K3JCQUZwaHpHWnR0?=
 =?utf-8?B?Q1RzZ25TQ3pWSEhNVVVyVTI3Z2tJS1VnK0l0SC9mZFo4KzRQTGJpNVlyUGZP?=
 =?utf-8?B?UjVpcmswaDZ1TktnQUpZdUFiOGswOXIzeXY5d1gxSEp3T2Z1d2VHNE55bE9I?=
 =?utf-8?B?ZXRsQklqVWJnZmg0RDhZc1JBNkVrdnJRNHRzcmZKRnh1YmdwRmtrSTZ4UGdF?=
 =?utf-8?B?T0VpRHBBeTAxdSsvZjVTNmlCWFJUbktJQmY5V2NyUEJzTDZ2eUJuSEZiU1Rq?=
 =?utf-8?B?eDJSUFFtSHlWNlVzTjMyUW5JYmpkV1pGdTdpVnNJc3RINUFray94MW8wWlZ4?=
 =?utf-8?B?L01jQzM0S0diaXUvaEF5RHBiUHJaOC95NHhjS2ZVa2lKbXNveG93N3dkZk9q?=
 =?utf-8?B?SSsxVWJOQzduTFR5SWgzSEtwYTlDaEVvTTVLQXMyeFNVUXdsRTBDa1NpMjhv?=
 =?utf-8?B?QkFlSW9EWkFGNUkvelBuZVRocHh6eVR0bW5ReG5PelRUQ2h1cnZVbnNIUzFN?=
 =?utf-8?B?dmNleWRQTjlIOVRrVk1XSEp4QjY2S1B1WSt0YUg2R25EWXhUYXhYeDNOVlE4?=
 =?utf-8?B?T3FTYzNFY2lXWnYyMVh0Qk5qSDhyQ0p3ODIwM2JYbnNQekxrRGZFcytxQU00?=
 =?utf-8?B?QSszTnhyWm4vUW4ySEV0K3JJekJGTWxPM1ZXYlBoV2xnVFRUWVJORjJCYUpy?=
 =?utf-8?B?dGVqdndzaWY1MjlHdkwwQjF6N0xiYzFPOWkramVtaFdVU2xyMSs5TCtyMTk1?=
 =?utf-8?B?bmt2ZWpRcXFEQ1paZGlSK3JKQXNIeGlJTVVuU3VkNHAzMnhsbWs1VWhFVVpU?=
 =?utf-8?B?dnQ2cHZvbUlGaDA5cG1LaXJ4a3dkU25meWljU2dWMWhETW1xWEpGeXpaaXhI?=
 =?utf-8?B?V3Nhb05oYXVPZURnU0tzdEU1dno1eGZmSFA0U3pqRjFvRXhYZFE3K21XVitO?=
 =?utf-8?B?Y1FWNmpKZU4yVzVWUnNrY25GR2gydnVTQzcvcnRpNTJLS0p5eEpXaXoxWngr?=
 =?utf-8?B?WS82dFVOUVV2NGwxNEdsVHV1U0Z5U3hreDNPTXFGNWJuaVRWL3JHODBhWXNq?=
 =?utf-8?B?eHlka1hYZlJxQURlWDdBWEhuQkR4b2ZGdUl6QzZLTGpYL3JTRWkydU9FcGUz?=
 =?utf-8?B?TEhpVzVsanQwNElhOGZOSGxxS2tqZWFYcTgrZmcrajRyeXZaelM1YmREajVp?=
 =?utf-8?B?OWc0bTR5NjdnTXNQV1p6Qlk2MFF2NWpydUVNejlFa3UrR3ZkOHdBdWlVOFpI?=
 =?utf-8?B?bCsyOVEwNHdsS01JS2hEeUtlWURzUWJyc2xvZWZjU1dZci9tNnkrclNtYzQ3?=
 =?utf-8?B?NlYwU1JWcWN1b2pzOFJiajBCcUlyWVpIaXV5MUtSWFpWTTRESi83SFBmQkwy?=
 =?utf-8?B?Vmt4OU5wN1JhaTFGSGtLbnBOU3dRM0xKdFZzeFlDSGF2Rm9uNDlXQ0FxZ2RP?=
 =?utf-8?B?ang3YWZuTTlqZDVNdlZTcEk5TFFGcCtENisxcmt2TjV0ZFZNM1RGL2hVZjdo?=
 =?utf-8?B?RlFpdlBQcWtSbnRmVi9JWkIyYmRtdzMxS2x1Tnc5WlRLRGFaTW9VbTgxcHI0?=
 =?utf-8?B?eEcwRllMTzB1b3VlTzR1MUp2RCtJN3dxWncxbktpZ2grNG9pbUVwblhQSjg3?=
 =?utf-8?Q?9fTlYR+aELr4n+tlTeEcDd4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <441B117BB356254DA59F667672B890BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca63bc61-2ac7-49bb-e994-08de68c05068
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700013|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEdoczNWTjcyR3ZRS1hEckFuZllwZjJrNmtESkZFbXpqcDJ3K3VNS05aS1RE?=
 =?utf-8?B?MXVlL0dKMzhkVmV2MCs5UnRtK3lhU2pZUWZDVGMvTmhYc3Z5ZncrUkI3ckdj?=
 =?utf-8?B?VDBxWjM2NWdJU3FtU2IxcTFtZE1PeFpQTnU2cEhTSlgvT1J3Q2c2aFBobTgy?=
 =?utf-8?B?UUhsZThNdHlFVndUY0t5aTJ3dldnemxFYTZkdmZYOEIyK1NQQjZKUkthWTZz?=
 =?utf-8?B?UU0vYnJGYmVGcGliL0g2b1p0RENDazhqelBDa2lRWktJMzBZaVd1QUxwZHZO?=
 =?utf-8?B?NjUzZVNVVkdubHE3RmRuSlkyaVJ4alpSc1hDTkEzSlY3QmtDNUNxOEJuSHh3?=
 =?utf-8?B?Vm8wOTNlY1RNQWRhKzVQd2hyak9zVWpZUFU1ZmtHQ1hHZFVMU1VWTTFkVkFH?=
 =?utf-8?B?eklWTVVwN0ExU25tc3ZKbC9ISXhBUm5hWG9uaVdVWHdObHRoVFVHNkg0Z2pl?=
 =?utf-8?B?U1F5YVZaSG9QcGh6SUFzNUxiTjU5SmVpMXJQaURvTmgrTmwvaE42aVg5K05O?=
 =?utf-8?B?c1YrZXMySSt1ck1BRXVRcVFQZ0J6R0ZYZ1ZIT0xkNURodGU4NHVIVlJ6NUc5?=
 =?utf-8?B?WHkzZExTNWZtQU05Z2NXNkE5aEVkYUdOMTJqZHFFWFZ3UnROYXQvMnBsYTky?=
 =?utf-8?B?M0k4NlhmL2lHY0x5dTZHYk5hSHpmbzFOVktaM2Fod1VVZlp5cTNjKzJObU5W?=
 =?utf-8?B?c0hhUldGRlV0bmxVTmUzUnpTby9rbU83bkwzNWMxR2tuQXpRQnk4amZiTlh0?=
 =?utf-8?B?RGhvS2RMUkxDZmVKN0FDbldHTm41bklsSHA0WmpZeU45VHg4SEZkaGk1NkN5?=
 =?utf-8?B?eTIwd1lBcmV0dHRGOUhkZkptSUsxUzIxeTZhSmEwSHZ1YncwK0ZpMkF2dTBG?=
 =?utf-8?B?OEtsNklwdEk2cktNSitraFo4VlRFU3hWL240VUxGT1lQd2R6ZG5WbUFZaTR1?=
 =?utf-8?B?T1FZbnFNN0RlN1BxZmorZVpmZXZRajZpWktZbDcydjdHZzZDYTFOSDlpd2VO?=
 =?utf-8?B?dXhHRG9BQk9STU1tdVkzUldzSnp1WXhhUkZWSUIwVG9uckZiNjZ5Z2dkUnVZ?=
 =?utf-8?B?QllLNjI5RnZSSVpYVGJHTVFNV3crNnRXR0lWTVdNS2pHV3hkZ3RRV3VhR3BR?=
 =?utf-8?B?SUx3WkZIM2cwQXBsSFE3RU02RUVta2tFUjQ1cnlrWkNZSWFDajROSlc1VWpY?=
 =?utf-8?B?VlZVYmZnL2J4c1pySk1hV01LczFaeTZ5ZG8xeEJ5RmFFQWl4REZvZG9lL2p0?=
 =?utf-8?B?WkF4NVNiS0ZWbnhiLzRVYk9XWTZIczY1MkEycDcrUnd0bmlCTDFFQTBEam9U?=
 =?utf-8?B?K2pEczdGNTRGRHZHY0tTa3hKcTdHSm1DZit2NmdxblBGV2M4WDEwcXkxM0tx?=
 =?utf-8?B?aWsxZzg4cU9BcDl0eDgzd2N4enFxdkRBYlZ1Y0JrRk15Z1pxQjZEVjArclAx?=
 =?utf-8?B?Mk9lTHFYdm5pYWVYNmYrMG8wbnlFMzcvVVpZdk9MYVJpWlZLWGZVSEJiTXVG?=
 =?utf-8?B?WkQ0dUtDa3FSSmlnRnRheUFPTTZXVWg1R0JBYjVUV3BTU2x3d2czZjE2a1JH?=
 =?utf-8?B?TVNtU3plVDMrUllkTXZLcFZjQXM4N1VCSGdKdHhuS3JWRy9EVkMwNkVmSG11?=
 =?utf-8?B?UEowbW4xMW1zOVhUSTl5RFVnM0pDQUViVGxpWThOaWs5YW9ZTXNaTnB3TFNi?=
 =?utf-8?B?YVV4aU84L3NuelRGSjNISVRFUjBBL29xQlJPR2thMmw3QVJCOUV0VzNGU3Ft?=
 =?utf-8?B?ZDBraldvMWlHN0NYTXJzcVhWbDdpdTM2V2FnOEZKUDhpS2ZDWFJvUnZIY3hy?=
 =?utf-8?B?UmN4b0dvSTdyWnJFZ3daRVh1cE8yQXZSaGF4SFREdC9KemdkSlUvQnpabnBG?=
 =?utf-8?B?TWNCaGF1bVE0Sm9GbHZFY01IWnRkVVJqQU9FZHczTndKMmtmY3NabzU4NmY5?=
 =?utf-8?B?N1NkOVFXR1NVY01kcG9TaUdxSXpOT0U2RXRTeERkQWJUZGFrN2tzT0cwSU90?=
 =?utf-8?B?STgyWkc4VWtRZXQ5amdIY3F1R1UxY1d1MkVMTStnZXpsTVYxQUZQb0Vqb3I1?=
 =?utf-8?B?MVZ4YlV3enFYSWhxa1cvbXFKMTFaSVhySnNiOHZhSVdIMDBVRHY5bUVsdWVR?=
 =?utf-8?B?ZGRodXUwL0pKSzRWRUtlZzRlbVBCNjFUMk0ra0c1Z1gwd3VaYlU0WUVCT2tB?=
 =?utf-8?B?T2ltY2EzSWIxand4cTM1SnZ2NkhDL0p3TkN5Zm9WanlQY29Cb2FVMkFPVlUz?=
 =?utf-8?B?Q28vZVpIN3VOelJFNEdXWXZRcURnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700013)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	geBby6BRLQn+rc+GLPjZSrmI7YxUCmoy/K6w96u8MfgkWbCZaAXizZ5JkqXIXqXGIQzVDGZr9lv9cJ+iXEuRS+aqqk97dKgTjc1bw73C9CXCNCjGzE68C1IN3+Bc5exleXkqsiM5VeBQq/PynCTmsjc9dKeaBc6ICgAnjsvE77Bm7tXs2bBNSkp6XAjgonhJjviHPYDyfProz94jvSj+rMFpl0KrRGSBSy5aDogAHLsH7M1ibPn/c6FkXEC5T0dalrZ2Iw262lOakyJ2mh78YdhcbESkLrHy0XEb82vT1OX97g4UojZxKJ610xqF+EMeZx+yCVqDNxVNLUaeI0Y1TLRTjlct5rxjWXz040RYaPFGpkMN1lQcJvMSSUN+VlTP9VjQuD53PUTqzULPXkWxc5V7dqhblIFu8r6DPOSSN+e4luPgJhW2nF+VZ/KuXIww
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:21:39.2338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450868ff-1c91-4535-9afd-08de68c0783a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3645C11D146
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTAgRmViIDIwMjYsIGF0IDE3OjA5LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIEZlYiAxMCwgMjAy
NiBhdCAwMzo1NzoxN1BNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXINCj4+IA0KPj4+IE9uIDEwIEZlYiAyMDI2LCBhdCAxNjo1NSwgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgRmViIDEwLCAy
MDI2IGF0IDAzOjQ0OjMzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhp
IFJvZ2VyLA0KPj4+PiANCj4+Pj4+IE9uIDEwIEZlYiAyMDI2LCBhdCAxNjoxMSwgUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEdOVSBh
c3NlbWJsZXIgd2lsbCBjb25zaWRlciAnLycgYXMgdGhlIHN0YXJ0IG9mIGNvbW1lbnQgbWFya2Vy
IG9uIHNvbWUNCj4+Pj4+IHBsYXRmb3Jtcy4gIFRoaXMgaXMgaW5jb3JyZWN0IHdpdGggWGVuJ3Mg
dXNhZ2UsIHdoaWNoIGRvZXMgdXNlICcvJyBpbg0KPj4+Pj4gYXNzZW1ibHkgZmlsZXMgYXMgYSBt
YXRoZW1hdGljYWwgb3BlcmF0b3IuDQo+Pj4+PiANCj4+Pj4+IFRoZSBiZWhhdmlvciBvZiB0aGUg
YXNzZW1ibGVyIGNhbiBiZSBhbHRlcmVkIGJ5IHBhc3NpbmcgdGhlIC0tZGl2aWRlDQo+Pj4+PiBv
cHRpb247IHVuY29uZGl0aW9uYWxseSBwYXNzIHRoaXMgb3B0aW9uIHdoZW4gYXZhaWxhYmxlIHRv
IGZvcmNlIHRoZQ0KPj4+Pj4gZXhwZWN0ZWQgYmVoYXZpb3IuDQo+Pj4+IA0KPj4+PiBUaGlzIGlz
IHNvbHZpbmcgdGhlIGlzc3VlIGFuZCBJIGNhbiBidWlsZCBmb3IgYXJtIHdpdGggd2hhdCBhbmQg
ZnVydGhlcg0KPj4+PiBmb3IgeDg2IG9uIG1hYyBvcyBidXQgaXQgZmFpbHMgb24gY2hlY2stZW5k
YnIuc2g6DQo+Pj4+IA0KPj4+PiAvYmluL3NoIC4uL3Rvb2xzL2NoZWNrLWVuZGJyLnNoIHhlbi1z
eW1zDQo+Pj4+IHN0YXQ6IGlsbGVnYWwgb3B0aW9uIC0tIGMNCj4+PiANCj4+PiBZZWFoLCBJIGtu
b3cuICBJJ3ZlIGZpeGVkIHRoZSBzdGF0IGlzc3VlLCBidXQgdGhlcmUncyBhIGZ1cnRoZXIgb25l
DQo+Pj4gYWJvdXQgYW4gaWxsZWdhbCBiaXQgc2VxdWVuY2UgaW4gZ3JlcC4gIEknbSBsb29raW5n
IGludG8gdGhhdC4NCj4+IA0KPj4gTENfQUxMPUMgZ3JlcCBpcyBmaXhpbmcgdGhhdCBvbmUgb24g
bXkgc2lkZQ0KPiANCj4gSSBoYXZlbid0IHRlc3RlZCB0aGF0IG9uZSB5ZXQsIGJ1dCB5ZXMsIG1p
Z2h0IGJlIGEgd2F5IHRvIHNvbHZlLg0KPiBXb3VsZCB5b3UgbGlrZSB0byBzZW5kIHRoZSBmaXgg
Zm9yIGdyZXA/DQo+IA0KPj4gd2l0aCB0aGF0IGFuZCBzdGF0IC1jIHJlcGxhY2VkIHdpdGggd2Mg
LWMgPCB4eCBJIGNhbiBmdWxseSBjb21waWxlIHg4NiBvbiBNYWMgb3MuDQo+IA0KPiBZZWFoLCB0
aGUgcHJvYmxlbSB3aXRoIHVzaW5nIHdjIGlzIHRoYXQgeW91IGhhdmUgdG8gcmVhZCB0aGUgZmls
ZS4gIEkNCj4gcHJlZmVyICQoKCQoZHUgPGZpbGU+IHxjdXQgLXcgLWYxKSA8PCA5KSkgYmVjYXVz
ZSB0aGF0IGF2b2lkcyByZWFkaW5nDQo+IHRoZSBhY3R1YWwgZGF0YSB0byBjb3VudC4NCg0KQm90
aCBmaXhlcyBzaG91bGQgYmUgaW5jbHVkZWQgaW4gdGhlIHNhbWUgcGF0Y2guDQoNCldpbGwgc3Vi
bWl0IG9uZSBvbmNlIHdlIGFncmVlIG9uIHRoZSBzb2x1dGlvbiBmb3Igc3RhdCAtYy4NCkkgc3Vn
Z2VzdGVkOg0Kd2MgLWMgPCAiJFRFWFRfQklOIg0KDQpUZWxsIG1lIGlmIHRoYXQgd29ya3MgZm9y
IHlvdS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQoNCg==

