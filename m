Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30CA5F42D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912048.1318406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshZC-0000re-Pz; Thu, 13 Mar 2025 12:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912048.1318406; Thu, 13 Mar 2025 12:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshZC-0000pm-LG; Thu, 13 Mar 2025 12:21:38 +0000
Received: by outflank-mailman (input) for mailman id 912048;
 Thu, 13 Mar 2025 12:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tshZA-0000pg-QW
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:21:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2414::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b17b51-0005-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 13:21:34 +0100 (CET)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 12:21:31 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 12:21:31 +0000
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
X-Inumbo-ID: b3b17b51-0005-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9OJ7+w9cn3EDqJ90lozNI3JGvKY5sj+TdAwgSnSsAVv1byXOwjzNu/GPvKzuW+C/pQs/CMtUyNzydHz2bBebdx5UMTv6y1+amIHCBU6omiUbf5F2JD7Ihy2Z/asV0MgYl/XmfO7Txu4sV8axUjas4tc70z26g8h1+izzy4FvDuJ1ql1Z3h0ZpovMBAmgecjjBBtUo3CykB3L9MY3CieJFn35jj+m6YFBPzNVmbR2FOlUEYP/8M8JIhfb9BDqGgYRoiao4Ex5stq2zllrXcW/QDZn8e8t9Z82hCG0BNGc0C7rf20CwNT2gjFJ+f1ulLsNnEwVXjleURc+hEHDShDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BygB7Jd94wHGspROBjTr7kYQhBJkp8hniWKhiL7IO8=;
 b=Q7cJ6Hh2lO27Rdzv0TX0tREbjmiTvMbQWMKohGpBcsja+CyQzL2r7ZHWHR/RKAzffgj7rH/ZR/1tNPhoxQCxO54ptAGbunGBW2FIn1xDglbXuaQtaclVZ7d6eW5JgBfZhQNXZiAUvW3WD9rLlJ+Jx0Zkjtnbx+2IBzqh9yvJpsotwsuAfOjTrxp0dXnJttYUB5wQgNgc7GCo43q9yGmbJWlskCT0gkP5YeYVVZwrILi1LOlTjFh5QNtzpHuUcV3PxSFEEGIi0UyAaDEBcez04E+f2Uem986XNPH0iNworiuXekDBf7lHUF/MM3VBaGFYe/spXP/Nb26vx2l3nJvwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BygB7Jd94wHGspROBjTr7kYQhBJkp8hniWKhiL7IO8=;
 b=WtEjMk+entQ8rZXvGck7clqm16V+go1oBG0R1ox6j3VRyA+ai0Wa/2Z8Pm1wofkDSIPomyBkxNs9LdnOwM8nZRsdqfPKSv45hYVkqI3wgkEWcHZGfK7/7w88qzQ4OmvCm/M+ZfxrHFzGuqY6n+ccyThI4OcXSSsI52aDB1qbooI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <358ffad8-f41c-476c-8804-9cbee3eb9e6f@amd.com>
