Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E510AA494E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 12:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973536.1361648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA58R-0000i5-F1; Wed, 30 Apr 2025 10:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973536.1361648; Wed, 30 Apr 2025 10:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA58R-0000fp-Ar; Wed, 30 Apr 2025 10:57:51 +0000
Received: by outflank-mailman (input) for mailman id 973536;
 Wed, 30 Apr 2025 10:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5DpC=XQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uA58P-0000ff-9Z
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 10:57:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:200a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29279f0-25b1-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 12:57:47 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 10:57:42 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.021; Wed, 30 Apr 2025
 10:57:42 +0000
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
X-Inumbo-ID: f29279f0-25b1-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFZgpXH96P5k1HbeZOExbSysrLBufjkv84nRLXKA45W735Ll4mHWhduZ6omTcNNDHX49hXrhcd3s0SFuqn46wqGFyXJr2eQvA/a4dZgtt1g9h0ZLnyLNHX4NtiuimkN/Oah3bAUmsA5gxKKIzzZdDi7PMJZA1qdgDaCilsnlE1VW9JEpDOlOD4imoxFUEkU9drfzN0/yMtJgWH1QRujzFvJ6nGWN8ARFeNpGygP1ZcpAfzec3v5QG1H12JaC521yt6E9IAcomrRTZO/iUgP9xjPuK31Ydx0Rb4kFeFwUL5RPA5AxDty968OiZc3jp/cWbogchAb/iLw0OvHr5U9JzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRezftm7l8oWGtq03TV0Pt9u59bR8v6qde9sytcly3E=;
 b=EFATmH0A+TZgkXN9+yFo7T3uwoROqNNBQl2ARR/OCfIOPO+sIZcn5Qil0+h7CBhKdTKvg1I+gVZbE8QtnFfqB7TVVGnRYodS61ScT/sLDZRs5BiSZuVxi609q2cvL1Nd0A7rXsCpcY/XDC0uDz6L6K8fzX2NhZuP54UKjlbV7T7fX5y5qCbZwk5ZuyL0HG6J2LK0ttioGv9UVQzGjz6hIP1+CoS7BpdlLtu+VNBnbgz2e63yNRdcBlUdQ/SAJLcg0vXurGFNDWwLbKvgqCF0aWDkQOmUS1Yq1TIFHk8ADKrtIaa//QgmxDgzdEnWVbb3DVtB3+UpNFaNgE1VdGsjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRezftm7l8oWGtq03TV0Pt9u59bR8v6qde9sytcly3E=;
 b=PPvgk5b8GFWoMKr5Zk5hoFmSoPXBUluc4cLi+CBnuw/vgji/hQjqJzBY1gzqXCZPYkQtT3xCBv+Y7GlZsT/ZzGRbBjI7nSVYSBdn+Ci3k2jbDYWEyy+ocE+5NBRVcfxg2gGEDikycq9ekuPL4mGsZkuJw60PEIXj3lXsr2dHil4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7fa8309f-0f5b-4842-bb0a-8c6e1fe5c11f@amd.com>
