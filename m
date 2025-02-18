Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4AA3A0B6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891864.1300875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP6D-0008Om-Ay; Tue, 18 Feb 2025 15:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891864.1300875; Tue, 18 Feb 2025 15:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP6D-0008Mf-8D; Tue, 18 Feb 2025 15:01:25 +0000
Received: by outflank-mailman (input) for mailman id 891864;
 Tue, 18 Feb 2025 15:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xg25=VJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tkP6A-0008Lt-Tr
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:01:23 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36465fdd-ee09-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:01:20 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 15:01:15 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:01:15 +0000
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
X-Inumbo-ID: 36465fdd-ee09-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNDwr3hTfqzPOk4JEmIxUgwtEwHEiXNZHl86BEdjEHByAdcuXZowdYNGO/HefvqkpGUo2kXABLyf6O+wt2u7NtZPwt1AOIPC4Igku6KZ2xAaRoIxv9GHfMm+TC9Yo9PbNu+uaxJ5qy4c+GkPdsmDmQce00DMb3WgkZDOHJwVCUPocmbpfKBmAYJIzLbBS9hT4GpOIhu+l86G6i3/fQrHm9HO2YVvqLxajT1sfdwOFa6Hw8yF6BY+QlYF66kpn6p3xSUtBY9ft8LmDNOWXy/zLWHLBZWr5OF/+vZxEIId/8bbaLv1Pd+Gnto1ClZG9cKxUsd9wBUSkV9zbvHt3S1qQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNJZLuNsm2d8TVxn1eH4/LoE+dHEDCjKoWoHMtKQVMY=;
 b=S9TAglpYZZJbVjHMRkXQkXfqBE5kJOAR6KEF9WAi1Ecz2NeePQ5ExWiCvAfgsFDT2XLqzOIGBzacdUrP5Tpyl6woFyf0gBRr5fjX1zxQZyjXdVIpGU0+3LFH8yS2m3iW0xJ4GkrhFvUtltNexUcl6CqoRFxJwhkYs9l1oOSYCqeZIN2hfJTBIgsfKndx1SWZp1a36L/DULAB0K7I1xrUt9n+pbNTHj2ueAGLHdjX/2NuXPCo6MD02AnNS6PnRZ7YeYomaBBHQ+mwETCGfPPb4xQOJuVnFSzdtqKAjMtqrZjNYd+dVTYMBTjj96rYylnTKQdg8ga8PWVSWQ+yGnnkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNJZLuNsm2d8TVxn1eH4/LoE+dHEDCjKoWoHMtKQVMY=;
 b=fDX/REXnodh0SshWvar3mrIVVQ2SrG1IN0W14WElEpDpepIoyHFltQ6gFEDDtIXPcPk/qdGfrlnVmlQ3McEU+iEaQJ14IlyStCNAYaiBgp3+fE2QnVvBbfeWJQ6AoYmEnVfpchX58D+0/1gwPJgjwJgha82xlvXAmrV1Ch2lFMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com>
