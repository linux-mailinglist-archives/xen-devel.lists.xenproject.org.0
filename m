Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C364A3DC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 15:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459704.717467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kH9-0005RY-Re; Mon, 12 Dec 2022 14:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459704.717467; Mon, 12 Dec 2022 14:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kH9-0005P8-Ot; Mon, 12 Dec 2022 14:59:27 +0000
Received: by outflank-mailman (input) for mailman id 459704;
 Mon, 12 Dec 2022 14:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4kH8-0005P2-01
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 14:59:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 910aaa75-7a2d-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 15:59:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 14:59:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 14:59:22 +0000
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
X-Inumbo-ID: 910aaa75-7a2d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzH+wk+tOMkHL1liSZoHizLKuSvqVbdAU8Wyv4pNggws2a1gJDfc9Kx6boyQZTYdJCD4wlLe1XbghHtCyekj3RP/yUZ8kc1pn0ggoX4n98hdc6/pBC1fSXgGLZge+K9/ec29K2Gl8GnvU8S4ZCZlKAplhlcBh3YUzQTnqGB47u1SxXnFwmJWx3gk7XJupwURaTrFwuCWR/VQVYqZAjIz73ERYTWE9JTn8USWq01M217i056lsauU+WwRvwwhF0eQBlhy021xdPPxwBFBqMIaGB/Se7PsZ6NVkcyZoMU13EUZ7bf6ac+C9kgxKS72NY5/E2iweuhhqPrmRp9xkczshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNaOSlp0VejONGrUc0uu5nr4lCDjIMe0PJVIL3X+d0Y=;
 b=IoB+uf91O+kc2uwcHO5LDsrTuNWuzV52RMbjGvm/ISm34O74RXYOLfLo/3HHwBpFjKMQzfDy1r6IOsqXAvkNGTRv/eG/l71ThQmZlf6Xq35GgQyUAQ+xHOlCHlewhuvY4NpAB98IQ3Z/MyBcAooVSQAgMkBf/thjxMDTl4RXutdUYY5j5rkVJ0U018aHxB2bW0Pg5lzBg6RoVTOB2gWqTFaAvyb/0sa6jlx9T22GajEiPQhVgYT7t3kG2TardZFum4MFrv7N+FFLSWIRAz421geMyScpJ8VA2zGTy/dsdGwtlNJL0IshrJ/oDKF9ibIun7NloKAwJBN2AcphVuJSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNaOSlp0VejONGrUc0uu5nr4lCDjIMe0PJVIL3X+d0Y=;
 b=J7Fffdg8S2MBb40bk3Ke1TsM8AS255XKWO0b5w4RaATGFA9/530YFeMtLKjheJwWMisa8Ho6lOPofeL6alCHX3kF0e77KBUkgx+KYjei2K0LhmlZ+SIUkbCnUdWzqwYCZrFc+EcbRS/j/l0+h4hhllYiiLBPOaCAI17ad0OSOyecKK1NxU1g2pB1+GkXPOJELx23dLA91FIisAIw8y4phoy5FGF3zoBAM1qKrj0Mde7UQonehO5sXpWlEpBykTl9ig/zWZA+2BgclNAxtoRw4kGbv0xQbG07aMSx7UIF1mIXwOhIqVT1yZ+K1vLKxSyRx80la1/TKB0i+IOf7rm9AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b610b461-4c77-66da-c930-10def3138e5d@suse.com>
