Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B48A6BD77
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924119.1327460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdeH-0004if-79; Fri, 21 Mar 2025 14:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924119.1327460; Fri, 21 Mar 2025 14:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdeH-0004gB-30; Fri, 21 Mar 2025 14:47:01 +0000
Received: by outflank-mailman (input) for mailman id 924119;
 Fri, 21 Mar 2025 14:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWv/=WI=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tvdeF-0004g5-Lm
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:46:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f403:260e::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56f9d9eb-0663-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 15:46:58 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV2PR03MB8728.eurprd03.prod.outlook.com (2603:10a6:150:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 14:46:53 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 14:46:52 +0000
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
X-Inumbo-ID: 56f9d9eb-0663-11f0-9ea1-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEdCoXU1X4EPYIJPmVY75P4G1xzY9woOmxRVb/FgVWVaq5WK77068b7BEA2X5ft+cRpph9kUWHEYyJ9YVwS5/iWYeUsVzwOka1eh1et9Pt0prOwsy45+db54qMdB3Jhr2YRjKRP9JFqEppbvjcSnGwXhj5KtxUGOrp9++qAC9KkNrIm0P1IDt2gvEf+MgnKfqGyZVK1stEhoCY6FJsoa4Jx7+4A2+wRg9fMRsvIHB6qfJew6hqAOif9x1l+cf9+HPC6BMYBu66t4e6TW+UsyIaP4bJVjpg4TjX07EGrcNliyN0remZU8fSwM95dLOqKtt+BjALiPLWVpIPq3Py5hWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao5jplHr/16EZLRN/tTjgLLC/6oDzQFGFPiXju5oWo4=;
 b=IvUb18iIxCJ4hT0VblZngeBsv7UDaFqiHI3R+5+xq9zgUiv1LgpVKfNWlzmGVYtQ+a8kaCrtdfA+OJM4EkOM2rEMNTzp3+HIgNJhYNcTiVXWeLWQIOjD+1O5jjqYEJYtSTw6prsgP10OmxiGrYNaL1FpN0OAhZEcCZXcVv7OhkCfXl1emRU8OzxeNGLQi12JOldD21LsdGdPFXdWigO8jd9wkGCHQuz092IH3PXvAFSyOXk29MpsqrMmKISmYXE69vuJXnGUqilPbMnsrC08tL7WZgXWhX/1OYcYTrtO0u+XiMDcekRH8q+yElcT4bkDfmzc/jtjbTeMgVIUivTJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao5jplHr/16EZLRN/tTjgLLC/6oDzQFGFPiXju5oWo4=;
 b=LHtU3LjaOV8UbuxPRbyGCA85Yz+IyIpo3H4W8JYQL/BC3tGLCrhT8xV5ep+nMt0Vi4dyTTE0f4f2L8Acile9d6WM83CzVmfqdbOeEcovCKbTA8rYdjzEH8XlFG+K5bATFtDKLcV3RDcCPEZF39lnkmNLSF/gDKYJ6WPf7ML770y8brFNjbj5uqlFswW18gMh208sUwZBr6bkg6iCmHpc19c219OOPHWCllzenxwJwNfQmrtSNcbkvK1IigaRDELgR7DElPJzuQ+cC38xenniaP3w8wSE9RvI+ukp5HqRpe6bty5JSoApVXT85xQHMLkoRPPRdi5X4Yoo9THCnkiYcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <20b22a61-dbd4-4957-8b01-1cedd3f55a37@epam.com>
Date: Fri, 21 Mar 2025 16:46:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] xen/arm: Implement PSCI system suspend
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <b80f0559048638bfe1a934f2d256331db733ed3e.1741164138.git.xakep.amatop@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <b80f0559048638bfe1a934f2d256331db733ed3e.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV2PR03MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: ab662e20-841f-4b25-f2c0-08dd68873811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0dtRnhsSmY2emtTbGJyMCtLa0ZnSnJDVXFSdlg4bUhXUHAxTHdlZXplejNV?=
 =?utf-8?B?ckJLMjlhVkI2c3VxT2ZmbWxhSDFaSm5LMDZjcEJPNWhoeldlamNkZjBsVmVL?=
 =?utf-8?B?OEpUSXo0VyswY3M2dmFzS29BY3JwUE5kT2xXbGtxcksrS1Nvb0hIYk1kbDlV?=
 =?utf-8?B?d0xHeGJKY3pSTU0xeS84dXdteTB5dkdhUHFyTG5BTTBucmNaT0FTYUNtdStr?=
 =?utf-8?B?bTBEZlVyQUQ1OGQ3aEhqYngzSHRxbld2T2NQdTZzV20vWk8vMEkvUzZHRWZO?=
 =?utf-8?B?N1pHS1FrWTRTbWtKdUpLeWRPMjdJTFJaUENmbWdlZTNlY2JPVlEvakdnV2JR?=
 =?utf-8?B?SlgyUVY5MjBZSk1JcHJOY2s2VHA2OFR2TmY1Y0JRaFczWW52d2RaRzNUblAx?=
 =?utf-8?B?V2Q5ZTlRVHMxVWlSd3lqVlk1UThGdDg2cnV3aXgzQ3pYQWxDeFd5Z1VOdElN?=
 =?utf-8?B?NkMwVmNaa2VMZktLeVZ1Y003Y0xwcU12TTNUUlZ1ZWpjZmJZMDMxY3RSS0h5?=
 =?utf-8?B?amdUZElYSGdIWVdhL2V4SGpsczVsZnJGZSt2ZTc4b01uUEpIL0wzL2FxKy9S?=
 =?utf-8?B?cW9MMkIxS0twcGdGY211bUFJV2ZnWitMQlFCbDV4ZjM4bDBmdEsyY1hGOE5q?=
 =?utf-8?B?MDA5U2ZYNURkcmtmNnUrY1JCbGYzTzlXOUQ4cU11YUV6ekdFVWM0Vkgvakx0?=
 =?utf-8?B?V1BBdFBzQWQzaUZ5LzU2SS9XREJxaFhyQ1hXNTJ0dEJoYXlpN1pxaUhYUGNP?=
 =?utf-8?B?Y09UTEh2Q25aR04yVnJuU2EzVnNWditsMWtiNFBuUWtaT0VqV1E4OEVrbmU3?=
 =?utf-8?B?bWdQOVJMejBjVFFKVzE5NG9UbDV4NEdXUStzWHp2VVFKUmRuZ09BaFZFR3Z0?=
 =?utf-8?B?MjdmUDZPSlVYY3Q5anNldmcxUlJrbXYvcU03b0lTQWwvblpjTGQ5T1RGUGVX?=
 =?utf-8?B?K0hKeTVtVEFQamVmM1pMMGRCUFQ1YnM5eGhqS0drMStGVTRFQWQ0WXRDVGFK?=
 =?utf-8?B?eUwzN1QzRkdXTWxPLzhwYVBRTDJRa1FHcXFCVnoyTm9IYmxmbzhEZ1IwZW1S?=
 =?utf-8?B?ZVkyR3kwMERiWFlDTW5zNWRRVXJWZ2xMS1FQdlByUzVxS1c3VGJOQzRCK2dV?=
 =?utf-8?B?Vjc4by9oRElHRTV5RitKS1VsMktIbGxuTmxsa0wvL01NVG9ZSmxIRDh1WFVF?=
 =?utf-8?B?b1hMeW5CWG9yY2VJVTU3ZTh2TE40S0ZFUVNTenRzUFZTSjMzOGR1bXZibUI5?=
 =?utf-8?B?VjFmYWliR2lDR3NTVWpBK3dJVmYyZlNCWXJMRTVKRG15ZW1rVHpxaFRYdnFX?=
 =?utf-8?B?bEVtd3FlbkczRGMxYlA0b0VzUHMrS1VLblJ2dCswR0NMWDYwZWUzSEMvemkv?=
 =?utf-8?B?RndGdUV2V28rMDFoTzV5TzhRa28rYkZyT1BOM05COWV2RllUTWpGbDl2N04r?=
 =?utf-8?B?UGRsTERRTVR2Smp2V01jdW40eHN5Qjl5S29NVlY4VXpVQmE4RmtrLzNsdEdn?=
 =?utf-8?B?czVmM3BmUTJCVTkvYy81RU5hUmdGUDZIWUw5b3hUSzFNd1A1andERHNlMjVx?=
 =?utf-8?B?VzdsWDF2STdjODhSUjBkcTM1SHBQd1FkVDkrd3VPdkZYaUpDTkFqakdLaEFR?=
 =?utf-8?B?T0JxZTI3QS9ra3A1UHBKcm9FTGhISkd3emRYZFQ1d1h0ODRRSFhva0twY2lB?=
 =?utf-8?B?b2wyNk42OVBXTkJMSFRxSEliYXJZYVNvaktBVll4czRRVWxodDVsa1VqZnlC?=
 =?utf-8?B?LzJjN0JUTG4rV2tCeDR2czhOOVFzc1BZelVSeE5nbWJyZTAvOGJOcDg1YWNx?=
 =?utf-8?B?dHo1R2VIbFpNTTI3NWR4bTR1RTM0c1pJdU5yNGxJQkNsRGhKRGlWcTV5cnR3?=
 =?utf-8?Q?bE1ndGasEJTXk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJXVExJMXZlUVRaRHZTdzd6eUZiU1doVmlxV3FWTEhRSU85SkJjK0FoVDhx?=
 =?utf-8?B?ZENjYURlVGZlRGRZdXdYcnJORVdURGZmOVhla0ZMNnBmUFhndU43azNSR09W?=
 =?utf-8?B?TU1UY1FEYlRXNW5ESFA4K3NLam1kSkh1cmZ2cHVIUlRKbmwrQnZZNUJqRjJp?=
 =?utf-8?B?WmplM3BBSkxYODU3YVFDTlB1VU9zUGs0eTlKQXFEdTlrQVk2RlpzUDNPR1VE?=
 =?utf-8?B?Y2pyY1FjckxLb21HWm9DOWx5VTdUT3JFbFljY282a2lOOW13WjdlL0Z2dVMw?=
 =?utf-8?B?NEQ1dHlkMHJ3d094RDUvZDc0T25zM0UyMC9BeGJIMDNjL0pqS0ExTDRyaUhV?=
 =?utf-8?B?TitiaExLZUt4MXM1K2FnbGFFQkRKN1d2c1hWYlp3ZDlxYUVtQ0lqMWJudWw0?=
 =?utf-8?B?QzNUc3kwRW9UZzdEWXZ1SGxKaDdiSW9KeEx2Zk04ejdQMHlJbFIxSCtQZXRz?=
 =?utf-8?B?VXNzQjB2akNIbk0wTkxXS0NsV09ZNmJmNmRuRHl5ZlRGR0RDYjJCQU9US2Ux?=
 =?utf-8?B?VEZDajB3R1Q0N2kvTm1HSUtrbDc4a3A3eHFwdUpWM1AyZXdJdk1hSFFRVXQv?=
 =?utf-8?B?S3VvSTY5OHFsQnNCQnNLaHFpb0tSMzM1bkhMWS9SNWRQY2Jld3F0bnB4VHpY?=
 =?utf-8?B?YmVUSUpSQmpSamJ6NmtXakZmTWRyZmk3TDlORHFDYkxkTkNOdzZCUHhKOTds?=
 =?utf-8?B?MXZHaXY0ZTVONGg2Q0dFbTRSLzdMMjdROFcyK2tCM1l5eWRKZ0U3KzVIeWxr?=
 =?utf-8?B?WDcrcVF2WFpXMW9aMGxhc2k2ZVM3YTVQcGd1azJ6R3dHbFdQZ2o3UHNFMG1w?=
 =?utf-8?B?akptT2Y4bklWRmdkSWtjcFhuVUtpaHAwVllpRTBQWDRjUVRHZkdKRjc4Q0Jy?=
 =?utf-8?B?cGJ3M1RlUDNNOEM3MzZ3RklSdnhrNHdNWm1lS0FHRGhvRG8ybjN5Vy9ka3V6?=
 =?utf-8?B?WGd1QThpM0MyTFE5MTFxczdzbmV0ZFFSeXJRanNkK2Uzb0NiYVdaaWdNWVdl?=
 =?utf-8?B?WFBRYitqWlZFVXpnOWhHWWlUbGdRbDdJc1UrTEhrOTVsckNNZjFVMGNQQ3VB?=
 =?utf-8?B?aUIvRTZWYjVvRkdHWGp1NTlyblRuSjc3cDVyanJKUy9EM3hJSGdrZzAxRDBn?=
 =?utf-8?B?Q2RTY3FxWGRRN3RGemFOK2pld0ZKU21BWE5tQ3I3a3I4dDFzUlY3bVd0TEJY?=
 =?utf-8?B?SFg2cHlzeVJpaUJQVWxEczFFWXF1UVRGWE5iWjAycHJKeFZaVkNQUDczY3hZ?=
 =?utf-8?B?OEhwa0hPaWJxMXVEd0tISHJzUURLNVZmSU9vM2IvTUpLT0djNkRxbDlLMDR6?=
 =?utf-8?B?SzRoVWE4Y3ZWWXVHdW9DWGhITmhuWXNHT3A5TmJpdzJ4RncwRXlLYXdJbEdy?=
 =?utf-8?B?eW5Md0daSndaSGxLd29YTVRlbEN5aUozczA1cTIyRjRkNnphSFFRM2tmRUls?=
 =?utf-8?B?OEFOOVZIeGdvSThBZ2JiOWJQMGpLNmU5cVRnZ2ZmWlMySHFCS0cweHluWU1Q?=
 =?utf-8?B?Vi9oMnplbWdtaTIrUmFuS1Ruc3M4djNGYzFJYjV2UWE5NHN5V001aytLaWFj?=
 =?utf-8?B?cUZCbXFlcnl3Mk9ob1A3U1NQbkx1WXhqZExXaFNNdzhKQmNzWFZQbEdMNlZV?=
 =?utf-8?B?OXRqZTdCaGlVT3piVkFzQ3lnaHBBQU1CTTlrSVlTT3J3UE1MT3FDWndlT3BM?=
 =?utf-8?B?U3I0VDNTMW1OaG1SUm5FTHF6Y1RpK0FjVkZlMk1rWHVJTEx6TWl5TUZjKzdz?=
 =?utf-8?B?amU5SUk2Yjl1NXJRYXprRlU1SEwzVjZsU0dFVU9maWZzQUlUaUw2K2RDMTda?=
 =?utf-8?B?ayt1bVJyTjQ5Zis4V3BOZEt4emMzSjZpZ3ZjT3VYOVBJdUcxQ0hRYjluSXdz?=
 =?utf-8?B?RERDbkx0eUtoRXlUQ211Rll0V0lnTWdTRncxNWdkcDBPTzliN0JGdGlOaDMy?=
 =?utf-8?B?R25vcDJZenV4NmdjWkF0cUhuMFZOclJKclZXMURuQ1daWHhXQlBvekVzYndD?=
 =?utf-8?B?U3hab3dHUWQ5ZFpJREJNWFNhdEw3WlRVM3RIYTdlRTl4dThTSUpSbmJKamdE?=
 =?utf-8?B?QU95NFpLOUF3bStOK1lCVE9BMEh1MzA0OU5wU0xFNmtSQm43TWJ5UVdtTGtk?=
 =?utf-8?B?cTIrc085ZlZoL1Y1ME1kUm1jR0hkK2xYQ2kzRHo2WDA2aDZOK1Fock1JbDRV?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab662e20-841f-4b25-f2c0-08dd68873811
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:46:52.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6utt6xF1pNmE28LJOqVwzdbnFHkGpT6OLKo1vmEaL+W0l+jMTU3HcfDPLhBgUHSo+hg/123vV1Fl3370bdslpv0clcrK/ACiYxyaOznkC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8728