Date: Wed, 30 Apr 2025 12:57:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] arm/mpu: Provide and populate MPU C data
 structures
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a809740-fdeb-4321-6d35-08dd87d5d4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGJhMUxWTVdFUHNoS00zL0dOT1hkWnkwZ2FPelhKNFpkTDNLczlTa0k1QUNk?=
 =?utf-8?B?WHlNeHdJK3h2TG1udGlXMTJLRWFuWE13OUljaGZUTk85RThqM3UrWlZrVmNs?=
 =?utf-8?B?QVI5SThWY0hibDVVOGZ0Ly9oTERjKzZBaHJSLzdYM1JMUjlDVDA1TEk5UHN2?=
 =?utf-8?B?YmwwbDN2MnJ6NlV0UUJxK0F6S2lWWDM4TnoxSTdvS0NXajNIRk5qM2VrMHY4?=
 =?utf-8?B?NkNkWDFsNXk4eTJDSGNFMkhUV2lueTJ4OUhrOUJPamdBT1A4ZEN0cVNTT09k?=
 =?utf-8?B?S2VwdWw0TERXU2Q5bUw1ZFdVWGNZQkhBazBMZlhxbm5KLzRLc0N1SU9jU28w?=
 =?utf-8?B?QU13ZXZNTUcvWWk3aTZyc2hIdE9aUDdRS25pakk2Z2VTZWdtZ01uSkwyY1h1?=
 =?utf-8?B?NjFkTlpyZjR1TklockFjUjVkSno5eHdhOTE1amcrbjIwTGpQY3EwQnVxRlFS?=
 =?utf-8?B?OEtQZzZXb3RFUVZBdTRMSUcxOFNHNWlEbVpUMG1iTmNGMDNYVTJsRUVObk4v?=
 =?utf-8?B?KytUYVB3OVZuTzVlS0dCQUxSQmRNWmwvdDBRUG5CanpPQmY2Sjg1MHhtR0V6?=
 =?utf-8?B?bENTeVoyeC9FUko5cG5zYWU3aFVaVGxkampCVWxSa3FQWEdXSVNwZEVwQXhz?=
 =?utf-8?B?YktwU0JmTFlnOU1ZYmY5eDFkeE5KZmZOOU9BZUJCbi9rVDkyd0IxaDBXTjRp?=
 =?utf-8?B?VnhJQnFvRUEza1lHWGkzcE1LWThvdUcxYWxqOXFBTUNCeWdvY1NzS2xqNDdn?=
 =?utf-8?B?TEsrOTdkY29wRUdxODRBbUp4alZtRUVBYVhvTTUrSHdwR2VJV1NWMkg2bDlI?=
 =?utf-8?B?OFlTaG43SFhHbEdPY0YzLy9YWVVtNHIwN2V2dGRLWkh3NEcrenUzQ05wV1ZC?=
 =?utf-8?B?OTB0eldMNFp4NHZOemlJcHRrQWplTVlyOVpIT2NkTXRHYVhCTmRMY3NhQlIr?=
 =?utf-8?B?bDBRTHBWYkRrUlhBMkdpeCtTeXJXcVZxdDd6ck9aOGZTNVhpaUMrMmhmOE5i?=
 =?utf-8?B?YzZ6MFVRWFFoQkVHZmdUNmV3M2F6c1pndTMrUU4rMXo5S3pZUVhoemhKblBZ?=
 =?utf-8?B?TmxYSG5aNW1iREJFanBZS2M0TG1RamtON1RwdnFST2tsRlNleC9HZlpLVUlV?=
 =?utf-8?B?M3F0enZYM3B4OFd6L0k2TWJqSEo4U3RKQUIyMlVQKzd2dzRMWXBzeklLR1hu?=
 =?utf-8?B?OFpoZDVQSFQ1RkFaVmNPSTF6UmcxUktWdGNKUjdCYnE1amFuQ2RYNDJMYUpK?=
 =?utf-8?B?UllCY21ITkh5TGRZVDB6bE1mbkRtdy9CRS9aVVltQkxDYWVqSTA1aXVkRUxM?=
 =?utf-8?B?REFGSjVudTVvZHNZVnJRZjF0RFFrU2dWc09LT1Irc3piZnFGK1JwZzBoK0wz?=
 =?utf-8?B?eXVxYWljLzRLUGFQUFl4UVRyNzNidDd5QXRINkhxZm52d1hjQ0NkaUpmVjRh?=
 =?utf-8?B?WXo3TWZLcjROM1hIOTRLVGMvNnlxM3ZMemM1WGxodDRJOUxaQXc1bythWWZG?=
 =?utf-8?B?ajdQYmcrL3g5YzdaRm5YQ20wU0ZnVVlHQ1N3TEJHRlE3cnpjbmJPQ1ppOE5Q?=
 =?utf-8?B?bm5iK1FIU1E4UVUxamtnbWZ3RVgvOFRSRjJ3akJDaGV4MjRualdMbHVELzhq?=
 =?utf-8?B?SHVsWG4rZkF5bFlDOVdVMEhQT0dmK3A1T0tIaStaYXBkUCsvVnYvL252L3BZ?=
 =?utf-8?B?US93M3NkVTluMzluZXZxMlBETndxT0t3RDY1NEN1VEZpb1B6bHBGdU1HaFlU?=
 =?utf-8?B?V0R2RkVKV0tOM0JWZzhaRExGWHF1RXhMSWIvYXZ3VENaZjg5a2l4MU9HNCs4?=
 =?utf-8?B?ZjgwWHhmcVFqQUM2S1pZMUR6bEpXWXhEVG4wSDJxc0dZdCt5Y2JtSEU1ME8y?=
 =?utf-8?B?bkVoMW11bFgzRGZHaGZCb0xMMUhuc0ZlWnlOVHdyYTVGelo1YTZtSko4bXBD?=
 =?utf-8?Q?fvTLP7Pu3eA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bURmSlJVZFFBOVNMZjBFa0JKYVEvL295WXpKOGNKNWk2UTJMM0dFRkF4T2Ez?=
 =?utf-8?B?OGhiekVZRHh5dlEwdFJMUzQ2Vm9SZEZGWUtsMGNXaVdpYWtmbTZ5ZFU3UXdj?=
 =?utf-8?B?QW1zSEVYN2J1TUhGWGxJcklsOEFnaytDZU5mVlhWWCtGV2JWOS9RalBDVXd2?=
 =?utf-8?B?MHFwSWhIR0hwWDI4eFdzQUNUTVduNmEzZU9DZ0NOdVhuMUNRc0NtYXRZczly?=
 =?utf-8?B?Nm9ONDVmbWN5dFdMSlJRUUZFVzNmbG1tU0ZWT0cvRVFoTitKazkxQ3R4Z2tK?=
 =?utf-8?B?WHVzNWZVK3R6UzVKTE0yTnVHckVHZmZ1WjZYR1dsVnhkQkdTaDVudzBDWXVm?=
 =?utf-8?B?Tko3SXI1WkxwNTFqODdvaHhvZm4rODRuR3ZjRDlhUzNUc241ZFphV3hkUlM5?=
 =?utf-8?B?WXpoNzQ2Q2tGK3RtaWoyWjU1Ymw4Z0NXS1o2V2dhMi93L0VnQUoyWU1vbVZU?=
 =?utf-8?B?dzNEV1F3ZzZIbHp1L3VTZXI2WHF5bnI3VzZoaUoxMStRU2UxU1VTbEhKam9R?=
 =?utf-8?B?OVZDVmJFL3BYQ1luRUJ5MEtLb3FKd09HNTlURTJGRnZzZGtVNnFzZHlGS2ox?=
 =?utf-8?B?VWtyaFNoYnF6NmNQNjE3WThCWW1OakN4OXIxOHExa2FoaU1vbWRTL2dtZVA5?=
 =?utf-8?B?TEZVaXk5YmxsN3pmVEs2TW0rQ3F2dFljblRXTGpDbW1mbDZyYklNTm1raVFC?=
 =?utf-8?B?T0VHUUkwd3RKUHk3bE1Bby85Y3IwRXRLRlVhcG4yRFlmTUZ4ZEVnaW1aMGFY?=
 =?utf-8?B?UlYybW1qYmZYMzUzcjQyT1VxZ3RQSWJVSEtpTm0xWWpOamdNeXhpSCtueGlz?=
 =?utf-8?B?VEpSY05ZL0NUTEppTnZ3Y3E5alkrNnJyc2c0WHRIaGRUdHA5aWNDUlBpOUhv?=
 =?utf-8?B?NU9RQXg0ZlZzT1lvdHVuMG51WDRFTWh3bWtaRGFyNmMyeGRWMjYxZXRqeFNX?=
 =?utf-8?B?UkV0ZjNjeFdKQzNYcEhSTmhRZWkzeGZaUTFyeXhBZ1JMdm1JQ0YvZmxiNTM5?=
 =?utf-8?B?RFBGblN4QTdzZUNVMFpOVjdSd0JoV3dFSHl4Qm51ZWwzUFJwbXI2Q3dWdjNZ?=
 =?utf-8?B?dWVkT2pEK3ZsblczNU5sMk9QeWZuZjhFdi8xZUNjN25Qc0l4bS9ram1pYzJr?=
 =?utf-8?B?QXpaSjFObHFFcUoxdEZrRHB2YlZUSlpwbzRRcmVoMkF5SU1tVitZUzFKdmhp?=
 =?utf-8?B?MDNIK2o5MGFKblhrTlg5KzJkVDZOQkhZa2xGQkp5S2ttYmxUTGc4OGNVNTRo?=
 =?utf-8?B?c1UrSjEwTmIvWjEyQjBCd2pUU0J6Y0ZQajU5MnIybUJIOFhQVlF3aVJXZWht?=
 =?utf-8?B?ME81N2xZWU1FeVlJWUdsVmdkVnlDSW4zZjRiSG5DUTBSY0xJSE0yTHVuczZG?=
 =?utf-8?B?cFQxOVEwNldNakw1dXNCV1ZyQ2RpSzdPcE10bllIRHY0MGdzSFdXV3hnNVZk?=
 =?utf-8?B?R0hlTDJXNXpYRjVHc091UFZtekNZYzVGZ25Zc3NPYkR4bmdQTDJiazhHMEJH?=
 =?utf-8?B?N1haUXlNWk9rL2pWZ0dONExieGNJTHQ2dnB6dUxBRWZlOWhYWko3RzhFQkpQ?=
 =?utf-8?B?OGN0VDNOUjBOcGJ6NTA5Uitwa0ltUWpYVDJkd1hkKzFTWGxoUVcwdE1XVE5X?=
 =?utf-8?B?SG9HL0RaZm15MmN0Y0F4WXE0Ymk3TGtZYmRkMHRvMTVMZzZiTFgvU0xBV1d1?=
 =?utf-8?B?WW1CakJ5Z01YYzl0WUVoODJpdjBYeTY0YnZVMm12c1dJNm5Db00rd0thY1Nt?=
 =?utf-8?B?SmJPQlMyM0xMa3UyTk93bnNqVGYzVHI4QXhJcnJVeHEzSkZKTjNlOGo5WFJi?=
 =?utf-8?B?SkxtRTl6ZEJwcjM2MVcvNFpDeTFFSUhWeE9IdTFNV1BnNVhsUHQ5cFBlQjlw?=
 =?utf-8?B?UXV5clFpZG5iTjdHemNoYVB6UzUreVp1KzB1dUk2ejBmRzBvcU5UdXA1amty?=
 =?utf-8?B?TnVpWjJhVTZIZWdTZ2ZrWDNPb0tpNytuZU5CN0owNXI1R2RmSnFKdXR5Y28y?=
 =?utf-8?B?cHUvczZFTVoybk50WGRLc2NySjA0VlkrNGhSVHIrTXA2bHFYeDdkWFJsWUlr?=
 =?utf-8?B?aG1maHQ3clErUnN6RGIvU3ZGV2FRY3JLZWZXVHlrUmZHRVN2ZkhsMC9FMEc0?=
 =?utf-8?Q?ONSY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a809740-fdeb-4321-6d35-08dd87d5d4b8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:57:42.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hzg96tz6N9CR2hWMG8dWlaBCyJXFVL5xpOiXZRJ2RvbHHxU48cdYpFjI1jr08o7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614



