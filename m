Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A795130E9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316394.535310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk15P-0000mF-H0; Thu, 28 Apr 2022 10:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316394.535310; Thu, 28 Apr 2022 10:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk15P-0000jZ-Cf; Thu, 28 Apr 2022 10:09:23 +0000
Received: by outflank-mailman (input) for mailman id 316394;
 Thu, 28 Apr 2022 10:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk15N-0000jT-Oc
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:09:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452ce775-c6db-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:09:20 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-r6gYEBsUNIeyUNzat4y1RQ-1; Thu, 28 Apr 2022 12:09:18 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5898.eurprd04.prod.outlook.com (2603:10a6:10:b1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 10:09:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 10:09:17 +0000
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
X-Inumbo-ID: 452ce775-c6db-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651140560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paNOND5mRbm7gq6v/DVUXy3uVWjx5CvEVEg+RVMRvKA=;
	b=MnW7fm/tyOanFWWRWQ+PMkg3n+VxyrJTlGIyKEWIea2SisvxiGiGKpGfUUZECo0ComBAki
	iIM3NaNdVaTQwPnHeHvKd1ZTgHLk1fl+d7BoyYV+Ucr1HDeqKy8Ys+UBg4/iirBNpMlEqu
	L78n68/W9dZUS8MGfgnXUsHBofcEYBs=
X-MC-Unique: r6gYEBsUNIeyUNzat4y1RQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhlN4IkUPySJW5QS8V3LGNUxqlIMJ07d2bHV3g4Bw5CXyoaWGG+tCUMsT71q34KdBlSMZeBW8N+Lf19GAi/cw+9MlYXasbPq2Sf5i8LuoDZqPWzY+hVzf/6B89cYys/HKr1MtFNsUo6uhm9GNS+Fa/ensiFpsPUPdNOkuRTkVtp2dPIVQTAihjoBuLy4dpWx0YjlFoizlk5EIQXy+uoTsj4Vkk+8YL1eUDBZWUusaQM4DAB5hpxIZgazAy+aMySf1VwEwWMblCzy/FSOzIeX/kO5/ubEvfBv9yedv6x0PkQzWvGInKOKVuKcZ8hv9Ni8LwJeci4ASy2m7/ZMsPg+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paNOND5mRbm7gq6v/DVUXy3uVWjx5CvEVEg+RVMRvKA=;
 b=jhm+IQFJdNpY2LkpLnEuOXBTmXTSTL49R4vmSl4k9n1W1lthzccBGefPlDPKqz5whyYXmihmMP7VLjZSeb5EEEIngn3FYI8p2fH0YyNK2ZLwzH9KClOqCtWOYNDA9y4/NXWYjqrfSLo/AifLvLVRfS8ZLDa+LWXHJEZRfbsH93wDnPFj91cq2t1YrjF4tkbjuK8s0gdZV4gXxBmtE1FPUiUityJ1tRhoSjf9UX5KwOQzVWFgmzWDpQSdrljAVYL0LwfkUAHcloJtimkUgT1wUlzBEdG/CfcPsJX+A5zmGpeSYKeKop9DAJpCj3a8gGA8fxYjQdaWn2e/mA2ghqUCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3e51bb2-4445-21b4-a1ca-3ac3b513affe@suse.com>
Date: Thu, 28 Apr 2022 12:09:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220428094625.382970-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220428094625.382970-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2146eb19-8309-446a-d378-08da28ff2748
X-MS-TrafficTypeDiagnostic: DB8PR04MB5898:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB58982DB8984ACB220BF7FE02B3FD9@DB8PR04MB5898.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hxyMUa35Q5WPodCmShw0hwcLkKZvmgRAExcG+TILwD8uvwHrGYcNHvk/dIWhIY2S31MAORsSXJZZTZir3o1xyokvoNDxBM10QdsI4SfCB66yVYpmg/7bosJ7srPn6V+XdM2Ndd57mdSeG48ZvqnRjQ5zufj3/esw4hNuxbiiBAYZOOVK7fNlfimzRltkuw0RJfgjQvg24S8VlXinD3Aw7RzVXIXCAPcyA01ATB3ERUdKCgjGrxidIttuvz7YCXF1p/zrLd/xQ0zxnvawNdCp8q2MvELigzDc/7VGVvr7Fy9gphYfhfh0IwQd8AEaBONn3q8XskAwdGSwL4MttxXWL0t7oEhJEDjABJvXFhQwn8Upw8gGSiY5v0KxQYD2g41q93GYSVRO8k831IrOM6gtG72ZFnX2IiRLfpOvjt+tMAjb14l7cdI1dh9/hui/XGSwLZfF5gG8wRtiZf5Y0pX/SEIr2KMscehZjlBTsS9/nNDrC0pq/h7yrUeMHF3Db55MYSlvjX8qdi0omWji+iIo56mwSoEYuvjU/5rVDxMOncAbXZI5QbWpjc14hvINL8/FuS9CF3GQJj2aGnvIYg5jD19aIUQFKM7GOFzNLAkHvrwatDehamAEMoherAgT1jnfSAJmRrk6g0/xyzoggEKgTBnNjfVOzd+oIg+Lcp51d8i8nk5Zu9UUdRVvbFgZNjJYZwwZEbcaXlpX7ZAwQwaGF+kwtW4+XQ3rcjTCtEFOLrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(6916009)(54906003)(316002)(508600001)(31696002)(38100700002)(5660300002)(2616005)(186003)(4744005)(8936002)(31686004)(2906002)(36756003)(6512007)(6506007)(53546011)(26005)(86362001)(66476007)(66556008)(8676002)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sjd2dWI0aWZVeEViRWhXNjFRNndOUjJrLzlBRmVQL0NvT2cwTHJrTS92dVhZ?=
 =?utf-8?B?bkdhZ1VUMXBZbzJPeXB5cnVJWUt0NGY4QlZ5eFIwNEpnOEdrY3d1bFdGaG8z?=
 =?utf-8?B?Q2R0aE9Ed25JdHU2SzJlWXZSYnZyMGlVVDVJQnhkV1hkUVRTdmI3SGQwT2VS?=
 =?utf-8?B?TUlpT01qdzFoZVFRTXdHZ1IxanIvOVloRDdjeWNsNlE4aC9zR0FuZUdNOUxm?=
 =?utf-8?B?WHQzNlI3Z2VXUkVSc3QvTXA0Sk02TWl6ZVJxSWxVVXY0QXAwblM3Q0xlZDVE?=
 =?utf-8?B?QnluRHplZG9DR1lWaUVLdVFhYTJxUS9rTUhoY09ORHlaTUxBRFVEL0pmaHJ2?=
 =?utf-8?B?NXAxQ0Izam9PZjdLS284UlB4blZhUlU2c0I2emV5cy9CREN3ZGc0aEcrM3Q4?=
 =?utf-8?B?QUdWMXkyK056Y1FCZjk0Y3hxeXdEd3ozNVVQc3lrSDFHZStHbXhXYXFnK0Z3?=
 =?utf-8?B?TGRVTktqNEFhNFZEcUVxbjE2WG1qdk9KQ3pXcjR3SkMzdWJHZU9PVVZqSFhw?=
 =?utf-8?B?YmNoaGc0bjIzY29tODFlanYyQjNEcFRrYUpOZGxHclVhdWNJN0UybXMrT0Z5?=
 =?utf-8?B?a1J1Qy81WU1lbmVqZEVoam1BYU8yREducUxjWTZhZVl5VzZkUVZzSnZVVFF0?=
 =?utf-8?B?OU1RZDFSTGxiQnlOUW9hWjhNUVc1ay9kSSs5bURRR3JKZjBYRkovVFdOQWFO?=
 =?utf-8?B?K2EyejlTbUtlQUx1T1FESnArbFdQaTVJdi9hTCs4ZUtjalQzU1UyRjBaeE1X?=
 =?utf-8?B?VFJ4RExDUFB1V01sY1YzaWZvR0RDM3hvbmxmRVR1N1k2dHo3Nm1yaUxpMndW?=
 =?utf-8?B?VnFtTkl4REIvTy9wWHZlVUNqVlBTeWFRM25aQWZRZDc0SWMwbTJSMG9pYzR3?=
 =?utf-8?B?UUxBRnh2NUVTSzF1cnJVQUkvK0VHQjR3RS81dTZHbFdPTW5VTE14clpDOWd2?=
 =?utf-8?B?akN2QU83VnY1T3JNOWQvZEdSUTlVWEdRWmxjUlpRSGlwNWViTHJwaFJ6VnRn?=
 =?utf-8?B?eEUvSTJLR3IzMEdzUWNqRUpVWWFXZVVYQk5rTThUUkM2S2x1eTVQRHZKS05E?=
 =?utf-8?B?N1lqbWpKcDZvMU5RREJGbDB5VXowbzZ6b0ZIczNxWnd3ZVFaSUxFWmRtZ2VN?=
 =?utf-8?B?RVRZakJnbGtqRnIwbFVpUlY1UFBjN0dVRGRKajhaRFpYY1pTd2xzWHVzR1M2?=
 =?utf-8?B?bnkwUUdpdnh3YmthNzFGL3ZISnBLRVhCaStaelhycDdHV3ZhYXlENjFGTnRC?=
 =?utf-8?B?RHV4VTZaZTgzRENjYVBYbTN6dkIxb0l0WndtUFUra28rc3ptbzdVa0R6ZVVk?=
 =?utf-8?B?dktyWlVBU3krcVJaMUtEdDVySk9abTFkWUtscWxMM29QdmpLYzk0NzN4UkFU?=
 =?utf-8?B?aVJtTlBPTDM4YkgzSDdxM1hNcGlnZjVJUDltVzhsY3BaSmpRTnhqTHlsZ2Jz?=
 =?utf-8?B?NHUxalU0bUk4eEVuWEhkRFh3MTA2dndjbHZsMDVVclB1YWRVQ0NCb0VKdndU?=
 =?utf-8?B?eTkyak9YTEE4cUZHaHNTaXkvN21pQ2RsV3Y4ak9UNy9RUE9mSFJrUEppOEZz?=
 =?utf-8?B?R2VuSkpUVFFpRUUva2IwVSttM3N4OUh3Slh0bTRZT3p3YjBWWnhJTDNtSXo4?=
 =?utf-8?B?NVZMa2U2SFRVcWkxWUtWa1hZNGM3ZFJJN1l0aVQ4SXB3dGtzbHdOaWZIc1I5?=
 =?utf-8?B?bUE4VDR5M0RGazQ3azZnSnhDZ0JYNDdtM3JBc1pSY0JTYjR5a0NUelZKVFJJ?=
 =?utf-8?B?VTFVb3MxdEhXM1R1VGJlUEVSa1pkWXZSYWNCanprb2MydmlwSWhoRTVCTmhq?=
 =?utf-8?B?QnY4OVJMakhUWXdJbzFJbk84cWw0dmZsckxYdVBhcERyR28zZ0kvSDd0L0pz?=
 =?utf-8?B?QmxQMkRwc3o4UnRWSWszOTkwaWlTZkQrcEN2MmVNK2dnRjkzRkFBTHFFckNN?=
 =?utf-8?B?bUJvN1d1c0UwYkx5UnZRRXh6SThBc0ZFaEZhVFJrTG5QMmkwVzZOc1l1dTlx?=
 =?utf-8?B?d3B4a21vS0lNbVhRQ3NjVTZLcm5hKzc3QVB6bXFZSmkvcTliajBKR251TVdN?=
 =?utf-8?B?SEtzOHNXT080YkRjRFlhVWxZZUF5cGtzWHg0a3pCN2ZuWjk0bk12bGxQeWwr?=
 =?utf-8?B?NHBLMTNwY2NYREc4NU1xZVF4ditWY3lRS3ltK0Y1OVIrczZCc29EQ1d3Y0pL?=
 =?utf-8?B?OHNkV3V5ZFJjV2Q4dDNNL0c4Nys1d2RXdEtlTnMwNDJ3YUxibnNveWFHQmQz?=
 =?utf-8?B?V0E5UlNETyt4Z01rWE9Fd1loU3J1OEJlWjNFUnJoWmlSaHNPMnJ1cjlJektn?=
 =?utf-8?B?L3RWeHYvWkRsL2F5U0JqOUZ4alJvSU4rMTdlUTR1ejNzajR1ZFhsQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2146eb19-8309-446a-d378-08da28ff2748
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:09:16.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iq9WOgmXAuAuPPNh0t/4GtHi4Fdbc2V7n3lRvJlOVCZ+9bilF9U19stIpi2hGRTye3F1Nz7IYLzmppfHA+4FNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5898

On 28.04.2022 11:46, Michal Orzel wrote:
> @@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>  })
>  
>  #define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +    ((void)(d),                                                          \
> +     ((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>  
> -#define gnttab_status_gfn(d, t, i)                                       \
> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> +#define gnttab_status_gfn(d, t, i)                                        \
> +    ((void)(d),                                                           \
> +     ((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])

Just as a note (I don't mind changing these too): If a macro cares to
evaluate all its arguments, I think it should also care to evaluate all
of them exactly once.

Jan


