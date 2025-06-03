Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19D0ACC10B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 09:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004073.1383737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLqb-0002HF-K5; Tue, 03 Jun 2025 07:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004073.1383737; Tue, 03 Jun 2025 07:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLqb-0002ES-Gc; Tue, 03 Jun 2025 07:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1004073;
 Tue, 03 Jun 2025 07:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLqa-0001mx-PT
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 07:14:08 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2408::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53baba2e-404a-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 09:14:03 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 07:13:58 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 07:13:58 +0000
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
X-Inumbo-ID: 53baba2e-404a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDSJjRwsNQ7RcVKpq0dJWxBTqzVNf7YadH+xmy5WdPSDMvy4UqAv62x+11yPMpvf4u/rCD+3Jm8Qk6afX/0+JKl+SKCvVP2sT33HTjf0F2UETSDXBd4yQ8qDWdV2TV4ZSDeC6PBNPBsKz/m23k4rUdDcXxA7HNYoyfYLkAXJokXTNpRxzylsTPg/5EDe/US8c/86a6Zmgfqinf4EeXIOz3ogSFww3YpoUVjx1g/7K8sSAP0Ih8fKKdu9TToUMtaUgvC1leeXFSnLIptqjI+rXLwt1LEMvAeeGNotxnyJ1UzTMtMmF3hg2S2y+B7Nmx8qryZtMYVZVw/HjkeAiyMgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvMQuWfpbG92+tRN/IWHo3py3BV7yqLkf6Wu/nxGDLQ=;
 b=Y9PEwAI+mQuxOU6MyNeLXfsHU+Jp/SyC2qWHjXSPLyumP4gFO7ltjzNUpioj7IWpV3iwKROJPeI/qjcjjKqildZjiI5ydj7OiExu8KwSJDWns2cWIM995PFyhXQYfMCbQf5ebxVqqbKBgRExCITBxIZtnY5nDB71+kTxl8MFwJOSirBq56EBTk8eKnD9auvXqX1npQ+oxUKR/qvO8BDxpTI/Uyu0RXqC69iL2eH0xEqcs0bimir2IzBndBJV/uciWoXoN6/zddjSAEzWkvgW0ktofnKdC1PwU4jO6Ld2mg7Cu/NG97e74fnVqzai3LAyT9UN/Cqto1VGOWeyIOF3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvMQuWfpbG92+tRN/IWHo3py3BV7yqLkf6Wu/nxGDLQ=;
 b=dS4MjgC1j8MAaKd57cBNJEPIRasAQwd8UCO/jCmsbry8FJk6y6V9Ol0KcbpS8bOEehq+tWs9XBRNhkyTWoNZ+hmN5935zeFEa+qPG1AXes8G8sDTusgtPDU8EKCZ50nkx5jq9EL18na5KSHCVJeso+cxobG/9jDuWyQgn3Pmo7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <29e19d28-103d-4e44-bdb7-dd42619625d5@amd.com>
