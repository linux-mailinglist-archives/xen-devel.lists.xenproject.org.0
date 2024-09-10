Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5879738E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795572.1204960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so18U-0000Dw-83; Tue, 10 Sep 2024 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795572.1204960; Tue, 10 Sep 2024 13:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so18U-0000Be-4m; Tue, 10 Sep 2024 13:42:26 +0000
Received: by outflank-mailman (input) for mailman id 795572;
 Tue, 10 Sep 2024 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEI/=QI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1so18S-0000BO-2U
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:42:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8089dca9-6f7a-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 15:42:23 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.33; Tue, 10 Sep
 2024 13:42:17 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 13:42:16 +0000
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
X-Inumbo-ID: 8089dca9-6f7a-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FESqOUPhf0Kcoj4OqPTlfV19CNDwmEXJaP/v16qEc0/4KjVf0V8NStEG1x50zRUtcSAJz9Ak/zSzeBBdrWB53l9EstLi+ZzwV+nLJGptXs7pPCwWEp+SHlJ2j4XQpGr69IS4FoLZ+cuf36/j8w/MdvmKFpVKasHjg83JD9aic4TCdXR+L/iliqhc4dIOd87lxfsz5tnbOZi1eRubdc/jgi2N+mYUH2PEmDciHlFbTUeDUEYyx4r0ansjerrq4IUy/0tE2m4mf17SJVPsAWe1pWxj0XxI90VRNxagsqci51/OFh4RNuw0+N+n/sopo2+zdmGtS8bWudcsUT9rryE6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XDvrq3ryzHm4O12uADvRGqOawWoderPBSwJTR4Iaq0=;
 b=XhNTfIF4ynwjwcBZbxtL4tkldpvtLdqLTPp6TS0pZbEl5xojQQmAkDQAQ7G2PMorN03oLJYWRhScWnb5vgqd31fyYzjO97HsTGLt4M7rR9P3CbFvQc/sV+EKLwxy5MMOF3sqQWfUtBPvievJ7CEkIZKhD8i8ARtThyqFxM3acPJi6pgGxS1z34Qb6o5og51BntqkfuxMfkgr1ckDPvYSJBgDA6izt8T9l+/cetdJGoRjyMShp3zOvGcRseUO2ugOY1PnX2COAmjjb4S7+4aE4tl7jPjtZCjTDm5q8XsDv1yBB5L1Helm6ymtswwSd0CkhxyjpLCBKUcspRu4OwCKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XDvrq3ryzHm4O12uADvRGqOawWoderPBSwJTR4Iaq0=;
 b=QgMDNeX8ye2MZthwtt+AmP6DuLP1jhZYIKHfEUei6Uh2k1UZhl2DlYEwUHDi4Cqa4vZhe1AO5pfJYaN1w9Jl2FmB0b0F1ReqqfZ08OJOTw5Jc1tvfDchKn+rYYsmaBR5qKrewJ8GqxegDTzf/NcXumaGIZ7IAqSHsf/5PNUamwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5583411c-aad5-45d0-97be-f0d630afbca1@amd.com>
