Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A299FAC0DC4
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994066.1377110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6eC-0000OD-Is; Thu, 22 May 2025 14:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994066.1377110; Thu, 22 May 2025 14:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6eC-0000MY-Fw; Thu, 22 May 2025 14:11:48 +0000
Received: by outflank-mailman (input) for mailman id 994066;
 Thu, 22 May 2025 14:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI6eA-0000MS-P7
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:11:46 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1481bd5-3716-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:11:45 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so49746465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:11:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442ebd6fe86sm235038105e9.0.2025.05.22.07.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 07:11:44 -0700 (PDT)
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
X-Inumbo-ID: b1481bd5-3716-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747923105; x=1748527905; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIr3xsAWBxp5cUCCFMKmy9bFr8l6tisioRoXZYH2AS0=;
        b=QQ5daXO29JxuHd19fB5MRktcrO53hkCqXeluOF/rU31vgU8qG+vzniv6MKzXAfm97L
         z48yhdmlE+0fs53vzm5S4KIM2eNGNY5WdtryxqozP3p5bmJkDD455oz8I4Joue3lwP3V
         8Blgn1wja/KoNd/rCjQrqfBYKG5bwtdz/6gqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923105; x=1748527905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIr3xsAWBxp5cUCCFMKmy9bFr8l6tisioRoXZYH2AS0=;
        b=LuVkLzJHfbG3vygULq07SUDdlZvG7EDD6Ti1hqMRcZYPCl/HsG7PBzksULR5wo9Nmn
         U8g6QFb4dFiD8MRFSJEXcdj8laZq8/5crbR/QDT2U3/auwFnoLmM8SKWyDr/LqzXx42j
         4NUpYJ71ynyDcL1FZLs18yZFJkn+1SXYIGsJyWVLh+5MkJLhvppnotKp77kDGPq5kLf6
         HyRlLjZmFy8lqB9eeLQMywx/i746K3OiTz8+n2B/PVRwbSbfFV8/QwcCGoH959rjdLhi
         MM6RB/OH+DIIJKN3LvsOVSYy+3QX5G5UAfB3PPm8TAENZMluWyt2n2JJfs/2Lzop+eeQ
         i2yw==
X-Forwarded-Encrypted: i=1; AJvYcCXHCwsFMGOvF8kzfBV1BgJmNVUx+KTmEJXCgrgIryrFWeyJWgpmMPoFasI3vNrbFKXP9gE0rXlsDpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztTHYwmoS46B5+burZmD4NTn/CXIiRfAqZNu69MWXjAvt0m7z1
	4rYozAAs5zbNwAFSE+E5SFRsrZLS+dfmNHGS1/HWLxM0dYPfIJF2qrjiw0XOaiELhnE=
X-Gm-Gg: ASbGncv5T3IiRuybrOmGLFu+rV5IcV03HY0YkDwzaE84gyKvgT13HzIXJ0ACnHfya17
	vpDnoAoWY2rJZyYeiD4bqAjBSaLrV4od8gVHW4gmp4LmXGyj2anzR3rby7Ujbj+HWbZvOVANLBE
	tVUGZSBZ1xmvqiod2pPy1XsqfKwkNVvC030VctfcF4rI5lGsBTt0Vpl9w4+1g4t6D0jJE5YOmwC
	0sYZhyZ3cFBVD+CFXOv5X60NYCRVoDVWFeDnsL3g70790pi33+k2Y5PBD+fP/KMJV3nVf+LKMx9
	xH4x/vpe5j8DNVcVwGn9BQjznJdE9bcXYXxlLFI3dpQ+7l6j705DaPGwSgcPPyCo8bXXTauG8OZ
	pMJSPrVBnZ2FG8F1IfpY=
X-Google-Smtp-Source: AGHT+IGvvKaJaa4HL46t7/H21xRC5EjyP4/XTw1vAmcnwKAU2CGKFCDT+Uv7bI7zxB2E7jMew5XhHg==
X-Received: by 2002:a05:600c:474a:b0:442:f44f:65b with SMTP id 5b1f17b1804b1-442fd675a33mr212277955e9.32.1747923104657;
        Thu, 22 May 2025 07:11:44 -0700 (PDT)
Date: Thu, 22 May 2025 16:11:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP
 bring up stall
Message-ID: <aC8wn_C2xf3OW94y@macbook.local>
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-3-roger.pau@citrix.com>
 <8a39ec76-f050-488e-bf4c-ba378fae7275@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a39ec76-f050-488e-bf4c-ba378fae7275@suse.com>

On Thu, May 22, 2025 at 09:18:57AM +0200, Jan Beulich wrote:
> On 21.05.2025 18:55, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -714,13 +714,15 @@ static cpumask_t show_state_mask;
> >  static bool opt_show_all;
> >  boolean_param("async-show-all", opt_show_all);
> >  
> > +static bool force_show_all;
> > +
> >  static int cf_check nmi_show_execution_state(
> >      const struct cpu_user_regs *regs, int cpu)
> >  {
> >      if ( !cpumask_test_cpu(cpu, &show_state_mask) )
> >          return 0;
> >  
> > -    if ( opt_show_all )
> > +    if ( opt_show_all || force_show_all )
> >          show_execution_state(regs);
> >      else if ( guest_mode(regs) )
> >          printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
> > @@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
> >      return 1;
> >  }
> >  
> > +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
> > +{
> > +    unsigned int msecs, pending;
> > +
> > +    force_show_all = show_all;

Sorry, I did send v2 before seeing your comments.

> Both forms of the call can, aiui, in principle race with one another.
> I think you want to avoid setting the static to false once it was set
> to true.
> 
> Furthermore, as long as all calls here with the 2nd argument being
> true are followed by panic() or alike, I see no reason why you couldn't
> simply re-use opt_show_all, setting that one to true. (Or else there
> would then also be some resetting of the new static.)

So basically do something like:

if ( show_all )
    opt_show_all = true;

And only overwrite opt_show_all when the caller requests full traces?

Thanks, Roger.

