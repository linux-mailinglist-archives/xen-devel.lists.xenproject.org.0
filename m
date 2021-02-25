Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FC32547D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89878.169735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKLS-0003jr-TM; Thu, 25 Feb 2021 17:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89878.169735; Thu, 25 Feb 2021 17:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKLS-0003jR-P5; Thu, 25 Feb 2021 17:22:34 +0000
Received: by outflank-mailman (input) for mailman id 89878;
 Thu, 25 Feb 2021 17:22:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKLR-0003jL-7A
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:22:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKLR-0005WP-6H
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:22:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKLR-0001yS-49
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:22:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFKLN-00025f-VR; Thu, 25 Feb 2021 17:22:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=5f4gmIamxphp8dyxysQf2Q6S9J5oPvwtHF2nfTWISZ4=; b=YymD/MaVbzBnYiQAppHKhkb4XB
	rbV9KL1x71akKZ3EfXWe/U3kvMWnIVSPm4KT/NB+DRkOUD2pS6AZxrEczcFXmjftxCjHho/MjI/5l
	N8lGCXbZp2ypXVWi4gbda3cUbTxlfNsDu4qErks61Oq2anyT2w0w6oyRr3n9HnRDpqSs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.56533.776930.841094@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 17:22:29 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15] x86/dmop: Properly fail for PV guests
In-Reply-To: <20210225170936.3008-1-andrew.cooper3@citrix.com>
References: <20210225170936.3008-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] x86/dmop: Properly fail for PV guests"):
> The current code has an early exit for PV guests, but it returns 0 having done
> nothing.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index 5bc172a5d4..612749442e 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -365,6 +365,7 @@ int dm_op(const struct dmop_args *op_args)
>      if ( rc )
>          return rc;
>  
> +    rc = -EINVAL;
>      if ( !is_hvm_domain(d) )
>          goto out;

Is this style, of setting rc outside the if, the standard hypervisor
style ?

Ian.

