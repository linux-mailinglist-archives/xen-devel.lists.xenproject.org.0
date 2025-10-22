Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21CBFE0A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 21:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148450.1480480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBeVZ-0000Bk-8B; Wed, 22 Oct 2025 19:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148450.1480480; Wed, 22 Oct 2025 19:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBeVZ-00008D-4o; Wed, 22 Oct 2025 19:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1148450;
 Wed, 22 Oct 2025 19:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBeVX-00007z-4p
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 19:28:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b6d6f8-af7d-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 21:28:21 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 PH8PR03MB7269.namprd03.prod.outlook.com (2603:10b6:510:252::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 19:28:18 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 19:28:18 +0000
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
X-Inumbo-ID: 44b6d6f8-af7d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeZyFDvEkFBMl/E5rXDzOr881p9vQ/ynnYlEd+SWiolf9IXyjQ/DomaCdnocltRJIS5KRFv8r52tZNrWmZTtod8hhToq+y2m/9+3K1qV08oJpEEiXKHtqgafWuRHLlPbRH1FWfRsNT9zIcFP7nITRDUyjPnMwoyZd26Pc3B1Kxf66iNah17tsWLMaKTx0aNH4sM8QfCEZeTiF0zGojxYShu94TBoSvVvuQAENDyteTa7mdo0zPIHcUkjaE+XqRieaufa3c1HhOYs7gAFQvla8hKJPaFYdriokLJpoV8eyujY53qnUUs5A6iYlhZxrD3jJLwGsLpNb4nRe801nkOA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wiwpXb9H5o2rwRD0HoxRXVJ0oBd7lMdccOSUWvLQ0c=;
 b=doc5AlP6R2nvBv9VD/5oAnE7n+XjX9umk5VhPZybJ2f1UfiGvBp4NNNuyxWqFDKIbqc1row7DT/MXbotEKyuzOhnsaMXh1UUhSmGG6TSmRoHY5Bz+ZzajWkTkna7w1dyDpNW01gUUyl/G3ttHizVGjsEEz7WtP4R0hplIEIM0bNYghRpPDw5Fv1pZ+AnJsZ8BWCDSBds1SdRkYu/zduVfHOdoNY9qJGi91GnVLOMelqJMwB0SkK0AXlbxWcap+sZPiy+Qt/jjqbo3ALAB+gT+5iEJ40z976/wn9gA34NRZ2DooWi/0rpZRtGPWU88s5cI+9t8ugsB79ZKPzgXPyyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wiwpXb9H5o2rwRD0HoxRXVJ0oBd7lMdccOSUWvLQ0c=;
 b=dj0cqb5TGRwmDz2JAU1+W6Du8W1ijBTBGwkCZ9Yxmqybpta1+usDhFy6DNNpGSCV8GosJ3OXxo1wtWnzI+/z/b/j1ao589D+l42tr6Zj+MBtI6htYPwmLY77gemDHou1Ccq0DWidX2yairIEFTTCidXB082zc3lQdkXxnUmzvZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <342ead3d-3d10-46b9-bb2f-89f941582d96@citrix.com>
Date: Wed, 22 Oct 2025 20:28:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Abort parallel load early on any control
 thread error
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-3-andrew.cooper3@citrix.com>
 <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|PH8PR03MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fc9c25-b9ab-4ee7-76ba-08de11a1271e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWxmTVpkT1h3Z0ZvbkNFcjJpc3pGOWxmSlNnTk14cE5pYitYMDNBMGVGZ1g2?=
 =?utf-8?B?bDhuRy9IZ2ZSWDdwUDB1MEpBdk1vL3c2ZVROWWVWVzlwVktscm5yK3ZIdzRC?=
 =?utf-8?B?WWJtOGdRZFRRQzRRL3hHcDIvUFloU2VCTkhucVM1Sys1QURhdXM5c0xVeE50?=
 =?utf-8?B?Z2JaTk1YcFNTRTZvOW9EZUowejlyT2x3ZzFUQW5wckpUQzBmbXpQbUg5SWtS?=
 =?utf-8?B?anluSXdMaFZXZ1M1WTFQRTN2Z1duaWpGVm9PR1NsdnBZNGhzbkl6UFhYNFZq?=
 =?utf-8?B?TDlxd09ITmxyZGMyWTdmOUpDVkZOUVoxUWZDS3F2aStTT3dxb250M3BLemxZ?=
 =?utf-8?B?Q0R0RU9hT0cyRG9Jb05pUjJhNm1BZHFkdG13T2F6OFhicGh1TTYwWFJnTXdu?=
 =?utf-8?B?MUtWWDIraTgvV2t4N1lwVmVXSzRGQldFbFlsOXdNMk1NUnROR1l2NU0wMnNT?=
 =?utf-8?B?Q0c5NFAvMTZYbkR3SWIvVXBhVCsxaTJHdU5MR3JIdUJJQk9pV2p1NDlsQi8v?=
 =?utf-8?B?eWNyd1owME1PZy96TVJjSThFY29neG1DamF0UW5Ga1V1djc0Q1AvaUM5TUd0?=
 =?utf-8?B?aTk0RTNMQlV6a1R4VmE0cGdpc0NxRndRWjNUNDN5bXQrajdzWlJDSk5PMEp3?=
 =?utf-8?B?YlpEMDMvRFFVeEwxVFlFRWMxOStqMURPRW11alhwR2xMMHpRTDhXRkpETmkw?=
 =?utf-8?B?ZVZyR25LUEZ6YVYvS2xHOFpQaE9pY2FCS0RETy8yNU1jdGptZzdXcVYzRmFl?=
 =?utf-8?B?eTdGRzZmSkFzTzlxTzZwYngzYmFNdUExbndySWNncVFnUnBMeGoyODMzYnlO?=
 =?utf-8?B?KzVIV09nOHpBbHlZaGFzc2hvZlBsVEt6c3VjNktoT241amsyd2lsMlNmbzIv?=
 =?utf-8?B?QVdMM0Z3Q3FOM0FnWDlCSnJJZEl6UCtMWU9uZHBuSUNkN2U1aU02azlHK0lL?=
 =?utf-8?B?L2dVdTczck9jMVJxTUtsUGdwSTIwVnlMQVhCRExEQ3pUa3ZTUmRIZVVwVE9B?=
 =?utf-8?B?TUlLdS9TSkY0WmRja1kyQUYzUVVZWVlNcHNWSXk0ZnR3MFFITTE4bXJPZjdh?=
 =?utf-8?B?N0xvNW1aVE14KzlEM0NReXdtRHRTeGlYdVJpWmQ4RGVmL2xHWEFwUlZLUHZz?=
 =?utf-8?B?NUl1ZHEyYVp5KzJLSXFLRmh1SURCNzh5N3lZZlhiRUdJSkVrSmY4aWtmMU5Z?=
 =?utf-8?B?WG9KRXJDWjZxbkVnOXZBRndZZkkzSmoraUhvc0luRlRuak5sbHd3cVU5VWNH?=
 =?utf-8?B?VGdDYVlhenppUTBFaEVZdjAzeFNocmxoQ21VNWtJUW9jVVVRU3BmT3lHT09Q?=
 =?utf-8?B?dUlVMEtsWlJYbUc5UnVFZU9NaWl0aGJXL1VQS2QrRnNZQ1hFQW5JU1d6NWt5?=
 =?utf-8?B?VjF4VWJjTkpnN1d5Nk1kOTZOMmdSNXhtNE10Q0J6VGZXQXlRY1JmcmQxcFNp?=
 =?utf-8?B?S2hlTnFwOE9oWVJWd0ZyYzJMRVV4NWdxTmMwQVNQdloxaDlhTVZiWFY2UFVC?=
 =?utf-8?B?Q3NUdWUvTGQ5RDYxb29zRTJDbjJaejdJUW1ySmFLUGltOWxXakkzTFE2cHJ6?=
 =?utf-8?B?Tm5waFJUdmFOUFAxOEsxTTVNM0hlMCtPTnY1S0Q3RXQ5RWUyK0RMTnV1NEMy?=
 =?utf-8?B?SVZRK3hkeHk2U1lBbHIzWFZRdCtlcjNpQVg3K3ZTTkFmUW5wdjM0YVV6Slg3?=
 =?utf-8?B?UjQxTUludnlxY1prV3RIRkpMZnRNbldlbk9JL2prQzU1WnA5dDFIQ0hXMHpZ?=
 =?utf-8?B?UkFwZXNNbjBvc3RZVURqSGwydDVQMDU5TWl0VVRWeWNGY1orYm5pa2puZTJq?=
 =?utf-8?B?UG4zTjZ1cjhlcHRCeHN1RTBwcTlJVVNLQkNVeDFOMXhoaDZ1OThndDZISDJV?=
 =?utf-8?B?M3lldkllMkJUVkh5NUVONkpaODhNSUVhWFJHU0x1d3JFMXZQZzlQdTJSZmIx?=
 =?utf-8?Q?IUZYC8MUC9a5oJx2rnuJE8bVQ7xQ8Eca?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0hpZE1pVmtyc0pINmdGTWxkOUt6OWVscndzdjh1YU9SRXlMc2FWSVlaVUZY?=
 =?utf-8?B?YkI2enNkcUtEakFGbjhYaFNKWU04eGVKdnFuTDFVd3BIWXR2NW1iVFFqY2xv?=
 =?utf-8?B?aG5FRzRUK3phSUZDUTVzb09WZ1oyUGJlRmRKQ25SWWlMclo0QUxtSXZZbnFJ?=
 =?utf-8?B?dzJKRWc0cjhTc2NUSm9zRXJZVTEwS3B0cmhvaGo0aVREb3BFWlM4WWROTWtE?=
 =?utf-8?B?Q2piRitySExEMStTcnNobnRrcXBHeldGTThIY2VZZUlFV2c3SnFrSjl1bDd4?=
 =?utf-8?B?My9hcFZXZ3FNM1RGQ3NLOFR6eGhWcklVWGFucjVNbStvcTRvczFSQ2ZBc0x0?=
 =?utf-8?B?L21zM0JOUWpacGJXRW9SWmt4ZTJrTC9wTStrMjFkU2hZRS9VUklJdjFVb2U0?=
 =?utf-8?B?U2FKSXRBRlpWWFVzVzEweVJpZnFLMmcrM3lPZ3lEUldTNkZObFROVWMvNGtF?=
 =?utf-8?B?d0FxbHNGaFcraGVOWkZHOVFseGR0Rk1ZWGxjbUFObHpJSG9BMkdTUGZMZGtu?=
 =?utf-8?B?VFJ3YjcrWFRUVk1mQ2prcHNxVVZsY3NQTDZ0WWxrZGVuYjU0eElaZVp4bzEr?=
 =?utf-8?B?WFZ5SWFLeVV0MDI5ekVuZnFhMS9rMHZZR2NDdEZ5elRIUFNvLytONzhCcE5Q?=
 =?utf-8?B?TldFdytPSVRqcmE1WTdyUVVXRUYxUnBiOXZWeEhIWjFoZ0xCTVhqVm5xN1BE?=
 =?utf-8?B?eDhlbXNNQ0tlVExXQng1anJnSnpHMXB1eDBLRnA4dkdVMk9uMDJ0UzgvTHJn?=
 =?utf-8?B?aHhXOTZORXpoNUJQeVdwUkJDYktJNDNvekRvWEFjVENORk9BdFhERlg5aU1r?=
 =?utf-8?B?ckV0Uy8zdlMzOG1kNldZSnRwNUNTQU9CQ3kyRjROeDl5cll6eGNJVmR5U3NR?=
 =?utf-8?B?UW1OSXNLVEVjdmd0Rm1na0hmSHRHVEozTUNPZGMyb3pRNWpiYm9XbHovL3NU?=
 =?utf-8?B?V1hSSUdaTTBZalQxbE9WZTMwNHRvektrZllaVU5SMGNwS3Z0NlFIeTlBbHZF?=
 =?utf-8?B?MExBV0p3L3VSNGFac2prT2p5TFp0RDNkOHFaNTNnOHMvTzJRODgvdktjUUkx?=
 =?utf-8?B?VWQ4V0N3N2gvMlVYeGpDKzhCUmRYTHZRZDFTYi9TMWRFL2hXNk5HWHp1L1Jm?=
 =?utf-8?B?VHZJc0R4N0graTlzL3JRQWpUWkJOWG5Da2xHaWo0TFVzL2c2dnE1azF3djJa?=
 =?utf-8?B?SDcvcEJHcE52eU9UTGxranhmeDBnNSthdSs0Z2xSV0RJc1JZci8zVDJUNXVw?=
 =?utf-8?B?L21wSExQaHltM1B1MjVNMHZWaG9IQkRMRkFqbGRoZS9CRm9kaG10OE5uYTVN?=
 =?utf-8?B?YTd5SlpiZ0t5VXdOaVFEaWMyM1FGYWFmUzI2Y25yOFRjNTBiTHJLR0lXanBk?=
 =?utf-8?B?RXlSeTh4SXZaUUlxSytPZGxPdnMxcHZVR0xmNnU0M210ZVF3RnBMcm9nZnJ3?=
 =?utf-8?B?NU84MytwZWN4TEErUXFIejJIOFg5cm1ac2ZXbjByRGs1UENsNkxRazVNRXVp?=
 =?utf-8?B?TzFGSWNZSDBNa25OWGh5c0daZlF5NmMvUkNRdVpSOGYzNHU1N2dYU2pPWVVY?=
 =?utf-8?B?d3JYaWs1d2xDY1JLK0p3c1hSSGtQRWRtOVVJQmFJZG4rWkpsUzFNVnlsQ1VN?=
 =?utf-8?B?RC9uemUwWGhjVEZibEQvV1cyY3Z6VTltNTh4VEJjSThsZDUzMjNrRHpIWDJ5?=
 =?utf-8?B?QlN4ZVFScWd2N1BMdmptb1ozZ2dtd0lCTHU1QncySFA2M1hJbnV6R2piNzRR?=
 =?utf-8?B?ZFFqTGFOQzZhUHJhSTlaVDR2cjg2MktCblE2OGJTbGtCOWNUTnJvVzlDeXJ6?=
 =?utf-8?B?ZHRHYUZzYWtwTmFmRmp2Tm9qTVNxOW1vS2J1cWZ0a3loTmp1U1BoZXBMV1dt?=
 =?utf-8?B?eCsxeTBWVVBQd2hyVmtyRVZKcWk3bTg2S05FNy9Ba2laR0U1MmFqeXExQ2Q3?=
 =?utf-8?B?VEN0NXlPbm1QZFlZNlhsRTd0WW1CZFNZK1hwaE1yWUpENUpnUjhNYXRPaXJu?=
 =?utf-8?B?WlI5NW1aYzlFWnhHSStTMGtCeXVxdFFnZnBjejQ0Rmk4dEtaL2ZxbnoyL2c5?=
 =?utf-8?B?YzZTa3pJdzkzdDVBYkJOR3B3YUhkMUpCL2JZcVgva1gwWVJzNFpSeGRQU0dJ?=
 =?utf-8?B?b0txaWRpZ0NaM3BIVUM1Qk9scytKbE9WMEc2eGZlN1N1S0J2QkpobVVBTnN3?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fc9c25-b9ab-4ee7-76ba-08de11a1271e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 19:28:17.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHegLW2ecy+x48SYA1TGlqm4KQVeVOO6UEyVTan7PPLIGat0VVebOjFyUXpfZfWk4ezvTtlZsh7KS2tK7Qro923V3iXBe9wE3R9RCBKMVw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7269

On 20/10/2025 4:55 pm, Jan Beulich wrote:
> On 20.10.2025 15:19, Andrew Cooper wrote:
>> EIO is not the only error that ucode_ops.apply_microcode() can produce.
>> EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
>> unhappy in some way with the proposed blob.
> Yes, yet wasn't that the case already when the EIO check was added? Were we
> perhaps trying to deal with a certain level of asymmetry in the system? I
> think a little more is needed here, also to ...
>
>> Some of these can be bypassed with --force, which will cause the parallel load
>> to be attempted.
>>
>> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
> ... justify there being a Fixes: tag. It would also seem possible that the
> check was intentional and correct at the time of introduction, but was
> rendered stale by some later change.

The parallel load logic more bugs than lines of code.  What hasn't
already been rewritten either has pending patches, or pending bugs
needing fixing.

I didn't care to check why it was limited to EIO at the time.  It's
definitely wrong.

But if you insist that I waste time doing so, at the time EIO was
introduced, both apply_microcode()'s could fail with -ENOENT for a NULL
pointer, -EINVAL for "patch isn't for this CPU".

I.e. it was definitely wrong at the time too.

~Andrew

