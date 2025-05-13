Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF65AB5780
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983015.1369387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqtY-0002zM-18; Tue, 13 May 2025 14:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983015.1369387; Tue, 13 May 2025 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqtX-0002wQ-UU; Tue, 13 May 2025 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 983015;
 Tue, 13 May 2025 14:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgbk=X5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uEqtW-0002uf-4n
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:46:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:200a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fff83897-3008-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 16:46:07 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 14:46:02 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:46:02 +0000
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
X-Inumbo-ID: fff83897-3008-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edqnZ3MY/MBBtbR6XTurTeuMhN+6N3QJu/80QSyp1FAwrpLZgqIDMWvoQM76R0xiqPR8Dw3G7x2tLXO4J66+TsAWn/B3dLKW+2vLQsEqA1Max04JCa2RWLmGqmVuc5WDsnhDA66zlIxCPy/RlzauXl6dN2NuYIzQajhAAa1BgJKMU30WPfhaALbO2rOqiowcF6UxzjVc7bulqJ6FqZmpFgi1AlsPY21csXTfTa7/wgqlfHUYZqwd8cd8TGLYGfVTdfXY2GIMGlb0dwV4N0wgoBL00ZUrfpgvPdaus4FRi8AskNXeDAhbwHObGdWTTnljiDcmjfh/8QfcSZNpmk/hYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed5VZ817fd+x83PGoGdBckLlmamInLqMfiGZajgcKBo=;
 b=F/WX62OSPqdZKo45JleFRE7jHsM7/jXWuMNGY07J+f+uj40LGXqj9vfvBZZHxXG3rlzbmwgNIH8WOrU+/zgyX27wkJ+cIf0jB2e0eb+RtSWgA6u7DXqRYSApjisVt4KBTuKRb92MbzAPKeIXs33M9MuOv61auv9U/sfZEIFPRfb0IsQtTi8swU2LkOej84eVpDrP1De4pDCco7Jh58zMw6GIGhy7/aWFdxBtuSHAI/7K7C5BSdLEOUrnklfxRQx+QIs21FxM0ouiO2H2xuHpb+DwB6frZFOuj9Ep0CrT52j2pUhaAn4sVIECyP49lbSPz8PXyl8308JJ08mzkSCnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed5VZ817fd+x83PGoGdBckLlmamInLqMfiGZajgcKBo=;
 b=tN4bMkoco29rTz+eZV1jhK/V3AyBey1GznLNYuc4Ag2t6ydaI6BPMvUhzxAVPkH3VFXECNTFj5MbYywJbb3dop2tdiMq0OiF9C3tabIFmfRXmYh+otTRs8+ZVYqzsGKom0gl3ZoatEMXOJtxSbz0FhH8Np+iydEQSYlJ9D5kTGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f0744def-78f6-42a4-a623-3cdfe6772340@amd.com>