Hi Mykola,

On 05.03.25 11:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The implementation consists of:
> -Adding PSCI system suspend call as new PSCI function
> -Trapping PSCI system_suspend HVC
> -Implementing PSCI system suspend call (virtual interface that allows
>   guests to suspend themselves), but currently it is only partially
>   implemented, so suspend/resume will correctly work only for dom0
> 
> The PSCI system suspend should be called by a guest from its boot
> VCPU. Non-boot VCPUs of the guest should be hot-unplugged using PSCI
> CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
> are left enabled by the guest are assumed to be its wake-up interrupts.
> Therefore, a wake-up interrupt triggers the resume of the guest.

> Guest
> should resume regardless of the state of Xen (suspended or not).

This is strange statement - nothing can be resumed unles Xen itself is
resumed.

> 
> When a guest calls PSCI system suspend the respective domain will be
> suspended if the following conditions are met:
> 1) Given resume entry point is not invalid

I think, you meant here - "is valid"

> 2) Other (if any) VCPUs of the calling guest are hot-unplugged

> 
> If the conditions above are met the calling domain is labeled as
> suspended and the calling VCPU is blocked. If nothing else wouldn't
> be done the suspended domain would resume from the place where it
> called PSCI system suspend. This is expected if processing of the PSCI
> system suspend call fails. 

