Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B393ACE7A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144767.266415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGFf-0006cL-En; Fri, 18 Jun 2021 15:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144767.266415; Fri, 18 Jun 2021 15:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGFf-0006aN-Bp; Fri, 18 Jun 2021 15:17:47 +0000
Received: by outflank-mailman (input) for mailman id 144767;
 Fri, 18 Jun 2021 15:17:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyHv=LM=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1luGFd-0006aD-Mg
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:17:45 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cdaf524-8ba8-4e60-88b1-16617967167a;
 Fri, 18 Jun 2021 15:17:44 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id j62so11749174qke.10
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 08:17:44 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id e1sm5762301qti.27.2021.06.18.08.17.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:17:43 -0700 (PDT)
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
X-Inumbo-ID: 0cdaf524-8ba8-4e60-88b1-16617967167a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qnpssdJeRjmHS8jce8srgqVLuCj7/2TXSjJgX6kjLaA=;
        b=sZ8jFxuDG+9uNKZtROTvtCj2pKYJz5HkBkv3bPigz+we7xiSoHJM7OzJ60rlZ/rzUq
         NiN1+1DyPt74HkuxW+jZR/3rsg1RatryLGAPn2+3YYEt4EZJgX7JZj9ZLQJiNISIO/5m
         4PckllSYK4InYnsJYYWXW0Fv9sC5YyZEI5Ve4fezAn0NTQy7yr3ocU8YPd9BQMtZKSe6
         tN3EXpmj5VWXPV42Q1yG85Q/txQU2GVI0AF021nSnqtrhsSQsCdaxgTrpJ0XzM2qQrIZ
         lzTdhfrXNgindDMlhxagoNywrOY8d78lc4DoqkdoEpze3VYYrOyZd4tYD5SJwyfbxU8x
         WQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qnpssdJeRjmHS8jce8srgqVLuCj7/2TXSjJgX6kjLaA=;
        b=qk6ertpt/4WPqPCyozH0bFaIbx1ED1z5DOrogtfUxdDUjvH5tvtOXN3CGPpboDyNto
         BIjBc8cA1rOsdmru4pAXx07+p8nMpWvSiefT7B4qoGxI1VvfKFGNpeBsRgeCKPH5pUiQ
         9xmMy99WmHrB+KQy+YUjKqq4WNx21E7NQxuahvOyJ/ZlekJZy2V6kiqDj+hrDYPuIVqH
         QkgHFiTZSsRSoQ2aBdYrEPLYO8Zr3RsgvwhrtN7xhkBTowB95WvHBCNJon7RJF+omr5L
         OucYoXywoqLApFwW35upqJOYW6j7EYK1kb6qwxPvXHg5gtmxAX5SMkRogJB9UTH83wes
         7bTA==
X-Gm-Message-State: AOAM530PNNL+IJS5nuGM0f3BIk6qK4HeLs4R5QWbcQK1FRroYADOuec5
	3l2WtJNz4sv0+ijvmRPnKX5oy7LuUM1cfA==
X-Google-Smtp-Source: ABdhPJxRdoMsrfpm/+eRL2QmDxXEGx4GeGKpOA27PV+zwDbWfYHO/lo2+p8iGyhCquF3plv9pnjtgw==
X-Received: by 2002:a05:620a:10aa:: with SMTP id h10mr9781113qkk.377.1624029464365;
        Fri, 18 Jun 2021 08:17:44 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:17:40 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Message-ID: <YMy5FKP7OHHVWXXq@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
 <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>

