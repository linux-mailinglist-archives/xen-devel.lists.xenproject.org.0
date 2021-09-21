Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15B412FDC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191536.341606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSak0-0002pm-FU; Tue, 21 Sep 2021 08:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191536.341606; Tue, 21 Sep 2021 08:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSak0-0002nz-Bw; Tue, 21 Sep 2021 08:03:00 +0000
Received: by outflank-mailman (input) for mailman id 191536;
 Tue, 21 Sep 2021 08:02:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSajy-0002np-J4
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54918688-1ab2-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 08:02:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-4n00tCGVMKi_9KWHnshq0w-1; Tue, 21 Sep 2021 10:02:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 08:02:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 08:02:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0031.eurprd03.prod.outlook.com (2603:10a6:206:14::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 08:02:52 +0000
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
X-Inumbo-ID: 54918688-1ab2-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632211376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4S774r1OPPy/t2Aaam3xGobazJwl30XB1bp7FcSWO9k=;
	b=ZA5Artvh2Weyi3KyMITXg0c2iesEUlspJCujdkd8RrIBzTAE38gbP5lmrJgSOa1ESMfMSK
	EW7w2Kpu3woFpvxDYEJx2KtIMEkvKNEYA0ijlNglSqZVXf1Ki2VROAqLkYKzv3S3VvU/kz
	bKFkxntgejG+RPeHZLONZI3yuk0XwVI=
X-MC-Unique: 4n00tCGVMKi_9KWHnshq0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQOXRyWyi/xLvof80RMXlcD1/8mKNKlUvevDU6tm4A04NZR8epolyqb617Ia1V9yKZGK3TiFQhjPQf4943MSKl/h6NPBbcspreKtjVNcZrDUBk7ZubU6BcIVHO8KZeB+w8T4yD5Mx0ALyhGBkxGp8hvovfeQoCgpvxhoCLDYCsCCdWYrmE5N+Zz4kWgi3nh9faaIh/qe19tQOn7SmYSGe+Hs/YNQH+TFkKpOFl0hPhld5yUjyzXKDRkq/SRaP61r/Ab/HoEk4VY+Iueflwgt8T8OcjbNu4T0x61j1JhcTJ85QUgLKyUx1TGQHM3UxNcjmDhTUSOqeOQTgu6S8KXD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4S774r1OPPy/t2Aaam3xGobazJwl30XB1bp7FcSWO9k=;
 b=LggVY+WtFfa5xOBQ/H0vhvo0BiSgO+gmeRI9TolTFQ+iGu78GfsUFu/qWdBEj9t6klXfkGySt1ZtjtDawcSKGRiV1A2lu+8n+0ZZz62sZ6tYNGt9l2J0PYh3Uug/r5lXmXAQSvFbVvSBlqI+GDGeB0oE+V2jkPyviLQuCfwv6AsSHOpQLRFlMvLKhb7nMpJn43ind8rsFLxITuznyrGooyQ7hkPpbZwYn5fyyOtfGe58fPyKMS4OlW76pUYAH3d8EHLBO41stP5mA0rF8A8dq1YqLntO+d62lkZnIY2+sw/dnI7tSq06v5U3xHIdzTXGkI9YX8zKVDda9IbLKJHk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
Message-ID: <6aa5ed94-b00e-24ef-aae6-be2cd958c406@suse.com>
Date: Tue, 21 Sep 2021 10:02:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e7e5de-496d-435c-b6fb-08d97cd636cc
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686134B2FB9C5ADF6D1BDF5DB3A19@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mAb9f882aEf3BfZCBXkf9X0soN4Lpz69up3dFt9CHvSYzGx4PNRJCQIblkayZyS1zWN5TMOjLksLILd0idVUsDZyjvAqkPGdLH7ZmZUNXYvAyUKLXFc7oTTjb7NRA634bWcU+f6OpHXKq4yw5onm31aG/5AYz23ROC/7r5fHi9qT74HcA/jQaaQeccGyRjP6BywBdzWtFYaNxP4GUcBEoQzUn04G6NsHrL4Z9LK/6oXiT/j/kb2Y8SPSmMFBkNruxQaJmd3ni4nA8Gbmw8Llwpv5tl8J2rN6EerhvPyXy+VZva9tbtgoi97WLUH5QmoJWftdqTw1nI8/1c1aQpe7//8s8zXkFeuEGdWDq8p+4hVmWE+ZFmMiNh8aQ9fUyEcr3FtBB/21mjp8zpqFY7KpkvwcGdRy3N6Sg2VgO7iERaOusUIlOTof9LhcMXfX9j+0Da47Tfzp31yV25uCabnQzh+gJUwZJVZiWSurXpLp2ZFHLdnqricuLnhZsfoz7YWP9+rmF17YPz1/9+THAHHuve/VvZM3JdOCeUYf5Ts/uL62xqs8Wj158CwGxMqh2+6YUgncDo0Oe+Zo1HwHN+dTfW0T2RlAw8GC738ac9j9KIm1idSvCVXqE9+jywZ3K00nq9x8gha5itXWoaEUELYg/wbBFM3IqVc4ZGGImDwOkgap9R5zH3uUtNjKw+rHBaEnT9t/IsrnAzRbpCNNsia50VYL+9sMKVeoi8EKDDIVsVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(26005)(8936002)(6486002)(5660300002)(956004)(2906002)(31686004)(66946007)(36756003)(186003)(54906003)(66476007)(83380400001)(4326008)(316002)(66556008)(110136005)(2616005)(31696002)(8676002)(86362001)(38100700002)(508600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUtZK2ZFMkZUV1l2OU5RMTgwc2RKRCtHdlpSanE3U3Q3ckdlZXlzUVFLMlcv?=
 =?utf-8?B?RHRYa1A2eFREVDFPcWYvUEtWSGE5Y3ZTOFgxdW9hWllIMFJZVmNOQlhvMEY0?=
 =?utf-8?B?Wk9BMTc1bXVlRVdSSVRZNThuRkZVazl6eHlidUhSL1lJVi9jOFhKNzlpL0RP?=
 =?utf-8?B?K1FCZjlGQkZ1UnVTU0V2L1d1M2M0N083S2JMQVUrUjAwUUEwSVlmU0FNOHVy?=
 =?utf-8?B?UEc2blg2T1ZFVFAvYXhqUHE1WGo4THVLQlhPYTZTSHZla3hCQ2EyNzlaN0lr?=
 =?utf-8?B?ejVpRG1EVGdkVzBtYWdjeC9FejJUNE9xTGcxQ2w1RDJqT1dMV1BmaXFJamhU?=
 =?utf-8?B?ekNFNEFURGs1OFlFRUkyV0EyUXNSOCs3ODVVL051TngrNDBjQ2h0NGgrbEla?=
 =?utf-8?B?T1pjeU4vanJqaVFpaEhnVEp6OTVSQTFRZWlleVBpRW5TcXhtSFBpcVowUlQw?=
 =?utf-8?B?c2FTbmFrOGE1THUweDRKbzJ4cmNtUXBrVGRCdW9JUUZDTXA5L1A3NUZoOEta?=
 =?utf-8?B?ZTVOaTdhUHVoMUx5QVAzMzNmR3R2dlRWSm1TK21EcG53b3BqcDFxZEovcUJL?=
 =?utf-8?B?ckJINnlsN1ZHbXhPK1pQUUNxRXUxS0RlcVFKRzJDRXFFWHdNb0NUQnZyM2Zv?=
 =?utf-8?B?ZzdvcTN0N0hnejVFb2wzSmxHUjlOcnBtbVBKV1ZFT3Q3NURzMG1uL2E1NDFN?=
 =?utf-8?B?NnVkckh1UEQ3ZDJyVUU3SVpEejRLVDJYZ3dSZy9TeUQ4eHBIdkw3a1g5Z09C?=
 =?utf-8?B?cHowM2wvRUpMVkt3bHRkSUFmSnBVaEtyZFowMDdNcmZTZ29JSEtLWi9QdWw5?=
 =?utf-8?B?TUdISnJDR2V0dkN4ZnIrKzJXMnJCeVQ1T0JzTWdFTHEzSjNuNk04OW9VSjRU?=
 =?utf-8?B?cWVzZ1FMVjhZT2JFVkljUkl2M3F6NTZyaXptaGZUY2RrN1V1a0N2ajVYWG5i?=
 =?utf-8?B?YXJUMmRZOHlmWnZ0VFByUWhHUmVqK3VLd3dQeitkbXNFQ0htc201b2xGd1hN?=
 =?utf-8?B?a2lHTng1bXVYaDN6dytBc2VVOFpCT0ZOYXVtTURyOWd6UUFPQVF1a01ad2p5?=
 =?utf-8?B?L1BSN1dGb3cvM3VZQnh4c0VnRnBCcEVFczI3T2czYnZ0QXRUVFhEU1lMRFQ1?=
 =?utf-8?B?MElRTWdIbklyY1Y0YzRKNkV3QTFpT082R0FjelNCMXJyZVFxL2hKcDhHZUhL?=
 =?utf-8?B?YmRidlBsZHl6cVgybzZMVDl3VmhFQUtqLzhzZ2RvQzVwb2JkQjljdzEvcU5v?=
 =?utf-8?B?M2VOOXRvREQ0eU9GaGIrK0M4WWtEb3JIc0dzc29FMmlya3VJWi9uZ0g4NTZH?=
 =?utf-8?B?dTZabHphUm5UZXFWUFE4QStkTzVLYWx6Y1JGK2hSRFg2ZitPYmZRWEdXZStn?=
 =?utf-8?B?eTBZK1dXTVJoMkdnNDlESkNmY05vZWhRQXJISWlBMnArRWdSMVNMZmVUTzZV?=
 =?utf-8?B?UUxYd3RHZGFiVUNpL1cxWHdqelJDQWIvcGNWR2xyeWFmaDFVMTJjaVZObS9U?=
 =?utf-8?B?UUJIYmNyVUdUWDZWaERKakh4RThBbTZseXNTRHgvMlBIMEN5WTZiRnZycmY5?=
 =?utf-8?B?aDBadG5vS2lTNnJ4eUM2OFVPd0NuclpXNzI5UXFuSGV2d0dPVXl4WE4zSElk?=
 =?utf-8?B?aEVTNU5waWp2SU5qa2oyaGZnS1NlNlljR2RUQTVWSmF0dWlIUVlUZkVVMXYy?=
 =?utf-8?B?ZjFOdVlDM2V4K0JRRzlXS1hLdm53Ny96bmpJRXJOL0pqR1hsWmVuM1hiQnR1?=
 =?utf-8?Q?SxB645vB4WiFvkfQ4DFB9M0a63LmEa/j2WNGofX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e7e5de-496d-435c-b6fb-08d97cd636cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 08:02:53.4796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+sZiyFJ8WD716nKmKC7dgBHkD9z3Xt0v70LIvLvG/n9jR4UxgdJm4FoSLN6qYKBJ6dAEaJ9AxDwW+T01wi+3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 01.09.2021 18:06, Jan Beulich wrote:
> The function may fail; it is not correct to indicate "success" in this
> case up the call stack. Mark the function must-check to prove all
> cases have been caught (and no new ones will get introduced).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In the grant-transfer case it is not really clear to me whether we can
> stick to setting GTF_transfer_completed in the error case. Since a guest
> may spin-wait for the flag to become set, simply not setting the flag is
> not an option either. I was wondering whether we may want to slightly
> alter (extend) the ABI and allow for a GTF_transfer_committed ->
> GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
> at the same time as setting GTF_transfer_completed).