Could you clarify my understanding here pls about implementation?
Note - below is related only to Linux Arm64 mostly

1) this patch alone, actually enables Suspend2ram of the quest domains, but not
a Xen System suspend2ram.
2) with this patch domain can actually enter suspend, but
    - only from it's own console by issuing "echo mem > /sys/power/state"
    -- guest end up in Xen by issuing vPSCI PSCI_1_0_FN64_SYSTEM_SUSPEND HVC
       (psci is considered standard suspend mechanism for arm64)
    -- Xen blocks last guest vcpu and suspend considered done
3) at this point guest is suspended, but no way to resume it.
4) Xen remote/external "control" interface is not available, so neither
    suspend/neither resume can't be triggered from control domain using
    "xl suspend/resume".

5) Xen System suspend can happens only from HWDOM when HWDOM is iteslf suspended.
    The Xen system suspend process end up issuing PSCI SYSTEM_SUSPEND to EL3 FW.

    There is a prerequisite requirement that all guests, except HWDOM, have been suspended already.

6) No wakeup-source abstraction is not defined for guests, so they can be resumed only manually

...

> However, in the case of success the calling
> guest should resume (continue execution after the wake-up) from the entry
> point which is given as the first argument of the PSCI system suspend
> call.
> In addition to the entry point, the guest expects to start within
> the environment whose state matches the state after reset. 
> This means
> that the guest should find reset register values, MMU disabled, etc.
> Thereby, the context of VCPU should be 'reset' (as if the system is
> comming out of reset), the program counter should contain entry point,
> which is 1st argument, and r0/x0 should contain context ID which is 2nd
> argument of PSCI system suspend call.