Date: Tue, 10 Sep 2024 14:42:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
 <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
 <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
 <0533aee4-1b08-4714-b497-a4df70703895@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <0533aee4-1b08-4714-b497-a4df70703895@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::31) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c2373a-f325-4ff1-88f8-08dcd19e623d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3NuUW0ycU1sN0o3eWxtYlVYTURMVGdaS0YrVVd3U0VtOFh3NHVKOGtiSENM?=
 =?utf-8?B?UXRPYnMzVExmYU1DUUhNdzVXM1BuQmQ2cHB1dnRvaUpIcFRiRWhSQjRPVWZV?=
 =?utf-8?B?RnVwKy9va1ZwVW5saWdYa1cvUlQxYUJKK0VnZEFBMmp3WThKcVhJa3psb2VR?=
 =?utf-8?B?S0ZQT2JxRGEySEdoSU4weVBOU1NENkdOSGphMzVDTnN2OUlRbDJwbEZnM0Fx?=
 =?utf-8?B?V2oraXdEZXhWWUVIbjQvV3l5NzRKQTBzWXcvZWZGL21kenhMeEtPelFPeHpP?=
 =?utf-8?B?S2ovNGEyTDBNSXh0amhnMmhjYm5kcXh1OW44WlR1U3BRNFhEd2I5VDI1eWpH?=
 =?utf-8?B?ZkxQd0FmVGRZYjZ2MXpkdzNxRHh6RWFxY3hJNEYyMDd6ZitlNkFhOHQ5Z1A5?=
 =?utf-8?B?NmtSd3NoUDJYZ1Baa3M0RC9WWUsxaW1NamhLN3h2aXpRNFVvOWRLOStMV0dH?=
 =?utf-8?B?M05oSUJKQVhnOG45aG5lTE5mS0lmOGo5YlVnRm1ZR2dXNUw1SSsxY1A1c3BY?=
 =?utf-8?B?MFlCOGZKbHNJaHBGNGlRZGNoSytnbXRjVTRldHA0ODhyWnNuaFU4MDBkSzgz?=
 =?utf-8?B?UllYcXJmMkI5bUVwV1ZaUDFEcEtrNlZNaXhOWWg3bUpLV0dMcSsyYTlEWW00?=
 =?utf-8?B?YlRDdWp1Z0xvSEpyaTBuQ3VEbXhtbUExWlROTGhtTDNYKzJlZnp2cWwyUCtO?=
 =?utf-8?B?LzlsT09GWDBGYm9lR3hxMkZ1c2h1bzlQcGxhTGY3cXhsVW1ZaGFNaXIxcTZp?=
 =?utf-8?B?SjlkWk9HMnV6YTl3bFc3Z3lmNlN1N0ZTWGNjamNsU0kya0gvSG0vZjZnOUhU?=
 =?utf-8?B?WFFFSUtFcTBrbGxteHAyRmgvZUdGTGxCMGJSVVFoWlZmNndDSFlRaG5jZUIz?=
 =?utf-8?B?OHhZYWd2dTRSeG5LVEl6Ukx2TkdzY3VYR252ZVNpUGNuaHNqcUpIR3NBemw5?=
 =?utf-8?B?WGZ0bG5DaGRlWERFSjJnd21MSWUxUVBsd0hvZ0ZsdmNOby9FM3F1Tmk2ZnNm?=
 =?utf-8?B?czUwZFpjRTdCeFBpQk05dG0veXY4a1FTMTZZTlFaZEtWdGgwWEF0NENJMFJG?=
 =?utf-8?B?WEF6ODUvMVJMdmd3RlhjZXdERmJkRmVENTRSVjhBaFlpbkxpTUFqRG9aWm1v?=
 =?utf-8?B?dTk0bkpCcjRnU05VUHRLekpwU0FYUFNBeVY0Sm5xTklIM29JYVRWUWhLaklo?=
 =?utf-8?B?Q1pnV1JvVzVlWXpJL1F2cG4rNGcvV1FlcFdjRkRyN0RwQ1VZak9PbTMwNENk?=
 =?utf-8?B?aWdWcm5YSWxkY00rcjJVL1kxU1hTT1RRRnVyZGEzWXlXMXMreENEcWU0ajgw?=
 =?utf-8?B?R041a2liTW1vQlFlcUlHNGpXQ3ZHbC8xMklXRDEreGdoZEtIMXFqR0Vxc2t1?=
 =?utf-8?B?OGo5QldCLzQvZmoxK0NvNUIrVG5PY3RBb3RFQUpVQk40VWlOOThYVXgzWDBC?=
 =?utf-8?B?Nm9yb2dCclJBZnlsQ0NYRUtRT2ZLbVhOZmxISTd3Q3dwc0tob0lrTWdHaUxX?=
 =?utf-8?B?SEZvQ0R5Tml1TDVveXh1RkFna1k5SkZIeHptd2s2Q05ES21lakhFTVFJdFVi?=
 =?utf-8?B?VFA4MTlSYUgwYWFoOE95U2dHeHhGOW81TDQ2alFPa1liVHBvalpzcHBSbWs0?=
 =?utf-8?B?emlPTFBYbkVmNXpXM2I3UkovUWFwNmovK2N0SmkxS0dGSXkrL0E4VlRqdGIw?=
 =?utf-8?B?b29jTldLMGtCcExYejluMzdJOHFFQnJIa3NyK2crTnRUQ0ZsQVNkQ2V4TWx4?=
 =?utf-8?B?UXdtbWQwb1VIZGVYZng3MUhQdXZhSUtKR1lNbUVid2c3YlRJVXd6QjQ1eWky?=
 =?utf-8?B?dlBOMGdXNlFNa3pGdEZzdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlU5czE3MmI5c20vanNMciszcmpsbVlGcitLNVJYYUs1V243T2FVYXRlOUxn?=
 =?utf-8?B?bVNDM3k1UWxjbGdnNWZGdEc0blI3eWUrdHIrOGo4SkFZRTFnVjFuNnNsRzdO?=
 =?utf-8?B?YnYxTytkZTYwZ3FyRGYycFZiU2JONXJQTVJycFJkOWpsSWc5TWpFbDFyRVdU?=
 =?utf-8?B?L0QzRHpJYlZjcWF2VExlYXI1MkdhY0VkRmdBMGx1eWF4NkNBVFQ0SllVSmxY?=
 =?utf-8?B?ODN4ZFZNS05DYjZZZnV5bDU5OTZmZGhwaEVrK3F6ODI1UElocm5kdk50aW9p?=
 =?utf-8?B?ZFdHMHhhL2xSRUk5ZXJRSElJbGNPMjJhSW9IV1pudmx0VW82WVh4Z05RdTlV?=
 =?utf-8?B?bEpWRU9pMFRWMXFldTN6dkNRWkFENndwS0Y0c3FBT3lleS9YVzk3NHVmOFBT?=
 =?utf-8?B?VVpqN3ZhMTk0enluKzRJY1pLbHR3WGo2VUtFQVAzbnJzaE53NEhORUFjc0Qx?=
 =?utf-8?B?QURiN3IrcmZuT2VUcWhGY3J5UDZEMkdnbFNTZmRCb1Mzb3ZlOVdsR1VjT0V3?=
 =?utf-8?B?QVNFSmRUcW9uUjRiUGVVbTFPeHU3YWpFRitueldkemgxcmxBRmNkMWV5UXNK?=
 =?utf-8?B?Rm1oOFc4ZjgreXl3SkpPMzNSbEQ1NTJPMnJGSTVMelMrUFo4ZjR2NFExZ1lC?=
 =?utf-8?B?Z1BQZkE0eVRrRUdUWnc2TDIwY2E2MmR0SEc3Vjk5eG9uOXZFY0plR05ZZ1VM?=
 =?utf-8?B?c1l6bC9pU0xCT1RVNzIvNm51V09NYmxMZGg5eFhoemY2MGlWMnZxY0dvOFBn?=
 =?utf-8?B?U3Q5V1VJU3lsdG14bVhPUkNTL1M0Q1BJRFhJT3VsT1p3d1dmY3NVNFh5djFP?=
 =?utf-8?B?S1ZrR3FYcmc0WWZhOTBJamhyREJPMnFzcncyOFVSWDVwR3NCMithcWI4M3Q4?=
 =?utf-8?B?N1JBZGk1MW01SmFlM0dPR09PSUNta0h4ZFR0Y3g5N1dBalBEeDRneW1OSkk0?=
 =?utf-8?B?OVUxKzFINlc0N1pxSGFScXltS2c4V1NwRGM4QWhlMzhKMUllbEZSRVVXTWJ3?=
 =?utf-8?B?VXNHbmF1QUUrdzZoeVNzc3BXTWM0a2ZadzBKTmltZHFSa0YyRmZ1NElXZFlR?=
 =?utf-8?B?L0laR0J4bzd3RzFBd2dJNloyZSs1c1dNZWxPK1hOK1gzczhUVzc1eXZvSGRl?=
 =?utf-8?B?L2hQK3V5MTBNdkYyWVFnWEU2ME9KRFYvdGpGZFY1THdkODZCa2xxTDM3TmlD?=
 =?utf-8?B?anNTYnd4OHlXbFJocW9TdUxFYUpqVWZER1JyNGkxeFdCSHRuNjRWUitMdjdK?=
 =?utf-8?B?T05WcWg4SkhpZ3FLYVc2V0tpdW1ZZ1RhVS9pS0h2ZnhTZzR2QlFMYnQwRVZM?=
 =?utf-8?B?cDIrejdJbDl0VzJEdkRwZnJZTW9NY2ttcGxSNnN4STd0U0hVbHVUTk85ZGtN?=
 =?utf-8?B?SkJublZvTi9EaUR0TWZLL24zVUpiZm1JZTRMNWFndlcxTFNQWW5VMWFJNGZv?=
 =?utf-8?B?NWoxanRRQnJWbS9GMjRBaWpRVlEvaDZURUxTZExCSXU1dTE3QkRHc1FOazhI?=
 =?utf-8?B?M0hHcGFXMFN4V2tFUnMrSjZWdThWalZMWk1uQTJISWNYTEtrZmFzbTN5dnlP?=
 =?utf-8?B?L2V3bWt2Rm1HRlMzd1MwanI4bVJoSStqUDZRVXdkYkRYczFQK2d0MnNid1FZ?=
 =?utf-8?B?V0NONTR3eGRlejl2MDQ0cXJRMEdQcUhSb20yWkVaMG1vZFBaMUdNdG1Qa0V1?=
 =?utf-8?B?eVE1SWlDMUcxWFFVeGQ2cmpuK3h2RjloQjNBWXZGSHpJVGtMM3pJV0xET2Fm?=
 =?utf-8?B?dEpQREVpdTFuOEZVOVJORjBDZDdaWGRibGV6QnpFSUZQd2dudWZ2cVVaQ0gx?=
 =?utf-8?B?T2JoTEg2Y2dmdmRNam5QdDNUU1hCT1FLRlMrcjczTzljRlZvZ0V1MHFReEw1?=
 =?utf-8?B?M2ZXeW0wbkVpRExVYm5mV211SVMzWWwzQ25KcXlZOGt5aTYyN2RQeHRSb2la?=
 =?utf-8?B?RUFtbXZYcG5VNVNtN0c4SGpXdUlrTENEcTIyMGRkbXBWelNlSytPaUpGRy9z?=
 =?utf-8?B?NnlLTkFBSjUwMzZpUDdNR0hUWmJIR2N0RW5OMGlHY04rUjlWZFVRWHovSm9W?=
 =?utf-8?B?ZWZXeWZCREl2MDBlRG0xbHdWTnpWOG9pak1aaHFFVTFyTGRzYzJGNjZBNXBs?=
 =?utf-8?Q?B4URrbOueHdzBqEGkIgyV49qK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c2373a-f325-4ff1-88f8-08dcd19e623d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 13:42:16.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqmrdOwdgRTJs7epgxvgw8GFg+LY6ksclcPRBs0dFUq6AnzKSRYxZShEyV/6H8yhIT4EiI8suQ3NCe1ROvks4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063


