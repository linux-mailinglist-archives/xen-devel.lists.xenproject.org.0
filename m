Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06F2EAA9F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61859.109040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlQW-0002oL-Ff; Tue, 05 Jan 2021 12:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61859.109040; Tue, 05 Jan 2021 12:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlQW-0002nx-CH; Tue, 05 Jan 2021 12:27:04 +0000
Received: by outflank-mailman (input) for mailman id 61859;
 Tue, 05 Jan 2021 12:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwlQU-0002nY-9m
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:27:02 +0000
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd6a3e89-e46d-42be-85a0-63d647942253;
 Tue, 05 Jan 2021 12:27:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k10so2858984wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 04:27:01 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y13sm94347078wrl.63.2021.01.05.04.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:27:00 -0800 (PST)
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
X-Inumbo-ID: dd6a3e89-e46d-42be-85a0-63d647942253
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=blTqOXFXBt4Mi3IbENCLkr1RDkzh6n6vLusw6Uk0S0A=;
        b=bPzGrI7PAGpU4XxSrJ0eyQkpqX749sjzjUD4xPQpfniqs4DdNvBZXsGQt5SXr0d05C
         VDKTeWDG5xMFbYr6cb/T+eqVaeWAvxZZdzfcGIAhgxL/lAeKw1UhfNy+/+ahk+pK1AL3
         mZtJ8GNNuWgJWEQYfZqzxMBd2G7h3ptwcWYU8iVhwOhyezfuFZMdNqJP+jWo90fQAlAF
         JRHEU+3CvO+0LF0aJbL9EzOVE+s81RXTvVuJ1J6zFw+Gks/gSM4SxVJPIFSUslntBEzE
         fif/WsL7bdvcHzZdrZd9xl/I6e5WbMymf2ZZHILh3T2q+f5bLJ7eS7IygGuhRyLhJ59h
         Ap5w==
X-Gm-Message-State: AOAM531gPgXwlc4yXiFVsXL17BuVb9hl90/pXc9TVsVbqU7eR1MP9hyz
	b3/SlZOgrspBGu4JznEy7tE=
X-Google-Smtp-Source: ABdhPJxWhlpjcJt9zFYiSDUz8b726Bpn39YILVxfNrOBn2OG9VFxx6D22J+7mIm7KbqeE+IhLDFoeQ==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr3294774wmf.110.1609849620934;
        Tue, 05 Jan 2021 04:27:00 -0800 (PST)
Date: Tue, 5 Jan 2021 12:26:59 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel de Graaf <dgdegra@tycho.nsa.gov>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xsm/dummy: harden against speculative abuse
Message-ID: <20210105122659.ntabtawqll7cyxw2@liuwe-devbox-debian-v2>
References: <34833712-93d9-1b4e-1ebf-9df5ea93d19f@suse.com>
 <75e04672-f516-e068-a743-9046cef77768@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75e04672-f516-e068-a743-9046cef77768@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Dec 21, 2020 at 02:15:55PM +0100, Jan Beulich wrote:
> On 17.12.2020 12:57, Jan Beulich wrote:
> > --- a/xen/include/xsm/dummy.h
> > +++ b/xen/include/xsm/dummy.h
> > @@ -76,20 +76,20 @@ static always_inline int xsm_default_act
> >      case XSM_HOOK:
> >          return 0;
> >      case XSM_TARGET:
> > -        if ( src == target )
> > +        if ( evaluate_nospec(src == target) )
> >          {
> >              return 0;
> >      case XSM_XS_PRIV:
> > -            if ( is_xenstore_domain(src) )
> > +            if ( evaluate_nospec(is_xenstore_domain(src)) )
> >                  return 0;
> >          }
> >          /* fall through */
> >      case XSM_DM_PRIV:
> > -        if ( target && src->target == target )
> > +        if ( target && evaluate_nospec(src->target == target) )
> >              return 0;
> >          /* fall through */
> >      case XSM_PRIV:
> > -        if ( src->is_privileged )
> > +        if ( !is_control_domain(src) )
> >              return 0;
> >          return -EPERM;
> 
> And a stray ! slipped in here. Now fixed.

FWIW:

Reviewed-by: Wei Liu <wl@xen.org>

> 
> Jan

