Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4840F2CC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188984.338423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7oh-0001lf-HC; Fri, 17 Sep 2021 06:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188984.338423; Fri, 17 Sep 2021 06:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7oh-0001jV-Ds; Fri, 17 Sep 2021 06:57:47 +0000
Received: by outflank-mailman (input) for mailman id 188984;
 Fri, 17 Sep 2021 06:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7og-0001jP-CO
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:57:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06bf7bb6-4b34-4dc1-804a-f6223362d829;
 Fri, 17 Sep 2021 06:57:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-CzZJouMqN9yPKeNlYR9BGQ-1;
 Fri, 17 Sep 2021 08:57:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 06:57:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:57:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:205::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 06:57:39 +0000
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
X-Inumbo-ID: 06bf7bb6-4b34-4dc1-804a-f6223362d829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631861864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3u7vFGXazRIkg5mIgOTXNgjjxSjdm51TrgOQkoaQHM=;
	b=bn4bZvl3mBukAIdqdWId+16eYc2cq7/RsoLGNhuV05WAGzhEKevm0wqJHQ5ff6FM9lXbB9
	wdyyA5ENpmKRQKt62oAL5EfB0I7cutUBDSQc1YHc2G5uezDJRFZv/dU/S6L7WYgLRSsbGu
	JROOu7pH5X1sR3Ll2DX2IGEiQhzwX00=
