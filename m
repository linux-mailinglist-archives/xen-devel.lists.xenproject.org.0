Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3E36ECA5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120096.227108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7y5-0002MQ-91; Thu, 29 Apr 2021 14:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120096.227108; Thu, 29 Apr 2021 14:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7y5-0002M0-5x; Thu, 29 Apr 2021 14:48:41 +0000
Received: by outflank-mailman (input) for mailman id 120096;
 Thu, 29 Apr 2021 14:48:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc7y3-0002Lt-KN
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:48:39 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4c3f26a-87f7-4661-a924-0cfb53d3d8a4;
 Thu, 29 Apr 2021 14:48:38 +0000 (UTC)
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
X-Inumbo-ID: a4c3f26a-87f7-4661-a924-0cfb53d3d8a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619707718;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uGRKuWDFEhDA18TLkC0O0XmtGBHNUZZgLuda8cHIjpU=;
  b=YIc5JG+2yDA4wbmJSsz7RTDkVLw6RdOOBZKQa8zAJg+JSwmek7sPXadq
   4THQ1fFeekwkTC+mkY7KhfEjJHVmJeDssMN3e7hax/62VKF/YkONvhpnV
   87EkanJyOe2cNjkXxKOOVbZ7mIu8DbqXwYmqNzxEVEslrMbnk4iufL6Ne
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j6M3DB7Bbs+8es7ITWchEyYVbv1jP8VrAUkGn/BjMoKxmXNX818WYV9VwRNIJwlEK6QH42SG8K
 g/sU2AVculHLus3MZu7XUzTJkGOe8b+Zg5oAbXeG1AO6odBhURzKag5xE4kW7oPdeFNQBKWlp4
 WezRtiWHTXTjdN45fokeXqDUW7p9ug52/KUqOY8Bax4CuVcyYG5hxJMDjK6Qr8FgC+juILM9gi
 n0BiM21AizN2nBmp1CP7JKAUcTh38BKRgSvxcQITAarbgM0ddGGNB3FV539bVpEf0D/Vf4I8Td
 rJs=
X-SBRS: 5.1
X-MesageID: 44226658
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IKQkzK1jWom5Bk+CmG5S6QqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="44226658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAg/1RJr+GYM6XkerJ5xaWiQ+alps+Yrkm+/ZdNH4j6wMPP511DCVInnjHsZ39g81j43j4Yl5F4j9W9DCwHYXo1o3G59AixIzT2agGxz7VFb5xSH+SBDvodS/YHoekBWsmWyJsZ4t3SiGvTTx/QRg86LZ1sQfVflua+S/QP7uQqYjENKzHt0PCdXRFxqH+6163UNsbaobm1+YS9wx9S1hRl03g95CdHQZW5XoOdpVr+1KVdMkBEqNJI220ZwxNXJcTMoFJUM7P/D1zuhqEa18HdlIXMLfvGS3LWrd804cHv2RlqPQ6R9a95M16lyY9NUupJEwdZO1W8KVpHbQyFEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ts9uf6fqgeWYkiCVUmkIi2paOGwarj6Nlyuw81TH8Y=;
 b=XibxoVjY7h8qY92/SE7wNu5mpOa3Ibg+Gfc0ky+ScJKVTAclLa20SE4jPzsH9zDA6W+QeiwPvPeSGSh/Es8K/lasZX+NwbFeMCw2lWPhnGiO4ZsB8cs7zjSLiPErHqiZSxFHdnCWOSbGtqTIjgJOGwZdG4uSmLISJJUea0CqH/eCsu2sdA9QgLlbNm0INjA68aXYnCqNrX72AHYB6Nq89HOQi0PpLSPYk1fhke1jX7cfTh/8UU74y4R+sFfckQRAX1dthUuYC16CBVDWoW7wE5/RVvNynmx2mI8B/Qsr3AS9yYqaOEasguXMAeQUj0lAm2otrFPiD/T5hvynpeK5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ts9uf6fqgeWYkiCVUmkIi2paOGwarj6Nlyuw81TH8Y=;
 b=VSF0DY8dpQcmS5Q8L5I0xRqD3pe25D+NsKwmIimvkls7gus7q5ddyM1StodPeox//HtpE24xT3GlO7enDBBY0BWn9+f0oISv8b7zfS5WO9nsEUqRsoHslUYcTgUboq7uYd2jxdMH/ZfLfQLn3X/8+EKFaajUZlrGtZjVVKXNnmI=
