Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D991F7E80
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 23:51:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjrZL-0004Bz-TH; Fri, 12 Jun 2020 21:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzU/=7Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jjrZJ-0004Bu-Nk
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 21:50:33 +0000
X-Inumbo-ID: bd5832d2-acf6-11ea-bca7-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd5832d2-acf6-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 21:50:32 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n141so10494127qke.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 14:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0oAsN8Da8bV+mPgK/NY9uKiEw5ULRZnYyGSVH+RkLeo=;
 b=tiipPH5xTCb/rPu09rO+U/jYxHp3ZKew0Qek1yYQZdcUV7umjn1MI3YXZrczMZuWyn
 cvltIZ/d1+ey1sVrpxmPxI9bT1/q2AOHkQ987cce3cdzG750GZ+jd3P1w3AgjCKJhVkE
 z92wEInOy4eRl0Ft+hhn0ChE4oaadb7CKYeTJYhwNxxUFBnqVRavTrGOlzZNMuxpZxlF
 NMwWjYd4rUsXdInZBoqFWPb4zBYWZgQlzP3DWAAQkAF6YKL0vgg9DZcBYv3gC9sWNr9D
 xxClxI0yEhqwjED/9U80+5L83zV1qoZwGcMDIy/6Yy+9TUANlWnvQP8RlqroVSv8G+By
 senA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0oAsN8Da8bV+mPgK/NY9uKiEw5ULRZnYyGSVH+RkLeo=;
 b=uMSHAM+wCHFNok84nEgMU48tip3m7Jqni5dysQJP2giuFmASauLC+opUQwRLjnwYuo
 SeREuEQLFxdp4ouHbvES7ua0AaYg2zlJCQ9I4mXYa5wg1msdMeZUUDV+PiKQtTJbkNAM
 bct2IzxYhQlERKmo+t01A+9/ga8otfRfOjxZ53BpzGsovC/iojoCnYWhSEYWmisSIXmF
 xFsmD+9TuNbDM8kA2H4clBQY8+uA1K6CX1bHTBojCyPr596Yj2KquflmhYUzKB7IDEML
 jG1vDMhDCs/9gv/YlYghG8bR22+G97Z7BxUTCs+CuTtFllKbJaA0TbwDzhZC+2lu3zA+
 kCUA==
X-Gm-Message-State: AOAM533KNZgtW8c45Gnb/77NU6Wpm/3sNTlS1WY+mrHLEmxAiCaUehrl
 FmrtS1I3yOK9ALCHaB4etLc=
X-Google-Smtp-Source: ABdhPJyHkD5Rd47+7KfRt3nGDn/rAq5qG9ok65w9MW4E5Mu4iiPVha2GK0kcfSk0sApq7ep4MbkXqg==
X-Received: by 2002:a05:620a:20db:: with SMTP id
 f27mr5072976qka.400.1591998632333; 
 Fri, 12 Jun 2020 14:50:32 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id 138sm5532439qkk.38.2020.06.12.14.50.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 14:50:31 -0700 (PDT)
Date: Fri, 12 Jun 2020 17:50:28 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
Message-ID: <20200612215028.GA6286@six>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
 <24291.45045.185355.587474@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24291.45045.185355.587474@mariner.uk.xensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 12, 2020 at 05:40:21PM +0100, Ian Jackson wrote:
> Nick Rosbrook writes ("[PATCH for-4.14] tools: check go compiler version if present"):
> > Currently, no minimum go compiler version is required by the configure
> > scripts. However, the go bindings actually will not build with some
> > older versions of go. Add a check for a minimum go version of 1.11.1 in
> > accordance with tools/golang/xenlight/go.mod.
> 
> > diff --git a/tools/configure.ac b/tools/configure.ac
> > index a9af0a21c6..9d126b7a14 100644
> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -338,6 +338,13 @@ AS_IF([test "x$golang" = "xy"], [
> >              AC_MSG_ERROR([Go tools enabled, but missing go compiler])
> >          ])
> >          golang="n"
> > +    ], [
> > +        AX_COMPARE_VERSION([$GOVERSION], [lt], [1.11.1], [
> > +            AS_IF([test "x$enable_golang" = "xyes"], [
> > +                AC_MSG_ERROR(["Your version of go: $GOVERSION is not supported"])
> > +            ])
> > +            golang="n"
> > +        ])
> >      ])
> >  ])
> 
> I don't understand this code.  Why are you checking $enable_golang in
> your new code whereas the old code checks $golang ?  I actually read
> the generated code trying to see where $golang is set and AFAICT it is
> only ever set to n ?

For some background, in an attempt to be consistent with existing code
here, I basically copied the logic for enabling the ocaml tools. 

The logic is setup in a way that (unless --disable-golang is set) if a
suitable version of the go compiler is found, then golang is enabled by
default. If, however, a suitable go compiler is not found (either go
is not present at all, or it is too old), then golang is disabled. This
part happens silently unless --enable-golang is _explicitly_ set by the
user, in which case an error is thrown by ./configure. This is why
$enable_golang is checked.

> 
> This is all very weird.  Surely golang should be enabled by default
> when the proper compiler is present, and disabled by default
> otherwise.  I think this effect will be quite hard to achieve with
> AX_ARG_DEFAULT_ENABLE.  Probably you should be using AC_ARG_ENABLE
> and doing the defaulting yourself so that you can use a computed
> default etc.

I believe the behavior you described here is the same as I described
above (and is acheived in this patch). But, I'm happy to re-work the
implementation if necessary so that the code is more clear.

Thanks,
-NR

