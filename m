Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114CB16EED
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065301.1430744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPr7-0006w2-TW; Thu, 31 Jul 2025 09:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065301.1430744; Thu, 31 Jul 2025 09:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPr7-0006u8-Qs; Thu, 31 Jul 2025 09:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1065301;
 Thu, 31 Jul 2025 09:45:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uhPr6-0006u2-N8
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:45:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhPr6-00An6k-0i;
 Thu, 31 Jul 2025 09:45:44 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhPr5-000JQ8-31;
 Thu, 31 Jul 2025 09:45:44 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=5Zcch4Gt3J8lnuFUxEUV425/BxBNpM/deqVfODPAOco=; b=ThsBEGlQZh/9p1J+p8ELLxMjA/
	LdevacU/DfFd7NNsopFlCYCTxYZDLLpuwt94KKLhGgy0evAHEbdQFgQENxKe/LKAMFmSysMcrDFEO
	/dryEEYD3qKimP9h/4wYJkvBppmIPDYwGYlYG4VeIO6Nj+v+Fn+d+/nAB7c9CSg/GY6g=;
Date: Thu, 31 Jul 2025 11:45:42 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
Message-ID: <aIs7Rg0sB7C2BUWA@l14>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
 <aIdo5K6RfTUFr__Q@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIdo5K6RfTUFr__Q@macbook.local>

On Mon, Jul 28, 2025 at 02:11:16PM +0200, Roger Pau Monné wrote:
> On Mon, Jul 28, 2025 at 12:24:03PM +0200, Marek Marczykowski-Górecki wrote:
> > When running xl in a domU, it doesn't have access to the Xen command
> > line. Before the non-truncating xc_xenver_cmdline(), it was always set
> > with strdup, possibly of an empty string. Now it's NULL. Treat it the
> > same as empty cmdline, as it was before. Autoballoon isn't relevant for
> > xl devd in a domU anyway.
> > 
> > Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > ---
> >  tools/xl/xl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> > index ec72ca60c32a..e183d42b1d65 100644
> > --- a/tools/xl/xl.c
> > +++ b/tools/xl/xl.c
> > @@ -81,6 +81,8 @@ static int auto_autoballoon(void)
> >      info = libxl_get_version_info(ctx);
> >      if (!info)
> >          return 1; /* default to on */
> > +    if (!info->commandline)
> > +        return 1;
> 
> It's a nit, but could you join with the previous if condition, so that
> the comment also applies?
> 
>      if (!info || !info->commandline)
>          return 1; /* default to on */

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

