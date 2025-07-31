Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE09B16EC7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065224.1430614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPj4-0006rE-SX; Thu, 31 Jul 2025 09:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065224.1430614; Thu, 31 Jul 2025 09:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPj4-0006om-PI; Thu, 31 Jul 2025 09:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1065224;
 Thu, 31 Jul 2025 09:37:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1uhPj2-0006oc-RR; Thu, 31 Jul 2025 09:37:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhPj0-00AmtL-1b;
 Thu, 31 Jul 2025 09:37:22 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhPj0-000IaV-0i;
 Thu, 31 Jul 2025 09:37:22 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=CJLnyVueJajoFXaFlJV3VdqVl/Xnt5TjDYNalBRdhRM=; b=5pK7+5FnBQnCiTsX2PGdAenFSp
	JNehyNSvWz9iobKApz20341nWRNnNYbm/NldKwsDB0Q6cJohx7pIaX6OEZVwpLlEO1WPa6lvgEUm1
	UkVFBlMQT3TUX3Z8yOH8KqJjbzYZzt8DcuF2xydwtlmhjTs4H8LrB8p+11+rjhnA38CI=;
Date: Thu, 31 Jul 2025 11:37:11 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] xenalyze: correct symbol name length fscanf() specifier
Message-ID: <aIs5R_ttIOGTApqj@l14>
References: <72218fb5-92f2-481d-9754-e6069f945c8e@suse.com>
 <DBNUR2PNKJKP.677MC6QFT97J@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBNUR2PNKJKP.677MC6QFT97J@amd.com>

On Mon, Jul 28, 2025 at 07:08:46PM +0200, Alejandro Vallejo wrote:
> On Mon Jul 28, 2025 at 5:52 PM CEST, Jan Beulich wrote:
> > SYMBOL_NAME_SIZE is 124, not 128. Use the symbolic name there as well,
> > to avoid any disconnect.
> >
> > While there correct indentation on the following line as well.
> >
> > Coverity ID: 1659391
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > There's no useful Fixes: tag; the code was imported from HG this way
> > about 10 years ago.
> >
> > --- a/tools/xentrace/xenalyze.c
> > +++ b/tools/xentrace/xenalyze.c
> > @@ -321,11 +321,10 @@ void parse_symbol_file(char *fn) {
> >              (*p)->next=NULL;
> >          }
> >  
> > -        /* FIXME -- use SYMBOL_NAME_SIZE */
> >          /* FIXME -- use regexp.  This won't work for symbols with spaces (yes they exist) */
> >          (*p)->symbols[(*p)->count].addr = 0xDEADBEEF;
> > -        if ( fscanf(symbol_file, "%llx %128s",
> > -               &(*p)->symbols[(*p)->count].addr,
> > +        if ( fscanf(symbol_file, "%llx %" STR(SYMBOL_NAME_SIZE) "s",
> 
> nit: A comment at the #define stating it's used this way would prevent future
> "oops" situations when/if someone tries to do (e.g) "#define SYMBOL_NAME_SIZE (1
> << 4)"
> 
> Though arguably that would cause a compile-time error anyway (except perhaps
> an octal literal?), so meh. With or without the adjustment:
> 
>   Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

