Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5B79A37E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 08:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599027.934257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaNu-0003RH-VE; Mon, 11 Sep 2023 06:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599027.934257; Mon, 11 Sep 2023 06:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaNu-0003PN-RN; Mon, 11 Sep 2023 06:26:58 +0000
Received: by outflank-mailman (input) for mailman id 599027;
 Mon, 11 Sep 2023 06:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfaNt-0003PE-Mp
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 06:26:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c33297-506c-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 08:26:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 06:26:25 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 06:26:25 +0000
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
X-Inumbo-ID: 33c33297-506c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+PgZIwTkgYFPPdVppha1PQdpBEga+ppZBOg0mrrQaFOhnVGJHRat+TO7yDIYsUN4oIt+yh4F0Fso9u5AEjxgep+5wVVnNYwXVv5yNOt3GQNDo5/URM4ci7yY7skHewdpwHajm5i2YSKJF+2vgvZYISvRH1jXvf6LeDTZmBaZO0HsJrTM4WTRiuC0vun38TZ2D2mzHLs1aBJN1PPeE69FAx5THkLD7rnBEv0znE0z5t1INEGiVnwe94Ft1wcn9/pZKRI4Q5yJZhV2VvEmWQ8W6TJEocMk7p7Pz+PLHkLP5DCmLR4h3NG/X2k1M+MoI7YlweHQ4Qd0XjTIEd2YRe3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXoyWX9grCWk3DjTs5rM9ZydvgRbpa+79b36HefABhU=;
 b=C+pqqLLY7Un8AoQdvUMfLwl7U8CXYEZ/gGHDbdcEfB9OIzCZqSng9s+Dc3lHmMThX+uuFEaDb0Thof8/2t0khHjIKJBmPiG+ye8Dk4VQIY3aFAwVPQVmrlX3H4ZxiuNkGklfNPn/K4vrIoyy1BWrt0jug3MUaqyL6F+3AM0QIk8atJg31bbcqdUeVb6NwAJ8Ky+rLU/d5fH1PbpqHs7KPHroLJbzXL0vhDI2Fh4d9FxBpmiPOoAs4b3KoHACdYzTx1wzYjnitrmvW03glcayfe5ESz46aQYihwpJK2gfufwB8MchRXTg/k+VOLEsawCWQatahvuoWoforEofiY4Arg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXoyWX9grCWk3DjTs5rM9ZydvgRbpa+79b36HefABhU=;
 b=tFqgCHDZFi9awKpJ7Ce4IxyOJp62brWZ8BwPJHIeFIdCRknBaqUeU787pWorhs3KPHhRpj48iB4EbqHxMrxF40i9n86nLupJzYaNb186xypYfiik8ehtUTs2wWB7J+sNHl00bYVt4t+KHJovtQaRYgkbTHU47T/eCvVF8tBwaKWfqgE5sJ9vS59GhPueLsBNK7cYBy3CN1WxGqycIdmFIOLemWXsYrzTg8XkZP/Y0sro/TD2p8646fM68fzz2xRmn2/nKaqlj2GVjw9R6k/n/CrNAXPO+bgGHg/9oTKGvy4W2XeReW1dSGAFaM+Fhi74gBX7aoX2ktxnHiZKYjGgcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a390fbe2-6dc3-b96a-ba3c-b979e65ca2f6@suse.com>
