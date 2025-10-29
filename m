Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D985FC1CF45
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 20:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153070.1483549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEBc1-0006rL-Ob; Wed, 29 Oct 2025 19:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153070.1483549; Wed, 29 Oct 2025 19:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEBc1-0006p5-L6; Wed, 29 Oct 2025 19:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1153070;
 Wed, 29 Oct 2025 19:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zIlg=5G=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEBc0-0006oz-AN
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 19:13:36 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b10c2bf-b4fb-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 20:13:31 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ0PR03MB7026.namprd03.prod.outlook.com (2603:10b6:a03:4e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 19:13:27 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 19:13:27 +0000
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
X-Inumbo-ID: 5b10c2bf-b4fb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFIP/QWnv5viD+mmMfYoPAco2elGfcolPUszRP1q6q3NdgI1vTvGdZV8uiXp4qCtpLiiXDKLiNiVyxU6pXU7psGUlwKPs6BiOMQbNMQKXjmwdwXTDQDUdYFqZSCHI03+QyZiB9RObZJLlwGwi857minvxZOPV9vPgiYqZxXDOW0yLj1kWExuNmuqQLngRe8F77nrCkBHu1kl7hPCpiQtXA2xTeFtqbDXqKPEPEu1J/7hw6Zr8RPP4DooQ4fJ9ZbBDtdwK/xyD0nqVz+jBBlB2xFmoxuG4Cv1gQZ6n9uS+2VqTPccWJRx/8kDuZarioMNEWTRq2EC2uCHltuYLVt+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7iCltpy8vsjKuNeZunqiKgTCTzeMoQ8MfB191qo8RA=;
 b=diI67vzOhlUvnmjei3KmpbdbMp0KLPStAwm5UeEnXxXfoL0U2tB5HYQtDQIauSBsInkYrUsq5mrX2qJSHZzXPriuEq/OU2eMTjo8t6gT7BVIM/Vk5u7oLdL4Vx4UtCnvtg7EtwkTFbOE4eERT282iaYVyLZqCcTPD1kL7xXCHdjTBKf7g/HuQ8bmLnCMoUAKI+2WV3kfDy1H1e/aJBs7yXhxbCnW6t0JjvEVjkrN8hY6qdeXUQyB10VCL6fnxGrMFPlSCInODYBifoGpMedeRtNUkjcVnQ8lZ/28ZbTdQLS/ZKQNEyo1tiKdn9DmycU4/iLDmrf3OaHI26EcwA8G2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7iCltpy8vsjKuNeZunqiKgTCTzeMoQ8MfB191qo8RA=;
 b=y5fYR21AhzL75kTuBj4NM6QGaymm8i5C3f+32Q82QYG+ersbAP93etwWOrtRxgrEs8braGp2BTs+rktEjLVrjCvs0WGoj1zQp5LnNz0beTBQ/xoUH19v8mj3f1JQWweGN7U7TIYyMOiOayb6tAVEeD5MqsrO6DEST6+Q/Kq5Iv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Oct 2025 20:13:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] symbols: avoid emitting "end" symbols for data
 items
