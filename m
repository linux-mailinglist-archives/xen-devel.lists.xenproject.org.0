Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E991ACC431
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004189.1383847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOgI-0006fs-JV; Tue, 03 Jun 2025 10:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004189.1383847; Tue, 03 Jun 2025 10:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOgI-0006dk-GB; Tue, 03 Jun 2025 10:15:42 +0000
Received: by outflank-mailman (input) for mailman id 1004189;
 Tue, 03 Jun 2025 10:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idzp=YS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMOgG-0006de-CN
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:15:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19490ce-4063-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:15:38 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 3 Jun
 2025 10:15:33 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 10:15:33 +0000
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
X-Inumbo-ID: b19490ce-4063-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0zORsoqMPDO7BG/kJq7g3omvibWtGutbh/iQK3MQX0BB3H7XLxOAg0UUZO7dzsEA0xBEhnt0ebauZ96bmZVA47n1W92D+xLpUCm2drU8tKNGe0qdt+cnZ7PIp2aTQ7//Toj2mAY5FRIMy+ZtLJst1JT4TYaiQ6LHGPee8eeAnJz3fEGXab02V/xSgJjhv5npBtn/EPMvrXQGSQQ9xq1Op+/dSrv0WVOsljONotsnIy22DvAOztRZHU4ztIQ12gNSTk3Z9sVzlZkMZ15bOxAftUP9CuymQYmvv5bZY/JG1qfLQwREHnvNu4KwJFL81gLzPB7bbuKlZSIE/Z3EoD57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYOvf9r1OaYSnQZxFAyl2QboU/Idp5Ostc+Zjev2EhA=;
 b=HMSdBa3Op3untwYspgVWHL1g4NsGYXDfaxxMuzc+ZtXOJEFDEteXuvuifG65lmlADCN8G/NX72MZnTLuRLEzqqXK1N3sVBXiB9ABpbmkrcEQ9S4BqdBTMEUobpXtyKFDBIP6BwCRjpsRbv2pTNTIIShDe0pYH4QHwA1rY/PB7xn96PZaRbe+YwH0og2tmb5y7Q+CSSuGf9FoDLasNOEz5p/DEdTJ7qtowM9AayOWByuhM66veIH71Hb+8JpmTfxPTvwt8RZp2WjnWkv5DovgTA1ed+I4v7Ldwu0HhsE2npvAmrIXyQGWC7zQ6CtDNaXqcrIu/3C6ZIY8hTD8EVJOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYOvf9r1OaYSnQZxFAyl2QboU/Idp5Ostc+Zjev2EhA=;
 b=Pr1eMP10EU4moHdLnUVW2Ov2q9D3vEWnj51qPGulnxOskM4gJ227h0Kp66czT9/MI/mdUJ4qEe3DxRbY8XKIw+MWyv2x9SOVUKCoX2bJm1cbYeBfxGFs7Vo/B/RPL5AJuZVfyAz0rXMKQARaVAcGZv7w2U4GljfRVu8Mfiv7h4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <31594e99-d509-4081-852f-67ef2122149b@amd.com>
