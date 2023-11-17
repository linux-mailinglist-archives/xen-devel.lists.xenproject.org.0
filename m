Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2E7EF163
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635059.990777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wfo-000236-Kv; Fri, 17 Nov 2023 11:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635059.990777; Fri, 17 Nov 2023 11:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wfo-00020Y-IM; Fri, 17 Nov 2023 11:06:08 +0000
Received: by outflank-mailman (input) for mailman id 635059;
 Fri, 17 Nov 2023 11:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k5Y+=G6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r3wfm-00020N-B7
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:06:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d530e99-8539-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 12:06:05 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso15720025e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 03:06:05 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f6-20020a7bcd06000000b0040a463cf09dsm6618649wmj.33.2023.11.17.03.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 03:06:04 -0800 (PST)
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
X-Inumbo-ID: 4d530e99-8539-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700219165; x=1700823965; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwicgPJbbfF3eGz9emESahdEAisWhp87PEaI2LV6Qk8=;
        b=KJQepYl4o9lDEwiVNPR4U9ZrgMpXxkSFoKmj/ayIQIclIw4oPOYo2ftt67mCIFaqXm
         B3olOTe9jvGjt30lYougLw4cpPo5BFzHtYSkMlOWuV6epW1cIWJ+nWMyeb/UnXWTRNrb
         YbWcj/zv199+Ja8CTR/clR3GLHP4addh9yZl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219165; x=1700823965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwicgPJbbfF3eGz9emESahdEAisWhp87PEaI2LV6Qk8=;
        b=lwiuD1roAIwY8V5K9Pa+DtnsgiACmvjJu6ppQnMvTUpikM+XyLasNGYtGktsWz6QJ/
         EQfr+QFF3hivRG0t6jxmainneISGXfZa2qvsgvaxQz+d3gb7XUeKf0STIUI8hySa5Xcm
         TH+cSpbY88MhBR6znmVXimNnXk5vGVon4VABnLFV+FsqeOCbrb1BUC6ZHitu1zGGO0Ru
         YWTIcjyJo+7nPwjyNeFJINCMzfr8ceCusyT6XGxDoAO10STn32fRifykHZ9z5IRju+vI
         C7AWWeCXHgDESizcM+Uvd1XcwU+5YnDeAXzGdNX1rn8bsFVbB5vNN3do2UYpziprAZAR
         Muyw==
X-Gm-Message-State: AOJu0YxKIXXmvAS9U9HYJFac53L7pLWl9Iumq1CfopDnI3DGSTWgEIbg
	NjuOlDnoDoGScOqv/aiy8uRtEpk0ILp1jeczyzQ=
X-Google-Smtp-Source: AGHT+IFS/MhIF10ApWoilQaoPlDMUYzSIBUVw5cNKiEhQJ262eDGluVBXABSz/H/571m0dXTrGRPhw==
X-Received: by 2002:a05:600c:3ca2:b0:408:3c9e:44b7 with SMTP id bg34-20020a05600c3ca200b004083c9e44b7mr14459016wmb.3.1700219164782;
        Fri, 17 Nov 2023 03:06:04 -0800 (PST)
Date: Fri, 17 Nov 2023 11:06:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging-4.17 | 28f44b60
Message-ID: <4a7c36d2-d8bf-4eba-814c-5f8cae0cecf3@perard>
References: <6553d80525384_2ca04b0436ee@gitlab-sidekiq-catchall-v2-548c659f69-wtllv.mail>
 <6efe7a0d-eb87-42e8-aeec-1276e40574ed@suse.com>
 <3cbfffc2-4c3e-4132-be05-1787e4f71e3c@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cbfffc2-4c3e-4132-be05-1787e4f71e3c@perard>

On Wed, Nov 15, 2023 at 03:04:59PM +0000, Anthony PERARD wrote:
> On Wed, Nov 15, 2023 at 11:11:30AM +0100, Jan Beulich wrote:
> > On 14.11.2023 21:26, GitLab wrote:
> > > Pipeline #1072370735 ( https://gitlab.com/xen-project/xen/-/pipelines/1072370735 ) triggered by Ganis ( https://gitlab.com/ganis )
> > > had 4 failed jobs.
> > > 
> > > Job #5534997591 ( https://gitlab.com/xen-project/xen/-/jobs/5534997591/raw )
> > > 
> > > Stage: build
> > > Name: ubuntu-focal-gcc-debug
> > > Job #5534997608 ( https://gitlab.com/xen-project/xen/-/jobs/5534997608/raw )
> > > 
> > > Stage: build
> > > Name: alpine-3.12-gcc-debug
> > > Job #5534997597 ( https://gitlab.com/xen-project/xen/-/jobs/5534997597/raw )
> > > 
> > > Stage: build
> > 
> > These three failed due to (once again) too little disk space.
> 
> Runner is "gitlab-docker-seagull".
> Looks like the cleanup task that I've setup sometime ago and run
> weekly only isn't enough anymore. Sorry.
> I'll look at running it hourly instead.
> 
> > > Name: opensuse-leap-clang-debug
> > > Job #5534997599 ( https://gitlab.com/xen-project/xen/-/jobs/5534997599/raw )
> > > 
> > > Stage: build
> > > Name: opensuse-leap-gcc-debug
> > 
> > Here it's unclear, as the log referenced ends too early.
> 
> I had to log into the runner to find out, because no artifact as been
> uploaded to gitlab (which would have a more complete log).
> Turns out that this runner also got into a "no space left" situation.
> This time, runner is "gitlab-docker-swift".


Space issue on gitlab-docker-* runners should be fixed, with
https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/4f383bdf4c9353f9ed4097dcbbb76f30492740f3

Cheers,

-- 
Anthony PERARD

