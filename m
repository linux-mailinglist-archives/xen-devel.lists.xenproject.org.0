Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD960106D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 15:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424404.671792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQRb-0001Qq-Es; Mon, 17 Oct 2022 13:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424404.671792; Mon, 17 Oct 2022 13:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQRb-0001P2-C1; Mon, 17 Oct 2022 13:46:15 +0000
Received: by outflank-mailman (input) for mailman id 424404;
 Mon, 17 Oct 2022 13:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okQRZ-0001Ow-H8
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 13:46:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2067.outbound.protection.outlook.com [40.107.105.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fd4d781-4e22-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 15:46:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 17 Oct
 2022 13:46:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 13:46:09 +0000
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
X-Inumbo-ID: 0fd4d781-4e22-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V29v2/F5Kxrasr2fVeo1VdOunl+S7QhYK8ALKZnjzHi5l0VgR8376RGIWpG+uTB5zmIoOhMeR/uPi4TxdJPgvcT+lWCziHf7g8O24hPAiO4q0FJsAXoZgH64OoJPUsMsz5vnZhvLD42SC6CW44YO89vyYgU9zmnog+asmPnb8ULxIp8TRbLdHzok/9E569xGFwr6H3u9zsEOAh4opiqLqn+TIQmRyXOhq6LNDs42pspdElnilxuXT0YiJZFUZ12yRn6JU6QswG+jhHL2mLwG3DvwwAVITPO21xkaOG+4sPN0JQMBTO8hKdnsjRM04z4yFP9XxdqqiYAGhw42YTK8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10dkC5RrwW9w0NQDW4sC5vJnO/FKco350v19QrmcmD4=;
 b=jviU1BNNv3yzN88cuRQXJOtakwGdBYYFMUFSdKhnuh/qgWr7HRMNlIaOP24VObDrvXZzL0ogK9pb8o+G+1WP9BSYrD++SM376GgwYFPMVJbcm9z5v9c5tYGYk4MNud87PAM8TL8xERg4XWqjDC0WiidIJBuAmmjDahPYE1aMkCv2//R25115/LDfbmT99CLwk9FmG3e7QlQIN9w1f6l4pnrWpcBf3rv7q2ARN8ZDGOFANeTfs1tHMNNl5FzyBiR7GAqRSTs+dB+LFTHd09uwxbeqPeRuD4VHQDwYBLIthbLSB5uzbIRPC2E9J+1eVOPGBwbpx1EEkG68rmBxxM6KeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10dkC5RrwW9w0NQDW4sC5vJnO/FKco350v19QrmcmD4=;
 b=XlXlSRwEckePU5LUuAGGvIE2ya+YkmpfXi7eh94BX8TXZUR8Jz7QXl9zKC2pUIfACKREaKuV1puvlnQdWSmJlZ+rdLB+V3FK0chdvgzQ6Sb3JMerf/twdsCOnZrDUlkrLhUqTD9uvSvpPsSl7SVj8QodzK9JqzMNFudr1ZAHVxRPpe+Jk9xwf0NJTlbUuhXuiw1YtwNgLH2rqr923lQpGduxigXvTHT0UxPOi6jwZF6SNSIfEF3+Q9fBzAYw53vPWXO9Sp2HZp+ltmu3Je69GD8k+/E8x0Ypw+UTR3tLcXLg2QkssiTLbYObEb8yUsC5xsVMqx8E4ZPsfRagbBAntA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc706330-d014-0fd6-4e99-27773f1d78af@suse.com>
Date: Mon, 17 Oct 2022 15:46:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
 <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
 <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
 <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 96653702-cbaf-40ec-a59b-08dab045f296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bo3ptLWG9Ie2RctyknGWzZkddjVFaRrS1KCd599hJAuTb6akxCWcNw77mBACqZazJ/7FBdoIA+BZ5Qm99B6ZuvTI+L3o/dA+/0ko83Gnknvgdg8+aVHeY0yITuN2wbHmj2HHJRPFXiQDzY6YqwNLgTLLmMtD8IWQEJGDY14ZwmFzBrvDlDccX30SxcUGznDfH9kNp6LlcYObzMIPRfJJPmC9wyKsjoVfbcly2+x8VJq1PZGVittN0VlAIlbnw9WFrwGCmcT1GsLQsn5D79ZNdvniJhIMFAIlJY53S/+cx2ErLfQBTQhopxpbf11lLQ7FuPiWi2VZcPctG8BfdmDwSWYQJJ94RD677f/VXu8nZWCv76klPZ0Hr61GUSfC+IaiU01CWEDiihf7BHNLoEfWZRC/gQvhAGcsNPiGDdx6WeFAw+OBk9u4OSDJdyH3mddh1/uOMuzwoiePg+SPZ5iAj2RGR8MBqiaI/X7R99+Gj5Nl/rgpowk1DlEV/+xVO/MspgK7d328yEolCgrHL3nAjGs18XEwlqtSSL7wPU6Ati7GPJNIVP58lEJ/8+c0NCigKmp4EBz/PrGEnJMmR1xxomcwSiE9qKBCBEFCk7zhZUIVN4D0oa7IpUc++zIaCLyn6jS883UCggKzu+H838bSQAZTfn2Gbj2ClpDgfUjo4d1sS1PEb6QXOwjtg7YLC7bXJrPD/0pOIOswfIAS78B+8Tlj/3ujAwuWTpU8PkCRxD9D3MMnEYqHdMKIgOGN6jlFNdnb6xb9X4tICNiK7aaipUPRN3HYIDXmp1VUJkLj4Yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(83380400001)(4326008)(41300700001)(2616005)(31696002)(186003)(316002)(5660300002)(38100700002)(2906002)(66476007)(6506007)(54906003)(53546011)(478600001)(6486002)(8676002)(26005)(8936002)(6512007)(7416002)(66946007)(66556008)(6916009)(36756003)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDl5Q1NwS0FpUVJ5aXgvTVhCQlFidEEzbDRHWEZwNFdmQURBUVc0MUlLaWRr?=
 =?utf-8?B?QkpyR0ZyYWFpaS9Bc3hZTVREaDNNdWtxWkxySEJ3elFvY2FjT0V0SkpoVWhn?=
 =?utf-8?B?UWFoV29oVjBlaGVadlllS0xvM1Jhcm8wV0pWd3FWUkl3NmpKNGNVM3cwd3Bo?=
 =?utf-8?B?TS9ZcEVsOHIwR3lySnJaSDZuSFZCUzFWRE1paGhXdnNoZFhrNzJGWjgwRHRV?=
 =?utf-8?B?aEgwNDkzL3lWUzhOczArL2Z6N2lnQUFUdzN6WERjdjNRUk9oQUVJeHU5akM3?=
 =?utf-8?B?eFZGcUFWdzlsM3d4RjZEckpUc2lQbXU0bGR6eWJLOWpRTlFuNitqRkdJUVpr?=
 =?utf-8?B?WW0zelFLY2FRN1hNTFlvb0NBRXJRWC9KdUxhVktyQ3k2S0U3SnczRjRYUEtF?=
 =?utf-8?B?RVQ3M2VSeTdKb002eldKVXFqb3IvN2hTUWlOb0tlOHV2MUZEMWtTSGNnTTg1?=
 =?utf-8?B?THZjcG5YOGczQjgxRWhQTVFKeERUTHdmcnlLQWEyajQ0OVIvTFJGMktFK2pO?=
 =?utf-8?B?bGtZblI1M3R2UURGYjRBcU9OM3M4RUgrOWdRYnVFZGJPcTBTWUFPY05uQThV?=
 =?utf-8?B?S2ZjdlJGS2tKWFcrZVM5c3ZVanZvUGpuYytpMTV5MFpzeWtUZ1BWbnJqMGl0?=
 =?utf-8?B?VWNtTkxqYURNbEZUdTMwWC9MWVJhM0tXbWFyUzdWM20ra2xlWHZFWTMwczhw?=
 =?utf-8?B?SGtoeEVuS2RRY2w5Mmx5QnYyMlJMTXpSOFNIKzdoVmNCbUR3N2FuWS9Vd0Ry?=
 =?utf-8?B?V2xSamtjM1h2TnU1TENFc1ovdDlvRWZIVVF3b3FWR3F3clJhQzZGajNuc3N4?=
 =?utf-8?B?SzY1TXNNN0VqcTc3TU9ROHNmQUI4SEFjbFNBWmNjTHVmS24xQ3RhVHdxbnJK?=
 =?utf-8?B?eVJGNnNxdEZFM01uNi9vekhVRHptRGt2eGIrd09rWGZRaHZuclRodnJYaDMv?=
 =?utf-8?B?MzFCV2sxdDlYc1pEWDlCSmpmQmRyZGh2aVp5RUs5RU93UWxkVXVhaWwzaW5P?=
 =?utf-8?B?TkYzZ2JneEQxRGxlUmhnMEFtTGJJSVJWRnEydVY5M0xET0J2ZnlGRTlWS2Rx?=
 =?utf-8?B?d1BmRlpyZ0tOcnhHY2FBTXo1YThQc2dqdURpZjY4ekdhYUd2STAwSWlzVUtx?=
 =?utf-8?B?Z1hzNkVzQjM4R1pWelRieHRwRG9pdlNTQ0lDejV6enhacDl0b2pFSzM1MmFJ?=
 =?utf-8?B?dXJtUVNacG51bFpSYUk0bkRwUGhzRG4yR3dmVXlReVd4RXR4UGZnc0JjN2R6?=
 =?utf-8?B?a1pLdll3cklaMXJsT2hHbnZ5V1pWbHNOd01INEIyaDFLVHRUWWRqNEF2dmZ3?=
 =?utf-8?B?bVlXRVFiVEx5S2F2aXYwZGNUWWNFVlk1N2dvWmZFc3FqMHdCZENDTzE4aWlk?=
 =?utf-8?B?dGNaNEt4V1F6aGRKd01EelNGU0xIVU9GVlBGcnVZRnl5RE1ZUFFxWUZrcXpv?=
 =?utf-8?B?bi9qaTFGQWZYcjR5OVQ3N1NCMUdUQXRrdm5TMFpkZGQrZDhvUW1NZzRRQ29x?=
 =?utf-8?B?M3JzcDkzdGgvMmVOaE9STVdRQkc3K1NxcExQalIzRHNLRDA4akt2OUtIdVlt?=
 =?utf-8?B?bEJzZ1hqOWZOeEZuWCszeHVUaDFDZjlzaEZRU0hsM1lSa1ZpTlhkWkplV3BY?=
 =?utf-8?B?anNieWJDOXF2Qmh3a3FNWVkrbmdMVE42OE5adnNNOXFOVnIzTTB4SjFwbjBS?=
 =?utf-8?B?dm9YMGlPZjFqQXFNamV4cmkweEtNbnlxQlFjaUg0Vmc0UTlIekdOaDF3U0lC?=
 =?utf-8?B?QXZEdXNhVVVxQzlMYk9vaHE3WkhVVlU2YVd0MmJKS2EybTJaQXRrbEVjLzM3?=
 =?utf-8?B?TjFKNnZVM3YxbkFGcmZyRGRTUkNKZmpnejgxRElBcEhtdGp0N08vdkIzeUhX?=
 =?utf-8?B?ZGVMOXM5MVoraTdUclFqR0JzS0p0MXMxM3ZqR0V5YlZaZ0JsMlRhd1BIWFdM?=
 =?utf-8?B?NUNGYnVRd29tb3NzS3pHbmJTbk1GaE1ERU5JcVlLUGVVRU5CYjN0OUhOeG91?=
 =?utf-8?B?djc4aHEzTGFkU0tOTVJLZkI3RGYxUDVJSllEekNUeEFUbms3b2t1Y2NtVGNp?=
 =?utf-8?B?czg3YkU3QzVpMFVPMHp0bkJRc2EzTVhTN2ZWbFZYRkV1MWRQajdaTjBST0hh?=
 =?utf-8?Q?bk/MPe9wbhI1U1AG9Nu2L9cJ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96653702-cbaf-40ec-a59b-08dab045f296
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 13:46:09.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ0MeAhOhibs251cmg/3k/LMtbrSF8bWbTDFIYtzsYc/HcHYUVb99aqi+olf8RgjJI5NJ1BLzde+KHj0g6ctXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581

On 11.10.2022 15:33, Julien Grall wrote:
> On 11/10/2022 14:28, Jan Beulich wrote:
>> On 11.10.2022 15:01, Julien Grall wrote:
>>> On 11/10/2022 12:59, Jan Beulich wrote:
>>>> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Rework Arm implementation to store grant table frame GFN
>>>>> in struct page_info directly instead of keeping it in
>>>>> standalone status/shared arrays. This patch is based on
>>>>> the assumption that a grant table page is a xenheap page.
>>>>>
>>>>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>>>>> to hold 52-bit/28-bit + extra bit value respectively. In order
>>>>> to not grow the size of struct page_info borrow the required
>>>>> amount of bits from type_info's count portion which current
>>>>> context won't suffer (currently only 1 bit is used on Arm).
>>>>
>>>> I'm afraid this isn't true: There's no requirement for a guest to pass
>>>> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
>>>> tries to obtain a reference for every vCPU.
>>>
>>> AFAIU, this would be a reference of the **count_info** not **type_info**
>>> (which BTW will never be incremented on Arm because we have no type
>>> support).
>>
>> I should have said "obtain a writable type reference".
> 
> Thanks for the clarification.
> 
>>
>>> The commit message is only referring to the 'type_info's count'. So...
>>>
>>>> With my adding of GFN
>>>> (really gaddr) based registration of the runstate area (already
>>>> looking towards 4.18) the maximum possible count is to further grow.
>>>
>>> ... I am not sure which problem you are referring too.
>>
>> Wow - a mere stub (but not inline) function to make the build happy.
>> Then why is the description talking about one bit that's needed on
>> Arm?
> 
> Because share_xen_page_with_guest() will always set the type info's 
> count to 1.
> 
> TBH I don't exactly know why we set it. I always assumed this was a 
> requirement for the common code but never checked.

So my first thought was that this type-ref handling all being no-ops
would be an issue with gnttab v2, but besides that not being security
supported on Arm the code also passes SHARE_rw (for a reason that
escapes me) when sharing the status pages.

It does however mean that Dom0 can map the trace buffers r/w (unless
there's some special code in Arm preventing that), despite them being
shared with SHARE_ro. Not a big problem considering all the power Dom0
has, but still against the intentions.

Jan

