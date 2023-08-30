Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2EC78D7D0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 19:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593208.926164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOoQ-0000fc-El; Wed, 30 Aug 2023 17:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593208.926164; Wed, 30 Aug 2023 17:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOoQ-0000cd-C0; Wed, 30 Aug 2023 17:17:02 +0000
Received: by outflank-mailman (input) for mailman id 593208;
 Wed, 30 Aug 2023 17:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzxB=EP=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbOoP-0000cG-7j
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 17:17:01 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e83::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06f3ddf6-4759-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 19:17:00 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:16:56 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 17:16:56 +0000
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
X-Inumbo-ID: 06f3ddf6-4759-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDYt1dYd2u+ch9Du72uQ0woccapbemsjGXw2RBtk1W8HDiJAwgK35R2w65eaxVmubhULn3JonMvxsseLuLkdo/dVwhRR1BnLi5YsN0vM3/izhO2D7rO7sD53Tw3lSl5egfOq7uPAk5xuPswN9QKV/OxnvuYlAswDKNXQiX4ZhfE4rOWpYwmN7XSan415+DsXBR4ODy0ScQy/WrsMMb8ZyG2niAg5s2qai3NMXBw+5Z8ytoRyPZR67eBgT0AYS8V+VYfbWPZb63DYyvy/685FGmyxXUlHs5LKmcCuIbH8OU08BX9e5N5wgrK4aaHRrY5qL+IQbV4tX+MRGd1ZmlEQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEsr1moD4Y950Qgpf0xjDD1hVT+61TUMJzSqicrDlDE=;
 b=FSg0TrSv/EnZX59RcDCJYkDdvc6TPF8BBo/OijCDjDfEDM4qtZtJ20KlXR8vSO7bIC3YsuMppJLrgWP4LHasfwDnNGAER96QgoBrR8+HZBg0SuhGT2Ionl58IahGhGG+cwnjxulpmTWDsJYLfPSUOh0zcy5Nj92X/Om8Mh6OJFlXJM5oMjBm/YafDYfDTU2Dya4pAMGe14uhreRqjparV4Zzmn5ylfgW0Dn37fi3CQWXbRMFgL3sM1bbFP6jIWzd336HmUIg1ivuCL6Yolp8G1b/3niyuNSToWoBVM67QZKSKtRemypaJGV/CGdptE2qfsLC+x6myEhYkoj8XMxI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEsr1moD4Y950Qgpf0xjDD1hVT+61TUMJzSqicrDlDE=;
 b=w8UhyfCFJ/tc0ya0zQVCnG3696YdUfCVUlAz+JmOq8U/bkC7fxQmvRrH4+F4xSj8eCsJp7M2OaKHXRHh2ss+3sDVRbhm9df0P1NVkw9uwNggi4g6IzQ4enRTzhx7D2uwksVjk/GZ4Mb9SFm96uSKhcdVK9z8RFH1CGwF2SaamVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 30 Aug 2023 10:16:53 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
