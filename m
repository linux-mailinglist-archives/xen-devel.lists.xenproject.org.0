Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDjmNMfdDmoVCwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:26:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9145A3448
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315014.1584908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0bK-0001jK-MW; Thu, 21 May 2026 10:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315014.1584908; Thu, 21 May 2026 10:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0bK-0001gb-Jl; Thu, 21 May 2026 10:26:02 +0000
Received: by outflank-mailman (input) for mailman id 1315014;
 Thu, 21 May 2026 10:26:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ0bJ-0001gV-Tk
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 10:26:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ0bJ-002Khx-9Z
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:26:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0edda4-5cb7-0a2a0a5109dd-0a2a4506cd4e-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:26:01 +0200
Received: from [52.101.193.61]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0eddb7-7371-0a2a45060019-3465c13db41a-4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:26:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 10:25:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:25:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOIkszQepGJy9+wjQCLWmGpQGEvncN5f2Ab+tGaK7nNy5K84dsUjgYpiJrWj04hzagoLX4nS3K16Tmso4pLweFuPoMNiYZ3YsSnbEc8NZ54kX8yCrZEXCT2VNnxFFz6fhq/e7skmiEF5TuB7TpiDMbkaRq85VoOfuwRBB+hVoYkJt6O1V8uKf1n9qPK1nU8rgq0bMI5+S+fQIJQHVNCROhALPqHkhWrR5rKk8dNqQsk6fMFZblDQWmDmPKTzCoeojZwAuZxifSAcl7kRGO1bPSmo6nDhT87jJZw6QOiFga9GEpVk/V1gAVI/ivccTfIIPmEJnZNfG7ukyHKd3hOcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p1cP8Rf0jtNxQWUaM/+nw7md5LuI9LuWQ4nbDH5zWM=;
 b=xqjjd6FtJhoBdA21pW/a+ZsHgO4sqiSeGIujoKnWl+HdAkGfQQWfjh6toVSqZFEsckQZ2F1j1wo0EXKAI9TnmRSUXfxDtyjQllsu1GLmEnACuiexnIyHibKb2YYdTM+w/zqPLpqQ/QljzUwF5zBMqFTM+TXiMLn8Tg6COiGEwrjEeHClOKO1rtqag/BUH5WB9VXArGe/srYDcblKapDhsM1vJ/IMt7M04dax1p+lY4zsGU/4kDsxmnarU0PJSvZ6F3OoRDgpseDk876cnk3XWcquCXazbJxt60bgoP9V64+Ck0xv2UJoVBTkCvb5dScQmFCNP4sThzN7+5XsKclfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p1cP8Rf0jtNxQWUaM/+nw7md5LuI9LuWQ4nbDH5zWM=;
 b=x9krQRqvuBqV5aRPf9bmaM2PKYXXLFt9+JlQqHRzki89iw1O+gYojJ6GEa+FPvVg27rGnv+PcPMCAJXRcdTUiB4+xDHSMJhq2QZE8fwvBK7+Nr9hVeJrBeqeWWeXQX+L5qqJ/BJaFZShSHs7UDJoevkWzYnZPQagzfxg0cznY0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1221af31-0f91-48fa-8928-c59b01608302@citrix.com>
