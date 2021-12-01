Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E75464D69
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 13:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235986.409336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOIj-0004cr-5G; Wed, 01 Dec 2021 12:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235986.409336; Wed, 01 Dec 2021 12:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOIj-0004aH-1a; Wed, 01 Dec 2021 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 235986;
 Wed, 01 Dec 2021 12:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msOIi-0004a7-Eo
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 12:01:28 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 692b1b4c-529e-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 13:01:27 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34712)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msOIg-000rqh-8N (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 12:01:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4DBFF1FDDA;
 Wed,  1 Dec 2021 12:01:26 +0000 (GMT)
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
X-Inumbo-ID: 692b1b4c-529e-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <66d9ffb0-a3c8-c8a8-18e6-9fc649ca2eff@srcf.net>
Date: Wed, 1 Dec 2021 12:01:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
 <2525b63f-f666-2430-2c22-b1b7b0d5d7f0@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/4] x86/PoD: simplify / improve p2m_pod_cache_add()
In-Reply-To: <2525b63f-f666-2430-2c22-b1b7b0d5d7f0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 10:53, Jan Beulich wrote:
> Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
> pointless local variable "p". Make sure the MFN logged in a debugging
> error message is actually the offending one. Adjust style.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -58,14 +58,10 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>                    unsigned int order)
>  {
>      unsigned long i;
> -    struct page_info *p;
>      struct domain *d = p2m->domain;
> +    mfn_t mfn = page_to_mfn(page);
>  
>  #ifndef NDEBUG
> -    mfn_t mfn;
> -
> -    mfn = page_to_mfn(page);
> -
>      /* Check to make sure this is a contiguous region */
>      if ( mfn_x(mfn) & ((1UL << order) - 1) )
>      {
> @@ -74,17 +70,14 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>          return -1;
>      }
>  
> -    for ( i = 0; i < 1UL << order ; i++)
> +    for ( i = 0; i < (1UL << order); i++)
>      {
> -        struct domain * od;
> +        const struct domain *od = page_get_owner(page + i);
>  
> -        p = mfn_to_page(mfn_add(mfn, i));
> -        od = page_get_owner(p);
>          if ( od != d )
>          {
> -            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
> -                   __func__, mfn_x(mfn), d->domain_id,
> -                   od ? od->domain_id : -1);
> +            printk("%s: mfn %lx owner: expected %pd, got %pd!\n",
> +                   __func__, mfn_x(mfn) + i, d, od);

Take the opportunity to drop the superfluous punctuation?


Looking through this code, no callers check for any errors, and the only
failure paths are in a debug region.  The function really ought to
become void, or at the very least, switch to -EINVAL to avoid aliasing
-EPERM.

Furthermore, in all(?) cases that it fails, we'll leak the domain
allocated page, which at the very best means the VM is going to hit
memory limit problems.  i.e. nothing good can come.

Both failures are internal memory handling errors in Xen, so the least
invasive option is probably to switch to ASSERT() (for the alignment
check), and ASSERT_UNREACHABLE() here.  That also addresses the issue
that these printk()'s aren't ratelimited, and used within several loops.

>              return -1;
>          }
>      }
> @@ -98,16 +91,12 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>       * promise to provide zero pages. So we scrub pages before using.
>       */
>      for ( i = 0; i < (1UL << order); i++ )
> -        clear_domain_page(mfn_add(page_to_mfn(page), i));
> +        clear_domain_page(mfn_add(mfn, i));

(For a future change,) this is double scrubbing in most cases.

~Andrew

>  
>      /* First, take all pages off the domain list */
>      lock_page_alloc(p2m);
> -    for ( i = 0; i < 1UL << order ; i++ )
> -    {
> -        p = page + i;
> -        page_list_del(p, &d->page_list);
> -    }
> -
> +    for ( i = 0; i < (1UL << order); i++ )
> +        page_list_del(page + i, &d->page_list);
>      unlock_page_alloc(p2m);
>  
>      /* Then add to the appropriate populate-on-demand list. */
>
>


