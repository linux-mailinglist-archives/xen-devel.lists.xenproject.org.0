Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D7474399
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246741.425526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7ze-0004dg-Ew; Tue, 14 Dec 2021 13:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246741.425526; Tue, 14 Dec 2021 13:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7ze-0004bt-Aa; Tue, 14 Dec 2021 13:37:22 +0000
Received: by outflank-mailman (input) for mailman id 246741;
 Tue, 14 Dec 2021 13:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx7zc-0004bO-LF
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 13:37:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f54d9cd4-5ce2-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 14:37:19 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-6LB8YFTTM_m-oxuEfhiy-A-1; Tue, 14 Dec 2021 14:37:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Tue, 14 Dec
 2021 13:37:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 13:37:14 +0000
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
X-Inumbo-ID: f54d9cd4-5ce2-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639489038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67ANt6WrOHi8j4wVKlSSrrOphozpRx579YorBVJoke8=;
	b=OUh3Cr/cHYGu3K9FPNg/X5nn2hAD0YO05+/kxYBM58Lm6FYsppZ+k4vS+cqazGgfVAQbiG
	QkmBAGiFbS554ix7F9immxhD2z14HTNU+4R4XpdMmKUMu5UO3yg5Zf6/786jJEWTVg6tuy
	35uqaR0qqOIaIvwS/AwZvmE2iOokwbY=
X-MC-Unique: 6LB8YFTTM_m-oxuEfhiy-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKVbWLvzQO3aXlRB6enybpNwVT62jN6bKETAokqR2OZrnoPMFoxT1Cr2LbbYTIHflMtcHw+eNp32Oi1nRXGHbqidHNJu78OPNDa722xIpsrgNiE5rf6DRDNQOLdNbu0tL+t6VQRXoiOvEZz7BZao1eEhgznNq0z1LEBoTE0IfHgJPo4ckV4AMA94jb5QZgS33XQdOTDIKP6u4C7/0sBAJlbByNcGlLDXU6JDtiCQxzkbGhzFJ4oeHq/VMkSzyX8vjwNjsbTzHIN1H49nwiRpSU1qMssyNUiRLdw2GC29lYiIGgJuw+pOoBU5iK65FpHR72VXWGiqh1oLKSVUTZtbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ANt6WrOHi8j4wVKlSSrrOphozpRx579YorBVJoke8=;
 b=Hrprz23H7WYxX6vjfPjhk1sf+pV/pyF1e5IbjY+KBQGIETKr26sNrFzlIZ/BIBGvdPS+gIgmS4AamAHcklB3Tl/7l+Amr/cyY69cVFBqnAI7T6EJILSxGMK1uYCUCEaFLk66dYFqVvUOEgEUXO4PRK2Amsc3hruoDwgyKJiBUxoR3sZqCt7lXjJRS73jWVYwqN5f3/UHGMHK+fs5T40trLhCjNYWGyCItL+eyjqlC+CxbP73rvGNBlhc1ts9XKyUHBoqPwC7mapgQg2sjsW7dQseqg+U2Nww3XslCa+PZEmKiBTab+5MdomSB30u6qjOUS8W+ifoP+AvyUattLEaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