While I did get a reply from Andrew on this additional remark, the code
change itself has remained un-acked and un-responded to, despite imo
being pretty straightforward. May I please as for an ack or otherwise
an indication of what needs to be changed?

Jan

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2394,7 +2394,7 @@ gnttab_transfer(
>          {
>              grant_entry_v1_t *sha = &shared_entry_v1(e->grant_table, gop.ref);
>  
> -            guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
> +            rc = guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
>              if ( !paging_mode_translate(e) )
>                  sha->frame = mfn_x(mfn);
>          }
> @@ -2402,7 +2402,7 @@ gnttab_transfer(
>          {
>              grant_entry_v2_t *sha = &shared_entry_v2(e->grant_table, gop.ref);
>  
> -            guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
> +            rc = guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
>              if ( !paging_mode_translate(e) )
>                  sha->full_page.frame = mfn_x(mfn);
>          }
> @@ -2415,7 +2415,7 @@ gnttab_transfer(
>  
>          rcu_unlock_domain(e);
>  
> -        gop.status = GNTST_okay;
> +        gop.status = rc ? GNTST_general_error : GNTST_okay;
>  
>      copyback:
>          if ( unlikely(__copy_field_to_guest(uop, &gop, status)) )
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -268,7 +268,8 @@ static void populate_physmap(struct memo
>                  mfn = page_to_mfn(page);
>              }
>  
> -            guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order);
> +            if ( guest_physmap_add_page(d, _gfn(gpfn), mfn, a->extent_order) )
> +                goto out;
>  
>              if ( !paging_mode_translate(d) &&
>                   /* Inform the domain of the new page's machine address. */
> @@ -765,8 +766,8 @@ static long memory_exchange(XEN_GUEST_HA
>              }
>  
>              mfn = page_to_mfn(page);
> -            guest_physmap_add_page(d, _gfn(gpfn), mfn,
> -                                   exch.out.extent_order);
> +            rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> +                                        exch.out.extent_order) ?: rc;
>  
>              if ( !paging_mode_translate(d) &&
>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -307,10 +307,9 @@ int guest_physmap_add_entry(struct domai
>                              p2m_type_t t);
>  
>  /* Untyped version for RAM only, for compatibility */
> -static inline int guest_physmap_add_page(struct domain *d,
> -                                         gfn_t gfn,
> -                                         mfn_t mfn,
> -                                         unsigned int page_order)
> +static inline int __must_check
> +guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> +                       unsigned int page_order)
>  {
>      return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
>  }
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -583,8 +583,8 @@ int guest_physmap_add_entry(struct domain *d, gfn_t gfn,
>                              p2m_type_t t);
>  
>  /* Untyped version for RAM only, for compatibility and PV. */
> -int guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> -                           unsigned int page_order);
> +int __must_check guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> +                                        unsigned int page_order);
>  
>  /* Set a p2m range as populate-on-demand */
>  int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
> 
> 