Date: Tue, 13 May 2025 16:45:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/dom0less: move make_chosen_node() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <9c87738225d48bd1ee9bba6e8d4e018dfecabccd.1747145897.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9c87738225d48bd1ee9bba6e8d4e018dfecabccd.1747145897.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 5560dc0e-dd42-4102-14b7-08dd922ce1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THlMazVlZzVrbndsRWFaOW9XWUJQMlF4U3ByQ2d2NVRrTEpGSlh4RUJsNFY2?=
 =?utf-8?B?ellydTlRRkEyTlNQeTNFVHlMUG9ZZGN2dGF1VWZRd05ISWVweWVsWFMybzI5?=
 =?utf-8?B?RGJyT25MRnpDcThkQktBczJCZlFFWmFPUU9KNEkyZXcvSnhvVWw1MDlXWUxJ?=
 =?utf-8?B?TEY4NnVuSGVUYm5oU25zMEFGellheUpFdDl6N2dLcWtNZ3JBaE1LNmxOMDlK?=
 =?utf-8?B?a1FFSVpzc3hsa054OXkvTmtTclJTY1EvbXNSUXd2VXJDVzU2aVEveCt4cDFS?=
 =?utf-8?B?Mnp1Vk9TTnkzTERtaFVMWDk0Q2VtSHV5NGEvTWNTRDg2QytLZkxhcXo2dnR4?=
 =?utf-8?B?alZWVEpPTEdyZkhCSzhKdUE1Z0JZcDdWVVhDdmIvTFdZS0hFNmxEYWxXRVh6?=
 =?utf-8?B?SEZDSjJwbHNvVFBRbUg0ZVNiODhqQXJaTGZmWHNHZmRmd1JxU0NHRzQyeWdF?=
 =?utf-8?B?VGlEVU81Y3o4VmhYWmZWTWw3czdVZllBZFg1L2ZHelkvcHk3Q01ldXZEc1BT?=
 =?utf-8?B?M2U5Z0d6TndCQURidW90RndhUFFnZjlnbXY0ME1Zbm80WEYydlQ0MkdBZVAv?=
 =?utf-8?B?Y0VIUktlOTlKZG5MTUpib0laUGphWmFjNTQ2dDRwWTdYNHV4S2R5NGh1VnNu?=
 =?utf-8?B?eEx6TS9ZbmZlQklrYjFhdmExK1ZtY1NCbEZDaVlETXhVQTZUNllERXpIU1Vl?=
 =?utf-8?B?Qlpsa2Z0R3ZUbEdCdU1XdWlYc3IvRlg3WURRTGVIbTZmZUl6YXdjdG44ZlY0?=
 =?utf-8?B?SXRGdXUvSUpSQVJTOEgzZjRvT0hqb0I5RVd3aFZoVFBJSCt3dldrbFAxYW1C?=
 =?utf-8?B?RU03ZllEdDAxVTdkU1VtVnRFWDljWUtCRU9HYkxJd2FEdVkveUtGbjJxZkNx?=
 =?utf-8?B?YzhMSy9uSEZKR0J4ZmdmcFRoZnByS3FrUmF6Z0FKMGw2Y3FlaHBoTkpUUnA0?=
 =?utf-8?B?VVJnL3dVRkUxeXl3bDBwbXlyaFVWY3RGR1ZkK1d6Zy9wRmw4cDVVYWRvSENJ?=
 =?utf-8?B?MThLUHNvNGFBSWhGRzF5Qk1CaDBCQ0p0VjVaUTh6bitGZHFBcFF5ZTc5TzJa?=
 =?utf-8?B?QUFwMnlYZ3o4OUcxbmFGYlJNUEpna0dvWE9pU3EycUpRTW0rSTR0M2JKOEND?=
 =?utf-8?B?K3plUGMwcEFlUWw3RCswWmFSYk8vcHBSRXZrVkFkbWdEbUNMbnJHK1Q1dmJt?=
 =?utf-8?B?ZVJWalFIY29sUmtqUnBDSkljY1Z6bjRIMktUZitSZkIrZ3BjazVqR3FwL0JR?=
 =?utf-8?B?LytZQURVRzVUeFpKakpnYlEyYXoxSTB2aEpxREl1ZW1PMXl1Q0xwMktWVkxa?=
 =?utf-8?B?ZTdZL245cTNXdlphWmpHWVl4R05sdTN5MTRkOWtzdjN3M2JTNDJWUVJldW9q?=
 =?utf-8?B?eEw0Qy9uUlRRMjl0SzBJYk9hQWhpOEVpTUliUm9xS2xPV2M4L0xXZkVCRU1M?=
 =?utf-8?B?eEIxa3hWUnJEeitBZTFQaEVDU1lJMGc0MVFIUWxBUXJnUyt2VElvelJ2QjZP?=
 =?utf-8?B?Z3M1WFMvdk1vM0ZFUWlzSVBZbjhIM0RjQzB4T3dhOEdkM3RsOWpmaFhhVThL?=
 =?utf-8?B?V1UwU1FCUTlydy82TEpZamRPb0x2RHgrZzBEWGc2a3hKNW5wN0QxNDN5Y0RS?=
 =?utf-8?B?RDVXeGd5cG9TSjBFbnVXQlFvOU9xMlZGbDRDUXZwOGNrRXMrbG9IWVFwejlR?=
 =?utf-8?B?WE4rYUpQblk5akM4dFl2N2hSMElCY3RzamlHK0RIVFFFSmQrZ0Z5bjlCbnRR?=
 =?utf-8?B?NWlQcXYzWFJzVFhTUmxhdHlWc0NtM0hKbnJkWmVRVm1DVkhFTHJ5cXk4RW4v?=
 =?utf-8?B?bCtKd3VOejJUS2IxYktCQkpWUHBhMVZtWFBwZUZySXJ1VEZZL2U4MTBMdmc4?=
 =?utf-8?B?RFBmL2gvL3A2c21hdk5kOURtbGdLbmlEdGx6TThDUzNYRzMxZ2ZMMDdLM1ZE?=
 =?utf-8?Q?phEWmPhRSC8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVNad3NiZkQvZXU2Mkg3azB0NmVjYXRycC8rTHErZUQwSCtoaG9NYWN3dFRH?=
 =?utf-8?B?QXRWZm5QcXJMci84cVdoRE5ZU2RTQkhEOXpSV09XdjFsd0tlcGJWcndOUGlq?=
 =?utf-8?B?SmJ5UFd2NGxON3pjUGxzcm9FamxrZndnZVFIeGdIOGJTS0ZFL2dOSEZ4U0hW?=
 =?utf-8?B?OXBtcHEvL2lKUk5TS1E3L2UvZkVqaXh6Q25tcHFkY1EyQ0ZKeDhOYlgwcUJi?=
 =?utf-8?B?dFdIbC9TY3hyeTdQWlFTQ1RvcFBYZFZYeENWQTBkTUNEUGwrZTBhVkdXdyt1?=
 =?utf-8?B?UG5DeG5MTWZMdTJKb242Z1VMMXRlRkxLMXBQbDRsUVFjYWxqL3I5NFlUQXE0?=
 =?utf-8?B?RW9qbkFxM0NQdGRDNlVHN1p2dG1JK0Ryc3MvU0E1UWdWSjFIWk9SeEV2RlNF?=
 =?utf-8?B?RTRwaCtJUTE2ZUFVUjBuajZoVTgwZWdCUXNUWEVDbklpbTJReWZZVEhxTm95?=
 =?utf-8?B?TFpEd08wRmlpMGNiTFRydnpDL1ZrOUlUVGFTN0s5TWU3TDBFc001MEViNzE0?=
 =?utf-8?B?MHZobXpPQ1BDWEE2OXAxc0NycnRLUG5OcWdPQXoyb09CKzJRaThoRzh0QlJz?=
 =?utf-8?B?TU1MN0JGUzRjQzk2eHNpc3dFa3Evc0JnYkRvR213aENhK1JpMnduNDAxNzZF?=
 =?utf-8?B?cGlqbzFxWWpNYjBsall1RnJ6bzY3QUZTdjRlYkVvdnpsVmVVUFRmN1pFbTE4?=
 =?utf-8?B?YzlrdDNsYUV0VzJtUEZRalg5YnZuUkFWTjNUMk9neWhQQWFpbTBDWVNKVHZy?=
 =?utf-8?B?ZUV4emxpSXFWSFJrRzNvSkszSllYOTdBNUY5cG9KZEFGMGxEcVNqL3p4Zk9w?=
 =?utf-8?B?dW9Bd2FzOG0xQ1ErQlpOWDM3dEJFV05lRDZ1S2pGZmZRaEtWTDkrQzV4ckNu?=
 =?utf-8?B?YzVuSE1TZWtrS0lCYXJXTkJvZnYydVJpaFFEN2JQQXBUSFpnb3NxeWFSdE12?=
 =?utf-8?B?YmlkUEREQjJENCtJYU93WTV5MTNBYVV1cHhGbmlYVWlsbGVSREkzV1VkczBF?=
 =?utf-8?B?VXplT2Nacm1ZRC9VQU5VQ2p1K0w1OVJnbzhzdFdjVGIvbnFieFhhQ1FKL1V6?=
 =?utf-8?B?V2I1WVRZdHdldW4rd3MrRGFrRWVaWm9kUnNUQXVzOFQrbXQrdFVMUkVtNE9S?=
 =?utf-8?B?YnBSSDUwN0JSNDk2U3VLMjJucS96V3haZmJPb3FudVBpS1pZdEJmd3hJSDhp?=
 =?utf-8?B?SUs1OUxKeEhVZVdwUzFneXRycWlwcmYyaHBmT2pvWjhkNXpYakFpdnVpUDV1?=
 =?utf-8?B?azNhVVFNUEFIajd5T1F5MVgxdWJtWDdhME9TQXFGeEdTenJHSUlHOHpSZytM?=
 =?utf-8?B?MC84dDVESUorWXRZcHZKb2hWMXdYdTRCcFpQTnNKNCtmR0ZITTJPMW44ditw?=
 =?utf-8?B?THVFS29XR3hEZVNOdGpGRzJ0V2RyOXc5MzlHa0FOcklEVWlmcUVJMTdhUDlv?=
 =?utf-8?B?dEhOMnBZUlFiKzJDUGtYSHhzUWliZnhtQkN6YWUzbW1jbWZETytuNU1RcnJx?=
 =?utf-8?B?eHhRcVFCZ3gza1dpdnF1N1Vrd3oyQzJBMmtzRytLTHRra2tvd25XWm5zb2Zi?=
 =?utf-8?B?K2JDenRVdGhTWDRYWklab001RSt0U09FWlhoanJFb1NneDd4QXhJTnNmU1VG?=
 =?utf-8?B?MmQrUWI5UE42Q1lXbkttbis4VEEwbkhyemE0eVBxbjI4ZHM1b0pwWHlvQkdm?=
 =?utf-8?B?U2o2OWpTVWZOWXdNOHFWZ1hFNStZOWxFeHhFdEFVY1lhOWdjQkdid3kyUVhD?=
 =?utf-8?B?UzlRSDJMRTlhYk1zNEZ4S05KM3YzNytRcHAzZkpnTDB5RkFmOHRuVm9FWUVr?=
 =?utf-8?B?OWtlemVSTldUcUdSN2FIb1hNcGRtVkNnWUt2NC9mVkpGcmNLNHhjVnEvV0t1?=
 =?utf-8?B?b0hiRjAzak1jaTY2a05nMVhTM3puZlNOY0lISTVsWjJNRklLRnptMmg4K1Rs?=
 =?utf-8?B?d0JkRGNtRjZGU2xncURxMjFDWkJNSnEvMExrcU01NVc1b3J5YUZXUWd0V3dz?=
 =?utf-8?B?eWQ3NkpxbmRVejVmTUYwMURycVlKemtoNEN1MXRGdlFSTXJzYWEyNk51aGY5?=
 =?utf-8?B?SnpaRkZuMGg5SGZma2t5dUN0M3UwYWY4UmNVN0J2cWdmb1IzK09TalVVRVVP?=
 =?utf-8?Q?aZxodA2Bk6EvS1t0y7i0aZaCh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5560dc0e-dd42-4102-14b7-08dd922ce1bc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 14:46:02.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GotnhbBnLMVOzXJ5AgeUt8E2Snr1UBM+2uSKHOnuoGmt7/BfnxMAqc3oV1MyhCp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930



On 13/05/2025 16:29, Oleksii Kurochko wrote:
> The current implementation of make_chosen_node() does not contain any
> architecture-specific logic. Therefore, move it from arch-specific
> files to common code.
> 
> At this stage, there is no need to introduce an arch_make_chosen_node(),
> as no architecture-specific customization is required.
> 
> This change avoids duplication and simplifies future maintenance for
> architectures like RISC-V and ARM.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

[snip]

> +/*
> + * This function is used as part of the device tree generation for Dom0
> + * on ACPI systems, and DomUs started directly from Xen based on device
Might be worth adding (on Arm) after 'ACPI systems'. Could be done on commit.

~Michal


