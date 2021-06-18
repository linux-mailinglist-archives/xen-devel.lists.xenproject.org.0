Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E93AD0D8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 19:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144919.266683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHrE-0005wj-NQ; Fri, 18 Jun 2021 17:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144919.266683; Fri, 18 Jun 2021 17:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHrE-0005tv-KJ; Fri, 18 Jun 2021 17:00:40 +0000
Received: by outflank-mailman (input) for mailman id 144919;
 Fri, 18 Jun 2021 17:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyHv=LM=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1luHrC-0005tn-O9
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 17:00:38 +0000
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a5e9295-6315-467d-b0a7-5eeab2601abf;
 Fri, 18 Jun 2021 17:00:37 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id d9so8009112qtp.11
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 10:00:37 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id g15sm5505947qtx.75.2021.06.18.10.00.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 10:00:37 -0700 (PDT)
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
X-Inumbo-ID: 0a5e9295-6315-467d-b0a7-5eeab2601abf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=z5zsokqXgiD6bC7McyK/M0FOdguu6oT7x1Jlxm2c+lU=;
        b=ntlpwJIMtoPglnvfMmUfquAP9465QRaDEybwjBPldd3FLNFFuRBmCz1RQETys4ASwu
         TfnWA/tqcDquTihzqUc0wjEP9nehanGO3g6xg1f6EEXCFvSRvU4BqetCD7lBOjxmRBXm
         mU+WffQz9qWQn8NB/kbiuOqpM/ZrMZIxMe/Yql8z6paEG/rhE9zS6Pfp0GLNID83hGf5
         NZvNfnTiH9XAwTqoNa44qvEfLtq7d/+Zf7eK1pEUTBmPA7/6UO3bPG5Dujivwy5k8npv
         LyQjfc9Rn/yilQUDi69/UugtrdkIBs+GobBbejowQ0pqGFWmDuMGMTatHt6n9QHyOvjN
         HTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=z5zsokqXgiD6bC7McyK/M0FOdguu6oT7x1Jlxm2c+lU=;
        b=IMEEGffOBoCWEnTk60GU490elafvJcYP1BAoa1MOP+ukPU0fLAVanKETyw0dacPYts
         ghbt25JXwiPpLXHq2hdbLEzB1xV85dvbrhxygJF7DuCIgLlzT+IisuHWd15KY/zo1qNJ
         qodbh7jMqWSDknhWYA3yx9ELES9iuvSUYTrCoATFi51sy0fv/qjVmhdIEZSrkc2xnNZA
         +YWCxCikNkwZLEGMEpXdaUVnW2/gyE1iYphQwlI5j4oAVItmd2scwaMxvhFkGY7aCUV1
         VrEIumr75uXHeFuB34UnEmUfwnM1/BSLE8kzHl5Z1btiYT8e1BnlDYZFiNFUM7Y3D22Y
         DSyQ==
X-Gm-Message-State: AOAM5303G6lwMpH71Rp1S6AFia2G0jf58GNUfzIsvZZM78UHdmJsO9a8
	YmOHCk8KdXlLvoWzrl1CYaw=
X-Google-Smtp-Source: ABdhPJzzGzyBvxCbPBAbZwitT73glTef0IpyjPU2hmxF1lekYVNaWi6FVxBrlX9uaK4pwiD8TJjwfA==
X-Received: by 2002:ac8:7516:: with SMTP id u22mr11404297qtq.160.1624035637474;
        Fri, 18 Jun 2021 10:00:37 -0700 (PDT)
Date: Fri, 18 Jun 2021 13:00:34 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Message-ID: <YMzRMlaHapLn7msf@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
 <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>
 <YMy29arbPMnPI/+W@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <8727719E-9548-40CF-A186-14E2ECA3801D@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8727719E-9548-40CF-A186-14E2ECA3801D@citrix.com>

