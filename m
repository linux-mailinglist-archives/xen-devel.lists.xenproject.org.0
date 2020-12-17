Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616692DD90B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 20:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56108.97957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpyZH-0001G0-En; Thu, 17 Dec 2020 19:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56108.97957; Thu, 17 Dec 2020 19:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpyZH-0001Fd-Ap; Thu, 17 Dec 2020 19:04:03 +0000
Received: by outflank-mailman (input) for mailman id 56108;
 Thu, 17 Dec 2020 19:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIZe=FV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpyZE-0001FH-Q7
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 19:04:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef42eea2-5961-4759-a758-ae352e65c152;
 Thu, 17 Dec 2020 19:04:00 +0000 (UTC)
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
X-Inumbo-ID: ef42eea2-5961-4759-a758-ae352e65c152
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608231839;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vvGEhdZ3CPO98v3B3B26nGP9tbSQ53gH9VoMQvb25vA=;
  b=RUW+vJQFtVqYPHHLkVYW9Ao1wXg1PFlGk/vTnBseliVn4BWa+umBMrRU
   iXFZZ4NSZqzUR5oC+s4RuWj2arEBOcoA5gl15OO3uWl/ML/xCH4EPqZR2
   KiBtF0TCAXLYpNnDqxQlmlsTFc3O7PZb+1lwf2r95eDsUmyNrs3ihAf8n
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Kf6KMR+S+tzQ8TyKr20uh3sbV7mOUEpG5ZXF3c6Vu8jm3zJccQ9MrBc6Efn2ePo5joLBBsUsiH
 E+4NgpsGHxzlhKswUMprcuqDwhHKMOrk6zgOZ3z66OXE5XLv0BOCG6o2ep46fTiw2Ml0NryL1l
 0hJ8wYvJYR9n/j7rXiUMYyhWil39wpwwufU4IG5J5GWp0xLXeLCyjmQImhBeDvPR8JMKKfmHhd
 CZF3tNK8DT/1vxrDZYVuK9HtftE74MTKaXtj4vjoqZ3erevRlXeIt6Y3D3tOWYp/taMa6S3hpO
 f7Y=
X-SBRS: 5.2
X-MesageID: 34716130
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,428,1599537600"; 
   d="scan'208";a="34716130"
Subject: Re: [PATCH 1/6] x86/p2m: tidy p2m_add_foreign() a little
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <8b70c26e-7ae6-8438-67a3-99cef338ba52@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <55de56b3-0e83-c558-6432-9853db82f57a@citrix.com>
Date: Thu, 17 Dec 2020 19:03:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b70c26e-7ae6-8438-67a3-99cef338ba52@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 16:25, Jan Beulich wrote:
> Drop a bogus ASSERT() - we don't typically assert incoming domain
> pointers to be non-NULL, and there's no particular reason to do so here.
>
> Replace the open-coded DOMID_SELF check by use of
> rcu_lock_remote_domain_by_id(), at the same time covering the request
> being made with the current domain's actual ID.
>
> Move the "both domains same" check into just the path where it really
> is meaningful.
>
> Swap the order of the two puts, such that
> - the p2m lock isn't needlessly held across put_page(),
> - a separate put_page() on an error path can be avoided,
> - they're inverse to the order of the respective gets.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> The DOMID_SELF check being converted also suggests to me that there's an
> implication of tdom == current->domain, which would in turn appear to
> mean the "both domains same" check could as well be dropped altogether.

I don't see anything conceptually wrong with the toolstack creating a
foreign mapping on behalf of a guest at construction time.  I'd go as
far as to argue that it is an interface shortcoming if this didn't
function correctly.

>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2560,9 +2560,6 @@ int p2m_add_foreign(struct domain *tdom,
>      int rc;
>      struct domain *fdom;
>  
> -    ASSERT(tdom);
> -    if ( foreigndom == DOMID_SELF )
> -        return -EINVAL;
>      /*
>       * hvm fixme: until support is added to p2m teardown code to cleanup any
>       * foreign entries, limit this to hardware domain only.
> @@ -2573,13 +2570,15 @@ int p2m_add_foreign(struct domain *tdom,
>      if ( foreigndom == DOMID_XEN )
>          fdom = rcu_lock_domain(dom_xen);
>      else
> -        fdom = rcu_lock_domain_by_id(foreigndom);
> -    if ( fdom == NULL )
> -        return -ESRCH;
> +    {
> +        rc = rcu_lock_remote_domain_by_id(foreigndom, &fdom);

It occurs to me that rcu_lock_remote_domain_by_id()'s self error path
ought to be -EINVAL rather than -EPERM.  It's never for permissions
reasons that we restrict to remote domains like this - always for
technical ones.

But that is definitely content for a different patch.

~Andrew