On 09/09/2024 15:45, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 09/09/2024 11:29, Ayan Kumar Halder wrote:
>>
>> On 08/09/2024 22:13, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> On 02/09/2024 15:48, Ayan Kumar Halder wrote:
>>
>>>> I will rephrase this as ...
>>>>
>>>> "Used to set customized address at which which Xen will be linked
>>>>
>>>> on MPU systems. This address must be aligned to a page size.
>>>> 0xFFFFFFFF is used as the default value to indicate that user hasn't
>>>> customized this address."
>>>
>>> Reading this comment, I would like to ask some clarification. In the 
>>> context of the MPU how do you define a page size? The definition is 
>>> pretty clear when using the MMU because the granularity if defined 
>>> by the HW. But for the MPU, it is a bit blur. Is it still 4KB? If 
>>> so, is it actually realistic (we don't have that many MPU regions)?
>>
>>  From ARM DDI 0600A.d ID120821, C1.1.1 Protection regions
>>
>> "Protection regions have a minimum size of 64 bytes."
>>
>> Thus, I would infer that the minimum page size (in context of MPU) is 
>> 64 bytes.
> > > Also, if you see the register fields of PRBAR and PRLAR, the lower 6
yes.
>> bits are 0 extended to provide the address.
>>
>> So, may be I should say
>>
>> ".... address must be aligned to the minimum region size (ie 64 
>> bytes). 0xFFFFFFFF is used ...."
>>
>>
>> Let me know if this sounds ok.
>
> So what you provided is a minimum size/alignment of a region from the 
> HW point of view. How about Xen? Will it be able to cope if Xen is 
> booted at a 64-byte alignment?
>
> Asking because it is unclear how the allocator will work with the MPU. 
> Are we going to continue to allocate 4KB chunk at the time? Will it be 
> smaller/larger?

MPU will work with static memory allocation only. It can allocate a 
fixed number of regions using PRBAR and PRLAR. We can make the addresses 
to be page aligned (ie 4KB) so that it is in parity with MMU. And we 
will keep the page size as 4 KB.  It makes sense to use the same page 
size to do the allocation irrespective of MPU or MMU. Also, it helps to 
keep a large part of the code as common.

However for MPU, we will calculate the limit address based on the number 
of pages requested and do the allocation. For eg in map_pages_to_xen(), 
we will invoke a function to calculate the limit address based on the 
base address and nr_mfns.

Let me know if this is clear.

- Ayan


