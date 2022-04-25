Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956F50DAFC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312453.529696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitvr-0000vB-Jt; Mon, 25 Apr 2022 08:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312453.529696; Mon, 25 Apr 2022 08:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitvr-0000sZ-Gi; Mon, 25 Apr 2022 08:18:55 +0000
Received: by outflank-mailman (input) for mailman id 312453;
 Mon, 25 Apr 2022 08:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nitvp-0000sT-PD
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:18:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2373fa0b-c470-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:17:33 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-5y1FxReCN4mhQPngoN3a0A-1; Mon, 25 Apr 2022 10:15:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5187.eurprd04.prod.outlook.com (2603:10a6:208:ca::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:15:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:15:12 +0000
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
X-Inumbo-ID: 2373fa0b-c470-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650874641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgFXD2ZM0QepaS14l6MPX+1+SMvT6zHSjQoxlyY18es=;
	b=kFhlCX4eQUmMMZyyqBkTbKW2UkeMbVPxJ9SNl7+H68z2mHFPX2OZrwm5xHgkkBZusBb2P3
	lHfFNB7mPCHFF1t4uRujkB/rtPpefDHN3GipqcDg9AB2519JQxThByGPvycg1JlTFkwOH4
	V0TOjAkC73jqjFq9rIcH01dUn4Ywr/w=
X-MC-Unique: 5y1FxReCN4mhQPngoN3a0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqauwyr+ADJto2FW1c2MeOEY3XGpanqMjKKzKsL9poy2m8kCSogU7En2cEL19q3k6AY/z3sfirsVrC3zkDdN9gFIY04LQ29DaVqKxsbH0HQ5Kjjtg/SqL1PYBaGwUQm+5sKzmh+5XREAKSAU5Rll9/9KWu1it3TVdpLQhJ59nXwf6wCdrHy6xUz8ecjQekd4BF5XL1e8zKnK3fqM2YcBFBFK/yGac5exDUSdgivkCGflwPGoS3aFwtTgBJc1E9/sPCzsXndC2kFts7fafwBRUWT5gXVPxyoied6PQeo/4rMMWh33VoKYWn0JPjLUFHLT7c/xbYzhHVemOZQQMDMs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgFXD2ZM0QepaS14l6MPX+1+SMvT6zHSjQoxlyY18es=;
 b=gcIShmr2ky5pKCCuoRdcoTwUavPkTWJN6b4eUPeViXYDKvQJsapGKEsEU+P4vHOeB9MAUzITttJ/nkDWSDJ+uxVtqCuWgIr4cxU9JmPWwbGQlKr16q2LjlMabSoLguFHjLs4MImzvNlN44MYcC6SEVUeoInwWWkJMdqIdYOeQEweyNFLaS+SdvjUfkXhULlRoqS+0moWwgPUbSCBzsZNunBCZQCRpO25iwzwS2pkmCf+CPoNvN+ObD1cOmYpxulTS+aHKw90qIdNx9ZXMYR2RGU0z9vt28hY1huYpfmMUrQeImPVBHnPYxj0Jk06juNNVFnwYSbyIYxSkNutSomaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8babf7f7-988d-641f-fc4d-6d5ea1227e84@suse.com>
Date: Mon, 25 Apr 2022 10:15:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/mm: page_alloc fix duplicated order shift operation
 in the loop
Content-Language: en-US
To: Paran Lee <p4ranlee@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20220423193501.GA10077@DESKTOP-NK4TH6S.localdomain>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220423193501.GA10077@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd57526-9607-4404-a3a7-08da2693b875
X-MS-TrafficTypeDiagnostic: AM0PR04MB5187:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB51874118FA1D9F3E55EF07CBB3F89@AM0PR04MB5187.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VY9J6xPScB80vO/AB1PbVgQe+268DAk2RRCgR2tSi1joNTeJ2h2Eb3iG+Ojq9TmwUdb5LQQky3XNPM+sEkGimnOvCYBNRW9YWcAvr0DwNjdfPOjNSraq9YBbkCSlE2NaG60HJw5LGFCVK7NSEPvAPWxI8wxmmAR6I3/QGSVRTYHoGP0x9vDaYb7A4ThYrhinoCMeCivop2l36J1W3aRhuYGHXwmcuL1XLuotQAzdUGw2h0pCd3oGUMKW2kwAB3T9arUaoR+TrtjOgTU3Q3P9XwiGMuY2lC1YmcdbsPm9ggrXrZblXUPuUZ8fHtEYaiTKeOEyz7mO+hSQ1Nw0+JRLmpt/JWS81fDPulc+PEyImy1qlGdGJS5aq70xOJE4i2CFK28Km8BGy6cYOGG+TVjt8StsrmSJpf4UiQdXPCiCgYkT8Dk6iAE9nJRXtlkeBXTBucuV3rUXXJfx0UyUw4wjn1QlVDZ1QQx7d1Gv4W6BycIK3LL53kfl3U2p7B5YCdTZ3KV12Xv6Iehw1qUmQC9tRfG861/WimQOzF2wx1wFhViFy0b0O8twrXc4ydoKE1Y/XgRAhS0BvOHuM4i291TuDz05cJIflqJHh81AKZZWThhsSjOK8OBKqsmGHZJOqvkUiG08+G1Fe9dsgPItCf+6SoJNmjbZgQUGJe6Wg6VRmFFs6hY5t7Atf3OqxfB4TzYu1FrKpwV+wZKO6h9Au6M+KTCH7oVWvHlRuLgsmhKyu7MRlSHEG5XEjy0VA/vIfWdH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(36756003)(83380400001)(5660300002)(8936002)(86362001)(53546011)(6506007)(66946007)(186003)(2906002)(2616005)(54906003)(8676002)(4326008)(66476007)(66556008)(6916009)(508600001)(316002)(6512007)(31696002)(6486002)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJTaG1ibkVqNHRHMWcvb0xDbW1DYVdReDNpTk83aE5zNm5HQTBraStLVTdz?=
 =?utf-8?B?bHBxK05qbXpTK1JSK2VQaXlxMTN2b3hhMDRzODZTcGdITW0wN0pOWnJ2S3hB?=
 =?utf-8?B?UnQwWXhpQ2lBVGFEVGVXNHAyeVc5cnlENTVjWGl2U2NLdHVMUEl4Y3NBLzBT?=
 =?utf-8?B?R1RWdmxMWU5vcVcrRUZTZ0tyRCtKT3NwTUs3TVBXeDN1NTNhdXl2THduYXJy?=
 =?utf-8?B?NmZ5SitWMndPZzJvTXdOdkg1dFZpaG0rUUowUFhOT2hnRHR3K1VRazFLVmo0?=
 =?utf-8?B?aHFKK3o3K3RoeXg0cGxuUEk3cGdLNE9FbjFWK3pMQlJCRDZBVlhPOWorOTl5?=
 =?utf-8?B?REc5bkMrZTcwUVloUU55Rll2cHpGcURRYnBwOXMya0NEZUg0cGRIcHJWM2I5?=
 =?utf-8?B?VFpGMWw3VC9mOUVZOGt4SWdla3FZeEtlQ3o1Y0MyWklPT05sNzJaTHo0TURa?=
 =?utf-8?B?Q0JzK0djbFNVWXBWRnNNSnJSaFczMEJhZTNWc0dCcVVkaHhWSldIR3dRRHE4?=
 =?utf-8?B?TzR5Z0ZEejZZVCtnYXV1ZFlyQ0RuQkM2QVZ1OXpMa3ZOTVI2aWlUZVRmNHNQ?=
 =?utf-8?B?VkhlTGkwYzRiNzJTaFpqNmtYbGE0SHQxYXRuaEdiZzhYTlgyRDFZd2dSZndu?=
 =?utf-8?B?ZjA0VnVEbzB1bjF2dnZaUndqYXNGQ25FOThVQ0w1L1hmam16WVR0VzBERXlo?=
 =?utf-8?B?YVU0RWNqTWdVYUx5enZvMlM1VFVpVHRTa0hoSThSVXc2YzlIMDVOdzJiK0Fq?=
 =?utf-8?B?cmZxOVN4cXFrd2Z4OE5KdG9GbklRaDJsTzkzSFB6bkQ1YU1ZTXc5emNqZ1Ns?=
 =?utf-8?B?bTJYSm5jRzVzdDF0NjBRR1AvUEhOakEzNTRTdGFSQjVQMlk3bVpDbDE5Q3RB?=
 =?utf-8?B?UHZjOERMelFZb3ZrVURHaVlhbDlkSmU5aGUvTVpCeHdEbmpZOXdpL3JScG9B?=
 =?utf-8?B?V1JWNGw2cHIrQ01vYXVQYWRXODAwRVUzWFR1VkxGcER6VVRaakcwazdPdm1W?=
 =?utf-8?B?SzFzaTNmVkpQUkJ0WFYxM1J4Y29pV0lOSEl6NkZGdmpYR2xJZ1cvRm1jL3k1?=
 =?utf-8?B?YjJJOFFMdnJaZU5BbUVMMTRXT0FkblpIMUN2cFhORHRsQlBhc2JaRGxZdTZo?=
 =?utf-8?B?K2VpeHJRaUpKZmJDaFdSWjk3RmtlTE9maE5lbUYwa2E0ODRTTlkvSHRLRHJS?=
 =?utf-8?B?R2krZTBSNUo3MWpJN0dIL3hvd3V2UmR6clBkelg2b25hVEtrNVZ6MXNWa3hr?=
 =?utf-8?B?djBrRXlzSCtPZCtnSTFESWZsRC9iNGs1UFl2M1lXTVNEQ2FRYysyUHh5aHEv?=
 =?utf-8?B?TjlpaTY2Q2FUVjFKeDNFbWJZZXVTblo5VlhLN2dDSFdTQjd3aVorUmNGQ05r?=
 =?utf-8?B?WmozdmlqbFpWYjJ2YTVCeFdZeUEwcVNqa2JDWXlxbE1aamtvOC9kV3pQZDJO?=
 =?utf-8?B?OG5KNjE5UmY3V1p0N0duR01QY3ZiUVNaSWRTQjJmbktGN3lIa2w3TGE4ZUN3?=
 =?utf-8?B?RGJ5MzcxY3FleThDNFVicEs2VXFtMFJsUyt2TU81SDZGNUhiVWo0S1pVUFh5?=
 =?utf-8?B?RGtxM0FxMUJSRU9IdmV6WkxhOFMyRE1obnlEQ1NSSVlQMDRZWXdqWlhuMllW?=
 =?utf-8?B?czBsSEc1RUdjQ2VEdU9PRWN2bkxJSVZqLzQ1eG5jWUNsaVhRdUhhUGRmbERt?=
 =?utf-8?B?dHY1OHIwaGwxaDJWYzB6Yy9OVS8xRUovMGkxaVo5MXd4ZFljdm82ak16TUJE?=
 =?utf-8?B?b0JhTGxJblFMU084VFBuelh3ZUdNUVpERGhDZUZXRkxsR056K2EwYXFnc3pH?=
 =?utf-8?B?dnozOHNoQ1NBQ0tEL2RUVmtVWlNoblZHcGlXQWRaOTRoYmdtOERrT21nZzlF?=
 =?utf-8?B?bkY1OWhBOVU2di9lSHRYbzBRS0dUNEtmTFBzemltWG9XdVNxWGIyWXVJb3h2?=
 =?utf-8?B?VzNLWlFHdDRJTm5hWWxsMVFTbjdZcDF6TStyTkFpNVhKSEFwTGFEMjI0dFpF?=
 =?utf-8?B?TTZIOUk3MFFjSGI5WkQyb0VJZGFaM0Q0aktXaW05eWRZM1lHRnNIZDA0K3RY?=
 =?utf-8?B?QjRMU2NjNkNYVU5sblBsYkVkNWgrNEZSMEZkVEFKZ1hmM1lUYnIybjE3SmpI?=
 =?utf-8?B?V2IwbGYzNEk0T09HUG5aeDNrb3UvUS84cW9MN2dCYzZhaDBDMnZHcFZOVHVQ?=
 =?utf-8?B?cVVmK0grcE5hUndSbDB5ZzEwUyt4c01UenBEc1JGaFYrcUIxb0s2ZzJwcmRj?=
 =?utf-8?B?OTlXdXpOZEtoRGpQeENBRGU3azUwRlY0SEJXTml0TDdURWJLMGNzRDlXejZs?=
 =?utf-8?B?TW9qcmRQaU1zVlpBbTFkTUlpMFJaVkQ2MHZoSnk2ODFuVTBBYUJyQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd57526-9607-4404-a3a7-08da2693b875
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:15:12.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4VKP+9avErqQrbv41oI85zOJqoXDsD8ohmQGPYi2HLbuXNUNjVao6+7u7CTJFqKIJ5HMCqEHOrMLTBIq+UTrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5187

On 23.04.2022 21:35, Paran Lee wrote:
> It doesn't seem necessary to do that
> duplicate calculation of order shift 2^@order in the loop.

Once again I'm not convinced. As in the other patch the compiler could
do this transformation via its CSE pass if it sees fit.

Also (applicable as well to the other patch) I think "fix" in the
subject is misleading: There's nothing wrong with the original code.

> In addition, I fixed type of total_avail_pages from long
> to unsigned long. because when total_avail_pages static variable
> substitute in functions of page alloc local variable,
> type of local variables is unsigned long.

You've done more changes, some of which are questionable.

> @@ -922,8 +922,9 @@ static struct page_info *alloc_heap_pages(
>      struct domain *d)
>  {
>      nodeid_t node;
> -    unsigned int i, buddy_order, zone, first_dirty;
> -    unsigned long request = 1UL << order;
> +    unsigned int buddy_order, zone, first_dirty;
> +    unsigned int buddy_request;
> +    unsigned long i, request = 1UL << order;

E.g. it's not clear why these both need to be unsigned long when the
largest chunk which can be allocated in one go is 1GiB (MAX_ORDER).
At least on x86 operations on 32-bit quantities are generally
slightly more efficient than such on 64-bit values. If we wanted to
cater for architectures setting MAX_ORDER to 32 or higher, I think
the type used should become a typedef picking "unsigned int" at least
on x86.

> @@ -975,16 +976,17 @@ static struct page_info *alloc_heap_pages(
>      while ( buddy_order != order )
>      {
>          buddy_order--;
> +        buddy_request = 1U << buddy_order;

Such a local variable would better have narrowest possible scope.

> @@ -1490,7 +1493,7 @@ static void free_heap_pages(
>              /* Update predecessor's first_dirty if necessary. */
>              if ( predecessor->u.free.first_dirty == INVALID_DIRTY_IDX &&
>                   pg->u.free.first_dirty != INVALID_DIRTY_IDX )
> -                predecessor->u.free.first_dirty = (1U << order) +
> +                predecessor->u.free.first_dirty = mask +
>                                                    pg->u.free.first_dirty;
>  
>              pg = predecessor;
> @@ -1511,7 +1514,7 @@ static void free_heap_pages(
>              /* Update pg's first_dirty if necessary. */
>              if ( pg->u.free.first_dirty == INVALID_DIRTY_IDX &&
>                   successor->u.free.first_dirty != INVALID_DIRTY_IDX )
> -                pg->u.free.first_dirty = (1U << order) +
> +                pg->u.free.first_dirty = mask +
>                                           successor->u.free.first_dirty;

This re-use of an existing local variable looks reasonable to me.
It would be nice though if the variable's scope was shrunk and its
type was also adjusted to unsigned int.

Jan