Date: Thu, 29 Apr 2021 16:48:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 02/12] x86/p2m: {,un}map_mmio_regions() are HVM-only
Message-ID: <YIrHO9N6YgQEOpJh@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <7f8ca70d-8bbe-bd5d-533a-c5ea81dc91a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f8ca70d-8bbe-bd5d-533a-c5ea81dc91a2@suse.com>
X-ClientProxiedBy: PR3P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73594721-1c41-4f79-1c40-08d90b1ddca6
X-MS-TrafficTypeDiagnostic: DM4PR03MB5997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5997B7C55626A426EBACE1D18F5F9@DM4PR03MB5997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udC5F/24Q8rvYIhLPOxFG1ESiZART0mEXQdgkp1zIRq1y6yT130HIPN9eon1mbF9lp5ssYj72ojzWqDmIsoFp4O23v7WBiyHBhlIW8071RGB9cvam/FKCPZVa4wD0h2h/ERGqdkJNrf8UOi5sYe/jfa9Wy40Z9nLqR+q87sap6DfTPH/5AkUD8PkTCpqojbkIPncWBOqNh7FG61u1IiTR3pemj5+PbPszxkWIqqMxAiEYN5+ttDN/LZLK3M5gpZlbCaqN6gPYbyb213dnnzbVQc/J3SrDsJ53n75tdacWbSDHZbKbRui4ObmWfHUxEEhVL+9wXXctN3HDlz8cebFclSgWv0gG/4LWcvCz4ZwdkAT0RgFoazpq9zXWr1SknXhjLrQpdsV2sT3JTM2iOiHq/UR66x1KmGidWr95ZTq/LAZWysoy1vF9DkyVSmbwWGs3GbJVdGNpsQo7KsjKoQfO1NpLq3TCBwatX+Djm66awSMXzgXx1YY9UM3aaCGGPmnTR3UbV5iyOTwCrGH/559LTwiMKpK/ulDkC+4xBLvWNRVdC933TwJmaAxhj2NhrZDXzipoV+g1pW1cPF/RSxsbkndL3jCXLRG72uAkXLwZzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(8676002)(6486002)(83380400001)(54906003)(16526019)(6916009)(2906002)(86362001)(85182001)(4326008)(316002)(956004)(6496006)(66946007)(66556008)(8936002)(66476007)(186003)(9686003)(33716001)(5660300002)(38100700002)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S25mejR3R1lZdkhMZWxlK2N1ck52MmdKdW40alIyOGp0ZnF0cUtDVWJIellI?=
 =?utf-8?B?V3lnRC9HdXdiblJKODZTN2lqTjZqVi9CWmgwZWVlZFR2ZzAxbTF4NWlSNTd4?=
 =?utf-8?B?V2QwNk5uVWNSMW5UbUZhN1NkS3B4dTY1Z0RDYllCaElnQW83NHhzcXJEOE9J?=
 =?utf-8?B?T1M4ZmFEM2FiZGtSalVaOFQybTR0VWxFeEh1SzNCaVdhOWl2UXhRVUlJRUN0?=
 =?utf-8?B?eE9OMHRRMU1rdm9nQXA0aWhVQm5JM3VqUkh1VCtLK1NJUktPNWlIWUNYMm5U?=
 =?utf-8?B?bFRVZHo2VXNxS2lnek1QeVlyMHBzT0UxQzZGRnhNYTV0ZXhsdmExb2FveGIr?=
 =?utf-8?B?ekFhaHZLMWJPeDNGV1hPbVlwSjhNeXdnZGl0V2RWZm9GNzBIajNvQkhtWTdR?=
 =?utf-8?B?RWJlN2pQSDJIZWJObW5NTjc5T0VmVzIrUFArcnVVTFpHclNlZFp0cmY3SnBH?=
 =?utf-8?B?Z0JqZ0llZDNwbU84OWpuTTduVEhmcW4wYmxsTk13cDQ3L3JOQmY1ZDVodzNo?=
 =?utf-8?B?MmNuQXZJcHprQi8yRG9zdW5lNlJibVZobkM1TDJZTE9lMDVvVVRxUnJ2ZzM1?=
 =?utf-8?B?VFQ3UTdnTWdJZ0tRRWp1dGhjM29hNTJRY3QrQi9zc00wQTFvOGtRK2hreVpp?=
 =?utf-8?B?Tko5L3RCQitJRTJQUkxyMWduZXIyYkFPL1RyS2habG0rWHQramVlY1NXUkp5?=
 =?utf-8?B?bW1Fbk80QVNhT05iQit5KzFqZzRRcXpLQ1prdk1wRHZwbFpxTEJMSGpBcHlh?=
 =?utf-8?B?c3ZTOGhjNXU2ZGFOdlFwakxlSHRIRCtRM25RL3V0UDJ4L1JVWDNwWkRGYWVl?=
 =?utf-8?B?My8waFpZckM3Yk53ZU82QlZvZW51WjlNQTVjWVQ1S3lQeFNwMWdJWndyeEIw?=
 =?utf-8?B?VmJvMGV4UkhoU1BnRmVFV0s4WDVsVk5RbWkzK0xpbm9VZ3FPb2xxVWJHbm5y?=
 =?utf-8?B?OVMwdHhYN2gyVzc1WEFOMjMvbFYweS9TQnlqV1N2L1BGdWt0c1BwN3RXLy8v?=
 =?utf-8?B?UkpHZUVtYXFhZHZMa2lyU0FBUzJpc2s5eWplcmtjM1gvZ2RYRzQ4aGZNdE94?=
 =?utf-8?B?eGVBN3dkT2RLQytjWGM0MEt5UlZ4M1A3ZUdiQWExSW5ySldmWUNMV0IvNVBw?=
 =?utf-8?B?V1hhZmg0K1I4V2thRk1tb1d4dW1aYitlcVUxbGVoUmY4WGk3NEVxMUNjQUZQ?=
 =?utf-8?B?bmdSRUNLQ1ZzbGZ4NzI3VFBUQXc2MHVod3VEYk53cjBXNkRwcFR0OGhPVXhN?=
 =?utf-8?B?Wk8yaHE1aUw5YVVOazVqV054TUFYZ05lbGRjamVKZ3RTaXI1U0lHWDh2UDJD?=
 =?utf-8?B?VU1EVFNvN1ovSlhaWnVMdnZSNlRCVEoxU3ZWMUdhWkVzaVh6N0lDVUdSelNM?=
 =?utf-8?B?bXprR1AxNGd5TnVnMWh1ZzFzdEF0V0NhUm9TREJHaEUrY29raVZSKzl5eHpj?=
 =?utf-8?B?ZFpQSmsyTnVNK2xsZmU3elRycTR6eHYzVzN0TndhYWUvb3ZYTWtwMzJ1TC9I?=
 =?utf-8?B?WkYxVXVZNU1hT1NHeUVkbjBwelo1RWttTFBNSWV3TFRubzdpd2Jpb0dHYmpy?=
 =?utf-8?B?Rm1TQ2JJTnFXUXM0cFVldzJlL01td2xMUFV3aklsRlUvRkR4ZTlZUmUzY25U?=
 =?utf-8?B?emNDVWhBVVZUd3FRR3BsclVkam1FY0JIdXJiNjRLcHN2THdiaEw3d09TUDBy?=
 =?utf-8?B?WHNPZHBZeTMvNVRLbWFBWGtVWk8xbzJMbFN4ZENSTk1LVzllb1prT1pFUXJO?=
 =?utf-8?Q?h3n27gav37sIdMbdkgSzgDkISsO1DlFbX+L+fFI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73594721-1c41-4f79-1c40-08d90b1ddca6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 14:48:33.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhyHzAaq8i4o8XeIkXGfoJT5AzrTKUFrKtkp1Gi2i1SWs6+4+zsN5tnFi37VdXHYi8PlelTYImPlKoXkHkv0Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:06:34PM +0200, Jan Beulich wrote:
