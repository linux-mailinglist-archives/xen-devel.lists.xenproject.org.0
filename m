Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871089A3EFA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821884.1235848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mZR-0007Gm-7E; Fri, 18 Oct 2024 12:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821884.1235848; Fri, 18 Oct 2024 12:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mZR-0007Ef-4R; Fri, 18 Oct 2024 12:59:09 +0000
Received: by outflank-mailman (input) for mailman id 821884;
 Fri, 18 Oct 2024 12:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i1V=RO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t1mZP-0007EV-Ah
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:59:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b5bff8-8d50-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 14:59:06 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so18569035e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:59:06 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf0496basm1871904f8f.29.2024.10.18.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:59:05 -0700 (PDT)
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
X-Inumbo-ID: c1b5bff8-8d50-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729256345; x=1729861145; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbjOAs3DZQuMj6X6tRNO0hIiB1rCriMgG8xryc54IDY=;
        b=OkFbH0WgHq+K0UMVysZfHSgsDXoB2v9nR5A4Uo6/sxN+7tgLPUAwaozZ4wzhOzY+so
         f/SKii52dsfiFhdXMSV9SVONOFj/SEdS7S5WTs+XiGJW/f0LFa/e97RP6SLaPLm7m115
         ioVRRbx8n1pGKa9kaosRcOGHpQcxt4lxosBp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729256345; x=1729861145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbjOAs3DZQuMj6X6tRNO0hIiB1rCriMgG8xryc54IDY=;
        b=cGsyeU5DlMg6FTBOAtks4m9e/49+Gt0XGkEYMJiSAIYVQMyS4SAG9gk5ScjvXLEoh2
         3WArkxtXiBB6v+FCX40tS40tm5DnGyQh36NGwYWAAz5mbWvcfNDap5A7oK9AHrL3wjHo
         JCJzVFOK4jT7uDxvFaONQ1xptVUDJfZU87SPY6rggE2stDQCNOZNRLtaR9fCfNN5YzgQ
         6wx8aVCEnsvQS5F4FELpkhCxWWJLdDyk4TIwUHxSeje7a5RZYzKD9xAEaKSDFcwqIWln
         ki1N7hv03lfzWxdMe4REZ2kJfMuB874KaUioeRi0B6vaSEmom6LZfMm6SGjZlMa/GOQk
         LhKA==
X-Gm-Message-State: AOJu0YzhqTaPkVLF7Z7BWe5fhRKilz+lKrNa2h0N95j/rUUg52GtFmNe
	F/R+Xt+OKYFYcBm/vRkMpwyvZaljz9iNqsnPQT12bFYli7kPa3rzZi3yJZZg/5wH03N+JBafkO1
	x
X-Google-Smtp-Source: AGHT+IFQCX0x+iZTauveFvrTbmZglc8IXUMideuu+/wmPF0NZS2m0I+aDSL+uiZSz4WCvEQTuulyPA==
X-Received: by 2002:a5d:4d89:0:b0:371:9360:c4a8 with SMTP id ffacd0b85a97d-37ea21402a2mr1992172f8f.6.1729256345336;
        Fri, 18 Oct 2024 05:59:05 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:59:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxJbmIU4OUmeO3xq@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <ZxJJZvOCQLzU_Q5s@macbook.local>
 <CACHz=Zif6tirzF3QSLYLOvDFuaE3o9=Cu+ybm4ns7vNkAKCROg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=Zif6tirzF3QSLYLOvDFuaE3o9=Cu+ybm4ns7vNkAKCROg@mail.gmail.com>

On Fri, Oct 18, 2024 at 01:48:27PM +0100, Frediano Ziglio wrote:
> On Fri, Oct 18, 2024 at 12:41 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> > > +#define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> > > +
> > > +ENTRY(dummy_start)
> > >
> > >  SECTIONS
> > >  {
> > >    /* Merge code and data into one section. */
> > > -  .text : {
> > > +  .text TEXT_START : {
> > > +        /* Silence linker warning, we are not going to use it */
> > > +        dummy_start = .;
> > > +
> > > +        /* Declare below any symbol name needed.
> > > +         * Each symbol should be on its own line.
> > > +         * It looks like a tedious work but we make sure the things we use.
> > > +         * Potentially they should be all variables. */
> >
> > The style is wrong for the opening and closing comment delimiters.
> >
> > I think it would be best if this was written in a more natural style.
> >
> > /*
> >  * Any symbols used should be declared below, this ensures which
> >  * symbols are visible to the 32bit C boot code.
> >  */
> >
> 
> But why to remove the "Potentially they should be all variables.".
> Surely something not written is more clear than something written, but
> on the other way it carries no information.

I'm not sure I understand why this is helpful: either they are
mandated to be only variables, and hence the "potentially" is wrong, or
they are not, in which case I don't see why spelling a desire for they
to be only variables is helpful if it's not a strict requirement.

Thanks, Roger.