On Fri, Jun 18, 2021 at 01:17:07PM +0000, George Dunlap wrote:
> 
> 
> > On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > Add some logging methods to Context to provide easy use of the
> > Contenxt's xentoollog_logger. These are not exported, but the LogLevel
> > type is so that a later commit can allow the Context's log level to be
> > configurable.
> > 
> > Becuase cgo does not support calling C functions with variable
> > arguments, e.g. xtl_log, add an xtl_log_wrap function to the cgo preamble
> > that accepts an already formatted string, and handle the formatting in
> > Go.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> Looks good.  One comment:
> 
> > ---
> > tools/golang/xenlight/xenlight.go | 45 +++++++++++++++++++++++++++++++
> > 1 file changed, 45 insertions(+)
> > 
> > diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
> > index fc3eb0bf3f..f68d7b6e97 100644
> > --- a/tools/golang/xenlight/xenlight.go
> > +++ b/tools/golang/xenlight/xenlight.go
> > @@ -32,6 +32,15 @@ static const libxl_childproc_hooks childproc_hooks = { .chldowner = libxl_sigchl
> > void xenlight_set_chldproc(libxl_ctx *ctx) {
> > 	libxl_childproc_setmode(ctx, &childproc_hooks, NULL);
> > }
> > +
> > +void xtl_log_wrap(struct xentoollog_logger *logger,
> > +		  xentoollog_level level,
> > +		  int errnoval,
> > +		  const char *context,
> > +		  const char *msg)
> > +{
> > +    xtl_log(logger, level, errnoval, context, "%s", msg);
> > +}
> > */
> > import "C"
> > 
> > @@ -192,6 +201,42 @@ func (ctx *Context) Close() error {
> > 	return nil
> > }
> > 
> > +// LogLevel represents an xentoollog_level, and can be used to configre the log
> > +// level of a Context's logger.
> > +type LogLevel int
> > +
> > +const (
> > +	//LogLevelNone     LogLevel = C.XTL_NONE
> 
> Why are we not defining this one?  Don’t we want to be able to disable logging entirely?

Hm, I'm not sure. I'll poke around to see if I had a reason for this,
otherwise I will un-comment this line.

> 
> > +	LogLevelDebug    LogLevel = C.XTL_DEBUG
> > +	LogLevelVerbose  LogLevel = C.XTL_VERBOSE
> > +	LogLevelDetail   LogLevel = C.XTL_DETAIL
> > +	LogLevelProgress LogLevel = C.XTL_PROGRESS
> > +	LogLevelInfo     LogLevel = C.XTL_INFO
> > +	LogLevelNotice   LogLevel = C.XTL_NOTICE
> > +	LogLevelWarn     LogLevel = C.XTL_WARN
> > +	LogLevelError    LogLevel = C.XTL_ERROR
> > +	LogLevelCritical LogLevel = C.XTL_CRITICAL
> > +	//LogLevelNumLevels LogLevel = C.XTL_NUM_LEVELS
> > +)
> > +
> > +func (ctx *Context) log(lvl LogLevel, errnoval int, format string, a ...interface{}) {
> > +	msg := C.CString(fmt.Sprintf(format, a...))
> > +	defer C.free(unsafe.Pointer(msg))
> > +	context := C.CString("xenlight")
> > +	defer C.free(unsafe.Pointer(context))
> 
> Hmm, allocating and freeing a fixed string every time seems pretty wasteful.  Would it make more sense to either use a static C string in the CGo code at the top instead?  Or if not, to make context a global variable we allocate once at the package level and re-use?

You're right, we should probably define a static C string in the
preamble.
> 
> Also, is ‘xenlight’ informative enough?  I haven’t looked at the other “context” strings; would “go-xenlight” or something be better?
> 

I believe libxl uses "libxl." I would be fine with "go-xenlight" if you
prefer that. 

> > +
> > +	C.xtl_log_wrap((*C.xentoollog_logger)(unsafe.Pointer(ctx.logger)),
> > +		C.xentoollog_level(lvl), C.int(errnoval), context, msg)
> > +}
> 
> I think we want to make it possible long-term to configure your own logger or have no logger at all; so maybe we should add a `if (ctx.logger == nil) return;` at then top?
> 
Yeah, that's a good idea.

> Other than that looks good, thanks!
> 
>  -George

Thanks,
NR