Date: Tue, 3 Jun 2025 11:15:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
 <2040B386-299A-4BC5-BC59-7D3F58835A2B@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2040B386-299A-4BC5-BC59-7D3F58835A2B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e28583a-f6a9-4b41-fc0c-08dda2879324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1VGQ3FmbXhVNCtMdi9EaUVKWWl1cnlQTXZjZndHWlF4WHNJMlpGR3UxV0VL?=
 =?utf-8?B?UkpPbXdvS2RQb2YwbGJSTU9YNldkcmNCSlZ5M2JCL0ZKVjhWMDFqbFhPaktT?=
 =?utf-8?B?TlptTXNOekZhWktucjJCdmE4SVhYdnl5MlF5STJaTjcxZkRmajNaSmppcVZS?=
 =?utf-8?B?ckJNSFR2Qm1QTFBxODYwRWd0N1JlL2dPN1gxRUVrOHpmV2kyUXJ6dmpJMGJS?=
 =?utf-8?B?Vzk3S29KTjhwODZ4NzRLWk90YlU3Ri9JSGhwOGFvSjBHN1RZNjBmSmp6M0d1?=
 =?utf-8?B?Tzd5Ty9yQ2NWRlNXajBibFA4bThLMUJxU3VUbXczK1BRV1dWZk1yTGtjMWc5?=
 =?utf-8?B?TlQyUCtjY3prRGZxSGxYcjZYb3Ivem9VVEpXd0Vhb2RjSnRYaUh0Y2F4bUZv?=
 =?utf-8?B?cHg5R0wzdUZQMEFuamtXMGprMEIwWk1zNjdLdHpzYVBZZVhsd09oT2xrelJK?=
 =?utf-8?B?MHpJQUwwOGl3Uzk3QmhMaWE1TXA4UXFEYzFDb2w0dVAyQW9wUVdGRkE1dHNo?=
 =?utf-8?B?TFJ6Zk1rczFzOUdmL1JaNnA0dDVYN01ldzJpOVhBcFRUZFczOUxFcm0wQWFq?=
 =?utf-8?B?OUxVNW1YSnNqQlpDNm9kd1pNS1pDZUg0cHIzYWlDNEJScWxHSWhGWXNEVUxG?=
 =?utf-8?B?Q3dUcmhiSmxqaEJ4SUlVWGNNaDQwS1l4ZmhIdkIrRng5ejdrQmsrek14K1Ir?=
 =?utf-8?B?WWlseFZUOHlzV0xidnp2cGw3dXdnOFNVdkU5MXEyVHdzbGErYTNBN1k5MWRQ?=
 =?utf-8?B?K3E5NmxOQytPUXNPZnhJbVJ4em5Vb1FmbnV5aWNEalhzVWdidnROTFZxN3F0?=
 =?utf-8?B?TEI3cTVTWG9YcEk1KzhSUnVybXAwRU9LNmRyWlpzK242ckpCTW5zRjZwV0lT?=
 =?utf-8?B?cUVVN3NKTnhvNHU2azdWOFRxK29EcXBDUXVQcVdKbk1pbCthdzdOazFJSklB?=
 =?utf-8?B?T25xMHNRbUs1TXk3T0xwWGh1ODJVUHNCWEZ0Zk40SU1YUTNSWlFGbkl2YW82?=
 =?utf-8?B?RUlrUUV0MjBxT0VUaWtKN0xFajJkTTZhVWl3eEY0dEhkY0lia3hZVGI0NVk0?=
 =?utf-8?B?c2lia05xRnpTSnJGQWRtTHVWN2YzaVBDWUR1aktINFNSdE40NzJyYXIvUTl1?=
 =?utf-8?B?U3B3NWIra1hBaHcxZlBjaGNNOTRjdWNleWNzSm55dlI3djNxblAwMTFETkIr?=
 =?utf-8?B?RnhNeE9SUTRybVNqZDNDMk5kNlh0a1JpT0Rab0FEU2s5dXpsOHhkQUdlVjQ0?=
 =?utf-8?B?QU5ia0Nuay9uMTFMNVNlQWdRQWdZWDJSQllSWXRzTWNXNGJYOWczRWJUVUky?=
 =?utf-8?B?K2ZxTEl2M0Z0akg1ZGVXM1B4L1V2aCtaUG8yM1N3QjNIejdpWDlJM0d4MEF6?=
 =?utf-8?B?SDhPYnU3Ry9VK0Y3UWJ3TWJPRWFscFRncWFHWDRUU1JtNFBxeXViYldDbzRU?=
 =?utf-8?B?d005b2xFeU5ZNGRqbXViSWZSVzFpcWZ1MU5oZmphb21LeURER0k3a1BwQkxB?=
 =?utf-8?B?K2lIMlhRVEpaaFh1Zm5Jckp1TEs2YTAwR2VXVE5lR2xYOTl1MVAyY3k1d0Ur?=
 =?utf-8?B?TWNVLys1Wlc5QkhvUXhkQzN6cndvMmxCZkdHV095eFc5a0NWRVprSzd1bFoy?=
 =?utf-8?B?eThUV05vK3RVT3I4cy9SS1ErUGRUWGc4a3ZKWk5zOFV1RlJjYjFSVFlTTDA5?=
 =?utf-8?B?MUYxbmU3eVBxbTRDS3N6Q1Vhc0pHQ05RcVNNVktQdlhGNDNOTlU0dzJLWExZ?=
 =?utf-8?B?WDhiMDh4VmpJTUlBYkxOMkx2ZkR1cEp4MWFIS0I1MzdtNTVRV0xPRXBPaEFQ?=
 =?utf-8?B?bWs0dW9LTmdLT25qZmd1aWNhSjIzN3pKbzhUSHlOa3F6L2Zhc1o5M3NLaXBj?=
 =?utf-8?B?NHFoTERtTlNIbHZnS2E1MGloWXJrdm5lcG9WU0Rzc1JvamVtZ2NyRkFPQjdx?=
 =?utf-8?Q?gW7yAWL64sA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlVtcU5NL2J3cysyYlRkaTB5YmZJc2dtR1VPQTJSeVg5cndxdk80NjM3ZHNY?=
 =?utf-8?B?V1V3SkFvMmwwOUEzYXk3bmY2TlhjV0NPbG1GWVMvcG9HWCsyU090QmIrRXNH?=
 =?utf-8?B?YnMwMjJzblIxQ1JvWmtGZytTQW52RGZ1R0FNbkFyTVBFQzdhbENkam1rRWVo?=
 =?utf-8?B?azFiZ2x5dnV4UHE4TW5PbkNteGZzdDM3by85WDVYTHQwQWJVakVwM2xzemlk?=
 =?utf-8?B?bDJ4SzFjRloxRlpMVmtMUzN6WXVoUW1SbjBLZXdLSStETjZRazY2YSszM1dp?=
 =?utf-8?B?UEFueWtKWXQrOHYyRDExbFFVZ0Z0K3BCWk9PakFmallpK0JyUUZyS0NrNUtn?=
 =?utf-8?B?RkI4cnR4bUJlejNKSWtTbDJKRm9DYWcrQXA5NSt1ZVZydEplSGxKNHprYVdp?=
 =?utf-8?B?bEdyWmN1NDNFUnNYSlNZM3NMSDlJM3c0R01FM1VYdGtXS001dEFDaWlVaXgw?=
 =?utf-8?B?R2R4bmhFN0NaUXQ1UXBLYlJtanVIaERUSnROREtwSzNQTXl5RkFobVNYdVpm?=
 =?utf-8?B?dDFNUzhFNE45R1cxU3NlK0oyaEFTRHlIa2tOWnpkd0NJa21WSnlEenBvYkRD?=
 =?utf-8?B?SmdLNVVSeUVDTk9lam9zdlhDOXVRL05lNGx0Q1FaS1pXM0Vndkp1K1Yrci8w?=
 =?utf-8?B?RFMvbXY4Ujh0YTZYNFpTK09hcFJLSEhWQUtVOExJNmIyWFZndUZ2ZDQxc1lF?=
 =?utf-8?B?R2FGbmtJeWpvbFkzc0FwcU9DOUQwWHlERERUSHlMaVpaWXBYQzIvM1NFWUtk?=
 =?utf-8?B?eHVZaHRZVmZCZldGZ093d0kvYjNvK0RhcUJndy9CZjhhWENGbnJaclBGQ2tz?=
 =?utf-8?B?RXZ2cUxYN01NVkxTcHRDUFBldVA5S2hOZ2xzTTRzajlEOHhRSHlTRmRyc3l3?=
 =?utf-8?B?WmlMRzU1aTBKN2NnWnVkT01GWkZoTXp0T1pDL2dhdmZFZmhYdzdYSEdWRXIr?=
 =?utf-8?B?SEpzM0pHWEp4TllzTmJ0Zm1sWC9jVEM4U1lrMElKSWEzSnBPbVJWSWpFa1l2?=
 =?utf-8?B?WGpreHBqYkJxTUJWNGJMWnhLK0h0QzFIQW5ybG1lQTFaNC8yeXlPRFc3aGRr?=
 =?utf-8?B?elZsbEc2aFUydUhWMHk5a0V2TTZqUE9ZSWdZVkVrTDEzbEdiSVFNcE5Wcks5?=
 =?utf-8?B?N2RSbWRVKzcxbTNXVnNPWVlyZUJyUXdZdTlGYm9PbWxDYnNlZ210VTFtcTBT?=
 =?utf-8?B?MnZaR3o0S1JEUzQvbFlWNkFtbVNaNmh1T2J3VWFYU01RZG1OZ0pvUU16WExF?=
 =?utf-8?B?SGI5VXZzMEU3TnA2Um1RcElCdEI2WTJpd1didlRkS1pBbU9QTHllcURHYjBO?=
 =?utf-8?B?b2Q4aUwyY04ydGtRbFlLSVErd3VkU0FNZzJXNGt1bDhNbDBYZDJ6NXZqTGJF?=
 =?utf-8?B?VU1MVW4vTFovUXNqWWRuQ3RZTitZK3M0WDBGYUx5K2tRT1NDTUxOejkrQkl1?=
 =?utf-8?B?czZXOXFFZjhIQmxYSXlGUlpkeTN3d3ZrRWRTUmJucmRoUDBraGJJMjJ3VHFC?=
 =?utf-8?B?S3I4aDVEeEVBUlVXYTgzdmVrN09zamhSYTFDZXlUZWZZeEo5cHBWVm50RzVp?=
 =?utf-8?B?T2hOMGRHSWJDOHp0bHYrMjdBV1YxVVQvRVV6bStkY1p5YzVGUlBvMmZ5WDNR?=
 =?utf-8?B?VWd0bWNsNW4wYlV4QzByWUdLVE90cStIYTdOSGFIY3ErTEdiQk9DSmhQMU02?=
 =?utf-8?B?eURWN3RQV2lyOFFRM213TlBYTTZrQWtEU2VOQzVxcmJIV2hBWlhrVmFWRmxy?=
 =?utf-8?B?YkRoYlFxb0VtVlZOS0N5Y09qZVRSQmRGR050TXF4NlQrMjQyL0lRYXRxZkth?=
 =?utf-8?B?NU15a0QrWjNjYTg1dnlMZytiZ2QvQzM5NEtuTEtSaHdxNElkd0ZsbWhmWHZn?=
 =?utf-8?B?MUVLVGNocGlMdDBLMitsTTF2aXFGM3Z2WmFjK2NOWm5ZZ0o2ZFZvcjFHZlpZ?=
 =?utf-8?B?MFNCM284b3d3WDRld05zRWprVGhUMzBPMkVueWZXaVFaaXd3dVFUenRobEtk?=
 =?utf-8?B?UjhIcHhEcWdBL0Q4aG9ueEZYK3dRMFZlUG9taEtFVWpCYUNqTFM5dEY4M24v?=
 =?utf-8?B?T0RWODVEVmk5Lzd1VDRCUDFYUlhyYnlVbDhPQ3lSd1VZR3puZERGcHRhcnZr?=
 =?utf-8?Q?Q+zu6/9337jqxPu244qOCqne9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e28583a-f6a9-4b41-fc0c-08dda2879324
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:15:33.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E0OOvPmwhMK+N48zJOgTNOlvSbXD3IAzNkbNBNEhRoWfV2RcuHAiwQoyfLSdSYQxtn2olG6RdjP+oDDqvnu/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675


