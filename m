Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E265ACF577
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007297.1386618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNET8-0002gP-8V; Thu, 05 Jun 2025 17:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007297.1386618; Thu, 05 Jun 2025 17:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNET8-0002dj-5J; Thu, 05 Jun 2025 17:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1007297;
 Thu, 05 Jun 2025 17:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQq=YU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNET6-0002dF-RN
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:33:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e3ab347-4233-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:33:26 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 17:33:20 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Thu, 5 Jun 2025
 17:33:20 +0000
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
X-Inumbo-ID: 2e3ab347-4233-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dyp6MH4bJbdRxLpW2ikRdWWbPajPuQlBHZpxIRBvwfp4HhotmDMwh+DSmB7My1GK8u4NXQBYdg2V7FxlwSrMGFRrAvp5qDOijZxNa3WD20x8ofShU/xx3KRfOEh3dp1I17IgAwA49bVnHxoTEgz5/AZMdALSNVA4ZBM8z7yVHUat+tobo0yQZVuNHdaFcQQ4JRItArlaRsZB0xsbQ5xYmgSf72BBEVbkLu3O9SdDshzNrSm97CpsjevKbBFUGY0IqEh32+JvNga3fc/j9aJpPrssZZZ9U3EoNIGrPLEYOZGnsfE3LC6qhctanKbdd4GNBA38lx+BpRfb8neo8ay7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T452VS/Mby59853ocm9Cv7Ej6u9owIfqBYLtoDm0x08=;
 b=MfTPfDyRcaQcG+LquWi7unnSUbIzoFJCtxMx0QNaXbahJ2XUVtk/6BdjbV09ukF86q08B32mhMyM/eUS6Ws3GWBopuU5rCLz1QqZri3VGWvitOwNpc6pyTNyP2SyMegiub8BN5K7MrPTcQWFdmqT+0JclhBKRAQ1+LnwyzIHlPw6MTqsZexJUTgT/pVH1uA0rv0L5tq63xW2ffsqV0ZkxbEpfmtGVT4B3N6qRwx/8JsneB1NWUB+BSC2anm4voM0ZA7hM/NJgn80mkQ5TGmo2K+H6Bbuf4lZA3dTfLJCbb+OD0uuUTFGjadOIDBuXqs8hYzDNtRMW0CmCaJ/N1kR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T452VS/Mby59853ocm9Cv7Ej6u9owIfqBYLtoDm0x08=;
 b=H4COKr2nDflVt2IuGO6QmVfooQYVD4VcqDHeIf0JPlW9lLHQmsP3es+yZ7Q8GhXD71QxxXQ6oCCu0aMWzhL/6+TEes6eJM6ckdJjXeEkVhRZnOSr8WJHTs9lv6FNPdHm1LqrVfTW1cAS11Pp1DuFrkwRw87Z0B7PqnxcifAHOBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f777ca96-4f2e-426a-b5d6-3683ac0f6359@amd.com>