On 29/04/2025 17:20, Luca Fancellu wrote:
> Provide some data structure in the C world to track the MPU
> status, these structures will be filled at boot by the assembly
> early code with the boot MPU regions and afterwards they will be
> used at runtime.
> 
> Provide methods to update a bitmap created with DECLARE_BITMAP
> from the assembly code for both Arm32 and Arm64.
> 
> Modify Arm64 assembly boot code to reset any unused MPU region,
> initialise 'max_xen_mpumap' with the number of supported MPU
IMO this is not a good name because there's nothing there suggesting that this
variable stores the number. Maybe max_mpu_regions or max_xen_mpumap_regions.

> regions and modify the common asm macro 'prepare_xen_region' to
> load into xen_mpumap the MPU status and set/clear the bitmap
> 'xen_mpumap_mask' used to track the enabled regions.
> 
> Changed parameters name from 'base', 'limit' to 'tmp1' and 'tmp2'
> in order to use them also for intermediate operations on the
> MPU and the bitmap C data structures, the help on top of the macro
> is enough to understand how the macro will work and this will
> save some registers.
> 
> Provide a stub implementation for the pr_t type and few asm
> macro for the Arm32 to prevent compilation break, they will
> be implemented later.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - new patch
> ---
>  xen/arch/arm/arm64/mpu/head.S            | 13 +++++
>  xen/arch/arm/include/asm/arm32/mpu.h     | 25 +++++++++
>  xen/arch/arm/include/asm/bitmap-op.inc   | 67 ++++++++++++++++++++++
>  xen/arch/arm/include/asm/mpu.h           |  5 ++
>  xen/arch/arm/include/asm/mpu/mm.h        |  7 +++
>  xen/arch/arm/include/asm/mpu/regions.inc | 71 ++++++++++++++++++++----
>  xen/arch/arm/mpu/mm.c                    | 16 ++++++
>  7 files changed, 194 insertions(+), 10 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
>  create mode 100644 xen/arch/arm/include/asm/bitmap-op.inc
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 6d336cafbbaf..c0cac06b015f 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -40,6 +40,9 @@ FUNC(enable_boot_cpu_mm)
>      mrs   x5, MPUIR_EL2
>      and   x5, x5, #NUM_MPU_REGIONS_MASK
>  
> +    ldr   x0, =max_xen_mpumap
> +    strb  w5, [x0]
> +
>      /* x0: region sel */
>      mov   x0, xzr
>      /* Xen text section. */
> @@ -74,6 +77,16 @@ FUNC(enable_boot_cpu_mm)
>      prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>  #endif
>  
> +zero_mpu:
> +    /* Reset remaining MPU regions */
> +    cmp   x0, x5
> +    beq   out_zero_mpu
> +    mov   x1, #0
> +    mov   x2, #1
Shouldn't we mark the region as emtpy (base == limit) when doing region clear?

> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prlar=REGION_DISABLED_PRLAR
> +    b     zero_mpu
> +
> +out_zero_mpu:
>      b    enable_mpu
>      ret
>  END(enable_boot_cpu_mm)
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> new file mode 100644
> index 000000000000..1bdae4c309dc
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_ARM32_MPU_H__
> +#define __ARM_ARM32_MPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +/* MPU Protection Region */
> +typedef struct {
> +    uint32_t prbar;
> +    uint32_t prlar;
> +} pr_t;
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM_ARM32_MPU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/bitmap-op.inc b/xen/arch/arm/include/asm/bitmap-op.inc
> new file mode 100644
> index 000000000000..e316d9417bb9
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/bitmap-op.inc
I'll just skim through this file for now. I won't check for algorithm being correct.

> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Sets a bit in a bitmap declared by DECLARE_BITMAP, symbol name passed through
> + * bitmap_symbol.
> + *
> + * bitmap_set_bit:      symbol of the bitmap declared by DECLARE_BITMAP
> + * bit:                 bit number to be set in the bitmap
> + * tmp1-tmp4:           temporary registers used for the computation
> + *
> + * Preserves bit.
Here you say it is preserved, yet...

> + * Output:
> + *  tmp1: Address of the word containing the changed bit.
> + * Clobbers: bit, tmp1, tmp2, tmp3, tmp4.
... here you list is as clobbered.