Date: Mon, 11 Sep 2023 08:26:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 3/5] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <dd3d9c5d9ec94f9e1747ccc0fbf82629a58bddcb.1693590982.git.sanastasio@raptorengineering.com>
 <16496c4c-4c92-7ed9-a612-72e75f86798f@suse.com>
 <7f6914e3-71e8-0bff-dc8f-c0f897ddcd2f@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f6914e3-71e8-0bff-dc8f-c0f897ddcd2f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 91baf02a-ab0d-43d1-22df-08dbb2900629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7MAbkoWtTvyq4N/BzC7RjuaMIn3soAkQJwSuz1OUJkDvugIC1dBtuBur4aBVzuIhI8QSSdVm8MXW+nBlkUEQUD/o041FQu0WPlfKJfJYeakNaTTLph1lrp6kSTnnRaYwfpWHjhL2SbQdLYX335cqm6f8VX/spKBRGL0wl1wxYT0vGbxUXBWVsVy1tc0Ou8INQgncSSoZrbfEAirKGGeYAmgtkILi+mUi7W9AFhUwQJ8y4K26LUnAOkipbdhc+FE2TvtJs/EVyvu57LA+3WINSpkvoThsKc9Q88/DSEeLGNDVo09jYZqKcTJdbCndcY8CpAIeyHb0OY5Z1RMqS2CS2NlrMzeHLnG8OP8hj1Hyt/w1p2ZwzN8V321/bv7C8QqGH46RX1fRdoDi5bm2qlD5ZmFlsl9XugLTz6JUQZS4jrUrdvuvzPajgqdPnhYjULCffMA7gKaghvt+TpClWhRJ9w1f3eXjZVAIHvyIjQJMFLupi99M7JgpWpJekOT55NXC44H6h4rG2KWQX5lAVmS4msiiLyt4qWP7GeAZq5bB4mMp7dZZ9zJl9mDu0fB1+/6BeOpFsMrDX3GI9J6IWHizKpfgokP8ov9dptmf6FdDh2aTa+f8Orbg2+/U0vRT39ghi0y12b+MxOVvNfn8l13Rzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(396003)(346002)(366004)(186009)(1800799009)(451199024)(6506007)(53546011)(6486002)(6512007)(478600001)(2616005)(2906002)(26005)(66476007)(66556008)(66946007)(6916009)(316002)(5660300002)(4326008)(8936002)(8676002)(31696002)(86362001)(36756003)(38100700002)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGpvcGRRdVYzRzVmMDdCRlFSWWkwdTcvbGVPOVdTT2UxTXBSVXhYdll2blVX?=
 =?utf-8?B?YXNoMFFoL2tSSW9UMXZITEplTmxvSCtNZ2JEZm4rVU1RSk5TV2tDb1VmSWVz?=
 =?utf-8?B?RGZNVllnZVZFVW9tRWRwUGZmR0MyOHVlaWc3V085RUZGRFJNOWJHZ3pZbFFt?=
 =?utf-8?B?THEwTW8wTXhtWFdHU1ZDZnBKU1NReTc3VTFkTVF4bm05UU1BSUcyRmxJWUF5?=
 =?utf-8?B?Q2lhU1o0emsvNXExSXJLYkM3a1lyNEx1enF6K3h3SFhXQzVHbnBnekhDMlh6?=
 =?utf-8?B?c1NEbG9CTFNtdjd5Skp6MTg0U0YrWW9lc0lQWm04OGtoeDgwWVJIOW1tVHBT?=
 =?utf-8?B?SnFjbFBxczBzK05wQS80K0xldjdsLzZKeGpuMmJERUlGTHZkTWNBUm1vbnRU?=
 =?utf-8?B?alJjOUdmZEFiNlY2R2c5M1Q1S2wybUoxSmo1SGx4VzVZeVQveTFxRE4rVEFP?=
 =?utf-8?B?WndQM0ZYcnFHVE85Z1lnRnJEUFFkVWM3ckNpSjV6NXlZMmVJN3VLVXNEVVo4?=
 =?utf-8?B?dXlqbTB6a28wRFp4dWtOZHc4MURHSnJKYTUvaElzTk13b2s1UHhxKzdQNXl0?=
 =?utf-8?B?NENhNTFkQVkvYm82Vkt1RUlNZG5vVmdsUk1QZUt5SGtVb3d1TmlURnVrR2xz?=
 =?utf-8?B?ZXVrUmJvWEsxbTRUVTFKZk1ST3lGOG1IUGUwcjl2UTg3dUFtd3dSc3ZQVXRQ?=
 =?utf-8?B?ckpOWUxVVVNxZGpPKzR1eUNsdzZtVy9uR2dDUEh0SElNUkJSKzBDNFVwTFdv?=
 =?utf-8?B?UHozcDUxZGlGR05qeTVJYm9FN0pnNE1rYTVEck9CRW16Y2ZJK1dXdnhZbE13?=
 =?utf-8?B?NFhSUUpYZmdJSFJEOW1LR25kZkE1Tktwb0lWejlnYitDcUR6UzN5bng2UUNp?=
 =?utf-8?B?OU12czRteWg5cDBER3RYUm81NUFQMFpqSE5rL2EzS0ZTdUtwcFRoYWRGRnBU?=
 =?utf-8?B?MU93Z1A1ci9pd2VqVS9WR2JxakRJVVZtWU96R2JZSjRlaTMwQnY5VmVHRjND?=
 =?utf-8?B?RW04cTRaTWRLdUFhdXg3UnhCeXl0NndBNjR0SHo5K3N0TDRabzJXVUlITmxz?=
 =?utf-8?B?U2ZIbjFmTVJlNDJLUm51QW0rNlZmY1NKWTFCbjdLNHBnSlVyM2JyVTBxVWVY?=
 =?utf-8?B?NUlKTDZwWjg0alZ6NzcrVkN1M1I4dlViTzY3S2tBSnAzRnlvbnhoWXZ3blJ2?=
 =?utf-8?B?QkNVQVlzQTJGL3djV0hvbTcwSkNoM2lCMGxaWlhWL2g0RGJSc04yVjRaMTlJ?=
 =?utf-8?B?ZThDQUxvVURvNEVad2FYdk1zWkdsRDdhSEFpcXdXVkoxbmxuMDBhRC9SNHJW?=
 =?utf-8?B?UDU3ZGJLampBNVU5a3RUTFBvbWREVE5hSS9yTkFQa2l1VkoxNFR4SmgxVjcy?=
 =?utf-8?B?T2NGSzFWQ1dNY2FWTU9GSTgzN3dyK2wyQkZJdTgyTGt2T1dwOHJRUitSazNu?=
 =?utf-8?B?ckNyTnAvQllnUVBjNzlZaTZSL29GTG81VXlaaW9vNDRwcWowQmF1RldiZGxp?=
 =?utf-8?B?dUJ0T0lIbXk5YzNXN0F0dlBUdWx6NTNuNC81Y0dlb0lyY0lzbW9jV2NFY3VG?=
 =?utf-8?B?UmxqbnFGMUpwdnlySVMzUEFQbVZNcmlLd2Q4VHRaVnBRZFkrdThuVWNZVnUy?=
 =?utf-8?B?dHEwbFlNbFpQR0FadmhoL09nenM1dFRlOEUrTGxaclBMQkczN3lqcWpWUjhy?=
 =?utf-8?B?SExzYy9xdWFVVVBESGdzSDFkQTdPMlF3d1p4RXRjY3JyU0NMUGVRSjVzNWNR?=
 =?utf-8?B?bjI1VysxeVY2MlZzREV1elJORWQ2a2N3cjQzcjZab1VmZUpzdkIzbzd4N1dS?=
 =?utf-8?B?eEQ3ZUU1WFFGdGRqdDhqVkVmTmhnZUw4Nng0Y3ZVY002Z2lUcVBVT2F0ZkpS?=
 =?utf-8?B?eTlCVmtRTTE5djhjTGtwbzB1REd3YkZSL29EcnpjOEJKeXVFZk8zRmpJelRL?=
 =?utf-8?B?d0kzUlB0eGowaVhMdms2ZnR1VG9BY3BrUjM5VnM5TTBFOUpRd29qeWpUSitM?=
 =?utf-8?B?Qm1YMnZkZTJXUHAxVml5MzlWSHJSUjludXVxQktHcmhMOGt2QTRJVldEOUIv?=
 =?utf-8?B?enI2M3FmL2V4dHE3bGo5RUtxRG9lblZhdWNDb2xkSUJJeTdFOVJmdkNZYThD?=
 =?utf-8?Q?UelwsZvHvJ0BxObTdEH4x+SJP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91baf02a-ab0d-43d1-22df-08dbb2900629
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 06:26:25.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84zB2265AKemvGCXrNFUolAq4Uidq1ezFWZeLqh3HVeHlCAqdrVDzX8GOwMcCeLeshJmeHVOPaMEHmBbyYlmwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On 09.09.2023 00:05, Shawn Anastasio wrote:
> On 9/5/23 10:52 AM, Jan Beulich wrote:
>> On 01.09.2023 20:25, Shawn Anastasio wrote:
>>> @@ -13,6 +28,237 @@
>>>  #define __pa(x)             (virt_to_maddr(x))
>>>  #define __va(x)             (maddr_to_virt(x))
>>>
>>> -void setup_initial_pagetables(void);
>>> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
>>> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
>>> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
>>> +
>>> +/* Convert between Xen-heap virtual addresses and page-info structures. */
>>> +static inline struct page_info *virt_to_page(const void *v)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +    return NULL;
>>> +}
>>> +
>>> +/*
>>> + * We define non-underscored wrappers for above conversion functions.
>>> + * These are overriden in various source files while underscored version
>>> + * remain intact.
>>> + */
>>> +#define virt_to_mfn(va)     __virt_to_mfn(va)
>>> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>
>> Is the comment really applicable? The only non-arch-specific file still
>> doing so is xenoprof.c, and I'm not sure you mean to support xenoprof
>> on PPC. PPC-specific files would better be introduced in a type-safe way
>> right from the beginning.
>>
> 
> To be clear, you're suggesting that I define virt_to_mfn and mfn_to_virt
> to operate on the type-safe mfn_t wrapper? When doing this,
> xen/include/xen/domain_page.h:63 fails to build, since it seems to
> assume that these macros do not use the type-safe mfn_t:
> 
>   static inline void *map_domain_page_global(mfn_t mfn)
>   {
>       return mfn_to_virt(mfn_x(mfn));
>   }

Oh, I see. That's a result of (at least) 41c48004d1d8 ("xen/mm: Use
__virt_to_mfn in map_domain_page instead of virt_to_mfn") not going far
enough and f46b6197344f ("xen: Convert page_to_mfn and mfn_to_page to
use typesafe MFN") not properly doing the intended conversion. Let me
(try to) make a patch, once again ...

> If the comment is no longer accurate I can drop it, but there definitely
> seems to be an assumption in the codebase that these macros operate on
> raw unsigned longs rather than mfn_t.

Well, the comment is new (in PPC), so it cannot really be "no longer
accurate". It (sadly) still is accurate in Arm, but I was hoping we
would be able to do better in new ports.

Jan

