Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E625442B1A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219884.380933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqVR-0004X2-BW; Tue, 02 Nov 2021 09:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219884.380933; Tue, 02 Nov 2021 09:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqVR-0004UH-8I; Tue, 02 Nov 2021 09:55:01 +0000
Received: by outflank-mailman (input) for mailman id 219884;
 Tue, 02 Nov 2021 09:54:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhqVP-0004UB-ME
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:54:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89c4526b-de4f-4ddd-97b2-7aa0a0caaa81;
 Tue, 02 Nov 2021 09:54:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-KnRJD8EvMvGgQJ0blCrR4g-1; Tue, 02 Nov 2021 10:54:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 09:54:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:54:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0070.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 09:54:52 +0000
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
X-Inumbo-ID: 89c4526b-de4f-4ddd-97b2-7aa0a0caaa81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635846897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNSNxGPr6G/CRU5m9SmGuVBUxGeqEgz9dYEYbFws2ys=;
	b=dbJ0i5n8wkEBK0dUkpVyTq4HedGtixPnG4paR/f/V3Xf2eqDQkCXumHFC2DqoIMVMcr2TA
	Ip59Ju+y0+b3ds1+rZfnMgJcvmnwIfP5mj/XGnasq4Jif3ATHoQdXI6DCmWsVJTeKUe4o2
	KuCELsMoRwsUPiFHUKBSaYfOldieH9s=
X-MC-Unique: KnRJD8EvMvGgQJ0blCrR4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADLuLd6sqE5NaKehdI+cjBpYw2Ohax5frXqX76OYFjA3JRA6BMQempbC858Gb5ZYWNBxYlBHfkLrOw+qVY2vYG+WYGHJtERVSLeOlXNffU0WqoI5Bla+lVbZeB2LxfhG3f+sr/JqpqE48kLWKM8rxEaoMGNPaWA+ce/oEshsa00sne9LydLuLH4ZoYXp9nwDey+vklvsxP1ppByxedgAzmRDL4P0JBqt19MhD1u7dOD+RTlKdsnk5CaZ7BT9X+WmmwEU8bejFm4L6IJM38TMaGMcHLKGhBU+w9Un/0VlKOKV0EOpTp8LUlhsb/H+4UUspZMIvXeXNEbrjUNVMEjuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNSNxGPr6G/CRU5m9SmGuVBUxGeqEgz9dYEYbFws2ys=;
 b=Lm6gH8gj8yNy7m3OKX3mjn8WsnrEnBYXbCw4TEIjq8EEwK8K+4+OjuMd4wSXiflPucXXrr3D8DiWbl64/ILh0+reUzFZDrVITQOvbh/ccZPVbTHOVudbfnt+UYX6TDcylHMY5f+YwuMOQ7os7ig1GJI97xLheVZMXXpgSkm/UWqbdj7RF1rLav2ZtZ6JsmxXeyrjC3te/DaYyU+rkVOVdY9w9VcMK9azW+OnBbU/WZ/RVevqWMYoXAjreKvXwmwZH4ztsKZXjOC2HrBamNZL0FUAsdiU0XuwgS43ZBlwxGTgdOcR+Wbxd9XzRlLsNoGoDEXcwJfDh/xVlPQV/DgrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a436f15f-6ba4-e9f0-f65e-30f4b574bea5@suse.com>