I'm not sure that above is really needed in case of Xen guest domains, because:
- RAM state is retained
- Xen quest is running on virt CPU, interrupt-controller and timer, neither of them
   will lose context comparing to the real HW.

As result, just ublocking vCPU(boot) will cause proper resume of the quest and it will
continue execution from the point of issuing  vPSCI SYSTEM_SUSPEND HVC.


Actually I've tried:
- applied only patches 6 and 11
- applied test diff below
- triggered suspend in quest and then resume it by sending Xen "q" cmd

Guest can wake up.
(and no manipulations with vCPU state)

====
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -361,6 +361,7 @@ static void cf_check dump_domains(unsigned char key)
              printk("Notifying guest %d:%d (virq %d, port %d)\n",
                     d->domain_id, v->vcpu_id,
                     VIRQ_DEBUG, v->virq_to_evtchn[VIRQ_DEBUG]);
+            vcpu_unblock(v);
              send_guest_vcpu_virq(v, VIRQ_DEBUG);
          }
      }

Above should work nicely for Xen anaware guest, but Xen aware guest, specifically Linux,
need to be updated as drivers/xen/manage.c code doesn't support standard Suspend-2-ram
sequence properly - it's tied to hibernation.

It seems "xl suspend/resume" can't be used as is for ARM64, but many parts can be reused, probably.
I could be mistaken here - still studying interaction between control domain, remote domain and Xen.

