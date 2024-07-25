Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B393C898
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 21:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765108.1175696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3nm-0006b4-8W; Thu, 25 Jul 2024 19:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765108.1175696; Thu, 25 Jul 2024 19:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3nm-0006Yi-5c; Thu, 25 Jul 2024 19:06:58 +0000
Received: by outflank-mailman (input) for mailman id 765108;
 Thu, 25 Jul 2024 19:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Kni=OZ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sX3nk-0006Yc-QD
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 19:06:56 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e501102-4ab9-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 21:06:55 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 19:06:51 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 19:06:51 +0000
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
X-Inumbo-ID: 0e501102-4ab9-11ef-bbff-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxNli1Ob9cR+t0DgoMLIiDg311MaDyZd81I3roGfpSoJBt7mHg6huRsTe8sqM5vddQ/v/epHc99YGLEPBkuBBgUslIsPoa41nUzaoi0MsZ9PH4VJl7U99MkEma3nKAi7rsmJvg4GdZMz8Rm64zZwdsHmy9XKCp1lm0JfQRQed8GII8FvTWqD7aBV51bK8lunUXRqPW2oLK4mRmLvNisn9783YxGQWUZxWlL5VxJVJGxPoy92pzwTQSq0mfgIUtd3GbvXpZ3FDAi6rQQ9oDPSHf7AXRpdJN6jXaPKMHChkWlQXmkAMFi9pWqDYGcwrauR3fbxWW09cci65JUWgojGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNrNgZSSLzuGE6KNPjMD0lJbD7HochztpqdypL0VwgQ=;
 b=a1kq195TqExe+RNL8rgotg7ZDisJjwWAIaZUEOaNziojf6z/PmFokGXaKBEpYVZozrxnmsyTo3WsmcEq5lRjV+lIt+F02LH3L2VgFaIA70hkBfjLMJM2/WUGJV/QYgu90L/Sw15QZpFSbitgu3vRMByM2dzCitstYPTFWtCoeHdmD2po/+lTaJiIWXXddfQ2SUWdlxAgxYybgSW8hAsb5eY1NjVnLwXJt0gvGbvwVgsma6r9EWVZqZxojSNdLo29U+y8xtA1RUTAupouFmod7kznluDaLOFzAIfyrTeafEzyT3r8xcEX526nbb6IV/xJnXXhSwlkYVP9XygDhXO/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNrNgZSSLzuGE6KNPjMD0lJbD7HochztpqdypL0VwgQ=;
 b=HXO27oFvhRXwNmsyxtTwBDBkHKpZOemNFw4sqwQCpM+b36kXDVnNKClBPfo4g+tKqeptHUMsm8S9GP286hHaCNLeK7Mz2ow3Zl1yDoOKY8gPJIflXK1iy876KIaQ2Oeqvw2sm62jtFG/JdeAfo5evUCfxc01n8W4JKoinCVUcPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <662924ab-18fb-4b15-b3e3-4f09ef770aca@amd.com>