> + */
> +.macro bitmap_set_bit bitmap_symbol, bit, tmp1, tmp2, tmp3, tmp4
> +    adr_l   \tmp1, \bitmap_symbol
> +    mov     \tmp2, #(BYTES_PER_LONG - 1)
> +    mvn     \tmp2, \tmp2
> +    lsr     \tmp3, \bit, #3
> +    and     \tmp2, \tmp3, \tmp2
> +    add     \tmp1, \tmp1, \tmp2                 // bitmap_symbol + (bit/BITS_PER_LONG)*BYTES_PER_LONG
We don't use // style comments. Please use /* */

> +    and     \tmp2, \bit, #(BITS_PER_LONG - 1)   // bit offset inside word
> +
> +    ldr     \tmp3, [\tmp1]
> +    mov     \tmp4, #1
> +    lsl     \tmp4, \tmp4, \tmp2                 // (1 << offset)
> +    orr     \tmp3, \tmp3, \tmp4                 // set the bit
> +    str     \tmp3, [\tmp1]
> +.endm
> +
> +/*
> + * Clears a bit in a bitmap declared by DECLARE_BITMAP, symbol name passed
> + * through bitmap_symbol.
> + *
> + * bitmap_set_bit:      symbol of the bitmap declared by DECLARE_BITMAP
> + * bit:                 bit number to be set in the bitmap
> + * tmp1-tmp4:           temporary registers used for the computation
> + *
> + * Preserves bit.
> + * Output:
> + *  tmp1: Address of the word containing the changed bit.
> + * Clobbers: bit, tmp1, tmp2, tmp3, tmp4.
> + */
> +.macro bitmap_clear_bit bitmap_symbol, bit, tmp1, tmp2, tmp3, tmp4
> +    adr_l   \tmp1, \bitmap_symbol
> +    mov     \tmp2, #(BYTES_PER_LONG - 1)
> +    mvn     \tmp2, \tmp2
> +    lsr     \tmp3, \bit, #3
> +    and     \tmp2, \tmp3, \tmp2
> +    add     \tmp1, \tmp1, \tmp2                 // bitmap_symbol + (bit/BITS_PER_LONG)*BYTES_PER_LONG
> +    and     \tmp2, \bit, #(BITS_PER_LONG - 1)   // bit offset inside word
> +
> +    ldr     \tmp3, [\tmp1]
> +    mov     \tmp4, #1
> +    lsl     \tmp4, \tmp4, \tmp2                 // (1 << offset)
> +    mvn     \tmp4, \tmp4                        // ~(1 << offset)
> +    and     \tmp3, \tmp3, \tmp4                 // clear the bit
> +    str     \tmp3, [\tmp1]
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index bb83f5a5f580..1368b2eb990f 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -8,6 +8,10 @@
>  
>  #if defined(CONFIG_ARM_64)
>  # include <asm/arm64/mpu.h>
> +#elif defined(CONFIG_ARM_32)
> +# include <asm/arm32/mpu.h>
> +#else
> +# error "unknown ARM variant"
>  #endif
>  
>  #define MPU_REGION_SHIFT  6
> @@ -17,6 +21,7 @@
>  #define NUM_MPU_REGIONS_SHIFT   8
>  #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
> +#define MAX_MPU_REGION_NR       255
Shouldn't you define it using NUM_MPU_REGIONS? It should have the same
definition as mask.

