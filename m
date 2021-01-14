Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A532F6398
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67060.119377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l047m-0004nz-3D; Thu, 14 Jan 2021 15:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67060.119377; Thu, 14 Jan 2021 15:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l047l-0004na-Vg; Thu, 14 Jan 2021 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 67060;
 Thu, 14 Jan 2021 15:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l047k-0004nV-2h
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:01:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22832ab-1867-465b-9ce5-5589ba4cfe19;
 Thu, 14 Jan 2021 15:01:18 +0000 (UTC)
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
X-Inumbo-ID: b22832ab-1867-465b-9ce5-5589ba4cfe19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610636478;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pakl73eEZUJ4PISqsSIM2hBXDv5oCmdjdmld0UIStgc=;
  b=byleTcvNmQpUne4bhjhAOJQgrgKX8jBZfclWceNKIv3xxiX/mTIHycAS
   zWa2FyRw0UbvymodhL2z3nPL2nITKfaiZQuc/q/tv4d/LoznLzdLd4TDm
   TEi3VhopdpDmvoePHPoFVmytg2zRzfhrG2ha4cPyXGo8BjRXS4GXpFtau
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hvASdtkYzqflHYWubjnAin6kyGYzgPhDAXEt2XwaTiP/uB3D39npFVgzn08HuNaI9lEWbjrmmF
 /LyHhjvb/LCVgSyVe2hTlJ0R/BR4k24zGlpzYMYr4R/qhtjf6Axc29B/hjrjYpJddJPVj6Bkab
 L9b+EPV1bKv1jH3Lfkshl3KDsgiieg2Etc5mAni54LZ24XP743awiNthuDw3pPYghXPTYbZoYD
 lgJnyyZxfjhW4RXT51gB0rn9C7o06wC+Skf6pnOzOGgbBhS1QTMgHA1WqFN5VqmtZDGeZLmE//
 8x0=
X-SBRS: 5.2
X-MesageID: 35080544
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35080544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLC+6MBASQ+/VH7sWbkCqnXK0B9bsH6YKVaUlTWQs/rf5FoGTnFLnUanyg2HrvRISbrXGrjm2Bdr/luev2BuiAc9TJ7FxDzOciMFkm3SgHU8HnU9RaFlklm8KoMVMyeegjmnlt3XGzTU2RDPWyHZ8lBQTP9SXyQaIStlnNMfpg3oNKoo9Psehq1xOPpAuhaAycxBw1torik+bg/EXC3oijGZ4JAEPRE9qCVmx1wLFBhUXoiELo95ws8Z2K1NMwvSp0NWqhSfKHWju6GPqr1Q4E+Lz3swsZmUVtugJzG7gpzsaTntIhhTiGOVWKEvsJ7MH4Hpy9boylvoeSKfMeLtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jCh94g6oZvKC5v97eK4sFOl++geGsWjx4TERsIiFmo=;
 b=ISaW9b5LyH/IUzvnaoJvuD3ZEE3IHgGSPLlh99Ke8e6OnFK+Mvw7IZ44W0yQY/M1PKXH7MP2OCTTvoYKPTneWWJ/dtGj5NgHaVksIyB15a/AfFZHRkqCy5hwUSpsjldPpNnLOGsQAzT+j8MuXHuHGBwNM/hO+eiPWj2TzWXIxm8KmoQLVHitT3F5mXKTi6AcoHizgsBoRE2GXiQS98whPzU07WEv+3Vl6mb68S1dTc6PuhPZPA7jAmJslH0xY1vFcFEbjeYBn4jTEb6ZHA9WEXYcZ+oX+Ax+uJcP0ThJhbuy7mQyLPMe8ZWlTSUdwVEl5RYB32ueLmgnyZgAxN5+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jCh94g6oZvKC5v97eK4sFOl++geGsWjx4TERsIiFmo=;
 b=LaSY0qX6SaGv3XPhh7wptWsxc1OJDVF4RTorB9r46sJXZErX2nXScTttVMWonuZ/oR4W7Spis/Ph2KkrDwO7Mvtliqyo2R2PL9/ZChp56ktztLlzpI0X0gWnwIo4uOXQJGME+Cu9FjIUbVEeEleyj9TuL14C8CdkfOMEtcexfWU=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c0ebca6-a5e9-36a8-cfeb-6abc0fc7c2af@citrix.com>
