Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63132854DA4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681052.1059600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHlh-0000JU-G1; Wed, 14 Feb 2024 16:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681052.1059600; Wed, 14 Feb 2024 16:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHlh-0000Gi-AK; Wed, 14 Feb 2024 16:05:53 +0000
Received: by outflank-mailman (input) for mailman id 681052;
 Wed, 14 Feb 2024 16:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raHlf-0000Ga-FW
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:05:51 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec0879f7-cb52-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:05:50 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d073b54359so82906611fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 08:05:50 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 q19-20020ac84513000000b0042c6e5192e6sm2099376qtn.60.2024.02.14.08.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 08:05:49 -0800 (PST)
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
X-Inumbo-ID: ec0879f7-cb52-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707926750; x=1708531550; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ee2PqXgtqlaFAmPhieq1rCz/wnguvI78ivIy080wfc8=;
        b=BaQRnTfp2a1IXrkxgDdSHcxxFcQexVBIvcn6InJSiUvdScTBuN9bjtuoLwQW+9KzE5
         I24VfDb+AsDmpyLQRfVyP/hJm0LbtRKUSyM4iw4cB578hNMeCIH+0DdRTchPQdPOukz8
         VOb3HKJ7MLGjWwKZ1V4mjEHBUdUmvwKAmiylo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707926750; x=1708531550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ee2PqXgtqlaFAmPhieq1rCz/wnguvI78ivIy080wfc8=;
        b=uA1h2cEMQrQuCcIJCOGBx+rVEhLtnEMMn9cQTV832Y0gzgFTXwdmzqYfR82/1b18i2
         X/yWXPEst1bqcBl5BxIP4wD10Vd1YAQFT65izsWGzlRLzjVTRdMV+dGoKI8Yu0u4bTHQ
         NqEO7ZU7tQdYNjzN3Fujgf97fkT7j1ATNvK+zo3UBnX7nHGNoXX3BciwHyO2xa6UUDhv
         FI0bx6LGpzx/WPb2bXUTsZxI2eRICAUfqYCvf/f+cUJVaNd82XLhdy2mxt+oWdZM2115
         S94+AcI5zLcTgrK5j5vH96PlhIh8eFZVpdm6CmJnKZZFxAWBG0mNSBAk7Mg5z1DiMKwL
         yAGA==
X-Forwarded-Encrypted: i=1; AJvYcCVohhLd6OZeXEU4h6mZ4A82TjrjCD+lBxZbf7txHpfzGkJhRWG/hriVsPMNXgX9/z5iSdqAOytrb8j9YypJ746iRiTVJstD9A2CEKSIC7E=
X-Gm-Message-State: AOJu0YyfFp7vYJk2QnDn8oGyHSBgOwQn9XukH1CNHDNts9BIfllRwAYw
	COejGpLGtrVIh7zh2o0k+AakFj8LUzV1Xt9WcGNJamRcVfPpjnt5qLWe79L6klA=
X-Google-Smtp-Source: AGHT+IHRWxlXoOK62vctLZxPl61VPJarAdCAPHPH+0kN2sfqq03shMl6M1jmieBJUtbNM8PvaxlrIg==
X-Received: by 2002:a2e:a452:0:b0:2d1:1c11:38b with SMTP id v18-20020a2ea452000000b002d11c11038bmr1253094ljn.13.1707926749662;
        Wed, 14 Feb 2024 08:05:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPTgJ42MSi5x5/UAPm56vwhiDtwZFUEZweHmgrxKlzZgeZ6i9JJX5O935ukZHL8/C3sSIGs212weuQ6Goh/8pFgXFZdAo/jHcNNfKVOEAtLjo/U8ZT5F/kWu1WkidyKARj/Hu6AeaAnvY3rde2ECgtw10k/VI=
Date: Wed, 14 Feb 2024 17:05:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Message-ID: <Zczk2-YaeOwk1MUI@macbook>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
 <ZczWAg-zmoLXiWAr@macbook>
 <ce3ae020-92b2-44fd-8055-694e374f68a9@suse.com>
 <ZczcPhpcWuAO7OYh@macbook>
 <7f92673f-fa33-478f-ab27-bbec2ead5c40@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f92673f-fa33-478f-ab27-bbec2ead5c40@citrix.com>

On Wed, Feb 14, 2024 at 03:53:24PM +0000, Andrew Cooper wrote:
> On 14/02/2024 3:29 pm, Roger Pau Monné wrote:
> > On Wed, Feb 14, 2024 at 04:08:12PM +0100, Jan Beulich wrote:
> >> On 14.02.2024 16:02, Roger Pau Monné wrote:
> >>> On Wed, Feb 14, 2024 at 10:35:58AM +0000, Frediano Ziglio wrote:
> >>>> We just pushed a 8-bytes zero and exception constants are
> >>>> small so we can just write a single byte saving 3 bytes for
> >>>> instruction.
> >>>> With ENDBR64 this reduces the size of many entry points from 32 to
> >>>> 16 bytes (due to alignment).
> >>>> Similar code is already used in autogen_stubs.
> >>> Will using movb instead of movl have any performance impact?  I don't
> >>> think we should trade speed for code size, so this needs to be
> >>> mentioned in the commit message.
> >> That's really what the last sentence is about (it could have been said
> >> more explicitly though): If doing so on interrupt paths is fine, it
> >> ought to be fine on exception paths as well.
> > I might view it the other way around: maybe it's autogen_stubs that
> > needs changing to use movl instead of movb for performance reasons?
> >
> > I think this needs to be clearly stated, and ideally some kind of
> > benchmarks should be provided to demonstrate no performance change if
> > there are doubts whether movl and movb might perform differently.
> 
> The push and the mov are overlapping stores either way.  Swapping
> between movl and movb will make no difference at all.
> 
> However, the shorter instruction ends up halving the size of the entry
> stub when alignment is considered, and that will make a marginal
> difference.  Fewer cache misses (to a first approximation, even #PF will
> be L1-cold), and better utilisation of branch prediction resource (~>
> less likely to be BP-cold).
> 
> I doubt you'll be able to see a difference without perf counters
> (whatever difference is covered here will be dwarfed by the speculation
> workarounds), but a marginal win is still a win.

I'm happy just stating in the commit message that the change doesn't
make any performance difference.

Thanks, Roger.

