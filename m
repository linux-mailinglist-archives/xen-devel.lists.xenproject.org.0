Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08C506752
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307876.523228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjhs-0005I3-70; Tue, 19 Apr 2022 08:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307876.523228; Tue, 19 Apr 2022 08:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjhs-0005Et-1o; Tue, 19 Apr 2022 08:59:32 +0000
Received: by outflank-mailman (input) for mailman id 307876;
 Tue, 19 Apr 2022 08:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjhq-0005En-2p
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:59:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04eea3b6-bfbf-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 10:59:28 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-M5ir4RM_MKyb8PalXaBHSQ-1; Tue, 19 Apr 2022 10:59:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 08:59:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:59:16 +0000
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
X-Inumbo-ID: 04eea3b6-bfbf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650358768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48XwLC/W+Kxl27AAaNKf45XWcc22vF10YUV+IQVqgko=;
	b=GECtrDynlsazhh0zGEiAyY4Pmq0x5RfcOLAyFBq0eGMl8orLLfdOkrdLWrCMZTxSqL9rOl
	Lyy0kP9g92DN61DpraxNYTUXVCUWcTFWZ9vtk7qd1dZqOG3okYS6g+yHadctM40xwHUa48
	D7mW6FqoaHL2B3zIo+PRHmzpOskWczY=
X-MC-Unique: M5ir4RM_MKyb8PalXaBHSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iphg67w0/3CQFbun3gUfRxGjTX6iooNEBF9STPx9DCpJTQm1o2G9jE2AfSuQDG4D3Es/1+jqRyCg9PdR7uRYYnEvhQmwCltvPNWNKxdC4YBh9MDYwK5qaYfyLM+TLFT11SeOmPSoTO3vlriQv0hnrmgjApuixXTJ3Tynf3BwIBCiFcyq3C4YgDxsCsgUGNejQB6brltMs8hvFL4fUo9klkBGPmrhg+EcHdK9ZzfnqHvLJY4q919/+zmTZqvqpe/oXAZig7PqGdTaVS5N8JgH8s31aS4Qgs7Ce60X4hiawkW2CpiZA82jdOtRKbVNEHj/BRlGdA0xsWaSDhjDM0BpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48XwLC/W+Kxl27AAaNKf45XWcc22vF10YUV+IQVqgko=;
 b=kSQoemizx6QL2ARWpdXlhGu7y9329KtK+rX1bFrnFZ3LV1n9bqDsMslOIJmSv5jjgksoE9fpTY3Sm2y/uilSqmUhlImkII/IkrJW7upKPYBBjzZ2kqw9vsL6iFHhsRe/0SZXG2WRQRA/rmQutbKFGzvwhYeB242iwKEc+4j8Yzl0o1+xP317wXbUIWvwHit4EyhBZb9ZZhXXvk+Kcu4SJpOXBQ+9+n8IIoNg43qrQOnJKC0FmWuv6bRZuezEzxFC2nKMY4Fhz7EwEqT2XvJT6XPokavcgjqKl+KjNaPDLIybP/1lamKUuYBFORlTctp0dZmN0QSWUMvMW7+eIHn9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <328723bb-1e24-7d3a-8fe0-ef433a96b360@suse.com>
