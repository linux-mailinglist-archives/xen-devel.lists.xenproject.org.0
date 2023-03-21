Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB286C2B7A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 08:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512223.792048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWZs-0000M5-MX; Tue, 21 Mar 2023 07:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512223.792048; Tue, 21 Mar 2023 07:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWZs-0000JY-Jh; Tue, 21 Mar 2023 07:38:40 +0000
Received: by outflank-mailman (input) for mailman id 512223;
 Tue, 21 Mar 2023 07:38:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peWZq-0000JQ-Og
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 07:38:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe13::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a25cd3-c7bb-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 08:38:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 07:38:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:38:35 +0000
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
X-Inumbo-ID: 63a25cd3-c7bb-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxJNGtGuGOleN8D3WP8eOxiw0x9uTRSfUnPqIZXmZ/BkPOtRQvvEHhztcjycFXygiF97L3+l2vq4Oj42KcbX7XE1BtTXVE+4ywKEQuM0LoLvR3gLAaY1GdtcAauSnrSX2WnNmBcc56Tb7SCvqsjtzLsEqTDPhQ82SUqfgAPsldSTwnakPlkPdq++TpX3NL9cGvav4FuJPmDi5mHW0vpQlQ3I8DuI93Pj1od0HKVz7qVMbdZBCXg+KtUka1mcVWFGl308Wxrbd9+jTk8xWWraR0nrZB1BCmF2C3XTHKBSbx2ONYhmOKUzE71CQbtPHmMULpeseXCkyPsebW/HiZRCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p6hnCsZ4CH2tRtL52Nynf8f20biR//O/xdlliJ2064=;
 b=BhxFASDY8Ff46Yv0+Nl1KCsHyCbmq/H+GlavIzqvgzO0AzUieasu4rU/pXTaSIODgDL/Xu4aub02MPFmGv4orxd81AV1YK6gwJLc54QiGFjq7n8nlF0Q0KSRr0zCWzbX+Ekl+5sG/0KxvrFhQcjse+hMqE6k7WIvPZIQXzEmBFuJK5bOPo1ggzOIi/Pmp4u9kOIxiCsQJHKBFfbJAT0tNHzY8OkWuiWBLxVb0swF0xghovUHWhlm1otBbUY/yhbV2XeCHPFf9fPjjzPXXidBVZFHZQ4sKcY2vPvsv7UaSmfV+9FYtiDi7NI+XzUFmk46anltLNgaEqIBWRhRFGe4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p6hnCsZ4CH2tRtL52Nynf8f20biR//O/xdlliJ2064=;
 b=Ece21dhSVtyFUSjI7C5Adp8RFHIeJT07/fJkh1EW3gpVKUW/7Fytfjf/LjUj30tg3wYh90KIRgHaFfB0q1OHIdZUzOWzHSUqyJMK1601uRFYE/v+hYFsUTIEIwqbr7hsc8iIilKJfLEQuWOJHGCyCxgjbnMOGU0whJ/cWv7+EWX//DCLswEl14GO7T5hiFOTZCbjINdv7ce8HHddzQ5CnKXh9f83dZgdLJIhn735R/F9fKPAxMMpdiYbMZyj6aKNCO8iLiqtd1hufYy4w/9WR6ru5EPUZNV/XCJOBIbk19ZxAEKqQMfgv5nPdAPqVJbOvHT75zkqGFKbJpz16aHALA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d33e4a43-2018-0f19-1596-169a78ca539a@suse.com>