Date: Tue, 18 Feb 2025 16:01:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
 <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 75490968-42fb-4d05-f5b6-08dd502d1751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEZ2ZmVQNGVRd3YxSjBwbGw5YXBoeHByUkE1cjVaQnJ1bmpMSkVwTXNnL2VZ?=
 =?utf-8?B?L0JjUlVJWjVMeEtVSVl0V0pteG9CNEZhaDBBTjliYmoxMEJaZjk0N2xPTlNn?=
 =?utf-8?B?Rm1aQ3hUbzJPTExlbDBSRmdtNkk1cjVxQzVTYlVIVVFXaVJ5R3ZDV05hU296?=
 =?utf-8?B?ZnVBcis3R1lHUTF4UFJNbkdoOUJwWXU3NWgzWHBjZEFrYXgxTFRSU1hhR3ZR?=
 =?utf-8?B?U1RLdjNZMlQzVXRpZ1JWSTRkY0tiK3hCT2dYc2RheFZZdlRBUm9qKzNGRTFG?=
 =?utf-8?B?eTZhNEVLdEZxK0hJb0xRQll6WjJmUkZWcnNjd0xCTVcxOXFZOStTTUNmMGx4?=
 =?utf-8?B?cFYvQ0ZuZkxzMVJvWDEwajFJS0pCTFh1MUZFSDB0S0h4aHhkcEMvSDRlSCtu?=
 =?utf-8?B?RUpIakVKd2xHSU1Vd0xqV1NhTWswb2dhNDFhZ0tVbmpqZzJCd3FabGt4VXJJ?=
 =?utf-8?B?TC9QdEppTEdReWdPbGI4Yk01QzcraFZ0QWlPQjdqYlArWWlETDloQzRrejQy?=
 =?utf-8?B?UHVlVWQ0MkhmR1UvdHVNUjFvZFB2Tkt4aFBDczZjR3hwRVhhMnZ3VHFoYStu?=
 =?utf-8?B?Y2c0UGRYdWJlK1RSMlFBakFMVEl3dCtKbFVxMG9KaXlCYVBvRFNHcGxzNnNM?=
 =?utf-8?B?NHJUTVNYSkE2MWk5aUtCOHgzNTR5RTM3YUVaYmFwZFVZTGxJMmtmeGNMb3ls?=
 =?utf-8?B?NWh4UFA0QklvOXRnN0c5K00veHlaODVSaW1WSXk5UDI5SGZXSWNIdGVyc3hj?=
 =?utf-8?B?QUx2ZkdrSGdzOFJHWUpWV1FJM1N3QzFtbTcwUDVyck9mMkpvYlJiUjZpRFpP?=
 =?utf-8?B?SGJqdFI0UXQ0WFZCWStMUllvRldrM1pLdzdDK3Z2a0UwMFdLSnlCeWE2SDdp?=
 =?utf-8?B?cGpVQUR3bnRrNEI5Q2dHaHI1c2MycDFLcWs0V1ZEcjVhd2FOenlKdEVEanVo?=
 =?utf-8?B?MktqTmM5bHZmZzJ6YXB2NmdMQmxFcnc2RnMyZXhHVU5hUUxJSjVDdS96dUNj?=
 =?utf-8?B?K2Q0L01nUHByN0c4WVBUazZTbWdSVTRsbmZkaHF6M3pHYkd2Mm80U2xhamJS?=
 =?utf-8?B?VGZCcXF6Z3BGWWxid1BNY2FFV2ZMQk81ZXNDUkF0SXF0ZHhYV2x1Tk1wemNX?=
 =?utf-8?B?RVJkTVlZdlBBeWY0UUNaVFJWQnY1ZEdLR284OTNTTmpxWmEzbTFENkg1akNi?=
 =?utf-8?B?NTNwaTBjUnhSSnhwbERFc3VWSnFEZjlraVhpQTRiNUYvK1hQU1RxYmZCMVBQ?=
 =?utf-8?B?SGlWTHd6QjEzK1U4SFZMQlZOTExQTzJmNFg3RlV0V2VlbUd4MmRxT01PT25J?=
 =?utf-8?B?NVo0VHJRd1JnMWk2cE4vS2IzV2k1NzhNSE4vaDZ2NCtLUHVucXNKa0VkTDFJ?=
 =?utf-8?B?WDdCNmd2YkNQTE0zLy9PR0o5WkR4TUxKK243YnpESGExb2VMQS9hR2cyRzBo?=
 =?utf-8?B?YXhQRlFVUzdsYXlaSmx1M1FNWGdnalE4ZDV6dCswYXhIaU9lVEFtNGpHRW1I?=
 =?utf-8?B?Qzcyd0VqMlllVFhSZytuTmpGY1RvRXY2cGhQNlNuckhiM0lFcjU2Y1RNSHhZ?=
 =?utf-8?B?VTQxeHltMmdGbXdvM3kvZDloV3N5R2hwcCsvcFM3alZ1b2krYXFMSFB4RDlX?=
 =?utf-8?B?Unk0c2xVR2J1VGR5dklISVY2UjVOQ1F2SVdjUTdtaHhNTnVIRjRLTnJhWWJp?=
 =?utf-8?B?ZFd2Ujh5MEFkcEpTcW5kcitMTFR2TDJNZDJDemRCQVlkRHcwbzI4MlZ4OUQ4?=
 =?utf-8?B?YlhQcGcvdDAwZGltUUI0d1VjbFdFc3A1SFVTM0Y4ME5xRWtFZzREYm9mMGV0?=
 =?utf-8?B?VXQ4SkhOWDQ0L3JUQUFyN1NhSVdvaFlSKzNnbmUwS2taZlRQMjNhQUdWdkJq?=
 =?utf-8?Q?uTyaDScvx6WX2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3BhSmRuSjNmOUkvUWhRSVhzSXVXeDZlREFWK2l0ME1FdGxTVytTd2M3YzZh?=
 =?utf-8?B?TFNFVHhLSkRINUViakFEOVNOWnBjTkoyN2VyL25ET2JYV1JTNnVqQ2Z3L2F2?=
 =?utf-8?B?OExqOXFPUE9zVG0wWU8yVzhkLzJoUDBpekhrTjdNcjcvdE9BV2hpSTBTQTZj?=
 =?utf-8?B?M1BUaC9OaXcyRkl5TGMxSFdmVWl0VE5XNzU1Si83K0FJYmREYnpDWDFDK1pj?=
 =?utf-8?B?c0Jvdkw1VnYySHNqQnVxcEtmaTJXMHNyNFZXMG1nQjRSMzlXL2QvTVYzRXBS?=
 =?utf-8?B?VDVCSFo2THdkeDIyVUFMVUJOQXFmM3hLSUIzK051YWt0YXEvcWhQUERCUDUr?=
 =?utf-8?B?dnpXY01hTkd0REFDWFYwYTFmeHpLajM0bmxPcnhBQXpqTysrUXdSTE0yQS9u?=
 =?utf-8?B?VkVjcm13aUkyUlQ2eGRjNkc5bGlXcW9XRmNCVGtpTXpXRDNYOHdVaHNYVkFy?=
 =?utf-8?B?N3QxSGMxR0cyRXN5UitYcGFMZEc2K0czdHRZbVhWK3hpYXVvT2hxVHR3NzZF?=
 =?utf-8?B?TWF5MnRhaVpnb2lvbGlFbllMK1ZySmR3MTQ1VWlBQ250QTk3SGxZZjZtRHBa?=
 =?utf-8?B?aW1VbE9BKzdpeXJpR25UeVRCVEdUNTUzVXBPVHRYNFlzQTEydkU2YkswWlNZ?=
 =?utf-8?B?Mm1oWU5YYXJmUlBlc0NJdVhYZGdhR0ZaSGY5VjVucjQ5MUZERzdYZWVBQnl1?=
 =?utf-8?B?MW14cTd2d2g1Uk9CLzdYN0w2WU9rNGdRYUdqdGJ1bFBMYUR4OHpocWhjbUVN?=
 =?utf-8?B?bnZkR25yMS8rT2psZEFwV3djcTArR1dkOW5KWWhmVXlaaW41L3N4bzMrc2hq?=
 =?utf-8?B?aVVuT2VVWG9SbUIxWTFoMThnM1MrWGRlZm9Palp2QisrUVBleDg4TkJzQ1ZB?=
 =?utf-8?B?amhkbEVWY3MweHdBK0wxSTZ6YyswR2RML2U3c1RXNlhqWWlrWW9TWDVmaHpT?=
 =?utf-8?B?ak9qQnpNdTFvMlJlVjdwaTAzWUJteHZlUGpiclZMSFBvZWVNWWwvTUxQR2dt?=
 =?utf-8?B?N2RNWlpjTm9nVksxWVVhREUwNnRLZDgrU1FmOWZlZ2taSkRoOXU2Qlg4Und4?=
 =?utf-8?B?SXFaYUxoVURkS3pPRkkxUEp3bk5CdUlWb1hXZi9DeC85TGpIY1FUZWxWM3dQ?=
 =?utf-8?B?WERINU1oS09zcUNjMStiWmN2UC9MYVNaaEt0cGhWbHd4TWZXRk1Uak9kRWVj?=
 =?utf-8?B?YlRsQXpHM1RORldPUWtxbmJFMjlJaHNmckwzTGFBWjhvaEYyNFY1ZzlJMFor?=
 =?utf-8?B?M3crTXQrdTJuYjR6SGpFenRHVkR2dm9xQWtOVmVWSkJCWDczYmFmaFpZSXY3?=
 =?utf-8?B?amtoTGFNVTllUGs0dVU5cDlBRnYxdURhYTg0QXUxV0Y5NTVYQ3o3d0FzWXI0?=
 =?utf-8?B?enFiZkQ1OXovMUNuQXNlZGRiQkZwUU90TmE2RVlyRW1ud1Z1cEVJQ082Zmp4?=
 =?utf-8?B?N0xOL2VPczkrcHFuS1J5RVoxV2JmYWhOY1B4V3hBeFlkRDVpYUowZ3g5aTk1?=
 =?utf-8?B?QXRad2dRbGQxZEg2UE5XUVQ3ZEp0ckY0MXQ5RE9sNnJYQmYvWDVvWkV6NzQ3?=
 =?utf-8?B?TnpoT1lpOWNWbVlMSlVucHhFMHAvUHZpdjZNNmhOenRma25FNlpyb0xsMjJp?=
 =?utf-8?B?WnEzMVNuUUZyeGp1d0VjalZyRERlWTE1dGo2T3gvSmdjRVpqVVpGMGt0a3h3?=
 =?utf-8?B?VnZ3WjJ3c29VWkZhcHFhT3pxYjhUcXM3QWVJRlNvSERvV0VZMU1PSDlFOFYz?=
 =?utf-8?B?NTlVZ3pCcDVIcTI1eGxSeFdLVkhWQjV4cExrN3B2N3V4czlDRjJYY1NoeDh3?=
 =?utf-8?B?VUxnQ0dJSDYvNTVST0ZCNlRvTUVsRHFHeVJQalJWcThTQTJkSmxSOEJpaTRk?=
 =?utf-8?B?T1hvSit0cHBGNDhvUWxub3kxRFRnQWNoZlF6amxjMFhibkxadXFuL2xkb3p4?=
 =?utf-8?B?bDV2VHNENVQ4VmxBZGIxOVg2ZmFIWHoyVitNa2dGRGprbGxtSWZ6ZHRTTTEr?=
 =?utf-8?B?Ylp6RDUvSnFQbWV0eWpmeGFFQWZDZElROVVCdU1JNGpmN2kxOUM5RVByNjZE?=
 =?utf-8?B?R05vam9oK3JjRFA1YWpXV09FTjdMc0JUU1ZXSDFnNGEycWNKYlZ6MWowZkFL?=
 =?utf-8?Q?N5Wk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75490968-42fb-4d05-f5b6-08dd502d1751
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:01:15.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lub3HrGsaA/hxt+DBAPICQ/VpbaWv0cOxrmXB/OrdPbrx4rwGNQeErm8puAEh/gc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597



On 18/02/2025 14:44, Jan Beulich wrote:
> 
> 
> On 18.02.2025 10:51, Luca Fancellu wrote:
>> LLC coloring can be used only on MMU system,
> 
> Just for my own education: Why is this?
I read this as it refers to the feature we have in Xen, not the generic concept.
You could in theory achieve cache coloring without MMU using static allocation
or some custom allocator but in general we benefit from being able to map VA
to PA aligning with cache coloring scheme.

P.S. Personally, I've never seen a solution without MMU.

~Michal