Date: Tue, 14 Dec 2021 14:37:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84679d62-0c8f-4f66-db72-08d9bf06d6c6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311726E4B5F753C7256397F0B3759@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fII+AZEzDU2g9gAv6xJzgtnQVY2deOGLDrNLBSb7fPHszLaDFHCnxF0bqZXdNgtGv1eyE//fzdlDf9q0+MwZJwWWaOH5j3czgKzP2NllXnkZZdFTNz/CQjgO0ETte2ETmEbm+LNew90St/0jcGlAkK1MTW2y2i1LVbzbKmXwUFg2LpPxN7jnoTj1tmsAP5Npk3XH8qO287RrxIOLv59C7nTy4fBj/MOg5sZ+QgfjDiGCAcxUwCWo4QYXwj7wClcujdE5CvhIofi40WHw42KWcYcWbVDO+eNLzsShQKVuuuu3qINK2Uns0nmxpvQ2tD5ibPzqDnii5xSMx6Oe16/8uZCusIAyrkKsrv8xq0Xall45I8nEDr7Gm1Nk34yDSrgf5iU9jITvleY2OVO0YUa5db9UoaDbByRqB6UFChDMvDFbJYFi2+dcRzBrc8xeiehvvk02eI5GKB8SsSPF/pomkl1FxT1S75b31QH2LvKjPTphv1v6o/Dkv2lbKIg27gOev0Xfz+xg1/oEGQ4YK2ovty/fLSKhMZx1W4QiIC6UPAVendBJfoqRaa+eP8zFdaO2nQUWVo8Yu7Pdd4JHoTslbwYDEw0EENmhJH4PKtp2ucY5KiFhhRlFz9zGgnLeAST5jwQdy7o376DVT2LEPxl5/mreiQsJ1dM8IhmdMV7F3XHny34cFLqZuOBMEE5WJaCYsgcqgQq8MS/W/MS1k1QJfkS4YlGEfSGZwfHIZLFO4II=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(86362001)(8936002)(8676002)(6486002)(4326008)(66946007)(36756003)(186003)(2906002)(38100700002)(66556008)(66476007)(5660300002)(31686004)(26005)(31696002)(6512007)(2616005)(7416002)(54906003)(6506007)(53546011)(508600001)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTZ2aXZjRjhybEpqS1lXdDFPaFRNcEY1aE9WQ1F3VXp5M0tUOUlHR01oRVdq?=
 =?utf-8?B?blFIR0F4VWw0dlg5UVdBd3F4Y0ZIR1ZQZklCaDlaOFh5SENCY21xbTA0QTdl?=
 =?utf-8?B?ZkxCRStobjhYVGF5VzNxY0Z0V1BOZVlscVpFNGlBV20wWEVLaFBTNE9lSklG?=
 =?utf-8?B?MkxTeU4xQXl3N3NxRWFMS2owT3ZhTDNVcGk2eW1mSXhNSGhFQjJoWVg1N3Br?=
 =?utf-8?B?dkJ1Q21YNFpDcGlUMmZHVjRJQ1FQQWF2ZDRPRE02MGZuZUpGcks4WjhqRS9M?=
 =?utf-8?B?QVdCMEN3L0hGcDVEMVRaQU9lQklLOUUwU0RXem1RbXVvSUhmNk9uZlBaY283?=
 =?utf-8?B?TEZVbGhMZkNTMTRZdndVZWxuQ2J4dzVZVGNUT1Q3a2YxbGY1NUl6cFRUejRH?=
 =?utf-8?B?ZkNWZmVFQlYrVXd3Y0tWQTNNWW5PTm1UajBuc0ZLSVZmN3kwclBjMTArNUNa?=
 =?utf-8?B?MVlVNHBtMzJwaVUxVTZUKytvWWRtR202LzdNRVNCMEtvMVc1NEtoRDlJS1c5?=
 =?utf-8?B?K3Y1L2FhYzJybjBxNlljcDFzVTYySzhoelhiUi9SZjRsNERRZXR5OTFWeDVs?=
 =?utf-8?B?SWZlNHo1OWt1S3dFZDhYSUMxVU9xaTJWTFN2WkZ0NkxZWlZmdm9mY1E3UzNz?=
 =?utf-8?B?aDBlS2o3SDdUWitjY1ZUczN0ZkRQVE96RG9COC9nN3NES0VnV0ZpWTZ6NVZK?=
 =?utf-8?B?MjVZRVNtcUd5WC9GOXR0OW9RN0sxRzc2eE1aTUoxT3V3N1g2eHd6MDdDUm5u?=
 =?utf-8?B?RFRVaVFMYThFZnFDNXhGR095OHowbHZsMnAvS0I0TFA0ejYvTGFucG1xSFE2?=
 =?utf-8?B?S3hBR0N0cTBRNWlsVHR6SHhGdzBKTmd6TGZvWXJ5dmF2cGc0V3lwdnk5ajc4?=
 =?utf-8?B?cmZvT0lmcW9rV09sVnBybjMvSE9MUjk5UTNUL29rWTI1QTNBU3NMMVZjRFV2?=
 =?utf-8?B?TERkcmpBck1hVmkrRXNEZEdpbzZMTWZZRmtURGw5eDJrNGJnV0d6MklxVDRt?=
 =?utf-8?B?emV5RE1BY2F5SUgzOHhCejcxajczTTNER0FkUXA3ZmxvQmZvanVnRkYxZDRr?=
 =?utf-8?B?d2NHSEx0ZnA1Q0pnK3lVcnkxT2ptYk1TUGJ4TkgxQVFmQmdHbWJkM2xzTWNu?=
 =?utf-8?B?dlgyWnJlMVB4cUdic1dRK282a3RCQm1BUzltRXVkaEt3aEpsMjBtcmU4enlD?=
 =?utf-8?B?QnhMZnk5VnBOZmJPaS9MdWdXUHFVVEtKdnhGMmkwVTVqYmVoSjVUNlNDc2kz?=
 =?utf-8?B?MURwdmx5enFJMHJEMGJJK004djJOMmNPNVRNSUlwZDJFQS9VNHdUY1lVcDhS?=
 =?utf-8?B?K1djanZVR3dsNm1TSytOWWliZ0FzSS9KQVhObkN6L21aWTlWSmVkaXdDNHBP?=
 =?utf-8?B?aXA2SHNKUncxdWFqcTZueW9PYTRuNGQzUytTNkRFS2FBeDNrQlpaRW9rZFBL?=
 =?utf-8?B?SHBwcUFXV2pEb0dCYndSQTlaY0NYY0I1RTJGVjNERmVvME5aVXNublArNlRr?=
 =?utf-8?B?aHh4ZERPM2dsMmQ2TjhXV0w1SGVmUUVOYmxCVnJXZ1Y5VzZEckI4djNzRHJ2?=
 =?utf-8?B?RzRaVUN5c1JGTzhrTmpKc200UXkxS0lSc0N0b0FkcjV5NzhCS3NxYVA2aWJG?=
 =?utf-8?B?TWVnMmxKMVZESnBWTlJFd3BscU9LS1FyUFlRODYrdk4xUEN0NlhkMjN3SnY0?=
 =?utf-8?B?Z3BncTVFa3hreXRyb2d2SXpqQ050ek9nSHFBbmhodHk1SFZsbGR3b2tJWHdX?=
 =?utf-8?B?THFTdWdzSUl4bUg5Vk9YMEpjNTRLSVpuajZEdGx1UE93d2I3VkNLMXh3MFZB?=
 =?utf-8?B?UHVFVENqREV3N24wemd4RWdJSWVhYTNvNW9aaUxuQlBLWThUS3ppcVJZVlZ2?=
 =?utf-8?B?WGd3VEgyeDJOTnQvaEEzK0daNjlZZEM5Uk1MaUxkZkdaaFBNZWhXUEpEVEdL?=
 =?utf-8?B?TTZQTjh5UEZyUEdnT21TQTgwRjlGYWR5MUpLdnFuZHJIcDhWNGFpdERVRW1h?=
 =?utf-8?B?bFhRRHgxcXlaV20zTHcvTjFQOFRwSStyM3hhRVN1ZEdoRUg5WFMzem9vSFlr?=
 =?utf-8?B?Q0EwSXI1RVZKRnIra1dmSjRGMW55OHp2SHhsNlpaa3pFUlRvMnVzbTJMQUxs?=
 =?utf-8?B?eHhwUEhHdnkzTlJXNnpCYktqTU43V2xsVENVQ3J1SjMxY0d6Z1dxVDZ0RDEx?=
 =?utf-8?Q?PWBLtE9fR9FRYv4AL7o3EcU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84679d62-0c8f-4f66-db72-08d9bf06d6c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 13:37:14.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Izx0VgjvK+rrdja2xEO4thcsW5KaSzU3x0Rq9Tzlj2zkrr+S3gp0YIR5u8rVtd7OWCTV0HD0rtLgn4KPhfKfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1382,8 +1382,10 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>      spin_lock(&d->page_alloc_lock);
