Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D6860F09
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684754.1064835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdScd-00004r-9n; Fri, 23 Feb 2024 10:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684754.1064835; Fri, 23 Feb 2024 10:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdScd-0008Uq-61; Fri, 23 Feb 2024 10:17:39 +0000
Received: by outflank-mailman (input) for mailman id 684754;
 Fri, 23 Feb 2024 10:17:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdScb-0008Uk-40
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:17:37 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3ec05f1-d234-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:17:36 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d23d301452so9015681fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:17:36 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 z16-20020ac81010000000b0042e44960c15sm1829642qti.52.2024.02.23.02.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 02:17:35 -0800 (PST)
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
X-Inumbo-ID: c3ec05f1-d234-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708683456; x=1709288256; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJuPG1SwJFZRoP8Zs5JfSqF/t6MzFnevhz34Cumr+LA=;
        b=ZWQ3tJye286lstslwKcqQu42RecLyvkMVe+pWqHBONX3hCawKIe70xbzaPvHjkaFrh
         DwbCJvK/xBDLOMEPjMzki85TWM9qUWiYHY04odE/sNiwdHW1+rxs8GERz+ESUCAYrRLz
         SmGzcIbT+IKBZDXnO5P9EjYuz8X9FyMmf1fGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683456; x=1709288256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJuPG1SwJFZRoP8Zs5JfSqF/t6MzFnevhz34Cumr+LA=;
        b=UAtQ4/cDfrq5gMcsQ1IBt+V7caHvgkhLMJNRwPuaGdFfhi8+h4g/7JHeRz3oGemt9K
         hEWQPUA0Q25jpdMxjvliK9dZzuP3Le9bgpiC2NNhTGffb4nR87f2nmdp0IYfJPF5/m0Y
         GioxG4vop6RcAOQ7A0lQUIiTg3yi8jNH/w0KIR+KOsZAmAbyxRqfIdoA9r8OmlHDJvJB
         QtnLchiAUOX+X0bMJ3lf4qdPe6QNUIRbpFRji6+ylhUhkJMjUUZjGMrRxMI1/8WO2xx0
         hEcwx19nc7a4YCMXz2lGIruigJ2cbHPFdgujC47vAzHgE8mfMiHowfZKhI9tKFB1tnOR
         y9Ow==
X-Gm-Message-State: AOJu0YzQKov7u6Hry3aBxvaBP5ga4yHjy05F6Bts35mQB1wyVvoKe7vl
	nUAK2CnB96/eatPCFSTGNCkhVLhxQxs/MMg5Gxo5p7ReaWNUKTelnWiP3no5glQ=
X-Google-Smtp-Source: AGHT+IFazMLQE14TL77JxmyGlT5E/Gz9A4HELcRlVGSJhrsPFC/7ZuZviGvUqT9u9QqydjRuORsnFQ==
X-Received: by 2002:ac2:5df2:0:b0:512:9f9b:ec50 with SMTP id z18-20020ac25df2000000b005129f9bec50mr1071039lfq.38.1708683455723;
        Fri, 23 Feb 2024 02:17:35 -0800 (PST)
Date: Fri, 23 Feb 2024 11:17:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/spec: fix BRANCH_HARDEN option to only be set when
 build-enabled
Message-ID: <Zdhwve9-YQekWb0B@macbook>
References: <20240223094215.71889-1-roger.pau@citrix.com>
 <b5696664-0e85-414b-8360-242349a87a7e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5696664-0e85-414b-8360-242349a87a7e@citrix.com>

On Fri, Feb 23, 2024 at 09:46:27AM +0000, Andrew Cooper wrote:
> On 23/02/2024 9:42 am, Roger Pau Monne wrote:
> > The current logic to handle the BRANCH_HARDEN option will report it as enabled
> > even when build-time disabled. Fix this by only allowing the option to be set
> > when support for it is built into Xen.
> >
> > Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/spec_ctrl.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> > index 421fe3f640df..e634c6b559b4 100644
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
> >  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> >  int8_t __read_mostly opt_eager_fpu = -1;
> >  int8_t __read_mostly opt_l1d_flush = -1;
> > -static bool __initdata opt_branch_harden = true;
> > +static bool __initdata opt_branch_harden =
> > +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
> >  
> >  bool __initdata bsp_delay_spec_ctrl;
> >  uint8_t __read_mostly default_xen_spec_ctrl;
> > @@ -267,7 +268,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >              opt_eager_fpu = val;
> >          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> >              opt_l1d_flush = val;
> > -        else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> > +        else if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
> > +                  (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> >              opt_branch_harden = val;
> 
> Yeah, we should definitely fix this, but could we use no_config_param()
> here for the compiled-out case ?
> 
> See cet= for an example.  If we're going to ignore what the user asks,
> we should tell them why.

Maybe I'm missing something: I've looked into using no_config_param(),
but there's no difference really, because cmdline_parse() is called
before the console is initialized, so those messages seem to be
lost.

Should this go into some kind of buffer which is then printed by
__start_xen() once the console has been initialized? (just after
printing cmdline itself).

Thanks, Roger.