Date: Thu, 25 Jul 2024 12:06:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 189c7d58-195e-4203-2a47-08dcacdcf0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHMvbjJRS3N5NXVDSjlMVHpHdTYxRy9mWkV2aWJnNkxMT0FtdDlqMVpGdTRR?=
 =?utf-8?B?bWNGRENMenlSd1hacjI3cmlJYXZxR1IzV3JSY3VVcFNjTlBmV05RR2IrK1dx?=
 =?utf-8?B?QUNtcFVkQmtpNVA0YmZxZDVxVWQ3Vi9IOFJ3RGlJOG1GTkhxSndYeVdoZ0xO?=
 =?utf-8?B?cFliNUlNd1hrSTIvRXU3TS9Bazh6RUJ4QTlqeWQzakJRRFhRYUkyNERBMWY2?=
 =?utf-8?B?eE1HSWl1eTZPdXd6ZlVsVkx1ZFpUWHlIcTQ0N0RuZ3l5UVVac2lxUVlNbzZP?=
 =?utf-8?B?WUU0Njd1VmczNGdsSmRZbFp4dXdHeFEwTWpoallEYnVENUVoUVJoTk1MSVpT?=
 =?utf-8?B?aVhNRVgrdmRybTRSamhPMnhWZ25ySzJsaDFzc056d3UrbnB0Mk5Ob0UvNVpK?=
 =?utf-8?B?QzBMQWswZlBhdVlRRkVNSXJBWEdxWVNsNVBkVi9aV2tTVmdKSFNPa3p3M0d4?=
 =?utf-8?B?M09VUEY5WFhmQU1hR1ZCVkEwcjU4TURpaVBPMXlFQkFoR0F0U1pNZnJ0OVdD?=
 =?utf-8?B?d0Jpb2tXSW51YUFzTlJ3ejNrK2JaTGlQZm4ySzVrK05ZNXdtckNIcXpzTHlD?=
 =?utf-8?B?Vk9rQUR3T09lbUdnZ0hxdGUwUHI0NjFuWWhWaDcwOUIzc05ONDNqV20yMHoy?=
 =?utf-8?B?aU45bHh5ejFpSlpIOHJ2ZVZzekNwWjZxZm82bHJSSkd5bVN5YjJqVE5lSmNP?=
 =?utf-8?B?TnhKY01HcE4zZkc1SHlPWGNiMDdCUUdFcnlRUWIvY3NCYjR2b0dubDZIR1Rh?=
 =?utf-8?B?ZE1STjJaOWdQKzNXc1JkbGNUR3lXemVFRU5FUGd3bmE0SUIxancxRHRySW5h?=
 =?utf-8?B?VTAzVHJGZkF2STZndGE5c3hLZUp6ajEwdk1OREt0cy9sVUo1QU9qT0tJaWtH?=
 =?utf-8?B?SDdISXdJRzNVQXJ5a01sRE9CZFBIckhLWkJWdmZya0QxcXh2K056LzVRQ2Ew?=
 =?utf-8?B?Z2lVanVNZk1CS1JFRGhURUhTNTB0akNwWjFLR2Y2QXl4MGtHNWs4Y2x4R3lz?=
 =?utf-8?B?b1ZhWkt2THhVWWhOV2tXTHQySVNRYTZRZkY0bmd4NmtNanFlNEJYd3EwMC9H?=
 =?utf-8?B?ZnJ1amlOOC9SOG5uM0NudDV5dmxuaytSL2VnenNoSDE4Ym9ucjcrSXEzeHJi?=
 =?utf-8?B?Yk5MaHhCbFlLc2lDQk1BY1lud1hMampwczRlRW9Ub0tFVlhUbExUWGJVamZp?=
 =?utf-8?B?SzdUZGp4LzdRQ3NCLzBsWDdPait1dXFPU1VCT1pYT2toa0s4ak9rb09NSXFS?=
 =?utf-8?B?dXVKSEkrZnlIaXd1Wm9NdHBkanRXS3QxMjNjUERnalFKUXZuV2JDYlEvYWw0?=
 =?utf-8?B?THN5MlRISFlGb1RwWDIrZlFIdUNRVlN3Qkh5alE4SkVBeXo5Zk1WUmhSUjFz?=
 =?utf-8?B?Q0JRTnB0UUtSN21Pd2dvTUp2UEJIMFp1c2svcDBCWlBXdyt3bVBqbHcxOEVa?=
 =?utf-8?B?Ym4yL2xvaTZrSlFkdmxZZlAyWlRvRHFYaDI1UDh0YWI3SE43WGlvbXFDbXpV?=
 =?utf-8?B?aVF2bEhJa3c4V1hweGNQR3hVSG5ZSjNlUXhrUW5TN0Frd1QyZFVWOXpoZlBV?=
 =?utf-8?B?RGl2bHQ0M3M1K1gwS0g4dXNldVlIdzkrNW5XUVg4WWxLUzh6a0hBRlpTQWpM?=
 =?utf-8?B?Q1V6dHAwd1c2UmZJOFRFaVRLNFdwVGFZL2RJem93ZFpQSU05eTJMVm94WXVY?=
 =?utf-8?B?UC9XZjJCMEk0VnlKb1RXRjA2T0ptSTI4eE51Nm5KR2ppcDlVZjdDYlBXYStw?=
 =?utf-8?B?V3dzdWxsY1JIemx6dGhWdG1ybDNHRUJPUmN6SWFORllSWHhWa1l1bUhidU5a?=
 =?utf-8?B?bEgwY0NmdFBMejdrcXdPQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDVtaGduc3ZZVURaaVhjM3hTNitUSEtGZ0dISC84ZHlaaVpHMzBqU0tqQnBL?=
 =?utf-8?B?c3F1Mm5qY3dJeVJVMk1GOU9qcDV2Ny9BY0dNS2xpczFVVEsrWlhYNk9zbCtU?=
 =?utf-8?B?U2U4emFvQU8vMmVLbVlSNkxaQVlZeWUvOU5pK3YxWFlvQ0VMa2MwT0dhQVQ5?=
 =?utf-8?B?aXBUODh3YkF4N1lialBCQnR1OGlOMEViTURpYXE1SjkvT0RUcFIremNkWDkx?=
 =?utf-8?B?VFBKRkFpTTM2RGp5d00wUFowNU1RZjF3ZnNYS1VwQ3VMbnIxYXQ2YjB1bmxu?=
 =?utf-8?B?a1FFSVBybVN4VFJEaTNiYTZtazVTYmRWcjRqeExJcE1GMmVGOEgzUHUyWmVS?=
 =?utf-8?B?UE5hS3pNaEt4ZGJjVFpOSTJMaVpOUVJ6UGJvZlRjZE10VkZET2F6WThERFky?=
 =?utf-8?B?WkpEUlF3V3Q3blY4ZnlIaCtkei9MdHpNVGNGUXRHYzV1aEpjRUVmdnV5aEhP?=
 =?utf-8?B?bGtRUFljV1pSclZJSGdCZXVkKzdadHh6OEJVcVhPOStQQkFmbnAzV3pKTzdK?=
 =?utf-8?B?OWZYOHNtcWRIaGQvMmdhR01FazAwOWxwVkZ5bnBUZXBhanVUdzRVME1vN2Rs?=
 =?utf-8?B?NFRjSEFGTlREU1F5WVUra3JBQ3RHd1lXZWVUcDh4OGxqMHJ5RVkvaHA0OWl4?=
 =?utf-8?B?cVA1ekNzdVM0RDI0eHM3UloyZ3VTUEZsdTVodHVGcjJjMmp2WlpwSkJRVUZr?=
 =?utf-8?B?YXAxSllOdkk5Rktaa2ZGQ1VJYVcwa2FUR3RWc3V6Ry9rMmpQUUdxUExtcUZC?=
 =?utf-8?B?YVVRR2s4V3pwSWg4eGNGZDdrWlg0VnpRek42YisrOTR0Q0cyUWpNOXkrMWtH?=
 =?utf-8?B?OEVqcE1Xc3dVYzNOWFcyakNkQ1RyVEExTzRoRTF4V0FqbS9OZVg5YnNYc2wz?=
 =?utf-8?B?R1U1VHRWYzh4K3lRNHVneUUrT0hJZ2hLOWtnNlgyU2VuekZnaWZUQ0h0YzF6?=
 =?utf-8?B?QnB2MWVUS0tGL0JicFA0bXgzUnZrOVhSVmJGWGlSWmp5OC9NbDlqc053VWhY?=
 =?utf-8?B?eWN4dHFiVWU4RG5QUEpnZE9la3FlNEc5TGlHN0EyK01OamZkZ3ZOdXNEY3pi?=
 =?utf-8?B?MHhzTWtleGZPclFtb0QvclV0V1E1WUk0aFhKUnR2RzdNZnRCaXI5NzJHNGhh?=
 =?utf-8?B?Zll3S1VjcE54cDRsRDBVVmc0aTc0OTR3OEJqbWFkRjk5TjZPbWIweGRlMjU2?=
 =?utf-8?B?Q3dZMVFLNEVCb2RjTjJ4Q0ZJSW9GVTBwSXNyczJTWllRTUwrUnJTblN4Vkli?=
 =?utf-8?B?T2d3eUhVSml3cUlaekdzTDJWdEozM2pBMHRwaENBSnV6a2dsWUtOYVp1QTVH?=
 =?utf-8?B?VURBQ1REQ0gralE1U05oeU5KQXU5eTJaUUhtZ3FMTzdiMmhvK3lmK010L0gx?=
 =?utf-8?B?L3FLQ1NodVk3NW02YUlZWnRvUjJrT1h0aTJWeTBEVitYSHlrd0FpdklDdVQy?=
 =?utf-8?B?cVlqaFByVGxxQ2lVeW9wNmw4V2Vrc2MrM2tISmZvNWxrWDdzWXhRTWE3Y0hV?=
 =?utf-8?B?eXpwZk9VWVlpd0JoMm5PTDFEaldDUkt6UlNITnQ5RXR3KzdHY29CMXFHelFO?=
 =?utf-8?B?alV1dmtramFKMW1HNTQxd0YyMThEUnRpdUswdk1xeVppSWkzTDh5ZmxMM1dR?=
 =?utf-8?B?MVdVTTVCRTJERzNqdU1NbG5SR2lDR2lGa3pxN1E2Y0V0L1VmdlJrOWlHWGlv?=
 =?utf-8?B?QVlLN1prZ3NrWkEva3F3RmRXcDNHQkxaUnRLbDQzSWR3TWlXRTBvYjZHVjZ6?=
 =?utf-8?B?YnFYQ0JLNGIzTUh2YXlBcm91Q3NnUnFQUDJqeG5oMks4ekRpMVZabmRZbktD?=
 =?utf-8?B?UEhZMGNrQm9yZHM4Wi9yYkdwZGxNYkovNnZZTVA4cG92Qzh1WXNScXRoRkdz?=
 =?utf-8?B?NmFrU1Bid3hoYVFwQ2U1T1dIWExIVUJ0REpyYlRTdjV2Z0FQcCtTTk9GUXhv?=
 =?utf-8?B?cVVIdG5sdEdUTkF5dGUwbjcwL2RDSmZpNjhsNWFMeExxcmlodS9vNHU1RUZq?=
 =?utf-8?B?aEphenl5UFJDc21vNTNGRzlqV3VyalV0bXlLSkF2dkpMT294NGpvNXE2bUI5?=
 =?utf-8?B?eHhqb2x3dWkzREtsNi9HZlBPN1h0MDVVU3dLUk1PSnRBUktrZm5sQWg1Yjlo?=
 =?utf-8?Q?Jg5lwAH53N2KfdyO8wNyT3XyD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189c7d58-195e-4203-2a47-08dcacdcf0a6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 19:06:51.1061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMWSpjcwaUkDBI166uDFwXLJB4lTdfpeP919HvnYf6kHEOdEj0SmQjRu4L/yL5pdwgil+L8SVC+micClZSEW8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769

Thanks all for suggestions in v2.

Do we need to worry about duplicates or alphabetically sorting/filtering 
the output here? As it stands there are no duplicates but I think it can 
happen with linker syntax.

Victor