Date: Tue, 2 Nov 2021 10:54:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
 <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
 <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7009a1f2-c930-447c-5c96-08d99de6d189
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686493455DA3039D377965E9B38B9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T0o/KJLD/UHBwnNKW7S5kEVIofUieH493z6+JO02h1ziO/vkcElWYgfPtqAnY6Luk3uhhBROmCr37Bl8UGU+Tvs3pSRXvcWiWzVoLJbrE+ya79P/pgtx0xZfQfWzW7zkpLzIHou37GY1PxWMyQY/zdaO/c2UefBUx1AV+BPvCegDbtIPbi7MEsvQ29uVXjdRAxna28YOKHnJk48y0E6TZtgr8NGqo6YcOXqzEhufoc5EPkwSNNNmQHscuh6mOz3ADPDOu+Fmt5y+9xElYIoUktiCS7P1BI88Nh1qwNXrkFv14vQzm/1oov5CbcW/wXOj8tynNa7XlPWoUeyqroNhkK5Ho06rVImDisNFpR3+vlgcBiqz7BEklXzGaxYQoVHQmeRkC+Fh/nH0XnqNdquBER2njdE0PyFGTEQmqG1IkZgy6IVMU4f1X/fZOU5aiCsj6cqQnM/vv2q3haffpVPALazFtd7MX4oSrV+oQEzoevQ1VphbxT8Uksb8a8CzGF5MHgi+7t4CFolxAxE7eusdARTlOvPpmx/1Ueqjluui7b/vEai9xRUg+beB/eP/zdiJK1fYBKHAAJEKAKzIWaVVBhBrDlkTZ7/k3NPdj2xaldzANy72uT9O46SVfB/hgO96bEfnz+uDoEw8dxJSk57xtDBUcOymd5+FagTTIKn/ZZAe/HV01R2jU0mt/Z2Bs3TYhmwrArrfMRLYpznJhyZbHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6636002)(16576012)(316002)(2616005)(5660300002)(956004)(2906002)(36756003)(8676002)(38100700002)(4326008)(37006003)(66946007)(54906003)(8936002)(66476007)(66556008)(6486002)(26005)(53546011)(6862004)(31696002)(186003)(508600001)(83380400001)(40140700001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0FqT2JqMVFPc2k5U0RsRVI5WGxCcitQV241V2xoN1p4by85ZU9TQzBsYmpI?=
 =?utf-8?B?VTV1SUE4b1FudzNKREJINnZxYUh0cHpCYUcrK0Y3N2JuZmRiOVBKeTlZV3Nu?=
 =?utf-8?B?Z1poWUpscnA2dWhBM2hZazJ4UndxWS84M0VLVlZWNkFWWmM5c0VqekZOaGQy?=
 =?utf-8?B?Vk4rdU84NlpFRHVxN0orNVRzR1ZzU1g4SUNDbXdScDA3QWxKOXRIc2wvZDZs?=
 =?utf-8?B?SjUrc040b1IzZkRqOU9wNU1UcXZHQTZhanFKUjNlVWFUNDZjRGhLWWYwUTZR?=
 =?utf-8?B?ODk1RmtuSHBIZ0dSYWFzdVlLZFRjM1BNN2J3TW5vRVZGUHdxb2NkcmJrUk82?=
 =?utf-8?B?WmpnS3Ixa3dDVDM1M3lWQnhhRFpOMU9UMm5jeDN2emYyR0hOVVRXVFdVNWE5?=
 =?utf-8?B?SVZaak03NnhEQStEekVvcVpYMXQ2OXRYZWNjcXc0U0toVVd1blJwZTNmbHY5?=
 =?utf-8?B?V0NTYjlSNkdGZDV1M2p3WHB3RGpXVVJMdWtZc25qc1I2aGpDa0FaSUNTZDNO?=
 =?utf-8?B?VDR4Mk9MbGxrbFIwZW9MdkZsWDBuTWNLd0xVaUNKazdkUUZSdVRjeUc5T3lr?=
 =?utf-8?B?QkZPS0dlTlI4YVdHVmJxejR3a29DTVZIT0sxQVRpTXd3b1dXK29yZ2F3bi9E?=
 =?utf-8?B?b0U4S0YvVEN4bWVmSkR4QTJiTGc2SFkrQ21yc0NVUW5wUDNOTzVreitNQlBY?=
 =?utf-8?B?VU5NakpvMjV3ZVdDcVNaalhjeWFva3JCZ0ZmU1NabXFEdmR1T1h5TFhGbXVi?=
 =?utf-8?B?YS9Md3lCT1FuVzlwMmlST3hCRndUTGw1cHIyQnJvMzB5Ri9FR2xmd2VieXRw?=
 =?utf-8?B?TEdlWEdEVEErdVNPWlVXK2hPVDBpemVDTGZaQTJ6OUxyNnFINGx1ajZIamp3?=
 =?utf-8?B?YmpMdWtybGZYbUo5dklZLzY3ZnpraTRIT3RPbmtKT1VVL1VJN3RlT1hFRXdQ?=
 =?utf-8?B?WW1jaTBySVFycXlLTkEzcEJwc2E0dzZ1WVJVUUVXVjdQRXp1bjVtYjhqU1Iz?=
 =?utf-8?B?Y295djE3dVFTeTJpMVZoUitVcFZMclpMZVl5U1pUZUxtazNTc3ExMGVWTHFP?=
 =?utf-8?B?RS9sQWZSajBhZ0lKSlY3OXdWQXNnb0UzSURURGYwTTFnWFJtazNCSVFjSEhh?=
 =?utf-8?B?YlFQOUlMYkp6OUtMV0lRekh4K1JqTDRtVGNKOTc5VUx1RzB2VEtvK0RTRnlJ?=
 =?utf-8?B?Qy9lSklSOEduOXYwZm1oRllNVFBtSFduSFgwamJaWmg0OXh0cmxwQm9wU2th?=
 =?utf-8?B?WFBianJ5dDJ4dXpBU1JYUE5EWit5empKMzA3Ni9tSUdQdHJxcUs0RlRWbndi?=
 =?utf-8?B?d1Rrb0hVQ1ZyYXQ4NGwwVklhNkMyaUpDWDdRTnVtaXhMUTBKc2hhZTJzSERJ?=
 =?utf-8?B?NEpKYXdaMUd4aUJ6enEybVpMREVmV01idUtuS3ZyMGllMFFOZW5GUURjSDEr?=
 =?utf-8?B?TEt2SzVORzR3ZmhDaitiaitaZUdySS9FVk0wYnNNdFppWUIxKzQ0TVU2VElX?=
 =?utf-8?B?S1NML2tlQWR1a3pOVmpTZFdUam84dVgvK05SSU5ESmlaWEJqb1dEVTRrVkNV?=
 =?utf-8?B?NnZDU1FGUHNEN1dnaWlVY0ZHVCthK2l6SEZTKzhBVEJ4dVVtYnhwQlh2M2Jv?=
 =?utf-8?B?aTRSVGdmcjYzeU5QczUwMC9EVzZieC9UajFwRjJTdlJHTkk5a2lhQU1ybDRF?=
 =?utf-8?B?QjczVHNnVUQzbnoySVh2MXZNTzVvY0hxMzhQMzZDTFU1ZkFXaWpQU2g5L3pX?=
 =?utf-8?B?MGRKdGd1NVBEcC9BQnNTKzJ5a0RtejNCZGRSZmYzekMwaG1vekdhSHBGYlgr?=
 =?utf-8?B?NjdvZk45SFJFcnJ0bms3YXliUktjN0lGK3ZRU0pyL3pnZWltNWJtSkVkbjk1?=
 =?utf-8?B?YWpxR0NEYW5CNkpLYTQxNTdFeVBUU1JpMmgxSExlU2NiQ1VvclJOU1B2NmlY?=
 =?utf-8?B?Y2ZMQXJDTGlHQlZiMVBJQ2ZldDltekNCL3A2eit6WFZ2ajVKOS9JeklIZWF2?=
 =?utf-8?B?V3A3U0RMbnV3V0d1V2YvaFJkZERuUGVGWExzbDAreFZIL3lKMGl1blJ5ZGJK?=
 =?utf-8?B?Z3VDSndQZGxSbGZWUkZoeXJVU1lmNWVWZjRsWnowTk02N1p2REVmNHNKMFRJ?=
 =?utf-8?B?OU1zb0UrbFBHOHRUZVJRNXZQMlhyRkhaUDNSVnJ5cnpveDFhZzhJSnViazVh?=
 =?utf-8?Q?fxbMFiAxjM8wDPa8OJwG4sk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7009a1f2-c930-447c-5c96-08d99de6d189
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:54:53.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4oaMw4IjNl6mTKjrYw07Rxti33DWwKtsSSt1/kNyAopKWDur2s756QTylO7fDwnh7sGimRw+oSTJl1fULwPdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 28.10.2021 16:32, Juergen Gross wrote:
> On 21.10.21 16:41, Jan Beulich wrote:
>> On 15.10.2021 14:51, Juergen Gross wrote:
>>> Instead of using a function table use the generated switch statement
>>> macros for calling the appropriate hypercall handlers.
>>>
>>> This is beneficial to performance and avoids speculation issues.
>>>
>>> With calling the handlers using the correct number of parameters now
>>> it is possible to do the parameter register clobbering in the NDEBUG
>>> case after returning from the handler. This in turn removes the only
>>> users of hypercall_args_table[] which can be removed now.
>>
>> "removed" reads misleading to me: You really replace it by new tables,
>> using script-generated initializers. Also it looks like you're doubling
>> the data, as the same sets were previously used by pv64/hvm64 and
>> pv32/hvm32 respectively.
> 
> Yes, I'll change that paragraph.
> 
> Regarding having 4 tables on x86 now: merging the pv/hvm tables would be
> possible, but this would add some complexity to the script generating
> the tables (it should test whether the number of parameters of pv and
> hvm match). As the tables are present in debug build only I don't think
> this is a real issue.

Sure, but that imo wants saying in the description.

>> Overall, besides these mainly cosmetic aspects the main thing missing
>> is an approach to prioritize the handful most frequently used functions,
>> for them to be pulled out of the switch() so we don't depend on the
>> compiler's choice for the order of comparisons done.
> 
> I have already prepared that step by generating the complete call
> sequence, so any change for prioritizing some hypercalls can be local to
> the generator script and the used input data.
> 
> The main question is how to do that. I've collected some hypercall
> statistics data for PV and PVH guests running some simple tests (once a
> build of the Xen hypervisor, and once a scp of a large file). The data
> is split between guest and dom0 (PV) counts. There is no clear "winner"
> which hypercall should be fastest, but several hypercalls are clearly
> not important.
> 
> Here is the data:
> 
> PV-hypercall    PV-guest build   PV-guest scp    dom0 build     dom0 scp
> mmu_update           186175729           2865         20936        33725

Builds should be local to the guest and I/O should involve gnttab ops
but no mmu-update. Hence I have a hard time seeing where the huge
difference here would be coming from. Did you have any thoughts here?

> stack_switch           1273311          62381        108589       270764
> multicall              2182803             50           302          524

A fair amount of the mmu-updates is going to be coming through
muticalls, I would guess. Priorities therefore may even differ for
the two separate dispatch points.

> update_va_mapping       571868             10            60           80
> xen_version              73061            850           859         5432
> grant_table_op               0              0         35557       139110
> iret                  75673006         484132        268157       757958

The huge differences for builds is puzzling mere here ...

> vcpu_op                 453037          71199        138224       334988
> set_segment_base       1650249          62387        108645       270823
> mmuext_op             11225681            188          7239         3426

... and here as well. Did Dom0 and DomU use identical numbers of
vCPU-s and identical -j make option values?

> sched_op                280153         134645         70729       137943
> event_channel_op        192327          66204         71409       214191
> physdev_op                   0              0          7721         4315
> (the dom0 values are for the guest running the build or scp test, so
> dom0 acting as backend)
> 
> HVM-hypercall   PVH-guest build    PVH-guest scp
> vcpu_op                  277684             2324
> event_channel_op         350233            57383
> (the related dom0 counter values are in the same range as with the test
> running in the PV guest)
> 
> It should be noted that during boot of the guests the numbers for the PV
> guest are more like the ones for the build test with the exception of
> iret and sched_op being higher, while for PVH sched_op is by far the
> most often used hypercall.
> 
> I'm not sure how to translate those numbers into a good algorithm for
> generating the call sequence.

Well, there's never going to be a clear cut fitting everything, I
suppose.

> I could add priorities to each hypercall in hypercall-defs.c and have a
> cascade of if (likely(foo)) call_foo; else if (likely(bla)) ... else
> switch(rest).

Personally I'd lean to an approach like this one; perhaps there's not
even a need to specify priorities for every hypercall, but just the
ones we deem most frequently used?

Jan

> Or I could have groups of hypercalls with a priority for each group and:
> 
> mask = 1ULL << num;
> if (likely(mask & prio_1_mask)) switch(num) ...
> else if (likely(mask & prio_2_mask)) switch (num) ...
> ...
> else switch (num) ...
> 
> Or I could combine those approaches using the mask variant for cases of
> multiple entries having the same priority and the direct call variant
> for the cases of only a single entry having a specific priority.
> 
> And then there is the problem to set the priorities (fairly simple for
> HVM, PV is more diffcult).
> 
> 
> Juergen
> 