Date: Tue, 21 Mar 2023 08:38:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-US
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>, xen-devel@lists.xenproject.org
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 7254d765-017a-41b0-8af7-08db29df46fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3UB/ZwZHz7FlK89gNdyEo7kGNmfCVgDgRNmvh7mMqf3deNGJjck3Ehno5L5NfADcsjgbR60xIjpQNLhNTL94TGkZANyN5j+pDAm/SfjtMwcWEplsRYwBVE7gp0p8Dfbfs3aO60W7dtJMZ2tADuyf/EctHX+BS96xpyQhEKokaTGBVah/1KN14jDHzQcAcVEH/wM571WBtTwManaU9mKFjz9LZjl1qPub2byA+CFVrR8FyGT8YQey0IdAwktGZFLL9eXKz4+en+bn0Evv5n/VDhVO6VU1vNTqnbgfG+ctX7p/p+ZNgmtm619Zve/0IZnAmg3KOGC537528ZUs402S/6ViforL87fvXji5VyPOpRvhiXHhAJ7f4knVHzY/C1ak7V5vZlRpC/8pOdpUsBeFD3XIuhg5Vb+6cUFHtB968skOqOt0tcNGCGTvoOSwLxbgG3eZGJuPkNCYzcrxXRCK6DHRon4jqUummWxgK6GuzomJt7bzoNcFna41wRo/7+2BKLvQv9iojGfpSQ/U79ht05+wOGRCYuLopBHBLtR3ifUTiK0wWMGDxeulMaaHNUK9nVLk+KA18LDrGpYISF7E3/Bd4dfeqzjMx6S5L6A5ZfELKVZgdONiCw5YB08zZsG5UR+rp3kt8gy/DPche28F2YHRzK3G/sg6RE3KWl+AV6rPk76ZcN2yQO3H1AC4uOZouHO/7BH8dPmX0nVNFvyJR9nSwer3j4nlMVobN1kLPZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199018)(31696002)(86362001)(36756003)(316002)(54906003)(83380400001)(4326008)(8676002)(6916009)(6486002)(66946007)(478600001)(186003)(66476007)(53546011)(26005)(6506007)(6512007)(2616005)(31686004)(66556008)(38100700002)(8936002)(7416002)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHVwU2lNazBHMGtzRGxSQ2FFeUFELzVrSHNHc3JvajVFM0gyNlhYVnM2TkNx?=
 =?utf-8?B?SWFYZ2orb29ZSEVpcnR6NTdpNnRXVUJEU2VtK3QreGYyb2ZNUzBOOUtEMk1Z?=
 =?utf-8?B?WmZXdGNjNkZveksxSEExTk9sNEVicXBCbEo5azBPem9sVkx2R0txTEpKenFo?=
 =?utf-8?B?a0ZOZ2N2MGREL2Vrb0lhNmxwdCtCSDVZdTlyK29CTjdEUXlZY2JiQ1Zma0c5?=
 =?utf-8?B?V0FVMU9qL3VranlpMUF3R3NNczZqeDhpc01mdzRld3dzNDdQVWV2VkR5ajBC?=
 =?utf-8?B?c2loOEx2WkhsaWpGRm5kM3ZTeXllckpWbmFVNGx0blN6Mklpa1ZXdmtmaVBI?=
 =?utf-8?B?VE81UlZTL3liNWxTU3lDcjlmUlpPa2RTYzFTU2l3ck1KTm02UGxjdk9CQUxK?=
 =?utf-8?B?dHI0bEp1dFVNVkZLbkMzVUNIUVJFeVNYVDdvTTVKY1pyQWdOWFZxOEpEVHlM?=
 =?utf-8?B?ZzBvSVFaU2s1WllKajJLWEc1d2tOZk9SUUpzNXp0QXRrUE95SXllVTlVdWYy?=
 =?utf-8?B?ZFU5cWcrajJwS2ZGVlp4eUgvQWxMNS9RY1dYV0dnNm5vbXJiMk9GenpKSk13?=
 =?utf-8?B?bHV0aHhWUXY3dCtZZ2Z3VWRyN3pLUmQ1cjJYU2F1TlE4QVFOQTFpendUdVU5?=
 =?utf-8?B?dWpVVjNhZnBlaTFSTVZ5UFllc1Q4N2UrNUxQZTBEKzcydHpKanBnS3Q4UGUr?=
 =?utf-8?B?TG16bWMzY1ZlR3FFYjNtOVM1U29pSnR4YmRMWTRsUEYveVJEVkFNV1d6STd2?=
 =?utf-8?B?S3VDMnorTUN6QTk5SjRnZTBFU2gvN1A1bjUwS0pqeHByNjNTUkQxRlNLd2Q5?=
 =?utf-8?B?aVBhZmJQMmxiRi9HaEVVMG9ncDhUdlVkdTFRdTZBYjAyUVZYYi9KSmNKcTFV?=
 =?utf-8?B?ZllUV0J3K2FOU1lZSnNWSWNEeUdMV1hnQW9PZDJZbU1tMEFHM3dGSk1NM2pt?=
 =?utf-8?B?YnJlYjNvU1VpdkFOVC9GUUlFQ1UwQ0JwVTZreEZWR1Avb0hGeG5OS3RLZ2s4?=
 =?utf-8?B?dXpGYkR6NG9WUXJIcFpSSEpCenM3ZlhWOFl4RW0ydXZ5K3h5Nk82VFVNam9q?=
 =?utf-8?B?TmVac0FHYnNyZkNHdWVGUjg2ME9zTVRNMGZOZGg2VVVXNE9oU3VsSU5YNFpG?=
 =?utf-8?B?R2RUVHp1RjhkaHdHdzBrbmVpTzJhSTJPL05vV3hEUXRjOWxFRFBBS0hIa2xl?=
 =?utf-8?B?YktmM3BFTnJpNzNnYzRtQkVydFF5cXVyRkxuTkVpWGQrNzZ3NW52T1NnUUh1?=
 =?utf-8?B?QWg3NzJQLzloR2dMZEdBeEdzREJqUjhML0U1T3FvS093TURLYXVtZUxUMW1w?=
 =?utf-8?B?QTF6MG16UG9KMDFnbDAzWUFFNkZyNWpDR1ZxWTVZa1czSWYrR3NiQ2ZrMXpw?=
 =?utf-8?B?Y0Jpb2pYbCs3NEFhRmdCbmxjQURLTllEMnZBQWNqNzE0VTRCbEdiY1p1WHAx?=
 =?utf-8?B?eGpzYTZYL1N6TERhSk85am1FVVZSMlpWMXN2ZVB1aHROZHpuQVRhNEg0Rjdo?=
 =?utf-8?B?dkwwR1M2SnN3anpaNmZlMnZqamU0bGVDL1hTR1BEc2x0VDZkcUpqUEE3SE9B?=
 =?utf-8?B?cVRCOHQvQkFrR1JpSHlRUWw5bnBnbEhMdzQ2bDhmMlhJZzlyMTU3YlRLejIw?=
 =?utf-8?B?RHY0WVd2VWJIdTBWa1ByZkk3QVhPMGtDMndiODMwZXg2TzVWTGQzRm4vblBE?=
 =?utf-8?B?bFlaZ1ZCeHY0Qm9yejlCZGxML0RIcmFZOVBzNy9tUFlFQTlSbVlIeitqSXFB?=
 =?utf-8?B?WklKek51ankvOHpIeFpyRHBoZGVhRm11Z3d2TjAyb3ZLb3pDUUY2UVJ5Y01q?=
 =?utf-8?B?TTFsdUcyZ0RFRC82SG5RS0hmUE1YQ2dPcWpOYVBHTUJ0NWlhWDBVQk5CNmhO?=
 =?utf-8?B?L3QxZFMzRjVJZDdUUnM4c3dsWWRib3JzWW51emhMUjJKZ0VzR2ExNlFJN0F2?=
 =?utf-8?B?WldSVUQ0L1JzMzRndTgxWE85V3I2bGh1dGp6QzNhRlNzSklLeW1qSEErVE1i?=
 =?utf-8?B?ZzRoOVY1NDkyVGwxUWQ4Q29jQ1c5bjBpelJ5WXpOZEplOGhmQjF4anFjSGlO?=
 =?utf-8?B?N3RXcjVNK0NEZlQ5TlRhek02UHh0S2NHVUlUcFdMblo2cVJ5Tm1acEE2K3cx?=
 =?utf-8?Q?sSF6deaUJI7xskthn7lterEHM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7254d765-017a-41b0-8af7-08db29df46fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:38:35.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /358Tn/RYHCBR3SjYjQmMiu8uqbd8wl9YGAeDT7hovTezvhG57ARYGgq1XtRfiBp6RZRKkNKQj36GpDozDqGuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

