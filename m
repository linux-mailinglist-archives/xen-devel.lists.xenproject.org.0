Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF47E6720
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 10:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629541.981862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r11gR-0007sj-TP; Thu, 09 Nov 2023 09:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629541.981862; Thu, 09 Nov 2023 09:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r11gR-0007qw-PT; Thu, 09 Nov 2023 09:50:43 +0000
Received: by outflank-mailman (input) for mailman id 629541;
 Thu, 09 Nov 2023 09:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VEo=GW=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r11gQ-0007qq-6R
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 09:50:42 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ad1a9c-7ee5-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 10:50:39 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso8079101fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 01:50:39 -0800 (PST)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b004094c5d929asm1568171wmq.10.2023.11.09.01.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:50:39 -0800 (PST)
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
X-Inumbo-ID: 70ad1a9c-7ee5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699523439; x=1700128239; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+JlB2tzoow2e5dbXkXApRWSPEVZJ5aCEeltAsDQw7U=;
        b=MhwNEust3wLUUedczOhwOUGVfC7St1c457FMyo5kaE84yUFQEdUXo5YSrzlzpzeHW1
         Nwcat6nUAHvCkig+98jxRZQPsqc9MxdDqICQ8rU0ZrHf/sqI0ksio+bQsePIxexQmKXo
         n9h9M24Mv35Svc2+qQuQ/1mP8rvthX8bkva/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523439; x=1700128239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+JlB2tzoow2e5dbXkXApRWSPEVZJ5aCEeltAsDQw7U=;
        b=jrCh3VxA9f42WdZJ1x4r3wkUyWM57T19Qay2GUPY+07GvB6ZdCxI6KLHkoxuhLubpD
         xzwSqDuWrU7nGvzveH7NsBzjls3qfwJM1it+XCkLE0A03AiHn6AZpqYlCEg7nkPiJcTr
         xpsi3p+Z8VIOmp+tkB9mlXyx+5WwFD45lqbw0riWHr8gqejhqjGHlsfDdEHUdvUzq++f
         F5pTuf9KwTx+Y8DKwipcT70bM5O8OzObKpQOaLaRyfPnf+H/b8VOqbcBLZY/8+k4szIt
         5LsqrQPOp0Ufz4VFRPW1oLaYdNr7lTjbPyp5lVX7Duh/11P6/ZHWQ9Q7YQMsL/dj8DWy
         V8SA==
X-Gm-Message-State: AOJu0YytpuT3uApKYvX0BBBnPMU9HRmGwRM3NDNUP4XMetytx9Jm7GNW
	ag+04sUWFoyIJOXArIwchg3QKw==
X-Google-Smtp-Source: AGHT+IHfssPFcia6ZxQtRmG3IGhTmL14ungIjeN6MXI9+84ozmKNsg0J/zM6LeP7ClnthI0DuwOobg==
X-Received: by 2002:a2e:9916:0:b0:2c5:999:de64 with SMTP id v22-20020a2e9916000000b002c50999de64mr3380530lji.16.1699523439383;
        Thu, 09 Nov 2023 01:50:39 -0800 (PST)
Message-ID: <654cab6f.050a0220.86158.519b@mx.google.com>
X-Google-Original-Message-ID: <ZUyrbMrWc8uyIWwY@EMEAENGAAD19049.>
Date: Thu, 9 Nov 2023 09:50:36 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andcooper@tibco.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Subject: Re: Support situation for nestedhvm
References: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
 <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>

Hi,

On Tue, Nov 07, 2023 at 08:15:32PM +0000, Andrew Cooper wrote:
> On 07/11/2023 7:53 pm, Elliott Mitchell wrote:
> > I ran into the nestedhvm via the following path.  I was considering the
> > feasibility of shedding tasks from a desktop onto a server running Xen.
> > I was looking at `man xl.cfg` and noticed "nestedhvm".
> >
> > Since one of the tasks the computer handled was running other OSes in
> > fully simulated environments, this seemed to be something I was looking
> > for.  No where did I ever see anything hinting "This configuration option
> > is completely unsupported and risky to use".
> 
> This one is explicitly covered in SUPPORT.md, and has had XSAs out
> against it in the past for being unexpectedly active when it oughtn't to
> have been.
> 
> > Things simply started exploding without any warnings.
> 
> Things also explode if you try to create a VM with 10x more RAM than you
> have, or if you try `./xenwatchdogd --help`, or `xl debug-keys c`, or
> many other things. 
> 
> The xl manpage probably ought to state explicitly that the option is
> experimental, but that the extent of what I'd consider reasonable here.
> 
> You can't solve educational matters with technical measures.
> 
> ~Andrew
> 
No, but we can prevent users unexpectedly shooting themselves in the foot.

Elliott's point (as I understood it) was that we could have an
"experimental" switch, that would warn and error out when experimental
features are used without it. This is just cfg sugar coating for xl, and
would improve UX. Cargo uses the same sort of idea in the Rust ecosystem to
make a clear distinction between unstable features that may change and
stable ones that are meant to stay and just work.

Having "experimental=nestedhvm,foo" is one option, having "experimental=1"
be a required flag to enable experimental features is another. Heck, even
renaming "nestedhvm" to "experimental-nestedhvm" would be an improvement.

```
   Error: nestedhvm=1 is an unstable experimental feature not encouraged
          for production purposes. Enable it with experimental-nestedhvm=1
          instead.
```

We can't fix it overnight, but we can't make it _very_ clear it's unstable
to anyone currently using the feature.

Cheers,
Alejandro