> Mirror the "translated" check the functions do to do_domctl(), allowing
> the calls to be DCEd by the compiler. Add ASSERT_UNREACHABLE() to the
> original checks.
> 
> Also arrange for {set,clear}_mmio_p2m_entry() and
> {set,clear}_identity_p2m_entry() to respectively live next to each
> other, such that clear_mmio_p2m_entry() can also be covered by the
> #ifdef already covering set_mmio_p2m_entry().

Seeing the increase in HVM specific regions, would it make sense to
consider splitting the HVM bits into p2m-hvm.c or some such?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Fix build.
> ---
> Arguably the original checks, returning success, could also be dropped
> at this point.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1352,52 +1352,6 @@ int set_mmio_p2m_entry(struct domain *d,
>                                 p2m_get_hostp2m(d)->default_access);
>  }
>  
> -#endif /* CONFIG_HVM */
> -
> -int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
> -                           p2m_access_t p2ma, unsigned int flag)
> -{
> -    p2m_type_t p2mt;
> -    p2m_access_t a;
> -    gfn_t gfn = _gfn(gfn_l);
> -    mfn_t mfn;
> -    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> -    int ret;
> -
> -    if ( !paging_mode_translate(p2m->domain) )
> -    {
> -        if ( !is_iommu_enabled(d) )
> -            return 0;
> -        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
> -                                1ul << PAGE_ORDER_4K,
> -                                IOMMUF_readable | IOMMUF_writable);
> -    }
> -
> -    gfn_lock(p2m, gfn, 0);
> -
> -    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
> -
> -    if ( p2mt == p2m_invalid || p2mt == p2m_mmio_dm )
> -        ret = p2m_set_entry(p2m, gfn, _mfn(gfn_l), PAGE_ORDER_4K,
> -                            p2m_mmio_direct, p2ma);
> -    else if ( mfn_x(mfn) == gfn_l && p2mt == p2m_mmio_direct && a == p2ma )
> -        ret = 0;
> -    else
> -    {
> -        if ( flag & XEN_DOMCTL_DEV_RDM_RELAXED )
> -            ret = 0;
> -        else
> -            ret = -EBUSY;
> -        printk(XENLOG_G_WARNING
> -               "Cannot setup identity map d%d:%lx,"
> -               " gfn already mapped to %lx.\n",
> -               d->domain_id, gfn_l, mfn_x(mfn));
> -    }
> -
> -    gfn_unlock(p2m, gfn, 0);
> -    return ret;
> -}
> -
>  /*
>   * Returns:
>   *    0        for success
> @@ -1447,6 +1401,52 @@ int clear_mmio_p2m_entry(struct domain *
>      return rc;
>  }
>  
> +#endif /* CONFIG_HVM */
> +
> +int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
> +                           p2m_access_t p2ma, unsigned int flag)
> +{
> +    p2m_type_t p2mt;
> +    p2m_access_t a;
> +    gfn_t gfn = _gfn(gfn_l);
> +    mfn_t mfn;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int ret;
> +
> +    if ( !paging_mode_translate(p2m->domain) )
> +    {
> +        if ( !is_iommu_enabled(d) )
> +            return 0;
> +        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
> +                                1ul << PAGE_ORDER_4K,
> +                                IOMMUF_readable | IOMMUF_writable);
> +    }
> +
> +    gfn_lock(p2m, gfn, 0);
> +
> +    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
> +
> +    if ( p2mt == p2m_invalid || p2mt == p2m_mmio_dm )
> +        ret = p2m_set_entry(p2m, gfn, _mfn(gfn_l), PAGE_ORDER_4K,
> +                            p2m_mmio_direct, p2ma);
> +    else if ( mfn_x(mfn) == gfn_l && p2mt == p2m_mmio_direct && a == p2ma )
> +        ret = 0;
> +    else
> +    {
> +        if ( flag & XEN_DOMCTL_DEV_RDM_RELAXED )
> +            ret = 0;
> +        else
> +            ret = -EBUSY;
> +        printk(XENLOG_G_WARNING
> +               "Cannot setup identity map d%d:%lx,"
> +               " gfn already mapped to %lx.\n",
> +               d->domain_id, gfn_l, mfn_x(mfn));
> +    }
> +
> +    gfn_unlock(p2m, gfn, 0);
> +    return ret;
> +}
> +
>  int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
>  {
>      p2m_type_t p2mt;
> @@ -1892,6 +1892,8 @@ void *map_domain_gfn(struct p2m_domain *
>      return map_domain_page(*mfn);
>  }
>  
> +#ifdef CONFIG_HVM
> +
>  static unsigned int mmio_order(const struct domain *d,
>                                 unsigned long start_fn, unsigned long nr)
>  {
> @@ -1932,7 +1934,10 @@ int map_mmio_regions(struct domain *d,
>      unsigned int iter, order;
>  
>      if ( !paging_mode_translate(d) )
> +    {
> +        ASSERT_UNREACHABLE();
>          return 0;
> +    }
>  
>      for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
>            i += 1UL << order, ++iter )
> @@ -1964,7 +1969,10 @@ int unmap_mmio_regions(struct domain *d,
>      unsigned int iter, order;
>  
>      if ( !paging_mode_translate(d) )
> +    {
> +        ASSERT_UNREACHABLE();
>          return 0;

Maybe consider returning an error here now instead of silently
failing? It's not supposed to be reached, so getting here likely means
something else has gone wrong and it's best to just report an error?

The rest LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