>  
>      /* The incremented type count pins as writable or read-only. */
> -    page->u.inuse.type_info =
> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
> +                                                  : PGT_writable_page) |
> +                                MASK_INSR(1, PGT_count_mask);

It's certainly up to the Arm maintainers to judge, but I would have
deemed it better (less risky going forward) if PGT_count_mask
continued to use the bottom bits. (I guess I may have said so before.)

> @@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
>      }
>  
>      /* Map at new location. */
> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    else
> +    {
> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        p2m_write_lock(p2m);
> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
> +        {
> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
> +            if ( !rc )
> +                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> +        }
> +        else
> +            rc = -EBUSY;

May I suggest to avoid failing here when page_get_xenheap_gfn(mfn_to_page(mfn))
matches the passed in GFN?

> @@ -2169,6 +2170,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>      if ( unlikely(pg == NULL) )
>          return NULL;
>  
> +    for ( i = 0; i < (1u << order); i++ )
> +        arch_alloc_xenheap_page(&pg[i]);
> +
>      memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));

I think this and ...

> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>  
>  void free_xenheap_pages(void *v, unsigned int order)
>  {
> +    struct page_info *pg;
> +    unsigned int i;
> +
>      ASSERT(!in_irq());
>  
>      if ( v == NULL )
>          return;
>  
> +    pg = virt_to_page(v);
> +
>      memguard_guard_range(v, 1 << (order + PAGE_SHIFT));

... this really want to (logically) move into the new arch hooks.
That'll effectively mean to simply drop the Arm stubs afaict (and I
notice there's some dead code there on x86, which I guess I'll make
a patch to clean up). But first of all this suggests that you want
to call the hooks with base page and order, putting the loops there.

> @@ -166,6 +173,32 @@ extern unsigned long xenheap_base_pdx;
>  
>  #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>  
> +static inline gfn_t page_get_xenheap_gfn(struct page_info *p)

const please wherever possible.

Jan