Date: Thu, 21 May 2026 11:25:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: strip debug info for intermediate linking steps
To: Jan Beulich <jbeulich@suse.com>
References: <7a2fb6cc-fc9b-43c1-9f4f-d5a573d52dbc@suse.com>
 <2d995d54-40fd-48e1-90c9-fbf6a9933415@citrix.com>
 <f2d7b907-53b7-457a-a80b-49c393238957@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f2d7b907-53b7-457a-a80b-49c393238957@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c0840e-8d17-47e3-c6cd-08deb7235895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZEWg0AvnCGDOvUkvlJ8w12hmYD/HG6feYFNwNTrCjl2F2ZbDJ1dyJJdkXAciFcEtYgAUQaPIPcdWz73PBgiojwzpxRn56Xh723DZ4I6wi9sB6M9tTsgETaDYWL72NVSYYfMGghgmID+wDvY+tVeoLmY4wN2Lr/r8VCltCrOcB3j9kZQAV0p12yG8jyYkRGzFEkP6q/YDEQ3IhXtfMeIjfIvtjBIGk20Otw5hi5FS1yk9My+SFUr9ZyiJF35KQQMWTR1mPHZaGkQm30FbNH3yOnx7u35/xq/XymMHLTP7R2RJfX4ot/84ly8uXWDANEhFNXagkHyXAIgSNUoG9FkoZtnuLfj5a4cZWTbo2HIHLpYCDsf4SdXhQM8VzOrJBnXZ1i5IeCEirjmyZ4RV5wCQxlUOiUA62W1QKfwsnSyWF6u9Hx2/EF7KG6RDFiN3RBrEYdriicxer6LQqGzp4TfDnZ1bClGtjzkqMP+RN9/rYAyfUEXMYeVVM9bYkX5cSf+xN/P9iI6w8EPkYNPBxuGLxMLNiyQBa2HYgdpDZ4KQT1e+P9KqHzoJHx67VYRxGSQoBgSGXCIyJui/vyBVwNs8QsXR6QYCHZ/88Mu2hNbcOR1jvoF8eMmEhXjrX+fEw1I0QxnbkhxwahaRr/3eixKLpI0ZHQMt8Kn/SOYOb0Nlzo5ZjIwmH1L7M18iIJ2j0C9cvcDdD9jufvN6NGU6YYqxaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1l6U0J1MEVIaFQxcnBqMUU0Nmd6djA0QkFTMkJaMjJyeFpYdWhWdWF3dm9J?=
 =?utf-8?B?bTlmdFlrWUI3S0tnMC9ZWTNQaE8xY2lhT1UwTCtkdkhjbVR1UHROVmZmMlNy?=
 =?utf-8?B?RXJrVEdXVGttTURWWVNyZ3pvUGNTN1pnS0phcW5jSThtQ1liZjNHTmZod2li?=
 =?utf-8?B?dUdBczBhems5WWN2N0lXMHFBcnR1dkx6am5jSDBLR0c0UTFTL1Yxb3ZKS2g4?=
 =?utf-8?B?QzRzNSs4U3BFbjJIMTNVZmRUR25BRjZsd0xWb2syQ1Fvb2ZrRnNDNGVkSFZq?=
 =?utf-8?B?WFBHc1VkaEFCT1hGenkvOXhRRlpGVk11S0Q3NnVYVWNuTCtPQTduRDhBd1JX?=
 =?utf-8?B?a1NPYy9wbnYvc3BLbk8rbzM2NTZJeDVpRnMveXhXcXJZa0o5ZlhvZzdWeERV?=
 =?utf-8?B?b0ZNdVZoM0RYT3p0Ly93bVR2SnB1dk5HVHVlUVRoTGd5ekhVRVBUb3pGa2E3?=
 =?utf-8?B?YmNMOTRyVUVLdGRMMzRodERCM2ZWZUZsM25nV0lTLy9VNjFNSENKSTM4Q1Zm?=
 =?utf-8?B?b09XR1hrUVQzWkVKZURqYzJDdlhYRG0wMHNTOEthSSthQ240QnNzS1JTeWxx?=
 =?utf-8?B?T1ovN1V2WUxWUklWa3c2VUdJVXUwRVEybFJFNXhOcUxiaFk5dktWZWErY3RG?=
 =?utf-8?B?TWlUdWxYZ2htczlZNnJTYWlUcUNKbHFHQTVDVkQ5eVhjdGxKeGlmSlk4YW9k?=
 =?utf-8?B?VkRwaDZEZTVJaVBKbnUyZXVKcEU4bDhOdkJZOXFoRU1xK25RdnhBTWZNak9F?=
 =?utf-8?B?YWNtRGdWR2NrbWdJSlhVd1o0NTNnejRoVTA1eDM0SVM2V2EyNXJXaWs1dlRI?=
 =?utf-8?B?cDBFSkhVdmhJWllaVGhYcy9WbzgvRDIxNVRwZUQzQzV1Q2J0TFBHY1ZRQ0Jq?=
 =?utf-8?B?OEhza0VSQ1FpakJ0a3h0OC81QTJnSlJ6NkZKeW9Pb3QxamlmQ3ZqR2dDc2N4?=
 =?utf-8?B?VzN3d1MwY2FQK0lVbFpKWFk2aHdybVFaZlV1VnJOa3Y4dHlvVHJua2dua1Vt?=
 =?utf-8?B?R3RnT21aK0lqNjBUT2dCVkU2dXRIM1Y2bytMZUdjZUZySFVuVFAzWWFrTmlm?=
 =?utf-8?B?cjl6S1hBVkRLYStkTU1pUitCdDJrLytzNVl5bHJ4SDBCcWk4eGlYbU11SVFY?=
 =?utf-8?B?ZHpxNTE3MVZFc2RucGRqMHpUT2FONGJRMkNKeW0rTUNyZERRR0FoOU1GMCtm?=
 =?utf-8?B?YWMxUU5KTmd6ZDVYdTFlUytjVGQvYjVmVTlVMHJIenY2ZExVVkZoY2Qyczdz?=
 =?utf-8?B?ZS8rS3ZJaWduZXNTUTVIMytFKzJFWjNZVUxSM3Y0Q2x6ZnJQakZnZXhQRjZL?=
 =?utf-8?B?K21DNzd0MXNwRWEyRVFBZ1UvWkFmbUtyUmRPalBqWlJXNm1vWGhyNElYYnIy?=
 =?utf-8?B?d2RtclQ1YkwyQUUxazFHNWxDTWppM1FyZXpTd0oxM1h5dzBWWnprY3NrZndH?=
 =?utf-8?B?bDNFWUFXcFpoU3RyZkF6aDV5Yy82RGJpSEpqTDQwVjZTKzFpWXgwK2g5dWtj?=
 =?utf-8?B?a2tGamZWQnpnd1prRGNITUtMNnBpTVM2LzVVbjNvd2RPRDVLZlEzNll4OWpY?=
 =?utf-8?B?aTVSbE9VRS91RmJpUDVoRlpyZDljODlHTEw2b3AwYnI1bUxKcUhiazNmUUpH?=
 =?utf-8?B?WkJJbCt5OEJJd0l3cEtTMVNEQlVnSjVuRzczWThrMTVqelpISWMwcVI4YUhi?=
 =?utf-8?B?bUg3UXFxRDZtclUwMGlkMnQzTk1FYTR6WHA2VzZUWVlLMGkza2YrbjVvMHNI?=
 =?utf-8?B?U2gyOVRWZlgzQkV3dlFhNlJqblRJWVdLbEZvc3NZcVp3ZEpnL3lxK1VJdktO?=
 =?utf-8?B?RlNaakYyOFVXT2dOcDU1SENTcmVxRXRmOUdDWGlheGwrSFRPN2lUcUNhaktC?=
 =?utf-8?B?NnpzNXJ2TTNiT0prYng0bmEvQ1grcnBWRFEwVnFJRGg4UG5jMFRXc2x5NjN4?=
 =?utf-8?B?bHZDMzVhQ3VnaE9wSDNlMmc1ai81N2loV2VhQytkZkRJSm9ZTXFyRU1Dcy9l?=
 =?utf-8?B?VEZlVitOd3JXbmIxYzZueHNiZE1XUUQ1dU1xZEZnVmhrVnRHWUY2MDlBeU9E?=
 =?utf-8?B?cFp4MmZWeUFWbDlKelpyMXptaGViNjNyQ3VPSW41dTczbEVYQkFrcjRMZTJq?=
 =?utf-8?B?ZVNHZXc4ZUN2U2hTUTNWL2F1cHNpYi9mRjV6WU1NZ0YzVldhYXRMR2ZObE96?=
 =?utf-8?B?RytYZUU5UnFxcThpQnp1VTFtNUpkaUc1Q0p4dTVvSFNUWGlSUzUyZDBRek1r?=
 =?utf-8?B?TTZISVRTN3pSZGJab3hwalVnSkVXSmQ2aHFxeWZXamJtWEhJRTN6QUoyMm11?=
 =?utf-8?B?cVZ5cW4vQi9obG5lSnRrZVZTODdHVStOcmlidit2M0lFcm8yQkNRc055WFNI?=
 =?utf-8?Q?nPMlwAuA2QWh7FFo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c0840e-8d17-47e3-c6cd-08deb7235895
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:25:57.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9ZLOoCCaQ/2oYUr53GUK6UfKt/WjF2eYS8jJGl8SfbbSwM5rmPqG6PNluyW2FWUDQUXPPG/LeljjKiKMfZGYFvUSXf+gAJV015kZiEd/Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-16d1c6/1779359161-8EB8BD75-2321C54E/0/0
X-purgate-type: clean
X-purgate-size: 1968
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,gitlab.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C9145A3448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 11:23 am, Jan Beulich wrote:
> On 20.05.2026 14:51, Andrew Cooper wrote:
>> On 20/05/2026 1:11 pm, Jan Beulich wrote:
>>> Linking debug info takes time, especially for xen.efi. At the same time
>>> symbol table contents aren't affected by presence / absence of debug info
>>> in the linked binaries (the ELF and COFF symbol tables would have extra
>>> section symbols, but tools/symbols omits those anyway).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> The main speed gain is from xen.efi linking. Therefore I'm not even sure
>>> if this wants mirroring to the other targets, where only xen-syms is
>>> produced. It would mainly be some transient space saving there. (It would
>>> perhaps want retaining when the linking steps are moved to common code.)
>>> Thoughts?
>>>
>>> On the system I measured this on, "real" time went down from 4.9s to 3.9s,
>>> while "user" time went from 7.8s to 6.8s (all approximate values of
>>> course, as there naturally is a bit of variance, and all for full
>>> incremental builds with no other changes, i.e. mainly the final linking
>>> steps getting carried out for the common/version.o change).
>> If it saves time, then good; this will make an improvement to my dev
>> cycle.  How does it fair on Ubuntu 16.04, where we've other known issues
>> about the debug symbols appearing to be corrupt?
> All builds are green in
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14480259043.

Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
>> It would be nice to be consistent across the board.  If we're going to
>> make linking common soon, then it's probably fine, but this does risk
>> becoming yet another mysterious difference.
> Well, I can add --strip-debug everywhere, but it feels somewhat unjustified.
> Except if we take the disk space / I/O reduction into account.

It's mainly a guess on how long until we unify.

~Andrew