Message-ID: <aQJnUucAvn6Y2oc-@Mac.lan>
References: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
X-ClientProxiedBy: BN9PR03CA0590.namprd03.prod.outlook.com
 (2603:10b6:408:10d::25) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ0PR03MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 9299239b-71d6-49f4-ae39-08de171f3c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUx4TU1RMzlWY2xTVU5KN3R0NlNQOThSVW1qcmIyelJSYXljL0hpSzF6RStW?=
 =?utf-8?B?MG0vVnVoNkhnSDZWaGxFaStZQXBXRlk1UE9lYnRhd3NBTjQ2dVpEKy9XbjZn?=
 =?utf-8?B?SkVMVGVFN1F6WERtYzRINGZwNm5YY1FoZk1rL0dWTFlVYUlkV1kxd1FTWDQx?=
 =?utf-8?B?ZTNOMUsrak14cXJ5SXcvNWRPQ1VuSHNabEVONXBPUzFucFRFcU5FTDhaQTh5?=
 =?utf-8?B?b1l0bldndG9WbUVYZ3dwaVE0Y1ArOCtCV1Z4dEFPNUVyS0Q5b1FLOE13SG1E?=
 =?utf-8?B?bm9jUzhqMDVySjh1Y0I4em9pMGlCMnBSenBQeEZQY3lCVWlOU29lZVRMMlRH?=
 =?utf-8?B?Vm93bTAyYXplaDlzQy9oU1g0TEJrMlBRZmJYYlkwaUJyWkNDREtWaWMxUzdp?=
 =?utf-8?B?QzhYVmtXWElhcFNGUDNtQ0lSZHdHOVR0akJxRStONFFZdWtYZDNzYVNwenEw?=
 =?utf-8?B?bWZJSUh2dkY4UzVyQ0ZyOW96NmVKUUZIRUtWbm1xZ3BHUzVpS05BWjBLSDEz?=
 =?utf-8?B?L1lqdEVMMXI1aTF5ZHNOelpYamZlYlBJbUFaN3pKZjNORTBTOEk1Z2NSdWZw?=
 =?utf-8?B?YkpDZW1NeGIrM1dyMjI5STB4MkkyMllmeWtLN2dtL3dhYjVQY2RtMGROVzRM?=
 =?utf-8?B?akZBWGlCa29KZmNoU01udEFCWXlSaVpSN1ZSMGhza0crcGpKdFVGVEtCSndR?=
 =?utf-8?B?bCt0UWttc00wLzU4U1U0ZTd4TGduMWNWdnU4ekw3RndOcDNmMDV0bDRpL2t2?=
 =?utf-8?B?aGpVaFBOenhSUjMvdit5RTg3Z1M5ZnR1UVR2Y1cwQ1NucjJ3UlZTK1A3K0pW?=
 =?utf-8?B?eW9tbm5XUDNNVW0yc2h2Q0VHVjI0ZEkwanZjVHhodkhMUHBWQk5heW9vazFj?=
 =?utf-8?B?VEhhNzAwTTU1ZkpzNUhDdVppb09veUp0L2l0MGRhTXhRTG94ZWkzUmlKaUpL?=
 =?utf-8?B?eTJiOFRTTXdVQ0lSV0VYYkZmUmhEaVRhTTNGSHF4dmpha2lsUzhMb2dubEtn?=
 =?utf-8?B?WkQ5K09vTFFKOU41WFpySlhIVHBycEdZYXlONlN6cm1mSDNqSWcrM1lWU0RT?=
 =?utf-8?B?ZjY3dU5NQk5hcjZqbG9sUEE1UjZiWnprM0hZam1QTWZ2bW9uTXF1QjNhblZa?=
 =?utf-8?B?WHd2QUo4VnpsWFBJRkdvdGRQWlhmTklLWDc4aGQzdXhqZXJQaGREVzBJMHYv?=
 =?utf-8?B?UW4rZFVWdU5sMG96QkpmYzBGNDFlSXZJYjIvUG1qWXAzVms0NWJwbW90Q0Fn?=
 =?utf-8?B?blgxY3BUbHZRck1aN2pyRDd3c3V2aWVaY1ZEc0JLcmh2eW15MTNOMUpDZUlh?=
 =?utf-8?B?L0pYb3B5Ulhya09mZS9QSHN5KzZiKy85c2pVTGtXRjQ0VndnMGI0VnVMV1Fi?=
 =?utf-8?B?M21TRTdLN01ObzBYU3JKWmorV2NNZkR1Ly9aMXI1S0NoTXF1Qy9NK3RMZjAx?=
 =?utf-8?B?ekNZNEtBNFNXQzIzK1BpZ0pWTFlSaFA5QllDZVRab3dUOWFXMTF6QjN6VEI1?=
 =?utf-8?B?WUhZbFNpVXNMREcyd25iRXZ1RFF2aEJuRDNZNFdjNEhPVXdQU3M1dkJsNitr?=
 =?utf-8?B?MFlLamNSRStObDBHRXRXdmovQVcxUXltQnhvNm54WWVPNy9ZMG9rQTBzTTQ5?=
 =?utf-8?B?bkpnNVUwL0pKUHlGdVZUSU04RmlzYThJQ081ellVYloyRy9RZFBVWWJXRFpr?=
 =?utf-8?B?ai8xQmJzbjhQa2xaVHIxWloreW1RU2lPSHNmQzR4MVQrNzJaREh0UEJyZWJi?=
 =?utf-8?B?YVFCTDZyOUw2dnZLVldQaHorR2pvakNHZDVKa2dmcCtxNEFBaE04SXJNYkVE?=
 =?utf-8?B?VW04VjNJdjhHY1pTdFVodC9ZcWNINHJsUitMWTZIb3YrQ1pmUHhRZnVLWlht?=
 =?utf-8?B?SklsemNIMm9LVU9jZ0pncnlJd3JRbjJvZHRvOS9RUXNsTm81eVNESTdsY2ZH?=
 =?utf-8?Q?S3xvGx23S2iS6z/S5GntJAl0MuKwYVa2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEVsOWFRMGRUQlhoVHZOMmMrWDI2V0hFbzhqTVdkeVlocDJKR0lFeU94OWlC?=
 =?utf-8?B?a2tjLzRWZGUrRE9SaEczaFFkWlJ1YkdQZkR6U3NUV0J5VjBjZzFVd2JBZ0g5?=
 =?utf-8?B?djdOcmxzL1EyNExQV2luOCs4Z1Q4QXZKV0JPZ1JYQjlIa2hrSm1CY3RsakpT?=
 =?utf-8?B?TVNlSWU4cWN1SlVhUkgrTEdqazE4OXFRT1Z4WFk1STdOK0VqeFJDZEFtYzFL?=
 =?utf-8?B?b1VOemhjRCtZUzdHaVlKK1FQM0JrL3pSR2ZsZVBIa3FjU3R4RTBZbVFpQW9j?=
 =?utf-8?B?N0F5eVo0RnRvbEdDbHdzL3ErQzMrQW1aRG9DeGFaa0JoUXV6RWRhbkJiMCtn?=
 =?utf-8?B?bTN0VDhPdnN2Y3llUjNvbmtNd3p6K0JvMkNpZXVsVjlLYVUvSHhGM2hFVGZj?=
 =?utf-8?B?VWdFTUhCd3VNYWZrSkpEbEhLWGJtMVFkdVk0NWpGQVVid0F1RUlFbUdCSGlI?=
 =?utf-8?B?NVdscC9ISVcyc3gzYlZzeTRyZkQwcERKa3E2N1VocVByZ2VoOWpXdXp5QlNn?=
 =?utf-8?B?Yi94MGlyR2UvU0szZTJHZFo3SFFkRXFyenZBTjZkMTNHSEcva2FTUEVuOFRq?=
 =?utf-8?B?VGlSSXZrUVREbFpPeFFoWmdjMUZIV2UrQXdoTkdsYnZYQzJjcEpGVjZJcVFH?=
 =?utf-8?B?bkxOem1QN3IvMnJjSUx4Y2Z5OFluODFOTHNvbGZrUEM2MnliL0Z0N0k5Z0cz?=
 =?utf-8?B?U2IrUjJWOGhSRVJHdUZhU0hRNzNPWElqQkJJblhWaGpvQTZBVDZmYjNxTHI0?=
 =?utf-8?B?WTRlaXpoWjM3d1RpVVpudTFqSk8zZ1o5eWh3eTd0SVVOejZwcEVrcHVGcVRM?=
 =?utf-8?B?c3VSZTJTOVgrRjFDVmFWaWx1bWxDRjM5czBhVWk0OTdVYjYzRzQ3N093Q1FE?=
 =?utf-8?B?cnF6ZlZ3RGFqeHZXRno1dy9jVnFyWm9iNzBGa1RKQTk2dHAxaER2Ni9ubzN3?=
 =?utf-8?B?aWgvc1dtemlhQ0MrNExBSVFBbktKMWdldHo1ZHlMbTc1Q2V0aEVYcGl2MGhm?=
 =?utf-8?B?TyszeGtKdUxNL0hmMkZ5VkJscE1BMEx6ZVVjZXZxbzl4K0NBaXlxZDZ3MmRP?=
 =?utf-8?B?QXJrSW1Cc0haRTVRWmVFeWIrcXJsUTBwMjJKNkliV3dSTWF3NmZxQmh2dW0w?=
 =?utf-8?B?U24xS0FmSFdPcFhIRElDMUQ3TURqZXUvcUcyUGxoU3JidHI3N1pJNUxENTly?=
 =?utf-8?B?MktiQlp0ZGJ6UlVoR2taVjMwQmdyc0MyNkNKWFZJdVUreU80OU9OZE9OS2Jh?=
 =?utf-8?B?d1d4bWRmTjVoUDlMM1ZDczZZSlhsVVBZbSttMGRTc3NHSFNvTm8zcGpISEY2?=
 =?utf-8?B?bnlDQk10OWYvQkJLaEdzci9yMytLcGthdTVlNklDMXBzckVwb2FiZlN0cnBu?=
 =?utf-8?B?ZEVBSGMxaUo0bEEzbHoyWldCSHppcVNIQ2o3K2EzYzhwYmVSUlNFV3dKZWxj?=
 =?utf-8?B?Z3J4aHRjc3dzenNCa1l1S1E2MVlKb1JRUFNJVU4xWUlVS0krRks2YUN4TEtI?=
 =?utf-8?B?NVhWMEZjanlJdUhlZE8zYU1RQm44bFBtK01pR2tzWENuVDkzL0FuNkVJT2RS?=
 =?utf-8?B?Myt3WTU3dHdnRFltVFlmY2NjL2xNaDNxT0F6WWhON3cxWTY2OEhtMmd1enN2?=
 =?utf-8?B?ZVB2dURRZEZnRHA1eFZmUXh4ZzR2Q1NFWnY5bnpzMXU1dU9LejAxL01PaDho?=
 =?utf-8?B?VStQK2krVEtBVzdHUEdWRmpUSTN2R3dCWlk5SWFEK2ZrVFJXQWpwYXRJdFlG?=
 =?utf-8?B?bjFWcDdlUEsvdHVlUU9WU1ZnalNTTWxRRDdDN3c5aHlkaTZ5WEw2QjVQMzdF?=
 =?utf-8?B?T3B0NkkzdGpzVFNYdnlyRmZQTzczbm1NOVI0RXZFVVFTeVM2aXY1UjRMZEJO?=
 =?utf-8?B?eWVsR0dkYWsvSmxySy9weFVKd3RBc0E5N3JQSSttemdjbXZPSVJ0azRGRTVq?=
 =?utf-8?B?UitaYUR2MXdCcjNwdDUzZmhKZi9rQVlaVkJrRGZGemhzK0JKTjF6VndPNmx5?=
 =?utf-8?B?M1ZlWW9NSTVKd3lqc3B2SHJ0RGhnbll5bTF6SEVPNVZpWldTN2NTRDROUVlH?=
 =?utf-8?B?cHc5NFpaUlRFaGJWSWQzbWpOTlAzRFdRZHh6a01QYkxiZlEwL3JpODV5OEtP?=
 =?utf-8?Q?h9WR3X9FDNzyRH2soPXnlo6lT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9299239b-71d6-49f4-ae39-08de171f3c2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:13:27.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tunz3DYAwiOu7uSQU5t5ziSZPIKoO2R5a0bscEBnjQPXCiXFV2Xocp3U2vTSWVNGcfuv7/Pf/hATAEcmnsH3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7026

On Wed, Oct 29, 2025 at 02:34:29PM +0100, Jan Beulich wrote:
> symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
> different sections: Like for all C files, -fdata-sections may be in effect
> there. As a result, besides moving these symbols may then also have
> different amounts of "end" symbols inserted between them. While the
> movement is likely not problematic, the change in table size is - linking
> passes 2 and 3 want no address (and hence no size) changes between them.
> 
> As, at least right now, the "end" symbols are useful only for code, limit
> their emission accordingly. When data symbols are emitted (i.e. when
> LIVEPATCH=y), this obviously also has a positive effect on overall table
> size (I'm seeing almost 600 entries going away in the build I'm looking
> at).
> 
> Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks, this does seem to solve the issue I was seeing with clang +
LLD.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Tested-by: Roger Pau Monné <roger.pau@citrix.com>

With the commit message adjustment that you discussed with Andrew.

Roger.

