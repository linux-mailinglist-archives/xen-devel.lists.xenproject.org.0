Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF442F03B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210403.367256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM1U-0008I6-B2; Fri, 15 Oct 2021 12:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210403.367256; Fri, 15 Oct 2021 12:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM1U-0008GI-7t; Fri, 15 Oct 2021 12:09:16 +0000
Received: by outflank-mailman (input) for mailman id 210403;
 Fri, 15 Oct 2021 12:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbM1S-0008GC-HT
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:09:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8793b47-f45b-46f7-8aee-410e228fd8b0;
 Fri, 15 Oct 2021 12:09:13 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-7Supj-IEPneeUSJwkLTYIw-2; Fri, 15 Oct 2021 14:09:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 12:09:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 12:09:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0037.eurprd05.prod.outlook.com (2603:10a6:20b:489::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 12:09:08 +0000
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
X-Inumbo-ID: f8793b47-f45b-46f7-8aee-410e228fd8b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634299752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QB2nMFTzniCHD9QkSOsZAfdws39Ns2c+rtN6WG0uAqA=;
	b=dkzuevNU2tzq+bRODWtqkfvOjgk28J3QyTUBzHJW85UGZeU1yh5U1JEHBOkEcryx9oFNPh
	EalbSqsmAd5UOkEBeHXVvyvajNffteRHbkzv32gp9BP7NUVvSVEkWb6LKFOj70JBntIhrO
	1zoEN0IOXPuPV/dYlw+PoxYueOZG8BA=
X-MC-Unique: 7Supj-IEPneeUSJwkLTYIw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI90MJESIXWqDFRJ7dyuci2sk3Z1BxHnKTmK8PHcNNcoU5ynsgEUhd6+XRlKdXtV7ZzmY3XI6F3Kq1C3wQp4NppxkIxW/2ykz4X4Y2XyOgdq/p5Ffhk/zwfNaeIYfiV/+kxyhnDWKTd5GOqU7BHWYPBvLfi5qklhcp2F+sJfGxHCbsrgup6YjMsdpoejan/yM81nOguxjMvPbayxycgHRGA4ieInFl5NwJeNwS7nPkqkXKk/AWUSvf98bYzozyKxylq5oGDn7G42DgLxazR3XOGKallFLoRdum5e5sQnyg08UYpxFauMWn3RVCuGKQWeHM12VZM4GaZoUfpJrkqjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB2nMFTzniCHD9QkSOsZAfdws39Ns2c+rtN6WG0uAqA=;
 b=YhzMorxCMEBDGWlh+6MfUAWfTiSZ8ilSLKhz5R8Cw5Qh1d5Ke6hoTFYsSnwOuWIDKh6ihstaxHjGzx8L032kf5fQ2n6oYhn0bWdgq8ioSmRth3zNFhaNCSPmRdyvF+eRdPqlnKmRL+lyP5w7jY7egMXFK2IZh2YxQw8ZhjQddNsBMZ0Kyv43Hu0mauWyjeIHdrEXNceJHlYiSgEqalKWgumwigu+54XaAsO4F3HGINQGngwzsFCO7btzXYPDvXcFKdX1HC0YbgdaKejysCJX0MRl++o/Za65JE3Bq3Iqe9ch9Mi3gyQls2xiEhuoFCfkhlxSGUA/azQCsd7xwY8ZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <379abbd7-da1e-cd20-a5a2-0f2849fb69c6@suse.com>
Date: Fri, 15 Oct 2021 14:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0037.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f90effcf-34a0-4938-62b8-08d98fd497bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304750A83BEEF5302E2F387B3B99@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fta6wI1r+gujSne4g+q3DwjC9H723H7svCBE9I9vgZOJA9FxXVKAlbdF04aQxR56X/km78MEMjJJZAalsCpjoPTOyt7ScJXU3UYQ+3rZHR68Zypbjbghp0HtUjZV36qkBmiEzaqzZuFRdLfKgLv9chPCBcW5Dy+jFrmBha7OWmvxsGuXzP6jtJq0np8yiashDSkLyzwGbNmEfHTVUjR3QgEHr9f4fbOxOwVKiDFXL9bS7q2e80R7N1K/B+qReO+aCaLOA6/V1F6H9QC20x0oWkKEDhtSuZKsstD37m59jmyxnxvkwc9q/x1tvTMhIOvdZdmq409aFXf08H8F6od6al4lzzCUlBebA51Nka/shPNIY22bj43icVS3mluMXXykWuWZ3ffhafi33FQ0j2kKjYwwD4p0jKAlVhPuiJUasVV3ZFRPnzfAG1ISlX/1KXkfcD0XrP5bQB1CLCFL354LQGf6wCZB7BkvQZqZ9JYCu5zhjTBnchsdilk49wiS+pd0bFA1Wkq6hnwDsEqo7OqfJp30qAX3YkbXoZQDAF3CoDwwU08AdNte0XunXOn06mC1xSX6Ia5utCPe/HJnW7AXyl9m/nd9Wd2ADXh0W9/fF/GBcoRHB+77N5qXOnyvw+gIqNunCK2oomAKQ3FBtDPZpwbfhPSnI/hr6P/4iT5/xHaBpGvSp4hzQhjf0j3DzdERDNCwVEKNiJh/Kz+97IdlenGnikBvC8IOBcaksp/JMt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(508600001)(38100700002)(54906003)(83380400001)(5660300002)(36756003)(8936002)(2616005)(31696002)(31686004)(4326008)(6916009)(316002)(53546011)(2906002)(956004)(86362001)(16576012)(66946007)(66476007)(186003)(6486002)(66556008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhLaWp6R3dtQnJUcUJxUDJaejh6U3g2dEJlRzlpRUNOSUV6ajRUMHRvbjN2?=
 =?utf-8?B?c1VNeGNpdU85Z3JrbFMxaEZJQndZdXFJVnp3UVlZWjlqSkh0Y0t6akY1VjRY?=
 =?utf-8?B?eG5UbnByaG9IOVNWUU9paWdkTGYxakt3b2hIZmdIanMzelgyWXhQVDlqSHNC?=
 =?utf-8?B?UTBXR0ZZakJ1WDZkdC9uQ1NNQUdEVktDeVdEdEdBemRZZU1XTjI4OWRvdHR1?=
 =?utf-8?B?dU5KQmNuMEVMVWRkQWJodlovT3hIUkQrTUJFcWx5ZEUreHNsNFNSZmlGSFQv?=
 =?utf-8?B?NXdtUHZDQ0dCUndHeWhNWVVqSnhuOFhQeTN0bVdoYy9EaXJ2K29zaksxMklQ?=
 =?utf-8?B?YnYwMXIyb2RBc2E4TzhhakxzMGkvUGZWNHVCdUN0ZlBORWFnKzRFT0hiNHlD?=
 =?utf-8?B?Ylk4Mm1GRWtQME0vbzRtMVhxVkIvUzFEcGoxYVUxV0FYM1lzQVZxWFYzTzdp?=
 =?utf-8?B?cFZYV2g1bjc4QzR5WXdlcUIzUndMWkRjTlE4dGdzK0YwV0xrS2RuTHByYzlz?=
 =?utf-8?B?OW1TZkZ4ckJpQWVkTVpoMVVRMUJrWDM2SElMaUxLMlE5Q2JqcGgvS2VLTFJC?=
 =?utf-8?B?S041SURTQ1h3SjYyL2k0cnNncVBTYXc0NmZhODhhY1dSeThoVVFWZlVFaHFE?=
 =?utf-8?B?RnJjZjNhbUwrL0dDZXArNzc1Y2FBRUYxTGFZSjVqSEdmNW90NTFpS2o1eitO?=
 =?utf-8?B?MHFGUVJacTlJTUt0bjZ0SVhHcUFyRUdFbEZYR2dIZ3Noa1A0VnA0bTR0Rk5S?=
 =?utf-8?B?WHNvTEFtUzZvbzlnWGxuZWZjaHdNZzZXRzYxVytFUzRyTkdoZ3lNSTVTdFAz?=
 =?utf-8?B?QjQzUlB4L2dEcjJ5azVJU1JiQnNvMURaVmJGVGZYTUZtNHBLeSt2cit1TFgr?=
 =?utf-8?B?TlF5VFZVaUVSYlZURStHR25CcWZDUFh0QnRraFVjbCtSeUdYMHNjRTZpSGFO?=
 =?utf-8?B?OXJGVGRNa21zSUtNN1VUSjBQbjliNEVQajdnRU5NdzY5cFlLaTNPRVdIQ1ky?=
 =?utf-8?B?ejBFalhzOWU0aFFTZ1Z5emdzWWFnVUNyZ2xuVXBmWGF4enJSd3dpc2wvY253?=
 =?utf-8?B?RWdVVXFwZk9PY3VDa1ZaV1UzT1d6RnM5b2JvbEFqRUpCWjZWUTNMNHM3SDVo?=
 =?utf-8?B?WmYrNUswSlB0VkFjZ1B1OW1ZN1l0Nm95OHFIVk9RckJSK3JiOVY0N2I2NThY?=
 =?utf-8?B?Vm5UL1hMeDBwWEJjYTg2anFpbGd4QzZGMGcxYmxiTDlqS1lITUt2YW5VUXFP?=
 =?utf-8?B?R3hVT2RQMENxNUNsYkg0bFdIQnRhWm1NSEVUbHQ2UzF1SVNSRGJWT1JFaDM5?=
 =?utf-8?B?Zlc5TG9xd0tGTUtHN3I5dERtZGZKU1B6V2hQT3l3cGdlSjhYbjI4K1F0NzlK?=
 =?utf-8?B?RVMyZHBiNXRmemZTbHh5OFVPSTQ2OFRyNFpmRHo4RVlKK1NDWS92dDV0VGw2?=
 =?utf-8?B?dGl5VXV4b1d1WGZBbU1veTlNMFZTa3Fac016alBmMDk1Z0VqRW1PVnBnWE1Q?=
 =?utf-8?B?cFl3N2FrQXhpRnFid3JMc1JsL0FUZGJKOWU1cEtLNzN6NlpXWENoMXArakcy?=
 =?utf-8?B?aXV4ZENONThmeFkvSWw1TXAwUDliQUJEb3VxaC92dXFIUkFTZ3pObnpXYlN0?=
 =?utf-8?B?MjJtZjZnbTlsTm5kdzArWnZTQVpKWndSc1hQMVVqb0huOU1yQUhmdGxzMERX?=
 =?utf-8?B?c1gzdmk3M0R3YXExc1REWXlBa2RPazN2cWFmMGFOMjBNRlhFSzYxZUtlcC9y?=
 =?utf-8?Q?ivBu0sVyCzcb3bzeKpoHEukpeV3+FZ4HxQNqdce?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90effcf-34a0-4938-62b8-08d98fd497bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:09:09.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEEaQvjxkxfuqDG/QdADAQtEGc/ApgAdOEmKr5hwWKo+j9s+nqABCCsWWdVzM4Q/IvIrU7nKHg/TyUzyofDYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 22.09.2021 10:21, Roger Pau Monne wrote:
> Allow setting max_grant_version to 0 in order to disable grant table
> usage by a domain. This prevents allocating the grant-table structure
> inside of Xen and requires guards to be added in several functions in
> order to prevent dereferencing the structure.
> 
> Note that a domain without a grant table could still use some of the
> grant related hypercalls, it could for example issue a GNTTABOP_copy
> of a grant reference from a remote domain into a local frame.

I guess I'd consider this wrong - no grant table should imo mean no
grant operations at all. Disabling granting can be done by setting
the frame count to zero, while disabling the mapping of grants can
be done by forcing no maptrack table.

That way the number of places where checks need adding would reduce
quite a bit.

> @@ -1037,6 +1043,14 @@ map_grant_ref(
>      }
>  
>      rgt = rd->grant_table;
> +    if ( !rgt )
> +    {
> +        put_maptrack_handle(lgt, handle);
> +        rcu_unlock_domain(rd);
> +        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
> +        op->status = GNTST_bad_domain;
> +        return;

I would pull this check earlier, to simplify error cleanup. It
could live right after having established rd.

> @@ -1367,6 +1381,13 @@ unmap_common(
>      ld = current->domain;
>      lgt = ld->grant_table;
>  
> +    if ( !lgt )
> +    {
> +        gdprintk(XENLOG_INFO, "%pd has no grant table\n", ld);
> +        op->status = GNTST_bad_domain;
> +        return;
> +    }

While this is necessary, ...

> @@ -1406,6 +1427,13 @@ unmap_common(
>      TRACE_1D(TRC_MEM_PAGE_GRANT_UNMAP, dom);
>  
>      rgt = rd->grant_table;
> +    if ( !rgt )
> +    {
> +        rcu_unlock_domain(rd);
> +        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
> +        op->status = GNTST_bad_domain;
> +        return;
> +    }

.. this looks to simply be a bug check, i.e. may want to be BUG_ON().
There's can't be anything to unmap if the mapping of a grant of that
domain can't have succeeded.

> @@ -1556,6 +1584,12 @@ unmap_common_complete(struct gnttab_unmap_common *op)
>  
>      rcu_lock_domain(rd);
>      rgt = rd->grant_table;
> +    if ( !rgt )
> +    {
> +        rcu_unlock_domain(rd);
> +        op->status = GNTST_bad_domain;
> +        return;
> +    }

Same here, I think.

> @@ -2138,6 +2174,11 @@ gnttab_query_size(
>      }
>  
>      gt = d->grant_table;
> +    if ( !gt )
> +    {
> +        op.status = GNTST_bad_domain;
> +        goto out;
> +    }

I'm not sure here - I could also see this report zero (and success).

> @@ -3270,6 +3327,11 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
>      }
>  
>      gt = d->grant_table;
> +    if ( !gt )
> +    {
> +        op.status = GNTST_bad_domain;
> +        goto out2;
> +    }

While not simplifying error cleanup here, I think this might still
benefit from getting moved ahead of the XSM hook. There's no point
querying XSM in this case.

Jan


