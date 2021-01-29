Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D473A30899B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78197.142149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5V8Q-0004no-L0; Fri, 29 Jan 2021 14:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78197.142149; Fri, 29 Jan 2021 14:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5V8Q-0004nN-Hy; Fri, 29 Jan 2021 14:52:30 +0000
Received: by outflank-mailman (input) for mailman id 78197;
 Fri, 29 Jan 2021 14:52:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5V8P-0004nC-Cm
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:52:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5V8P-0007v1-6q
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:52:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5V8P-0005y8-5i
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:52:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l5V8L-0007dC-SZ; Fri, 29 Jan 2021 14:52:25 +0000
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
	bh=Urs5NYW/ZEn8ng21nVskN/HW6r0DYnzH9m90M6X7pIw=; b=cDaw0iBwJfHlj/iPvyX8FCiVS4
	nj1L2omozW/UqPmNAvp1bACbp8k68ljtBguyWs5fJLSZmbKPHSif9J1juGa9og8/MhI5lWZxW3fGZ
	Rv5l6sodGwCYmowpaiKdVkQl222V3FYRClXnExTigPYCSING47h0spdVV3ez5im40GAs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24596.8489.652233.746259@mariner.uk.xensource.com>
Date: Fri, 29 Jan 2021 14:52:25 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH HVM v1 1/1] hvm: refactor set param
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20210129135950.32095-1-nmanthey@amazon.de>
References: <20210129135950.32095-1-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hi.  Thanks for this.

Norbert Manthey writes ("[PATCH HVM v1 1/1] hvm: refactor set param"):
> To prevent leaking HVM params via L1TF and similar issues on a
> hyperthread pair, let's load values of domains as late as possible.
> 
> Furthermore, speculative barriers are re-arranged to make sure we do not
> allow guests running on co-located VCPUs to leak hvm parameter values of
> other domains.
> 
> This is part of the speculative hardening effort.

This missed the feature freeze last posing date.  But I think it may
well warrant a freeze exception.  Could someone who understands this
better explain to me the risks of this patch, and the risks of not
taking it ?

I had two comments from reading the diff (but not the code in context):

> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4060,7 +4060,7 @@ static int hvm_allow_set_param(struct domain *d,
>                                 uint32_t index,
>                                 uint64_t new_value)
>  {
> -    uint64_t value = d->arch.hvm.params[index];
> +    uint64_t value;
>      int rc;

This leaves the value "value" uninitialised.  Does hypervisor style
not allow late declaration ?  We can hope, I guess, that the compiler
would spot uses of value between here and the point of use.  But maybe
&value is used.  </Rust-programmer>

>      rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
> @@ -4108,6 +4108,13 @@ static int hvm_allow_set_param(struct domain *d,
>      if ( rc )
>          return rc;
>  
> +    if ( index >= HVM_NR_PARAMS )
> +        return -EINVAL;

This condition is new AFAICT.  Presumably it duplicates an earlier
check for the same condition ?  I'm not sure I fully understand the
implications.  But maybe I don't need to.

> @@ -4388,6 +4395,10 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
>      if ( rc )
>          return rc;
>  
> +    /* Make sure the index bound check in hvm_get_param is respected, as well as
> +       the above domain permissions. */
> +    block_speculation();
> +
>      switch ( index )
>      {
>      case HVM_PARAM_ACPI_S_STATE:
> @@ -4428,9 +4439,6 @@ static int hvmop_get_param(
>      if ( a.index >= HVM_NR_PARAMS )
>          return -EINVAL;
>  
> -    /* Make sure the above bound check is not bypassed during speculation. */
> -    block_speculation();
> -

This pair of hunks seem "more obviously" OK to me...

Thanks,
Ian.

