Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A103A652D7B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 08:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467596.726639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ttJ-0007Cx-UP; Wed, 21 Dec 2022 07:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467596.726639; Wed, 21 Dec 2022 07:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ttJ-0007Ax-Qq; Wed, 21 Dec 2022 07:51:53 +0000
Received: by outflank-mailman (input) for mailman id 467596;
 Wed, 21 Dec 2022 07:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ttI-0007Ar-MQ
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 07:51:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54351911-8104-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 08:51:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8836.eurprd04.prod.outlook.com (2603:10a6:20b:42f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 07:51:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 07:51:49 +0000
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
X-Inumbo-ID: 54351911-8104-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek4CYI3L+JZvEzK0DHECvLkbjtSHaVUPgMcyNnSaTO1gYOq/2rh+4VNgWj6WxqQap0bcS3Dui+M6hCu4A4O5Nsu0/CPVoGC9t/R/0UpSLW3lXvc21SvdFhgz2MlIjfFSJPPsY4LrGzoKhAQctFmc1GV3NxAY/gqGx4UWJjIYQhRROth0p/M9mM6rxsMSv8cCSZYtRtXCOer+8otelim9ab6eEGFAedHFJG1/DavtchrsqpVRaF/Fa1jmIaCjDC7yXRalR/qc4qJH8X5AWuB+Og7gwmCQL9wOuRHPtWuqKHSOuC77LHf2NLdZJEQzWEvAHMbNcr+WuwO33a/mgiEY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQq/3iVC2wrZ3RIdjdGxTqD45D3qADRObX10SilQecI=;
 b=dk26cDvAafoIeEeQ1HVChjeXnRhs11gwKbgXNscWfzmBEDay+tE6kc5ebh8Pp5XK+xNl+0f2vQt/tj3TTXNssGGrAqaqzgPbjyx4IiyOYnPvqvoXzpHKN2XRbJdjZTtIdpWbxlkHtN9COk0HFiHWhnL4Ac67f4bqZ190qyUhICiMtLHsrw+izQwS+AxuvUD34U7I06Hc3fGABNs0Ruf1Bz7bGx3k7s5GghYwAkO+4E+f1ZH7ezujADnxroy+qQhr+nx7rSoaYi8sZSG2hfV1GPN5HqyDMEq9Ati0P25cLwmTN6ixzVe1Wo+Ka82gZr6iHEv7isOEGbTHE2AdqdGzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQq/3iVC2wrZ3RIdjdGxTqD45D3qADRObX10SilQecI=;
 b=jFCXjhAiJQcMhFO9aWtwgSuMbskHZfUVvE1xi2Ph70BNJZwlWiXQ9iy23mtJKKkN8v8/TJTiwJJahoMfPA2zHE9GEaajT+qNOjD5rvhDrivFFoVcO2BQFB6wi4C0iMecBhmJeir4Dm/c5XhpAB2DZ7IkgMXtz5xXIZ1qpbbVJrz2C6oxwlMKdRKmuIuak76sVqUxKTKQVBMjNhEhwvUs7dZo36rhRvk9FO9pyesjmmL7aDndK3GdQ5L8rIncX5MPE6JvQCwmydaSYOWNoDimZxYHMrClzgzCY5iulSc1THKHUIH0jbTtwiBRvwBcl30W63ZbtkE3d11IDd3NtkSbQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79748e9b-c2c4-a8bf-f7b5-3405debb3c00@suse.com>
Date: Wed, 21 Dec 2022 08:51:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c5582c-d547-402b-fca8-08dae328377e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5HxtrBtcoA/pZPpBPHjGfRA0M3P+mNYeQkLlyJj21laY56QFKlCn/CHCRsacr7KcvVrbwa+qyVRY3M3AKUpsPwLp8vKEY3iPFPcS0GVWKiOy/TIFZ5ilbLQzSwXnby64mIDpcpGpLxbWBwrLUAnze9mZVrfVWhlbQOmSjxDcbasZqiOL+NH42tM1G2r7c89mh4LRC98hVfoceQ48I4daGu8CKLExCKnIKT2IE36drXeKJ04aLG/5YMvQd08J1lRnoSp0WHH5ie7MxzKdwFMBnKhcvLf467vw785WitsjuR6Bql1PLW6fz5sreV+P+9INObpHEIRkxmZY45JioeiUwkFq3+DW41mNiLkwdnV3oAHWJK2JW+7+ZNBKfGdonvQHz//XfbmMGtx/QE/YrtCc5CmyhN+c3th/tXDojxFpw1K/qBSj6Pidy62227K1s5toaFhyRSuCdVw1zyAP2rIn18Ky2X3XhcP1wobLVparHppHMElIjEFcbgGPz6G6/azH8qaswtLrkb3mcXAHhAObG1zUjAc+mA+IJ3kW2Mwd/r7CvN7Y2EzOlUt1eqLjyEIbgaTc3FxoWNfTlDTz1OaGyFt0lZiwOJlesf/mUcnarvqkYbu/2fJCxILoHIpIDM5B09WQnIboX83BIvUbSDqRJUPDPFa9P18OQwRJli/m1W8wT70gjkU6r9xEwBIkLf67XNo3Rzwox07xnpXNPSk/Nj5+Mj3Fj6dLkqsZlJVD+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(41300700001)(5660300002)(4326008)(316002)(478600001)(54906003)(8676002)(66946007)(6916009)(6486002)(66556008)(2906002)(36756003)(8936002)(38100700002)(66476007)(53546011)(6512007)(6506007)(26005)(186003)(2616005)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFdEeXEvZ3Rzakk3VExHRUVOaGh0b3lDQXZPQkdUclNjanlzRFFYUk5UUy83?=
 =?utf-8?B?SGNjazRXa2ZETDdyMlRleHJPTEdYTUUydUJ3TWpDQW1pRFpBYU0wYWlEU3Iw?=
 =?utf-8?B?b3NUZXNYczVDajJMSXB6WHYxbkkyK3Y2QmwwTTY5VXpIYUNnRlNPSEFicDFI?=
 =?utf-8?B?M0NlREJ3SVZZclByTXFxUjhYdmJaTGFBdnFOenZja3N4czNnMWxjTEtNTWdT?=
 =?utf-8?B?RTdDKzNZd2c4cGprMm0rTGR1SW1hdWlTVVRuMm5jeUdUejk0eGlnS0xvZitz?=
 =?utf-8?B?WVlmaHF6ZkYxcmNoZzFyM0VIZ1FzMEc3YVdMTzYrK0JrallSVk1MSWllMzFh?=
 =?utf-8?B?TmR5MWJmNG4xTWFtSy80N2FETTNJZHUzcmMvZWRLOXBCYzlJTVI3MTJ6VXpq?=
 =?utf-8?B?MjJkQ2s1aDhKbWhyZjFVQnBEYTVod1RCWnFpS3BiV2M1eVZoZkdEdWk3YXNa?=
 =?utf-8?B?RGwrT0pMdm9Da0hFOG0vb2h0YzVVN0U5WFdLSURLNFJIYzF1M3JiNUZBWUl5?=
 =?utf-8?B?SlNJWTFVeFBzU21hQmtIeGtSSTFxMGNOOW5RK2lab0d1aU00MElBU2krZWFL?=
 =?utf-8?B?WVlQQnNHcWtLSG5oakFWalNPOXRxZTRjcEJLWnNyeUovOFd1NVVjUUtpMmsy?=
 =?utf-8?B?RmE5NHRyRndaRnFyam1aTXlkUnFVMlBiVU5jMzhiZjYvdjVQSzdQQzgvc2ho?=
 =?utf-8?B?SzdFcjB6WWhiNDRVc2I2YWdZZ21SUHc1YktaUmNQTWlVekcxck1MOXVXbjJU?=
 =?utf-8?B?NDNDeGlOS0x2czViSFVlODZjRWt5N09YUjlYY3NPMVg5R0tsNVNYbHRTT1Az?=
 =?utf-8?B?cmYwNE1ndWRNUVNjZ091NG01UlR3dWphRHIvVGZ3ZGFVSzFpMzA3ZWRjQkhC?=
 =?utf-8?B?QzZvR1MwTWdrUTJhcXJDR3ZYaHBFUzNya0xUazlsMWFJb2hnQUY0VytocFhz?=
 =?utf-8?B?Q09HOTNsK0FsQlZPdlNXaTl0OUFzWUpKRUs5SXRDKzJndVhsOUVkVXFDRW10?=
 =?utf-8?B?MnpTVFlPTXRyYlFVZkNrMU42K1k0T2tRbkJzWHFwd2VKN0Z3a1FYN1JmR1lI?=
 =?utf-8?B?QjhNSkUxaFExa2c0M3pyWmkrc1BXSldPdWY4cE1yc2FKU1dXSkxHQkRzNGlp?=
 =?utf-8?B?cnlmNEtVSjJBMjI5QXhnRytpMFBHbm4wT1FPRXFkeEJydm1Fc0pOTGNWYXJR?=
 =?utf-8?B?eE9uaEZmWmJkMW1Fdjh3MjlTWjVpS2ZvYXR0TWEwVERSOEkrVjRoTS85Z3dx?=
 =?utf-8?B?OHZQUUVaQ054eDBOZy9jOTB5YjlTNFZhM0RJMGpNdFMxMUw5Zmh2dHBqd094?=
 =?utf-8?B?VmRwbXIwZW5PWitEbWY5NkpjSUtxQSsrUDJ3ODJheXBhR2ZtWGlmSnE0TSsv?=
 =?utf-8?B?aDdzWktPWm04ckVkNlR2RzNzZy9GaVRYazlCdVdPTGdjYklFM1VKSlZMeWJm?=
 =?utf-8?B?RFQ4dU5DTlh5dVdxQ1NQcHA1UXRCb2Y5ZWdPQ0g2RGE4NllGaUF3VnVONDNK?=
 =?utf-8?B?bFV6MlJacTZtcHFrSjhiVURoYVV5VmtSa25uOGJnOE9XejJKK1NoMkphbkRC?=
 =?utf-8?B?Nk12T0pmMWdVc212Y25DZ3pxVDRpY2YzZkwxMjJWdWJSS1pnTVNkMXM4MU5G?=
 =?utf-8?B?dzN5U0FRWFlsYUh1dnljSDhmUzJ2RFVIdzN4TlpXN1JHUVkzL2Y1dzcwcHJY?=
 =?utf-8?B?KzBPOXoxcE1aaTF5bGhxbE9leFdITVZ3QmhpSDUreHJRRGFLOTEwY3kwR0dN?=
 =?utf-8?B?T3lxdG9WMnlsWG53ckhMOGRJMGtXcTFLejdyTCtMMi94UVU3bFVlVXFndkg4?=
 =?utf-8?B?VVhXU1hvU21xYW5nQWczS1dlT1lhZmRBSGtGRTYvd3dURkN5SjhXYTJZam5H?=
 =?utf-8?B?dk5rd2dLbUM1QmtEM0hQMVdsOE5QblRTRk9oazZaT0I0SEhXM3lwUzg4Y3Rx?=
 =?utf-8?B?TzVWR01nTXZ3MEZieXBzNkxNNlhvZzZpNHNGZmZCZTBLZ1NxZDQ4eVVwNUVW?=
 =?utf-8?B?ZG5oTDR2US8vQXRjSWU0SnpSaDBGNHRZSXR2RkRGUWZ5eHEreHZSZWFreFcv?=
 =?utf-8?B?YTRoZjR0ZzJkNFFNbFVLeXBFT3BDTUNabllPS0h0cko4QnU5ZkJNRXpNU0or?=
 =?utf-8?Q?yt2IYJCVdMIFlTgjo97E2qV+p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c5582c-d547-402b-fca8-08dae328377e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 07:51:49.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGXwz4o62Xaq/9IlFn2zlNiPlW1mJp3wiRbYjAL0DmMWBYualFqDYwSVVm9RsSpUsg7UYtKhNYbx8v+lZP58tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8836

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -37,6 +37,22 @@ config IPMMU_VMSA
>  
>  endif
>  
> +config AMD_IOMMU
> +	bool "AMD IOMMU"
> +	depends on X86
> +	default y
> +	---help---
> +	  Enables I/O virtualization on platforms that implement the
> +	  AMD I/O Virtualization Technology (IOMMU).
> +
> +config INTEL_VTD
> +	bool "Intel VT-d"
> +	depends on X86
> +	default y
> +	---help---
> +	  Enables I/O virtualization on platforms that implement the
> +	  Intel Virtualization Technology for Directed I/O (Intel VT-d).

One more thing Andrew and I have been talking about: As he has mentioned
elsewhere, IOMMU support is needed to boot systems with more than 254
CPUs (depending on APIC ID layout the boundary may actually be lower).
Hence it needs to at least be considered to make the prompts here (to
be precise: in the much later patch adding the prompts) dependent on
EXPERT, to prevent people from unknowingly building a non-functioning
(on some systems) hypervisor.

Jan