>  
>  #endif /* __ARM_MPU_H__ */
>  
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index bfd840fa5d31..28339259c458 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -8,9 +8,16 @@
>  #include <xen/page-size.h>
>  #include <xen/types.h>
>  #include <asm/mm.h>
> +#include <asm/mpu.h>
>  
>  extern struct page_info *frame_table;
>  
> +extern uint8_t max_xen_mpumap;
> +
> +extern DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR);
> +
> +extern pr_t xen_mpumap[MAX_MPU_REGION_NR];
> +
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>  
>  #ifdef CONFIG_ARM_32
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 47868a152662..dc0306f8c5fc 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -1,22 +1,50 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <asm/bitmap-op.inc>
>  #include <asm/mpu.h>
>  #include <asm/sysregs.h>
>  
>  /* Backgroud region enable/disable */
>  #define SCTLR_ELx_BR    BIT(17, UL)
>  
> +#define REGION_DISABLED_PRLAR   0x00    /* NS=0 ATTR=000 EN=0 */
>  #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>  #define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>  
> +#define PRLAR_ELx_EN            0x1
> +
> +#ifdef CONFIG_ARM_64
> +#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
> +
> +.macro store_pair reg1, reg2, dst
> +        stp \reg1, \reg2, [\dst]
Why 8 instead of 4 spaces?