Message-ID: <ZO95haS13aD6VQpY@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-6-vikram.garhwal@amd.com>
 <68c5a544-0486-d2ac-28d3-1feab2502f2e@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68c5a544-0486-d2ac-28d3-1feab2502f2e@amd.com>
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bd950a-b15e-4cf0-7b19-08dba97ce989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rf7+o92ou1zlyqmC9nsX/+PoL+ECYs8Q80+1Gr32zI1I+QNCz3RjEqk1LZ3UvlLplNg8U6o+3YKoE/UCt2yPkCdH8DC8pdkH3dGZcMm4rlwgrdzcZIIWthPmZeBM/S8JWVr1BHkyymQ4gnSRDxBGYYKu0TzJdvkaI5Q89iALiGcAQ3pW4mx8EX2CbbwHmeQro389Oo8vyXg06SI64Eedd1EdaV4sZdIdfIIyZC69XReaSB/fWPEXp2NxSyZP/I1GQOgmZnyJOoHa9saTaVFDC7DJ/adr+rtQ0JqZqWSli1iC1HV5XsSN0FXgacH/Xl1x9Va0WfsV4xJ3rDHn1JB7XboYcKZApuLCG2ThcfRjKmTZaWcr7KCV275T3fQ2+zLQVSRV1N/p+cROw2N00momCAG/5p7nCmQzYhDVe64nsE1+T87lOjgxzlOWLY084Gs2AUN13UiOEr8IsJ4RJbhjA84bgPf7mKdDlI7lgrC1IMEy7a5UlkXYwEbnl/2RAJ0sqwdNTFgJ8BvwjzGt7+ufD9uD+Ws3nTo1zxJ9G5lUyACjFaY7HEP+D8o1dnYv0xtI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(346002)(396003)(376002)(1800799009)(186009)(451199024)(6506007)(6666004)(6486002)(6512007)(36756003)(86362001)(38100700002)(2616005)(26005)(4744005)(2906002)(53546011)(478600001)(5660300002)(66946007)(6862004)(66556008)(4326008)(41300700001)(8936002)(8676002)(44832011)(83380400001)(7416002)(6636002)(66476007)(37006003)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdOWnlndHJ3TVFCWk9lTFdzU0llMUF0NE1iTlo4WkttQ09QZmp2clNEYUJr?=
 =?utf-8?B?NGYrVTh4TDhncXd4ck9UMzk2VTcyeG9sbTlvR3JzZUxyS1h6NGNCY1YrNE5G?=
 =?utf-8?B?SDZKUXpFT05qa1gwczNVQ2pjMFhldDFKdFQ0ejVEK0tWMXY2RUxjc0d1dmtB?=
 =?utf-8?B?SlhlczhNUXNuNU1GNnF6QllKZ2lnVE5WcXRjVlNoSzhXQlR2bXVZdE5rRms4?=
 =?utf-8?B?alVxTytmQVBjc1kwQVZJa0FBYllBZ0pzcHdvN0p5UkdlK2E1aGJpcjFSSVU5?=
 =?utf-8?B?Q1ltM3dlT2pyS0Zrd2NyVmo2M3pMRjE2TWZHMVpjb21GbmZBWnp2Vll5NkZy?=
 =?utf-8?B?SlVRL1c1WThtVkRjM1Z4bk5pUFRtNW9lSmd2REpjN3JTeGYwcnBHRkpPaU1p?=
 =?utf-8?B?V2xzc2pDeHZ4T2xkWjg2QzBHbVBQZTllZ0xPbEVCUTdoNjd4djVzSzFDWDZr?=
 =?utf-8?B?M0tvRk1WZnlWbG41SlJOZElEZzhkNkJlVWtCL1JCdFRnY1U0NDBCZzBKcGo2?=
 =?utf-8?B?R1phaG9BNHEwZC9ONGEweHpVdGczUjJ5WlpJQUlzM3BhT0dDemgrVFFON0h6?=
 =?utf-8?B?QjdJS2pSWWZWRDM3bndKbnI5OWZTM0gvUk9kbml4SXRTaVlObXQzVkptelhX?=
 =?utf-8?B?eDErTzRtZzZ2T2J6OXUrTkc0bWJlRjQzbmd1bGRySjd4eVhORUtUbkdOL3dY?=
 =?utf-8?B?ZFo1T2FpK0hRbTc2bldWRjdxRzBhSVQyNnh1Qkovc1gyck9zOFh4YncxZFFB?=
 =?utf-8?B?ME9meUNCcFFUREk5RDJGOG9OOGI3RnY0RXgwdGRmbUU5L24ydXkwczdIRFlw?=
 =?utf-8?B?b0RFVGd1a3VYTW14RnBiUHRrQk8wZVYwQXJnQjB3Vno2KzFLeUNmQ29DUmJj?=
 =?utf-8?B?dzV2SHpIUnZaRXZpN0kwQzU4NkZoY3RicEd5NHZJelZHdWVyVUc0QTExQjZ0?=
 =?utf-8?B?bHcyd3lIeE5LNmZKcEprUm5zb1doWTF6YlNHcndFMUk0akNyNTEzbytITXk1?=
 =?utf-8?B?NjJzZTVLcnVMQlZaWGllRXhWeWpmQ1Y1U2pYWDk0V2t1djJXS3l2WmtOY080?=
 =?utf-8?B?RnZobHQzWXBtaTEzRk5sZC8zTHg1bHE3NHVhaWcwa2plQjNvRDJBekxxVlo0?=
 =?utf-8?B?ZjVsY3NXSjd4bTRiSndDNEF0c0lRMU9mdHZOWFVVVzJJbjZUOWdWa29LajE4?=
 =?utf-8?B?cjBULzFXZFZGYi91ODJhOTFNbnVVUEhpMGRzNGZZMGxJRnArRElmVzJDSDh2?=
 =?utf-8?B?dGsybndETlUxSVdwZjB4YkthY1dJV0pKTTNHRHFKZGdqaEVkdmpRSWNiQS9s?=
 =?utf-8?B?cno3QWFSZlRxTzlxNWkyTUlSeFQ2RWR5cHAzTlVIY21QTWlLWlgxRkFTWnVu?=
 =?utf-8?B?UmlYV0I1OUVPU0hhOXhvRzlRaTQ5a25qRzlHV2RqT0VXYWJlbHpvU0dzNFZh?=
 =?utf-8?B?U0FqL0gwZDZWYlBHd2xBT1EyN2x2MWpaOTZvZDFMQ01xQldLVHg3ODRYWDlL?=
 =?utf-8?B?VVJiVWdRQmpudGhIdGFkOHVzZTNXa3laZXdGNThlMXBjYnpnaVlQOWhHYTZR?=
 =?utf-8?B?RTY4SkNab1k0WmFhYjFzV2E5VXozMUErUk4xR1VGSnpkVTlSUVA5WXVJa3JN?=
 =?utf-8?B?MmdPVEhrTWt1ZzhNQmhmRlRBT3JuWGZLdTY1YStPdUM4OWt1Y3hqbWNNdEs2?=
 =?utf-8?B?bFhNbExCTi9lcWNhNXRuVHFIdVExaDJRYStRNFlrcktwaUZjQlNFTk5kMWVN?=
 =?utf-8?B?cFRPeHJXVlo1a0F0K05WWjUzOUJKdGdxT3lVOGVJdGMzRGVxeGd3dVRBbE8x?=
 =?utf-8?B?VnUwRGZHMlBHdFd4UHNxU0U2cTFJWFVJNm4zSUZFQWxWTlJaSVdkWUVmMTN3?=
 =?utf-8?B?S1F2amRWUklFWTB3VWl6VldCVTZjSGlvMWdZYXNkdncwbFY1emN4WlcrMHNH?=
 =?utf-8?B?VWhNM2RxNFZoQ0lqNUJnWlpzNlFRcnpjNGVBMjNQaEM2eUVBK01DU3RQaVRP?=
 =?utf-8?B?T2Y3Q0cyM2JFNkVDOWlDMFNKVTdZUDMyL3VJanFhVGxYU0cwOGZSbXZqTGdh?=
 =?utf-8?B?YjhDL1Q2OUc5SW5zTEtJTFNxRjU1WTAwYXlZUlBIL09yczRlTjBuRWc2a2hy?=
 =?utf-8?Q?R7XYjtCbNWIHExLiCJJuSFVBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bd950a-b15e-4cf0-7b19-08dba97ce989
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:16:56.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9YzKeOeuVO7k5Ur3wt8rmrQnr5hhwSfqACiYpBpxgAMIJeW/8cmz7/zNbKnfLOsfF+nhD603A0uj5+2hQWPbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

On Tue, Aug 29, 2023 at 09:23:55AM +0200, Michal Orzel wrote:
> 
> 
> On 25/08/2023 10:02, Vikram Garhwal wrote:
> > 
> > 
> > Introduce a config option where the user can enable support for adding/removing
> > device tree nodes using a device tree binary overlay.
> > 
> > Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> > Arm.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Acked-by: Henry Wang <Henry.Wang@arm.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > 
> > ---
> > Changes from v9:
> >     Fix style.
> > Changes from v7:
> >     Add this feature as "experimental support" in CHANGELOG.md
> > ---
> > ---
> >  CHANGELOG.md         | 3 ++-
> This patch does not apply cleanly on latest staging so please rebase for v11.
Rebased this for 11.
> 
> ~Michal

