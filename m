Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFEE58021E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374668.606801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0Fx-0001pG-Tp; Mon, 25 Jul 2022 15:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374668.606801; Mon, 25 Jul 2022 15:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0Fx-0001mT-QW; Mon, 25 Jul 2022 15:44:29 +0000
Received: by outflank-mailman (input) for mailman id 374668;
 Mon, 25 Jul 2022 15:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG0Fw-0001mN-2H
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:44:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f96ce6-0c30-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 17:44:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3363.eurprd04.prod.outlook.com (2603:10a6:208:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 25 Jul
 2022 15:44:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 15:44:25 +0000
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
X-Inumbo-ID: a9f96ce6-0c30-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksdsU8/GehGDV5K7ScbwQ5vePzF8GrJoGPL3wJvJJ+xEKtmrgP+zwFkk588mAazzJizVhM4Rou7vFJ6oplJjDTIkukLVxkQBHRLBmqXSbjOQ0Jyj8IXfDFbV4paioCTKuePULWkFYmOjKf2L95x813Nt52UmF/DwlL8kGN+zNhwHfDP8Fwvg/onsL5R4YDX3UydW7m+jOAhetorykHOrTo1eoAeo00coZW4PHtrJuQZ7CbQMPmcIGkPb6LSY2ZMUu0sKroekElZk2krW3MXuUNXZQvjUnKFuc6OGTjGLy56L7bD8FlbLe+GTzGsMxy8wL7coqG32C0FhnNkEvo96Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s0/1qJhReTgi4aCjoGoWe2iBVyXGcIRpJJdx8BiEvk=;
 b=MpfvyJAribaGS2jUGPwSujjZDvHKeBZVj/LV+5GWX69edlDvvrtw/hlgFX0/HpGl7XPNJPZ43gIsOEB2/4wVNCRLEWMBUqFF3BMpkJiXEmb2g028kN3toNmzu2FQBFYaWRr8FSjG6VnwnxPkmfqUZYHLafhkWj7lZI64Vv0EmvFQwuwlxYcgQaGFavZQW914naLToK0klakk36tR8vs5P2MexTvHo8GDT4+YR2avAcTzO5UuyxnGv6teYcFtkf0yOX+iogDZ09Odg6KZlmJHqJoGOEncMosXh4AaWlspWUhgqQo092qHc9QJ5YElTqcVtUdmCEGbAxpnNElUQCp3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s0/1qJhReTgi4aCjoGoWe2iBVyXGcIRpJJdx8BiEvk=;
 b=yaPfXODtSAlibzxX3Obvs4TXMv3dg0+oE7tJseT9PV+QGuueLHZ8BSzBA3ujTBl1HGfhs9dbSKZJGlt445eQXafOi5ex8l4lywtxc3fRps+ZEOKu5vHGhvrGbmkhZmw93F67wMlV8sOdBQZ4w+kVbMZFW9OIVZ19vadkc+LqOJH4KyaDudqmheGM3fhm7jFcWNckJGkM/ZYO2XSq+/5V6GOdzmVxvmqUsPzssvbrjBfbTp9kt8TiL8iDlpqeiz+cx9Y+8YGn9k/g0CsQkW+LE1BMCeFytSy5+khc8vBCvEdnkLzhdop9L8GUCztXtkHFzuJaN3e3z73oynvSHyKbnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
Date: Mon, 25 Jul 2022 17:44:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220720054611.2695787-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfbdd267-5ae6-4e8e-20f9-08da6e548d15
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3363:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8SXxOj0STEM+s7gnP2Rr53aPmpPwqkZ4iCKTSUs55sSWVRGSkLgsfIzMp2tooOXOcrXTwCiiWsmB201OjWNJuHk5LU6XQ2UQwCTutPGzwc+bF05+pXjjpSjg6StPFtkjf5rnO+5DhgP7gs2aWGZT/OERFjUhRO8f6Yfyeei/WVFE0yjSeVSN7MkOJKw8aYJGkFVydCnDbzIPhjB5ojXKKmOIXdNFm2y40Ecm83zMZSLougrncqf6IZk/GeHB4xHQM0/W7tiVjiD7oMFqF1MuG2J3g9aRsjYmpRe/eLmxxZso7D0gaVvbD4KElja6HEAl2WxkH+uNT6rayT4nwIjJaj+KXgwjnlYPqO3GA6yVr2WXKFnfGVe1iy4VejI4FR+HM19lCXwfvpXV25QIO3qnBk2BzaVTeRc3tJ2nK74iMlreiDWGoyqBkj39DjQ58/silOKP3UEykyXP5mvg6cvhC5o73OW54GZkdoa1Q/pIOLGwnJpMO1LA+uLAPv/KwNO48cnkqCJOR/CIZnMNpL+ntpPELzHRFClgXbkuOatTOcvI0BWnaXeZcta3KAdi1nfh0NRYk4KdkGG7tFOIZeI+KvQBsqSSFjoV6Bl/tY4uD/7TncybQ7QSDwfi5jirKi7NblsbJPIJpNA4dveE89VY4zdUgtnu2Hcj6wL5GwpjhG5L3epY64+V4xUHNTyEX67jZiV1szsrRP2dGpRpMXY2PS5zPO0bNF/kYxgYhRDIMh/w6lgXTCwFjyOZ0Uck5ucXbW4EhENa2PVjibopu8Ov3DK0fTWEl0isuzFPhUKOllcZo14lT1xXtDu/PtJiPSCBDcVM3JTcu6FNzTaG8E3N6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(346002)(376002)(2616005)(38100700002)(41300700001)(66946007)(4326008)(186003)(26005)(31686004)(6512007)(478600001)(2906002)(36756003)(83380400001)(6486002)(54906003)(8676002)(6506007)(66556008)(86362001)(316002)(5660300002)(8936002)(6916009)(31696002)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NsMDJCdGRIblB0bHNxTHM2SEZ6QTNzaTlZbHR6QjFMbFV1bUVaVEJZRDBK?=
 =?utf-8?B?RWhyT2tEZDV6bkl0ZVNVNE8wbWl5cW1YZlhRTnEvVU83TzNLTzc0aTMxZ0Nv?=
 =?utf-8?B?aFZrV1dBTERFM0ttaWVYSjh6V2RwL2dDVFp1V3dsWHU3TXJvSTM2U0laOSty?=
 =?utf-8?B?YlJLWStyYnJEQm5wQXZVRGg4WlB2dUVGZGFZM3l2Q1lxbS9IQ0hZQ3VWTm9K?=
 =?utf-8?B?UGY3NjFuUHg2Yi9ibWhodHlwaU9BQXN5ZnhqdDRtdkF6NTNWVjRScEJNSXJs?=
 =?utf-8?B?TVEzSHZEcGdidXNycGNoUnhCNXBXTzl4QXdZK0s1K2dNd2lNVlRVV2Y1eXpT?=
 =?utf-8?B?YXNhZ2g0eURlNzhkcEdRcFc4SXNBclBnM01TMHRGSThzK0NWZEFNOFYwVW1h?=
 =?utf-8?B?S000L3lHTy94Z1VHR0VZbUhzWFBVamVURHBQNnI2U2pUUFQvbUlsK0RmNFpn?=
 =?utf-8?B?S2M1NHBHU3JNTmZ6SkswZUxobG9OejhKa3BTREpuREptYUZvbFdNRDFYUm1U?=
 =?utf-8?B?OTlQQVg4Q1R6b096OFFVNEs1d2I4TnFEbFFiV0dWdTM3QkRVWURmYWZGQnF4?=
 =?utf-8?B?dXJCbFVlcHc2dExlejNRczEzMlVhaGt4aGdVZDc3MDhDWllUbEk5TkxFNjQ4?=
 =?utf-8?B?VjV5MWQyOEFXdzlOd1VKaWdqZ1RwM0J5QjQyRDZLc29vL0ZON0hHVU1pNnBF?=
 =?utf-8?B?enNSWkJSQWZhaitVbWxxS3ppOTM0anYyTVJBa1JoTUh4QVB5V2lncU1BUVZH?=
 =?utf-8?B?dHkrWUd3cWcydC81STh3REozOWpSS2srcGpzeGV4eXhhTkg5SXNralpleGFr?=
 =?utf-8?B?WXVrNEhROXZTWmhjSlVXVXd0U2RoRVdqbGVQNWN0VDJnTmMrUDF0QWZENGVs?=
 =?utf-8?B?WnBJb0VDWitSS2E2a29vdmJpNm1vQytkSjNMOS9HSUx1M0ZtWWNXMm8rUVMz?=
 =?utf-8?B?VTc2MEowdlRNU2RVUWtGbVhMQ3lvTWhtWUFhNnlCK3dOWWRWQm43dS9LajRQ?=
 =?utf-8?B?ZG92RDlDVnBJWXEwNWJDTzE0SGRUNzNFUjFndnNoakM1cmk4TURDSHBGQnRh?=
 =?utf-8?B?VG9xdVdJdmZmVFEwYURZZGRid3pZb2pSdDBNRyt1V0ZnMkwwelpXbjR2Y0Fj?=
 =?utf-8?B?M3BqR3BNY0pDWndMaVducjQzUHMxTWIxYjJtTUdwOEZUS2NqR3kzbFJ0VnFp?=
 =?utf-8?B?UzdVSTN5S1lVQlpDbEh2Rno5b1l5WThNTmhlOHN1K3F6MGw4czNxUzRFWXAz?=
 =?utf-8?B?VWxiZjRKZHY3MjhpUW9adTFrcC8veEFjMDE1azlHQ05ud3Bnd2ZPUWVOM2VU?=
 =?utf-8?B?SUFqcEhCakhxbXlhV2ZqZUU2RklESWFsVnRjdDk1dWY4QzlqYlhYUWxBUkNm?=
 =?utf-8?B?YXpKS2xLVFlhcUxTQm5JRTI2YjlEVUxVWlVSU0l1dDhWdTBWblYzWEVsL2x5?=
 =?utf-8?B?SG5zcCtkOFQzZlg3ellTN2xVT0pmdTA1dm1mMlFtOWpPbCtneGl5cUIxMHVW?=
 =?utf-8?B?ZDNYMWNmU0YzT254VVBXZ1RlR1c1QUNBT1gxaHhxQTBMQ1BGSXRwOFBDMFBV?=
 =?utf-8?B?Q21SZkpGMExmZHdCTEQ1YkpmTnFpSVRBSVlVVkNpL1F3RnprYlBEdnNhd2JM?=
 =?utf-8?B?cWNyNGF3alRSOHBiQzArSlV6MHhxdWg2dmsxNTZCUFpPUUYxZlZDbVZ3V25t?=
 =?utf-8?B?ZWZRdXNlcVRGTTQwc0Nqc1c3dmtWQnpHdm52bkFrd2RoVkRHSWR0OXUwSnp5?=
 =?utf-8?B?Z3drTDF2U3pkMGo0cDdDR0ZlSVBPMGxtaGVUU29ITW42Yk1uSDBIVSs0bzRY?=
 =?utf-8?B?MFJpbWpZL1BBU3AzMWhWWmlEb3pXWGxaYWxRL3EvMVRoVGIxc254Q2s0Q0V4?=
 =?utf-8?B?dVE0c21jcmtiODljMXViRmVZbXpLL0xWN3BGaGhVeTBPQWFlQVBscVc0Qk9V?=
 =?utf-8?B?RU1oNXBOOG9XWDZSam1DcXg5L2h6cFE0UGJqQ0l0WXpTb2RrczhPZnlSWTJV?=
 =?utf-8?B?OE5IbXRrODB0WnFINkIrSTVhU012T3RTUm05K25uMWx6dnBqeVFsR1I3cnF6?=
 =?utf-8?B?MUQxVXVLVmFsSU14NXBmMWdLZFEwbVJFU3F0MzRIWUc4M2RQdEZ3dzE4Qkpw?=
 =?utf-8?Q?85lVPQwqepJVX2BBxb9Fv/z9q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbdd267-5ae6-4e8e-20f9-08da6e548d15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:44:25.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB5B3T6SAX5KeIeDiWe1TwNVhYXwDOXUHPZrxYLMLigIslZ1lMLF/Us3+6juRHneYgPclZouPI7ST2SVVmFSUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3363

On 20.07.2022 07:46, Penny Zheng wrote:
> When a static domain populates memory through populate_physmap at runtime,
> it shall retrieve reserved pages from resv_page_list to make sure that
> guest RAM is still restricted in statically configured memory regions.
> This commit also introduces a new helper acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v9 changes:
> - Use ASSERT_ALLOC_CONTEXT() in acquire_reserved_page
> - Add free_staticmem_pages to undo prepare_staticmem_pages when
> assign_domstatic_pages fails

May I suggest to re-consider naming of the various functions? Undoing
what "prepare" did by "free" is, well, counterintuitive.

> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    spin_lock(&d->page_alloc_lock);
> +    page = page_list_remove_head(&d->resv_page_list);
> +    spin_unlock(&d->page_alloc_lock);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
> +        goto fail;
> +
> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
> +        goto fail_assign;
> +
> +    return page_to_mfn(page);
> +
> + fail_assign:
> +    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
> + fail:
> +    page_list_add_tail(page, &d->resv_page_list);
> +    return INVALID_MFN;
> +}

What about locking on this error path?

Jan