> +.endm
> +
> +.macro invalidate_dcache_one reg
> +        dc ivac, \reg
> +.endm
> +
> +#else
> +#define XEN_MPUMAP_ENTRY_SHIFT  0x2     /* 8 byte structure */
> +
> +.macro store_pair reg1, reg2, dst
> +        nop
> +.endm
> +
> +.macro invalidate_dcache_one reg
> +        nop
> +.endm
> +
> +#endif
> +
>  /*
>   * Macro to prepare and set a EL2 MPU memory region.
>   * We will also create an according MPU memory region entry, which
>   * is a structure of pr_t,  in table \prmap.
>   *
>   * sel:         region selector
> - * base:        reg storing base address
> - * limit:       reg storing limit address
> + * tmp1:        reg storing base address
> + * tmp2:        reg storing limit address
I think this change is not needed. The parameters should be named base and limit
because this is what you expect caller to pass. Inside the function, you can do
whatever you want with these registers and caller does not care as long as you
mention if they are clobbered or not. Same in C world. You can reuse the
parameter for a different internal purpose inside a function.

>   * prbar:       store computed PRBAR_EL2 value
>   * prlar:       store computed PRLAR_EL2 value
>   * maxcount:    maximum number of EL2 regions supported
> @@ -28,13 +56,13 @@
>   * Preserves maxcount
>   * Output:
>   *  sel: Next available region selector index.
> - * Clobbers base, limit, prbar, prlar
> + * Clobbers tmp1, tmp2, prbar, prlar
>   *
>   * Note that all parameters using registers should be distinct.
>   */
> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +.macro prepare_xen_region, sel, tmp1, tmp2, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>      /* Check if the region is empty */
> -    cmp   \base, \limit
> +    cmp   \tmp1, \tmp2
>      beq   1f
>  
>      /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> @@ -42,20 +70,43 @@
>      bge   fail_insufficient_regions
>  
>      /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> -    and   \base, \base, #MPU_REGION_MASK
> +    and   \tmp1, \tmp1, #MPU_REGION_MASK
>      mov   \prbar, #\attr_prbar
> -    orr   \prbar, \prbar, \base
> +    orr   \prbar, \prbar, \tmp1
>  
>      /* Limit address should be inclusive */
> -    sub   \limit, \limit, #1
> -    and   \limit, \limit, #MPU_REGION_MASK
> +    sub   \tmp2, \tmp2, #1
> +    and   \tmp2, \tmp2, #MPU_REGION_MASK
>      mov   \prlar, #\attr_prlar
> -    orr   \prlar, \prlar, \limit
> +    orr   \prlar, \prlar, \tmp2
>  
>      WRITE_SYSREG_ASM(\sel, PRSELR_EL2)
>      isb
>      WRITE_SYSREG_ASM(\prbar, PRBAR_EL2)
>      WRITE_SYSREG_ASM(\prlar, PRLAR_EL2)
> +
> +    /* Load pair into xen_mpumap and invalidate cache */
> +    mov   \tmp1, \sel
> +    lsl   \tmp1, \tmp1, #XEN_MPUMAP_ENTRY_SHIFT
You could get rid of these 2 extra instructions and instead do:

> +    adr_l \tmp2, xen_mpumap
> +    add   \tmp2, \tmp2, \tmp1
add \tmp2, \tmp2, \sel, lsl #XEN_MPUMAP_ENTRY_SHIFT
which combines everything in one go.

> +    store_pair \prbar, \prlar, \tmp2
> +    invalidate_dcache_one \tmp2
> +
> +    /* Set/clear xen_mpumap_mask bitmap */
> +    tst   \prlar, #PRLAR_ELx_EN
> +    bne   2f
> +    // Region is disabled, clear the bit in the bitmap
Comment style, here and elsewhere

> +    bitmap_clear_bit xen_mpumap_mask, \sel, \tmp1, \tmp2, \prbar, \prlar
> +    b     3f
> +
> +2:
> +    // Region is enabled, set the bit in the bitmap
> +    bitmap_set_bit xen_mpumap_mask, \sel, \tmp1, \tmp2, \prbar, \prlar
Wouldn't it be better to first clear the entire bitmap before setting up the
regions (i.e. all regions disabled) and then only have the set part here?

> +
> +3:
> +    invalidate_dcache_one \tmp1
> +
>      dsb   sy
>      isb
>  
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 07c8959f4ee9..9eab09ff2044 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -7,9 +7,25 @@
>  #include <xen/mm.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
> +#include <asm/mpu.h>
>  
>  struct page_info *frame_table;
>  
> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
> +uint8_t __ro_after_init max_xen_mpumap;
> +
> +/*
> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
> + * region 1, ..., and so on.
> + * If a MPU memory region gets enabled, set the according bit to 1.
> + */
> +DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
> +    __section(".data.page_aligned");
> +
> +/* EL2 Xen MPU memory region mapping table. */
> +pr_t __section(".data.page_aligned") xen_mpumap[MAX_MPU_REGION_NR];
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*

~Michal


