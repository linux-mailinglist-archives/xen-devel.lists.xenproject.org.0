Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF348A9E57
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708480.1107429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTgh-0005cZ-IT; Thu, 18 Apr 2024 15:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708480.1107429; Thu, 18 Apr 2024 15:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTgh-0005ab-Fi; Thu, 18 Apr 2024 15:28:35 +0000
Received: by outflank-mailman (input) for mailman id 708480;
 Thu, 18 Apr 2024 15:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0X1s=LX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxTgg-0005aV-DH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:28:34 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 504ef707-fd98-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:28:32 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5a9ec68784cso482099eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:28:32 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac86652000000b00437392f1c20sm744427qtp.76.2024.04.18.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:28:30 -0700 (PDT)
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
X-Inumbo-ID: 504ef707-fd98-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713454111; x=1714058911; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+s1oZ8CloVjMVDxDLy5jY3c9bDIPqcpn5R3vwpjXOCU=;
        b=uPlb8uf7OuXRr0bdbOoWp7dXJFZbGJ+0ijxX9XtOsZs9madJj6ob9cwP2pz+lHA2+7
         U9EUAEULCGz+4U7YmOJFDdk3C9AW4PSMn4ii5uh2NTLpr7YhtALJ3R6VVNXyjPS6Y2sb
         EXVTLZRjSv9bgfS+l7rPtlPUraGVrXR8Bqqy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713454111; x=1714058911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s1oZ8CloVjMVDxDLy5jY3c9bDIPqcpn5R3vwpjXOCU=;
        b=kp71PdvuuLZZhLn7lp9xa0nJkjuIZFo0cvxEj/Cax3K8mLmOmYj5x867CB/N8L/sQb
         9Ct9fancc5YZe+22jtZQAABm+AIweo6mObAJGpGN+A6Xv8P9R0JzaloLPRrZryguq8q2
         Jz9OiBxv6rSdeB+WUsvh6f30fYF9HoSvTW5HRYuUJMfIv5cvX0iXV4CZAcq1LRQtdOQ7
         +JLaDZk5e9+YtrI6yD+Puw1VtZsbSYskgvST+BlmRkdC/AfMFtax9957/UC1xUHBdp0X
         ZGVx/Kmo884A/EGNuKuWvUNDUKdCfNilt9huyZEhcD54EXLArtZjg7VhZW0YXdo8ApT0
         ldGA==
X-Forwarded-Encrypted: i=1; AJvYcCWxaB4XZvRGp+AEaVTYXXYCW0kwJC5ZKgVUp1w6wQpsyJLLj7LPPfULylA+k1Qi4tGbkkrS5cWhnj0iZBA3Wleh0Y7IYJ+RwtzIZNqQRLA=
X-Gm-Message-State: AOJu0Yx/XMkAtCsXu5f+99JT9E3joODHXQrUALvjfdvBLR65FJQIVYx4
	X//iMHUX+uUuE7hqzeHKkprh9x0P+vkO68oUMWKKsvZntbkY0d9pZ5rOhWtXp4I=
X-Google-Smtp-Source: AGHT+IE5oVOoG0BfYpddhyAhjLKJCVJwI8zQdFFLX3i7sz4A1hktijLIDQQqpZk23PfQ/VmdXWazbA==
X-Received: by 2002:a05:6358:4b12:b0:183:6427:10b5 with SMTP id kr18-20020a0563584b1200b00183642710b5mr3562765rwc.21.1713454111205;
        Thu, 18 Apr 2024 08:28:31 -0700 (PDT)
Date: Thu, 18 Apr 2024 17:28:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/spec: fix reporting of BHB clearing usage from guest
 entry points
Message-ID: <ZiE8HGEW5l0SPaNt@macbook>
References: <20240415141737.88236-1-roger.pau@citrix.com>
 <cc211dbe-9d95-46aa-8167-558acac7a3d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc211dbe-9d95-46aa-8167-558acac7a3d3@suse.com>

On Thu, Apr 18, 2024 at 12:44:26PM +0200, Jan Beulich wrote:
> On 15.04.2024 16:17, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -643,7 +643,7 @@ static void __init print_details(enum ind_thunk thunk)
> >             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >             opt_verw_hvm                              ? " VERW"          : "",
> >             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
> > -           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
> > +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
> >  
> >  #endif
> >  #ifdef CONFIG_PV
> > @@ -658,7 +658,7 @@ static void __init print_details(enum ind_thunk thunk)
> >             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >             opt_verw_pv                               ? " VERW"          : "",
> >             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> > -           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
> > +           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
> >  
> >      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
> >             opt_xpti_hwdom ? "enabled" : "disabled",
> 
> For one the surrounding if() conditions need similar adjustment.

Oh, I see, you mean the printing of "None" if no options are active.

> But then I wonder whether the further uses of cpu_has_bhb_seq don't
> need switching, too (when determining whether to force
> X86_SPEC_NO_LFENCE_ENTRY_*). At which point the question is why
> cpu_has_bhb_seq exists in the first place: It in particular does not
> affect the default calculation of opt_bhb_entry_*, afaics.

Hm, yes, that's indeed not very helpful.  The current code is overly
restrictive, as the lfence won't be elided even when the BHB sequence
is not being used by that specific guest type, as long as some
sequence is configured.  Will add a further patch to fix that and then
remove cpu_has_bhb_seq.

Thanks, Roger.

