Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F24C1825
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277566.474117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuB8-0001gM-Vs; Wed, 23 Feb 2022 16:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277566.474117; Wed, 23 Feb 2022 16:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuB8-0001d2-S4; Wed, 23 Feb 2022 16:07:46 +0000
Received: by outflank-mailman (input) for mailman id 277566;
 Wed, 23 Feb 2022 16:07:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMuB7-0000w1-7q
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:07:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc23d6cb-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:07:44 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Mp5ajS8cPXuCHFl2xmGJ2w-1; Wed, 23 Feb 2022 17:07:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3803.eurprd04.prod.outlook.com (2603:10a6:8:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 23 Feb
 2022 16:07:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:07:41 +0000
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
X-Inumbo-ID: bc23d6cb-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dk/wJhaCBPsVN834p80E6Rx8B0I9ymHYeAZt7XTwLVE=;
	b=B2IxzWMeCA3lBnTGKItqKzvytOyAH1rwSTwDffGCIyfgAYsFI5uZJ7d6cQ5Rl53iZCW2dH
	gt51cZkX9E6aELamYgo2D04woBXfUsIeBZazhxAkS89wG3RmIq4blifiCCS383EJU0t4Pg
	pKqTL8titQbOpUDtbouw9lfsnMCJjOI=
X-MC-Unique: Mp5ajS8cPXuCHFl2xmGJ2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REkXlgEfNQZTJhYzhD5pFP194TG9ZyuUZi/icszPoQb4jMtEzacANdbCh3psAKjNB6yPJjxDwcfMIOsLW/YQZ6KX2Bo87lv6oCh93U7+TDuOyYWuhHLW25ro2wEaCSksIAY/MVgpsFwPYNkbHSKldjvArlBTOYcc+ZywPZgIw8EolaMmmdznlXjpPveh61oJVsWSZhuUeS6CbQuEq4+DcLYCIVegcShx8yXzTdci2p46A7Q2yk1QXIbaTdNGpItHjkKFb6n9mqYUKNylXj3+m/uidB0O5ajVe/OPg7o6JhlWz4Pwkss0t7rtyax3Uk3hNUrXfCx/l4ZZ2xRmZOKcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk/wJhaCBPsVN834p80E6Rx8B0I9ymHYeAZt7XTwLVE=;
 b=bQHQBOJxcQUJjfBshn3SiU9inATEkk9E84+HNDAvMRmjrcUdL8/q2r3lJWGvqYYvk1sffA5XCTaIREzIFuYUxVIVa4qqMWx//upjOodMnJA0gIRyC3/iB0PwRTamwRn60V7JdRFnnHKE0rrrq8ftTlYE0oswOmpREOnqqrYPSI09wBZ53MmPblhIUG5xrPNUAfpR458UiJZhtt55rbqrqdzRYjLj7OxfHIRhBsuI3WeGbEE4/jXCvDOpzlE2XCBnb6PDBQns2ZOwUqDVnVQ1FoQM7XdJikE2f0d7JyyL0ntWajA7DOUznmEQiWuCIitEghUGg0j537PxLZev7qqDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68f3aede-a740-99b6-8398-35d642cbc654@suse.com>
Date: Wed, 23 Feb 2022 17:07:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 11/14] shr_pages field is MEM_SHARING-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <f103baf9-ee1b-e440-8fa9-f5009a56442c@suse.com>
In-Reply-To: <f103baf9-ee1b-e440-8fa9-f5009a56442c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26360f6-187f-4c8f-65fb-08d9f6e69eb5
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3803:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3803658F5D90C30C47BCD245B33C9@DB3PR0402MB3803.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSiJjvDzqBRj6fzN3s5U1X3+8zBzuL4SaCz+uZHsbFC/UYGl0CCf4PE24FxqwCGCBla4rKjQmF/yvVSfS5LAWqMJ4WPeyuExGdptKwJ5UEIZQu1kejqqLddPyicsqZwBVDcRUP8Yjpum4zg/SpslcPFORhas3CIxfXj4L93Mo/iCJ3WNN/r26LJOrLduifLBCnjZSvn7I3csOIKc11s3HHB1ECeAtlWG4kfRUSdvHKfQHqYHupWpJOKotNcRJhtFjg2ABqOg7kKFNylsEO4FGLAecRyz4NwNbpIcpnAVif2jPojNLNLr+qo+RXM508GWFbfMi/6geum/TfZdRLvAIevUK9oLMRD+/XmRYovWajqP+CKNmtbBEzLMqNtqWOCL9m2Crhu5T87+KgcEPwt+lSHCNF1mkBBPlxSH7vePrDSf1hc+CuvvHiin01/ltS3ItQZxNYoOM0TWlGx7sQUurVT48JFzSNGqM1F4xc/wgKiLdRsCfSz3U4cfeBd2Z68jzm7i9FdNXRs7vTf45YHRKYnOrJ98gZxmD43gG75OWzb7Fc7SDO9yj6h8L2ZanuJL+4lH5ld7KjlTrcOQYesh/EZU0ZPUlGUPkCJY4PYmD2X56WN7m7aJqlgiN/N57qhdgm97PVMrnNu4SzV63eNqxh9VGdMkWMeoFRSaVp8e10345osJ124S0EZFopgHF5JhakwEFArBHy1y2VjAL8ZImdJm8Erneu9GG70b8dgXU/r3iFLy/YDP0fVvysg9TMue
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66476007)(8676002)(6916009)(6506007)(31686004)(53546011)(86362001)(8936002)(31696002)(6486002)(316002)(66556008)(508600001)(66946007)(26005)(5660300002)(36756003)(83380400001)(4326008)(38100700002)(186003)(2906002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZ5Z0YwMXF3SkZpK0VGaW1MNTEzbVg3dWRnVGNHN3l3cmtLamIxN3FKdEtj?=
 =?utf-8?B?c2xRTUdqVUN0U1dpTnlTTkowVTd2QXd0cnZmcG1XK1ZnSnd3ZUdHSHpUa3BN?=
 =?utf-8?B?eHFCYVc3ZTRIc3VwVkJTUFhBRmx4eHdIMVlEblRkQW13OHgzVWhNcjk0Mi93?=
 =?utf-8?B?ME52VVUzL3lBZERGS3JKNzZMMk1YOFk5UUZDYmpuQU1kMGhmYjFHVUMyVTNH?=
 =?utf-8?B?MjcwM1ZmVmx6V1JKbUR6bUp6alpWMVEvcmJTVnFaT29qOU5QRnZucFJWZ2hv?=
 =?utf-8?B?eFozWnFuMFFZUjhaM2szMEdLVDBpZ3A3L1pZalJtN3EyQzIzU2kvdTFOV0tK?=
 =?utf-8?B?Wi9uUHlDWWlxekl4b05la05FbW16UUpxQnNBYlovZmh3U3hTakh0TWJCYlJC?=
 =?utf-8?B?bTRNcFFnbkpNUXRMSEl3cUlHT1BabU4yTm1YY0kySEgzcVR5VmtUSEt2SmF4?=
 =?utf-8?B?cHFKc1c0OUNXT0RJd2lZZ2dVd3BrSjkrb0JNZGNQUFVpMUtOa1NLZDNLQnNq?=
 =?utf-8?B?RXZNb2FLbTgvOGdoa3lOQTJvK0VYejQ3eXhnY3V0UGpGL1JGRE9kcjJnL3lR?=
 =?utf-8?B?QmhDWGJYMUNRNTdlVW9ka252b0lsNU93NHhEckNXYTl3NFRIUUMvZVNZRGRq?=
 =?utf-8?B?OWw2aXlYUlRzaytyZEFoVTh2dmhPVklhQnRLdmQ0VTRrdCtGc1M1bWkwV2Zs?=
 =?utf-8?B?c3ZtZ1pmaHJZQlRjR2w0TkRuZys5bTg2Ynlxa3BtQmEyT2o0UGpRN2Vlc3Ry?=
 =?utf-8?B?SWZiU1ZNNmNQb2VWOUpHRFo0NTNUQ3hIUW1WdmhDTmc5TVI0QldyUDVMbU5I?=
 =?utf-8?B?eStrNndVRlI1enJjdVZROVkzcVhUcmwrRkRzNGJpRTlUcHRqWGtIaW04UzZ1?=
 =?utf-8?B?U1QxYjhrTFFPekgwL0pOSVFjamNZeUUycEUzTk9ibUJQS3FNQXg4eUhqMm8x?=
 =?utf-8?B?VnV3elhnY0JVSVBpTmw5dGZHdllCU0tzV0RWN2dJQlpaYkR5VGdqTTNYZnNJ?=
 =?utf-8?B?RHE0NDNkSzNMQnIzK3IrczgzQk5aZjBnQ0R1RnVVL3ZaRUpsSk9kU3hIT085?=
 =?utf-8?B?Z1FXUTlzdjZMMDJqUVZmWFQwcXFxYkNTVmUwQnJaZ1hDQk96YU5OTk12TW9n?=
 =?utf-8?B?dHBGdTc5LzEyZEErUzZjdDZrWmUzWDN3ZHhBcitiNkJUUDRFVWhCRGpSakRh?=
 =?utf-8?B?MWhiMzh5RTBqZzJPY3BSVGdNNVgrZnJTdVBqZTlNdXdXRWRRaXRLOG1NeGUz?=
 =?utf-8?B?UlJGbHArbWE4ZGg5NGJ3bDU2OGFyRmI1L1pyemRXYXJYMHk3YVFud3l3ZDVz?=
 =?utf-8?B?RDQweENBamdMUXdleEN2ZlMvRFZJY2w3VVVkQnNMdjBRakZzZ1VwbXVVdzgy?=
 =?utf-8?B?WWs4cUp4UFdFdloyQTNlQjd6TGtReS9FM0c5Z3Uva1RMeXltS1RtN0UzZ0Fr?=
 =?utf-8?B?UlNDYkRCNXZ6cW1QdDArRkU5Rk50RGtvUjVqd0lvM21TdXhDeGg5ZFp5NTFr?=
 =?utf-8?B?L2ZLYmtuMkNTUUtLZ3AzM3VZU3g0S1RHd0RseWZiSmphVzFJbkhyaVRCVjN3?=
 =?utf-8?B?czdOUW1Da0tXak5FZDNWd1lwZTNqWFhXcXhvMTI5NldoZFhVbGJSaWNvN0Ru?=
 =?utf-8?B?WDJzcmJQdEJVanlGb0ZkUUR4YXZPcVQ3TU44MTRtMml3S1g0bS8wazVZdnlF?=
 =?utf-8?B?M0ZHVXBZTVYzQTlTNTQ2TDJ3bGoyVFo0ZEZJdks5WXVkTWd4RU15ZXNSVWlL?=
 =?utf-8?B?VDVXL3dhMWZJMUI5TG8vUWhZa2FNS3lLRUw3d28vcnQzbzcwSEFrOGJnZkUw?=
 =?utf-8?B?d1g2L3FIbk13WmJzUTFLNDBmS05JN1pCVXBPY21KcXcrUXVsZnZTc1BPaFdq?=
 =?utf-8?B?ZVdxL1gvMGRkeStrbTNKT3d0aTFIdzJLazVHb0tYcGNJWGMyY29VbDBqOEFu?=
 =?utf-8?B?dGVJaUZjUDd2OHdkRDBlUjZGMk1mY0NRNDBFbG1ETk9OOVI2V3FKNEJ2aXJ6?=
 =?utf-8?B?SjdPUkkrYldaTVZjZTVwRUdYS0pXTVU0L2tOQ1NKaWdOZC9XMXNWSDFpQ2NT?=
 =?utf-8?B?TVI2cWc5V1dxNGp2Uk8yNlZQUGRsYXpiMkEzdnZyd00zYUdQanllRTZWYkZp?=
 =?utf-8?B?ck9mMW5vdFI0NHlqZm5wU2wyVWVWb25Rb3dkS2cwelNoNGw3V1JVT2thZFI3?=
 =?utf-8?Q?GG2FiKwGvt/rx0jrKIQoNUQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26360f6-187f-4c8f-65fb-08d9f6e69eb5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:07:41.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVL+4POp0YtKyH/JQt9ZV/KwZ6Jsz2xAO8ikrEs/NuVacGuwlGfidaRjw1avQvjaI6UXkbH7pkVb4DTNY6xVqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3803

On 23.02.2022 17:04, Jan Beulich wrote:
> Conditionalize it and its uses accordingly. The main goal though is to
> demonstrate that x86's p2m_teardown() is now empty when !HVM, which in
> particular means the last remaining use of p2m_lock() in this cases goes
> away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Forgot to add here:

---
v2: Re-base (drop clearing of field in getdomaininfo()).

Jan

> ---
> I was on the edge of introducing a helper for atomic_read(&d->shr_pages)
> but decided against because of dump_domains() not being able to use it
> sensibly (I really want to omit the output field altogether there when
> !MEM_SHARING).
> 
> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -159,7 +159,6 @@ void p2m_teardown(struct p2m_domain *p2m
>  {
>  #ifdef CONFIG_HVM
>      struct page_info *pg;
> -#endif
>      struct domain *d;
>  
>      if ( !p2m )
> @@ -169,16 +168,17 @@ void p2m_teardown(struct p2m_domain *p2m
>  
>      p2m_lock(p2m);
>  
> +#ifdef CONFIG_MEM_SHARING
>      ASSERT(atomic_read(&d->shr_pages) == 0);
> +#endif
>  
> -#ifdef CONFIG_HVM
>      p2m->phys_table = pagetable_null();
>  
>      while ( (pg = page_list_remove_head(&p2m->pages)) )
>          d->arch.paging.free_page(d, pg);
> -#endif
>  
>      p2m_unlock(p2m);
> +#endif
>  }
>  
>  void p2m_final_teardown(struct domain *d)
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -109,7 +109,9 @@ void getdomaininfo(struct domain *d, str
>      info->tot_pages         = domain_tot_pages(d);
>      info->max_pages         = d->max_pages;
>      info->outstanding_pages = d->outstanding_pages;
> +#ifdef CONFIG_MEM_SHARING
>      info->shr_pages         = atomic_read(&d->shr_pages);
> +#endif
>      info->paged_pages       = atomic_read(&d->paged_pages);
>      info->shared_info_frame =
>          gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -274,9 +274,16 @@ static void dump_domains(unsigned char k
>          printk("    refcnt=%d dying=%d pause_count=%d\n",
>                 atomic_read(&d->refcnt), d->is_dying,
>                 atomic_read(&d->pause_count));
> -        printk("    nr_pages=%d xenheap_pages=%d shared_pages=%u paged_pages=%u "
> -               "dirty_cpus={%*pbl} max_pages=%u\n",
> -               domain_tot_pages(d), d->xenheap_pages, atomic_read(&d->shr_pages),
> +        printk("    nr_pages=%u xenheap_pages=%u"
> +#ifdef CONFIG_MEM_SHARING
> +               " shared_pages=%u"
> +#endif
> +               " paged_pages=%u"
> +               " dirty_cpus={%*pbl} max_pages=%u\n",
> +               domain_tot_pages(d), d->xenheap_pages,
> +#ifdef CONFIG_MEM_SHARING
> +               atomic_read(&d->shr_pages),
> +#endif
>                 atomic_read(&d->paged_pages), CPUMASK_PR(d->dirty_cpumask),
>                 d->max_pages);
>          printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -385,7 +385,11 @@ struct domain
>      unsigned int     outstanding_pages; /* pages claimed but not possessed */
>      unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
>      unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
> +
> +#ifdef CONFIG_MEM_SHARING
>      atomic_t         shr_pages;         /* shared pages */
> +#endif
> +
>      atomic_t         paged_pages;       /* paged-out pages */
>  
>      /* Scheduling. */
> 
> 