Date: Tue, 19 Apr 2022 10:59:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/6] xen/arm: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-2-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418122251.3583049-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0182.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63404839-6eb0-453a-7058-08da21e2e21f
X-MS-TrafficTypeDiagnostic: DB8PR04MB7001:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7001DC0E15137D7CC11B652AB3F29@DB8PR04MB7001.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	crKm6mkWdwpCC8TSkko0TqbC6rkmg31a/nHiqvsuRXXQWTfK45Di6OpGYH9w6uMYC89kVYjILRNa8kBdsFpCZ3/EL+YVDoJH4RmmbrkV+qc1q1E2UD86AKk+IGcH7xo8K8Wdn6/LlWqUnE/E+vOFnmgGVO4PcRzWF7XpuPRFpm9ZTvrBDcXKRe3CBirIvgbtGJ13vc5bBxHryLGb97M43WtTB+N1CGliCjs8xRUBR7z9gdbJrXnqQGtVL0oZxdXWBbLmlobHcNoePQ+jmZHZTXlEqbcVPMzo5kM9/jZxIoitI6a5PK3I/dDTjBjQYGRS9sD4ip9qVU8Yl2+eu7hFA7fnJaT7qf2RG5khgybmQIbFo4NEFCHHI2LdFM0BBVORuQBR0oc3sAsq4dUoXaI82j8cMNJYPtloI8F/AHfwX5YyMckkdpElfQwd/1npb6OlOrilJNhr8DB3pMNl96x68dS62uGYc263bvoN0BxPEgkgQYQmjG6MDzSwAd4le5tgeZJNenbF2/Q/6PSQHrTV0KtI78AE9Lr8COVXt8gUhUKXOONXshnd0LBI16oXRbC4+oDSNrKJzmQdgsDbAkE9EHlsW6rJdHuoE5Lqp+CzdbMdArz6coEnsKMX4o0bUX8Hczr+SfnES/81TzrS8b1py9M3GSM3djCSnFtGmOZBNMUh98h3TaDZA8xa8F6BRfvCrnbpouCYEJqab3uFar+ZIGuwbUFKBCUTVnbiWWJdEyECZjcChTXVuFvGu6g3Uq93
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66946007)(36756003)(316002)(38100700002)(31686004)(66556008)(4326008)(8676002)(6916009)(54906003)(6506007)(2616005)(86362001)(508600001)(186003)(6486002)(6512007)(26005)(8936002)(53546011)(5660300002)(31696002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUcwNHJrdjFKNHRwN0JmSHlSbEU1MnVYTllBeHhvTTg5MEpCUElGSEhRZVAz?=
 =?utf-8?B?QnRxaVFDb1ZxTFRaRmV4Z1RCZkpPWlhhY1dFU0FjbzIwTEZNYUNSRm4yR0VY?=
 =?utf-8?B?Z3lLeWQ4SVpPZi9vR2VmbTJ6bTM2ZEdwbDhJRk4rQzRWNVRHRGtINjFvazYz?=
 =?utf-8?B?MUdqbFg0U3YrTEZpY242R2taVnlleHFCUHMxU3VCZDFhdkxRNXgvdFRtNlRy?=
 =?utf-8?B?bE9UK0tQeCswVFJvUmU3QUpnQ0tPdlB4MVF6VS9yQzBUMDZTb1kya09zZUJE?=
 =?utf-8?B?UXJoVUxmTVBlYzl4NFc2TUR6MzRVVjYvdUxxMWV4L2F4dDYybU1PNDJZcjZ6?=
 =?utf-8?B?VWhkVHZ4TlFoYWVOWFFRc0VwYWFxSld1OFBiSGtjU0o0QWduRGpwMEEvbFkv?=
 =?utf-8?B?cGhJWUVtWnZEQVc5b0NoVEhaWUg4aHd3ZUc0MDdEbDkreHB6Tm1Rc0grd3VM?=
 =?utf-8?B?Q3d0S3NrUW92MFdhdDJNQ2hUVzIwQmtka3oyWnk1Rkx3clNjWUVtUU5ZUEZC?=
 =?utf-8?B?enlDMFA2Wi9HUGZxSzM1WUo3eTJPV2ZBM3J0Yks5YU5JWVlwSUhtQkdzM3Zx?=
 =?utf-8?B?NUFJN3I4QTJzNE10bENkN21GUFRCRnVUcFhVb3prcXNzb3JUR0RsT0xUQ3ZQ?=
 =?utf-8?B?ZHcxTVN6REpzcWFVbVcvcG00SFpQWENFdEVpdkwwUWU5S1htY1h2RmlBNC8z?=
 =?utf-8?B?K3VDQ1dFRGd1ZHRXWk1MSDV0KzVUNitTMkUwU2doQUM0TDUrSTl1aHZkZ09D?=
 =?utf-8?B?OHhyOTQ1YjRrWlRVL1MwbkdRS2drdWkwTm54UEZJMnNMZWhUcGU0dGRnTFhj?=
 =?utf-8?B?YzJrQ3ROMUFKWnRLYkh0M0hNemFHa1ZRRklqQmxMSlA3dC9Bb2RaUFVpUnpR?=
 =?utf-8?B?VVlLNHM0Q3AwWTBoMkRHUDVIanprSHBMNzNrVFdkcUl3RUNxeDAzZGtzYk9R?=
 =?utf-8?B?TWprblFLM0syZlNVZXk0a0NBaTF4Z0pWQnNScmZodHIrbktUWGl1VGQvZ3or?=
 =?utf-8?B?S1NNbmRLMVFEeWh5NHg0TC90SnpncTRvbkNRTFIzU05Ha0JldG1NYmNTaG9h?=
 =?utf-8?B?cjJRb1c1SUI4cXJ6dlhzZWJqWjBpRGI5cllBY0gwSGh5Q2xENWJYelR0R3BX?=
 =?utf-8?B?MmdydlJzSk5nUElaN0o3US9SQU90dlMyOG92eUx5WGh4em96ZU9aUlZsMUUr?=
 =?utf-8?B?SzNqeFUvdWVNK0U4YVNjUlI1VWpEblZrRktTT2p0ajFaMzRDMGlEdFpTUXZH?=
 =?utf-8?B?VnkrVy9hV0c3R0Z4K2tnSVFOZzB2cFhZVVQ2c1pPOU1pWm9XWWJDZGZ0OWND?=
 =?utf-8?B?ZGZJQm14bmdRR2ZPSU9PTTFONXB0VlNnRzhpRGcwbk1WUGF5T2hiMVFiWlBs?=
 =?utf-8?B?d2FUTEtrWisvUWdzbDNxTnFhdHVDYlRsOHMxK3ErTjdIVk5hRXZqQ2JEWGZP?=
 =?utf-8?B?ZGZsRHN5VGFPVy93OXRQMkxCallUZTh6VUx2cUNnNW9CK0c1ZnlEZXN4S1Bh?=
 =?utf-8?B?VjZ3aW01bUtUSHJCZ0x1UUZNV1l3QmVZODFoYkpjN1ZJZ2hnQnE4VjVZOWxY?=
 =?utf-8?B?S1J4b2xDRDhiU2lreXBuZ2kxZlpROEVZMU9yR2lUWTM4QUJvbUs5Y3VyNFV6?=
 =?utf-8?B?K0JweDVjUUJHbWFlajZNWmc2VjZrY2NvWEdhRFc3VmN0eHdSNmdWYWpOL0NH?=
 =?utf-8?B?bm1LOXpPSGk5UG5SVFQrWkNhOTlvaUJVcUk4SzJJZzBTbDBkQmpUN2lrTFVq?=
 =?utf-8?B?N2V0OGVrNWtwVC9zNkM2emcyR1BkcTlRSmxBV1NScUdJam5ka0UraENkVS93?=
 =?utf-8?B?VlU0WTBFZiswcmt6YS9QcWJ2ZUtVckR4L3JsNHEvQzRXdG5VcFVCMHZUWEx1?=
 =?utf-8?B?ZkdjNHc0NVV1S1VWWCt2UVNGT3c0VnFwV3laMU9NSS9vR2wzbDVZWkNWKzVx?=
 =?utf-8?B?RnV2RkN6R1F3NjdxblJ1YUlJdElzc3VPUTk3YS9mcUNvRTBTNE14eGJiUi9J?=
 =?utf-8?B?SzRyREhKV1EwSDZFY1dWVTdUdXJXdUZMOGN1d2ZmYkZ6ZmZuVUlOMW9NUkNt?=
 =?utf-8?B?VVNkeVpIUE5RM3kxNGlXOGt3OERES2RVWDUvcDdGWmdUQnBKRWxMSFhXTkVO?=
 =?utf-8?B?SHc1MFpUYnhGcXVPc3J5MFNPNkxlYVFkbjRUZnNRYVlwTXhSdVF2ako1VWVP?=
 =?utf-8?B?NTlWNmc3WXFzaFdqVkcrRWlCcXpkVXYrVEY3TDFhVHZ3RGZFUnlZQVpoM0d6?=
 =?utf-8?B?OHM2YTVXM1ZLLzVFZUt0RUo0eVJia3BZMXk0dXgyZjJkMjdTTHl2T0tGOEVX?=
 =?utf-8?B?elpDZXRTWlZwYkZVdU1HQjRMYkRTVm1LVzBxMkEyQnZZRytGOFV5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63404839-6eb0-453a-7058-08da21e2e21f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:59:16.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdXJgWkK1HfyudgGU9yiJbo5hPKS7kox0mfATfipuXEb4VnH6Pgmx/6ZXetfxrTNyZqBOpNjsmTa6M6K8sNaRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001

On 18.04.2022 14:22, Penny Zheng wrote:
> Pages as guest RAM for static domain, shall be reserved to this domain only.

Is there "used" missing as the 2nd word of the sentence?

> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> free_staticmem_pages will be called by free_domheap_pages in runtime
> for static domain freeing memory resource, so let's drop the __init
> flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v2 changes:
> - new commit
> ---
>  xen/common/page_alloc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

With this diffstat the patch subject prefix is somewhat misleading;
I first thought I could skip this patch.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2488,7 +2488,13 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>              scrub = 1;
>          }
>  
> -        free_heap_pages(pg, order, scrub);
> +#ifdef CONFIG_STATIC_MEMORY
> +        if ( pg->count_info & PGC_reserved )
> +            /* Reserved page shall not go back to the heap. */
> +            free_staticmem_pages(pg, 1 << order, scrub);