Date: Thu, 5 Jun 2025 18:33:16 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: [ANNOUNCE] Xen Summit 2025 , our call for papers closes on 1st July
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: f3459053-a624-4743-d45e-08dda4571081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elNvbEw0YnMzeElHZWc1NjErZU93alF0bUVxSjNWMTRQYVJpd043NkVQeEI1?=
 =?utf-8?B?ZlZUK2VjenlhZnRDSy9VcFhEc29jei96M3Fhb215bXRsNXhKZE5kZFdXK29M?=
 =?utf-8?B?dzlZcm8rUEV6cHhSR09vOEF1RFdkVWduMk1ScGdKMkRvZlVsMEdnSm9zdGVD?=
 =?utf-8?B?YkdZL1JhYzVHZ2tDelhvdE5XUkJKYklQaFdUeVhSQnRJa2F1Yi9KaW9iWWRQ?=
 =?utf-8?B?dkU2RmEyVjkvRFdWeXVBT0hEN0pEN2xlWk1MbEd0N2YwNjdENG9xUWNuWEJq?=
 =?utf-8?B?TFlJZVIwZGYzM0VkaXVOUGhHNTVSWmRBZDhvUnlCRTJQbzJiK0ZJWFUwT3o4?=
 =?utf-8?B?eTFVV2dFZ3BHSUEyaVp5MFRJNFZ2Y0VaS1hIUFNVbTlTYzQvUUJteGdFazJE?=
 =?utf-8?B?V0JXRzRNdHNHcUJOeFNaM1dkMG43MHBJRnFjM3RXRDM3ZUpEYzVGdjNLMjZP?=
 =?utf-8?B?QnI4OUZldGFLdlBpb0t2K01ZUXNLN3Ivb20ybHgyUzdOR0E3TTNKVGhUNXlI?=
 =?utf-8?B?ZFFIbnFuUkNPc1FScmR0UkxvcENNZ3oxN0c1aVpCWkhoL1l5Nmc5ZXZ5Ym9L?=
 =?utf-8?B?TTlVMEZWUTlESHRGczVSU3J5L0s5MFd3Tm5pa2I5WUNvUWxnazVFaXhiaC9W?=
 =?utf-8?B?djVDRGlMWmhhdlFlMkh5RzRleXZSbzJXZ2M5bkIyNDlpQXR5RDJxUFhsaTZL?=
 =?utf-8?B?MTJ5ald2N0xaaVV3aWJOdjZCL29ZNDhSNkJoMW9CRVdrQ3FtUHNZUHlZeEpP?=
 =?utf-8?B?U25LMVZoR1Q5VTRDL0lMWnpWRnBpOU4yTkNSeUFXNHpldWhOSUlSSDBDVHNF?=
 =?utf-8?B?OHR0RWlTVUxyd1pEY2thUXFDMytVdXd5UW03VWR4Z2JVbjNENEc5eU1HRHdx?=
 =?utf-8?B?Si9WeDhLeVpsNUdPR2RWc1ByOE9PZ2tUYVhuelRtT01QNlNqdU50WVFUZCtl?=
 =?utf-8?B?Y0g1Y1lxLzFwVVVTWjhWdCtlOWk4WmxHUTFkNHR6Zy9qemhlRDc2Wk1Kd0ZL?=
 =?utf-8?B?VzEzSUZlNjZnZW9aenRKYVVKcTBpb3hXb2ZZWE5aSkp4Rm52Q3RSeGZSZ2lM?=
 =?utf-8?B?WWxoSkZTS25IdnhoTXJRY1dEalRVWHdrNWkrNWMxeWxyb3JKSkhxVXZUQUhy?=
 =?utf-8?B?S2lzVC9oczdKMmt0djRVTnk2U2NvSTNzN3pDYmRBUC9yLytYQ0wrdW1lenR1?=
 =?utf-8?B?QmVxNTQ0cDdhOWxHVThTNE1uRGROTWgwK2c0dWpLR3hNNjBwOXB3TldxV1FX?=
 =?utf-8?B?aHh0SUh6WFdIa3UvNmhvSjdxS0VPYVhSTDBPZlh0cHo3VHBxU2FoamhFeEJO?=
 =?utf-8?B?cmJXN3Q5UDM2SlM2NUdaN0R5ZjN5d1lyR2RTRkJSK1hVTHpqVCtBR21yK1d0?=
 =?utf-8?B?MklUdXdEMlBwdlBmVThaUVZEM2pPaGpCa3JnZTkrZEJ4Slk3c2F1R2oxUkNI?=
 =?utf-8?B?dis0eXB6ZFdGTzdpZVJKSmF5YXlaSXBPL1VnYjR4MFBYUmpiOTlST0gzemtY?=
 =?utf-8?B?V2NEcHUxZHdQUmx2blBUa2hNTGM0dTZSV1E5R1pGSGpvVzBpanJFZ1hmSjJI?=
 =?utf-8?B?MlNKeURpZDhMWTdLOHJTOGMwQ3ZBelRnZlEzZEYzbVhXQlk0bTRFcTFLYkJ4?=
 =?utf-8?B?ZHZ6MkMza3Q3OWE0ODhqRnZsUHNqOUNPK1YyRHVGU0sxQW9reDFFWktxOVpH?=
 =?utf-8?B?L0VBN1plK0cyNU1oU2tWVjd5eG5tLy9sdU5PeWgxRVpZM0lpdFpkRGR3TEMv?=
 =?utf-8?B?T1BzZ29yMG9kMjcwTU5sNUlLeEQxdzdyMDgxdzZUYndPVThrclBrdm9MZzZP?=
 =?utf-8?Q?gb9D4x1xIm8DeO2gFbvUKA9kgek2nCtI25lZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZiUVFuOEp1Ung1THliL2puYU1UNndtcE1BbGhJRkNzR1h2bVIxMUZLQSt2?=
 =?utf-8?B?UUJJenljNVZCZDZTOTNScjVXUXJIME85V3plSktST0Y4ZStHZDE0dnQ2QkVj?=
 =?utf-8?B?R1hGYW1XOHFzZ3p1a1dlRmVvWnN0WDY4VDY3a2F3T2pWV1BWcHBqTWppTWpP?=
 =?utf-8?B?REpTdndITmZ4MmdoVTJDTzczWm1lZkVCaTlxN05EN3Z2bUZiTEFqYjd1ejdX?=
 =?utf-8?B?VmRJaXExRmFnVkl1T0dyQzlLa09VQitndW05N3dxQmdmSmNxL0JPNEtYbXFu?=
 =?utf-8?B?aUd4bENqUnVsTWIrMFVoeGNqMmRNdUE5TmI4T09uc3l2SWNNeGdsWGZnMHYx?=
 =?utf-8?B?ay9tNzFhcFFuWGZvMHZNZGJvM3RxdUhKMUw5NzA3dVdqSWFzanN3SitISXZ2?=
 =?utf-8?B?UE1MMjB4U2l1bmViNWpQd05rdnR3VEErRGExVUVtZ2ZaQTEvcXVkY1ZtVko1?=
 =?utf-8?B?ZGRWV0tTTVBqRG9IbStXY0VGRmZIMkJmRkxkQVZtcGNoWnlsaXV2clZwbFhy?=
 =?utf-8?B?SVpMN2ppQlArb0xtNWdGZHgwUTRZNE50c3IrUUtuK1JRQ21hRDU2M1FwL29G?=
 =?utf-8?B?WXRrVEk0MjRVL3YvUTR2bmFWRnpxd1ZEdmZ3VnNtZDREQzFyS1R1cE5DbDMy?=
 =?utf-8?B?c0NKb0g5MnNkWkhqbWRWWDdCcStTVzAxNm9PNmxEQ1ZOVkltaWQ3R2FLelho?=
 =?utf-8?B?cXQrYmtvOStXYmhTeWdTeitIMkJuOWpOeUxIeVB0S1h0bTlMbXdkSy9lS3A5?=
 =?utf-8?B?dERQWGlpU1NFY2cvNW9EbDZDaktGTUhMOTNwcDQ4R0QwK0ZmWk50dmxibnE5?=
 =?utf-8?B?Tm1YR2lyRUpmK2lRMnV6c3M2THlaazd0cUYrcXFUUDkzZjkrWGdMT2F6emhs?=
 =?utf-8?B?ZHpqYmE4MnhTSnp3WXhJbko3bGp6TzlUVWlkTkZqVTRabC8zTURBM3hhQzZP?=
 =?utf-8?B?UmZrV3VtTlJpNEMvRU5VZVZLOHNLcnNFaEk2VEhGbjcrV0FHQngwV2E5eGNQ?=
 =?utf-8?B?RDM4VlptTXludjgxSFcrL1hqcThBZnBXdzBuMnRpNVZLUDUyK0h3S1pTSlRo?=
 =?utf-8?B?NDBPNkpQdmdNZDlMZGpNMmVPT3NQb1FHNUtsT1g2YkJDenlJUnFkeG9jUEw0?=
 =?utf-8?B?ZFIyL21LdmRSNU5FbnFpNzZKTHc1dkxSRHBGM2FkNGUzdjRiZEsxNTJObVlk?=
 =?utf-8?B?S0RvZ09yUksvdis1K05URlR4dGtudWNLVUZ1UGlVa0ZXTmMvWi9wVG8vV1Jk?=
 =?utf-8?B?Y3pJMVdxaHRWWGNMZ1J2c3RUVXRjRHRkbStHdnBTdkczSzlucWpGRW0xa2M1?=
 =?utf-8?B?dFVXLzJ5RE5XZC9oamFnT3FlTGY1WGJBYSt5YTdiVVhUUUhEUkQ5KzZ3QkVN?=
 =?utf-8?B?SDhKOW9DYjlpZEgreDdUV2U2clhycHFOYU44YUtLYjV6RjUzYm1ZZjBPVm1W?=
 =?utf-8?B?QmN6SXZGRGdhekxVYlp1S2NhWVVjL05seE1PYjN1R1BkRE0xQ29Vcyt1cWpl?=
 =?utf-8?B?YTkvdTZvdjN1YUtPVTVkTklxdy82MjRxcVdkalY5YVFJUE9CbjZiaVF1RkNI?=
 =?utf-8?B?ZXFicjI3bHc1ZkdxVjZocURSeTc3U0ROdkVReElQZVRJMnplRHRJU1dwVVI0?=
 =?utf-8?B?ekl2NURqcVhwdUw1M3VvR1ppanViZW8xSStDSVpwWkhpVUpabzkyai9jenQy?=
 =?utf-8?B?eHYrYlpoUGFLa00zaHhpUXovb2VqUkZqbmNNOHZPWW04T1IrUklORjdicjVX?=
 =?utf-8?B?aTI4b2Fuc3A1VFZzZytDWHkrcGtmYUtrU3RJcjF3TmtzT3lxblNkZk84QjJO?=
 =?utf-8?B?V0VDNXNOcGNZdHpLYmpBNENCUGNsUWhVNlBtdk1jRVFKOXRYZ2J0OFBHb3pU?=
 =?utf-8?B?WUpYTUdUb3BZTFNjbDNKaVNkZ1ZRMmZidnp4N2Mrb0VmVGhLaXN4OUhtN25L?=
 =?utf-8?B?R1d3QjVYMGFabkF6ZFFxam0yc3NvZFZ6Znh1eUwrcjM0K1RzWEQxTGwwOGZG?=
 =?utf-8?B?QnhyOHU0emxIdm5ZNEp6ZEZHNmtqUnhPUHhyQllKbWxPdCtweHRIZVlqcnd5?=
 =?utf-8?B?WDF0aFBZZjJxdmpPS0wybTZmaTk3bmR2WTN5RUt3Z01vdkF0UHh3Um43YnF3?=
 =?utf-8?Q?KtRyJzu4AKE9Nu6gcutaQdAoL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3459053-a624-4743-d45e-08dda4571081
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:33:20.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yl8f4434nBtdUStZPNyk4e9CZsEqgsYFikgAi5iqAoDQjdiUquJHgrLf5sv8tSjIigB0BwPTvJjtCrd5Wz5taw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8610

Hi,

Please submit your talk for Xen summit.

Details - https://sessionize.com/xen-summit-2025/


You can find the talks for our previous summit at 
https://tinyurl.com/4ak2ys8x


Kind regards,

Ayan


