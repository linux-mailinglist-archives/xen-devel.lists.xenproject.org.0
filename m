Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CF5972C1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389045.625851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKoW-0006yx-AH; Wed, 17 Aug 2022 15:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389045.625851; Wed, 17 Aug 2022 15:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKoW-0006wn-7U; Wed, 17 Aug 2022 15:18:36 +0000
Received: by outflank-mailman (input) for mailman id 389045;
 Wed, 17 Aug 2022 15:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOKoU-0006wh-Mx
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:18:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db1e10b5-1e3f-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 17:18:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Wed, 17 Aug
 2022 15:18:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 15:18:30 +0000
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
X-Inumbo-ID: db1e10b5-1e3f-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImrocgJUzSIeFd4dlqzR43Hzp6OIbaPrwVDp6dqRJGJOEhSybr1TBiDaD4j4P6e9CRp8PKTUSdxcP8CQCdopSGzE2uE4JkgSonEWubo/5P+d+oE5CdO2rvqWHe9OvFjnqytmHg1919h72mFdAQFRA8JrAIPVBO5jnIxgXrTroAnW2XDNZc9Z5PDAxbeUUBtLbQP7DqH4bwqkljL0SE9s+T1Qq1Y88WitebJZT1gz9It/tdYrLUTpzCwdgCyRZxIje2MLWd2Nb9UYPhfoCS9J18FgUx4omVSr+C5+rnYIh4uFWIEnIGeIF9fGx/of2jWb9QajnbaJkaY2xJJeyH15zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H8B85pjagi9TloYkOc0XJgGulASfPaJF0sC9dO9eqc=;
 b=j0PN6/yi+AH48yEoBxHvednPFpc42ofWK27ipaH2sjfQULzsPTAA9EQCA6n7mkboWqrHxODr4UEdSX11pBV1lrlDPNvHSSvjfRq3CU6B6WUHMzNPPHo/ywt76tPb0YyLV5Ddke5u2klSpMrJqPNfAEuPUe6M9UWBHjPZTP4v+KxsrTObxoxt4GZYmf/5NRJC/R0My6Fg3uNbVUFLCpZvQOlCLoAnK01QgLuR3kzJrE/439YfcWChEAohDd0CdME9xc6RxOQ9bJEfipZo4dd5bdNkEwff4R4jHffUQmQwYKsre5UZdT0/0QoHSKISMPWcGAhHpK0AXY7OU7T9EuRVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H8B85pjagi9TloYkOc0XJgGulASfPaJF0sC9dO9eqc=;
 b=qMi+C6n6vbcnnOgtjCAHrb+/wRgk17OH6t2EmcAmjOescW+5pubNN2+ygbRHuvXeSDh3c7MuDcPtHyJemG0d58aSYFrCUO1ecphZbZS91Brhkaou8SphCQ90VDyAmDmnh4Leq+uSK61ayd/MkWqa+PQuPGOeoajVsGzTZxVy3wHXH5LMN6iDY9Yv2Do3FecOGejx3CZX2hLxBWDGvu0kGsff+EigfvgJCdhTADiH1V4c6VU5mtIJ4UgEmzCsI+gS5BPuGgRAgVG2I4JiTpNLL0gu1qQSOooAGdZErT954pAvpDFKrxvjbYoMGG3OYxLT83ch6tbYi2kS8UdL+ho3kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <114e88d3-0ec6-d51f-af41-555f79403b29@suse.com>
