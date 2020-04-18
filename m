Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB91AEC0A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 13:15:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPlR7-0006pp-DD; Sat, 18 Apr 2020 11:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kJB=6C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPlR5-0006pk-Dn
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 11:14:59 +0000
X-Inumbo-ID: d716517a-8165-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d716517a-8165-11ea-b58d-bc764e2007e4;
 Sat, 18 Apr 2020 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4sF/li1s1aznx4euBWkYr5XliRGisWmMxDp2HKyFP4U=; b=Q85lgQ67J6tQ2H08OuG5YpfmaX
 hnVNvNkAVLOZ98+v0t61kdGIXqYt+9CcCLs5FjoKiifz0QqjxU20Vfvh9JKof5fmA5C1NhkdWZ3Vg
 gCuxRQ4hMtitcuRRInEVO/pTqdt0fXDr+7jtMjis2wwQAgK8driwXxLzEwt93XrYq7q8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPlR3-0007g6-Ak; Sat, 18 Apr 2020 11:14:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPlR3-00070T-3O; Sat, 18 Apr 2020 11:14:57 +0000
Subject: Re: [PATCH 6/6] x86/mem-paging: consistently use gfn_t
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <224337b8-98b4-b0f6-a57a-6f508ffa6838@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <66d56fc4-11a3-6c43-5fbd-ef7039fd06f8@xen.org>
Date: Sat, 18 Apr 2020 12:14:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <224337b8-98b4-b0f6-a57a-6f508ffa6838@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 16/04/2020 16:48, Jan Beulich wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2151,16 +2151,17 @@ static int mod_l1_entry(l1_pgentry_t *pl
>                paging_mode_translate(pg_dom) )
>           {
>               p2m_type_t p2mt;
> +            unsigned long gfn = l1e_get_pfn(nl1e);

How about making gfn a gfn_t directly? This would avoid code churn when...

>               p2m_query_t q = l1e_get_flags(nl1e) & _PAGE_RW ?
>                               P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
>   
> -            page = get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt, q);
> +            page = get_page_from_gfn(pg_dom, gfn, &p2mt, q);

... I am going to convert get_page_from_gfn() to use typesafe gfn. See [1].

> @@ -89,16 +88,15 @@ void p2m_mem_paging_drop_page(struct dom
>    * already sent to the pager. In this case the caller has to try again until the
>    * gfn is fully paged in again.
>    */
> -void p2m_mem_paging_populate(struct domain *d, unsigned long gfn_l)
> +void p2m_mem_paging_populate(struct domain *d, gfn_t gfn)
>   {
>       struct vcpu *v = current;
>       vm_event_request_t req = {
>           .reason = VM_EVENT_REASON_MEM_PAGING,
> -        .u.mem_paging.gfn = gfn_l
> +        .u.mem_paging.gfn = gfn_x(gfn)
>       };
>       p2m_type_t p2mt;
>       p2m_access_t a;
> -    gfn_t gfn = _gfn(gfn_l);
>       mfn_t mfn;
>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>       int rc = vm_event_claim_slot(d, d->vm_event_paging);
> @@ -107,7 +105,7 @@ void p2m_mem_paging_populate(struct doma
>       if ( rc == -EOPNOTSUPP )
>       {
>           gdprintk(XENLOG_ERR, "Dom%d paging gfn %lx yet no ring in place\n",
> -                 d->domain_id, gfn_l);
> +                 d->domain_id, gfn_x(gfn));

Please use PRI_gfn in the format string to match the argument change.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20200322161418.31606-18-julien@xen.org/

-- 
Julien Grall