Date: Tue, 3 Jun 2025 09:13:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to common
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527082117.120214-1-michal.orzel@amd.com>
 <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
 <28a9f398-d206-4e42-b627-bea71f038b4d@amd.com>
 <ba63d358-2fb6-4469-9653-e672e507f24b@suse.com>
 <4a806a75-0a2a-45b9-8811-caa51321a6b8@amd.com>
 <93b76d35-7d08-4fc9-890a-4657004f226a@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <93b76d35-7d08-4fc9-890a-4657004f226a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2050fc-f155-40f1-aba2-08dda26e358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUFFNEhIRVdhYkQyZVZlU1JySE5EVis2amN2V25oNWtZUDZqUEllVTBRcGht?=
 =?utf-8?B?eXY1TFl3b0pabGNYbjFyODRsaTVpVlc0QXV6eDFsTkRqVmZid055b0I1Ynh6?=
 =?utf-8?B?T3JDRU9aSHk2V2FLa1ZxMXlXMHF1TXkrUkNIeXhtcVd2L1E5MWJ1cENpbmhH?=
 =?utf-8?B?eDBiOGxEQ1RCWXdWOEZDbFZ4N2NJaENTNW1NLzUyS3M0OW0xMElEU1UyVG5s?=
 =?utf-8?B?RVFwY2V6bllab2xHejc0TTdPUHFGeEVEdkg3NzlqVmdXQnBMQzBROHBXYk95?=
 =?utf-8?B?MjhkczdReGlpTXErMmxyN05jU3czRlI3TTRoc1JhdThaZG1GY21kREdvY1c3?=
 =?utf-8?B?WWN3M0xjMnRycmpreUVJaXM2WU9vcXE2K2lMckcvalVSU1o2UTgrc0YwZkNu?=
 =?utf-8?B?aVYwaE0wRFR2b0c4bkxBVzBlNUZiT0Nva3BjQXFGTkxLaGUyRUk2V3pOZTdR?=
 =?utf-8?B?MW1BeTd1dkIxNWtvcUV4QUUvNEhxWkpFcWt0WmM5V2RiRjNLL0ZBT0RDV211?=
 =?utf-8?B?Zi9sc0llN1NROGdlZmxsdXdGbmZSdDNmRkJjTjBLZnd0cmVOaWNoWUpvbG15?=
 =?utf-8?B?Z3NwYVVQRzNsZ2gwVjl5RVJ0SkVJTXFTQW10Z0V4QW9US2kxM3RONTdZRWJh?=
 =?utf-8?B?S1BWQ1gwelBtVWhBUVhjeG5GYTZabVVEUzhGRis2NlFLWnRLT3dqdFFsTXpN?=
 =?utf-8?B?RXhGRFZHcTN1K3BPWHhIeTFtVTJ5Rm5BTGxCNWt0UWxCN1Zwdkszd2lwR05C?=
 =?utf-8?B?d01keEREeE5kSmU5Z3FLZVV5azliTzBPaEhuZFMxYVY5cWllZHo2bU41VGFj?=
 =?utf-8?B?eHBJeFYwSmtUQi9CTzRqQlRzb2JTc0NTMk5IY1lMNi80NU9jQ0pRSnJVcHZC?=
 =?utf-8?B?VXYvclNYeGhTVFY0eENlL2g1Z0hTUGh3R3FhZjlBc1J4TlpXaFZHVWZJSnEv?=
 =?utf-8?B?cVg1YzdNWHc2MUJVOFJUMThkK1BOaWpZcjkvYVd4VWRmcFVtZVVvVk40YnJr?=
 =?utf-8?B?dzF1cmZKN0hSMk1aTW9wYU52MCsydEZoUG9MS0w5NmdKYWw0MGNLaU9aRnk5?=
 =?utf-8?B?ejRpVW1hMW9kekpWU0R0SWd3YkhYQkZQQno1WmFLbHA4cHpCNVdabjdUUHgy?=
 =?utf-8?B?NFl3b0JSbUxKc2FyclM4V2FJYWNHaGY2anlreHhzSUlWL0l2SGlwN2RqLzBV?=
 =?utf-8?B?bGVtL0xUSEROZWFNVjJIMit1R2VYVFFHaUJqQ0xzeUJ2NEdKb0NTd0NTWVVn?=
 =?utf-8?B?ekYrSFRtMCswd2dmaXUydzRKNmVVa0hzR0tWUWJWYWZsUXlCeEFPYW9WNzZR?=
 =?utf-8?B?Y2pEajZJQ1ppL2t0UmJHNjZiMXlQcGtnTmV1UWs4d25HNWJrVU9hZjRvdml5?=
 =?utf-8?B?ZS9MSCtlRXMwblRidUdXdDRqUDZ0Z3JGUmo2dmdnUUVnaHpYQ2hCL3l3b1Jy?=
 =?utf-8?B?aEVYeXduSjlZMnNBaWlUM2NPbG9Wdmx3VHdwcExSVVJKczN6ZE1zbWhIUTdZ?=
 =?utf-8?B?enl4L1UyRnY0azB1ZEE2YU9rQi9lZzBKUWdBL0lXSUFQYlpXOGZ4dUVHbnBI?=
 =?utf-8?B?a0diZVd5YlVzZERxRGp2RFE1TTVPVkZBMU96T1JYdEZ4em83SldwL2pxQTVv?=
 =?utf-8?B?S3dlbzdPRlA3MHd6Z0pWSXd0QXQ3dkFCQ09uNXF1a0xRTFNzUFJPZXZOU21t?=
 =?utf-8?B?SnJEVTlFVUZwUU1IMkY4b21NRVJqQXNwNmlpZmIvQVRaQTArTjl5Uk1sTVBI?=
 =?utf-8?B?THNjSDZWQVdWWWI4cXlJRUNjSm1iSTJHL1ovVmtJOURjOGZ1cFRXWFR2VjIw?=
 =?utf-8?B?NDRjU296OGdZSkU4Z2MzT1JXd2pQVkFSd2wzV3VZTmtlT3NBMVVDTDB2a3lk?=
 =?utf-8?B?Zks5MDlPcTZ4cTJNT3Jmb1RORTFaT2xwaG9vMGRIekV5U2xhTWNKSkpjTktI?=
 =?utf-8?Q?CR0o5Uw8J/0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJPQXphbnVDcnY4U0FDTHRMQ0Faemx4d3FRcE1HK2x0a2RvdXVNWEZ6eXB0?=
 =?utf-8?B?YUNKOWxLd1lCdUpTSmpoS0haVGdwQkJxbGNoMUdxTVZpSEJESTUvQVpUemhp?=
 =?utf-8?B?dzdqTDdSa0F5Z3dwd2JJb2pyeVpSV2hRNVkzYzgvZjVBY0NTV1VtcW5rVytT?=
 =?utf-8?B?MnY2TWVtUHZ5N2wxRlU5NXNxSGRYR1ZKaldjUCs3TFRnVkZqUGl3TUp2N2JK?=
 =?utf-8?B?SGtpOU4wbUR2ZDU1S2NLNWcrWGM5NlVyQVoyMVdpK0s4ZGswVzRESEdZcHlE?=
 =?utf-8?B?eFg4My9DREY3QjVyazd5aWE5bEVnSnJNam11VkFDcjRUdVZXVUkzY2hTNDBx?=
 =?utf-8?B?YTFpZmw1ckFxcEFvQ0M0QmI5UWZBdFlDbVl5R1Jad1NIRVdQQXZ4VG5aYUdk?=
 =?utf-8?B?N2hORitXREJXbkNXditmWm1tdU5Hc0NwMmxYYlA3ZmYxdWR3T0wvR3R5TTBX?=
 =?utf-8?B?VUdVRnMwWEZTbmkzakZ6TjVGbjBKZWxGc2Iwa3dETmJsQ0hDTkV1NHJSdTdl?=
 =?utf-8?B?Z2F0a1UrbEkwdzIvY21oRmlXMUNRdGVETFgya3E3dkFNalgxNE10MFloWEds?=
 =?utf-8?B?ZGpBdXpEbzVPdHJCelNMRk9VWVlsbEpLRTVOMVBJSWphbXpCdVZqbkprZENI?=
 =?utf-8?B?OXpEeHZZVEkyaCtTZFdXYUlxc29RMWIyckQ1RVlNaU1PWThHRW82a0JGM25y?=
 =?utf-8?B?Y21lckJWZUVpRit6eFVIRnY0NStGc2F0L1NJazg3eEZhbUMwdGlySUhoRzBh?=
 =?utf-8?B?S3M1WWdVT01YdDJWSWQwOFZ4VFNrM3VmN3NmaFN6RUhUNndkYVdCRHAwbFlR?=
 =?utf-8?B?WjNkajVYeUduMDI3aFB6WXJoM0U1TS9OUEN6cUIwaG12ZXh5b1NJS3BuNTZy?=
 =?utf-8?B?VXFzYVBCMlNQS1NCcC8xdUt4MVM1KzRmanBZVnY1TTNKRTA1NlkxUDR1WnU2?=
 =?utf-8?B?YVFka3RGRnArNVJqdS9kdEZsZXBhYlJ4WnVxUElUclJucmxZUndqOENiQ2Zr?=
 =?utf-8?B?anJsMGtNbUNGNW9IM1lacWlqVjFoeXA3b0xTaU11NG5vdGZxTWdEZVVLV1Zt?=
 =?utf-8?B?dXJLWkJLWlpqWmNyajRRQmt5YzNFRThCelFWRGxVRHFEUE1xTHFtejhuOGo3?=
 =?utf-8?B?NWNUbUNtUzM5c2U1VTR0UFlwQlNTclBiSUlVV3MxS1gzMy9DcmhYL2Z0cmYw?=
 =?utf-8?B?UWluS1oyK1orTTJzSnd4U0g0TmxlQU5zZThFNDZqQVN2MnVHV0JjNGtKZkh6?=
 =?utf-8?B?dXlxLzY4TlNxYXhUR29mdzdYdVhnVHRUR1FGU2dGSTFGQ3FqelBkcUcrVDlG?=
 =?utf-8?B?WkxoRndFN2RUYmd1dytKbXBRc2U5d2lxYkMvOGdDeFBzY1BQNjNrS0NTTXVj?=
 =?utf-8?B?TFd3Y1RCOEM3NGFhSXZOOHRtV0tFYXlOdjRwbFYxY2laK3JHZjErOVhIWGh0?=
 =?utf-8?B?N3U3TnRpT1hzNlZ3T0RKTXF0NHRiZnJ4dm1jS3MrR2tOUTNjclAvbXZqK2Jl?=
 =?utf-8?B?TzJDa0M4U1k5b3NtWkM3V2VCdkttWHBuV0FJQXFHV0ZoSTVBL1NibTN0NGZw?=
 =?utf-8?B?K0FZSHJIaUZEdVRwUTZiN1lhelNialVZUGlkVzFNNWZ2ZER4ZjcybWZQWHVv?=
 =?utf-8?B?ekorUDljSHduUjJkK3B1M0lIMmdQV1ROdUhhbWZZdzNIUVRIOTFFZ052am11?=
 =?utf-8?B?WmwyeTJGTkpTcEVZdzRLZE50MFRYMkRGT2RLRFRYR0h3SGF4Q2ZQdlNZZXJy?=
 =?utf-8?B?bDlNL1FCMFd3Mlo0dXZVdGtmS3M0dWZEQ3doOVFUTmtRQkJJSVRBeEl4dUM0?=
 =?utf-8?B?Z3cwWEdEWHA4UUhrT3piQ3hVOTlwUzFVejZEdjRlMmdnVFdXTWJvOFVka2hD?=
 =?utf-8?B?UCt5YjEwcDFMMHJUT0ExaEV2eFMwTWZCc2c3RlFMd0krVHJMQUI5V3YvNEU3?=
 =?utf-8?B?YXkrcVYwanI4TDI1c1UrdDYrbFpYTFE5MmlONkNsLzJHZFovajNlYXU0UDZo?=
 =?utf-8?B?UkNNVTZJbkZ6d29SQVNrQ0lvUURtZUZkN21zK3dCcllLQmxnU2QwU1NoaGd3?=
 =?utf-8?B?eGc2ME5UNVR2aTFSblBQL0JuV0tacHkzTzNUdTNPeSs3NTRVSDNyRlFWTFlC?=
 =?utf-8?Q?s/D4B3EcHHms5gfvz4IuXJL+S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2050fc-f155-40f1-aba2-08dda26e358f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:13:58.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXA7WRw9QAFCfFRTzJ0qZpB9iKv3JygWff+FkhztP+G2aSgUDu58ZXbX7/KsY3zm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363



