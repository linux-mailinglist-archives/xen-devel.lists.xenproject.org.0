Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8C602CE8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 15:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425002.672730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okmc7-0005Lo-JM; Tue, 18 Oct 2022 13:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425002.672730; Tue, 18 Oct 2022 13:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okmc7-0005K1-G9; Tue, 18 Oct 2022 13:26:35 +0000
Received: by outflank-mailman (input) for mailman id 425002;
 Tue, 18 Oct 2022 13:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okmc5-0005Jv-JH
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 13:26:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7acdf0cd-4ee8-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 15:26:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 13:26:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 13:26:28 +0000
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
X-Inumbo-ID: 7acdf0cd-4ee8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+Sm6LI14o3ca8LQb9e+CC9JdTr2lpeW1Tlbr5y3iLlKhfYZegALWr+mblsIb5hwQL56v0+SPyI1ah6ZRKA5ue1SZrJ86BE4bErTC6l51C674YOgjKGbhEcNemHhI6p7jchX31vVh2Up+Bva5SX0uQOctq/6v/X3u2u6X25SRLfNt9Lwj5lmqKmr+RcW221rLTltjmz1AyE8jxZMh62p9RsKRk9KtEbdYZZRZpCStB/VC6AitX5PP/wqGFIEnfPKxXAwfpjOkn6og9Nv+Bt/b+/Yp+K0FpLDxAYgdyhQhCSlk3PgGp4/eVH1CHPBT/BXpdvNsT8jdV54FdvrWp1P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gclX7OTZ/dgr1mtcKCPuoV+U3KTDJR5J0WaTMbJGv7U=;
 b=LYJ8XxkuOmhaIUNUjro+ubJ/S18h5N97iRz/05zakfp2rIXrOltx7ASyKYA7CkmRnVXMarg0kFX3uzIjpd2TXulAUyFBFE4hkA9SOPfK2DZ4yv02Ndg7qHwTcclJdR7SCxz6UoKz1KCebenis6QxeF6at1E7bXRBzxQR653KoLvIZJrs6UemexHCiazhHbRW84yVU9vIdXCFELWYcKPVo/Z4x5QCP7Qq6ZoNEi4K7yfPtrLXqmTNyady7RgK+ek/k+lFYDDXAvMn7Fg46ij3Edqhhph8TV+yhTqez3klIOIgpg1SldsQGrpav6eJaHrj/zbdJcdGKOBpnQTNGO/jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gclX7OTZ/dgr1mtcKCPuoV+U3KTDJR5J0WaTMbJGv7U=;
 b=15oOJ77h7DN/kAvdA7IxfJhH4pWDZf7P1nIuP0K1G1Ub9YJng5TcIaB33SthY/nwuu16nKA8SiAzBT1I1nlpnPi83jRsZ8dLo1C8jJCncty7GFemHu3QiPp+noVsmall5MY8aUqUNLRxnSiNgZQR0yDO65zajQBwX4+KyveEc5JlVbzJ8/r0Mt2eop2vrXsnUDlZveHWHGdLBHCzPO3guB/3LCgHDCtNah2Ny4a9znkiadb1dyYRNL5cExttosFIOivRe3ig9J1jLXCWOzmkvKrRvhDGfO2xqcbAM4IEbysXN7Dq9G7eR0fSNWrsw0SzmAg+jDTPLic5Sogh1eztcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06571c6b-533e-c580-fe4a-dc7d2213a801@suse.com>
