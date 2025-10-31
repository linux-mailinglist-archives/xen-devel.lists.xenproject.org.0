Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C0C246D3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 11:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154144.1484257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmH6-0003OV-Jd; Fri, 31 Oct 2025 10:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154144.1484257; Fri, 31 Oct 2025 10:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmH6-0003MO-GK; Fri, 31 Oct 2025 10:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1154144;
 Fri, 31 Oct 2025 10:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEmH4-0003KX-Mf
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 10:22:26 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e463aa3-b643-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 11:22:25 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BN8PR03MB4993.namprd03.prod.outlook.com (2603:10b6:408:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 10:22:23 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:22:23 +0000
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
X-Inumbo-ID: 7e463aa3-b643-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIAFSDACvMRfU6xfVsEGu5O3uj7nN6sWopzYrohfA/mW6znulpL/uqpQHYqQpSYecE9/57dCg8exS2gBXSCXyzmHEAKV+ZqhED+dm8kKL5H/A9Kmgmr+CyhwZbn6BNIu0Kxiu/QKlMyQdYBG0NTPswuZTs9ro3+r7brIs4mawSEiiyLyt312GAKAAoSbIlzU9dL+HAJCnxx0kFwS14mb1PlYSiyobIEgnZdj3i/qTIQKlwIb7rB2A0lZB3QwWUf0LD5/oQGA2v9Yp2U9LHIfmVqxG3viYQyWb021iSPC1is6fLQweXK9EjHGUM7kd3ncfNS6IXAj/G+ZrEJ+UfesoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDPPxaU5cgjulpHuc3X5fYsYbuYW/U3NgdljOsOacN8=;
 b=kkqbhj5hoh79JGyEJZgnGuCh2/0zVcI6RuLzmEbXG6Y4jzMIgJXrlgZCq9weQkBhPNv7WTGu2sgj4J0sZHIZQRbxVvu/EhdEHVCt7E1c8ltYcfGf5rC6w88FnSqugqdkKYnlfLIoqmToWJGgjh7TZ+QBi+wDPrDcaawmjYmHwi8rj7jd5Pu3IvG7re7zbEyZeSy6zw26d49ug5bCK5NIreza7SD8oSvRhWQuyyHttS3Je83Y3Sn/KvTecldrApbZkIyBmAi6ijiTq6Hnoz8bl0YzlZAZTEFoXb0beh8AZGwVle+MuGg9fMuqneY0r5303en763HUDGvBOkcKKaPZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDPPxaU5cgjulpHuc3X5fYsYbuYW/U3NgdljOsOacN8=;
 b=pp5i+VA6L4nGs3pueOgrFVHek6kkDdjzodNPgiJrdMqtBh1efxRw8RkYaoI/ac4nooWY7STxAI4ZZFUGNJsPYlLwm5j83EyIuWUeHaims40WDsgnXDOKKksg8E0QoO2SQPYgwa3BSbmFBFD4DCY67mP+ZTpF5CsT0ZNEXT5WIYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 31 Oct 2025 11:22:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
Message-ID: <aQSN3MKxAa_cltld@Mac.lan>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BN8PR03MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7a96a4-f614-4080-091a-08de18676162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzFYdlg3N3Q2eVdQUEVwSkMzNjExK3FWbGR5cW12aWEzQmZteVNLeVB2NkJU?=
 =?utf-8?B?OEhYT0o0UENKaWdTaTdPVVJxdFlVZE5NWWkrOWhwWHFNZGFpbkdyeUJDNkl5?=
 =?utf-8?B?dFgrcXhNdkttQ1dscUF4dDliTGFnOTFnM0lQeXJlR0Q3ZVFQOTZjK1V5RWZv?=
 =?utf-8?B?ZlhhSXhlTHJCSDVyNWJUTi9sVUNzQ200K2I5Y3A4d1JjLzdnVmc4S214S0M5?=
 =?utf-8?B?ZjZ5elhmNFpuVmpvTkdtMzErSytidjF2V3hjQmpQRGdGMlpDR2YzQWdyWlJU?=
 =?utf-8?B?enhjdjhIZ2tFOWYrdDJrUU1JTng0S094ZTJYazdMbDNuM3lVMlREVlR0U3dQ?=
 =?utf-8?B?OERBM01rakRDdkJoYThPUG1zb0Z0Q3ZzaVI4L0VvcXZaRGxuVi8xcExWcEdF?=
 =?utf-8?B?Q1lkS2Frd1NicEo4TTRYLzBncm9vc3prOVBxMXcyVG5rdURtNmJwZjl6M0pY?=
 =?utf-8?B?QktTL3ozMGVnK0UzRkRtbWJjZGFRYmtsNXJxZEI4RnhKRTdDUExvR0d4TkNB?=
 =?utf-8?B?MFJZK1p6bkpzeExyZ0xrcHZKd296MGdWM2F6VFlXVGIrVWVIT21wS0szYTk5?=
 =?utf-8?B?R3ZJMURObUhEb3JLdVhCTnlaSzhWcEpCWGovRlBFK1VIWFIzd0Z2OS9obGZW?=
 =?utf-8?B?NnRNd0pOVXVGbEtoZVMyQUZub1VoWjlyYm05Rk1XOUluSndmOW56em5uM01r?=
 =?utf-8?B?RUc4MEFZdEJ1L25kbmduS29zZUhhNVhpRWMzbzJWRDZ5YlZYODFaUXBuQlN1?=
 =?utf-8?B?cWtFbkF6ajBTWGMybnFCeHVRRkpaeThqaTFGL2VjZWxrdnRoaFhldXBQQkRj?=
 =?utf-8?B?a1R4eDhRb2JWMTBGbStxdlJZNWpVMnRqVTlSZVU5dlZ1QUUzVW83VlFHQ1Rs?=
 =?utf-8?B?U3BUa3M0Zm8wVmxTSS9ZQktnSE93RGkyb1Roay91TXRRREdacUg4cERMcFFE?=
 =?utf-8?B?MnpsU2NLTjFpbXFndDJYNzQxZFdwbTNVaVA0QlZBZTFMaEVUb3dUTUI3U2pQ?=
 =?utf-8?B?Z3RKN1NWNHRvb09CVUtQOW95TlczYUp0c29BQ2NiUDMwMGF1NjBjVmdKNnhX?=
 =?utf-8?B?WkJSN3pjc2FwWXJNZWdVUWtYRGpGdW9GL1lCeVpHRERtOHRYZUY5aThGdUxQ?=
 =?utf-8?B?b0RacjQ2d0c0WkZWV2NuR0FlZldOY0pqSlFnRFNHL25Cd1BNTkhSbW1nOG5y?=
 =?utf-8?B?cVlJQUVCa0tDQzFpUEgxSjA5bHlWb2xWN2ljNzVnd0ZVeEJnYkM4Y0RhS28z?=
 =?utf-8?B?anlYcmQvQ2VYSURoSmtIRVBveERHWkpXa0hGUjV0MWRvWkFzSS9iblQ4Uno0?=
 =?utf-8?B?RUZBL3dCTGxkemhzTnVyOU1JVEZhSlo1dTVHWWp0ZTc4UW9PWlY3RU40VnFZ?=
 =?utf-8?B?SzBzKyt5aHgzSVlRajhsb3pZMVdXTTc2bGxmVmZsNTRuWjFZTHEyY2xQVlo4?=
 =?utf-8?B?RWk1cG9pM21hUk5KWkxpOUI1TDc3S0J3aW5RTHhERkwrMFMyQ2RhZDFuc2NF?=
 =?utf-8?B?Q0Z5ZUUwL1FsRU1MczM4endjYlBTNVIrdUJ2UG9OZ002REhUWGUrYS9WQlpy?=
 =?utf-8?B?U0hXTXRadDRjVkx4Uk1VS284V3hkOG45Q1YvQnVVaHVySXdTOENXY3c0MnlI?=
 =?utf-8?B?a1crN3NaWEMxd2ZyV05jbXlicE9GTzVucXc3L1J2dHB1Y2JqZDlvYkVrVUR1?=
 =?utf-8?B?SkpQdzFrOGRaTWxyb0FxN2pVbGZ6Q2l3OFdmK0E5bXhNdSt4V1pXZGtxbVRK?=
 =?utf-8?B?UWJNV3R0Sk5iMGlMN0lBU0NhcmZNelNuRVpwWEhjU0ZFZ1BsSFZSRE1TdmJC?=
 =?utf-8?B?aXZiQXFmSGxQemN2U2RNSzRhQlBFVkZSWFdWSytUbk9GTDNVVm05NnNWOWp0?=
 =?utf-8?B?UklhMFBJWHd1TlMvV2ZSMlFGRGFaNnBXSEhuTzV3cXhWejdWNThveW1tVzN6?=
 =?utf-8?Q?+pUPMX/npLVTnWW43L9MRYCoEFOQVXzJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c09zWDVMeFR3czd2UTJsZHBYNEZpSEhEN2FNWFhsTWZzcFI5M3BMUVBTekl2?=
 =?utf-8?B?SzUwZUVGNkI4Tkp3Z3VISTVCNUhIWERNcmp1c2h5Vkl5c0JXQStuQXNUSERs?=
 =?utf-8?B?YU9objJoMDRoZUl2YzhiekthNVBxenVrbHBGeHJyOThvdWZSNDkzZFpLQmFH?=
 =?utf-8?B?cEN5d29ZTTIrQ3Y3RTI1T3VmZy8ra0dwd2YrUXcwMm1Gd1NraVJxb0o5cWVS?=
 =?utf-8?B?Z3dlemhDVmVDaXczTlpUMy8vMlZPZ1gxRmU0Q1N2Tm1ndExFZWZhOStOMFRG?=
 =?utf-8?B?dVJuLzNUNjEzRCtNeFRyUnNYaGxKL0hmRm4xSVE3NGxzNnp6MlZRTk1sRC9z?=
 =?utf-8?B?TVpmbmpza2RhY2tMOWxDNWVvSWN0ZUtjWldvUmpPbE9YWXJjUnRlY1B3bjRk?=
 =?utf-8?B?c0RGSE9Id3A2SnFadDlEWnIvTzNiYjdhUjJrdUo2aEl4UTFRWGJSTm5jUDRH?=
 =?utf-8?B?REFvRS9Tcm96WkJ0aDBuSVh0V0UrK3dyYnpiYXpRbEM1OGJTSHJ3VlJVR3l3?=
 =?utf-8?B?Wk9WWUFhbjB5Q1JRNGFJSDRCQ1dMVi9wZFJRZ1U4a0ZXb3V5SStzM1IwbjhV?=
 =?utf-8?B?Q1BuWTUxSU5MWXVxNHJNN0hZdmRMSzhGTFdGVVQ3cUtCV0MrSlIwWWlvTUlm?=
 =?utf-8?B?bXdWaitrZ0FVaSsrcDNpTCtJenVrenJyZGhHZmFpMnhVUEplSlBPT1pFTU5T?=
 =?utf-8?B?WXFWNzVyVTA1RmdRYU9iRys2SFlOMzhZZjQzZjJENmQ5OHB2aVplR1dMdUhK?=
 =?utf-8?B?M3lJSHdlSFJPMW1GNnBIcUwwMzUrVkxTV2Y4WTZjK3JNV2NXOU5TT0RlbGM5?=
 =?utf-8?B?a01PZDJ1dnBxRGlwWWtmZXNFbTlwY2o0WUhId0F6YXBtQ2dMblp2cEVYS0Nx?=
 =?utf-8?B?SEVDSEtaUVQzbVNCOW50eDRDQzV1NVE5TDRELzZBWDZOM1FLN0UzMnU2dmpR?=
 =?utf-8?B?M2ZIQlcxSlI5aHJGWXYzVElnb3A1RHFaR0J0S0dKRi80OHY3RndlZk15Smpq?=
 =?utf-8?B?WDlvZWN3ZWhVTGZZRXp1cy9WdGhLZ2YzeWJMRTl5c2lURFRoWW5zZTYxSHJW?=
 =?utf-8?B?T2NpQWYzTHZET0k4eTYxQUR1UU5JaGhiR3ZpTHRIVUlVdWFUZkFMdWFyMG1j?=
 =?utf-8?B?VmFKQ3k2ZTl4eS90Njg0TmlDek1IbnBsa09CU0M4a0tpeFo5eWswdWh4ckw3?=
 =?utf-8?B?Y1pjTFRwWmxUQnpGVHJqYloyaUI0RjdSdWNoYXpUcnEzd0I4RzBHS2ZMWFA3?=
 =?utf-8?B?ME5yaUczYWJDeEV0dFFadTZ3V2NpWDRsaUxRcXBMb0h3OEpBRFRncHNBcE1O?=
 =?utf-8?B?OEtQVW9zbDlvQStQd1JreXJJSTFKRjVRZ1RHU2REejBlMXNORWNxZU9NQ2Rl?=
 =?utf-8?B?ZVF4cUJuMkFGWkRwUHpaUDFvc2ZkZGx3WTA2V28wZnZpcG1DVi9YUkdaWVhJ?=
 =?utf-8?B?RmM1WDVCNGxkNXJzYkdsRXplb1JBeS8zb05kZW8zclNnc2VGWVZGbDR5SHJ3?=
 =?utf-8?B?N3B4M2JqM0RDak1NTmtTcFdCZm41SER0UldXTWk3aE9MbXhFMkx2aHpnS0U5?=
 =?utf-8?B?OGNQZUR3NXZYVDJ1K1FrWktjNXh3VnBOblBId3ZlUVN4RWRSWHpOckRuVEpT?=
 =?utf-8?B?Y2VjbG1OKzFDanl1SGZ0RGJRcHkxSlA2bW9HRW1kTUpJVUY2MVZub2hDcUxm?=
 =?utf-8?B?eE0rN25YWk5FbUw1d1d3UktHL3hDbUlRV2swWjB6SFFzSFlXK3YyRnU0Q29q?=
 =?utf-8?B?SnlteTZnMmNlV1d1aklTOE5qMHFQKzFWRlhoUWhSa1pYL3NRaHFIMTI2eUV2?=
 =?utf-8?B?S0k0d0x4TE5IYll5cEJCNFNVNXkxOFc4OUxUR00xQW9FaWdnV01rTDNsajZS?=
 =?utf-8?B?K1dBbDZEOWVSbFBKZmxwczZoMVpMSmhLM0tCdCtLRUJlNGM3VWQ4cCtxWEhi?=
 =?utf-8?B?N0VQdE4yTjJ6ZmpkTEVZRUljZ2tTaGJTK2w3ckZqTjBaUy9OUEdwSzJ4QjZv?=
 =?utf-8?B?ZVl1akxBRGNUcHFSYkwrMGtTUHJpSU5PMnFGQWMrYTJXTVJxOWRCNW5MK2pq?=
 =?utf-8?B?Y0VIVHcrdW93aXlNcEtXdHBna24xaTQzcGw4S2UwZld5SUlDUE5KWVVzYkhr?=
 =?utf-8?Q?bxZVq/guu9wGtWtX1kPtZh4A1?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7a96a4-f614-4080-091a-08de18676162
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:22:23.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yka2QjQ5g0e85GmRoz8YrNdacSy8Wk3L3OCHNujpi4izCjLp5IZ5zDwAn3GyZWK9ZOMyHZmxE29MRPBdoziAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4993

On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> place.
> 
> 1: disable RDSEED on Fam17 model 47 stepping 0
> 2: disable RDSEED on most of Zen5

For both patches: don't we need to set the feature in the max policy
to allow for incoming migrations of guests that have already seen the
feature?

Thanks, Roger.