On 21/05/2025 13:02, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

>
>> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Define the requirements which are common for all the commands for XEN_VERSION
>> hypercall.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
>> 0 for success in all the cases.
>> 2. Reworded the requirements so as to write them from Xen's perspective (not
>> domain's perspective).
>>
>> v2 - 1. Specified the register details.
>> 2. Specified the type of buffer.
>>
>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 58 +++++++++++++++++++
>> docs/fusa/reqs/index.rst                      |  2 +
>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>> .../reqs/product-reqs/version_hypercall.rst   | 43 ++++++++++++++
>> 4 files changed, 119 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> new file mode 100644
>> index 0000000000..f00b0b00f9
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> @@ -0,0 +1,58 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall
>> +=========
>> +
>> +Instruction
>> +-----------
>> +
>> +`XenSwdgn~arm64_hyp_instr~1`
>> +
>> +Description:
>> +Xen shall treat domain hypercall exception as hypercall requests.
> This really reads weirdly.
> Maybe: Xen shall treat domain hvc instruction execution as hypercall requests.
>
> Then you can add a comment to explain that this is detected through a specific exception.
>
> Also this is not completely true as hvc is also used in other scenarios:
> - PSCI calls
> - Firmware calls
>
> So i would put the 0xEA1 value as part of the requirement.

