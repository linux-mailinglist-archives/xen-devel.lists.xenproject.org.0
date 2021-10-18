Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DC431658
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212006.369728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ6Z-0004ML-Sv; Mon, 18 Oct 2021 10:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212006.369728; Mon, 18 Oct 2021 10:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ6Z-0004K9-PR; Mon, 18 Oct 2021 10:42:55 +0000
Received: by outflank-mailman (input) for mailman id 212006;
 Mon, 18 Oct 2021 10:42:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ6Y-0004K0-7O
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:42:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ6Y-0002o1-6d
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:42:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ6Y-0002Zv-5s
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:42:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcQ6U-0005YL-RS; Mon, 18 Oct 2021 11:42:50 +0100
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
	bh=luKiMLwYeNzkpUIEP+eDifVCSZHNpqH38O8R8ikOigA=; b=5GK1kBUjQNGgWGc8fX5fiCj+VJ
	Nn82sm8qF2Rrg7XLY1NKMC5DJih9qsWf0tekvnJAYbambXzmgL+5ZF+eoRB34cU8xruM9OE9GfXoY
	kNRtY1c6QGMvXUeNQwnJMS6WXPGMXTKXi1cQclSE4tok9Oyw9h2zoFlWKdV2/VSrSQmo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.20394.574634.548545@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 11:42:50 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()
In-Reply-To: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()"):
> This happens after nestedhvm_vcpu_initialise(), so its effects also need
> to be undone.
> 
> Fixes: 40a4a9d72d16 ("viridian: add init hooks")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1583,7 +1583,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
>  
>      rc = viridian_vcpu_init(v);
>      if ( rc )
> -        goto fail5;
> +        goto fail6;

Not acomment about the patch; rather about the code in general.

I have not looked at the context.

But OMG, this is horrific.  How can anyone write code in such an idiom
without writing endless bugs ?

Ian.

