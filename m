Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E466F0BBE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 20:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527053.819228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps61q-0002dh-Gs; Thu, 27 Apr 2023 18:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527053.819228; Thu, 27 Apr 2023 18:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps61q-0002aK-D5; Thu, 27 Apr 2023 18:07:38 +0000
Received: by outflank-mailman (input) for mailman id 527053;
 Thu, 27 Apr 2023 18:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+EI=AS=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ps61p-0002aE-Ah
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 18:07:37 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62666bf2-e526-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 20:07:35 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so8085521f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Apr 2023 11:07:34 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b002f9ff443184sm19071096wrj.24.2023.04.27.11.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 11:07:32 -0700 (PDT)
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
X-Inumbo-ID: 62666bf2-e526-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682618853; x=1685210853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7DibGKgOKBzho3uTV59K1AKg5KmQUAReKXhR2ASaC9g=;
        b=XuFZeiZUF+dtcgpmPaqmtsI14m29aSoBkLupeB1jmDcK3qHtRWGFOpIE7fjZjmD3He
         hOn+tCde9cgPHcq2Q6vGsMpINFJpWuY6VYdjZg2Y4ldk52i+sj311CtGKljUAst38iRN
         LHvZ90QFX2Xes1uh/cGYNOuOAnbDEgKQRFiKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682618853; x=1685210853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DibGKgOKBzho3uTV59K1AKg5KmQUAReKXhR2ASaC9g=;
        b=FVrcCcmjQ9O6HMEBVSY6UeW5D59dokLq/GXCfC3OpLlSD9tEAGXSEB78yyHUPgkylv
         CDWoRcIanC3HaqP+LfGnqRheRjxJa4mjpor+ZJI5EgHvBWUoAZtH9kYyUnezUQlTLApa
         uJZgDDsiwZxOgdAEeRsyv9AN8NsQ5m6CJcAn7+Zwq2kRDbOqOP3asJ3GVRvyJO/GS8A9
         g+j2XU9fO2IGFvEaYjucCymfJTdMKZCWGseBp/GbGhD3f3seM7hloA7JV5B8RGCrP2oe
         x1tCLwPaFNxVrHKqp6rIDdGK7vxMO/Vxs/dckjR+sRQMJ5Mikr+eQzsiRTUvsqMbSY8i
         GDTA==
X-Gm-Message-State: AC+VfDxHfrXGlvDAYn0Zb9F/ab2tyn9mVOvvGAeT6m+Zs/6YGGEMfrJv
	nbdrqUPLEfWO6nXOD9iVZUS20A==
X-Google-Smtp-Source: ACHHUZ4wWbfDC5vU2SS0087aAFjY++P0Vc9HNEa5//25qFtxlLzogYujIrCKPyGkQPeq9Z+dX9rO1g==
X-Received: by 2002:adf:f810:0:b0:2c5:5a65:79a0 with SMTP id s16-20020adff810000000b002c55a6579a0mr2149125wrp.53.1682618853615;
        Thu, 27 Apr 2023 11:07:33 -0700 (PDT)
Message-ID: <644ab9e4.df0a0220.d3920.fced@mx.google.com>
X-Google-Original-Message-ID: <ZEq54R4z/PWcg3Kg@EMEAENGAAD19049.>
Date: Thu, 27 Apr 2023 19:07:29 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/7] tools: Use new xc function for some
 xc_domain_getinfo calls
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-7-alejandro.vallejo@cloud.com>
 <91d37778-ec77-6716-61e9-d47b0517508a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91d37778-ec77-6716-61e9-d47b0517508a@citrix.com>

On Thu, Apr 27, 2023 at 01:35:18PM +0100, Andrew Cooper wrote:
> 
> > +    xc_domaininfo_t di;
> >      unsigned int nr_leaves, nr_msrs;
> >      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> >      /*
> > @@ -291,13 +292,13 @@ static int xc_cpuid_xend_policy(
> >      xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
> >      unsigned int nr_host, nr_def, nr_cur;
> >  
> > -    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> > -         di.domid != domid )
> > +    if ( xc_domain_getinfo_single(xch, domid, &di) < 0 )
> >      {
> >          ERROR("Failed to obtain d%d info", domid);
> >          rc = -ESRCH;
> 
> Now that xc_domain_getinfo_single() has a sane return value, you want to
> set it in the if(), and not override to ESRCH here.
> 
> These two comments repeat several other times.

That override shouldn't be done, true. Removed on v2.

That said, looking again through the callers it appears some/many of them rely on
PERROR() to print the error code to stderr on failure. At the bottom of the
invocation there's xencall1(), which itself is defined in xencall.h to return -1 on
error and sets errno.

I think I'll also modify the error handlers that this patch touches to improve
their debug. i.e: ERROR() -> PERROR() and also print the domid that failed to be
found where it's not set. And patch 2 to define the new wrapper as returning 0 or
-1 exclusively rather than forwarding whatever comes from below.

> 
> > diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
> > index 263a3f4c85..59b4d641c9 100644
> > --- a/tools/libs/guest/xg_dom_boot.c
> > +++ b/tools/libs/guest/xg_dom_boot.c
> > @@ -164,7 +164,7 @@ void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
> >  
> >  int xc_dom_boot_image(struct xc_dom_image *dom)
> >  {
> > -    xc_dominfo_t info;
> > +    xc_domaininfo_t info;
> >      int rc;
> >  
> >      DOMPRINTF_CALLED(dom->xch);
> > @@ -174,21 +174,13 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
> >          return rc;
> >  
> >      /* collect some info */
> > -    rc = xc_domain_getinfo(dom->xch, dom->guest_domid, 1, &info);
> > +    rc = xc_domain_getinfo_single(dom->xch, dom->guest_domid, &info);
> >      if ( rc < 0 )
> >      {
> >          xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
> >                       "%s: getdomaininfo failed (rc=%d)", __FUNCTION__, rc);
> >          return rc;
> 
> This need to change to -1, or you've broken the error convention of this
> function.  (Yes, libxc is a giant mess of error handling...)

I think you meant xc_exchange_page() instead? I've also modified this one so
errno lands in the error message.

> > diff --git a/tools/vchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
> > index e1d959c6d1..9c4c336b03 100644
> > --- a/tools/vchan/vchan-socket-proxy.c
> > +++ b/tools/vchan/vchan-socket-proxy.c
> > @@ -254,12 +254,12 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
> >          if (ctrl)
> >              break;
> >  
> > -        ret = xc_domain_getinfo(xc, domid, 1, &dominfo);
> > +        ret = xc_domain_getinfo_single(xc, domid, &dominfo);
> >          /* break the loop if domain is definitely not there anymore, but
> >           * continue if it is or the call failed (like EPERM) */
> >          if (ret == -1 && errno == ESRCH)
> 
> Oh wow... so this bit of vchan was written expecting sane semantics out
> of xc_domain_getinfo() in the first place...
> 
> This needs adjusting too because of the -1/errno -> -errno change.
> 
> ~Andrew

With the code changed to assume -1/errno (so PERROR() can still be used) this
line will be correct and can be left as-is. Does this all sound ok?

Cheers,
Alejandro

