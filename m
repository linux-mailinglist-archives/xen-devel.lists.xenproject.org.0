Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00912D14A0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:28:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46716.82834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIR4-0002Yx-V4; Mon, 07 Dec 2020 15:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46716.82834; Mon, 07 Dec 2020 15:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIR4-0002YU-Qr; Mon, 07 Dec 2020 15:28:22 +0000
Received: by outflank-mailman (input) for mailman id 46716;
 Mon, 07 Dec 2020 15:28:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kmIR3-0002Y3-CH
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:28:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmIR3-0003PS-5q; Mon, 07 Dec 2020 15:28:21 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmIR2-00082U-Og; Mon, 07 Dec 2020 15:28:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=IIVArqVktZ4J/is/epXYf6uuXtAdhEZuJtiNizzZDP4=; b=0T9rxk/eybT3TFzNxETSqqujwc
	s4bRzM9ESsczoitZqVMv69P1T+X56wXFHehgFT4IwfmMEargOTIvAZYkEbmXWb1GQMGvuCoC7xjXq
	8sv+wy/n1ZR8YqSRgZVn8638GkIr6n7eohRT7Pil25e+FdOJ3lGMTbYV2u3WKeMNly74=;
Message-ID: <5a6560c6eeff1196f65e9856579b219f3b9c1ff7.camel@xen.org>
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Mon, 07 Dec 2020 15:28:20 +0000
In-Reply-To: <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
	 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 15:21 +0100, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Rewrite those functions to use the new APIs. Modify its callers to
> unmap
> the pointer returned. Since alloc_xen_pagetable_new() is almost never
> useful unless accompanied by page clearing and a mapping, introduce a
> helper alloc_map_clear_xen_pt() for this sequence.
> 
> Note that the change of virt_to_xen_l1e() also requires vmap_to_mfn()
> to
> unmap the page, which requires domain_page.h header in vmap.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I believe the vmap part can be removed since x86 now handles
superpages.

> @@ -5085,8 +5117,8 @@ int map_pages_to_xen(
>      unsigned int flags)
>  {
>      bool locking = system_state > SYS_STATE_boot;
> -    l3_pgentry_t *pl3e, ol3e;
> -    l2_pgentry_t *pl2e, ol2e;
> +    l3_pgentry_t *pl3e = NULL, ol3e;
> +    l2_pgentry_t *pl2e = NULL, ol2e;
>      l1_pgentry_t *pl1e, ol1e;
>      unsigned int  i;
>      int rc = -ENOMEM;
> @@ -5107,6 +5139,10 @@ int map_pages_to_xen(
>  
>      while ( nr_mfns != 0 )
>      {
> +        /* Clean up mappings mapped in the previous iteration. */
> +        UNMAP_DOMAIN_PAGE(pl3e);
> +        UNMAP_DOMAIN_PAGE(pl2e);
> +
>          pl3e = virt_to_xen_l3e(virt);
>  
>          if ( !pl3e )

While rebasing, I found another issue. XSA-345 now locks the L3 table
by L3T_LOCK(virt_to_page(pl3e)) but for this series we cannot call
virt_to_page() here.

We could call domain_page_map_to_mfn() on pl3e to get back the mfn,
which should be fine since this function is rarely used outside boot so
the overhead should be low. We could probably pass an *mfn in as an
additional argument, but do we want to change this also for
virt_to_xen_l[21]e() to be consistent (although they don't need the
mfn)? I might also need to remove the R-b due to this non-trivial
change.

Thoughts?

Hongyan


