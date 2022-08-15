Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6E592E86
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387332.623527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYe0-0003S3-VJ; Mon, 15 Aug 2022 11:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387332.623527; Mon, 15 Aug 2022 11:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYe0-0003PH-RV; Mon, 15 Aug 2022 11:52:32 +0000
Received: by outflank-mailman (input) for mailman id 387332;
 Mon, 15 Aug 2022 11:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNYdz-0003P9-E6
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:52:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9ff628-1c90-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 13:52:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6103.eurprd04.prod.outlook.com (2603:10a6:20b:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 11:52:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 11:52:27 +0000
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
X-Inumbo-ID: bd9ff628-1c90-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irtu8H+Eqx2pq0fB20iIkcXc3biyitkTOeTMEJI8LuE9QgZ1ec6zGZOwxgA7xxuE1+LQy2GM/f4f11WtPI6eZIVNgbNSzC3YS12UPy90KeQ0v0f/kun/82rCAHE7+g3/YAMPYUg6Kd0T4XML7TFX+FPW4IfV1KrnmUrTqpxlrWUnENq6Q75e9/KNQrBa8e0+oIXuEvhSegN01l9AWb4DlUlZtbpm3w6VgVOMCjF/ZNo3D8nLmNz7nu0I1Btde2B1uFbXEtxTgMhJqEaeQVi0JAfM+jBTnFbbk3fVcPFUAs2k3Uu4gqFsViHXjrBlGKJTERX4y7l2zPwSG2YocL3vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T/K5RSB4gWzuJvP0fFBZhtL9P63/W+kn6XM/TB6dHo=;
 b=Gl4Av4c5wm3LaqXpixrr8Jlz+t0jqF7ooPyD36f9i6nZ5V3N8qz9yP/KhiDlgyCvJmJ99RwdA2ybjQDQR0iWnTWqwU+mYtM4IWHNrlsAZjDIGn2FGFhQZbeP9wRCc94ECtNJSl8s9I7THx3xLNrpIzECaHHUjBgKF8+DdTTY/yRnMgh6ZyCi+ttyp+oO9zM4V/CfuXco4Fr/uicrt1xvUPaKTfZnLefi5y4EnXxScZJttfwsA1EIk2ZVlH8jH4jsaWYCbryvrCgHQ0fKxFnef7Jc1zX2C4nQX0yVob9ycDNQ/0Ko5BtvvWiayAtWYefueRaSOdCxtWivPOdI5WAQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T/K5RSB4gWzuJvP0fFBZhtL9P63/W+kn6XM/TB6dHo=;
 b=IZhcceSWVzkPD4L2WOow7GWaozCUMtArBy88qz+aghARVxNlI/USH0/LZs3+qENewVtsq9lUEbylh5YtScHsxmx9vXqXkP8hda82IJTzqmP0M+5WwtF5v+M2ioTKDArdjM+c3W/AfrTlM0cpm+C+fUr46dOWyG5+5Xz1pyJ8fccn9ubzeY9XFkkdOb3hLcgg7uF+YAQYIJMVFiC+RXwmU9i4Tsw9caWr2/H6a8/nnN+6SADz+c+VN5cJkpLO/pvqx7TGViuSRgHkrz/DFX4jTEvDomXyne/deQWH7elQd27Hlru3+lO3OQOEkJynvs3PmLw2Eleal0i2yWTohlpVrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
Date: Mon, 15 Aug 2022 13:52:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220815110410.19872-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b5b6ebb-c6a4-46a2-63c3-08da7eb4a043
X-MS-TrafficTypeDiagnostic: AM6PR04MB6103:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cJJbALt/DHa6scGxQaMiai+NbXmEBrwr6XrsN3NX0GseS6nhcMkfMyYP04CIWBtcEy6Z04uHyJeao1GR8K1S6cLhhQ8kYBTo2Sg3KUANCZvTx0aaYclmviSs96SnWfL5ifAbJ1y5TViVw1wtJokmwjoSOjjs/NetgSG/NadDFXsVPvTzi1rxz5wXWm8L2eECcerLYeL7nURaLKoxQ5ryIPhoojIFUsoYZ09RaZYuKAru7w7eUux/Zf35jCX74Eip+Z6rJEOeG+DAeL13gsYqsaKisIlM4NMSnCUk+apIYqVwMKUihcAi2n73bfIQ075BLx+InPuU4ktmajuNcTfeJUQlQspKYJCGk54eAF5Ue4opNUZ/Q/bPwjtDa7Xkr6e0hpmr1FA1Yac2YM/Zxa9FOtTYQ1iaZq98iFUZ3k1bqLao9rDcQXvsAPXxKsihmC+0yrMLKt3XHxaDDnC97/GZlTWmI7xSBZOlecDUQFT9LZXuxTT+anLkBMtw7btMz84iF3YDRQy/mFEPWch9rpzhZBG8ZZ/xwFjiFZEODZUvb0jCi1KeMFeHkWQQrnOrGPHiXKa8c4HCiP1biB6+cJP9Ots7qpN0pO+82P3Vm8IqaBn3zRxBo3bg/efKRg0eT/rZOh7jncYTivfw50HVQxwf1dJ7vcnmXUaWKiPM3xS5Z7vmjBGL/kENUpDm7VI+oY4Dk5hYmKFzr1b618eqZHI9t9q0NzTt4Mf9eAJ4xOBRpHsnLVmi+TK/Bh/Fuaum3kNmt5AK0YnAxu5FTb+1NN/jj8Nr2WGtmNughG8PW9IOBmyBBFie6FlvnaDTNyRPf1Tq1PxYw54KaMJEe/ZIfTcwqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(39860400002)(376002)(8936002)(6862004)(41300700001)(5660300002)(54906003)(316002)(6636002)(37006003)(66476007)(31696002)(86362001)(478600001)(66556008)(66946007)(8676002)(4326008)(6486002)(2906002)(53546011)(6512007)(26005)(83380400001)(2616005)(38100700002)(186003)(4744005)(6506007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VMaklpRDFZMythMDErYWFqVGQvbE10SWFzVlVXUVp2aEM2R2FST3dMeHNW?=
 =?utf-8?B?c3l3ZE82MTc2cDN6SUJZQUpxYnFCTEtwQlZWTVlUMDFzeGlmeDNxeVpwbjl2?=
 =?utf-8?B?VE82QzBrbXlVUG9EbHQwMFBUY1pnRW5DWldhN0liYkd4M1BIMWJpUUZMZk1j?=
 =?utf-8?B?VTMzQ1RQT3paQmlSdE9PQ25TVkVVMzkwbS9pUXgrTnBVdFVRUTBXMXBIQ0hy?=
 =?utf-8?B?dnNPZEFzaFRNOXhsVVRYcElGek5aSmpmU0wyYW9SQzJOYzNCVm1XWFc5ZUgx?=
 =?utf-8?B?YW1ocWszV0phV2NxYVR1Y2I3NE8zenZ0b0JRMlk3VlN5ZUZ6Tk04KzdvR3dm?=
 =?utf-8?B?VDBSWHNiT2tYdkNNVEhHazlOaGZHVzlJU0xla2dhWFpGNG1yQzhBa3NYbTFI?=
 =?utf-8?B?MWVjYm1NU24yeDl4YlZtVFNtbG5GYTZXVng5ZmYwQnVoR0svWkZibzFwcVJP?=
 =?utf-8?B?cy9YdnFoN05Velh4SXFpR2Q0N1N3RUZwcUJjRmk5UFVnNVlpWnRFMVpoaWdT?=
 =?utf-8?B?WGhRUUc3cC91MDV2WVFJTmtCZnhoZThuMTVmclBTa3dxTUtyNVpDUC9kZ2JE?=
 =?utf-8?B?VHJGMlRxVHBlZEVpc3BOOU5YWG1hTzNwYXpSOWF5dGhtTENFUWRPejIrVnV3?=
 =?utf-8?B?b0pXNVVqcHhDNUVtdTFVZ0pCVjVjMGlWYllHR2ZTd1dFMFNrMVdvcGJ0RVF4?=
 =?utf-8?B?Zk5sVFFrRWF5TS9zN3ZFMTJSS3daNFcvZVUraDluYVBSRnV1T2VxemRnUHFF?=
 =?utf-8?B?OWZrenN5aTNrWU1UTlRGVHJOZjUxek5hSnU0Q2FGakM5RlVHaWhVTlhnVGJ3?=
 =?utf-8?B?ZTl4Q0pUazFTK2hQKzd2WWhJT21Ob1RSZXFYMG9KcDhPY1lsYXJzSktPRVBN?=
 =?utf-8?B?TU8xN2w1cjZsbjZETDZhTDliSDVDbzBHdWE0dzJCcTlUM2dKemRaMklocWJ4?=
 =?utf-8?B?cjE5aEpkVkFHTnUzNWJob0MrYzR2YmlFMHdtalhOQmdXQXc1aGNSZmNZclps?=
 =?utf-8?B?bmtxdjdkNG9VS0lpR3pIOHNBbDNidEhkbEkrMlZaV2pzNnVTbEUyMzVnMlly?=
 =?utf-8?B?ek5aZDF6RDU1NlUrWkFBaDFvZnZZSGNQQWlab0VvTXNOQzl5VHBQS2FJZGl4?=
 =?utf-8?B?ZktpbW5qa1d3MmVPVUllYUN6a1RqUE5ocFhGOVIxVzQvUkhQaTErWnRpMW56?=
 =?utf-8?B?Ums0dEFtRzJlYmdLVzc0SUtpaG1LMnlKZkI4SVBWUDM0emJkQ3E1dXJyZkVx?=
 =?utf-8?B?dHQ2WHRJam93dVNWM0pkQ2JOaHZvcjUwakxJa0hzQk51SS95Y0xqamhFZmNs?=
 =?utf-8?B?ZWVlOUJ5NTJ6NGxUYkYxUXY4TUVsYy9Ua2hxQm5Ba0J2dDRDS29xZERoOEtl?=
 =?utf-8?B?bGdYaGJyenNGY1o0TkdUaG0rK0o4UVZkMkJCaHNncU5zdURMaXdva0FFQ09B?=
 =?utf-8?B?cUljQVNOVWRRcUR4aDJlSy9rREFZYUYxRjd4akN2Y3M0S2ZDNHNpNitYM0FG?=
 =?utf-8?B?YVVxMEhMblo5bHVCQnpCQjc5MlB2TFdWQW96cTVvdGdpT0RwY2s4TkwxR1B1?=
 =?utf-8?B?emk2VDRZL3M0YXF3c1lsUnlmd05NZytjVG5kN3pDV1NDMzNpNnZGVzJzTTJn?=
 =?utf-8?B?RXZaNjhSYnJ3Ykk1d2Zka1F6RldGS3plNThvZ3k4Y0lqOWlEOEVhN2l0by9B?=
 =?utf-8?B?M24yQWNIWEVkSGxiNmwxL2oxUXRSbEYzNHlmZ1pjRFVydnEydzkvaDhSMysr?=
 =?utf-8?B?VXMrTE9Jak1rVTExU2dJSUMrNTVzaHNrQlZvZzVIQ1hWQlhLVEFFdUx2dFhS?=
 =?utf-8?B?UjZWZEpTTFp2ZktYTEpDRGNmbUl2elE2alBkeERCdmRVOVIybDJOTlY1YU1q?=
 =?utf-8?B?NlJLTGVBeXVNcGtMVW5PNGExYUlrV0dQMkxMUFJZM2loZ2NIUWo3RXVlUVV6?=
 =?utf-8?B?a1BZWXBvc3RJZUVybCtFM2R6UmRDWVNBSjdSNGFGMmVqaDlkeElUSkYxN2I4?=
 =?utf-8?B?bzkzRUk4OUkwUmlTaGhGR0RaL2xaZ2ZieTJHZWxDRlhpZ2xPYlpBSTZiSWl3?=
 =?utf-8?B?SFpNQ21yMnE2TmNIampwWGN6aThMZjczaC83ZjExZVpMS0FIZWI1TFFzd2Jv?=
 =?utf-8?Q?TfZnKFSL/kToZokAmfLQr1/yy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5b6ebb-c6a4-46a2-63c3-08da7eb4a043
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:52:27.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HdYOKc8QttejwHh+gZVYhGQ7V1NFKK2u+qDCf0KPfHbG8velt8WQe6l9p5JS0QN9F6EcP9hRk11k/b4b7DYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6103

On 15.08.2022 13:04, Juergen Gross wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3237,6 +3237,65 @@ out:
>      return ret;
>  }
>  
> +static struct cpu_rm_data *schedule_cpu_rm_alloc(unsigned int cpu)
> +{
> +    struct cpu_rm_data *data;
> +    const struct sched_resource *sr;
> +    unsigned int idx;
> +
> +    rcu_read_lock(&sched_res_rculock);
> +
> +    sr = get_sched_res(cpu);
> +    data = xmalloc_flex_struct(struct cpu_rm_data, sr, sr->granularity - 1);
> +    if ( !data )
> +        goto out;
> +
> +    data->old_ops = sr->scheduler;
> +    data->vpriv_old = idle_vcpu[cpu]->sched_unit->priv;
> +    data->ppriv_old = sr->sched_priv;

Repeating a v1 comment:

"At least from an abstract perspective, doesn't reading fields from
 sr require the RCU lock to be held continuously (i.e. not dropping
 it at the end of this function and re-acquiring it in the caller)?"

Initially I thought you did respond to this in some way, but when
looking for a matching reply I couldn't find one.

Jan

