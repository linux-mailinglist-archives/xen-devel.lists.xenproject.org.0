Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE43ACE4F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144755.266394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG6u-0004ZB-CP; Fri, 18 Jun 2021 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144755.266394; Fri, 18 Jun 2021 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG6u-0004Wl-9I; Fri, 18 Jun 2021 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 144755;
 Fri, 18 Jun 2021 15:08:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyHv=LM=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1luG6t-0004Wf-CR
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:08:43 +0000
Received: from mail-qv1-xf2c.google.com (unknown [2607:f8b0:4864:20::f2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6eb31af-5162-4e15-9195-17c501e876a0;
 Fri, 18 Jun 2021 15:08:42 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id f5so3696481qvu.8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 08:08:42 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id q199sm4159540qka.112.2021.06.18.08.08.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:08:40 -0700 (PDT)
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
X-Inumbo-ID: d6eb31af-5162-4e15-9195-17c501e876a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q53gjyKhiXb/mscfh6FFlpfjv7cXuB9K+6OcUvjvCis=;
        b=NGx0d1rI3V6GEEabhodllrlWYofKmYve6mvtaGpNdqWCxLCPdjfv9I+UxP5TAc3pzv
         JFHJFg8Y5bNqq69wLU1XmbflRx+pBddgdSrMqSF3jG1ucCRhU9ljH2KqBOYQ0WUs5QtT
         z3iRbcT5x8zgdl8hL54UGZlSzU1QtvB5Re0GxzdhzRlXqohOr7szGuIyMrKT215kkL7c
         0QgpVKiTreZx6D2tfzy33QhTBa+JI35z6IBG1ua8mRBn5XLoO+RQkNPciqoMY4WLUiPY
         ukSgpitcHVcIcKxjNHkY4gJJXZyGdlkuQE2ixPyIQJWj9Qh18P+CXsNbEtJeOkUkUmCi
         sWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q53gjyKhiXb/mscfh6FFlpfjv7cXuB9K+6OcUvjvCis=;
        b=GsVAshGQEKM4YiHjnRg2fcNa5muCuSXU9Zpk2HHtSxubPu/3jaqrBY52ZuO6KRnRJA
         I6K6dzLQ0hJWHnVh9B9thnUYRoR9KgfHDN8C3i7kxdWSkCx2jEr3E1VlDHkjDKv7/7SZ
         dEtTtjKw0JjD90ws3a+ezuy/Jau1DZ1HCjJH34603o7iWEANljEwgG/2pZAkUaxjIexj
         AqCbo10jkHfTpk5rpIY1xY+eBCuum//pE/IpNF3KYmas3qF0b6XepHHOCCj4yK51Q804
         1E/lPpuPZzQgpFe6Gzxc69t7zjZBUOYQic8JrYvTSy4SDPwh2qXwSFMuxvY81q/PEJkE
         s5BQ==
X-Gm-Message-State: AOAM531Ehf8tzyDsHeeIppUb2KZYn1WJahN7OrqZxNQtNyMr2tHYJxOM
	aIII+BAlsKDjzLKiChjehk8=
X-Google-Smtp-Source: ABdhPJybQoN+zlAvZDzb6FB4+HcM2QDPMj6NnAGbyUMWT2HzWgU59O+ls6mmww2mkMbWEAhV1q8D1w==
X-Received: by 2002:ad4:54f2:: with SMTP id k18mr6251358qvx.32.1624028920868;
        Fri, 18 Jun 2021 08:08:40 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:08:37 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Message-ID: <YMy29arbPMnPI/+W@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
 <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>

On Fri, Jun 18, 2021 at 02:44:15PM +0000, George Dunlap wrote:
> 
> 
> > On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > Add a ContextOption type to support functional options in NewContext.
> > Then, add a variadic ContextOption parameter to NewContext, which allows
> > callers to specify 0 or more configuration options.
> > 
> > For now, just add the WithLogLevel option so that callers can set the
> > log level of the Context's xentoollog_logger. Future configuration
> > options can be created by adding an appropriate field to the
> > contextOptions struct and creating a With<OptionName> function to return
> > a ContextOption
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> > tools/golang/xenlight/xenlight.go | 44 +++++++++++++++++++++++++++++--
> > 1 file changed, 42 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
> > index f68d7b6e97..65f93abe32 100644
> > --- a/tools/golang/xenlight/xenlight.go
> > +++ b/tools/golang/xenlight/xenlight.go
> > @@ -136,7 +136,7 @@ func sigchldHandler(ctx *Context) {
> > }
> > 
> > // NewContext returns a new Context.
> > -func NewContext() (ctx *Context, err error) {
> > +func NewContext(opts ...ContextOption) (ctx *Context, err error) {
> > 	ctx = &Context{}
> > 
> > 	defer func() {
> > @@ -146,8 +146,19 @@ func NewContext() (ctx *Context, err error) {
> > 		}
> > 	}()
> > 
> > +	// Set the default context options. These fields may
> > +	// be modified by the provided opts.
> > +	copts := &contextOptions{
> > +		logLevel: LogLevelError,
> > +	}
> > +
> > +	for _, opt := range opts {
> > +		opt.apply(copts)
> > +	}
> > +
> > 	// Create a logger
> > -	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr, C.XTL_ERROR, 0)
> > +	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr,
> > +		C.xentoollog_level(copts.logLevel), 0)
> > 
> > 	// Allocate a context
> > 	ret := C.libxl_ctx_alloc(&ctx.ctx, C.LIBXL_VERSION, 0,
> > @@ -201,6 +212,35 @@ func (ctx *Context) Close() error {
> > 	return nil
> > }
> > 
> > +type contextOptions struct {
> > +	logLevel LogLevel
> > +}
> > +
> > +// ContextOption is used to configure options for a Context.
> > +type ContextOption interface {
> > +	apply(*contextOptions)
> > +}
> > +
> > +type funcContextOption struct {
> > +	f func(*contextOptions)
> > +}
> > +
> > +func (fco *funcContextOption) apply(c *contextOptions) {
> > +	fco.f(c)
> > +}
> 
> Why all this convolution with interfaces and such, rather than just defining ContextOption as a function pointer?  Is it just to keep contextOptions out of the documentation page?

Part of the motivation for using functional options is to abstract the
"options" struct, yes. This allows internal defaults to be applied more
easily -- if you require e.g. a ContextOptions struct to be passed by
the caller, how do you know if they intended to override a default, or
if they just didn't set the field? Additionally, using the ContextOption
as an interface allows variadic arguments, which are just convenient for
API users -- the same NewContext function can be used whether you need
to pass 3 options or 0.

The reason we use ContextOption as an interface, rather than function
pointer of sorts is for flexibility in the signatures of ContextOption
implementations. E.g., we could have

func WithLogLevel(lvl LogLevel) ContextOption
func WithLogContext(s string) ContextOption
func WithFooAndBar(s string, n int) ContextOption

See [1] for more background on this pattern.

Thanks,
NR

[1] https://dave.cheney.net/2014/10/17/functional-options-for-friendly-apis

