Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD824EBECC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296218.504175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVc6-0004Hy-CH; Wed, 30 Mar 2022 10:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296218.504175; Wed, 30 Mar 2022 10:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVc6-0004G8-8e; Wed, 30 Mar 2022 10:31:42 +0000
Received: by outflank-mailman (input) for mailman id 296218;
 Wed, 30 Mar 2022 10:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVc5-0004G2-Eo
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:31:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d30c52-b014-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 12:31:40 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-WfaYn8FaO1-kV2bM14YenQ-1; Wed, 30 Mar 2022 12:31:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8268.eurprd04.prod.outlook.com (2603:10a6:10:240::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 10:31:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:31:30 +0000
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
X-Inumbo-ID: 95d30c52-b014-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648636300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E276XZ2g+mW/3pKI7jKtP4u1n/hvmRd0wk497tzX1HY=;
	b=LpU3mHx0wol/khro0KtwBvOn+2xpopV3ngwHHtveOvcSaXjspmcyklfz2CZskEvA/jPfYF
	T6k+OS2zzo4iqHuFRgrRpAT37pW0UgrOFbRtyJhEW+fKaaRuiGIhcnwM0cXgosznklfdca
	l69Wn/lGQ4dCPmv51V7GBrtv76xogwU=
X-MC-Unique: WfaYn8FaO1-kV2bM14YenQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVMA13JUPTfXjrb8WHFFpddE68ubjydY048DnDRe5ZCNzyF3zDFmhLU43o46Y5mZRNHi4TIhQN/Mj//3xD0xvHkjKy7tnX7/HdAUhRno6YW3+ZoCCfbjed+pr7NN01T2T7T2lto6gtjp7jVl7cdimEI10V/3yzHAHQjiZFf0j1FY8nFxDyU0cung+aAbtDWC+f7fKxWlmGG35f6g8hgjF+L7e5+9e++EPd8mItdQ1F4Yvh7nEpX3WUCfXfCxn/ejw1PQUef2k9s5mUtCdQ6LVF2FPhwwRAPXeNF4hFWJhg4X5GptringcYxLhJfLtGoyYTrzKpvMcCvHWZol+cOGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E276XZ2g+mW/3pKI7jKtP4u1n/hvmRd0wk497tzX1HY=;
 b=gwwjZ/RtLmQ2GpZ9IiAE0CzxXYg6c/6a4HN/JrW56/8xe+l1GHVF3qPxBjSLX3IEodc3O+BehKWyGlBAcKkGSDg0RR9eHOn671l4g0tcttnqW36Qr/nXdbhSG6WGbd2Fg9H+Mstm0r2ZzROLXCQORSVngodPNMPpVBW6iklp6cLNLk8fmLnCPtsBGL9Ljg8DFg032smI/qxS5xlfApw/oUfjAgAWZ6h3Q/cNYyU6L1IbtoY1AbDH/ZnJyw8UgXZLK5ZtUWiLUyXMLCqherspTe1CFJOv6JLexQw+arNp8TUv/OH0Huiq5CDPFPilUlNd2o+mQ0Rc6YMJ0NTQlGAPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdfbfe3e-66c5-3f99-8f50-16f38bfa78d1@suse.com>
Date: Wed, 30 Mar 2022 12:31:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] x86/mem_sharing: make fork_reset more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <3ebadf898bf9e165d657a31c0aa98bbd300ffcb2.1648561546.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ebadf898bf9e165d657a31c0aa98bbd300ffcb2.1648561546.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0015.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc0c7ec-bde7-4da0-ae28-08da12387462
X-MS-TrafficTypeDiagnostic: DB9PR04MB8268:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB826892E6B894004F72E5B000B31F9@DB9PR04MB8268.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+HM1hFOUxFDF3IgS+tOYBB64zYkBGlo3y5rTJfG75BtJ5rV+mS/zlV4x2ayd+4aRUkT8ohcZNWauVrzlOTYtYxgbUO56bcnPazfIatJDj4KdXbxrQoFmDLdZmyVAZxXjZAF8gQcvkCBI6gTM0BHwTLjruX4U/7oOGAitlZIOwlwzhCILOgl05UFFg9j36UGyMutPtWnmAPxoq3VraEmqLbXygwxFUEC3hWp3HZSVSY85ojI/2AtaCXxD1VagYRcn1q5z1YNRVb00o/zs6Ga+UVlZ02/wrMe3PRSU2zu/IyfoBIUnmIHrdlJeJdqG0a22/LLAC0mppPmo26o7jDzAQ3uzK7R+jcqVEpYpWTzFoO28QWJ+6BT++kpACOyyZEr98OKtfpe9VdpTFb3LGcfnWqUWpJ6gAIWeko6tNixTEYcqDIOcmoSommDRFH3REBSKUX8pelAyArH1iZeYOGF55+mjR6FXWjP9lHcDGZ/g/L4QFGAChdrspivo3BmjmeRmaV5aMkSLhnBqZwcaZFZgWCq0Y3/B95t6uuvRSEPg1Kj2KRA3YuMjHgyuHEYKalOj6Sakc5q6BeToJ9ZdOI+iV4UmMYMz6y0s1//AaMzHemP4ndVKf8leCNLm2LIJkRmb9g8qBVd+ta+iL+lrk+sXXtg5ajXErDU3gOy8pzqeTZnZ4J+TFq6Vd1rtLI22iXPY5B9U/GCvBPlxXX+uHEsP+85eKlJ6WK2c5v17dK/sKVubNgChUPj98XLeWeJb3Yip
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(31696002)(6512007)(6506007)(54906003)(86362001)(6916009)(4326008)(66476007)(66556008)(66946007)(508600001)(316002)(36756003)(5660300002)(8676002)(2616005)(6486002)(31686004)(186003)(38100700002)(7416002)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFleEw2Z1VsRzZVendYQTNTd3FLMnpxT1Y3MkdBbXJLcWdkTUkwakpZNzBS?=
 =?utf-8?B?d0I4ZUdVd3JCTnpFV3piQVphRmhFMDBFamxNNDIyaU84VGNqOVp4MmtoRWpT?=
 =?utf-8?B?THRBL3VQcndOd2doRmJMeFBEWVNNUnh6K2xsQXBvai9jMytZVzZsM0NSczZs?=
 =?utf-8?B?MllXWFJZTTgvQS96bC9TcGJMSm40VG1uc3BoQzBMOTc2alh5TWQxd0xZY09m?=
 =?utf-8?B?S05HWTVSU25jWnlaNlVmeENlTWhLNjkzUFZ0QVFWbkNKQ2lDRmxrZS96QmM4?=
 =?utf-8?B?b21JZWgwOTd3eVE2Mmk1cHk1aXVEUUo2V3lod1UrZHYrMWZuU1lPcVkxaWR1?=
 =?utf-8?B?K2x4bGtsZTY4OUNzWWMvN1NqVkhBeVVYeWpWa0MzSlhFTDd5WWN0eHRUOVh4?=
 =?utf-8?B?V21VZFFHZTVVVlNxeGgvWTJLZm1MOWw0OHhQbVAwaTlVUUdwVEpVK0x4UC85?=
 =?utf-8?B?TEVKditUV3M3TlFjVHhHb295Tkd5SnFIdmJMcUQ2VDIrM2pQMTlzampJeWFD?=
 =?utf-8?B?Z1RqUXN4cmRmWGdzakNIL0xnMitPeVY4VitoNitGNmRMYU9pYVRZTGpJWExM?=
 =?utf-8?B?eEFWbjhyeE9KWnNnWTZBZDRKbDJlN2dqckdiaUttWFA5bFk1QndIdWpXQk9P?=
 =?utf-8?B?ZzFVMmJNTjdFU1Q3Q0FDdGdzbWMyQTZPTkV2eHFhTUZJQzExeDZsQ3NSM05n?=
 =?utf-8?B?WHU4cFhMWGFLdzVqTnJSTEgzUDRKZktzYzhreEZOVkcvdXRBa2lvQnA0bk5G?=
 =?utf-8?B?U0xNRElBTFp0QTRjaTJhMUVjSEZTK3RYbEx1R1NHbkJBS1MyY056K0IwNUdi?=
 =?utf-8?B?NU50a3pmNFEzK2E3RUF4ZHg5Nm0xM3NvZGVaMDQrVE54U3ZXZzVaclNrM2lm?=
 =?utf-8?B?Mks4K2JpMDlpeVlWcjZ1RUJGck9ISWp0ek5uMnJkS0NnOW5qaUNmdjZXR1JO?=
 =?utf-8?B?L2NoODZ3R01XZ0JCMDN2VWRQVjFYVmpBK29jSy84RnNjUEQrckpZaHJGQkNx?=
 =?utf-8?B?b2hodEs4YUtKcjJIL2txdTBvRjRSR1k1MVQ2S21iNUh2ODJVMUJGbEJZYTBi?=
 =?utf-8?B?azc0NElvT0xWeU8yQ29NbWwraE5wTHhsR3RiUm1pZEJwOWNDNzRORlVVSm5H?=
 =?utf-8?B?dlhQVFFWYVdxQy9iQ1FVeGN4Q2NidWVsNG1sZmkyd0tJNE5VbzBramZLSnVx?=
 =?utf-8?B?UnZQWjRVTWR6TWFUcGdUeG0ySzB1eEZTZ0JhUWdKL2ZvVUdTMXJwdGJrNTJ2?=
 =?utf-8?B?aFA1KzJDeWN6Sk5xMGUwWXloc1JkSWtyLzk1RllUVGZyQWROTWlBUTYvRW82?=
 =?utf-8?B?U2J1bUhITkhvcWZ5WE1TZDBEd1l2bXk4bEhQa3JiZDFxZEJwMUtFVDAvVXJS?=
 =?utf-8?B?a29ldFhoYUFqem95QUpVWVlLdURDd3Z1eFp1NU0xdnNDNnVQdG9RZUJEcDFU?=
 =?utf-8?B?VldjYnFGelNFeitWOTJSdDVnb3lILzA4dll4d1NOcTNhVmZKdWY2d3ljQW04?=
 =?utf-8?B?ZDJNajV4dFhHVE4zYjdGMGtVT1JYOUFQS1F3ZWgxR3lPSkNoOXluRDBwWnNX?=
 =?utf-8?B?NS9hQ0x0NjZqd1UvcHluTjNCb0IzRDliZ3piMjl5YWJkY3RHekRBWXZuUU8w?=
 =?utf-8?B?MEloL0o0a3BZZGoxTGk4OXJucFM3VmJMcElQT3MwME1VRWk0anR4TGJlQmFG?=
 =?utf-8?B?L1NJQjF1Q1VkUmUyUk1FMWlCUTU3UFVtY2hYNGFwU2d4aGdGRXpGVGxhK0VB?=
 =?utf-8?B?WG5hVlZZY3hiKytMVzY3ZXh4TmwvQkdvcWhCejA4VHJCR1R4dHZ3dEZBNXlh?=
 =?utf-8?B?SkFlL3JDZml6RlJNZCsxNVFackR4NlFReXdkZ0w3VlgxZVlaTEVSUkdXM05X?=
 =?utf-8?B?ZEVsU3Z4TlBEYkNSV0xRa1lIVU40RHN5VlMzcXREaVY0MGdzWS80TnpPRU4x?=
 =?utf-8?B?Qi96ZzlEL2pnVExJQXdVYUFVbUxlOHkxSll1clNVa203blllc05ia2dKZW03?=
 =?utf-8?B?ZU9CY0svOUU1eHZXUXhua3lzUVRPMmsxWlJuNnpTQ0FuaUthYVMrQ3hPcnRS?=
 =?utf-8?B?VlQ2V0RENStGY25iUXJlalo1SXJYaU00QVJhMmxDNFd2T2QwcDNzcG5JKzM3?=
 =?utf-8?B?U2hndmdoZCtCUS9SNE0wd1l6M1FVbnp1SWo3S0dFVXk5NDRuVVBvU25ZSGdr?=
 =?utf-8?B?ajBaOEhGVEZ4TXZnR1BMTDlIMm05M0MzOU9sYkhmQjdOZGRyQVlqZDZjRCtR?=
 =?utf-8?B?T3pjSjdtTU5RWmY1QTB5clZZVkU2cFluSW93YitHVytIVkpPaHJZSE5LRjAx?=
 =?utf-8?B?Ry9uNHhrUE16R04zdjhjdGhJNXhIbDdMdXpKTzB3SkNraXFraG8xQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc0c7ec-bde7-4da0-ae28-08da12387462
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:31:30.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy32Fxhn0D3BfmjWWTvrFIXSWYb5c7garsA6ntkLrmAtY/QvWUtqFU7lxCX822jTO6W3xb86THPLCjXVFrAR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8268

