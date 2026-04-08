Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIPBEsIz1mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:53:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC43BAF97
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275691.1561448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQXK-0008RC-8Z; Wed, 08 Apr 2026 10:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275691.1561448; Wed, 08 Apr 2026 10:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQXK-0008Pk-5h; Wed, 08 Apr 2026 10:53:30 +0000
Received: by outflank-mailman (input) for mailman id 1275691;
 Wed, 08 Apr 2026 10:53:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAQXJ-0008Pe-0h
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:53:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQXH-005Zbq-UD
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:53:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d633a0-e002-0a2a0a5209dd-0a2a450295dc-20
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:53:27 +0200
Received: from [52.101.62.39]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d63111-42fa-0a2a45020019-34653e271711-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:42:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6520.namprd03.prod.outlook.com (2603:10b6:a03:394::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 10:42:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 10:42:23 +0000
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
 b=vM1OICFmyp+uPZWpAxQqdLCDyugWCFbb6hBMyifO6gkF7nycnrYVkpU+4ZvvJZf43PMZmUgOuK3GVkifWabnwBb4oDdt5cJ2oCZAuMLDPk7Bj1VqVEU1lpsZyCNhBScYz3Sn5DO060maPN7wCAC4B5I888t+LwLzb5J3zF3BygYOiMrBJd79Er0MvcjJflBBR92SwXDTbHKh35slE3rmyN1X/kJMPye1OSKj0whstZS91H2FhMUf61+skNKIhN7o2DlrHwvQ08D0y4lbMRLyyh9TrZSO2ISkQdjA/WXjK/ZHxAWDvvYwo1PGVpfaMi1NHV/upQv46llkYTi11xv7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grxqa1yLMqOmik0XxpmDAOQUuYcxU2vGrAB6N1h61z8=;
 b=zRWlZ3X3RwDdZWUTXZpW4km0+sMe3k9itWUUybV9Fr2BKdm70FGAMbgbMu4rh2mELUafP6beP/GGBQeLq9RcKTEMf6K1I5S3CbDa0CWMXWk8whNWBX5R+F6+WIduYiaFdkZ7WN1X0F4yVPszmvfyHdD8XBnHCHkJW2wt3TzPfPbsimsc2g8+wAMa0nHXY62MCdD1VJfVH3uNY9kkhaf0YWp9KgEh6joXjUX8xfaF2gnbdKEISCHY8ZJnAvZX/skrCOq4m0gotymjwza1pnSDZrVa4OOaEX0gm9mXrFq2y5SarqxECDUyCACClPxQ9MU2E0+URyutYXlWuQNOku8TAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grxqa1yLMqOmik0XxpmDAOQUuYcxU2vGrAB6N1h61z8=;
 b=Yha45NmCiK+yuOcFRl8dMnWO4ybWmvN+FmxVATLve1nHphmdvb4Qg0qSkdN1eGP8D8PdMj80F4iRNkOlqz4CW1FaEqDAhn+SIoFzLAy1HNHUg+I0axExbml3bLUxFrs/WVfaXmLXakRAEUwO2ugTntkjHCO2NigAN3JZh9uIgmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf083203-7258-491c-8dbb-6ffe62418811@citrix.com>
Date: Wed, 8 Apr 2026 11:42:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
 <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
 <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
 <7fbcb3d1ccdcf6fabb45f5805b504096@bugseng.com>
 <18ab9849-f525-46cf-a244-d8125bef1655@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <18ab9849-f525-46cf-a244-d8125bef1655@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 13586c6a-7f8e-45fe-7c02-08de955b84ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ttPzwFcVBysKGRX1SJg2B+4GLRiieBvQQgrDvNXAgwmPyDEQGnFhr3ESQZeMv81iSfi9nJvxzwcJ0QJKINE8HAymnfF52n1n4VgtwYnOjyTM3xh9xtth0YYK8Hjr4aJ19Eo0xRHi/DLRl64OHPxqknUjeQTdB/0qB3Q/jbIlGBCL0K1U7mm6+ECFWSIR9P+cYoOo33wwounS0NLGW6fZhh+nLRsWQusUTJGhPNL3/ihg6mkkU3QArbbpbXxd0sf7E6jmXxrnMiYdLnf5eoJNFDHlnN+pHDs/UBbFu8j0fJ/Sn2EAHOf9QSxGCjRhQPPdbQL4Zhv9ul8V3nMOG7fBBUQwKT0mkLj2BPEMFIv45XjB3S/HxN2o3sQQM6y3Vn38C/GvHkhEPx8catX+tUGgJ1eVpfj7mr76q+/PimaoEBElBcWwXVj3PxTzlpax6ui7SFe8HfZMT803IjQ/9NcpIlQ6tmXT4UZepReZZ7577ZNf7mOhUJqOBgh1D5dQ3zEhfAiqsHwCxF4ElVyobyO+07145gVd2AmX2eWhOEvMT3JdBQeryqJrtl5GM/VgRYHDHy9kSLoLg4v+CEAMtcDivuhzOqgjqwhTBWW0XQN0YFrJGFAWV4Qk+H1csb84SQCo2mLaSogRNK4TPpic95otAS7GXkzw0BNzaPuWVe+3ILgpFmpVEPeXUPmcqyBJEZ+Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BYbUplQlk5T1lCSThhODhOUVZYcGVJV1FnM1NDZGVqZEwxaTlnWGZtTzN5?=
 =?utf-8?B?c1p6ZlQ2bk9jSXNlRVppRTFMQzlqemhPbU1DWUlsSHpaVFU3a2VBeUVsU1Jl?=
 =?utf-8?B?aXBpMDFDeEViQllJWVBMUlJJM2E5L244eWlqQ2xFc1oxeHE2WitTV2tTQkg3?=
 =?utf-8?B?elNUOWJUM0J1SUVMU0ZIYjBmdUxDYW9MVExkZjNINmoveWNsWGhYWjlPTVdH?=
 =?utf-8?B?UEd1S3NmZklGTXkxWHlibHhDakh5dlI3b2doMXc0SDNnbDBmWDMyVkJ0R2tx?=
 =?utf-8?B?WXl5aHorNi9xMnhWY0FuKzVGNFdYRzBBSk52THJ0bWdIV0g1azNwNGxBSXJu?=
 =?utf-8?B?aUJXSnpReDlsWHZJelVsd3E4MkNqS3VBaFZIUlExQXdpQ3NXQ2dNdUpkVC9r?=
 =?utf-8?B?SXd0TFVvV2syRXpicXkzMnVrbUJtK0gySnpYSmZlajFnellqWlVEeDIxMUZM?=
 =?utf-8?B?ZU9DNkpKa3FRN1JOQ1RreEM5a1FhekgzN3dSSVIrRHZKYXhzT0kvS2dndE1a?=
 =?utf-8?B?RW9maVVZN1B5dlhML21rZFZjb21mcDhIaFZUUGlFY3dnM2xDOEF4NUFsTkd5?=
 =?utf-8?B?VERpRExVSVo2VDBRZU5RSTQ1V21GOXRDaml4Tk1hK3NXUDFKV01zcGt6WHds?=
 =?utf-8?B?VExUTUZHZXlRazRQdEJtQ2lsOHFUWFM4U2lTMk1SZXFueVk5R0J0bS9NYWlC?=
 =?utf-8?B?L3pCTlVPUGZCcHJIcFhlZ0wzQ1B0MjBDbk1hY0tiOW9NQm8yRDhHUzdRekRv?=
 =?utf-8?B?SVVwL3J1Ungvc0FPV0NNd2hLM29jZ0x1YUhuTVZPK0cweW8vZmlGaVZxdytZ?=
 =?utf-8?B?bUJwZ3lXbU1jNEJPbkZzMEo0YjIrcTg0dDRINGtYekRVWXpNSTVLTU5qQ1Bj?=
 =?utf-8?B?K2p2RDk1MXBRb1hhQWh0QjNDSVNwL0kxQUlXc3djZk9LMDhudDU0UWpacWs5?=
 =?utf-8?B?cWdqaWx2cWgzajZFVFZsZTZMcXZqbWhGd3REY1RpclN0T2pVeVB3MEcrSG5X?=
 =?utf-8?B?UWdXTEllTzFpS2V2TFNoQ3VPUTlGeEpkS2FsQ2pWMHVqaVhqVkRtYjdrZ2dq?=
 =?utf-8?B?bWtrVU5lT0VYZ3RYZVdlR0VWWVhpb1hLWWpmS295N3RIRjZDTGdkRC9meWE1?=
 =?utf-8?B?dktJMjloNy8rM3ZCRHlTWjRQUmN0bkVIWjVkUUFlZGw1bW1PL212enh4YXE4?=
 =?utf-8?B?Yis1OFhOVkRBVGVXamIrK1BkTWNMRW5SdTRXeEtUQXVoUy9NUWdkWUxzZW44?=
 =?utf-8?B?dGdPakJodHVvbXRVcSt3YXRxdE1IcXV6WGtsTjkreC9pa3NZVENTaG1lUFZw?=
 =?utf-8?B?YmZGbkgzQVhYdm5mWEw4NTdsaEZBTmowQXFDais0Vkd3RlhkRDFlVjZtYktr?=
 =?utf-8?B?Sll4Ny9yZS9mK0xQM1VERnZjSHUyTUdHbEFEUXJ6c0ZDZ1FqMmtidFVZbmZS?=
 =?utf-8?B?Z09aR3dOTDhNdTBQeG1kSXMrUitxUG9CMTV3VkRIc2Q5RG93LzNkZlJON2FR?=
 =?utf-8?B?R3dKdktoV1FkdFoyeURpR2hIQm5STk5OZ1pnak0vUDF2aDFRWWt3V09tb0hG?=
 =?utf-8?B?UXlzLzJ5OGtkbjNiWXVLaWFGMkREN1UxbkVrMHR4N1VGaUxnSzQvdmVwaFB5?=
 =?utf-8?B?OHg1UjEyUjkxc3Z1aWU2M1hGQUZUZ1lacTN4dng0ZkRxaTJNaVRTODNVc1dF?=
 =?utf-8?B?bEZkT2htZnVXY0F5bXk1N1ZsTDIvbmYweGdRNkRuUWE3R3VqTEtZOFFlZktw?=
 =?utf-8?B?V25qYkJxejVzd0dWazU2V2ZxUHpwekhHZ0hlVnF2L3JubjVBRjBGdGNJcnlE?=
 =?utf-8?B?VVdId0Urb1JpckRBM1k2Vm1xUDJhRTVwUklDb1huYlZjSmVYRDVqSWxsTHBS?=
 =?utf-8?B?RnJ2NXZ3U3ZJbFdtYU1ibmR3NVdhR1VCM0ZXS3BwSHA5QnVvcllpWlplWkFv?=
 =?utf-8?B?Q3NpVXdsc05FYUZMTzUrZWdIZzJXL3p1RFBKNFhuQW5mc1B0Mms4Q0o1Uklr?=
 =?utf-8?B?YzByN1FmT1B3T3ZabTVBYmg0WE85RFd4U1FTQVJJT1hqMUE5RHpEbXRPZlpS?=
 =?utf-8?B?QnBoaWlaR3Azcll0WlFpODJaLytVMHp4K28waXN2UTJYUnI3M0RzZmJtU1Yx?=
 =?utf-8?B?ZThSS1RjN3hEU1hEWTgwMFZucEJEazVNaHFrdk9PUHJXWnBLcmVVeU5yNnpx?=
 =?utf-8?B?Q0JRSTM1UXFmT1lGYVcrTjZsZVhTNW1ZNlNiQmhvRFowL0dDL0t2TmdRaFhw?=
 =?utf-8?B?L1hEQmNNWE1SQSt4TEZWRFNDM0pob2FVcW5iQzRTTWFPWmp6dndUT0RrZHUx?=
 =?utf-8?B?MnJ5dmtsQyt1UjBsNFYzYmRuODIzRUROZUFFN2F1QkVhdG5VSEV4TytFSWRI?=
 =?utf-8?Q?h6jqi7NCC+9jEqx0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13586c6a-7f8e-45fe-7c02-08de955b84ce
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:42:23.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+MpSR6QXjkX/jgm10LOUYbmirYUNe+wdqN/OrXfcSt2YNChy4VoxUXeEUwmhkQGYXofqvSEUZ5ZwYY0goEErxckE7BR0Mu6xubnvLrvWfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6520
X-purgate-ID: tlsNG-720697/1775644947-44BF5CD1-9FBAF00D/13/0
X-purgate-type: clean
X-purgate-size: 2197
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:michal.orzel@amd.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid,gitlab.com:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ADBC43BAF97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 11:36 am, Orzel, Michal wrote:
>
> On 08/04/2026 12:21, Nicola Vetrini wrote:
>> On 2026-04-08 11:51, Andrew Cooper wrote:
>>> On 08/04/2026 10:46 am, Nicola Vetrini wrote:
>>>> On 2026-04-08 11:22, Andrew Cooper wrote:
>>>>> On 07/04/2026 11:34 am, Michal Orzel wrote:
>>>>>> No more regressions for clean guidelines:
>>>>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>>>>>>
>>>>>> Michal Orzel (2):
>>>>>>   iommu/arm: smmu: Fix variable shadowing
>>>>>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>>>>>>
>>>>>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>>>>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>>>>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>>>> If all the violations are fixed, should this test be made blocking?
>>>>>
>>>>> ~Andrew
>>>> Only if they are also clean on x86; otherwise an arm-specific list of
>>>> clean rules should be made (probably better). @Michal what do you 
>>>> prefer?
>>>>
>>> All I'm suggesting is this:
>>>
>>> xen.git/xen$ git diff
>>> diff --git a/automation/gitlab-ci/analyze.yaml 
>>> b/automation/gitlab-ci/analyze.yaml
>>> index 4e9af9d60224..f01798c5dee6 100644
>>> --- a/automation/gitlab-ci/analyze.yaml
>>> +++ b/automation/gitlab-ci/analyze.yaml
>>> @@ -149,7 +149,7 @@ eclair-ARM64-allcode:
>>>        CONFIG_STACK_PROTECTOR=y
>>>        CONFIG_UNSUPPORTED=y
>>>        CONFIG_VM_EVENT=y
>>> -  allow_failure: true
>>> +  allow_failure: false
>>>  
>>>  eclair-ARM64-testing:
>>>    extends: eclair-ARM64-allcode
>>>
>>>
>>> so regressions become blocking.
>>>
>>> ~Andrew
>> Ah, yes, indeed. I didn't look at the patches but given the diff it 
>> makes sense
> In general that's a good idea and something I had in mind. That said, we will
> likely be expanding the list of enabled features there as soon as one arrives.
> What should we do in that case? Make sure that before adding new =y option, the
> allcode passes in our Xen fork?

New code could be clean as it goes in.  At this point, it's not
interestingly different from "does it compile" as a prerequisite.

~Andrew