Date: Wed, 17 Aug 2022 17:18:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1660746990.git.rahul.singh@arm.com>
 <26fe963007e0a43b8fefd915027e90ddace1be73.1660746990.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26fe963007e0a43b8fefd915027e90ddace1be73.1660746990.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f43c43-ed0e-4d66-6b1d-08da8063be3d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6XimmC5KqYuBKKqR1YG2fc1TVLzERayn43xQ5YCv+xmgfjpiPl6xF1ZxbdahRYfzpAUkGpnUVdGyBq4J8a1ScsOFyQ9ybVH+wQpiX0yvpdWVGK7sFdj94/9lZ/XugtOr+HwukEILYv+1W9QQ/fz3yPFmMmSPB2ewO8lThZU1dexkQhPxv4Yj64Z4QNqDN5YL/mnlYHImKCLq/f/zob6Sl04XluMi552b3F8WzK1fYocXupliwwCIcs+FagFNsU3fi6CtyDglL+XEBARrotnVIH5zL3XczAjp4U7DBOyFOQg1IplH5eKbfe87f7g2iADL48NMhECYrQwgnqbUqvLSb1N7HlGhb+ASC4yacg87twZkLPfHJlSKspIGX6durV9NSERXozkVSxp9CbcEwxHaJessxsmFN6g+US1a6v2pp5VQaibDCGRJAAvWENxLqWXwJnVMm0YNW7mHbu9qW8VvDGS/RfPoTufIsGuv7QZwYlIFHwuJ6WzzHLGfOMJ+1GW0MkYWPE9RLHH+mePBnHiIODD1BXabMcvzl5HEuRhaf3820V77kSwS700/NeegYHIz28xAOKZ7aXxurhGTLdoZgV8SyM5v/HXcgiGXebo3Ilsy1YhwQdDpOmry/jUcBfv381l7VCggaVZo6peE+A5mqQu3D3V79VdUzAiZR6DOBLpJvj6h2J/o9o1/Qo0sufFjwQa0JNAckBO2xrD/DzQoyNV+GdEO2cVAK67y/Yp7omMp3euCptalfctLj6r9/Lfqik9ZTNMojWshqgDY+51HQV1stFo9Bv5c+eZmBpbO2AMjK61AkAnfiU1dSadi0VLf4k7/ZaV2kzmVd4QZsq5iog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(31686004)(8936002)(38100700002)(31696002)(54906003)(66476007)(4326008)(66946007)(66556008)(316002)(86362001)(2906002)(6916009)(8676002)(6512007)(186003)(5660300002)(53546011)(41300700001)(6506007)(7416002)(2616005)(478600001)(6486002)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODdPYk5mZFJhQVdWRURJKzkxSUdNczc1Zk4rcWpTTFVuNVJXRndGRTk0MHMv?=
 =?utf-8?B?MDJ1UmYrUUYwbThRS3FnZW1JeFhYR1Z4TzNib28xVmUrazJFNEJzZmhUM1Vz?=
 =?utf-8?B?QUR1bHhDQ2NhSFc1QVdTL2dGMVhSTWZFYS95T3V5b1psaTk5UE5xT3NhNkFS?=
 =?utf-8?B?ZVV2TElVSDJ4UmZqZ09WTlFKdTUzV1cybzk3cFdXT3d4alFybm5YWnJrOHkw?=
 =?utf-8?B?U3VIQ3M1L09VaGI0ZHhERTNIRHFtRnordHhkYkhZMlE0cVdvUksybW9LcDZi?=
 =?utf-8?B?di9uTHBMNkVkRTNMdWNqUVpYTVM0TjBVU1V5OFVCWnYxbGdGaWoxeEYxRXZG?=
 =?utf-8?B?Q0wyMzNjSGd3eWpmY082T01mUWhrY2MxTVhqUTBJaU1XYVkxWE9OSzh6Z09x?=
 =?utf-8?B?clg0QlZmbU5qOVArVmFIYWZINDdlVExMa3pUTmxZMVU2L3pEYkE2WFI4Zmd6?=
 =?utf-8?B?STNsNHNpTUtSSENZeU51cmRTUEp1Z1VCajIvWGJkZCsvQm93Uzhodmk1OVhN?=
 =?utf-8?B?NERFd2tadUV0QkhKcmIrL3pQVWdSemNjRjhoV2MyUFBGTTFDN2E2TDB6eDIr?=
 =?utf-8?B?bTNBMDNwcGVqMmU1WnJwbjE1K2pYcThuOTZjd2FCUks5Y2cwZ3lyeEhHWXRi?=
 =?utf-8?B?ckJzNUdvbXZPb1NNVGUzeUJEUEhpeWJEUUpXbktraWh2L1JkbUNYQ2ZmcUs5?=
 =?utf-8?B?eWVWSW5zbUFUY0dvQWMvdVZvWDd1SGZqMVNvOVdUK2VnN3BCbGVMK3hkd3Ba?=
 =?utf-8?B?bVYvQ2l6ZG42T0dBdkdhM3IyR05QYno3S1BDeVk1aVhaang4dE81LzVVUXlx?=
 =?utf-8?B?emxQek9oaGs4LzJYQUk1M2oxalhDY01xUjF3bEczQkh2Umg3Y1FWT3M3b0xN?=
 =?utf-8?B?MlVKZ2JlRzZJakExamhUYzh5cFEvdTVYZnN1SjJjclBXdTBJWm4xUDdUSTRM?=
 =?utf-8?B?cWQ1dEJISlhkMFptZ2psbndMRHNjV2F4NHVEN0trVFJyTEpKTSs3SXFFNXJC?=
 =?utf-8?B?aDlubjhKbi95d2xZTHhQaXQ4Uk16SlZYVjVMRlI4dEdFWTBtaENUcXV4SDN5?=
 =?utf-8?B?QUpnMkN4dE84UldxblkwZXh1QjIyTnVoRGgxUlczdUhjeHZlelVPblJGeVhO?=
 =?utf-8?B?b3hQVUkwd3kraE43S1BPNzM4Z2FRT3h3eGxlNjZHQVJFUkM5Q09ZUW12NjBh?=
 =?utf-8?B?MVRaLzN5TVB1VXV6cGFMZEp3QThhSVlWTldvYXlFaTIrRERDYjNnOHNldmRy?=
 =?utf-8?B?MlQ3Qkl5dUgwTEp0cGtEUGl5NHg4clNMOE83VHBvQy93NzNFWUN0QklzVkVF?=
 =?utf-8?B?V1ZCR1hYYmZvZVRmSG1sYk52SDRsSGJyeWFXMzExUGo1anlncU03SzJ3T082?=
 =?utf-8?B?d0xXazhacFdQZmR3UFVnY3hrYjRRbFdNZCsvZk9DK09KRW1ReWVMcUJsNTZU?=
 =?utf-8?B?VktMVnBWNmRtZ3h3d0kxNXVqMDNiclNBT2M5R2UxcEU1Mm5zWDVMa3oxTURC?=
 =?utf-8?B?bHk5aC9aYnQ1eFZ6aDdrRUhTczhYaEYxdWl1bGdKUGdCcU5RZDd6eitoRXFt?=
 =?utf-8?B?aG5UZXl0M2YyV2x5cDdLZUpFL0pqTjZmZUpjSk9JeDE3ZTRuR2Vub1BEbXh3?=
 =?utf-8?B?UlhxamRmaW5GOEdiSGF4b2ZWUkdFdGNhSnhwUzZlNVRtS1d6REMvcGpzcXd3?=
 =?utf-8?B?ZzhUWXp0QkNlUm80aWt3dmdoMDBsODdNcUdtVjFPd09uaEpYQ2FFdHp3VERR?=
 =?utf-8?B?dXFHM0hlRUZpL285cFQxZkhpbUkrN2x6YlJ0U0JZT3lNY2F6RGk1Ry9zS3hI?=
 =?utf-8?B?Qk10WFpsbUZ5Y2Vzb3hiRU9NSUlFckxvdWFwbS9oOHZneWtZY3FCTG8zRVpk?=
 =?utf-8?B?RnNaRTZ3UExwbHo4TGdoUmFqYThCUnp0RldkUVYwREFzL3c2RTNXSjdXRi9h?=
 =?utf-8?B?ZkVkaTRWajFETW5RbnFZcGxES1puK3hEV3Vuby9sTnpoeHl0aHI2dnNwT3pI?=
 =?utf-8?B?azlvc0w4MExoTVoydXpIN0ZpTWhPZXBVU09XWGdHVTQ1RVBzV0dsOHNnTStL?=
 =?utf-8?B?UFlueitjMG9ocWp6NVk2WUViNFNrMVprbWh0V01icEhsZzUweUtFMjFSUFRa?=
 =?utf-8?Q?6gayo+dX/J7xgcU1U/RkJvSjN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f43c43-ed0e-4d66-6b1d-08da8063be3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:18:30.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45b/HPggLBfSvlQCkBwdW78Jm7PwYCzwo7ahsTl17BHzpFHKbWDvzFsq5er2MSnkafcyhKp50lEWyLwRNmvFOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

