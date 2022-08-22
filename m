Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6059BEC3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 13:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391376.629178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ5uo-00088a-LN; Mon, 22 Aug 2022 11:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391376.629178; Mon, 22 Aug 2022 11:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ5uo-00085f-IS; Mon, 22 Aug 2022 11:48:22 +0000
Received: by outflank-mailman (input) for mailman id 391376;
 Mon, 22 Aug 2022 11:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ5un-00085Z-Ha
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 11:48:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5121c5be-2210-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 13:48:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4769.eurprd04.prod.outlook.com (2603:10a6:208:ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 11:48:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 11:48:17 +0000
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
X-Inumbo-ID: 5121c5be-2210-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCDL2KdXRoWF0UcSKKM9dJsOffdyaHxBctb3zWh5Ap3aEe6c9+s5G7kyKqW2tfBAqWRRUW5PhJDG+W+oZwX1EL52Zq602AMhITujLtKc1WEJ0PtKl/Qqr+WIKGDmJECELCK95mgh+S6rXxGAaKfXvHkvkHag06d/Olu1Kbq6237gGBiqeKKRV2BQBKkaYhGyukj+ISP+WsPn1Tpoj+vg0CSKYqgnykYtEsWxl2tJIxQ7vBLvmyfNJj/jz2mdbTU5sW9Po1c2GXmR/L5s5H69rowBrO8uGDyDjOoX5mpkcs/b1WYqbNFGMYLAFBP8/IstFG2o3lu3BYuCV6DEUuFikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DVRFZwFfMd3QwLGY+pqVfoCJ24rEX8CpOuZIlh2whs=;
 b=oV/DHnz55ZYc+xqS2/tgfz+sZkkE3G8AYyPOxCZDXLx/W4wbj7JU047Gh208ObS+lwNRwUK6+UB/f3pnU5+nJFQLpoGEB7AOrkqKPQPLh3JuxK7K3oqX2u/dNxzb/Iz4bEnf372F4BlcsqKVw1kFnH1i6wOaCXAHGwEJPbYg4gEszUBWGGlrs8Q/kSZpF+85hyv8KKg2hULqmTY+4Jux93DsqiBQL8Z9TNPuQAzMkmyJHoNWsphKgqxcmNYRWl72C18HTmzrDvbvsm1STUJ0GDS971uJKjSRaQklV52UQ46jSTsAY+PyN7gxJr0MNGfre1q6nw3ixa3xMHShYZy+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DVRFZwFfMd3QwLGY+pqVfoCJ24rEX8CpOuZIlh2whs=;
 b=4HeulwH4rF+MbJnWsy0BMCpVkNWQ6m5V7D0kK+rL1Hhk1OeQa0/Jes+pS0ifDVK30szVM7L0Apvr294bNVZI+DrY+NJD0HMdPBKliRX3vQDox7L9or5rBK+9MUhiZrrhARp/rBsJKWeFIPx7gx76eTQ9eGVA8HeGNfW6R98g0af24fWBUAJRlilky3CfTfWW1sxdOfgWQlTrGtRTQAPJgXMoWe8lJ5L1nKRkEa5AyQCISRrYCupigYdpCPxumHKMHR9mAaCIk0t5CvCOz7yO44ibZi6o7B+F2tpfxTd/PbHfyos33QFYal212NOqx2VMVFV1i5Qw/EulTpiv0QYgDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
Date: Mon, 22 Aug 2022 13:48:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:203:91::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14bd14d-bff8-4daf-de15-08da843433c0
X-MS-TrafficTypeDiagnostic: AM0PR04MB4769:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dXC8jz8DdM3vGt5PRDYOxEaJOawVzZJjfkLd0vWaD6ymFAHl6yoaj8HaiuY8fSCTU2nyWTGpfvx16/esWX3Lm6lQ+J9tr/YrGHD8W/oAfnsY3QK0SU3FtGSlFzJ7qC9twkwABK30d8T/K9L6oF8oO7uRCGLtYeS55tzVHkHxi5HP5MtS/YxlTxD04+c/jcsqYkFoWK1Y9ZNJcR23BWYUNKq0963u9AOp7KmDlf9FbBWw7ZJ9c9p2Y3JuqowmyMdnvwj5dvhClmkJGKopbOCZekg/LhQPVfFGLoYwiUJjQkklbzSMrbCFaZndUTjLE0JcAGqouBva1TEX0LSzAox4hh2g1g0+Xt2ecpAF9Jgy/WPaSMoRI1BDyRFczTz2jRn6u17olZPpX6SaCahOWDCcdwr4vDnS/+u5dWo+Wk/9Ni/Q0adXcm34vREoNnUj6EtD6AI8tXXbGLvzjYn2hhIsSPBRoz5p3A23eSBDAejea3jrzA49cIkLPq5Xb67A3+zPM0t6oe4m/CSU0Bv2PPgMbeT5OjFW9IQ/+cSfqWjPuacQJ1W+xM6vTFjtR9iIHSuiWAU65cafm8Ydft8pUdJLgE44uJjCJFHfOtpXQ944Bb0z41Xjjj11ckzA4jUeSYluj96kM80T7lEk3RTKf2hLVCNQh3AeY8eiBfhpVkLog5xSykJK4dA3kGcVObrS05aiKhhUS3KV2lCJhJqbmXkDLivKjR3B6qwN1f6q35Jkyq93/NYd+iQbqztfZyggLxns2ly64Ql1xF7nThDWC8a655M/2HF7qyARVqK9GgOsYA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(376002)(136003)(346002)(86362001)(31696002)(38100700002)(66476007)(66946007)(66556008)(6486002)(4326008)(8676002)(8936002)(478600001)(54906003)(6916009)(316002)(2616005)(186003)(53546011)(26005)(6512007)(5660300002)(36756003)(41300700001)(31686004)(6506007)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzFnQ0RoMkp5NkRZOWNJd2MybEtmTkQ5VzJWdW9kbFozY2NTWkJnaFlVU2E5?=
 =?utf-8?B?MmRPeGk3d2orZVcrYXUzRWJFSU1NbkV0anVLaUp3K0oydzFlZHhUZUZHWWtr?=
 =?utf-8?B?aE41cmk1NENITk5FSklaUWZUdGwwdWVDaVRXbU1MOXhHNE0xbzZsT1VtZXVC?=
 =?utf-8?B?aWxheHErdEw5dmlYa0NZTnJWbWpJK0FDQXNuRzFuWVhkNDVjeGo2Sms2d0tt?=
 =?utf-8?B?aXgxTFdRclVGNW1qdU5HTFdmV0JsOVJrZDVRVG1lbm1QMlRQMGVvcjN2bGw0?=
 =?utf-8?B?Q0t0RThid0poU2Jqb3N4NVVOVTNNdDVIclRnbk5hTzlPL28vMWhSUmZDbkhP?=
 =?utf-8?B?cVBKMDBpSGpZRk1EdnBwRk9vRDJSbUpxcjRodTAyeUc1MHJVdXo1YzNwUGdC?=
 =?utf-8?B?TGUvcCtaVmRzS1FGQWN5a2EydFJRM2xnVzVLYWRlWEs2Q1BjMnhtR0d3Vmxu?=
 =?utf-8?B?ZkpqVVZnQjZ4MFczQ1RuNFpQS21FUUEvRzE3STlKOGx0UE5JOFlrRlhPbm4r?=
 =?utf-8?B?amt2R1FRRktJYitWdE0rV2FhbExNR0tRVmh5R1JXRkdaeU5qdlVSVTk0K3gy?=
 =?utf-8?B?eUcyeWZhbUx6YUFYMGJNTWhBNHNtTmtqTDJZS2JrS0YwYlVzSnE2RXc4NXRl?=
 =?utf-8?B?TUhBaklsb1hNL1JzRXNOSHJwMXlabFlpR2t4SnR6RDV4VExGa0NjK0hBRGpn?=
 =?utf-8?B?RFpETjI5TzNGV01vY1dMRGxzM25adFlaL1BMZ0oyWHpPa25ycnlpdExoUjBr?=
 =?utf-8?B?YXVCN0ZzU1dzd3lQMFlJaFBPWW1DQlpuaDhuUkNxbVJqLzdnYnlHdXU1K0Jr?=
 =?utf-8?B?R0J2TlA2MlByNElYTHVWeEZIZVBZQWpWUGFQZ1J2OHRSK3AyMHZoaVBTM256?=
 =?utf-8?B?Q0NjY25lZURIR2pDM0FOdGptWDdyVlZ3bG9IMS9EdmtzTVo1UkU3WWV4OVZQ?=
 =?utf-8?B?d2xTVmhYNTJmNVNEZXV2WkQvUFYwRi82UnlQUEt5WVBEbkxyd1MxUWd0Z0Z1?=
 =?utf-8?B?eXFJM1BOem9CZDRuZmdxMitjTWZ4NGlwbkkvWVZNb0FiME13dGk0OEo2c3VJ?=
 =?utf-8?B?ZlNjWVZPVXVTTmlsT3ptMHF0WDllcWJzZ29NWWJ1eE42RE9GTElqb3pCSVhG?=
 =?utf-8?B?WGlhM0lkR2IwWG1KYjd4RnREdUI5NWJ4UTBhT0pMZ3VPTy9HcGxoaW0zS1Rz?=
 =?utf-8?B?WUlEZ3hNRXdKZFZTYXROM1lFaW9NQnpFZlVFUWNETTN2MmV2aUl5MmFTQWFy?=
 =?utf-8?B?QW5yZGJUaWZKSEkrUXVhVTF6TVJzK3VYcDk1WHRJaDByZU8zRjcxMFBGdERu?=
 =?utf-8?B?SHpNWWx4blVyaU9CZXVMalAyeGR3WVIveHJMR244NWdBUk5OM0M1TUQ2VTVh?=
 =?utf-8?B?SjY5aVhRalRNQWFTUDhhdG96ZTJ0d1N1OHdwZmp3QmVVUDN6ZVFBdGl2allG?=
 =?utf-8?B?eDZRcEg0RWtxazZ4S3I1RGFkdDl2ZnZPS2FWRDg0ZEZmZmNMR3RSUTNWVy9w?=
 =?utf-8?B?VVUwTkV1eWJxNGJZYUhJWnRzMjE4WlVIQ2dKOVBNaXlEMUx4SXJuYis3RlJk?=
 =?utf-8?B?RWdrSk9hdzlTNjRCcS9uS2VSUjR1RWtNaExKUk1udzJrSmFKcWVuU296VXJ0?=
 =?utf-8?B?N2lPa2IzcmRBaU1oLzk4RDA5eXR6U3BnTWdUY3pRMmdlTGtZazUrU25kSko2?=
 =?utf-8?B?R0ZvSjJCQ01paGFYWk8wQjU2cCtYUHJndGJnVE5LNzVkMlBMb0J0VHpkSFls?=
 =?utf-8?B?YVlBeWk3S25HdHdyMHhEUnZvcHZnYyswcHBNTkN1WEo5cXZPUmo0bFFDZ0E4?=
 =?utf-8?B?SHRTSkFYakNEampvRGZocnVNVHNBTUZHMDRETWV2MkUvK3l1S2NybkdxRm1k?=
 =?utf-8?B?ckxpMGNFVEEwMnI5L1crRTYvY1FNUUxLYXhqT1JGNWF4U3RIY1Zkck5xUHU2?=
 =?utf-8?B?R0htVGEvMjY1TUdvdHQ2Vmw3ZTRia21iTFgxcTdUcGU0Vk9UK0F4QkdDbE1P?=
 =?utf-8?B?clpFWHVUTDRabnhoRnMzaGVnMHd0TkxsT0FGV0lXZ2pYQmNBQngvbkNyTTJ3?=
 =?utf-8?B?ZXJLWWtLQlVtRG5MZG91dUtXcXJEUFBQeHVZQ1ArYVNCNEh3dDcxYVRsL21S?=
 =?utf-8?Q?V9TmUdl/IKNG+W4MAcziNTIJB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14bd14d-bff8-4daf-de15-08da843433c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 11:48:17.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl/dBw33izsYqBHSDBVxU3o4+Sii6SPNsR89n88l7uI5Inr6nRc17s1kYUNPDvGbIumWH323v61Zj/YJZEYnew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4769

On 22.08.2022 12:43, Xenia Ragiadakou wrote:
> On 8/22/22 12:59, Jan Beulich wrote:
>> On 19.08.2022 21:43, Xenia Ragiadakou wrote:
>>> In macros dt_for_each_property_node(), dt_for_each_device_node() and
>>> dt_for_each_child_node(), add parentheses around the macro parameters that
>>> have the arrow operator applied, to prevent against unintended expansions.
>>
>> Why is this relevant only when -> is used? For comparisons and the rhs of
>> assignments it's as relevant, ad even for the lhs of assignments I doubt
>> it can be generally omitted.
> 
> Yes, I agree with you but some older patches that I sent that were 
> adding parentheses around the lhs of the assignments were not accepted 
> and I thought that the rhs of the assignments as well these comparisons 
> fall to the same category.
> 
> Personally, I would expect to see parentheses, also, around the macro 
> parameters that are used as the lhs or the rhs of assignments, the 
> operands of comparison or the arguments of a function.
> Not only because they can prevent against unintentional bugs but because 
> the parentheses help me to identify more easily the macro parameters 
> when reading a macro definition. I totally understand that for other 
> people parentheses may reduce readability.

Afair Julien's comments were very specific to the lhs of assignments.
So at the very least everything else ought to be parenthesized imo.

Jan+

