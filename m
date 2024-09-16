Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99796979C44
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799277.1209208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6VL-0000Nn-2J; Mon, 16 Sep 2024 07:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799277.1209208; Mon, 16 Sep 2024 07:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6VK-0000Ly-Vy; Mon, 16 Sep 2024 07:50:38 +0000
Received: by outflank-mailman (input) for mailman id 799277;
 Mon, 16 Sep 2024 07:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H51U=QO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sq6VI-0000Ls-Se
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:50:36 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b9e2d24-7400-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:50:36 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-374c8cef906so3237995f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:50:35 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e72e4abfsm6446446f8f.16.2024.09.16.00.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 00:50:32 -0700 (PDT)
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
X-Inumbo-ID: 5b9e2d24-7400-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726473035; x=1727077835; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9J04bZUpf8wHgxeZ3Zu6zfuoxjXqcwGopKTjpofGJZ4=;
        b=qetnWR+al2KQZYq2w024/WhNNZN9lt6fmremQ539NnRdSOagIkV9RjpiLVo0scOPOK
         6gomEoqqo9gfiyB+hYJIHUr+gVzeS97m0YR3NmU/Nbseb5IGPlcSqO26bJ+jGNrmvP8f
         22kjfPHQzfiPf5aiC63vBc9S/dXzOmwIZ7rxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473035; x=1727077835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9J04bZUpf8wHgxeZ3Zu6zfuoxjXqcwGopKTjpofGJZ4=;
        b=oEv5X+aNkACbS76i55Y/wzbZvCC22YE+XL5lXwKaDBq0JB8jlXqlxj3NJi+ZZ0ekKt
         W7d5vVLk3qfN++tfwsnbqElfHic5EQo+l0UUv4J2wyXiZbDYaHa2sncJjRAruoZXl9ty
         t0vscRbn9mpQGgR1735I2Fwyj4LFd+J0MPScl3bcrVkYh+3v0Lmz9ysStaEA+akbtrMr
         7zHyrUmGjim7ScQ9orlndq419WQ42uwpODvtu5nWBzCpqMtBBm/3PAiyPtDu2wXUi8ak
         gniHnPCAqgRy9ced41YNsiYOgiYVAXsK/Yu1JlPFl3+4pbwF6Z9zqdLm5VRJM6yOGPed
         aNcw==
X-Forwarded-Encrypted: i=1; AJvYcCUeGOvZaqgcP9ButSDoSjoPrUOZg+l8rMEWvuAY4NsR/x0icvIKPpGX+44+3siJAHxtExu+5W7yaB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpB7nzwDVklF1iS9oo6LjQgUKGiw5mMtfUDhf0xkbIVT7YhejG
	EoyyGUajh7hApVKddF2AFR50I8/3LJlyyz41SPfRx5E5LjpVv1Fm64uliP2ksVg=
X-Google-Smtp-Source: AGHT+IEFBBnhnHbUttpb2yOzOyRfuXcURQnyO6F3zklP/tjrqhk8HVGP/QYC5mIfjw0IHtM3SipB3g==
X-Received: by 2002:adf:ec05:0:b0:374:c45a:8afb with SMTP id ffacd0b85a97d-378c2d0751cmr8665286f8f.19.1726473033252;
        Mon, 16 Sep 2024 00:50:33 -0700 (PDT)
Date: Mon, 16 Sep 2024 09:50:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZufjSIH6yqKS5e_E@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <bc713147-3235-4151-8026-1c922e871755@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc713147-3235-4151-8026-1c922e871755@suse.com>

On Fri, Sep 13, 2024 at 02:38:14PM +0200, Jan Beulich wrote:
> On 13.09.2024 09:59, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
> >      return "";
> >  }
> >  
> > +static int __init cf_check parse_wallclock(const char *arg)
> > +{
> > +    wallclock_source = WALLCLOCK_UNSET;
> 
> With this ...
> 
> > +    if ( !arg )
> > +        return -EINVAL;
> > +
> > +    if ( !strcmp("auto", arg) )
> > +        ASSERT(wallclock_source == WALLCLOCK_UNSET);
> 
> ... I'm not convinced this is (still) needed.

It reduces to an empty statement in release builds, and is IMO clearer
code wise.  I could replace the assert with a comment, but IMO the
assert conveys the same information in a more compact format and
provides extra safety in case the code is changed and wallclock_source
is no longer initialized to the expected value.

Thanks, Roger.

