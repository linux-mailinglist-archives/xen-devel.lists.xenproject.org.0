Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5246527B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236111.409534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS7a-0006Am-3x; Wed, 01 Dec 2021 16:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236111.409534; Wed, 01 Dec 2021 16:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS7a-00068U-0l; Wed, 01 Dec 2021 16:06:14 +0000
Received: by outflank-mailman (input) for mailman id 236111;
 Wed, 01 Dec 2021 16:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msS7Y-00067q-AJ
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:06:12 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a1ec241-52c0-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 17:06:11 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44012)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msS7X-000wa5-1K (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 16:06:11 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3F4751FF79;
 Wed,  1 Dec 2021 16:06:11 +0000 (GMT)
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
X-Inumbo-ID: 9a1ec241-52c0-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <39afb361-4047-68d1-acdd-e0838f52cb5f@srcf.net>
Date: Wed, 1 Dec 2021 16:06:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
 <e5070cbe-949a-4913-1f99-7b7a4e6c5536@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/2] x86/paging: tidy paging_mfn_is_dirty()
In-Reply-To: <e5070cbe-949a-4913-1f99-7b7a4e6c5536@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 10:35, Jan Beulich wrote:
> The function returning a boolean indicator, make it return bool. Also
> constify its struct domain parameter, albeit requiring to also adjust
> mm_locked_by_me(). Furthermore the function is used by shadow code only.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/mm-locks.h
> +++ b/xen/arch/x86/mm/mm-locks.h
> @@ -40,7 +40,7 @@ static inline void mm_lock_init(mm_lock_
>      l->unlock_level = 0;
>  }
>  
> -static inline int mm_locked_by_me(mm_lock_t *l)
> +static inline int mm_locked_by_me(const mm_lock_t *l)

bool too?

>  {
>      return (l->lock.recurse_cpu == current->processor);
>  }
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -351,14 +351,14 @@ void paging_mark_dirty(struct domain *d,
>      paging_mark_pfn_dirty(d, pfn);
>  }
>  
> -
> +#ifdef CONFIG_SHADOW_PAGING
>  /* Is this guest page dirty? */
> -int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn)
> +bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn)
>  {
>      pfn_t pfn;
>      mfn_t mfn, *l4, *l3, *l2;
>      unsigned long *l1;
> -    int rv;
> +    bool dirty;
>  
>      ASSERT(paging_locked_by_me(d));
>      ASSERT(paging_mode_log_dirty(d));
> @@ -367,36 +367,37 @@ int paging_mfn_is_dirty(struct domain *d
>      pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));

There's nothing inherently paging.c related about this function. 
Thoughts on moving the implementation across, rather than #ifdef-ing it?

If not, can we at least correct gmfn to mfn here and in the prototype?

Alternatively, do we want to start putting things like this in a real
library so we can have the toolchain figure this out automatically?

>      /* Invalid pages can't be dirty. */
>      if ( unlikely(!VALID_M2P(pfn_x(pfn))) )
> -        return 0;
> +        return false;
>  
>      mfn = d->arch.paging.log_dirty.top;
>      if ( !mfn_valid(mfn) )

These don't need to be mfn_valid().  They can be checks against
MFN_INVALID instead, because the logdirty bitmap is a Xen internal
structure.

In response to your comment in the previous patch, this would
substantially reduce the overhead of paging_mark_pfn_dirty() and
paging_mfn_is_dirty().

~Andrew

