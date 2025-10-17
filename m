Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D5BE7A63
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 11:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145079.1478229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9gh3-0004cv-DA; Fri, 17 Oct 2025 09:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145079.1478229; Fri, 17 Oct 2025 09:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9gh3-0004ac-AH; Fri, 17 Oct 2025 09:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1145079;
 Fri, 17 Oct 2025 09:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9gh2-0004aS-3V
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 09:24:12 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077ae256-ab3b-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 11:24:07 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by LV9PR03MB8438.namprd03.prod.outlook.com (2603:10b6:408:376::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 09:23:58 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 09:23:58 +0000
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
X-Inumbo-ID: 077ae256-ab3b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjdjNPjxG1zwGiW8vjF3CL5Wo3WUD+9GW3nYHR/w8s9c998ufsg6iRTLcSTMWm81g4esh30AUdd8Lq7jFvSYwArofZdBGzJJSicVeUQ0Lie/xxzCSkNU9hg/NgwHgnxe+oYfmfE1NCAikwWMgZ8FFAN3rArwI4nvqCGNCjVvr4/p0UQZ7QeR7HdfjWdc2r5xdw+FhvPwz4XC7dlcilWfDjhPAqJZv2qn53kLr2If8+3eqbD6GCH0RUFH87FyW1A4ioaYV0lg3SuCbQ67ui2C2g9+MGVaYJYw7DE+AQ26vMcPVHCfy6SCqrswGUUHdjX+KTmsnSorZljiEzhnuWk/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq1hiIcf0bmDeEBTm3L8Q54ZgZCRwMLBfukSlYg8JaI=;
 b=E6ZgfGqWsr62fjB5rusphRjP+D+LHYkeD4I49WbfLx2e8/RMY1/o2qO1a5Z+8w4iZ9ixeUMfVmuctWWD+kpqBfTjYzyp1wimp+ZuR3W0N1yEP/v6gMg47kzhOhVPrrs5FdXIG+en85exBcGSCxUOX1cRnOzvAqO+pfGYyhf7FsF9tHpltEB7xJc/QflQdaN+PBxd2R5yfVGmgyJyBn+Sk90M9IOPnAxKwDtc/QZGt2jOexmLvUxAjN1BkTGvA4KSzFQc5Pl4fuJajTxIEyiYIc8PPp1OD8Z8XYOdMxguSGlp+EVNz+eVuJIz7vpH4KweyfU4wWK2nSQcDk46k7T+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq1hiIcf0bmDeEBTm3L8Q54ZgZCRwMLBfukSlYg8JaI=;
 b=E5q+ND07V8jIIgiaHQhQriGIzvnZCv6nCFXfKJWlY+WlrNHDPRWB1VhnUlBVcvqosoUKrAUAxf1IosKGM6auRf/QKy16n1+77hmj8mnYll4LFoMFKUkgTGPT5v3rnez7B6Lrvxh216hec9Zjk/AOs7dWzgXPV4sZzViYLf02xmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Oct 2025 11:23:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
Message-ID: <aPILKoTwmUYK5p8H@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
X-ClientProxiedBy: MA3P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|LV9PR03MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a31049-aa95-4640-c649-08de0d5ee6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0JtOUxmcWFENnY4M21lUlV0YXhVUTEyUFA3MkdReVdMdFg1VWRtMG8yZFcr?=
 =?utf-8?B?azNGWjJHUVVLOExCSGRDNEtkY05WYWpvK0hTU0JSMHBsb3dwU01Vei9DcVJx?=
 =?utf-8?B?cmZva0JEWFpRYmF0WE1xQ0hmRTM1bDdYWXptcXZBQ3RaejRuVGg3YXhMTkFH?=
 =?utf-8?B?M25URGR5aFhnOGY1bVZwcjBUTUp0U2JlKzRiTmZTV0lsaTFXMXFRdkU3eVN4?=
 =?utf-8?B?SVlBbU5sbnNoWE5lYk56bkdHVXlDN3dadE9LUVNJS3lzVS8wd050T2EzK3Bh?=
 =?utf-8?B?U2ZrKzBndG1oZDhsdG40bGpxTXorMnROR2RLYnpsbEh4ZW1hQ2w0a1BwSElL?=
 =?utf-8?B?QzdTN0FpMytPZTVFd1ZMSWhaRFNNMFdYYWplenlsTTJ4ZFp4Wm4zd1RVN2M2?=
 =?utf-8?B?OG9VdmhEV2NoOGYweUVNNE52NXY4R2ZtSmU4NkREZC9UWEowdkgxS01yUHFC?=
 =?utf-8?B?b1pIcmovK0pabndzbzFYSUtMb2dTV3piSHcxWmo1OE9oT3pRRU5id1JCSUIv?=
 =?utf-8?B?VmZGOTF4Z2tIV0JPYkhLQjdURWFrcWR2NmNYY0VNMDJUdU9aaEx5emEzZjBn?=
 =?utf-8?B?Sms4bW1BMTJZMjVwbFQrTFhDeTdaOFZMNzBXUnBDQnN4RzZETkhZTW5CVUxY?=
 =?utf-8?B?Ty9CZVlTdVRwT0VTMzB2NkZhcWh2eVh2WGZCK0dnQXdsRVBxRDFxdVAvQVlU?=
 =?utf-8?B?TC91UElyYUxxcVJQU3lQWlR3OVIrKy9ObndHb3U3R1VxRTVOVGZVZ0ZOaGo3?=
 =?utf-8?B?UG5vQWtwKzRKQWFwZHZScmRBMmNQWWFyb2VvbWRaWmlLZjQ3OFRDRVJGVzY1?=
 =?utf-8?B?eWZiY0lrbEhRNkdubE9HYThPMGVkaE40UmszdGc0bnpmdGVpanN1clpGS29z?=
 =?utf-8?B?Ly8wWVhwb1NIZ2RDT3h6YSs4a2VzNWxOdGcxSW0vMzdKSEJLU3VJY0NuZjB6?=
 =?utf-8?B?c3dkVkRxM3FiZVQwbVZXOWpRRWpKTFZHVWNqVHkvR253YmJqMUlUaFdJN0Fj?=
 =?utf-8?B?RUwxM3VrSFE5ZDdrTTVvT2VvYXcrUkU1OG5LemhtcFZjRWhmU1JFZ21PYmZX?=
 =?utf-8?B?dUF6VSttK0ZxQTVOdm9qaTlCMUpleEEvVVpRdFMxblVBdFRvSFRaaVAxSndK?=
 =?utf-8?B?RWQ0V2VkTEMyNjUvRXdIc2xwUmNCWGltc3BTTkhlN01IalpHVm9xdzdVbEFm?=
 =?utf-8?B?UUlOWlJnYWxjODZVMmgwUk5qbURJWlBFbXZqSXo4NWRhOGg2d1NlQ0ZxaG1C?=
 =?utf-8?B?cjZYSndOWitlSTRxVnJnb2lEdGVvYi9jdldvUWJDRU50ejVudU55L2lqM3Zq?=
 =?utf-8?B?SmpNQlF4UjVmQ3VoSUtBU2hFbFF3TWRPWDg2VGlLRmtEcnBiVm9CQzZ5Z3F1?=
 =?utf-8?B?OWcvenBnczBHbCtsNEgrVDV2dTVjenhPbGYxd2Y0ODJaUkRuSGR1cWU4WWxU?=
 =?utf-8?B?WUg1Y0lrdzJvRzBxQU5FSkplVjZOVlZDOVlXVVdBUXRnakp0Yk9YaTJsMDFQ?=
 =?utf-8?B?ZW9scHRnbWxlenpmcWZ6Y3B4QmJMc1dIWnRzVFVPNnlGK0lkRHR0Q2Z5M1A5?=
 =?utf-8?B?bTdzL3I0M25nVmJ0VDhPc3pKaktXR2dlUGxVRkh4aHR6c1V3bGV0Z1R1aXh6?=
 =?utf-8?B?YTZ1NCtvTnRxSmg2TFU2ZTF2dzVXTUNOdmhITWg1TDl3dVdRMmtFNVA4enNZ?=
 =?utf-8?B?bTFhNnhaeG9QOC9GVHBKN2xkcU9GbGV5YWt6V0hkR2d0TXhsWnNIeVpaelRP?=
 =?utf-8?B?Zkh6ZXljeEk0UEdOL3IwZlVEbEc3RjR0RXROeUN2aW94ZTJZVHRpcTNKMit2?=
 =?utf-8?B?bWZuTlIvdStHNHhTLzZVSWVXdkNWZ3pIMEkxbUtIeE1oMi9UbWZIREkyaGo1?=
 =?utf-8?B?M3VacEkxek1ZWEFYYjhzMHJ0OHRreTM4bWhWdkMvbXRSYVpmZGtrYTJwcE4w?=
 =?utf-8?Q?nzULTYQMqHzjBTTslpyjY0CCQTVsZstJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGRSREdoYm1hR2JIZGJ4N0xCK1lWK0pDeGk3MVJIcThHa3NTNVBKcXFTS1c1?=
 =?utf-8?B?Vit0azJJTVV6WWF0ODM4K1hRRmplOUt0VTJsbXFIU0RCU1JoNHFZelE1VVV4?=
 =?utf-8?B?K1A3VTFzeUltRDFwY1dmYmgzZmdhbHVvWlBGeC8rK3dFVjgvTXVoSUovQWkx?=
 =?utf-8?B?WC9OZk9DWGh0U25WMWxuSHpPVWNMbHBCSXJYckhRcnVXeGg5RmhSRnNhYVdC?=
 =?utf-8?B?a1lqenh2T1ZjKzNtQkRnd2JRb1J5b2JBUEdSUXF0d0VKNDVnT0loK2U3KzZK?=
 =?utf-8?B?NXNwT2JpdE15ZldPR1dPNUNxcEN1ZjBJTkVyYUYxTUZSMXliRW91NGpCZkFD?=
 =?utf-8?B?b1M5dDhZUW5Kb0tHcVJEQ09TOWcvWU1mWnZmTWlGdUFtZHhDdElrY1A4UUNx?=
 =?utf-8?B?OHphblZHZG1GWU94V1FpczRSTkpjSEd2NHptL1RtYUNjRFV3eE5LVkNvOGNj?=
 =?utf-8?B?UlAzdEJDZG85UmtXZlNQL09Ud0JBb05BWkdOc2R3aFdGZDZESUg0RWg4Y0dZ?=
 =?utf-8?B?MDZ3RDhDUFpQTFBDQU0vcWJYUm1pOUpacldaN1BZY2dqYVZKaVpEOEw3THpQ?=
 =?utf-8?B?WjdCdkk4WjNXQWFwa0QwZ3UrUVhxR3pXQzZzdXFSVDQ1b1h4ckFrNlVkWnkz?=
 =?utf-8?B?d3pzWlRNb3NXeWdqK0xCSkpRY0lNZWRFVHpiNDhqZEFza2RTcFZWTVdOekFp?=
 =?utf-8?B?NkFWUDFFYmN1TU44T1pNa2dSMndqc2lybVdIZEh5Tm1sZFZrczA1KzM5QThr?=
 =?utf-8?B?bHNPbzNZemw3bXFXUzN5Vkl2bE4weE5MSVkyMWl4eE10Zlc4OVl5dmF2MTJq?=
 =?utf-8?B?cm41alV3b0NZTVhIV2UxQ0sxQzVJNTZQT2p1NEJxV2dRWndzc3gxU0lqajBv?=
 =?utf-8?B?SVZPNTRiRUJtWWc0N24zMldEcUQ5aVdtbGJ6N3RhL0lEKzdYUVFWdmNHYXpJ?=
 =?utf-8?B?MGVIY201clVSNU12bDlkM09raTFWSlFCVGdYcGpMNUFwWFlrYU1RM1B6WktW?=
 =?utf-8?B?cEp6T01HKzgyMmlpd0JiQnBRUzVxTUZzeFNYUHBrdllkdE4reGVhdXlKVWM3?=
 =?utf-8?B?MWxEMkh4VHdHWGg0U0RUQmJHTmh1RGRxUnY0TDF4bWJHUFZqbklZQ2JYWjRW?=
 =?utf-8?B?cFJ6UkZFSy93Q3ZaT1lMeGt5MXRYK3l2K0lTTHRLZmlLK3NKM1lIV2dzMDh3?=
 =?utf-8?B?Vnp1WmZXOXpOTi9SQk0rRHduS2NoOUhxeUVDWVVrQ3RrS3JjenJ4SzZIN1RR?=
 =?utf-8?B?QnpZdXZqb1RsajM2TWsrVVJSMHgwL2hqSU52Z2hCTG9mRHo4ZlY0YTJvaHR3?=
 =?utf-8?B?QUJGRi9WeWFHbHhkZnBmL3RnLzlUcTdTajA4RFRldS9PMzcrN296S2ZCU3Zy?=
 =?utf-8?B?VUNFNkFvYjUvYkdvOS9sNGFxcHNKTlh6bFVIVjFNOUsrRSt3Z1JGTGZabGRx?=
 =?utf-8?B?Z0t0L0d3K1o4REJMUURHbG1CcFhvNVZxRHlxRUh5Zmp1QUxxVmpYenJ2ZVc0?=
 =?utf-8?B?bDZVRnFNRU1BVnlRZXg5MW1GcU5nN1JQVkRIbzNLQWxwZzhPSy9FV09DU3ZI?=
 =?utf-8?B?QkpRaWRXZ0J1eHV2WFBxeFlPUmt0OEtzK25tV2w2UVk0OFE4OVBaakVySStm?=
 =?utf-8?B?ekY5SXdSWXFnKzV1dXo1SW83Y0VXVXBMS2Y1bU81dWdLOHhKblk3U1dNTDE3?=
 =?utf-8?B?dkxzcUl6ZnBOTUhjZFMrdk43ZkdEN1RMbXU2eEhWNjNxbU9WYlovdUJqRXV5?=
 =?utf-8?B?K3plWEJ0N09VRFZMQnJyWlg5K01lMHJRRTV2QTJRNW1JckVhcWxQNFJsSjRk?=
 =?utf-8?B?U3VsOHA1SUdESGJxWElNR2hXbUJqVEFNRlovVFhJM3h2eDY3eHlVc2VESk4z?=
 =?utf-8?B?bmhkUjVhRVplV2FBd0lGZWlvQmVMWTJ5eVBsaEhOK3RQZW9ZNmNPV2RCRURj?=
 =?utf-8?B?V1pIWVBwL2ZDVUNZNWI3aUJWTXdVWll4YUJia3phelFqcVhnbEFtM2QvRkFx?=
 =?utf-8?B?UkRHMCtRWlhkOWpXZ1M1UTh6Y3dtSUhYd25Hb0l0R0xxTWRhOUw5OHptcVRh?=
 =?utf-8?B?dzhsYXk0MXR3MVVPbzM5QzJGQ21sWHlUT1JjK2lmWFRzZDZsNzQxUE1HQloy?=
 =?utf-8?Q?dVAQt8wm5wf7XBaGpiGg/wTmG?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a31049-aa95-4640-c649-08de0d5ee6aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 09:23:58.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDHuwnes5Ie26GSTqKDi6Cwf15KATb92Muh6F3zensQuAqba5twnjUE2wJFgmLkzE42AYjjm7C4TeKF427IGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8438

On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
> Despite 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt
> processing") we can still observe nested invocations of
> hpet_interrupt_handler(). This is, afaict, a result of previously used
> channels retaining their IRQ affinity until some other CPU re-uses them.
> Such nesting is increasingly problematic with higher CPU counts, as both
> handle_hpet_broadcast() and cpumask_raise_softirq() have a cpumask_t local
> variable. IOW already a single level of nesting may require more stack
> space (2 times above 4k) than we have available (8k), when NR_CPUS=16383
> (the maximum value presently possible).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Whether this is still worthwhile with "x86/HPET: use single, global, low-
> priority vector for broadcast IRQ" isn't quite clear to me.

Seeing the rest of the series, I don't think this is necessary
anymore?  Also the comment you here is made stale by the patch that
uses a global vector.

Thanks, Roger.

