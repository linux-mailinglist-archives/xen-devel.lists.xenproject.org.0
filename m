Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD015EAB62
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411995.655153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqGH-00081O-BB; Mon, 26 Sep 2022 15:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411995.655153; Mon, 26 Sep 2022 15:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqGH-0007xz-8M; Mon, 26 Sep 2022 15:43:13 +0000
Received: by outflank-mailman (input) for mailman id 411995;
 Mon, 26 Sep 2022 15:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocqGG-0007xt-6y
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:43:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec78cc33-3db1-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:43:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7823.eurprd04.prod.outlook.com (2603:10a6:102:c1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:43:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 15:43:09 +0000
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
X-Inumbo-ID: ec78cc33-3db1-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdwIO187jJ06U/9c6GPFEHStikVx1/wfhW4C1ZJkW2BXPJ/YBnsMnU9rVVbEwS1CgM7yqjkxjVgjtA51p0GMDl0W/eQh1bBgZlXBOEULKAh60tAStxqomWy+F3A6mIAcyeCcYgd9MlY0RWqvKq3E6Y7kCwz1aRugxBqg9LT7/NXD1vgCi7NYQ7igL1aJ1a7gU/zbcvfzS7smQrYd4Lbt4mGGPVX5QppIQs/2XoFi+58k6k7KggJ5LDKaTJQoTdOZ2dfjERbF2i7Qv4+9G+ByKJpXs/S0IERNKGxhs+j+rdAz5LQ0jCI1qxamaBabtOY+NPKc942pMJ0nY3kbKEgCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wLw02V4JwhQCt/QO7yeGhhN/aqVFrk/+3J/uoGXdoE=;
 b=DYLQrMlfxbjcs91uMcsgwpNJvCSg8BT7S2/QZcxXh4lLYuKyCpv86EEQJbZ6m0aNvSTO7826W1ZH1p6diodb5rbOyosiA4MqRhTgZj5omVCciawofnwdByXve7Bi1evyqcy7+4kN+ZO8rJd83TMB7Rzd/Rb9dQ6C8FGZP/PtQLhnfsZA7DB344PCJ6yW9DJ7e8CxWTyTWG3Av9YSEKcu2RkBlRy+CpjRidM/2H7TToNkc1XUTb+Tta5bituSEUgacDMWJALUopc4L3fJWkQOqwv+Mgi7YRjEwN6kXjEimXOdrKr13xyxbXXvP5fQ2spghF7kU2bpI2O3JLjWVqDwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wLw02V4JwhQCt/QO7yeGhhN/aqVFrk/+3J/uoGXdoE=;
 b=bJ5/Gsk5QWkQp2pNl5IW3D0Y+lUykmOI6OfyRNZEjFtM/0eXea9goPmEwI4jeYDasziRv4Iv0xl54ho91KEYAa4eGDThboTPry3MT18ztKnR9ofnfWAINP42Ah4w/qit8eVFDUniRVyUIcAsJYQliNwNpTpAS9BaezdMVAkU11J+kH2Syn/B2gxLZieL6TQc4d0QhcQVuQHZ5xfbRYGJwR+cypf4ppU6ccKCdUt0isXmAdgPrRUj0nIExL5I5IuaDK8iPuNZo1a59U+KYUvaLDZsK+1YNhv3Mp6TSayg88jEllpBGS/yYIQWHob53uYoESSKoQjdWljLsBCqGYLQDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81ce102f-3c60-5ccb-e641-03e6522e10bb@suse.com>
Date: Mon, 26 Sep 2022 17:43:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/ept: simplify detection of special pages for EMT
 calculation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220923105648.12587-1-roger.pau@citrix.com>
 <f8a8366f-e656-1628-63cd-d4e0b01dbf57@suse.com>
 <YzG2zx33xSLC4EaN@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzG2zx33xSLC4EaN@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab88a20-72a0-41c4-452d-08da9fd5cfd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6LF2og9+jyabpTy6ucksrW2rBIiovejJeStrf9S6gAjMCXDAo9lx5S3SJmH+QrupCkdTEN7yJyRMc9y9KXduzR97TUb4sbO6+VYXMUf+CfxEQTpbF5RdHGX2lw/zzB5aPwvlW+RM5D7k35HYPO3h3aGT/EMuFD8WoBsM8jaG0qqfwo2bKgnxWqmFFJfczBgHj283FM/DW1zGW6vxxO84trTi2IvaS/PJrziYcCDPK3/P0CCUBM9DPsLVEIoFYn5L1f3kSTFyEBTCcRtku9d0/zpfxR4Gd3GR89UDF37Oe89OH1g7iz0fLAQ1KO2cQm9wso2XZgIxITaIVQcUsZnKNX5emTa1LFYAqMFEV96+5d+0/cR2T7Emd7EDj9Gv/R9ecZPQOKtpwZJQ0VLn8iJjhHIlg3kGMSztIk7hlLq5kAnHrYyLWS54Thy1M7mxH9UYB34gHddd5QDYOqFfcvjpCAcds7ZMbxARsCiF2stp7/SrAmsDWK5IZd7jk65YVrqQvODTvAnMZ5L4emYHP2VYsJFdeN8tEzoohs15sFN9JyWN0lH3oOq7khQ8fl82K3RXtwvSDYWI77mQGRVT4w0MRoxgyjsnRXT0yjkGw75242C/N3/LUSthoX83HrkM+IpkRFcGa30Hl4fGEdPcFCtyt5Jbna6GlR9yn5fePhuOMg77e8qvqAM67J0H9/Yn9PBpDHwqxIHCtvL1auJZsTGzkm/a9is6C1ABkJgoxLcOW8G9Pb5ksTUqvB5QlD98MR/Qh8urSeyx4xSvYXFRYjlZfCmXiIUabVER4OcjaETrDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(5660300002)(6506007)(2906002)(478600001)(53546011)(26005)(6512007)(316002)(38100700002)(8936002)(6916009)(86362001)(36756003)(41300700001)(6486002)(66556008)(31696002)(66476007)(4326008)(54906003)(66946007)(8676002)(6666004)(2616005)(186003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJQaUMrL24zWjJEelRSVjM3ZWVKN0lJU0JiVG8wTTBtcE91SnFmT0hmOWwv?=
 =?utf-8?B?bW5GOGNoTXdDTWdpcCt5YzBobmlwb1FjTi9Za2FWV0t0MlladmRTU3ExaWZR?=
 =?utf-8?B?SHp4cFVZZDU3djFpVmM3ei81ZWxoTkc3aFZEWTljWFlkSEVpa1l5SWR5cUpR?=
 =?utf-8?B?SElqanNiazNuL254UElOSDB0Wk55ZXJzcnNBN1NvYzNhU3A3SzRQc0JCUmZL?=
 =?utf-8?B?RERzNlRKMHU1VG9YUjVMT1ZNZ1p5WHU5WVJMbzFrL29EejFQM2FSY2QyQUo1?=
 =?utf-8?B?UW1KRzFpdDh0Mk8xaTFxajlhSUZHbDdyZkxRb3FyZEIzeHhvblA2NUVvZ0s3?=
 =?utf-8?B?UjdzTFBVUytERTkvcHE4cXRPTGhsNjZTMUIvQzd0SXUwdmE0a1BQUk00TjhZ?=
 =?utf-8?B?Uy9ETHU0ajRCdlVTakM0Zyt3ZkxoLzN2NmRyVldLbzRGKzlCRHpsbVdPVU12?=
 =?utf-8?B?OCt1VGx3c3dIdnlYZGlnUnV6NStNYVBQMUlDYkJxbnk0eU1IZmtqWHVyS2NU?=
 =?utf-8?B?aUt6QnZWQUIzSllYcTVQNDVoNVpJUTN1M2QvcnB2aXhYWXFVaDlvNDkrQy9M?=
 =?utf-8?B?YmJtU1MrMjFHU2xZbDRjZzlSQks5azdKTDVqY2t4ZDFVUVFsbzRrZWRuWVYy?=
 =?utf-8?B?OWwvNGVqSm5MVVJuMzVQN0pkRFBDQ2tycnJhMno0bG9YRzYxQnB3YTlBRlpG?=
 =?utf-8?B?eHl3RXpIOENoSkF4Wm9DM3JnMllCTjVBVE8rbkc0MTFiWnFjNUhNVWRocHgv?=
 =?utf-8?B?Nkh1SFhFa0FyRkhieGU0disyNnltQVFUL2tpbzJxUU5kSUpFL2Z5QnJKSXpB?=
 =?utf-8?B?ZzRFWmxuZGtRQ24wRlFaMEdDNG0xb0xXRitDaU05WmoyVHgrK0lvTCtjeU9h?=
 =?utf-8?B?eGF3V0lDVXdZT1dFRGtIQnl6SnpKTkJHYmtna3ZuVXVSQTlkVGRkalp3VnEy?=
 =?utf-8?B?RDY3NERialEzZm1yMmFBU3F2bDZjbVAyUEFUQlU5Vk1zSlNXdGFjbEdMVGFL?=
 =?utf-8?B?Y3g2NGRoNjBoMW5jdDdKTGtqVG1DK1RWNi9sUnFvbGxQeUZvbVYxUTFVRjhQ?=
 =?utf-8?B?T1F1VUNqaXFjakg2dWJiQmpXdU5PRlFDT3RGa0owRjZoVDFUeHJreDZybUxZ?=
 =?utf-8?B?MDh3ZHpqczlhQkg2TXY3Mm9XejdjSmEwelZieTFnM1hVWUpIUyt5MUM3Q2gv?=
 =?utf-8?B?djVJOTdMdXNGaGVucGtzWWpDWUo1bEoxZU02OXpUOCtuZm1vVDdBeVZjSnBB?=
 =?utf-8?B?TCtGbzBJZ2pheld6aUV6VzBrSko0T3ZEeXU4YVltcW0ySDVZYWJKZWNVYnBD?=
 =?utf-8?B?UkRwS3VGQVhwL1M1azJ0Um1wNjI1dzU4cmg0Qm9rMEpuZkVzR2cwR0prZkkz?=
 =?utf-8?B?c2dxeWZkc1E0c1l3Y1RTZWkzbUZaMWEvQzNUdnFPUmFHYmlGYlFzejNWb3ZN?=
 =?utf-8?B?TkdwbzRUZWQ5bWxJT0Y4Y1NpOHY4TStkbDNXRW1YRnBObU9qdldiYWhxREow?=
 =?utf-8?B?ZStKL2ZSUmNUc0tObm9GT2VNZHJienNNK1hhT3ZEQnVtSlRNbEJnRkhaRmxi?=
 =?utf-8?B?TGVsdUVKRk50WGVnaGV2ZGpXMExENWFsNXFkbGlFMnRaNDRmWjZaRUlUUHBC?=
 =?utf-8?B?bG5nWmlNdFJPTkNZWHdZbjU0bWxRWEhWbm04TVRoV0x1UXg5NnBzUFk0N2th?=
 =?utf-8?B?VVArS1JxMVRsaE4zcTM1UkpWd3VZbWdUWXpTUWtsZmZENWsxcUVTVmwzbndZ?=
 =?utf-8?B?ZHVvSmpzdHVxY2FnazNJcm9razBYZ0VmLzRuTUxKczRZS2l6SU9ZRGpweVp4?=
 =?utf-8?B?Z1BCMHlzVWhtb1IzQTYyUU9GaStTS0dRODF6U0JsQ0liZFFhQVNPeS9HWnpD?=
 =?utf-8?B?UkZEUWZwcXFONTZibGFyeE91Q0pGUzd2TzhabWdRTXR5Mkl5VGMySDZNeWNO?=
 =?utf-8?B?UlJFUGtXTnQzdzNid1Vhd2JGNnIzdmZ3bDViTlhlT2VEc25NV3M4ZittaEx6?=
 =?utf-8?B?VzZZSEJzRk11dWhONjlnSENVeGNaakQxVnQzMHh1MlZ1UHBhNFFOZ1BZdDFh?=
 =?utf-8?B?elh1dEtsUlZpWlhTQ1dRSzl3ODFVVENjcm5WZ0lwYVprK2VoZlp1ZEhjNTVp?=
 =?utf-8?Q?nGRk/YlrzPx5gImTussW71eZd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab88a20-72a0-41c4-452d-08da9fd5cfd3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:43:09.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcmcnsWcw+6qa5sAu7730x4Q8v6yNJCBzzxXx5dZXirHqmwOd0GZ4/8qNsGIBhqG8GYAs/urbgQCfmQVkiNyKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7823

On 26.09.2022 16:27, Roger Pau Monné wrote:
> On Mon, Sep 26, 2022 at 10:38:40AM +0200, Jan Beulich wrote:
>> On 23.09.2022 12:56, Roger Pau Monne wrote:
>>> The current way to detect whether a page handled to
>>> epte_get_entry_emt() is special and needs a forced write-back cache
>>> attribute involves iterating over all the smaller 4K pages for
>>> superpages.
>>>
>>> Such loop consumes a high amount of CPU time for 1GiB pages (order
>>> 18): on a Xeon® Silver 4216 (Cascade Lake) at 2GHz this takes an
>>> average amount of time of 1.5ms.  Note that this figure just accounts
>>> for the is_special_page() loop, and not the whole code of
>>> epte_get_entry_emt().  Also the resolve_misconfig() operation that
>>> calls into epte_get_entry_emt() is done while holding the p2m lock in
>>> write (exclusive) mode, which blocks concurrent EPT_MISCONFIG faults
>>> and prevents most guest hypercalls for progressing due to the need to
>>> take the p2m lock in read mode to access any guest provided hypercall
>>> buffers.
>>>
>>> Simplify the checking in epte_get_entry_emt() and remove the loop,
>>> assuming that there won't be superpages being only partially special.
>>>
>>> So far we have no special superpages added to the guest p2m,
>>
>> We may not be adding them as superpages, but what a guest makes of
>> the pages it is given access to for e.g. grant handling, or what Dom0
>> makes of e.g. the (per-CPU) trace buffers is unknown. And I guess
>> Dom0 ending up with a non-WB mapping of the trace buffers might
>> impact tracing quite a bit. I don't think we can build on guests not
>> making any such the subject of a large-range mapping attempt, which
>> might end up suitable for a superpage mapping (recall that rather
>> sooner than later we ought to finally re-combine suitable ranges of
>> contiguous 4k mappings into 2M ones, just like we [now] do in IOMMU
>> code).
> 
> Hm, doesn't pages used for grant handling (XENMAPSPACE_grant_table)
> cause them to be mapped as 4K entries in the p2m page tables.  The
> code in xenmem_add_to_physmap_one() seems to remove and re-add them
> with order 0. Same with the trace buffers, they are added as order 0
> to the p2m.

Indeed. I was half way through writing the earlier response when
recalling that aspect; I may not have succeeded in adjusting the text
to properly convey that the concern is applicable only to future code,
not what we have right now.

> Note that when coalescing we would need to be careful then to not
> coalesce special pages.

Well, no, ...

> Might not be the best model because I'm not sure why we require
> XENMAPSPACE_grant_table to force entries to not be mapped as part of a
> super page in the guest p2m.

... as you say here, there may actually be benefits from allowing such
(re-)coalescing.

>> Since for data structures like the ones named above 2M mappings
>> might be enough (i.e. there might be little "risk" of even needing to
>> go to 1G ones), could we maybe take a "middle" approach and check all
>> pages when order == 9, but use your approach for higher orders? The
>> to-be-added re-coalescing would then need to by taught to refuse re-
>> coalescing of such ranges to larger than 2M mappings, while still
>> at least allowing for 2M ones. (Special casing at that boundary is
>> going to be necessary also for shadow code, at the very least.) But
>> see also below as to caveats.
> 
> I guess a rangeset would be more future proof than anything else.
> 
>>> and in
>>> any case the forcing of the write-back cache attribute is a courtesy
>>> to the guest to avoid such ranges being accessed as uncached when not
>>> really needed.  It's not acceptable for such assistance to tax the
>>> system so badly.
>>
>> I agree we would better improve the situation, but I don't think we
>> can do so by ...
>>
>>> @@ -518,26 +517,19 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
>>>          return MTRR_TYPE_UNCACHABLE;
>>>      }
>>>  
>>> -    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
>>> -         !cache_flush_permitted(d) )
>>> +    if ( (type != p2m_mmio_direct && !is_iommu_enabled(d) &&
>>> +          !cache_flush_permitted(d)) ||
>>> +         /*
>>> +          * Assume the whole page to be special if the first 4K chunk is:
>>> +          * iterating over all possible 4K sub-pages for higher order pages is
>>> +          * too expensive.
>>> +          */
>>> +         is_special_page(mfn_to_page(mfn)) )
>>
>> ... building in assumptions like this one. The more that here you may
>> also produce too weak a memory type (think of a later page in the range
>> requiring a stronger-ordered memory type).
>>
>> While it may not help much, ...
>>
>>>      {
>>>          *ipat = true;
>>>          return MTRR_TYPE_WRBACK;
>>>      }
>>>  
>>> -    for ( special_pgs = i = 0; i < (1ul << order); i++ )
>>> -        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
>>> -            special_pgs++;
>>> -
>>> -    if ( special_pgs )
>>> -    {
>>> -        if ( special_pgs != (1ul << order) )
>>> -            return -1;
>>> -
>>> -        *ipat = true;
>>> -        return MTRR_TYPE_WRBACK;
>>> -    }
>>
>> ... this logic could be improved to at least bail from the loop once it's
>> clear that the "-1" return path will be taken. Improvements beyond that
>> would likely involve adding some data structure (rangeset?) to track
>> special pages.
> 
> For the guest I was running the loop didn't find any special pages in
> order 18 mappings, which are the most troublesome to handle in the
> loop.  I'm not sure bailing early would make that much of a difference
> in practice TBH.

As said - it may not help much.

> I did also consider using a rangeset, but that would use more
> per-domain memory and also require coordination to add special pages
> to it.

"Special" is a global property, so I don't think this would need to be a
per-domain data structure.

Jan