On 29.03.2022 16:03, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/include/asm/mem_sharing.h
> +++ b/xen/arch/x86/include/asm/mem_sharing.h
> @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct domain *d)
>  int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
>                            bool unsharing);
>  
> +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> +                           bool reset_memory);

Please avoid passing multiple booleans, even more so when you already
derive them from a single "flags" value. This would likely be easiest
if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for
XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to
prove they're the same.

> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1890,15 +1890,24 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
>   * footprints the hypercall continuation should be implemented (or if this
>   * feature needs to be become "stable").
>   */
> -static int mem_sharing_fork_reset(struct domain *d)
> +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> +                           bool reset_memory)
>  {
> -    int rc;
> +    int rc = 0;
>      struct domain *pd = d->parent;
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>      struct page_info *page, *tmp;
>  
> +    ASSERT(reset_state || reset_memory);
> +
> +    if ( !d->arch.hvm.mem_sharing.fork_complete )
> +        return -ENOSYS;

Either EOPNOTSUPP (in case you think this operation could make sense
to implement for incomplete forks) or e.g. EINVAL, but please not
ENOSYS.

> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
>                  p2m_mem_paging_resume(d, &rsp);
>  #endif
> +#ifdef CONFIG_MEM_SHARING
> +            if ( mem_sharing_is_fork(d) )
> +            {
> +                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
> +                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
> +
> +                if ( reset_state || reset_mem )
> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));
> +            }
> +#endif

Should the two flags be rejected in the "else" case, rather than
being silently ignored?

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
>                  uint32_t gref;     /* IN: gref to debug         */
>              } u;
>          } debug;
> -        struct mem_sharing_op_fork {      /* OP_FORK */
> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */

I consider the notation in the comment misleading - I would read it to
mean OP_FORK and OP_RESET, supported by the earlier
OP_SHARE/ADD_PHYSMAP. Commonly we write OP_FORK{,_RESET} in such cases.

Jan