Description:

Xen shall treat domain hvc instruction execution (with 0xEA1) as hypercall requests.

Comments:
The exception syndrome register should have the following values :-
ESR_EL2.ISS should be 0xEA1.
ESR_EL2.EC should be 0x16.

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Hypercall is one of the communication mechanism between Xen and domains.
>> +Domains use hypercalls for various requests to Xen.
>> +Domains use 'hvc #0xEA1' instruction to invoke hypercalls.
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Parameters
>> +----------
>> +
>> +`XenSwdgn~arm64_hyp_param~1`
>> +
>> +Description:
>> +Xen shall use the first five cpu core registers to obtain the arguments for
>> +domain hypercall requests.
> Why not say x0 to x4 registers instead ? You use x16 after anyway
Ack
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Xen shall read the first register for the first argument, second register for
>> +the second argument and so on.
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Hypercall number
>> +----------------
>> +
>> +`XenSwdgn~arm64_hyp_num~1`
>> +
>> +Description:
>> +Xen shall read x16 to obtain the hypercall number.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index 1088a51d52..d8683edce7 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -10,5 +10,7 @@ Requirements documentation
>>     market-reqs/reqs
>>     product-reqs/reqs
>>     product-reqs/arm64/reqs
>> +   product-reqs/version_hypercall
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>> +   design-reqs/arm64/hypercall
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 2d297ecc13..0e29fe5362 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -79,3 +79,19 @@ Comments:
>>
>> Needs:
>>   - XenProd
>> +
>> +Version hypercall
>> +-----------------
>> +
>> +`XenMkt~version_hypercall~1`
>> +
>> +Description:
>> +Xen shall provide an interface for the domains to retrieve Xen's version, type
>> +and compilation information.
> I would say hypercall instead of interface here
Ack
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..400d51bbeb
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -0,0 +1,43 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version hypercall
>> +=================
>> +
>> +First Parameter
>> +---------------
>> +
>> +`XenProd~version_hyp_first_param~1`
>> +
>> +Description:
>> +Xen shall treat the first argument (as an integer) to denote the command number
>> +for the hypercall.
> I would be more precise and say x0 value.
Ack
>
> Also "integer" is unspecified, use a more specific type definition (32/64 bit signed/unsigned integer).

It is a signed integer. The size is not mentioned.

ret = do_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM(void)){ _p(a2) });

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Second Parameter
>> +----------------
>> +
>> +`XenProd~version_hyp_second_param~1`
>> +
>> +Description:
>> +Xen shall treat the second argument as a virtual address (mapped as Normal
>> +Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in domain's
>> +memory.
> You should say "guest virtual address" to be more precise.

Ack

s/guest/domain

- Ayan

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> -- 
>> 2.25.1
>>
> Cheers
> Bertrand
>

