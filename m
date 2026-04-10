Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDzBDmQT2Wm7lwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:12:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE53D9028
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279290.1563791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDWp-0007BN-Jv; Fri, 10 Apr 2026 15:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279290.1563791; Fri, 10 Apr 2026 15:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDWp-00078q-Gb; Fri, 10 Apr 2026 15:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1279290;
 Fri, 10 Apr 2026 15:12:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wBDWn-00078k-Di
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:12:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDWm-00DKXG-PJ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:12:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d9133f-2eae-0a2a0a5409dd-0a2a4505c3f8-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:12:12 +0200
Received: from [40.107.162.97]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d9134c-3760-0a2a45050019-286ba261cc14-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:12:12 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AS8PR03MB8420.eurprd03.prod.outlook.com (2603:10a6:20b:52d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 10 Apr
 2026 15:12:10 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 15:12:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kATNyPstnasisNN3VRb0twFNTQTIsaLGlZODkMI1CM/ciA9W5CqYHazIDC0dU3XTWRlB2GUpQrMPV6F5J86z2phaaCK8rf6s/BuMpVISkLCM/EZ6BHcMwgkTIHVoGBNqXjDG1DRBIFcicewe3YKBfrkq4EjOeQ+MYESyGrSQMIk6Zzd4MliVVtzZ0ndc+pyYDg72jcg+VvDpvA5mJk2kK0P0y1YVMwy4GOAaPkO4cR4scSfj7ebLZXFAj8mwD2qJkc187D/YZp92EYA0+ziCMstIILJA1qKK6XAoEOpDc9PkZn5VkboPgRom5mzUmnrKGXRcSkhzlECj1gn1BKZUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNuCGUOr1cdp9tsad0r0/l5zdLk78guGqazR5193nIw=;
 b=I5Xy52mbKB2oJ8prN5nHunHXwPxgBrg3OmEGxU/B3G/TLHhI11i6dyPKTaJhcIvQJu1ZY9gPAVIv0lCyI99AnIdJ80GerUYZH6YHzoi8GDQgtDcYVyxIQjDnD4V12oiGrBMgThFZaEJ8uiCLZshu/Nswk8659nQMI9hromVg841+WXAdivfr17RlalSxZZdBTn5d1+C6qQ8WmDZHKpbrbjcTKABiyhXhNySkKXccaSq5V0QrH40fubuQu6xBeMyRUVb1aRU5oH6bTb0pnwamVROe2KoM55MIiweVjJTbsqXQFW1Nma0YBxfbOpc7eCaFGVopDyzTuXp2umivu0POQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNuCGUOr1cdp9tsad0r0/l5zdLk78guGqazR5193nIw=;
 b=XUW6aoj63SxAD0YlPZeN9cBmAW7/Sr25mibcSjJVivEU6FOX1jnrALvsYFj6uQt3wGKouIcm4luZulYXKOG0EYaN4/+xlQtSSdsmCfAmOsYYFTLzYz0FEqy0txWjhQY8kyMsyuel2j7WcoWoDHeVjE7i3sB6qoTxpYOi99PeSh2eixSmbpvTbN9G/0BbyIDAWTa++iENY+953Ma5WnL0NJ5RCa08RKCBco6I9bGsv2YF1eeYY2VPkyBD9br7HnqoLQQf3uYynUk5PD1HUOJtX3dMv/3bMWdxCB308ZKgmAgAHQpD5UeZZRW6TEmHkdxg/EU2QlKO9NIKEbcJkwNmaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>
Date: Fri, 10 Apr 2026 18:12:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
 <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|AS8PR03MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 87978a41-4994-417b-a200-08de9713895a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cfVpXZh0m2uJK6aSwBc/v7Etvw2FNm6t9Fs5ujUFuNdN6qhMECbRe9eYsgRdWdnwKrOAtaPyR1gF4SLU/tNbF+ebGELOdux/2UnmkHj/OAT7pP13L7cTRTUt/NuaZbr0/VAbdzjlu+L1tHmWYLSXRMS7s5vZISk3UFc/Hpa397lgxs+rblrqqg6HuojM0e+XX53oJypJl8sI3XqML3Fm0PU+ZvnRWW2TgM7CMSg+CL5pp3v2yOkMY/aPxzyq5L2Blgf6zWY6/bFFJKPcuZbKpgko9cpQaKS5f2283XJA2KYl/+aWd3mV3M0M0XAzVGzNFaEuQl6mhwKM1G2GlJjiLyfsJxKKCmu3tPuRqP+ioErVUwbRT56ft/5KyhuIihDTtYji9fGGLy1clNNxM2VzDhLM6fRHKTIem+m64ixExzbOzH3oiGNZxbQsc0IaxLAwTcYoXwbxR76VAsmAcO8a313V0kWQ1bHqTofiOozm1YZ1MvzWHnXXVbnXaxcjGQkd/bOsvm4wl2E99eoyGcRUMnNIWM3Y8Om96tmP/2mfjaAqTr19AAe/8livU6crDcS7DMxOA5uWKbOuZRQAUrGP1Gb23bhDC1d+4E6fizLrS4Nb09HkS3vGNygl4DmhImmDRAOPbyntsOd4bHETQ8mEr0xBSoD6Dk05HvjkBR+0QFeqpcHOhK+VOOl5kCC32D/9BFcrBAIfAgVU2P6aQCMYkFkIjheBOHbeiP3W3RhuSus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1FkMWNZVi9vRmVOKzRxUGYvQkJqVWxwa0l5UTF3b3lRaXZ6VkxuZjdFd1hN?=
 =?utf-8?B?S09yNGJlWWRZNXpWUGwvNVpiM1ROVXBhOUxXaFNtVWg1cExsUHBYK0haZTZZ?=
 =?utf-8?B?Y2R3Y25mZ05mUGdSdGM1V3NxTjlSSWZ4TWIzWFU3aUJPUWthckdHaHh6TUtC?=
 =?utf-8?B?WGZEK2xLWGpkRG9xTTdIY1hsNHVCdHdvTjFZcW5LdlV3cFl1YVFsYXcyT0dK?=
 =?utf-8?B?d0duMStSQzlBVVJ6UUZwOTdRRnFlTWdJaHF3N3NyTU03T3R6OVpwVFBocHJ6?=
 =?utf-8?B?YkwwNVhJaVJkR0h4Lzl1SHdGMVlkdFhQRHVvZ2YxRkR2MUg5WVUwNkNxQjB3?=
 =?utf-8?B?U05LQlRKQ01IQmNHSnA4UHRZY29IMkZBYlZxbU1mRGdaVXNBZGwrNmNpQ3FQ?=
 =?utf-8?B?THEzQ29uQThOOHpuTmpMN3hNYzN3L0hFOGpkWWV1SExQRWwzcW1iUnN5S0ti?=
 =?utf-8?B?cmJmL05YNVREN2tCOG5jSmU0cGhneEtxVTNyTWdoQ3hUei9ybk5aMzFRQWVa?=
 =?utf-8?B?dUFJWmlHUVFTMVJYRUIrM1NtbFdpWXNzT09za3JDZEJ0eFo2VGhoeWQxRitD?=
 =?utf-8?B?eENFcXRSYmFXdVNTNnE1Tks2ek1wcXIyeU5FWUdaUHF4M0tBS2xOenpSV082?=
 =?utf-8?B?a3hNNHZLVk1ORWV5enh6UUJvZ3FqVmRMRHZoMGliTVcrVXRWeG1RTjlkNEcw?=
 =?utf-8?B?eUQ5Uk1xamErRWRHOVBOODZyNEJjdzkwYnlMWk9xd3VxdkI0QUhrNmdHR1VM?=
 =?utf-8?B?UmRxelRyY1czOEFKcGQ4V3pGSGhXU1lGbDlSMUxOYXlueTljQjF6ZndLdTZK?=
 =?utf-8?B?M0V3QVZPTmNWa3RxY2l1eWl0WkVkalRCaVZOc3QyQTZVS1BKQlY1UG13bmU3?=
 =?utf-8?B?ZktFTkxJamZBckI4NzhSR1M2WDliTHRMU1NBRDM1UktVQzFERjFxd3l4MnJy?=
 =?utf-8?B?TEZOblNIMDN0aHVPWWs5QWc1Lzlrbld3d1JNSmIybG1obFJVdXdQTU80KzU2?=
 =?utf-8?B?aGVhUVRoVEtHOUtVK2NDUzQ1R0NiZC92U1dEVUpscEpyTzkzY2F4MzRkVFBK?=
 =?utf-8?B?eGFaUXpkazluOWZ5aFR1Q1ZjUDE1dlpXNGlyMlozRmVPeGREK21jYU85amFU?=
 =?utf-8?B?RG5DWTdYQXZwMEg1SURMaVlwK0wrZ3dUcmNzN0NzZjVjSkxKc2xhRkViSmQz?=
 =?utf-8?B?NWM4RVhXQzRobkdiQmhMWkw0OUhjbzF4Y3BTMmR6NldOeC9IZjZ6Q2k2c25o?=
 =?utf-8?B?N05pd214ckoyYkJyT01xRjZCQnNIZ044SG54MTJObng2R0hrbjJoZ0NBUVM2?=
 =?utf-8?B?ZVZaWm5IcWZFNkhDYXBLbFlmYitIczA4YjRwNExpb2p3d1pxWWVRZGt4ZVNR?=
 =?utf-8?B?WmpMUUxoS0xNL3RBZkVvRW5FL0xFUUVDR3E2c0RyWmg4c283ejRpL2UvVXNy?=
 =?utf-8?B?VThYRkZiL1UzV0FaOEVZN0NkRzBNMVlIazg1N0RDSTRxQVhjZFBNdU5hTVd1?=
 =?utf-8?B?dkNDbVZYcUs3ODRMSmhtS3BXRGlMQjBPL3dWOGJIVmlwcFV2OURYYXNCbW5h?=
 =?utf-8?B?aUZNb3hxZlNLb29yckV3bGFNb2hMQkx6Slo2aU4rZG1HY2tSK01NZGRFTy9W?=
 =?utf-8?B?aXJHNWlodHRkV3VESG92T3hBR0twMWtzcGlCWnhBeDlYYkg1SWpvRVRFRTVt?=
 =?utf-8?B?Q2d0Y3pzc0N6Q1hOMWpkMDJGWHloSURJR2NQbFg0cWRQZGJ3WlRsMlEwR0pR?=
 =?utf-8?B?eVZrb29mNVRzMkFtNFgvaHFFTHlCMm1NNytBSjVyK3VLNkhhNklQbjFXbi9R?=
 =?utf-8?B?NmE1SmZ5ZEdBQnJ5UzhCSklNdGFsNStvZ1BwcDRFNkpmems2MnFDV3M1czc2?=
 =?utf-8?B?NUJGOVBnRHdwQ2pNNWdISkhUMngwTm1MWDh3T2owS1lXTklwWmlXVlNleWhy?=
 =?utf-8?B?dDVJM1VTZytVZnBMZ1pBUlExbEpOZ0w4bnlEWGdzUEpKT3lqV2R5TW1QVy81?=
 =?utf-8?B?dWdsSEZrLytCTWZWWmgzenp1ZUlGRGJobFVndW5qa0JYZ1F4SnN1OWtqVWVz?=
 =?utf-8?B?cGtFbk5wK3h4ditLWlpGWHVtTjRwZXltaFd5M09DTXFrNllOanFtOU5CcWQw?=
 =?utf-8?B?QjVqSEEyR0tYbWlINUx2VnMzbDRRRzR5N3hmYkhGeDF1N1BRM09oVU9mL2No?=
 =?utf-8?B?TjRybGRDY0x1bTF2WG5wVnEwNWR5VzBZNm92K0x2VXRja2JpQTg2UEVQMFk3?=
 =?utf-8?B?NkpyUjhzYmZuOUw1Mk5CMUZaaGpGYllTTlUyYWl6alg3UkJTdThXWnpNUTFO?=
 =?utf-8?B?d09oRzBGaHUwb05TYmNETTIrd0JlQlpCdWZWVVVNVmU2Yzl0NmJOUTJRdlor?=
 =?utf-8?Q?O9hWkF5hKXUlSkdA=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87978a41-4994-417b-a200-08de9713895a
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 15:12:09.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIPf3qtCLxXUAWkTzTRj7NwzsCu0HrqGQHSdbJal69meYXTIw8uUEg4op4yNADEFibX1jqLouYcfR+TA9YcsFZsawcEmKmqb9SMvrww2Akg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8420
X-purgate-ID: tlsNG-c201ff/1775833932-3153B96F-1597AB9F/0/0
X-purgate-type: clean
X-purgate-size: 1737
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 97CE53D9028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 10/04/2026 15:16, Juergen Gross wrote:
> On 10.04.26 14:13, Juergen Gross wrote:
>> On 10.04.26 14:04, Oleksii Moisieiev wrote:
>>> Hi Juergen,
>>>
>>> During our safety certification analysis work, we identified this as 
>>> a potential
>>> issue. While we haven't encountered this problem in practice yet, it 
>>> could occur
>>> in the future, so I believe it should be addressed proactively.
>>
>> For being able to occur in future, the handling of removing a cpu from a
>> cpupool would need to be changed. Considering the refusal to remove the
>> last cpu from a populated cpupool is on purpose (this avoids leaving a
>> domain without any cpu to run on), adding the code as you suggest would
>> just be an addition without any benefit.
>>
>> It isn't doing any harm (other than adding code without purpose), so I
>> won't explicitly NAK the patch, but I won't Ack it either.
>
> One further remark: I would ack the addition of an 
> ASSERT(list_empty(replq))
> instead of the conditional set_timer() call.
>
You're right: with the current cpupool semantics, when the timer is 
re-initialized in this path, replq is expected to be empty. In that case 
there is nothing to re-arm, and the timer can be programmed later when a 
new replenishment event is queued.

Now I see that it would probably be better to update the cpupool logic 
to prohibit removing the last pCPU from a cpupool. In that case, this 
fix — even with the ASSERT — seems to be no longer relevant.

I think I'd rather post an update for the cpupool semantics and drop 
this patch. Or I can send a v3 with the ASSERT if you think that is 
still reasonable.

Thank you for the review!

--

Oleksii

>
> Juergen