On 20.03.2023 17:32, Ковалёв Сергей wrote:
> gva_to_gfn command used for fast address translation in LibVMI project.
> With such a command it is possible to perform address translation in
> single call instead of series of queries to get every page table.
> 
> Thanks to Dmitry Isaykin for involvement.
> 
> Signed-off-by: Sergey Kovalev <valor@list.ru>

Along with other comment which were given already, a few more largely style
related nits. First of all when sending patches you want to make sure they
make it through intact. You have some line wrapping and white space
corruption in what actually ended up on the list.

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1364,6 +1364,23 @@ long arch_do_domctl(
>               copyback = true;
>           break;
> 
> +    case XEN_DOMCTL_gva_to_gfn:
> +    {
> +        uint64_t ga = domctl->u.gva_to_gfn.addr;
> +        uint64_t cr3 = domctl->u.gva_to_gfn.cr3;

Please avoid fixed width types where they're not actually needed. In the
two examples above I guess the 1st wants to be paddr_t while the 2nd
wants to be unsigned long (and pfec below unsigned int).

> +        struct vcpu* v = d->vcpu[0];

* and blank want to switch places.

> +        uint32_t pfec = PFEC_page_present;
> +        unsigned int page_order;
> +
> +        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec, 
> &page_order);
> +        domctl->u.gva_to_gfn.addr = gfn;

Blank line between declaration(s) and statement(s) please (and not in
the middle of declarations).

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -948,6 +948,17 @@ struct xen_domctl_paging_mempool {
>       uint64_aligned_t size; /* Size in bytes. */
>   };
> 
> +/*
> + * XEN_DOMCTL_gva_to_gfn.
> + *
> + * Get the guest virtual to guest physicall address translated.
> + */
> +struct xen_domctl_gva_to_gfn {
> +    uint64_aligned_t addr;
> +    uint64_aligned_t cr3;

This is x86-specific. If it's meant to be an x86-only interface, then
it needs to be marked as such by suitable #ifdef around it (you'll
find other examples higher up in the file). Otherwise, if it's meant
to be generic in principle (which I think would be better), but
implemented only on x86 for the time being, the name wants to change
(e.g. "root_pt").

If it remained "cr3", you'd also need to clarify what the non-address
bits of the field mean: They hardly will have their CR3 meaning.

> +    uint64_aligned_t page_order;

This certainly doesn't need to be 64 bits wide. For the foreseeable
future 8 bits will suffice, with explicit padding added as necessary
(though Andrew's request for further inputs may consume some of that
padding).

Jan

