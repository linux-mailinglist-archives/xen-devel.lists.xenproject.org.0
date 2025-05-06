Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9CAAC195
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 12:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977041.1364126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFm9-0002wJ-EQ; Tue, 06 May 2025 10:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977041.1364126; Tue, 06 May 2025 10:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFm9-0002ty-A9; Tue, 06 May 2025 10:43:49 +0000
Received: by outflank-mailman (input) for mailman id 977041;
 Tue, 06 May 2025 10:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCFm7-0002tr-K3
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 10:43:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd03b27b-2a66-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 12:43:47 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so35321195e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 03:43:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b0dffaa1sm1200469f8f.31.2025.05.06.03.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 03:43:46 -0700 (PDT)
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
X-Inumbo-ID: fd03b27b-2a66-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746528226; x=1747133026; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eesApTGBPNVMJiYG4zC+vOLY/uFRoJRoHZ5ler0C+Kw=;
        b=RjvSA92cYORaT3mYRODP+rLOGOorFDNGoFZFZBAtXSJmiz8VMlhBFpZu+0tyNiVTDI
         zxvBRHFttUjUBBdB4Nnoa+B45g3BZm5jRE4o3jfQJ9SOmnlZIb9aYxH6nLHdawW2+xr8
         T+gKML7H/zEK/e41NjQCAdSHbKDlZMQ49xexY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528226; x=1747133026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eesApTGBPNVMJiYG4zC+vOLY/uFRoJRoHZ5ler0C+Kw=;
        b=aicPTs4xx5lN+kOUoZYjFS1pqtZny2/n0m9LW4pywLJv5msTDhcJe3v1sU0hRNL4P3
         7ajk/esCC9/5Arm2ffBiMMBmx7TqyRS27UkILswtJezRLksWMSUIzv2JYMWdOCIOgCNZ
         sWjsG1Tric3rSJWYBN3/3N94n2AkLe3DrUT90rTugd09Uhlrg2OHKE1snXccO2qMKi8c
         E/WE/PG7g8tw9pxSCGTyUu9xlJBoMfahimLxDVMZAmodqv8/V65hBce//AsYgCWVRzOt
         ZSbwepqTeUELRJ6A0GcHpYrQPAmAHoeiVWkeCY3SuAtYV+AlKtJKPsBhzR0/SQx5Pb1J
         LVqw==
X-Gm-Message-State: AOJu0YwZpc85StOUgQhYENNbBuPfloc3ZRva1QS6EdbtY5einuBaBqc3
	PsCy+hRo6aIv17GBxUeY+vvsOgLVLemz/g9GKlofV+S8mqnyw70KgRhFjHhfT6A=
X-Gm-Gg: ASbGncs+HdpAGOwu0RCoGSl7SLIiytqWfK97NIXrwWRJD7KeDliWOExrtRjJmExgzZo
	p6sg4bep4iIdhMUSRoBa6a1LprHvU9mif/gfNk+UGat2cBUFq/+f/RrW9KttUPfYkgiwcUuWvnU
	8n+YQGwJEwpG39pNbRcaI3Na8QrxsgdB1LDhFiVRNKmMmI8kXFKrk0+PCxH9jphQojJvWkvEHaI
	FUoC/Yt7riyxZeCI/FJIqhikSmbnss1qBD0ArW0mkgV8GYnkSNwQMDeek71yzM03aFOk7r6obfd
	5+95D1v/XDTDZd+dCAmWok2Xrx0u9g1AWWWvhbr+GO+zlg==
X-Google-Smtp-Source: AGHT+IGNNQQBt/Am8RJkQi++heFe/C3XsHNlKMDymKVlxz/Sf7u0uaxKUx4mkv2+G2kJH9tfz0B7dw==
X-Received: by 2002:a05:6000:4312:b0:3a0:7b07:af9 with SMTP id ffacd0b85a97d-3a09fddf4e0mr8276501f8f.56.1746528226320;
        Tue, 06 May 2025 03:43:46 -0700 (PDT)
Date: Tue, 6 May 2025 12:43:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
Message-ID: <aBnn4eBSSti7OY56@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
 <035eeb54-e03b-463d-8ed8-b7041505322e@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <035eeb54-e03b-463d-8ed8-b7041505322e@xen.org>

On Tue, May 06, 2025 at 11:20:41AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 06/05/2025 09:31, Roger Pau Monne wrote:
> > Such flag is added to the domain create hypercall, and a matching option is
> > added to xl and libxl to set the flag: `cache_control`.  When the flag is
> > set, the domain is allowed the usage of cache control operations.
> 
> Can you clarify whether you are talking about using the hypercall to flush
> the cache or the instructions?

On x86 at least: both hypercall and instructions if possible, since
Xen traps cache flush instructions.  Maybe that's different on ARM.
As said on a previous reply I've assumed that cache_flush_permitted()
was also relevant on ARM, but maybe it's not and domains are
unconditionally allowed execution of cache control instructions and
hypercalls.

Thanks, Roger.