Date: Thu, 14 Jan 2021 15:01:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a46167-84f9-4fb9-77c9-08d8b89d3d3f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB512728F5A1E62DC1FAC55D02BAA80@BY5PR03MB5127.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOojRp2d257HrVccZf3rnLi4uxbXhM4nl84ixzQixz8qdKh1cItHN945T8g9cabUbMm1LLeBzaZr5HPmx5yozm6hDfJ5qdrHUwXqWDXY96wcLFXb9+xDJmz4KoIM4juO7apZM7flhqrl+TNlXgw2nk7uCiUe/DlKhvy6pCS/U8Te0MboGaG/AN7Rk7cLDwEx1yd0mj90Hc5zUOm6IO1W7o2ZrZJQ9yYfZxP8YQSlS1jkTLHYd74nWmVPxYvyQSlPgTXEEJt+4D1HSZNdM7wQRybn6vR2ucXBOC67JPooibBa2UKHkLQ6ZHJ50zrnL9i2Pevi9eJC+4vP8eWuQioXJOS37UIw1BpM1pIxjqiDs77hmUp4+9Sc6VFPwrtp/bgGd/pGemeVNymHTXTg7s0Vi7sTQXWCvr7Ba22dyWrdSgUsgqlWBA1h+NYO3Yue0sN7VLNNR5DSl23cqsj5W3NBAPpAyaIRngFkQzXJW2WXsYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(86362001)(316002)(110136005)(66476007)(31696002)(6486002)(16576012)(956004)(8676002)(5660300002)(54906003)(186003)(4326008)(36756003)(16526019)(31686004)(2906002)(478600001)(53546011)(6666004)(26005)(8936002)(66556008)(2616005)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emxvVmZySjRvQzdQczFtaFdGVjh4RmZVdzJQR3U4SkFod1c0ME5BaW1yb0Ns?=
 =?utf-8?B?MDZMdUdBeUFVVmVsdjRacGVwR25taTQybnpHeE5QQU1scFhTZWNMQ2tmTWlP?=
 =?utf-8?B?NlNkaHBENXJvM1g1eG8ralZDRmE4WEJucVdnMzRPc0RKSTF2eDdiYlA0dkND?=
 =?utf-8?B?VUlIZmprY1J5Q2RnYWlNd0wrVTMwamFabFAyOTROMDM0bHphYStKUUoxYmNK?=
 =?utf-8?B?ejJ3K1BDa3NYcUtCNE5pNUpLMGpKYWxHSDB1WTYrTTFDdE03UmxqRDUvcGVo?=
 =?utf-8?B?ZWNPd1BmWk1velE0aHlwUXlaY2xYN2o1bW5weEFXYXM2bWtzSXpqQUNxRTla?=
 =?utf-8?B?MDFpZFdyVkNmNHluMVd4QmFoMUd1eXk4cXd5OVEvVlJyM2hGRVZiV3JHVVli?=
 =?utf-8?B?SjRSTFQ3VW9vR083VXMwNHVoRnZnOFFHaHpKaVk2YTRSMkdNS0VQU1dvZUN3?=
 =?utf-8?B?QlVab2FRRytBeUFMUzBuRnpjd01qSkxBRGdaa05nUWlqTktXUDZZSDJWdkNM?=
 =?utf-8?B?MXk2UUM5UzdxRll3cHJiclhLNnhHNUxSQjlnSXluWnhqMHlPTHZoMTdBdWcy?=
 =?utf-8?B?Zk9UeVNtUDFTM1FUVnpWVjdWenFGZFZCVmMxZ0dlVFg1dDhiYzZsVURXM3U0?=
 =?utf-8?B?ZmNLYW1nWEtrcmxvSUx2NzVoVmNPMTJGVW5CMExtK1VKdnM5S05hMHFEcXdz?=
 =?utf-8?B?RDg0N1hZTmRDVmk4ZFNjeHoxUndEZFYxNjVPVXlNcDE3NllxRHR3RnFHcURm?=
 =?utf-8?B?TWFBOTduT0tyVjdySk41dllxYURlZDVkMDVJWGp3eFMwZlBUY2dZMFpHZFNE?=
 =?utf-8?B?Y3dPNlU4dnFMTGZZOEJWdzhvaGdJMVgxNEYwUm05V3YwbTlMNmlBVFoxaVZq?=
 =?utf-8?B?VTNWTHZDUUZHOEw4emlwOXBSdlMybWl0V3VVcTFPVUZqY1BTbTVhbGdGYnVs?=
 =?utf-8?B?Wm9uSWZta1YzV1JzZm14RWJxV3J0WGlUaWpoVGgyclRHOWdwZlVuVUl2WlZu?=
 =?utf-8?B?RWJKaHhQend5ZDk0dmprd3JQQnJyQUpacHhtb2NvUk9uMnlMTzF1c0xiVmRh?=
 =?utf-8?B?VFdBU05KOUlPU2J4SFJHVlM0TzVWMGV3UjdNbkpOYkQ2WEhLRk05b0RoY2dN?=
 =?utf-8?B?eFQ3K3dRYnJ4VCtCZkFvc0wwZklFeWwvYi91YjRNVzJaYTduOVlpd3NxTFdu?=
 =?utf-8?B?QkxMYkVFVjZTQUhLZ1hQNTVXRUgvMk5qRDdoNnllbjZLb0VYOXk5SnprRkIv?=
 =?utf-8?B?ZlA3cHdvUjhSRDc2d284b2lHenlqYkVrRDlXL2wxM0pRcmpFdWhQeFVMYi9D?=
 =?utf-8?Q?0n0uobAa9r+IG3dmmrySWRc/b7Lzm/sQi+?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 15:01:14.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a46167-84f9-4fb9-77c9-08d8b89d3d3f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcTIfuW2e2a12cTGokHBgnCMlzCaGTxrjnBtqv4y1jzHpsHSH6XfWK10BQW2/alJ+/TTRLQ0tvhLaPojDoM2lmald8saK+KNFfYG45tbdLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5127