X-MC-Unique: CzZJouMqN9yPKeNlYR9BGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEzdsP/dS+w8Crlba0fkmhX9/KCCLKZZ8IxuIbSvXWzHtFumv6ZlHRJwjGc0LGbYZb9L9T2rerVSX3tIsfwh6hWc1trBQ0ThQcfOt/S9UwvvlZqwkVUDOVqQOQ8T6gMEWE8LE3hA+jlU9SzOWSR4u7ZqpQnaR68JO2PhG4sMyrkyhI4zrB5XBw4hQTCa9b7w/xiwve/MxCtaYkvxfTNvyFnBYrtBq165T14qlyquQm4aagaelPnI1slJFszbxHaLY1j3Kg2cdM50fDWV4WFY37qpAufrkdK5IypeyixH26axKXNrW+BynqyhRCRDI1JPYbxlov2s97u0JVyR9MC9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R3u7vFGXazRIkg5mIgOTXNgjjxSjdm51TrgOQkoaQHM=;
 b=mJEmpKsnZhdkqXmuRMOr3BqU0+1bRRceipOjFTHeI3jpMUl47WAl2L54OaVsy0M+f1c0ptLObXV2W/hGax+qOXzD4gtpd+qb6gNHOmIqIn6BcSCQiEqEVPI+PbPU/siQ8gp9dGH8G4aQGRG0OUAXT103YkdMKP6P1vgO6PG9fb5issUw5bOkV+WbnjtQdJWrzxpKGxuuaIw++9Tr0QLgJ6QVJxRh92wn/cVuKM25cs8OO42a9kXWU4E7bQRbWuaqii0VBQZGMWtc/EPv+Ao4Dbz/Bpkel3ZQrjTuNRUdAz9A/21386w7lpFhftmnZIwtK/ODSXsvXNLg1K3S9HUr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen: fix broken tainted value in mark_page_free
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, xen-devel@lists.xenproject.org
References: <20210917024855.605551-1-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6019d137-5298-d01d-eeff-51c228c133db@suse.com>
Date: Fri, 17 Sep 2021 08:57:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917024855.605551-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:205::16)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d540d25-ae41-46e4-3b0c-08d979a870c3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26072FBD792DA761F8991462B3DD9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yj1i1sDdHBXT40iObTUXeyrErmpzj4J2ce98QIJP64QhXCKSKyTiNuuzR/7k3LEt1Aia2Ycf883fOvg43nVC1pFxfXW4PO7HJbPNVtWgFf0cHpCmqsDvZhVwHnkZFWvIwvmmwCJybgmvUw24CVFF0aqGuSaCBU+w72/CMAka+D4GKDVgKkNnJW7xRUW4Bzf/tF89lm9zsDBWnNm7LJSJa767Q0E3VQQsaQvQDjZZocoNUpHeP3j60GZZ36abuzHhFD1habnDmkAsEBvFkGw63suf0nsdFJjeZqHZub3GIro6EtRXFRAI6L3X5ujjIzK7NKhBG9FLYmue24FQhaj1QnTmhTn5+gnxZOQg2FcX3H9BYHe9JNl1TKqG9rf5/DP/oWHZt3HrbVAKiysp7z64z/A1Al31KhDX95MDhkSeg9e0Gi27RGUhhswWGRoNaBgBKCoV5cqFBqhUP+bpXlirGRcFgrkRAUc/Dke/j7Xp9225BnJMP7T2pLsgxXgMY2lvi8Xd0EX8RHoIU79U+7l57Jg0sqv7mjd0IpTOzGTIltpu8rFrzfiPRJvJz/IkhBaqqucO7ln3z9ZIC1r9be3ytSuSf6Uak5JftCxuqGEFeCD9+67Et9Xjk8Wy+y2PZOHc1vljjMFiEXfIgBHBBs9oj9iz3Ch+13FjivfaSSYxozc2z0MSUuceaOHyNxVAmIcoBJp7UqRyC61XMbFBQ2M/U8zEpp+17pml+SVFw8Jx5kw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(136003)(346002)(366004)(86362001)(478600001)(6916009)(83380400001)(53546011)(2906002)(8936002)(2616005)(38100700002)(956004)(66476007)(26005)(66556008)(66946007)(6666004)(5660300002)(6486002)(31686004)(36756003)(31696002)(4326008)(186003)(16576012)(316002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmxKd1U5NjZtZTFzczNoL1NIb1pDTm9rbjAvb3RiS0hFcnRiZGltdmtFYlJT?=
 =?utf-8?B?YzdBRDE2YUN6YTB6d0YzZHMvbUxMK2NiMnBrVFRPTHVEQ1NNQmNOdTBwL0dH?=
 =?utf-8?B?UnlwSHVFWWNiaGVCTy9YOWpqQXNsY3l1MXFXclVucVNGL2o3NjZUZ1ljazEz?=
 =?utf-8?B?blErYXFzeWhWNjhkK3ZDQUF0dWI5N2ZjTDJlWGFCek1xNGFoZ3N1Nlp4RFBH?=
 =?utf-8?B?RmNxbVIwZ05qRU9EeVozSjJYWVhOeHJyQW5yZHdFb3I5dTYyanJqa1prYUhQ?=
 =?utf-8?B?UFhLUHpNSVBlRmpsSU9XU3VQZlUxU3ljbVBCWTBuUURsYmJ5L0RINEliVldR?=
 =?utf-8?B?byt0VmVJVUxmeVNPWk1mSjJUYWJPLzZ4Z2lTcXdlQ1ZJb1IxcHVXdVJqcGNT?=
 =?utf-8?B?SllRVlNZbjRGVkY0Zyt5R2F3dURudkxtem0zeGVsbXdOdXlMNC85OTJqQTNC?=
 =?utf-8?B?WWRqUTIrS3p3bXMrQjRScmRyWDVsRUo1clNUQTdaaWJvSmpPWkpkdFBhc0kr?=
 =?utf-8?B?c2pGNDNyYm8wS1MwNmVwc2czeDBYUkR4aGx5ZE91V0l0cHUvY3Z2d2ZDYnY2?=
 =?utf-8?B?UFJVemRacXZMbHN3WU9nRnRtUHBmWEpwMTJ4QndwSWNmQU45OXhGZitBd3gx?=
 =?utf-8?B?QnQ3WVN0Qi9kdU12TXlzRXlHdVRmRS9JVmYwUzhORmlqaEdpUDI1UzRLajFU?=
 =?utf-8?B?eTRnbGF5cFJ4QVJpdUdPZTRpdzRIRDBaS2NiYzlUeTZIc3N4eXhrWnZ2aERx?=
 =?utf-8?B?TGNnWGM4c29JUEZ1NXlnSktrWktIeEVsdFpWQU5yZUpxMkwxNzQzU2h5KzhC?=
 =?utf-8?B?MDdXTVpnZFBpRG1NbjJqRnpwZWpOQ0cyMWxweXlBUVpTemdtUTM4UG4xSlph?=
 =?utf-8?B?cksweGFreWFObE4vNzdCcFdLRVhSbGl3VVRPMWl6L3hQRHZPTnZCRTJoYU1n?=
 =?utf-8?B?Rm1hMVVwdnB3SDJnNW5ZVEx4TFZQSGQ0d29qUndaRWpnZmZJNW9YRCtnNVU1?=
 =?utf-8?B?NW9HMWlKeWhhU255VlEydHF6Wlc1NG9LNlNudkp6TnNMM2V3cGUrVTFlM3NF?=
 =?utf-8?B?RnQwa1ZZWFVadUdFR1AvQnd5YVdTOVVwamZnTERBSDREcWNBWTJwcGNKczN3?=
 =?utf-8?B?bmtaMjN3akg1YW1USnFBK1RMNm1mT3hNZ2U2dGRTYk5wTGZJVUpRelE2bVJE?=
 =?utf-8?B?NERHNmtIcHRUS204aVM4ZzJDOHdoUmJJNnhlR1A5ZUduQm9yaW93U3lqcGhU?=
 =?utf-8?B?UWlqckUxcWgxTGZkSFhDcGhOTVEvc1hHY2U1TkU4OFNveXY3ZTdnZDVuUU5k?=
 =?utf-8?B?UGFPNVFHY3JjaGdjME9Kc2EyRGxIdnJQMXNFL3BLWW1ETWJQSnloR294VGV4?=
 =?utf-8?B?K1dWdHNOdm5LWXRxV245RkZzZE84YVpYajUxbitEbG5uU2RGWnVWcnF4MS90?=
 =?utf-8?B?c2x3VHY4Y1pZVk16cEtFK0xYTFRWck05SmlaemhrTDNwZW5GNlVLZVBSQW00?=
 =?utf-8?B?RDh4Uk51YlBVMG03dUlzTnhmYXZVQmFTZkZIQXhwSUtlU1MrME8rUzFNVWNU?=
 =?utf-8?B?VHIyay9pT3FTWnBzWFZMTFR0TnJOSldKN21rOUx1ZGxkV082ZDRRa3oxcjhv?=
 =?utf-8?B?ZDkrcjlncnh3WW5ybiszOTh3R3N3blpDQzhnbERpZ2FEZno1RkUyWEVCb285?=
 =?utf-8?B?THN1ZEJFRldoRTdXWk1LT1lYZHhwU3VaRHlXYjRIM1lwOFpHUmhFNG8xVkgv?=
 =?utf-8?Q?B/ec46D0tzCNwNTG+mL6LoJGtj0ImZFLbL5g9x2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d540d25-ae41-46e4-3b0c-08d979a870c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:57:40.3984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyjDbvuUeFe+zmsxDY6Bjmx9U4Fxr1mm6FX1geU0AXDPEsLXdEyuLzukXYkNl0lj1y3i8Znz1aHpzZk9pw8VmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 17.09.2021 04:48, Penny Zheng wrote:
> Commit 540a637c3410780b519fc055f432afe271f642f8 defines a new
> helper mark_page_free to extract common codes, but it broke the
> local variable "tainted", revealed by Coverity ID 1491872.

Instead of mentioning the ID here, please ...

> This patch let mark_page_free() return boolean value of variable
> "tainted" and rename local variable "tainted" to "pg_tainted"
> to tell the difference from the global variable of the same name.

add a tag-like instance here, as we do elsewhere:

Coverity ID: 1491872

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/common/page_alloc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index b9441cb06f..c6f48f7a97 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1380,8 +1380,10 @@ bool scrub_free_pages(void)
>      return node_to_scrub(false) != NUMA_NO_NODE;
>  }
>  
> -static void mark_page_free(struct page_info *pg, mfn_t mfn)
> +static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>  {
> +    unsigned int pg_tainted = 0;

bool please, considering ...

> @@ -1405,7 +1407,7 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
>      case PGC_state_offlining:
>          pg->count_info = (pg->count_info & PGC_broken) |
>                           PGC_state_offlined;
> -        tainted = 1;
> +        pg_tainted = 1;
>          break;
>  
>      default:
> @@ -1425,6 +1427,8 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
>      /* This page is not a guest frame any more. */
>      page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
>      set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
> +
> +    return pg_tainted;
>  }

... this. Also both here and ...

> @@ -1433,7 +1437,7 @@ static void free_heap_pages(
>  {
>      unsigned long mask;
>      mfn_t mfn = page_to_mfn(pg);
> -    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_tainted = 0;

... here I don't see why you stick to using "tainted" in the name
when the goal is to ...

> @@ -1517,7 +1522,7 @@ static void free_heap_pages(
>  
>      page_list_add_scrub(pg, node, zone, order, pg->u.free.first_dirty);
>  
> -    if ( tainted )
> +    if ( pg_tainted )
>          reserve_offlined_page(pg);

... control the call to this function: "offline" or "offlined"
would seem quite a bit more to the point, getting us further away
from the global meaning of "tainted".

Also please follow patch submission rules: To the list, with (all)
maintainers Cc-ed.

Jan


