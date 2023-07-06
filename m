Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B7749718
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559753.875038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHK1k-0000WQ-FH; Thu, 06 Jul 2023 08:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559753.875038; Thu, 06 Jul 2023 08:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHK1k-0000UX-BY; Thu, 06 Jul 2023 08:07:48 +0000
Received: by outflank-mailman (input) for mailman id 559753;
 Thu, 06 Jul 2023 08:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHK1j-0008Qm-0d
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:07:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30436f51-1bd4-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 10:07:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7696.eurprd04.prod.outlook.com (2603:10a6:102:f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:07:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:07:43 +0000
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
X-Inumbo-ID: 30436f51-1bd4-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiWkJ536bqj5oN3/lG0/t54Z4hBP+yHy4IWOIL6H/pC/f8B/tE/+9cRNeNW2yh31LgOXwqZXmG6TiJGi9ute1WfXTvIXNAD9AnuBM1tZCFhy9nb2pL3mfp/48ip3dKV4yhucxrRc4/o97VkwOFA/LCukX3rqLVKF0t4U4UT/nIdez5hdOHcxn1nxDx9Pg3hALAN8fTGc3qozkaAfQOl92UGh6ASJw6vZUO3SkWd4+2uW5aIRuMoVEVefh4bQoHO8KjRA93oJCF0XrtpL0PJiVZ4WfdMX50/yPJgSFbx0QYwlGwFUpGjN/5KfAnMg/MsSbJ+u83f7BevTHFGrPBzIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFZoEIrQU47U0K+QZ8IYQiWuvPurugmP0N4JzpVB1w4=;
 b=nLSnzDlQtvaRPBDnWEcnzzm1M5RoJcqii/XxI3qmdqSmajsFpWhxX5m+1aICBYs+GdsfJhLDGKYzP4OIuD/p05SXBmBpVMiUhsqGTe4q5Xk55hdpWbuw/90xzE7rfwsNSFXgYOrYDjtfOGs67n7WVG0ng4EjU4xLKr8Je7iOlrHrKApcLSxNEcht5rX5mY1PjdZ/mFEbmCJTTlPnIURkD/MR+mXXJj5BBhVR4VectIsALLJ162fdeifYvcezMhoBc1/a8Mvsa23hDiO+V3ulvvpcZJ2wGgFbAqTvwwTbKkozz2rs5y1YirUHyKa3rme9DyJbO21QRao8mvC8DvVF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFZoEIrQU47U0K+QZ8IYQiWuvPurugmP0N4JzpVB1w4=;
 b=dLIbJs6e+XRBuslkahpy4zazHPFB3p1h3xNWYT7kcJiT7YLv9e6qnw9NvtsN8fuCI8GiPqEAgrDFtV60JI+LnrFJIbJcH5bxaktzxaDqfBVtsMIhrHfG4D9n339/LdLsY5iqLG9XtT4usLvYEDaMHthECyO56X17camQ01KjZDEn7LEFAgeUvyqgiZhigccLKXUjgHY+YLy0XqlkUlkULKcW+mPVj6gSUroN4JqS79fPDufAXsA1yk9ixJY2VDB/VluHNHR0pS5JieIq+jjgf2OZK9waJ1nk/xUOXc6H08AB/TlDNwVTyCjzoJKyP9B//j3V1061NziLFnXRHga3Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32017fef-dc47-0c8e-f51d-f3c1de5deede@suse.com>
Date: Thu, 6 Jul 2023 10:07:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 11/13] xen/vpci: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <4b4fad089f8fc85db19b33524ea6b14b1aef7cbb.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b4fad089f8fc85db19b33524ea6b14b1aef7cbb.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: d630b9f2-7e0c-4c91-403c-08db7df8136e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sMhQwF96Y24lZtNZeFvamv2xpo255DkfABw6g8LgEyVFkl4jlSdYq3+78t7clPUkXKT2mcA5dsdiHE8RawSZgdFmlSyy9m0FETRh+KZVQGnL0Lv5cZrGeTFs4+UBdqjCqCoPG9tIbXv7t+9pxXBz6Yc0F7NSvnijISW40fLMxIfLAokkk8HU1IbaQ4CYUsId8k17EF8jxFX81TlgEwipTpR3KlapzUSEVM0gnDCuSH7CSJebmwHRN6V/MToaIpwUAV3VkrLQgb1S7NHVieEJFpdNbshiSJmcggdW9WaP60Ar2vVYC/tKSlYUwyogFjdLeSww9q7aWqoc7i5HX9n4Sa0MozNrnc+/Z/zjEeUmOoTtEnwJPCe71EHNkH+K+qFak3XhdLxefOFasZ6ocDupJqmOMP6NoWO/3d82Tk1Ei3c4xIG3qunCG2KXYDch110JNwBpV5V/xHKRFrMdE5ahOZZBId36GWnd1Fi1lmbFrWz6uHufyepf0v4+Y+GS4ZV6aRzRbiYpGnSsrOxdYZA1sUVXGcqVCgZCVaa/v8P3SRWqwwLzKbQmXAgC0jxpuYqagYvKqAh8gnWDYISJn9pm1Ogo25InTfIhGMbgxH+CxeHj/5Kmcewq9xvMBdS3SMr2juOKAB4gUg/ChF++zEOyWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(38100700002)(478600001)(6486002)(54906003)(26005)(53546011)(186003)(6506007)(2906002)(66946007)(4744005)(6512007)(6916009)(41300700001)(66476007)(66556008)(316002)(5660300002)(8936002)(8676002)(4326008)(36756003)(86362001)(83380400001)(2616005)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWg1U2Z3aTFiRVZjRDNaOEpQTHpDSlRPUmhodWtoYXlzckZpNXZiandOK2c0?=
 =?utf-8?B?Zm8vU1VwcEp4SFZLeFhIMHd1R2JrbFNGR001dnBuWFdEZWhaTEZETjVyU0Mx?=
 =?utf-8?B?S0xWQUNLQWpIWEM4U1RUVGU2OUNIbnEyM1RhSGxDb0dSZzNRQVVnKzNrSTMr?=
 =?utf-8?B?SjJXc2FSdnFRL3lhQTlzZzVrMndrT1FGMmczTVpPZmxIb2Q0bzB6R0x5bEkr?=
 =?utf-8?B?dFlzR0RuQnk5WEdCVCtiYjJ3SkdPdEE2WEhhZlk0MGlVMWhOK0N6cCtVd0t5?=
 =?utf-8?B?TGVPeUZmRktGb0lqZG5rT21udHZGSmNrTEIvOGVzdDJ5YW1zVW9tNWxkWjQ1?=
 =?utf-8?B?U2RaamUwWFhPWGhLdGgzb1Q3L0U0bFMvWHFhanFhN09RdVpuc1V5ck1hbU5v?=
 =?utf-8?B?dkJFbmlPYWZMWGFTai9peTNSMzlLamQ4cnExdnVtamdKZ1lIWVZRMHc0blMy?=
 =?utf-8?B?U2Job2lxWExLb0hjajNvYUZpYnk0amdOWnZiNWZ0OThNRTZDdHFrM3ZvQTNC?=
 =?utf-8?B?Q2ZwR1BUOStTbU9lUThLdkY4TUxUcG1kNFFmMXVnRXhRTFFNS0h4OVZwWTl6?=
 =?utf-8?B?aklSWVl6RTB4ZkI5ajROcXJZR3MxMVlqb0lnTTcwSlRnZVRVakFka1JPdmdv?=
 =?utf-8?B?TDhMcFNJSTZwZjZOOHdZM1VwNUFkRWJndTJRUDZMdkNjdG1LWVRJWFloWHZG?=
 =?utf-8?B?VjVUaENtMm50K2V5VmFqek5oaEZBVUpMMWV3Ri94RnNZdVp3amxnSEZ0OUN3?=
 =?utf-8?B?NWxxQzd2dFprUkRHTkdCMFlRVlYrdG1xZ3lRSkx6SWU0T3NOUFk4RDArWS92?=
 =?utf-8?B?R1pKUGJCVmRNbHRJaFV6Y08zTlB0R0JzYXVldHU2Ti9TbVhaWlpxVXY5MWlv?=
 =?utf-8?B?NWRodlkyampvaHZ2RDEzbHYrc2R4citITHZONFU4b2p2T0NBc0ZjSXlvT3ZO?=
 =?utf-8?B?M2g2ajlYU01tOStBcWhYMkxpVEhackVQbm4vdGdlMHF4TnRmbHpud2ZHd3VS?=
 =?utf-8?B?RHpnUE95TEUwLzF4YlRhVDg5TEpoeDJjaGV2dHEwc2JhelN5NktlOEpBdjU1?=
 =?utf-8?B?eFJ0N0Iwb0ZoZzl5b3ZKTTlXWlZrM2duWFgzM2x5S292Q2djaEphRFVBdnpM?=
 =?utf-8?B?ejNUckkwK1RjMzIyL09sR3pxOVNiZFdJOEtwb2NNZmtYRUwybmN5aTByeTZ0?=
 =?utf-8?B?MkRnR1RBcEpYU2hXdjlvQWYxM0xPSG5BUnNVUktTVDB3Z292TCtDa2FlQkx4?=
 =?utf-8?B?U1pXVGlobGNMUXdwN245c05KNUNtV0pHRzhtSGJkMTNIdlpIUXZxZkhCYW9R?=
 =?utf-8?B?MHVZQW5qbG5BUkYreFJxNUNaeXZiKzI4RW14c21UcXQxVzZWTmdLZFp6ZEF2?=
 =?utf-8?B?VVYrTGV1VFVtTERMRUtJZEFOZzdad2paOG02NGF5OHNWY3FBWVpETUU0OW1Q?=
 =?utf-8?B?elhUaWtFSWczQ3FMMjNWWE1kZ3ZuZ3JXWnZRZXZ6Rkhnb3p0cW13VytPTmtH?=
 =?utf-8?B?ZjU4YzdpcEc3Q0t6V2tyY2drQklROXJDR05xMXVvWVBlSUdLQ2ZIVWNXY0E1?=
 =?utf-8?B?V05tWG9uQm91RUdVUHVYVWlLWE04dUpYV2U3ZGovZlVNclVWWDNMSllCdk5s?=
 =?utf-8?B?YkRWYWNTWElXUXJveWVqWGFMOHJTRGM4eXUyR2tEYWtwUGY4dXdjK29uMFFS?=
 =?utf-8?B?VUl5Qm1UYVF4TWdmTTB2eUhNSHZpYUlvdWZySHZKOWFUS0F6WHhPYUNxdm44?=
 =?utf-8?B?azVGb09pSGhaQ2VJNGEzRHpPdnBTdkRPMGdqcm4veGxDMEpucHJaenVZN29T?=
 =?utf-8?B?UXl4aTVGS3Fjb2hZSXJOQTRKMlBUNnRkQVFVeEFjZDR1SEtTbGNlZ0JCTGR1?=
 =?utf-8?B?RTl5OFl1ZjBSc3RBT2E4QXAyeisva3lRenZuYmhMOHhRZE9aU2ZDdHcxM2dl?=
 =?utf-8?B?em9EUldPS1BsWkYvaU1FRlJxN0N3RkRPb2hvS2VYRHA0NVFPZHkvK3JtTjBL?=
 =?utf-8?B?RkwrQ2NGZXVwQjBHazYyb1czbW5FVVdNcmZGUDZacHdzTEtQTmt5RDA1d1dv?=
 =?utf-8?B?TUNzS0piVTRIT3J0U0J6THZWS3k4T3JwSnNZdEd2NU5NWTBHZzhCQmVWeEZT?=
 =?utf-8?Q?x0NfSEj7JE0quYyyRAf2uXcMh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d630b9f2-7e0c-4c91-403c-08db7df8136e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:07:43.5713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1wkLf3PHKkpDY/ll2iaEVvc0A4hEnVPz1GhiLNKABEgxVcLUUpEgyQP6jgNJ5R+eCpkZ7Gc2wEDN/JGHaVowA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7696

On 05.07.2023 17:26, Simone Ballarin wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -124,7 +124,7 @@ static void cf_check address_hi_write(
>      struct vpci_msi *msi = data;
>  
>      /* Clear and update high part. */
> -    msi->address &= 0xffffffff;
> +    msi->address &= 0xffffffffU;
>      msi->address |= (uint64_t)val << 32;

Along the lines of the comment to an earlier patch and considering that
a cast to uint64_t is already present here, I again wonder whether
switching to casting to uint32_t wouldn't be the better change.

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -531,7 +531,7 @@ static int cf_check msix_write(
>  
>      case PCI_MSIX_ENTRY_UPPER_ADDR_OFFSET:
>          entry->updated = true;
> -        entry->addr &= 0xffffffff;
> +        entry->addr &= 0xffffffffU;
>          entry->addr |= (uint64_t)data << 32;
>          break;

Same here then.

Jan

