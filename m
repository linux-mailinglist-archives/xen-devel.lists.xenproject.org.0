Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030958AE7CC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710618.1109932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzG20-0004vP-PF; Tue, 23 Apr 2024 13:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710618.1109932; Tue, 23 Apr 2024 13:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzG20-0004t0-MD; Tue, 23 Apr 2024 13:17:56 +0000
Received: by outflank-mailman (input) for mailman id 710618;
 Tue, 23 Apr 2024 13:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzG1y-0004su-Oh
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:17:54 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e39531cc-0173-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:17:52 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-69b10ead8f5so26264596d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:17:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 y8-20020a0cf148000000b0069f50e7ff97sm5074774qvl.66.2024.04.23.06.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:17:51 -0700 (PDT)
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
X-Inumbo-ID: e39531cc-0173-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713878272; x=1714483072; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDX83FgAr60/9de5LLGiMoa8w3wfLD3jNncQ+AANivM=;
        b=PDxydT+oGZQE71g/6siED4rY0SxP6L+IO4NLoJsSifvTDdfpsUQLLwvRK+qKISv/vF
         pZCEAjUU+wctMlWnjDOmysTJ2nlYuXZ0TXMGXg/ZBg3sEEDE8ShsYBPSDOpZZNXaEu0h
         0g3ZJ5QA3AdQUJBjWfRcBW/35KZQ89xAMau5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878272; x=1714483072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDX83FgAr60/9de5LLGiMoa8w3wfLD3jNncQ+AANivM=;
        b=R2XA901hPi4VvYocara0sx/pdVZsnT2O5ppxsC26SHCsI8nuTLhPw9YJUk1ov0nBAb
         d51yPpPRijnO3u7OGzVpuCOYGzLgbGmK5o2I/6z93wFa1f4+ueM2OiXxam2uBCPHo8v2
         x0yR+nKc7MmKB7qLgoxLa999LO6GkwQHCTSZQebii6WCosW+gBr3mJP5bNv9L1SHMs6c
         6WVRp2hS5TbnmItQZ3h8vpBvot7MJvPPghkovuO34Qco9+aMdPphZ1jrtAhjWUiyYwhX
         sbQ5O9T3a4dMmqWyvInxLX4N2PBPSU3CJeVgr37bj9o8iXx3+xgSiK3ZcWRhBj4Ar5si
         7hKA==
X-Forwarded-Encrypted: i=1; AJvYcCXZukYwtWLkO6qOCyRh9aVhDp+60W5x2ciiaFpFdVuO9EnmmMIm1IzGuA+FPvh/gN1L+eFeFWi8J+5DMWodx5Cm4b77H3ryyjeZLRUa8gM=
X-Gm-Message-State: AOJu0YwHbkq48AvrtryiytEYq6ZL8qTL31z6fFnq23bQJZzMF7kdOPXw
	V01KxMZf2VwQ4ekZxMpJmHv+s0+yTsTu6xJUoCRkE3kanuKF0RNN0gw9ISXoIbg=
X-Google-Smtp-Source: AGHT+IE53Rniz5NZZsq9oUJZTIWXuipZ71axpyh83PTOhHQ1yvlZTvGJ9R5Z4FxkkxCJKjyIE9PAaw==
X-Received: by 2002:a05:6214:a83:b0:6a0:5221:fe04 with SMTP id ev3-20020a0562140a8300b006a05221fe04mr12192669qvb.2.1713878271693;
        Tue, 23 Apr 2024 06:17:51 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:17:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen: introduce header file with section related
 symbols
Message-ID: <Zie0_SLfkPGgiPHR@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-2-roger.pau@citrix.com>
 <94da8512-2a02-4109-90f5-627715e48f1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <94da8512-2a02-4109-90f5-627715e48f1e@suse.com>

On Tue, Apr 23, 2024 at 02:25:16PM +0200, Jan Beulich wrote:
> On 19.04.2024 12:02, Roger Pau Monne wrote:
> Then I wonder why it was this rather than ...
> 
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -5,6 +5,7 @@
> >  #include <xen/param.h>
> >  #include <xen/sched.h>
> >  #include <xen/domain.h>
> > +#include <xen/sections.h>
> >  #include <xen/serial.h>
> >  #include <xen/softirq.h>
> >  #include <xen/acpi.h>
> > @@ -309,8 +310,6 @@ void __init discard_initial_images(void)
> >      initial_images = NULL;
> >  }
> >  
> > -extern unsigned char __init_begin[], __init_end[];
> 
> ... this ...
> 
> > --- /dev/null
> > +++ b/xen/include/xen/sections.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __XEN_SECTIONS_H__
> > +#define __XEN_SECTIONS_H__
> > +
> > +/* SAF-0-safe */
> > +extern char __init_begin[], __init_end[];
> 
> ... that was moved. "unsigned char" is generally preferred over
> declaring binary stuff "strings".

OK, noted.

> I further wonder why the opportunity
> wasn't taken to make both array-of-const.

Hm, yes.  The sections are mapped RWX IIRC, but there's no reason to
not make the markers const.

> And finally I'm slightly
> puzzled by the SAF comment appearing with no mention at all in the
> description; of course I don't mind its addition.

I could have noted it in the commit message indeed, sorry.

Thanks, Roger.

