Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DB1968B99
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788228.1197690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9bC-0001RJ-5a; Mon, 02 Sep 2024 16:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788228.1197690; Mon, 02 Sep 2024 16:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9bC-0001Po-2r; Mon, 02 Sep 2024 16:08:14 +0000
Received: by outflank-mailman (input) for mailman id 788228;
 Mon, 02 Sep 2024 16:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl9bA-0001Pi-5i
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:08:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf1c79f-6945-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:08:11 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so2426624a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:08:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c25cbec9fasm1640967a12.84.2024.09.02.09.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:08:09 -0700 (PDT)
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
X-Inumbo-ID: 8cf1c79f-6945-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725293290; x=1725898090; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6jBpfWloeVRYiZRx+tlzejyGjtXligADSGfBNtrHCZc=;
        b=ObXOXEoN7a3O4KUbYDeIxqMn+50KgpdVMJObxM0aclQ/J9icf4BnLlcQ0+PHPAKgH6
         64sKeEjmQ5sVZNPvaQFwhoylUjzG0CBCXGsHDZj2TM3EBZFfae6vnqKaPNqwP5HJS2K7
         oMsRk37OvWAM7Wi6u1SxVK9ukY4UqpI0CVw3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293290; x=1725898090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jBpfWloeVRYiZRx+tlzejyGjtXligADSGfBNtrHCZc=;
        b=u07ypdsNSO7wo+GQLtqcFcvdXIRlgkz+L6I8vnKQIPtD4sX7iAuGrqp2zXmfNCavzH
         gV8XJ6ykQoGXklTenmi7BeuyCUzV27wbdDqRAs2RhbO7aPSpgfsBUjHB4r4P44Ezgz9H
         jMRj+0YLO47sDaDgShxiUTh8GbpwLvM8eI4SrUDrDL7vSg6zGR7Otom4pUDSXjigv7Qy
         j5tXL1YtbgVX4tQRwWS6hQDnfdA9H/omcmjfy0n663GQfv+BMP8J/FZki2Lgx6S5VKLV
         CGJSyK7bFCvwFKoQCvbDwCUuRCV3VYbRwb9rG9uXDwdCxvD7PLCn02KMmdr8Rdt7gv9j
         OhZA==
X-Forwarded-Encrypted: i=1; AJvYcCXru7ALnV7FrUdNHLRjfABwXwKTdOlmNTmiHbAZ06EfmO9uUeqF3qU4MAmCNn+IEWJiWQvnuhMfc9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCpy6HwpL0VJKobP9sfCJuJ9jPfV6jEciqqNFNV3lPMASTYp1h
	rGiQLoL0V29SqYAz7OAEnLO28y4Cn1bTNUU+zubi7P9MVjJsLXfrm2phncMa/TE=
X-Google-Smtp-Source: AGHT+IHQAmtSrMRqtWiOjViIyGq5PIU1CezJ33LKtidFMUgl7EORfP8MJ+wE63nlJTqD53e7+71VrA==
X-Received: by 2002:a05:6402:520e:b0:5c2:5f43:3e8 with SMTP id 4fb4d7f45d1cf-5c25f430707mr2914742a12.9.1725293290113;
        Mon, 02 Sep 2024 09:08:10 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:08:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
Message-ID: <ZtXi6P0aIchMFXcv@macbook.local>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
 <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local>
 <ZtHus/ytlA1UnHEI@l14>
 <ZtV9hteu_sVyvnih@macbook.local>
 <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org>
 <ZtXYeaKp-ug8oFjX@macbook.local>
 <ZtXeq8F2BLTk2USB@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtXeq8F2BLTk2USB@l14>

On Mon, Sep 02, 2024 at 03:50:05PM +0000, Anthony PERARD wrote:
> On Mon, Sep 02, 2024 at 05:23:37PM +0200, Roger Pau Monné wrote:
> > On Mon, Sep 02, 2024 at 03:19:56PM +0100, Paul Durrant wrote:
> > > On 02/09/2024 09:55, Roger Pau Monné wrote:
> > > [snip]
> > > >
> > > > Thanks for your input.  I would also like to hear from the blktap and
> > > > Windows PV drivers maintainers, as the change that I'm proposing here
> > > > will require changes to their implementations.
> > > >
> > >
> > > So IIUC you are proposing to refuse to connect to a frontend that sets
> > > feature-large-sector-size if sector-size != 512? Is that right?
> >
> > Is is worth retrofitting this into existing backends?  My suggestion
> > would be to make `feature-large-sector-size` not mandatory to expose a
> > sector-size != 512, but I wouldn't go as far as refusing to connect to
> > frontends that expose the feature.  I have no idea which frontends
> > might expose `feature-large-sector-size` but still be compatible with
> > Linux blkback regarding sector-size != 512 (I know the Windows one
> > isn't).
> 
> The frontend exposing "feature-large-sector-size" are not going to work
> with Linux's backend if it set "sector-size" to a value different from
> 512.
> 
> From blkif.h:
>     feature-large-sector-size
>          A value of "1" indicates that the frontend will correctly supply and
>          interpret all sector-based quantities in terms of the "sector-size"
>          value supplied in the backend info, whatever that may be set to.
>          ...

While this is what the protocol specification says, just look how
different implementations have managed to diverge in all kind of
different ways.  I wouldn't discard there's a frontend somewhere that
exposes `feature-large-sector-size` without doing the calculations as
stated in the specification.

> But Linux interprets "sector-based quantities" as 512 bytes. This is
> incompatible with "feature-large-sector-size".
> 
> This is why I proposed to mark "feature-large-sector-size" as broken or
> incompatible with your proposal to use 512B for all sector-based
> quantities.

Yeah, that's the intention, to mark `feature-large-sector-size` as
deprecated in blkif.h and note it shouldn't be exposed by frontends.

I however wasn't planning to change Linux blkback for example to
refuse to attach to frontends that expose `feature-large-sector-size`
when `sector-size` != 512.

Thanks, Roger.

