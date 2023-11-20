Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C857F11D0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636612.992197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52Jk-0005p6-57; Mon, 20 Nov 2023 11:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636612.992197; Mon, 20 Nov 2023 11:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52Jk-0005n4-2b; Mon, 20 Nov 2023 11:19:52 +0000
Received: by outflank-mailman (input) for mailman id 636612;
 Mon, 20 Nov 2023 11:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r52Ji-0005my-Ha
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:19:50 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7367cd6-8796-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 12:19:48 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso2675597f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 03:19:48 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z5-20020adff745000000b0032d829e10c0sm10825917wrp.28.2023.11.20.03.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 03:19:47 -0800 (PST)
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
X-Inumbo-ID: b7367cd6-8796-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700479188; x=1701083988; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rkl+YdxOFE7JWNPrxAnCpP+tIG+fKa09gahuAhInB78=;
        b=vUgZWoDHvNr46ol3mVD8Oj64q4Sd+uj7XmQe8bDA6+DQL+jLvJXQH8I9fNDJAjGXpx
         oxgdqrYjlwNAziM8glpCHsEtRrWhvDLBNCkBIrrH65k1bfLG6DPUM0m3w6GyThsbKzgr
         BSmKztTzISMgzHbWg3NBZAtcF//PQ+pl4CkPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479188; x=1701083988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkl+YdxOFE7JWNPrxAnCpP+tIG+fKa09gahuAhInB78=;
        b=ECwBUDOsokFy+DyKAfY07tJaf++HLx25skPTkyZBw5gkt+/p5M4VF1fhQnOWm0s4j/
         ceeLO4mcZuIgceo2AnJGKgSM98az3tHYICu5zWq66He7g5DkHyKi6fBvrSF6+BpM396j
         XgZzKQ7ErlSgbcL/BhsZImQVqefkEOizQRmpi6vtPYUZgXlnnSKVBrLYxI6grUl077xu
         x5BLJSnIt82EEe86uWMvDxKFJEu1DC4cLS+aCAFDoalQjywTcXVjbCPwL08cz3XD6YEF
         Qn+yxCuO1qTFFNLiSlqyCqEGr2TSh4AZbqckOJTW85aaR4se5NnXZTnSnpAyZhXr7SDL
         PPHw==
X-Gm-Message-State: AOJu0YwRX0sSOdVf+8dXUTMdVnIedrXa67QCBEv4IUFAEe+X1xGgH48t
	PseW6wfoTe9udEvMF7VJGI4S8Q==
X-Google-Smtp-Source: AGHT+IHhfmHFehhAKXmvjfjYU6MYHOg5Fyyvig2Q507sZHkvydxE89iHJZ8KF1t9gFDRqER3y1wKGg==
X-Received: by 2002:a5d:5849:0:b0:332:cb12:16ce with SMTP id i9-20020a5d5849000000b00332cb1216cemr533580wrf.65.1700479187947;
        Mon, 20 Nov 2023 03:19:47 -0800 (PST)
Date: Mon, 20 Nov 2023 12:19:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: switch to multi-platform images when
 possible
Message-ID: <ZVtA0v0sf8H27qOC@macbook.local>
References: <20231116121310.72210-1-roger.pau@citrix.com>
 <20231116121310.72210-7-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311161711560.773207@ubuntu-linux-20-04-desktop>
 <ZVc9MZQ3lJpL2Nz1@macbook.local>
 <alpine.DEB.2.22.394.2311171826100.773207@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311171826100.773207@ubuntu-linux-20-04-desktop>

On Fri, Nov 17, 2023 at 06:27:50PM -0800, Stefano Stabellini wrote:
> On Fri, 17 Nov 2023, Roger Pau Monné wrote:
> > On Thu, Nov 16, 2023 at 05:14:23PM -0800, Stefano Stabellini wrote:
> > > On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > > > Instead of using specific architecture image, switch to using multi-arch ones
> > > > and specify the desired architecture using the --platform option.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > > I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> > > 
> > > We are missing:
> > > 
> > > automation/build/debian/buster-gcc-ibt.dockerfile
> > 
> > That file was updated in patch 5/6:
> > 
> > https://lore.kernel.org/xen-devel/20231116121310.72210-6-roger.pau@citrix.com/
> > 
> > > automation/build/debian/bookworm-cppcheck.dockerfile
> > 
> > Not sure I'm following, bookworm-cppcheck.dockerfile is updated...
> > 
> > > automation/tests-artifacts/*
> > 
> > Oh, didn't realize about those, I will do in a separate patch.
> 
> Thanks!
> 
> 
> > > Aside from that, it is fine.
> > > 
> > > How did you test the updated containers? Have you already pushed them to
> > > the registry?
> > 
> > I've pushed them to my local registry and changed the registry in one
> > of my Xen branches, see:
> > 
> > https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
> > 
> > Some jobs failed because the runners run out of space.
> 
> Oh, OK. It is going to be a lot of work to rebuild and push all the
> containers and I wouldn't mind you doing that once the patches are
> acked. In fact it would be great if you pushed the containers once you
> tests that they work as expected. If you don't have the right access
> permissions, I can do that too

For the patches only the x86 bookworm container needs to be rebuild in
order to contain the packages required by the test step.

The rest can be updated either before or after the series has been
committed.

Thanks, Roger.