On Fri, Jun 18, 2021 at 04:18:44PM +0000, George Dunlap wrote:
> 
> 
> > On Jun 18, 2021, at 4:08 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > On Fri, Jun 18, 2021 at 02:44:15PM +0000, George Dunlap wrote:
> >> 
> >> 
> >>> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >>> 
> >>> Add a ContextOption type to support functional options in NewContext.
> >>> Then, add a variadic ContextOption parameter to NewContext, which allows
> >>> callers to specify 0 or more configuration options.
> >>> 
> >>> For now, just add the WithLogLevel option so that callers can set the
> >>> log level of the Context's xentoollog_logger. Future configuration
> >>> options can be created by adding an appropriate field to the
> >>> contextOptions struct and creating a With<OptionName> function to return
> >>> a ContextOption
> >>> 
> >>> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >>> ---
> >>> tools/golang/xenlight/xenlight.go | 44 +++++++++++++++++++++++++++++--
> >>> 1 file changed, 42 insertions(+), 2 deletions(-)
> >>> 
> >>> diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
> >>> index f68d7b6e97..65f93abe32 100644
> >>> --- a/tools/golang/xenlight/xenlight.go
> >>> +++ b/tools/golang/xenlight/xenlight.go
> >>> @@ -136,7 +136,7 @@ func sigchldHandler(ctx *Context) {
> >>> }
> >>> 
> >>> // NewContext returns a new Context.
> >>> -func NewContext() (ctx *Context, err error) {
> >>> +func NewContext(opts ...ContextOption) (ctx *Context, err error) {
> >>> 	ctx = &Context{}
> >>> 
> >>> 	defer func() {
> >>> @@ -146,8 +146,19 @@ func NewContext() (ctx *Context, err error) {
> >>> 		}
> >>> 	}()
> >>> 
> >>> +	// Set the default context options. These fields may
> >>> +	// be modified by the provided opts.
> >>> +	copts := &contextOptions{
> >>> +		logLevel: LogLevelError,
> >>> +	}
> >>> +
> >>> +	for _, opt := range opts {
> >>> +		opt.apply(copts)
> >>> +	}
> >>> +
> >>> 	// Create a logger
> >>> -	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr, C.XTL_ERROR, 0)
> >>> +	ctx.logger = C.xtl_createlogger_stdiostream(C.stderr,
> >>> +		C.xentoollog_level(copts.logLevel), 0)
> >>> 
> >>> 	// Allocate a context
> >>> 	ret := C.libxl_ctx_alloc(&ctx.ctx, C.LIBXL_VERSION, 0,
> >>> @@ -201,6 +212,35 @@ func (ctx *Context) Close() error {
> >>> 	return nil
> >>> }
> >>> 
> >>> +type contextOptions struct {
> >>> +	logLevel LogLevel
> >>> +}
> >>> +
> >>> +// ContextOption is used to configure options for a Context.
> >>> +type ContextOption interface {
> >>> +	apply(*contextOptions)
> >>> +}
> >>> +
> >>> +type funcContextOption struct {
> >>> +	f func(*contextOptions)
> >>> +}
> >>> +
> >>> +func (fco *funcContextOption) apply(c *contextOptions) {
> >>> +	fco.f(c)
> >>> +}
> >> 
> >> Why all this convolution with interfaces and such, rather than just defining ContextOption as a function pointer?  Is it just to keep contextOptions out of the documentation page?
> > 
> > Part of the motivation for using functional options is to abstract the
> > "options" struct, yes. This allows internal defaults to be applied more
> > easily -- if you require e.g. a ContextOptions struct to be passed by
> > the caller, how do you know if they intended to override a default, or
> > if they just didn't set the field? Additionally, using the ContextOption
> > as an interface allows variadic arguments, which are just convenient for
> > API users -- the same NewContext function can be used whether you need
> > to pass 3 options or 0.
> > 
> > The reason we use ContextOption as an interface, rather than function
> > pointer of sorts is for flexibility in the signatures of ContextOption
> > implementations. E.g., we could have
> > 
> > func WithLogLevel(lvl LogLevel) ContextOption
> > func WithLogContext(s string) ContextOption
> > func WithFooAndBar(s string, n int) ContextOption
> > 
> > See [1] for more background on this pattern.
> > 
> > Thanks,
> > NR
> > 
> > [1] https://dave.cheney.net/2014/10/17/functional-options-for-friendly-apis
> 
> Yes, I frequently use a pattern like the one described in that blog post myself.  But that blog post doesn’t use interfaces — the final slide actually has the “option function” type as an open-coded function pointer type.
> 
> So my question was, why not do something like this:
> 
> type ContextOption func(*contextOptions) error
> 
> func WithLogLevel(level LogLevel) ContextOption {
>   return func(co *contextOptions) {
>     co.logLevel = level
>   }
> }
> 
> ATM the only advantage I can see of defining ContextOption as an interface rather than as a function pointer is that the godoc for ContextOption would look like:
> 
> type ContextOption interface {
>    // contains filtered or unexported fields
> }
> 
> Rather than
> 
> type ContextOption func(*contextOptions) error
> 
> Which shows you the name of the unexported field.
> 
> Is there another reason I missed?

Technically it does allow more flexibility in implementing
ContextOption, e.g. you could do...

func (lvl LogLevel) apply(co *contextOptions) { co.logLevel = lvl }

...and then pass a LogLevel directly as a ContextOption. But generally
everyone implements these things as funcs.

I will admit that when it comes to my choice of using the interface
version instead of function pointers, I am just more familiar with the
former and encounter it more often in other Go packages I use.

Thanks,
NR