Date: Thu, 13 Mar 2025 13:21:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page,
 maddr_to_virt
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-6-luca.fancellu@arm.com>
 <df0ad31e-1842-41fa-9112-9e3892bfdf65@xen.org>
 <2294EEC2-A0AC-4FD9-864C-182801CDD734@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2294EEC2-A0AC-4FD9-864C-182801CDD734@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a68ed5-3282-49de-f1b6-08dd6229961c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVJjSHJHYjk0QWZvR2Y1akduTmM3d1MwT0c3cU5HOXY2MEZyMXZXVmtsMzYy?=
 =?utf-8?B?T3Irbm92Yi9LbGlPbDdleVprUEF0eUI0RGx4MUVaMzh0cmk1T2ZpWm4wRDNz?=
 =?utf-8?B?QjYxbXZ4OFkvYkZIR1U2VFdaQ1FudjdGcCtQZEZyZ2Y5eWY0ZGkzUGhvcDZ4?=
 =?utf-8?B?alMyWnhFMUVIblpvWUVoTVVtdjNzdlBJS2I0d1B0RW1CUWF0Q3NvRitIRTJj?=
 =?utf-8?B?V0JsUzhoQmxQNGRQUGJVYS9hbE9NK1Q1a2Zob29RVm1mVGFZd0R4MDNyVzhY?=
 =?utf-8?B?cTN4aXpEU1JpZStNdjVjMUF3dDdCWDJnMUFudDN4NC9palNqOWFYWm1VcTJD?=
 =?utf-8?B?YVVocXFXRjFyZWJXNVY5b2lzcTRGU1VWR0lYNXY2eXhKS0ZIRWhrUytBcWsr?=
 =?utf-8?B?RzNpTmRyMk95NmYwTHBmZXF6SVpjYitXMmYrZ2lXdlVtMzNPWDZLMkprRnpL?=
 =?utf-8?B?VkxheDgrTzk5eGlELytHMm1FWXo2S2RKWlcyQ0ZIN1UzNmZlNDh2Q2xZcHlz?=
 =?utf-8?B?YUhVeHJmZU91OE9FblNUVGNrczdWbFZkaE9sN0ppc0svL0prZzljYUhPVkYy?=
 =?utf-8?B?M3JlWUFLaEFTOFVqTVdCR3A2V2RQSWtGZ0o5Tm5oU05wR0Q0YldKVzdRTmRk?=
 =?utf-8?B?K1hvemM1eUZxcTdRTVAvZGFaRjZIN1ZVQkhkdzdMSkdGbDI2ZndQQ1E2STV0?=
 =?utf-8?B?YWZmejJRR0gwNytRdmlldHRLeGNkMkxuWEU0ZkxQMnpyN3B3WVkrZTdvbjQ5?=
 =?utf-8?B?RFZkTHZCMGlkb2tsYTdkaEVmQlRnMVQ5MHdVckZoVUw4NHJ5SWMyUys2OXVv?=
 =?utf-8?B?emczWWdLb3hVSzZ6SmJNZ1RQYUtKOTV3YnFiZG0rQmNiNERSaU5nK0tvdWUy?=
 =?utf-8?B?ZjFtVDVOYVNWSmJiVmcwZm9KN1NaMHUySGNmNkl6eXFnRktjNE03aWlnZVM2?=
 =?utf-8?B?Z1ZXRDVSaWZwOUxaZnRYUlc0Tmtac2xPMXhXSjVWS2cyWTZTM0JEaEU1NFg0?=
 =?utf-8?B?Qk8zZ2pDbi9WNUxzeXZvUS8zUklHNHdkeW1DQlZqakFGVDJSYXJHUDNOa1Jh?=
 =?utf-8?B?TXhNRytpa0tCN0hzNWtmU0lBY205aGZ0d1pLWjhjV1llb2hpcGJpZVFjQlZF?=
 =?utf-8?B?VWV0Z3h3KzU3dlIzVWxINjFwbTJZMFZIcFRmRWVwblZ6VjdmaVM4bVYxQTEr?=
 =?utf-8?B?MktaamZQV1VVUEpRT2FWemZQTWZFUW8ya3A5QllYazl0K3RGaGR0VGZScFBa?=
 =?utf-8?B?WFAvMlNpZElNVXAzcWxibzUvSW5vK05ZNVRSWkJlQjdCUVY0T2RURlBhY3Ft?=
 =?utf-8?B?c3NIbFA3ektERnhGQjFaWGYxR0lkemNOeU5NY1p2UnZtR0pzWWV2YjFWQmJ1?=
 =?utf-8?B?Y3BCdy9SdzVndVBIOWZYMkJNbyt3MUxhRktGZTEybCt0YnpCc1MzYmlHT0Ja?=
 =?utf-8?B?RnR6d25xaUtSN2xOZVlmNkw4eWJkWU9qN3dhc2V1bkk0ZHloSGt0MjJTSmk3?=
 =?utf-8?B?OSs2NThSL3A5YVJUdTRpWUp4SC9MWHhoTHZBMVpRUGxEdnhaV2doN01JV2xk?=
 =?utf-8?B?cXBBWENneFBrdTV2VmtIdHdKZmJPV3JoVW16UUJCdzNoRHhCTEM4a0tOTXEx?=
 =?utf-8?B?b0wzUzNIOTUzVVhaZmtOUVUvQksybisySWhZMW0vYWlaOVJIamJOUEt5Y09D?=
 =?utf-8?B?dnFCTEl2TE9CUWJhZmNTcGhqN3A1MHRTNTErVVJWREtmc3NrOTV3Q2xwcjN6?=
 =?utf-8?B?Z1BnZ0lWVG1JN01oOVBOOVl3YjV0NWNTaVF5MFBldVpaUnI2WUtuSlZrM0dn?=
 =?utf-8?B?Y0FuY1R2L0UxRzhYTWIyZDMrZUlVTHF5Ym5hVldEcGJOMjRiZm9nNGdrUUJR?=
 =?utf-8?Q?Pzuq61w5zmvhS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVJSSk1nZFA0cU1DVjN3eitMZjlMTzJYMmlpOXI1STNmUGR5NW5zRkxra05P?=
 =?utf-8?B?ZFV2ZkZPR09UcE9aWVc5bkU5eWNaU3RyakUxUDZZaERLNzFSOGwyejE0ekRW?=
 =?utf-8?B?VTZmbFFqU2FFYWcydHJ4NmJWei8ydG0yN3BuZUJNNmFIQlp1MmpaYk56V3c4?=
 =?utf-8?B?V3ZiWDFvKzYxWXJQYmZOc25UYUJRSkFHVmxyVHZPNGdRTFBuKy9yM3ZIS2Z5?=
 =?utf-8?B?VGl4MTE0ZXVsc1pzZjVGS2krQ2szZDlCTHRXeTU4eTNBQVY3eHpHbWFVZXY4?=
 =?utf-8?B?c0lUMmZneHZaWCtSM1BGUG1wajd3UmJYMUh2MXpJVldsc0UxY1RiTXJkL09B?=
 =?utf-8?B?aXNJYmpNVFk2UitFQmZ2S3MyU1Fwa1R4RXZPbDNzaWJmT05KNWhBWEcxcnRC?=
 =?utf-8?B?VHBFMStIcHRpdEJ6allYR056YlJlbnpQU0pXM21KMWFJRTljRDA4aHNtTDJX?=
 =?utf-8?B?Qm05TGVtdlV0UzZ1d1d1ZkJlL1REcEJvY3h0V0I2MEJGNkdVSEhVekJmRjZF?=
 =?utf-8?B?b0dEVCtNV0NOWkE1Z0VVc0RyeEFlbzR6WWdkbEpnQ0ducFBoZ1V2ZDhQMkM3?=
 =?utf-8?B?NlZOTndlb1VLcEdBNWozaXc3RzQvellRdkdWRVdXRENSTHhZY3Z2N1hZZUpm?=
 =?utf-8?B?djJVY3hJM2FpdlpwMGV1RTdyMzFmVSsxM2RRWktPaFRxNXh2N1pkOFdsTVZn?=
 =?utf-8?B?Tm8zaWxSQlZJUkd4clV1cU9sdzU5UVlhaFpIUS9KRjFMcFVTd0lKS2V1NmdU?=
 =?utf-8?B?dHorbWtOQTBkaEp3bjcvaTY1YlV6L2IzVkhkYjh5WkRXajQ2NnlieWNhVTUv?=
 =?utf-8?B?dHB1djZ3elEwalNxdzUxbEdqeXFkTUJRRWVDSWhRN1VnRTJpZXJxZmRpYktN?=
 =?utf-8?B?SUpsS01RZlYySlZLWFBhVGVybUY2c3NiRmlVZFNLa1F1T0ZpV2dGNnhieXBT?=
 =?utf-8?B?cnVRQ1RrZXhpUzR0ZThEYUxGdk5WVThsdmFETmFZQU5mU0hDZjJ6SXlpdlN5?=
 =?utf-8?B?cGVqWGVwZTA2UjllWHpDOHFveVNjdVM0d3lXUFdsWHp4RXlVZHUwemlUQzF0?=
 =?utf-8?B?dTRPbDNYV3FoeXEzSFVGNjZsRmJWeW9KV0g1OXR6TjEyNUkwQWVJd3gyU2tD?=
 =?utf-8?B?MmJBeXhjU0ZOZ3RQTm1RcXFkWTV6RGtjRHVsUzl4WmN2ZXdkb3JyZ1dwbVQr?=
 =?utf-8?B?VEUzU2taVkpyT2pvZ0dxZ0crQ1JUenBocUw2UlpCbmZZaGJOdFp4K2R4WThr?=
 =?utf-8?B?TmtCaE9seDc1eXRhRVp4RHpnQktmVGw1YlFBY0wyVWRxZDBMSVgwMUV2aVFH?=
 =?utf-8?B?NkpwM3VUQ08yQ1FXanltYThnNjFkZE03WkFHNHgrSUZyWUd4RFlzRmY4am1Z?=
 =?utf-8?B?R0lUQ2ttbGpDeHVqaU1sOTkxTnJ6V1NmNitSNzkxQlBFbktBTm5IcCtPT1di?=
 =?utf-8?B?Q1VIT05XVURHUXk5aTJBUGZ0UUJDdFNhMHhaTWw1S2VkZzNZLytubGFEb2x5?=
 =?utf-8?B?NzBrMXBLVlFCajRpZC94eTVYV1ZrYzNmMis0b2JKK0pxeThDemVRRkxUTy9w?=
 =?utf-8?B?SVNiclNhWDRhWjg1THFZendZVmQ1MWlvN205SjkvUHdURG5WTEp0YlNDOXdG?=
 =?utf-8?B?YWFVY2dGMDhVc09BVi81NU5oOUMrR1pLbDk4QjZOOThWcGF0bHc1LzNzUjls?=
 =?utf-8?B?Y2dzUFBKd052aS9wOVZMOWMyamcxV25wTTMxb1dMN29oV0UrTFBvNDUreGxQ?=
 =?utf-8?B?UDNZeHZxM21hMi9PWXhXSGpIUFpvV0hsOVdyWUhqRUdpZHU2RTBpaWZSUlNB?=
 =?utf-8?B?ajNSdW9JR2VwWUlvNmpLOVAyYXBYZ0haeGJ5U09qZTZQSE5jdndiVW42cFVD?=
 =?utf-8?B?ZnJ4bmlYV2g5WlJ5NzZhSmhwdElFUFp3M1U2SHBYeVp4K0lINUVGK2xLYVhz?=
 =?utf-8?B?QXdEbEhidkVpVTVpL2M5R3NYTUZtVDUyNXpyemljeGpRZ2p5cHF5dzZiUUpz?=
 =?utf-8?B?TWRwMFdSZDJPNmhWQmJJTWpXRlhDeHhkeUdHQ3NhYllsZDJ6bHo1R1dBbURI?=
 =?utf-8?B?bWlWMWpHbGpra3JJanAvK0lpNFRuR085Y1FMVUtzMG01RHZnSjR3TVVGdGlN?=
 =?utf-8?Q?e5/Ow9IAl6SIA2fLcf70pvdUk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a68ed5-3282-49de-f1b6-08dd6229961c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:21:31.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIvyvcAp2PuBxGhCDv9E412kUZgwwT73j+tAWGD1zW4gE0ZMyQAUIVEHELsJHwTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785