One thing, I worry in case of Linux, is that changing System PM state
triggered by writing into some xenstore property and this happens inside Kernel,
while Linux, by design, expect changing System PM state only from User space,
at least it's true for suspend2ram which can be triggered only by:
- writing to /sys/power/state
- by auto-suspend + wakelocks.

> The context of VCPU is set
> accordingly when the PSCI system suspend is processed, so that nothing
> needs to be done on resume/wake-up path.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume, i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>   xen/arch/arm/Makefile                 |  1 +
>   xen/arch/arm/include/asm/domain.h     |  3 ++
>   xen/arch/arm/include/asm/perfc_defn.h |  1 +
>   xen/arch/arm/include/asm/psci.h       |  2 +
>   xen/arch/arm/include/asm/suspend.h    | 18 +++++++
>   xen/arch/arm/suspend.c                | 67 +++++++++++++++++++++++++++
>   xen/arch/arm/vpsci.c                  | 32 +++++++++++++
>   7 files changed, 124 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/suspend.h
>   create mode 100644 xen/arch/arm/suspend.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 43ab5e8f25..70d4b5daf8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -53,6 +53,7 @@ obj-y += smpboot.o
>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>   obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>   obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
>   obj-y += sysctl.o
>   obj-y += time.o
>   obj-y += traps.o
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 50b6a4b009..8b1bdf3d74 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -233,6 +233,9 @@ struct arch_vcpu
>       struct vtimer virt_timer;
>       bool   vtimer_initialized;
>   
> +    register_t suspend_ep;
> +    register_t suspend_cid;
> +
>       /*
>        * The full P2M may require some cleaning (e.g when emulation
>        * set/way). As the action can take a long time, it requires
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index 3ab0391175..5049563718 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>   PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>   PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>   PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>   
>   PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>   
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>   #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>   #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>   #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>   
>   #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>   #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>   #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>   
>   /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>   #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> new file mode 100644
> index 0000000000..745377dbcf
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_SUSPEND_H__
> +#define __ASM_ARM_SUSPEND_H__
> +
> +int32_t domain_suspend(register_t epoint, register_t cid);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..27fab8c999
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/event.h>
> +#include <asm/psci.h>
> +#include <asm/suspend.h>
> +#include <asm/platform.h>
> +#include <public/sched.h>
> +
> +static void vcpu_suspend_prepare(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v = current;
> +
> +    v->arch.suspend_ep = epoint;
> +    v->arch.suspend_cid = cid;
> +}
> +
> +int32_t domain_suspend(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    bool is_thumb = epoint & 1;
> +
> +    dprintk(XENLOG_DEBUG,
> +            "Dom%d suspend: epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
> +            d->domain_id, epoint, cid);
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* TODO: care about locking here */
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +            return PSCI_DENIED;
> +    }
> +
> +    /*
> +     * Prepare the calling VCPU for suspend (save entry point into pc and
> +     * context ID into r0/x0 as specified by PSCI SYSTEM_SUSPEND)
> +     */
> +    vcpu_suspend_prepare(epoint, cid);
> +
> +    /* Disable watchdogs of this domain */
> +    watchdog_domain_suspend(d);
> +
> +    /*
> +     * The calling domain is suspended by blocking its last running VCPU. If an
> +     * event is pending the domain will resume right away (VCPU will not block,
> +     * but when scheduled in it will resume from the given entry point).
> +     */
> +    vcpu_block_unless_event_pending(current);
> +
> +    return PSCI_SUCCESS;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index d1615be8a6..96eef06c18 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -7,6 +7,7 @@
>   #include <asm/vgic.h>
>   #include <asm/vpsci.h>
>   #include <asm/event.h>
> +#include <asm/suspend.h>
>   
>   #include <public/sched.h>
>   
> @@ -197,6 +198,15 @@ static void do_psci_0_2_system_reset(void)
>       domain_shutdown(d,SHUTDOWN_reboot);
>   }
>   
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    return domain_suspend(epoint, cid);
> +#else
> +    return PSCI_NOT_SUPPORTED;
> +#endif
> +}
> +
>   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>   {
>       /* /!\ Ordered by function ID and not name */
> @@ -214,6 +224,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_OFF:
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>       case ARM_SMCCC_VERSION_FID:
>           return 0;
>       default:
> @@ -344,6 +356,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>           return true;
>       }
>   
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint = PSCI_ARG(regs,1);
> +        register_t cid = PSCI_ARG(regs,2);
> +        register_t ret;
> +
> +        perfc_incr(vpsci_system_suspend);
> +        /* Set the result to PSCI_SUCCESS if the call fails.
> +         * Otherwise preserve the context_id in x0. For now
> +         * we don't support the case where the system is suspended
> +         * to a shallower level and PSCI_SUCCESS is returned to the
> +         * caller.
> +         */
> +        ret = do_psci_1_0_system_suspend(epoint, cid);
> +        if ( ret != PSCI_SUCCESS )
> +            PSCI_SET_RESULT(regs, ret);
> +        return true;
> +    }
> +
>       default:
>           return false;
>       }

-- 
Best regards,
-grygorii

