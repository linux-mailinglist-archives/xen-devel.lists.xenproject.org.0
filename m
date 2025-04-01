Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534DA77C24
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934367.1336092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbjA-0001Bv-3T; Tue, 01 Apr 2025 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934367.1336092; Tue, 01 Apr 2025 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbj9-00019b-Vx; Tue, 01 Apr 2025 13:32:27 +0000
Received: by outflank-mailman (input) for mailman id 934367;
 Tue, 01 Apr 2025 13:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbj8-00019V-IS
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:32:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf32a040-0efd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:32:24 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so8951434a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:32:24 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac71927b12dsm779359466b.59.2025.04.01.06.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:32:23 -0700 (PDT)
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
X-Inumbo-ID: bf32a040-0efd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743514344; x=1744119144; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkwcpJVk2cv3xdY0ODsqO7E+oi90S51LaKb2PT9NXn8=;
        b=DnBlwrtMrk+xClppGsMMqn76hXE9r5rJP4HycfXNqJEKd66UhD2x22648VP6XtK+il
         klB91VTtxqihg0SNs+jtLzDGB60ume161oakbFVJ7LjmMIKtkv9Ra9HSiP3nBbwRR2z9
         BGScJnqDXsMBtyzWHIx1eWoubwc62SR07iOV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514344; x=1744119144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkwcpJVk2cv3xdY0ODsqO7E+oi90S51LaKb2PT9NXn8=;
        b=Xdv+nKIVtpegg0fZJ2MZP41YpYi5nNLvaRb75qGpXdp0QWP+XyzOfQKpDebSiS6bdm
         ynYaVaie9dvFSZpOApd2Al25uMrHw8rRe/xPWC26DS7+a9oHgLr+VzufjjlGWLDEd3mC
         3zmDYiYWjxeuWIlpXSYRQ+iE1M3okXOcUFoTza9W9atUQTF9Nugxo4j53QHsRrOXiF1Z
         Kn3+4vC4eX4rl6UNo2W63nNqpcQaANhiAWeITyJ/FfSNPywj5l1iI8cosF934TOHh50+
         f77fbddubkyvwOFZe5R6W3DoYXUpkQLEcoAx4p1w2ls0xScUGabTp3L9bEFln75p9NFg
         xv6A==
X-Forwarded-Encrypted: i=1; AJvYcCXghrn9FNTebhnPTrRdpbv43Osj7xvLKcp/4m1TnnKbaDY4TtBkO5m7Fg+q45kr1qCBRVzPS0biT8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYyU6qyuoYan3ngAQafUL59H1Ivk3WuLd4h46MuJ7emqk2hkdh
	9KgzTkbIH6gV84Na7DplYKsExyPDzJGwYabGmVslk2EdMefdQ/7ntQEz3lSi0vo=
X-Gm-Gg: ASbGnctk116jH0Foel+prJfrlWdetJToOoChOcwJKGiFTN2RFYYnCj7ywJsNLB2tQA5
	k7IyyR7pv+TKa74TzyMoSlgHqInBtQ4/PIJ4AO4cPZPVubiFdfK+KhZICPiebEFYhYzJHAj9pn8
	D7us5W9embC+fOW3idN+Pa6DySfaDrW2jZe9MRFlogKVr6U1YhzhEa8z9KHhwZrFlxaItccS4GX
	/t+mnCB7wMpKREReTjxACHBsRXoYAEHOXQXawovR8YWL812S/2OlbDPIOAKMqn3MPl4M3740roR
	aVbmrVLG7XXyOFQwBAeFE7WFT6/7FPuGQltf/DnHPGnFoCUwiA==
X-Google-Smtp-Source: AGHT+IFRM0FfL/2J9e0VKkIZHxGwiD4TXSp6Qasycdu5tw/eRMz1BzxAwZ61a6jCznUCSzei3P05Ow==
X-Received: by 2002:a17:906:dc95:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-ac738a557cdmr1207808366b.30.1743514344082;
        Tue, 01 Apr 2025 06:32:24 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:32:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v1] x86/domain: revisit logging in arch_domain_create()
Message-ID: <Z-vq5nefN-QFg74I@macbook.local>
References: <20250331213406.422725-1-dmukhin@ford.com>
 <Z-uO4X_mk8QycVVe@macbook.local>
 <e87e77ea-0d5b-4fca-abe9-abbb0688ca28@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e87e77ea-0d5b-4fca-abe9-abbb0688ca28@suse.com>

On Tue, Apr 01, 2025 at 09:51:53AM +0200, Jan Beulich wrote:
> On 01.04.2025 08:59, Roger Pau Monné wrote:
> > On Mon, Mar 31, 2025 at 09:34:24PM +0000, dmkhn@proton.me wrote:
> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -798,13 +798,12 @@ int arch_domain_create(struct domain *d,
> >>      {
> >>          if ( !opt_allow_unsafe )
> >>          {
> >> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> >> -                   " for security reasons.\n");
> >> +            printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on this CPU"
> >> +                   " for security reasons.\n", d);
> > 
> > Since you are already touching this, I would switch to gprintk, and
> > avoid splitting the lines:
> > 
> >             gprintk(XENLOG_ERR,
> >                     "%pd: Xen does not allow DomU creation on this CPU for security reasons.\n",
> >                     d);
> > 
> > Same for the other messages below.
> 
> IOW you see value in also logging current->domain?

I always forget that gprintk also logs current->domain, my suggestion
was so that XENLOG_ERR instead of XENLOG_G_ERR was used, as it's more
compact.

I think I withdraw my suggestion, there's likely very little help from
printing current->domain in this context.  It's either the IDLE domain
for initial domain build, or the control domain otherwise.

Thanks, Roger.

