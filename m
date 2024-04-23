Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795108AF4A1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710932.1110502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzJLK-0003Ux-NZ; Tue, 23 Apr 2024 16:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710932.1110502; Tue, 23 Apr 2024 16:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzJLK-0003TR-Jc; Tue, 23 Apr 2024 16:50:06 +0000
Received: by outflank-mailman (input) for mailman id 710932;
 Tue, 23 Apr 2024 16:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09RI=L4=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rzJLJ-0003O2-Lg
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:50:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 888af0b9-0191-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 18:50:04 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed4fso19702665e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:50:04 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bh8-20020a05600c3d0800b0041a9ff23679sm4077894wmb.7.2024.04.23.09.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 09:50:03 -0700 (PDT)
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
X-Inumbo-ID: 888af0b9-0191-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713891004; x=1714495804; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJu4nxaW/ggzpRU7rFHinpZnBWcdLNCxIKnKBmeppeQ=;
        b=ixCfKTv9+1j07f/4G4wvCZYvl3bVWcH5o8PVTIAv2zw1l0V3C7dZjsuNo+99f9oUVs
         5uebkpANOG64J8LSR8X8Cyu14V/WV3/h1tFtlWuanGjOZMgkF1VvuA95gwd7iQ+XSsVU
         MS8EiRQiy16rNzSqFVJM5sclth1oh+hJiBH28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891004; x=1714495804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJu4nxaW/ggzpRU7rFHinpZnBWcdLNCxIKnKBmeppeQ=;
        b=BaEN3kMnOs5x/7Jkm+GU2tq79qU4OD5kHNCrYsK+bo/Bg87s4FFlSJHL4oBJdaNXpr
         aeQKGC6d+0s8m8riTBGyG0xDes9igQ8wTH69M2BgHtlq2iXSbJjSpT7vDZBoDq0bZddw
         pr770CYheBQi34+0lbQaAwW0vyAsRpO/JkDeB3UAoA6bUK9Qq0J8IhCWI/+G3pZIRZLU
         m2kapE+FjNxitnaDxewpAzGWN/8eveV33z4k5lw1t/wZuJo2wSwvCbTwmT5anuhx6L33
         usHocInDd98XhW4SPiCnPHYhXlZaptmPaiqlvS3EaJ5W4hVDjy5bziXYRtq8XuKpwUz0
         pBPQ==
X-Gm-Message-State: AOJu0YypaIL/Qa/ewZ6bpseUYD1ij7Xp2wlWcApEeKV7EpLO6nlEjecR
	Ru6mQzakuFONraiwlMQBgbuNyQRjTAsBtt85aLDaWAciCWQFICihKdfcevJS0Cbt1pFghjJAWfY
	M
X-Google-Smtp-Source: AGHT+IGIC2knqma/J/O7XOMcZjBx+XV3t8GMbWCaPHkmay+uEkJi/sKeDodnGoa5JvpUVgdbvI/bqA==
X-Received: by 2002:a05:600c:3d8b:b0:41a:b7ce:72b with SMTP id bi11-20020a05600c3d8b00b0041ab7ce072bmr1804249wmb.13.1713891003939;
        Tue, 23 Apr 2024 09:50:03 -0700 (PDT)
Date: Tue, 23 Apr 2024 17:50:02 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/5] x86: Use getopt to handle command line args
Message-ID: <1bb182dd-931d-4a15-b4e8-8701aedc744f@perard>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-5-fouad.hilly@cloud.com>
 <5ece784e-cc8c-4cbb-9ea3-a55f29fab1ac@perard>
 <CAJKAvHZ-6DsY5wTdFzB6tm5RNKY4EnmY-Stjsi2aRmMT9TZCnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJKAvHZ-6DsY5wTdFzB6tm5RNKY4EnmY-Stjsi2aRmMT9TZCnw@mail.gmail.com>

On Tue, Apr 23, 2024 at 04:16:10PM +0100, Fouad Hilly wrote:
> On Mon, Apr 22, 2024 at 6:48 PM Anthony PERARD <anthony.perard@cloud.com> wrote:
> > On Tue, Apr 16, 2024 at 10:15:45AM +0100, Fouad Hilly wrote:
> > > +    if ( argc != 2 )
> > > +        goto ext_err;
> >
> > Why only two arguments allowed? And why check `argc` before calling
> > getopt_long() ?
> At this stage of the patch series, xen-ucode expects either firmware
> file or a single argument, that is why argc should be 2.
> If there is no argument or many arguments that are not supposed to be,
> we exit with error other than try to parse the arguments.

Right, but what's the point of introducing getopt_long() if we are not
going to use it? The patch tries to make it nicer to introduce more
options to the tool but then put an extra check that make this actually
harder. This condition is even change in the next patch, that's one more
reason that says that it's a wrong check.

You can let getopt_long() parse all the options, deal with them, then
you can deal with the nonoptions after that, and check that's there's
only one nonoption.

> > > + ext_err:
> > > +    fprintf(stderr,
> > > +            "xen-ucode: Xen microcode updating tool\n"
> > > +            "Usage: %s [microcode file] [options]\n", argv[0]);
> >
> > Isn't there a usage() function that we could use?
> As there is an error, stderr should be used, which was a comment on V1.
> >
> > > +    show_curr_cpu(stderr);
> >
> > Why call show_curr_cpu() on the error path?
> Informative, but could be removed.

We are on the error path, it's looks like the usage message is printed
before the cpu information, so if the error is due to wrong options
then that information is lost. We should print why there's an error, not
much else would be useful. Error messages should be as late as possible
or they are getting lost in the scroll of the terminal. So yes, it's
probably best to remove.

Thanks,

-- 
Anthony PERARD