1UL with, in particular, the function parameter by "unsigned long".

By calling free_staticmem_pages() at runtime, you make the previous race
free (because of init-time only) update of .count_info there racy. Making
a clone of that function just for this difference would likely be
excessive, so I'd suggest to change the code there to

        /* In case initializing page of static memory, mark it PGC_reserved. */
        if ( !(pg[i].count_info & PGC_reserved) )
            pg[i].count_info |= PGC_reserved;

> +        else
> +#endif
> +            free_heap_pages(pg, order, scrub);

Of course it would be nice to avoid the #ifdef-ary here. May I ask
that you introduce a stub free_staticmem_pages() for the
!CONFIG_STATIC_MEMORY case, such that the construct can become

        if ( !(pg->count_info & PGC_reserved) )
            free_heap_pages(pg, order, scrub);
        else
            /* Reserved page shall not go back to the heap. */
            free_staticmem_pages(pg, 1 << order, scrub);

Another question is whether the distinction should be made here in
the first place. Would it perhaps better belong in free_heap_pages()
itself, thus also covering other potential call sites? Of course
this depends on where, long term, reserved pages can / will be used.
For domains to be truly static, Xen's own allocations to manage the
domain may also want to come from the reserved set ...

> @@ -2636,7 +2642,7 @@ struct domain *get_pg_owner(domid_t domid)
>  
>  #ifdef CONFIG_STATIC_MEMORY
>  /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> -void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                                   bool need_scrub)

This line now wants its indentation adjusted.

Jan