Date: Mon, 12 Dec 2022 15:59:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
 <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
 <CAPRVcuccXaLNX3suy1t+xD_kptnV2yLxoCN_193PF6Gj_FBD1w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAPRVcuccXaLNX3suy1t+xD_kptnV2yLxoCN_193PF6Gj_FBD1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: a49ee80f-4d6e-4999-f4e3-08dadc5173f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ukkyphmj6aiY1MZJj42wQVKyA5dXRK3WJaHSfzV73tbYIG4NrC2g87TENnyej44OcmtlhOWe5GdrB+Cn+mSBfz9orXP6PtGz/VrxUCw+G84r/Eny7tVOpFC/PbICSpsj2mxYCB57F0H/inwj+SDkrLSQ0T8xKUk45jnTu+wk7dBd/YyzQXojuyJ2BwqBTdEbIcoX8D3mMbjSTOU1WEH8wFtZkw2UPu765YzGIs2BE/cfDWVp/tzEzDI5JDHaM6q5wYqhfdHqfR6CF/gad3exJ3RlBbdBW1xXGDobTSxeDJ3UK/fZ0p9d8ofPX6LGh3lmgO4WbyBS6Bfuk0eewVLLjisiKmfENPqaxrxAbVBAeZoNObeVSGnwBjUpKmTIgLXGwfd1EXlBAwuND+O07urmQHFqU9MBfRiOwEexmWaLnSJD0YxK/kc9G+7LxQHll3l/cWLtBj765ik4NOYkRDrkItD3YA8Bz1geL4g/E4YUh37wgXN3Rk0baseG7FG8XTRE3mI8lM4d3HbDB7tUgMf5CjKAs0UDy9b9w6GITVPYD35uRdjFrd5PR0FO55L4PNhkwHdW3kfE8naJvCIspWJ89cRzqi6Q/0VBSP9raBnX5hCiPUJmvM+zVwK+qDT6Anl5qp8IIrvF/QZUQ3zNHAjRZcK3Ul6HSYtEHUleMLfSQdrRY6ueiRX9u+3Px4gOkkFirDkQEi0pi+s+aSQ+sLa+OYsp3Prxz4R6NbyOWytxZyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39850400004)(451199015)(36756003)(41300700001)(5660300002)(8936002)(2616005)(66556008)(66476007)(66946007)(186003)(4326008)(8676002)(6506007)(6486002)(38100700002)(83380400001)(86362001)(53546011)(31696002)(26005)(54906003)(6512007)(6916009)(316002)(478600001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0VhVkNxNTc3YmlXelNVZHFVZXdaS2hMYjEwbThrK3hRREx5RmU4djJmazZG?=
 =?utf-8?B?b3lCRGYvQmd5R1BQZ1ptVDk0Vitvem0vZWFGYW42SktDZHVLd010aSt1UUgy?=
 =?utf-8?B?TUdEQXJnODFLaGJNaWN0eGRCS2NFUEhUVnRhbis0VnNrbFQ3Rk1lanhSSGpa?=
 =?utf-8?B?ckp2R0RwLzE3amtaTVcvaHhIZWVNV3drWU1XWTFwV0pjRnVnZVZnSVJSUDRR?=
 =?utf-8?B?OUhueHV4TWl6VmVCdURQbm9sQnFXeHlhUzF3N1BWU0JjUHZoZzdITHpEckxQ?=
 =?utf-8?B?djhlUVZSZS9GR2Izb2RzUW4yMGVKMDRqQVdUbnhUVFhJd01mNHlYdDBjelJ2?=
 =?utf-8?B?ZWN6dlZpUHA5cm9FTDJUeTdMSDdjMUROSHdDOWIzWjhvWGdsUzR4NFAxcDdw?=
 =?utf-8?B?aWp1U2cyM2d5RXZMQ3l2UlFrL0l4ekUrRko3K3dyV21sbFBkeUFQU2s3RDRH?=
 =?utf-8?B?K0F5enlhTWNSNzdMdzY4TGt3aFdNNXQ2VURjeWp3dGlUWjJLdUdrbGo4QnlZ?=
 =?utf-8?B?Q2o5UFdqVjZGTlBYR2U3MnBtcmFrUStlQzZQOXY1dXh1ZnVlZWd0eFE4NjdY?=
 =?utf-8?B?ckNISzcxcVhIdnF3ZDc3dlhaMCtVcFY1dTBVekYrUkc0WGwyNnJCRUNETTQ2?=
 =?utf-8?B?ZGQzU1oxV3k5WGVUTE1Fb0FqOWl3KzAvT1YzQndzTnhqbmU3ek5mRFN5dUdV?=
 =?utf-8?B?KzhNcXFkME81enBkWFM1NnNWQlVtRnRZcVRNNG1TOHF6SHl2eGdpVytTVUdt?=
 =?utf-8?B?ckgyZDFSMWp4RXMvRnlqa2VsM2VEbTJ5NHM2cFEvZE1Zbng0eVZPNk5ZQnh4?=
 =?utf-8?B?cHFaYkNtNmRGRDRUbGx0VHhxOFk2SzFBYmJZWTJTZk5SVWJSZzF3REpvbEZ1?=
 =?utf-8?B?SDlGYUFTM1J0RlllRVNtK1llTGh0VUVsV3hDR29hRFJBSjlaSUFxMVV2QUtT?=
 =?utf-8?B?NkRZTTZoekJUcWZBbHZVakFGaUdBYTF2ZWxpSnRDQlFCQU5MSytLL09idm03?=
 =?utf-8?B?VmxEMkFZeUt0eVVMNVFMaFBaY3dKQlVwSTJBbGpMekF0WmI2VFhHWExEeVZC?=
 =?utf-8?B?UnllSmUzSW01NVFqQm1SMGZxUEMxNDE5YjVEUXNqNHFYZDJxelFKNjNkcGNT?=
 =?utf-8?B?ZWpYeW1ucG5jWlBOa2Qzb2ZCVXVtQmh4VFJnTTZXUVJ6eTZUaU9obE84bUw2?=
 =?utf-8?B?c0JsYUFoSnNNK01pYk5GZ1hKYkhMdXVOemFMaTlKcE9qazdhNERyT3ZvRHlO?=
 =?utf-8?B?WmUzOEVjR2NvdUlpSVg0Q0NDWUVrbW9OUkFBVEU2Vi9VVUJmVHk5dVVYRWFR?=
 =?utf-8?B?b3lPVTFQZ3JuY2ZHeWd1UXdEdVUzQ0tjcTdhb0tNUVNUR0pFZU5EZHV3STI1?=
 =?utf-8?B?VUhHTC95Y3pRY0xtaUpSb3A4Q3V2NEhnUHpHMkNXWDVFc2NQVGtMbkV4ZDY5?=
 =?utf-8?B?RnlYNW1QSE1yM05HN2dBWU9sZDFBSmlXMkRRcVpUOEtmLzNJWjl2TnpRV1Rx?=
 =?utf-8?B?L2JMdDZ5REx1MTVaSzJxbE4zeG1yVGpyckVnZTBCU2FISm8yZTNZTmFEcWVL?=
 =?utf-8?B?NFA3bkdMMFB0Z3JZd3F6OUNPdHRIeG53WFNVSmtpWkhnODBvTnRjNlprWFZp?=
 =?utf-8?B?Y1hHbUFha1Y4OEdzQVFKT2tUY3BxdnlBRHBKSjUyVW1QMHc5ZVRUaHFuQ1k4?=
 =?utf-8?B?MUhQa3owazByelJaV1ZNN2ZMV3V2VDdpcVE2M1JUYzlqeU13RTdTMkJ6aWRz?=
 =?utf-8?B?VlhQR1JTeW5UeFB2ZGRwOFA4WmRqMGUzL1Bma1V2THE2WTVMVHQ2NFh5Ti96?=
 =?utf-8?B?MzBBTmRTRnpZWEc1NUJEdWZGMHhHSVJheXAvRUJicWt4ZDRyb21keEdFekVI?=
 =?utf-8?B?SVNsdVdpN211TE1HWjVvVW9BUU1ubmMvUEo3cmZ6VEg5Q1lNdmVqUHB3cDdP?=
 =?utf-8?B?bitUZGxlQTR5WEI2Q2NDRjh2V0lDSmpXREsxNzFnbDBqZE0wTVJzeFBpWCtE?=
 =?utf-8?B?R1o3Y2krMGJ5TzQ3Mno5WVpJREc1WndMM3pOaDNxVks5b0FMNW9ibEtadDVR?=
 =?utf-8?B?cHhTaXlxUk4vaVNmNHhsdjIwdk1YbUlISWxDdUxza3hSaDZBMTBaTEp3L25k?=
 =?utf-8?Q?PNPRjFAWpQUGhk6Q3nCvPL5pv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49ee80f-4d6e-4999-f4e3-08dadc5173f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:59:22.3425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVppje++46V6B83dQi09qNyxIIlYwD+0DRi70rpA2F/5HhiqV/FMa08EievrjNqx8jf6QBlqtkeaFc1zc7llbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

On 12.12.2022 15:27, Sergey Dyasli wrote:
> On Thu, Dec 8, 2022 at 3:34 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.12.2022 14:59, Andrew Cooper wrote:
>>> On 08/12/2022 13:26, Sergey Dyasli wrote:
>>>> @@ -240,20 +240,20 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
>>>>   * patch is found and an error occurs during the parsing process. Otherwise
>>>>   * return NULL.
>>>>   */
>>>> -static struct microcode_patch *parse_blob(const char *buf, size_t len)
>>>> +static const struct microcode_patch *parse_blob(const char *buf, size_t len)
>>>>  {
>>>>      alternative_vcall(ucode_ops.collect_cpu_info);
>>>>
>>>> -    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
>>>> +    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
>>>>  }
>>>>
>>>> -static void microcode_free_patch(struct microcode_patch *patch)
>>>> +static void microcode_free_patch(const struct microcode_patch *patch)
>>>>  {
>>>> -    xfree(patch);
>>>> +    xfree((void *)patch);
>>>
>>> This hunk demonstrates why the hook wants to return a non-const
>>> pointer.  Keeping it non-const will shrink this patch quite a bit.
>>
>> Alternatively it demonstrates why xfree() should take const void *,
>> just like e.g. unmap_domain_page() or vunmap() already do. We've
>> talked about this before, and the argument hasn't changed: Neither
>> unmapping nor freeing really alters the contents of the pointed to
>> area from the perspective of the caller, as the contents simply
>> disappears altogether.
> 
> Despite my love of const, const correctness in C is quite a pain. I've
> tried to make xfree() take a const pointer but then issues began with
> add/strip_padding() functions and I couldn't overcome those without
> further (void *) casts which just takes the problem to a different
> layer.

There is exactly one such cast needed according to my attempt, and that's
in an internal (static) helper function. See below (and feel free to use).

Jan

mm: make a couple of freeing functions take const void*

freeing functions, from the perspective of their callers, don't alter
contents of the freed block; the block simply disappears. Plus it is not
uncommon that some piece of memory is allocated, filled, and henceforth
supposed to only be read from. In such cases, with the parameters of the
freeing functions not being pointer-to-const, callers have to either
omit the use of const where it would be indicated or add risky casts.

The goal being to make xfree() fit the intended pattern, alter other
functions at the same time to limit the number of casts needed to just
one. strip_padding() necessarily has to have a such a cast, as it's
effectively strchr()- or memchr()-like: Input may be pointer-to-const,
bot for its output to also be usable when the input isn't, const needs
to be cast away. Note that the risk with such a cast is quite a bit
lower when it's an internal (static) function wich is affected.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2231,7 +2231,7 @@ void *alloc_xenheap_pages(unsigned int o
 }
 
 
-void free_xenheap_pages(void *v, unsigned int order)
+void free_xenheap_pages(const void *v, unsigned int order)
 {
     ASSERT_ALLOC_CONTEXT();
 
@@ -2279,7 +2279,7 @@ void *alloc_xenheap_pages(unsigned int o
     return page_to_virt(pg);
 }
 
-void free_xenheap_pages(void *v, unsigned int order)
+void free_xenheap_pages(const void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -453,7 +453,7 @@ void *xmem_pool_alloc(unsigned long size
     return NULL;
 }
 
-void xmem_pool_free(void *ptr, struct xmem_pool *pool)
+void xmem_pool_free(const void *ptr, struct xmem_pool *pool)
 {
     struct bhdr *b, *tmp_b;
     int fl = 0, sl = 0;
@@ -563,7 +563,7 @@ static void tlsf_init(void)
  * xmalloc()
  */
 
-static void *strip_padding(void *p)
+static void *strip_padding(const void *p)
 {
     const struct bhdr *b = p - BHDR_OVERHEAD;
 
@@ -574,7 +574,7 @@ static void *strip_padding(void *p)
         ASSERT(!(b->size & FREE_BLOCK));
     }
 
-    return p;
+    return (void *)p;
 }
 
 static void *add_padding(void *p, unsigned long align)
@@ -699,7 +699,7 @@ void *_xrealloc(void *ptr, unsigned long
     return p;
 }
 
-void xfree(void *p)
+void xfree(const void *p)
 {
     ASSERT_ALLOC_CONTEXT();
 
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -73,7 +73,7 @@ void end_boot_allocator(void);
 void init_xenheap_pages(paddr_t ps, paddr_t pe);
 void xenheap_max_mfn(unsigned long mfn);
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags);
-void free_xenheap_pages(void *v, unsigned int order);
+void free_xenheap_pages(const void *v, unsigned int order);
 bool scrub_free_pages(void);
 #define alloc_xenheap_page() (alloc_xenheap_pages(0,0))
 #define free_xenheap_page(v) (free_xenheap_pages(v,0))
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -63,7 +63,7 @@
     })
 
 /* Free any of the above. */
-extern void xfree(void *);
+extern void xfree(const void *);
 
 /* Free an allocation, and zero the pointer to it. */
 #define XFREE(p) do { \
@@ -148,7 +148,7 @@ int xmem_pool_maxalloc(struct xmem_pool
  * @ptr: address of memory to be freed
  * @mem_pool: pool to free from
  */
-void xmem_pool_free(void *ptr, struct xmem_pool *pool);
+void xmem_pool_free(const void *ptr, struct xmem_pool *pool);
 
 /**
  * xmem_pool_get_used_size - get memory currently used by given pool