X-OriginatorOrg: citrix.com

On 14/01/2021 14:02, Jan Beulich wrote:
> It's not overly difficult for a domain to figure out its ID, so
> requiring the use of DOMID_SELF in a very limited set of places isn't
> really helpful towards keeping the ID opaque to the guest.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2776,15 +2776,19 @@ struct gnttab_copy_buf {
>  static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
>                                     struct gnttab_copy_buf *buf)
>  {
> -    /* Only DOMID_SELF may reference via frame. */
> -    if ( domid != DOMID_SELF && !is_gref )
> -        return GNTST_permission_denied;
> -
>      buf->domain = rcu_lock_domain_by_any_id(domid);
>  
>      if ( !buf->domain )
>          return GNTST_bad_domain;
>  
> +    /* Only the local domain may reference via frame. */
> +    if ( buf->domain != current->domain && !is_gref )
> +    {
> +        rcu_unlock_domain(buf->domain);
> +        buf->domain = NULL;
> +        return GNTST_permission_denied;
> +    }

In this case, it's also a weird asymmetry where this is one grant table
operation which a privileged domain can't issue on behalf of an
unprivileged one.

> +
>      buf->ptr.domid = domid;
>  
>      return GNTST_okay;
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2566,13 +2566,7 @@ __initcall(register_heap_trigger);
>  
>  struct domain *get_pg_owner(domid_t domid)
>  {
> -    struct domain *pg_owner = NULL, *curr = current->domain;
> -
> -    if ( unlikely(domid == curr->domain_id) )
> -    {
> -        gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
> -        goto out;
> -    }
> +    struct domain *pg_owner;

I'm not sure this is correct.

It isn't a DOMID_SELF check.  It's a "confirm the nominated domid is
remote" check, and I don't see all the callers of this interface having
appropriate checks to prohibit trying to do a foreign operation on
oneself, however they specify the foreign domid.

~Andrew