On 17.08.2022 16:45, Rahul Singh wrote:
> @@ -363,6 +373,42 @@ int __init pci_host_bridge_mappings(struct domain *d)
>      return 0;
>  }
>  
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data)

s/u64/uint64_t/g please.

> +{
> +    struct pdev_bar *bar_data = data;
> +    unsigned long s = mfn_x(bar_data->start);
> +    unsigned long e = mfn_x(bar_data->end);
> +
> +    if ( (s < e) && (s >= PFN_UP(addr)) && (e <= PFN_UP(addr + len - 1)) )

Doesn't this need to be s >= PFN_DOWN(addr)? Or else why is e checked
against PFN_UP()?

> +        bar_data->is_valid =  true;
> +
> +    return 0;
> +}
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    int ret;
> +    const struct dt_device_node *dt_node;
> +    struct pdev_bar bar_data =  {
> +        .start = start,
> +        .end = end,
> +        .is_valid = false
> +    };
> +
> +    dt_node = pci_find_host_bridge_node(pdev);
> +    if ( !dt_node )
> +        return false;
> +
> +    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);

Just as a side note - I find such (the first instance here) uses of the
unary & operator odd. The same effect will be had without it. So all it
does (in my opinion) is make things harder to read (just very slightly,
of course).

> +    if ( ret < 0 )
> +        return false;
> +
> +    if ( !bar_data.is_valid )
> +        return false;
> +
> +    return true;

Simply "return bar_data.is_valid;"?

Jan

