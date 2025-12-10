Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3ACCB2A35
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182796.1505631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHAA-0005fr-8W; Wed, 10 Dec 2025 10:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182796.1505631; Wed, 10 Dec 2025 10:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHAA-0005dn-5B; Wed, 10 Dec 2025 10:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1182796;
 Wed, 10 Dec 2025 10:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTHA8-0005cc-Th
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:11:13 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d9f9989-d5b0-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 11:11:11 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by IA3PR03MB7546.namprd03.prod.outlook.com (2603:10b6:208:510::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 10:11:08 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 10:11:08 +0000
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
X-Inumbo-ID: 8d9f9989-d5b0-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auDusr3UcY1a3Wdf/uVwcQlyCK49CZABKxBD0tUzokor/DC5oOrcDNeGVClOREJfP/hu3ErjyTaIMxX6f7fqCz4vG1OUdGng9zTAqNqA1Yrl7mi+AqFCRacOa591wL/PSy4mAVN/s9fQsF2STCfNh0O5vfRX0l+Tc24o42+gwQuNjyC578nTpixTYDbxLAIp/W9nPhWK/nMVVKSz25rea7A8KgQfsMX2+3xeKDcPpcbdrk9CswZTk/D3mdOF5PHQVUB0OQyLbmYCi6CD03u4PebixPKi4RFqcV+eq0LnkF9eh0/rmPbOMHkpDgwrwD2GFQJdtUb5ehRGD+RaxWfSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSUECVfvtVyNBP2A3vSnhhxTwGW2iHN2kTtERrHQR4E=;
 b=x14ybD8C60MQW7w/yUNb2ig783hvu4hh+UtJ7POMayxFWXsNBtCqS/6bR36eOtfBO7kVyNpxWW8fVkMTDuAqFrGKyUH5a1rEoI05cOZNdX3Zo7+c9jop5Y3OSfSZbOROfOOSC/+UdsKlziCJ+/CrmpEoYO29RPXD81TH/jWG8a+LBRJrXHkSn7xSnViD2ZmVTp3aYbDlG04UyCMTXZGTJFOUAcnBOe3QZrDWk9bkZb7WqzosXs6h/zgHPlfZoHNTkgCcN+5rNuYHKlQygJw3BJ4a5qT3jsTiKR/F2XhIGVICuSqxa/KG8JqwdeZkWwKLhxaq1tBzCZmkHpOBONPRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSUECVfvtVyNBP2A3vSnhhxTwGW2iHN2kTtERrHQR4E=;
 b=AdXBY22XK0qofKrPvlXuz1CwLM0BK9NVXYyidW5p7BoYgoOdu8bMVri8pnV6BjF2uPUzqkMn7+C8batReSDK+8cn/zTLCG9U0+5HvWp6OT2NZHXfSGXpeyf+59STFXPeruQ0TVhgZBLVpI5cNHQxKivXuNQrOgwtmmKoLwPds8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 Dec 2025 11:10:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pod: fix decrease_reservation() clearing of M2P
 entries
Message-ID: <aTlHMSN1R1uRh0iz@Mac.lan>
References: <20251210093513.59534-1-roger.pau@citrix.com>
 <d6830fb8-ea86-45c5-95dd-d76a1d39b162@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6830fb8-ea86-45c5-95dd-d76a1d39b162@suse.com>
X-ClientProxiedBy: PA7P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::11) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|IA3PR03MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 232e6dd1-8e4a-4ab4-b61e-08de37d46fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWhxNHA1Z0paSG9acnZieU42cGFKZ1B3MG1mdWpOeTA4aDZkaVhuc29vMDVV?=
 =?utf-8?B?cDRIbnR1WHhQNDhjRm42b3JGU1R6ZnFzZmxWdE16YjVodGpUT3JnM2FEelV3?=
 =?utf-8?B?MTdOdk1wYnNQV2xaRWtWZzlRZlpaaTd2MndNYzZCL0ZzYlM3Sm5haWFxaEoz?=
 =?utf-8?B?alFQL2ZhbStyMTMzUHhmQkJtaE9LdXBOemVnOWh5dEZTWTZxejJLcHcyQ3Uy?=
 =?utf-8?B?SzJ3M20xVW9JQURNZzhZVlIwaU1sM1FWRW1aYXVXTWgwaGVDa1E3bHA4MldD?=
 =?utf-8?B?NmViM2RzRXB4MXErQnlNU2NQamRRUkNYdUJXOGtOT0dMeUhFOHAxOUREa3pE?=
 =?utf-8?B?WlZkL2VJQ1ZNTnZUNnZydVhnaVNZQkhwMlN5T2VrZFdtZEk5Y2ZCekRNa3JV?=
 =?utf-8?B?MG9NTVVxNzV6NzF1R2hyZEJpRXBwLzFGQ0V3ZXZVWERoOUhzY3R6NHZ5c0Zt?=
 =?utf-8?B?dlFoYVVUNUdIdjBWY0VpcEhpaUpXaUI0bEpvdzI0dWVSRzF6UW11WWJnQkts?=
 =?utf-8?B?VldTQU5JdnJSdldzZXZuSVpGUUlFbXN0aDh2SW9jVjZRNGZhNW5hYzJKVWZj?=
 =?utf-8?B?bzY2Y1JXYWZqM0JwM1E5Qk5hWDNBY1pyZTJJZWhMU0s1SCtZbnR4ajJvNW05?=
 =?utf-8?B?b1hYKzREUzJOODJSNnUrYWtWNEVtejlBU0NyNWRNb2s5a0hIWldaWWNQZkpr?=
 =?utf-8?B?WnNsZ1ZRZlZyZkxHZS95SWl6VTNQZmhFM1g5MVVuZDJVcDNFZHRSSFlvc3lz?=
 =?utf-8?B?TUMyZXVaRHRxRlVXdzlMVGFHc0pvTWhvNExxaDYyTkV4T3dJMFAzN0xtSDBT?=
 =?utf-8?B?d1NBRklNRjFHbjZUYTYxejVISDNubHdpcGhQS1p4cWRlaUNzUU9QVm9YRW03?=
 =?utf-8?B?T0o1ZFJkT3ZZSWJNT2pUSytpTVJMWU1zdFNwbTNKK0psRjNnU3hTN3B0S3FV?=
 =?utf-8?B?aFJvZ2JNc25BL1V3dnNhQnNZelhYQnN1TmxnMHlqYjhuTGZRNHlKMGwvMzB5?=
 =?utf-8?B?V0tpRGVsTERjdnd1aVU1d3V4M0x1RjNBTko1SzBQQ2ZDcXJObjBCUWRlWHBI?=
 =?utf-8?B?SE5ncjBjNHdIaHRWUGlQTEZMSW1FcktRWkx2K09iK2NTdGdPcTVzZ0doMXlH?=
 =?utf-8?B?UVhYR3RZVkYyUzZqcVlJd3RPNDFDTW5NcWxkUU9PNERrdlNEcmlxM1BsbVBT?=
 =?utf-8?B?UUcxM0Mvb05qZ2tOVTBpV3pmM2EzOE1HSXArV3FVUjRlTWJwK2xndmV6K3k2?=
 =?utf-8?B?WDFBaGRPdURpREprSFBzS3JRRmIwdHRyME0rUjFPLzlTVk9OMzd2M0xxcmFZ?=
 =?utf-8?B?aGdqcHNMUmRCQ05VeXpWbWhoTzJUMnp0RGo0TWNtMzFld2R4RHljOXRZYzNR?=
 =?utf-8?B?bENUbG9oMzYwRFI4RXVlUkkyUWxUOXdzdDQwZ3VROXRLQlNrUTdtdVVsdC8w?=
 =?utf-8?B?OWRUVjh4TEI1RHArZmwwcWFXTGluWU15ZmVxc1c3bE9mVDlZTDlneUhxNjNQ?=
 =?utf-8?B?RHV1aU5UY0dpbTZSL0kyM0NENHRnVDk0U3BldnI1MFh3Mk1VeDd6VXpFeEFB?=
 =?utf-8?B?YWdTNXdFbUwwc2tFRVRCa2d1MzdWWXdTNXczUS8zSGNoL2Q1YmhaN2REYkMx?=
 =?utf-8?B?Y1gySHhIaFRjWGF1ZWNnZm5DWDl5RVU3TjY5YjBYVmNMZWRaWTFJK3owK2d2?=
 =?utf-8?B?VlV6amlRQ3gwU21zN3pWOHRXcm9ScGtkNHNjVVJ2ZnJ2cEk3U3VjVzF2a2Q5?=
 =?utf-8?B?TmtJdXVSNExoLzExVjlWNVk3MFlHOXViQk1kcDE4UlFhb1h0ZXFEUG1EK2Ex?=
 =?utf-8?B?WUpyMFdZRGZPTTFZVTZPQWVzQndrYWozaktVM0RJWU9NZ21FRXFaRUxJcElI?=
 =?utf-8?B?UWFaM0xtWDFpRTNKSm9Ia3lwcktkeVhabnJYTVR1aFE2SXBVaFptMFJZdDRs?=
 =?utf-8?Q?0Iw8IbzboOJzAkhyvdYIs5oSTj9Yk5bs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWc2VU9JZzRQaDlMVGw1RlRBdENQMC96Ull0WHkyUWx6UHNOTnZFekRjNkc0?=
 =?utf-8?B?RGVHWTg2elJ1Y2FHbnh0MnFIT0pMSkM1amxNTTk2QkVhQi95SzFHdWI4ekhR?=
 =?utf-8?B?amlpTm5VTXpKQzF5L2hDUy9FZDJsc2xkUi9DNU4xNVFhcU9DbnZJaE1UVzlH?=
 =?utf-8?B?SUVTREUvSkIzanAySXZlODJkVFBUaTRLS211RXlZSVJUbGFqVHduYzdrS3N2?=
 =?utf-8?B?YTFSWEhVRit4Mkh4Qlkzb0prVWJCTkxDRE9NMy9NcVpDMWc3eXpxTUpQUHkz?=
 =?utf-8?B?VzRXYUcyM1pJTUtSOUNGYXdLTUdzenpQKzB5d0RPVnhGWDB2NUdxSGYvTEMw?=
 =?utf-8?B?VjljWkNBZjVKMGVReHVBM2JBaDJzdUpNWEVWaFg2OWZYZ0dpdytNK3lWU0NF?=
 =?utf-8?B?ZEVveERqVGdwZ0ZCVmZvQXhnU0tScFlteUpMWkY2NHM3T3FKUUNDUlhLWVMz?=
 =?utf-8?B?dXV4K0IwalVHbzQxakFSWlJvOHhxMEllSm5NSVArN0ZLS05neklkMVRURWVD?=
 =?utf-8?B?bjMvQnhSaWhlWG1FKzU1YVllOVM3Qk9GMDg2dVZRdjlZdGtsa3VScVVaMWJr?=
 =?utf-8?B?RU9wbEt0dHlOQVpNT0thS0M4V3JYdW9VQS9EUDVOOWtiakdBYjhiK3hrY1BK?=
 =?utf-8?B?bVJCenNkUm52Y0REam03V2NQNFlJbStMUEsxYmRLNzR5RWdvZXA3QTdOcmxn?=
 =?utf-8?B?a2M0RlRkdnA1SzlXSWpkbjNFekdXWEFKQThhbWZjNC80bWdTOFdFTkFObHlH?=
 =?utf-8?B?VXJUbnBGVk9FR1pIU2NrNGw3VHk0ZUpkWXp4Z2pjN0hkWFVYWWlZNTY2bEJ6?=
 =?utf-8?B?bEp1V0gwOE82S1dyRDVxTFRvNUdreGtLNGJuaHl2d1dTam5KYi9WdHBQSzZT?=
 =?utf-8?B?cEtyS2NwT1NEdjJ1MVgyODc0K2Iwb1dOM2JZNkVONnI0aHZqcVV3V2FDcEFs?=
 =?utf-8?B?enRrbC83YVBmd0lmR3RueW9EYVliTFI1RkhRbFNyZWJtamhuaVR0WHpTZmF3?=
 =?utf-8?B?SURkc1FTQTlDOW9mRzlWQkRYYTZhcHorUnVLY2xRYjJGRFY0aWNNVlBwaEdw?=
 =?utf-8?B?MFNNVExEWXhBVkpEcWpLRDNjVzZqbkxCcnJxMUtacFM4M25UTlFVMnFHb1My?=
 =?utf-8?B?MkkwTGRIUzl6L2FxUE5aZDJaa0l2QTFTTnc3Z1F4b0NnaEc4dmtLQmplQjF5?=
 =?utf-8?B?SmNJTGc1UE94UnNEZTRaTnNwYXRtem43ZTcxRVB0U0NZd0ZFOENuYVlDL3Ns?=
 =?utf-8?B?WnNlbHo1eDd6VlY4ci9aSHBHMnRIZXdoeEpYZGVkOTZ3Skx4aVhWa25PblU3?=
 =?utf-8?B?aUc1ODJQYWpBUVozcTdxTjFpRTYzbWxlSE5WTHZqazZiU2tGdEZoNlBMOTN5?=
 =?utf-8?B?c2MvYjNPZ2w1SzkwbkZINGtxMkVkSytHOXRIeUI3T2JNdGFKei9PR205RnhY?=
 =?utf-8?B?c0xiQWlRNFZyS1A2b3lSTnE4OHBxSThSRHVrQTlaQmN0Q0hxajdPVFRveXk4?=
 =?utf-8?B?elU5WDhWV0FveFB3K2l4bHBGTnlMVTByTlJvbUo3clNhbE9pZUg4bE83bUJV?=
 =?utf-8?B?TG9BMDNZV1FGcjVHQko0YURHUG85QjIvZ242MTZpcW5XNlpDdjlpY2J0UGFY?=
 =?utf-8?B?aE44a2tlOHZQTmhPQjFVQUhwODI1RXpKRmRlR2JPTjI3MHIyc0g3WTFHSytX?=
 =?utf-8?B?a3V5bStoUGFGWFMxNlNUaWVwbTFUenJhYmNoL20zLzZYV0N4c1BKOExMMUFa?=
 =?utf-8?B?VnFEYWRSU3ZaS2Z4MTNyMmp1VjVXdkd1Yi9yRzJsNG1CeTRRRmNJODVyVEZB?=
 =?utf-8?B?cm94N0M1Vm1FZmRDMTE0L2FEbGxsd1J6TXVpTTFEMkZvL055azNMcHZUbWhn?=
 =?utf-8?B?TGVDb1NjRUh1aFpxSHFlR0ZZbjREdGYzRHUzc1B3cW5LcmsxOFRCdDRzb3Vk?=
 =?utf-8?B?cDM3ZTFWcXd6TXU1NDlna3ZwSVZZbXp3akRSVkF1QTNoUTUrK0Y0Y2p4ZFhp?=
 =?utf-8?B?eFZLNVhLYThvQlNyQW1qZHcvOTBtLzBPT3c2MzBEK0lRbENNVXpqYmJvOFdk?=
 =?utf-8?B?cVcrWlZTOXk4TnlFMG42SnlMdEZ2SlU1L3FEOExFbHhQSXAwK1BCRk9VWXZu?=
 =?utf-8?Q?Ifjtt46DoYECINYPdy7Pm3MXN?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232e6dd1-8e4a-4ab4-b61e-08de37d46fb3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:11:08.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcnyLuGcotnYKuH+wa+eDrF5eyl04jdjnaWOycs1pE36JknNEsN+IOI9tyiTgbrQPt0iJCXtMxWjJvzMU9EG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7546

On Wed, Dec 10, 2025 at 11:07:00AM +0100, Jan Beulich wrote:
> On 10.12.2025 10:35, Roger Pau Monne wrote:
> > Add the missing index increase in the M2P clearing loop, otherwise the loop
> > keeps pointlessly setting the same MFN entry repeatedly.  This seems to be
> > an oversight from the change that introduced support to process high order
> > pages in one go.
> 
> Ouch.
> 
> > Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd like to note that things were broken in the same way before that commit,
> too, simply because the order wasn't taken into account all. (This is not a
> request to change the Fixes: tag, though. It's just an observation.)

Are you sure?  Previous to that commit the order is not taken into
account, and each 4K page is processed independently: the `i` index is
strictly increased with +1 for each loop.

Thanks, Roger.