On 13/03/2025 12:51, Luca Fancellu wrote:
> 
> 
> Hi Julien,
> 
>> On 13 Mar 2025, at 09:22, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 12/03/2025 13:52, Luca Fancellu wrote:
>>> Introduce variables and functions used in the common Arm code by
>>> MPU memory management subsystem, provide struct page_info and
>>> the MPU implementation for helpers and macros used in the common
>>> arm code.
>>> Moving virt_to_page helper to mmu/mpu part is not easy as it needs
>>> visibility of 'struct page_info', so protect it with CONFIG_MMU
>>> and provide the MPU variant in the #else branch.
>>
>> Have you considered including "asm/{mmu,mpu}/mm.h" **after** struct page_info is declared?
> 
> I didn’t tried that, but if we do that we solve all the issues (I don’t like #includes in the middle of headers,
> because of that I didn’t try).
> 
> This is what it looks like:
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 9bf5c846c86c..b49ec9c3dd1a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -14,14 +14,6 @@
>  # error "unknown ARM variant"
>  #endif
> 
> -#if defined(CONFIG_MMU)
> -# include <asm/mmu/mm.h>
> -#elif defined(CONFIG_MPU)
> -# include <asm/mpu/mm.h>
> -#else
> -#error "Unknown memory management layout"
> -#endif
> -
>  /* Align Xen to a 2 MiB boundary. */
>  #define XEN_PADDR_ALIGN (1 << 21)
> 
> @@ -264,53 +256,13 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>  #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
> 
>  #if defined(CONFIG_MMU)
> -
> -#ifdef CONFIG_ARM_32
> -/**
> - * Find the virtual address corresponding to a machine address
> - *
> - * Only memory backing the XENHEAP has a corresponding virtual address to
> - * be found. This is so we can save precious virtual space, as it's in
> - * short supply on arm32. This mapping is not subject to PDX compression
> - * because XENHEAP is known to be physically contiguous and can't hence
> - * jump over the PDX hole. This means we can avoid the roundtrips
> - * converting to/from pdx.
> - *
> - * @param ma Machine address
> - * @return Virtual address mapped to `ma`
> - */
> -static inline void *maddr_to_virt(paddr_t ma)
> -{
> -    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> -    ma -= mfn_to_maddr(directmap_mfn_start);
> -    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
> -}
> +# include <asm/mmu/mm.h>
> +#elif defined(CONFIG_MPU)
> +# include <asm/mpu/mm.h>
>  #else
> -/**
> - * Find the virtual address corresponding to a machine address
> - *
> - * The directmap covers all conventional memory accesible by the
> - * hypervisor. This means it's subject to PDX compression.
> - *
> - * Note there's an extra offset applied (directmap_base_pdx) on top of the
> - * regular PDX compression logic. Its purpose is to skip over the initial
> - * range of non-existing memory, should there be one.
> - *
> - * @param ma Machine address
> - * @return Virtual address mapped to `ma`
> - */
> -static inline void *maddr_to_virt(paddr_t ma)
> -{
> -    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
> -           (DIRECTMAP_SIZE >> PAGE_SHIFT));
> -    return (void *)(XENHEAP_VIRT_START -
> -                    (directmap_base_pdx << PAGE_SHIFT) +
> -                    maddr_to_directmapoff(ma));
> -}
> +#error "Unknown memory management layout"
>  #endif
> 
> -#endif /* CONFIG_MMU */
> -
>  /*
>   * Translate a guest virtual address to a machine address.
>   * Return the fault information if the translation has failed else 0.
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index 5ff2071133ee..9557f632d8e6 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -21,6 +21,50 @@ extern unsigned long directmap_base_pdx;
>      (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
>  })
> 
> +#ifdef CONFIG_ARM_32
> +/**
> + * Find the virtual address corresponding to a machine address
> + *
> + * Only memory backing the XENHEAP has a corresponding virtual address to
> + * be found. This is so we can save precious virtual space, as it's in
> + * short supply on arm32. This mapping is not subject to PDX compression
> + * because XENHEAP is known to be physically contiguous and can't hence
> + * jump over the PDX hole. This means we can avoid the roundtrips
> + * converting to/from pdx.
> + *
> + * @param ma Machine address
> + * @return Virtual address mapped to `ma`
> + */
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> +    ma -= mfn_to_maddr(directmap_mfn_start);
> +    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
> +}
> +#else
> +/**
> + * Find the virtual address corresponding to a machine address
> + *
> + * The directmap covers all conventional memory accesible by the
> + * hypervisor. This means it's subject to PDX compression.
> + *
> + * Note there's an extra offset applied (directmap_base_pdx) on top of the
> + * regular PDX compression logic. Its purpose is to skip over the initial
> + * range of non-existing memory, should there be one.
> + *
> + * @param ma Machine address
> + * @return Virtual address mapped to `ma`
> + */
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
> +           (DIRECTMAP_SIZE >> PAGE_SHIFT));
> +    return (void *)(XENHEAP_VIRT_START -
> +                    (directmap_base_pdx << PAGE_SHIFT) +
> +                    maddr_to_directmapoff(ma));
> +}
> +#endif
> +
>  /*
>   * Print a walk of a page table or p2m
>   *
> 
> 
> 
>>> Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
>>> pdx.c.
>>
>>
>> Maybe clarify in the commit message that the frametable will be setup at a later stage?
> 
> Sure
> 
>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>  xen/arch/arm/include/asm/mm.h         | 18 ++++++++++++++++++
>>>  xen/arch/arm/include/asm/mpu/layout.h |  3 +++
>>>  xen/arch/arm/include/asm/mpu/mm.h     |  3 +++
>>>  xen/arch/arm/mpu/mm.c                 |  4 ++++
>>>  4 files changed, 28 insertions(+)
>>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>>> index e7767cdab493..c96d33aceaf0 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -341,6 +341,8 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>>>  #define virt_to_mfn(va)     __virt_to_mfn(va)
>>>  #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>>  +#ifdef CONFIG_MMU
>>> +
>>>  /* Convert between Xen-heap virtual addresses and page-info structures. */
>>>  static inline struct page_info *virt_to_page(const void *v)
>>>  {
>>> @@ -355,6 +357,22 @@ static inline struct page_info *virt_to_page(const void *v)
>>>      return frame_table + pdx - frametable_base_pdx;
>>>  }
>>>  +#else /* !CONFIG_MMU */
>>> +
>>> +/* Convert between virtual address to page-info structure. */
>>> +static inline struct page_info *virt_to_page(const void *v)
>>> +{
>>> +    unsigned long pdx;
>>> +
>>> +    pdx = paddr_to_pdx(virt_to_maddr(v));
>>> +    ASSERT(pdx >= frametable_base_pdx);
>>> +    ASSERT(pdx < frametable_pdx_end);
>>> +
>>> +    return frame_table + pdx - frametable_base_pdx;
>>> +}
>>> +
>>> +#endif /* CONFIG_MMU */
>>> +
>>>  static inline void *page_to_virt(const struct page_info *pg)
>>>  {
>>>      return mfn_to_virt(mfn_x(page_to_mfn(pg)));
>>> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
>>> index 248e55f8882d..c46b634c9c15 100644
>>> --- a/xen/arch/arm/include/asm/mpu/layout.h
>>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>>> @@ -3,6 +3,9 @@
>>>  #ifndef __ARM_MPU_LAYOUT_H__
>>>  #define __ARM_MPU_LAYOUT_H__
>>>  +#define FRAMETABLE_SIZE   GB(32)
>>
>> I guess you copied the value for the MMU code for arm64. But is this value still sensible for MPU? What about arm32?
>>
>> In any case, some documentation would be useful.
> 
> Yes I took the one from arm64, here I probably need some help as there are not too many
> informations about how to size this.
It depends on your estimate about max RAM size you want to support in MPU case.
32GB / 56B (size of page_info on Arm64) - tells you how many page_info structs
you can have. The above value * 4K - tells you amount of RAM supported.

~Michal


