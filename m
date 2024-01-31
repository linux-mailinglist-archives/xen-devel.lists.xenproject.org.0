Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF42844542
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 17:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674113.1048832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDsS-0000Xu-3W; Wed, 31 Jan 2024 16:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674113.1048832; Wed, 31 Jan 2024 16:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDsS-0000Uw-0L; Wed, 31 Jan 2024 16:55:56 +0000
Received: by outflank-mailman (input) for mailman id 674113;
 Wed, 31 Jan 2024 16:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWvt=JJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rVDsR-0000Uq-2c
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 16:55:55 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9873bcac-c059-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 17:55:53 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so4749428f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 08:55:53 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bp20-20020a5d5a94000000b0033af280ec84sm7772902wrb.26.2024.01.31.08.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 08:55:52 -0800 (PST)
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
X-Inumbo-ID: 9873bcac-c059-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706720153; x=1707324953; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtiCewdJcL+iYRfp9BUBhMJSzmg0j8GbbSxzPkR/NIA=;
        b=Esh3fhcE6+4d1uBvtw3RTHdPKMl2TQxuKnE1XsOPfr8UEyLuDceZKbrTJJ2QonwCg7
         1irYJVsFwD+MhH2jZfHTFzvqV0jk2uhbG7FDF+iqHQ5MILpi4XTXntHciFpFjdCPB0jZ
         UeRv7IaF0f0PPF4cfLZFv916b6uidiWCgpM7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706720153; x=1707324953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtiCewdJcL+iYRfp9BUBhMJSzmg0j8GbbSxzPkR/NIA=;
        b=JgSOeFvuLwhitGp9iTC37wtr2Ux+YcS/Mj3QMWnLsdIKwGh8Lj/zNbgmFrjlNJIuKv
         QH4rfBaQWROdkIgft8FvHWQudxezDaE8ycpUEmvPSw8vhqcwfy9hK4NlM4kqu5ErpNLi
         TbFfqN4Z0ZuzrBspil9a9xYouVPxOwKx2uMjBuOkitC9jmfVAqyFURI0WBTL7jE6wjWG
         TVURNQLJi6Shn3YyQcQ1fYABqIEVtsoJ02w80X0mrz29M7L/9tX0nCTXbkheNEaV9yFo
         X6jnXHzuMrLfzrRstH12wJVrSZSIRFFUAffb3XOuuy1Tg640zthwpQzu5qpnugoDgwXM
         qEDg==
X-Gm-Message-State: AOJu0Yy3reWLVNmKh9iJu/spPWqIoN/KrzYjQBDOStwQdAtqvyNo3SsF
	itWUCSoKXc0XJrljYo6ObhYvGr3XUwwtkepVxWjKJSQGBqablcV8Ab9iTSE8vuk=
X-Google-Smtp-Source: AGHT+IF4jeGvlT/0bzrqX76DJgE5M5cIkunl7qtpEaVJaCFmHugkgo2wNiXe6uQXCfd9acpbMXiDvQ==
X-Received: by 2002:a5d:4a44:0:b0:33a:f5b6:a462 with SMTP id v4-20020a5d4a44000000b0033af5b6a462mr1500836wrs.44.1706720153348;
        Wed, 31 Jan 2024 08:55:53 -0800 (PST)
Date: Wed, 31 Jan 2024 16:55:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV
 devices
Message-ID: <6b2e85b2-9e2b-4d0f-be76-36c7d85826a2@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-17-jgross@suse.com>
 <2a2f50d3-f065-4b03-b75d-401a40fcb6fd@perard>
 <b44e2775-c396-428f-91d2-427691509a37@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b44e2775-c396-428f-91d2-427691509a37@suse.com>

On Wed, Jan 31, 2024 at 04:18:43PM +0100, Jürgen Groß wrote:
> On 12.01.24 17:55, Anthony PERARD wrote:
> > On Thu, Jan 04, 2024 at 10:00:38AM +0100, Juergen Gross wrote:
> > > +static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
> > > +                         libxl__ao_device *aodev)
> > > +{
> > > +    STATE_AO_GC(aodev->ao);
> > > +    struct libxl__aop9_state *aop9;
> > > +    int rc;
> > > +    char *args[] = { "xen-9pfsd", NULL };
> > > +    char *path = GCSPRINTF("/local/domain/%u/libxl/xen-9pfs",
> > > +                           p9->backend_domid);
> > > +
> > > +    if (p9->type != LIBXL_P9_TYPE_XEN_9PFSD ||
> > > +        libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/state", path)))
> > 
> > I feel like this check and this function might not work as expected.
> > What happen if we try to add more than one 9pfs "device"? libxl I think
> > is going to try to start several xen-9pfs daemon before the first one
> > have had time to write the "*/state" path.
> 
> I don't think so. The path is specific for the _backend_ domid.
> 
> > What about two different libxl process trying to spawn that daemon? Is
> > xen-9pfs going to behave well and have one giveup? But that would
> > probably mean that libxl is going to have an error due to the process
> > exiting early, maybe.
> 
> I think I need to handle this case gracefully in the daemon by exiting with
> a 0 exit code.

As long as the scenario is handle somehow, I'm happy.

> > Could you reorder the file, to make it easier to follow the code of
> > the async style? "xen9pfsd_spawn()" should be first, followed by
> > _confirm() _failed and _detached() and finally xen9pfsd_spawn_outcome().
> 
> This would need to add some forward declarations. If you really are fine with
> that, I can do the reordering.

What's wrong with forward declarations?

When you write a bunch of function that are supposed to be called one by
one, but the next one to be called is above the current function in the
source file, isn't that a bit like top-posting?
Anyway, writing function in the source code in a chronological order,
with forward declaration, is part of the libxl CODING_STYLE.

Cheers,

-- 
Anthony PERARD

