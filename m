Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B79464C8F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235941.409264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNln-0005Sh-J6; Wed, 01 Dec 2021 11:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235941.409264; Wed, 01 Dec 2021 11:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNln-0005Qu-FT; Wed, 01 Dec 2021 11:27:27 +0000
Received: by outflank-mailman (input) for mailman id 235941;
 Wed, 01 Dec 2021 11:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msNlm-0005Qo-9F
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:27:26 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bee270e-5298-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:16:20 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40142)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msNlk-000sCi-nZ (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 11:27:24 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C29B51FAE9;
 Wed,  1 Dec 2021 11:27:23 +0000 (GMT)
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
X-Inumbo-ID: 1bee270e-5298-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5585cbf5-6248-ca6f-8b9e-764dbb08be43@srcf.net>
Date: Wed, 1 Dec 2021 11:27:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] x86/PoD: move increment of entry count
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <d92ec1b7-6cde-7efc-2c6a-3dc3696b957f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <d92ec1b7-6cde-7efc-2c6a-3dc3696b957f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2021 11:02, Jan Beulich wrote:
> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count should indicate too large a
> value in preference to a too small one, to avoid functions bailing early
> when they find the count is zero. Hence increments should happen ahead
> of P2M updates, while decrements should happen only after. Deal with the
> one place where this hasn't been the case yet.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
>          }
>      }
>  
> +    pod_lock(p2m);
> +    p2m->pod.entry_count += (1UL << order) - pod_count;
> +    pod_unlock(p2m);
> +
>      /* Now, actually do the two-way mapping */
>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>                         p2m_populate_on_demand, p2m->default_access);
>      if ( rc == 0 )
> -    {
> -        pod_lock(p2m);
> -        p2m->pod.entry_count += 1UL << order;
> -        p2m->pod.entry_count -= pod_count;
> -        BUG_ON(p2m->pod.entry_count < 0);
> -        pod_unlock(p2m);
> -
>          ioreq_request_mapcache_invalidate(d);
> -    }
>      else if ( order )
>      {
>          /*
> @@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
>                 d, gfn_l, order, rc);
>          domain_crash(d);
>      }
> +    else if ( !pod_count )
> +    {
> +        pod_lock(p2m);
> +        BUG_ON(!p2m->pod.entry_count);
> +        --p2m->pod.entry_count;
> +        pod_unlock(p2m);
> +    }
>  
>  out:
>      gfn_unlock(p2m, gfn, order);

This email appears to contain the same patch twice, presumably split at
this point.

Which one should be reviewed?

~Andrew

> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count should indicate too large a
> value in preference to a too small one, to avoid functions bailing early
> when they find the count is zero. Hence increments should happen ahead
> of P2M updates, while decrements should happen only after. Deal with the
> one place where this hasn't been the case yet.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
>          }
>      }
>  
> +    pod_lock(p2m);
> +    p2m->pod.entry_count += (1UL << order) - pod_count;
> +    pod_unlock(p2m);
> +
>      /* Now, actually do the two-way mapping */
>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>                         p2m_populate_on_demand, p2m->default_access);
>      if ( rc == 0 )
> -    {
> -        pod_lock(p2m);
> -        p2m->pod.entry_count += 1UL << order;
> -        p2m->pod.entry_count -= pod_count;
> -        BUG_ON(p2m->pod.entry_count < 0);
> -        pod_unlock(p2m);
> -
>          ioreq_request_mapcache_invalidate(d);
> -    }
>      else if ( order )
>      {
>          /*
> @@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
>                 d, gfn_l, order, rc);
>          domain_crash(d);
>      }
> +    else if ( !pod_count )
> +    {
> +        pod_lock(p2m);
> +        BUG_ON(!p2m->pod.entry_count);
> +        --p2m->pod.entry_count;
> +        pod_unlock(p2m);
> +    }
>  
>  out:
>      gfn_unlock(p2m, gfn, order);
>
>