On 03/06/2025 09:09, Jan Beulich wrote:
> On 03.06.2025 09:06, Orzel, Michal wrote:
>>
>>
>> On 03/06/2025 09:02, Jan Beulich wrote:
>>> On 03.06.2025 08:54, Orzel, Michal wrote:
>>>>
>>>>
>>>> On 02/06/2025 10:37, Jan Beulich wrote:
>>>>> On 27.05.2025 10:21, Michal Orzel wrote:
>>>>>> There's nothing Arm specific about this feature. Move it to common as
>>>>>> part of a larger activity to commonalize device tree related features.
>>>>>> For now, select it only for ARM until others (e.g. RISC-V) verify it
>>>>>> works for them too.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>
>>>>> I realize this was already committed, but ...
>>>>>
>>>>>> --- a/xen/common/Kconfig
>>>>>> +++ b/xen/common/Kconfig
>>>>>> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>>>>>>  
>>>>>>  	  If unsure, say N.
>>>>>>  
>>>>>> +config STATIC_EVTCHN
>>>>>> +	bool "Static event channel support on a dom0less system"
>>>>>> +	depends on DOM0LESS_BOOT && ARM
>>>>>
>>>>> ... I think we should strive to avoid such arch dependencies; they simply
>>>>> don't scale very well. Instead (if needed) HAS_* should be introduced, which
>>>>> each interested arch can select. In the case here, however, perhaps
>>>>> DOM0LESS_BOOT alone would have been sufficient as a dependency?
>>>> What if e.g. RISC-V wants to enable dom0less but not static evtchn/memory/shmem
>>>> because there are some functions to be implemented and they don't want to do it
>>>> now? Protecting with just DOM0LESS_BOOT would not be sufficient here.
>>>
>>> Imo a transient(!) "depends on !RISCV" would in principle be fine, if ...
>> In this case, how can I know that upfront? When moving a feature I need to put
>> some dependencies. At that point I don't know RISCV, PPC plans.
> 
> You don't need to know this up front, do you? Neither of the two presently selects
> DOM0LESS_BOOT afaict, and hence such a transient negative dependency would (if
> necessary in the first place) be added when adding such a select.
Ok, so basically this should be left to people adding support for DOM0LESS_BOOT
for other arches in the future.

There is static mem and shmem left to be moved. I think we can squeeze in a
patch removing && ARM in this case.

~Michal