Date: Tue, 18 Oct 2022 15:26:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011111708.1272985-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: c73f95e4-e0a0-419b-12bf-08dab10c5d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hf+HRShYsbhMFq+AxUiKuQ2LLLQMnM+CtO7xJbdAWYNfSEWTUu17VJ2X80kN5gTmNcZ86c0SG6AWRUVDFa7wRDbaLftJgy6Z9+GKc01/pNBZhk0Rl/kVgrLtalq5wpoH7jzr6pw2CGpFY546u8yKPD7xQKvVngtlToD2sjEM4sOwbgeA7wNn1BTzj8TkL39b9DVScyH4SfSK5KFZBJMRStTr2w9xzn64GIUZZAipH8Z4wbstduR+qSjSqX4J/BTTW2+YS/6dYmDstxO8uLTqE6Bj3Vc9FwjECGFtHEBqIkbWsRcYTVwsnbUz9X09eRsKeRniSZPAh6bxxL9MdAfcolVucFl3rTFvYSrqFQFy9aqaJs9VP0f6e82SVOkGWkrn+TJiSma+t3AEnyPCXUV1n3R+QYMW+Im5q4/6HSZgF6i89UMPDiv+Zq8hNDWuvkivHVeKWk23VsM80SvKWyRzRZsbT08fGzWVKmEUSKIad0Hn6EXl5fFysyRxh/OPDdfGMv8ZDrez0eYbysh+e/q5LB1BT+vam938IlfPx4Q/R1Zidh5XcqyGd6TRXgzGkR16LIOPVfZVTkU/SE306UAo4bUwP/qLHjfgHP6sWY68sIPm5iytzKvmPV2nJ658MUMi1KKqpY9VUvZLsH5Q6wGEdq+dA700GZRKvMBh6fJrkJhYx9IaEV6LiPENuWW4NaLyYYjD+T11ClfxlAGd2D5vaQNYEniiKfZw+irjn8Y7zgGaqpxQdvhEvAdRgcfn445IaL5T8qnHr0ifS11pepv+kp2cGTL1oi/UUXz7we6TpqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(26005)(41300700001)(186003)(6512007)(478600001)(2616005)(36756003)(2906002)(6506007)(86362001)(5660300002)(4326008)(53546011)(8936002)(31696002)(38100700002)(54906003)(6916009)(316002)(6486002)(8676002)(83380400001)(66946007)(66556008)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDBLS2NoY29CVStoVnpKVk1IamNrYXFVaElNNXdaZE51RmZMa3dkT2JqelJT?=
 =?utf-8?B?b2FuOVh6TUxUU05kMkJlRTZLTzdpTjFsUnlRREE3dWw0MUtyVHUvNHpPMmg3?=
 =?utf-8?B?dmpoSDVOMFIvWDZuRFp6Y3lIOVBYdGpZNGZNcFQreVljQjRzNjZKQzBUdEdK?=
 =?utf-8?B?VC9YTmpaNDNTZ0VpSEVxZmpYamtZL2xJZXhOMzgwNWMwQjJ1YlBsQndNNzY4?=
 =?utf-8?B?OGdoN3YrRjF3cjk4RnZKNE5FNlp2THFSdUZLU05tMUFWdStGR0FCcFNZNllx?=
 =?utf-8?B?eFUxcGZYck1MZm5aOVZkcHYxUnU5c1NpSDQzbEdTM0o3Y1hrSXBzSmNuWDlK?=
 =?utf-8?B?VEZWNjU2eTN4MmlrMmhCWVdqaTNGYVhmeDBtbHp3TmtvOVY1SWhsNWl3WjV6?=
 =?utf-8?B?T1JPVTFScC9ad1d1WkxDSVovY2NiWFBPUzFYUkFDOStjcmVUQUhmUmV3QXhr?=
 =?utf-8?B?SFUwbWdIaGxjY0NVcmNCYXMvc285MDhRYVgwRlkxTUgxR2RDc0J3a05NcWR3?=
 =?utf-8?B?UTZ2UmkvYW9QZTBOUk5mVkN0N0plOStjbTVSb2ViZms4QzhuT2pEVC9kREJC?=
 =?utf-8?B?VUJ3OGdFdmowL0FTM1lXckNjVVI4MHRmcG56anNqdCtoOFNMVHIwOE9TVjZw?=
 =?utf-8?B?N1FWVWpCVFVwNTRsd3hxZUJSK1lRNkUxRy9LZk5HWUdFK3V2NkxZVmlBRmhM?=
 =?utf-8?B?VjRTOTVjeGdwSDI1YzlsTHRNc2U0NStnQWZnNFcrQXpGWUxSZlgwNjRkbWlQ?=
 =?utf-8?B?dUhXcVRFcjA5eFY3eTNCUGtta1U1S2VuanMycXNaQUZXK2IrSjdnTVFtQTA5?=
 =?utf-8?B?L3gxMG9EWHVJWDBGalZuaS9MLzZ0cTNmK3lUNlZPTmtHUUpkc01XaHMxRTVP?=
 =?utf-8?B?VU1UOFl5K25nc0ZrTlhYWDhaOG9JenlpdG5qVFRsWjgwU1MrQWNNQ3NZSmhS?=
 =?utf-8?B?dFlsYnJLdTZKWnJ4V055NlRnUG1FRDNpQkhPU1BPLzI4c05TMEMxaTdSV2tW?=
 =?utf-8?B?YVZFU3J2U2R3YU5IaE1ES0xYaHF2RG5EVENNNElGaVBBSmlROVZQVTNBYVpk?=
 =?utf-8?B?SnVsSjVqZkVxZ1gwTUV6T1BPL0lDRVE3dW8vK3RxejViSkorVGk3SjJ0WkFp?=
 =?utf-8?B?MjZHQU5KcDNRMjFwdU1JZExWT013WklMYVlFc1EwWnFSeVVZdStoRVpvRVQx?=
 =?utf-8?B?MDVucE5HQ2tzUkZQK3pGUTlzN2pHUG1VSUJUR2pKTExkcEVSLzlQMmg4VGxB?=
 =?utf-8?B?eHlIK0xCT0M4OGEyOUlNYzFqeVNOOFNKcTJzSnIxbldVckVnTTdzeFQ1Y2cz?=
 =?utf-8?B?Q0JHNGdlMXh5ZUl4ZjJuL1B2Ri9uOHh5eGNYUVJ0YmlCMDU3aWM1SU9pQ0Qw?=
 =?utf-8?B?ZEdTbUxxcDhiYU1DbURldjBIY2FtNXUxb21tL1kvUHMrRE01NjBxU1YrakpP?=
 =?utf-8?B?c09tWHFseC9idHFGWkdMclNNWXJRdGhNV0xKTkY0UDhFY2M5ZkVEVkRBL01N?=
 =?utf-8?B?QzBERkNCNnpMbGNlL1h4L09NMDU5dnJTNWVqd0RQZEM4S1g1ZWNxL0t1bHBW?=
 =?utf-8?B?ZXJUWkZXZG5kd0oyVEo2YXh1S3hCcHpFc3h5U05rS0NmMzZ3ZU1BQmRDMXV1?=
 =?utf-8?B?TGc4Zzd6OWs0Z0lMTzdOOUQ1VjFHY1JCTDdJSGpHa3ErR1hHcVFabUpkZGFX?=
 =?utf-8?B?OGNLakFEalo2dHRPenYrVWdnMWNvS2RIcXNISnFnOUFXR3c2NEV5Y241Qlg2?=
 =?utf-8?B?bjhqY01VZjBJajBQL20wQXBKYkQ4TVFBdlVLYTVKV3JFbFdqMlpvNy91SEln?=
 =?utf-8?B?dDhqUHY3VnRoc2RiUFFMdEN4clBhdndLczgwVmlFSnYrOUZEN3o4Tnp0a081?=
 =?utf-8?B?T1JiUkhvSHQ4U0VVTWdmYjZCNldUZUNrcVRVR3E0YTdEdzkzb25jNjRwSzV1?=
 =?utf-8?B?Vk5iRjRCamdWMUYwS2o4T2pFVmk3VWhWclJZanZvL1NUV3FxSWNjWnJkZ2FN?=
 =?utf-8?B?SThNckVnbVc0bHlzc3E1Smp6dFI3WDNvLzBkcnlzWWg0bzEzQUNISWNWZnlw?=
 =?utf-8?B?ZXozaEM5ckxsRW44bGNxdnZ0N01hYmJiN01hSWVoaHFxWCtVMVJvUzdQdTNj?=
 =?utf-8?Q?w/gywqoY5IyGB0MuSKP7+gv4Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73f95e4-e0a0-419b-12bf-08dab10c5d01
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 13:26:28.6140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKJxcMllkpxslhWWnqVgoQdqHtIhbakS+gipfVQhBzZX8SH6cde8Y9CM6b7VS1MG6ydanei1U6yUs+OdpAEjqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

On 11.10.2022 13:17, Wei Chen wrote:
> acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
> Other NUMA implementation may not need this switch. But this switch is
> not only used by ACPI code, it is also used directly in some general
> NUMA logic code. So far this hasn't caused any problem because Xen only
> has x86 implementing ACPI NUMA, but now Arm is implementing device tree
> based NUMA. Accesssing acpi_numa directly in some functions will be a
> block of reusing NUMA common code. It is also difficult for us to replace
> it with a new generic switch, because it is hard to prove that the new
> switch states can guarantee the original code will work correctly.
> 
> So in this patch, we provide two helpers for common code to update and
> get states of acpi_numa. And other new NUMA implementations just need
> to provide the same helpers for common code. In this case, the generic
> NUMA logic code can be reused by all NUMA implementations.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



