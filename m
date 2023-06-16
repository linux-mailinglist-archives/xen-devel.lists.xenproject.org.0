Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62554733B3C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550490.859603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGUj-0000yT-95; Fri, 16 Jun 2023 20:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550490.859603; Fri, 16 Jun 2023 20:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGUj-0000wH-6C; Fri, 16 Jun 2023 20:56:33 +0000
Received: by outflank-mailman (input) for mailman id 550490;
 Fri, 16 Jun 2023 20:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlCr=CE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qAGUh-0000O6-ID
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:56:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439bf9c8-0c88-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 22:56:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ACF561E6C;
 Fri, 16 Jun 2023 20:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D8C433CA;
 Fri, 16 Jun 2023 20:56:26 +0000 (UTC)
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
X-Inumbo-ID: 439bf9c8-0c88-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686948987;
	bh=pNn82ZJ4l459ty5FYwSOj3mE/lmX9lliJjdv+6TfJjM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tGgf+hVAEKEozBQ1Y/MJHU3tc00F9ohhUoOpEMJg84m6XKgep5M6hds3OKQIeoI+0
	 fATCKxJyeqbnPF0ZZEJHIFgEt5hrldh8+w8TtUfUcKGR37EZ2VPhFug8VnTXWjEWVZ
	 aApjRbWaAFl5QDwMM8vjOSjKT2Jd4Nss/lr66LM/trHQLefgGgF43IvAbfeFAIfLam
	 neuzg57R2EwdVBCJvGmNmie0k3Dcybo/5AtCmPAJSggC5udjG4mhS1gCTaOPsb7Wr6
	 EynYtTlcwotvwX06sOfDXqCi+HQhls6b673bnDlYQpGFPtUAavWtXtEbPPqGF8Ja0i
	 XyTtcNTmKEaYA==
Date: Fri, 16 Jun 2023 13:56:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Refactoring of a possibly unsafe pattern for variable initialization
 via function calls
In-Reply-To: <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com> <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com> <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jun 2023, Nicola Vetrini wrote:
> On 16/06/23 09:19, Jan Beulich wrote:
> > On 15.06.2023 18:39, nicola wrote:
> > > while investigating possible patches regarding Mandatory Rule 9.1, I
> > > found the following pattern, that is likely to results in a lot possible
> > > positives from many (all) static analysis tools for this rule.
> > > 
> > > This is the current status (taken from `xen/common/device_tree.c:135')
> > > 
> > > 
> > > const struct dt_property *dt_find_property(const struct dt_device_node
> > > *np,
> > >                                              const char *name, u32 *lenp)
> > > {
> > >       const struct dt_property *pp;
> > > 
> > >       if ( !np )
> > >           return NULL;
> > > 
> > >       for ( pp = np->properties; pp; pp = pp->next )
> > >       {
> > >           if ( dt_prop_cmp(pp->name, name) == 0 )
> > >           {
> > >               if ( lenp )
> > >                   *lenp = pp->length;
> > >               break;
> > >           }
> > >       }
> > > 
> > >       return pp;
> > > }
> > > 
> > > 
> > > 
> > > 
> > > It's very hard to detect that the pointee is always written whenever a
> > > non-NULL pointer for `lenp' is supplied, and it can safely be read in
> > > the callee, so a sound analysis will err on the cautious side.
> > 
> > I'm having trouble seeing why this is hard to recognize: The loop can
> > only be exited two ways: pp == NULL or with *lenp written.
> > 
> > For rule 9.1 I'd rather expect the scanning tool (and often the compiler)
> > to get into trouble with the NULL return value case, and *lenp not being
> > written yet apparently consumed in the caller. Then, however, ...
> 
> 
> You're right, I made a mistake, thank you for finding it.
> I meant to write on `*lenp' in all execution paths.
> Please, take a look at this revised version:
> 
> 
> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>                                            const char *name, u32 *lenp)
> {
>     u32 len = 0;
>     const struct dt_property *pp = NULL;
> 
>     if ( np )
>     {
>         for ( pp = np->properties; pp; pp = pp->next )
>         {
>             if ( dt_prop_cmp(pp->name, name) == 0 )
>             {
>                 len = pp->length;
>                 break;
>             }
>         }
>     }
> 
>     if ( lenp )
>         *lenp = len;
>     return pp;
> }

Nesting more will make the code less readable and also cause other code
quality metrics to deteriorate (cyclomatic complexity).

Would the below work?


const struct dt_property *dt_find_property(const struct dt_device_node *np,
                                           const char *name, u32 *lenp)
{
    u32 len = 0;
    const struct dt_property *pp = NULL;

    if ( !np )
        return NULL

    for ( pp = np->properties; pp; pp = pp->next )
    {
        if ( dt_prop_cmp(pp->name, name) == 0 )
        {
            len = pp->length;
            break;
        }
    }

    if ( lenp )
        *lenp = len;
    return pp;
}


