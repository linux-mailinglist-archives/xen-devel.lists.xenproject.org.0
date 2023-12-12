Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F280EB0C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652981.1019210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1NU-0007Cw-Jk; Tue, 12 Dec 2023 11:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652981.1019210; Tue, 12 Dec 2023 11:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1NU-0007AB-H3; Tue, 12 Dec 2023 11:56:44 +0000
Received: by outflank-mailman (input) for mailman id 652981;
 Tue, 12 Dec 2023 11:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Qa1=HX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rD1NT-0007A2-K8
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:56:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 836dab54-98e5-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 12:56:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c3ca9472dso35314535e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 03:56:41 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b003fee6e170f9sm16077232wmq.45.2023.12.12.03.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 03:56:40 -0800 (PST)
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
X-Inumbo-ID: 836dab54-98e5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702382201; x=1702987001; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xBunA107wIy0gTQZ9mcw4hLAulb5qcRxITeSb5bOlMU=;
        b=tYJ9ZAiYW4db3i6F/wXwiDUBykd2M/cnbXEg29AQYuAqgApmsJNO5gLHcEt1ggIzU7
         EDnTSq+eKjZmSofPCymcDma28N4tUmdmhL4NH7bqiTsr64PaK3eilXMDO3+QLpvT1ff3
         joY6Mrm8qPV4JGy0HWUns/0cH7s6rlIFi0niI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702382201; x=1702987001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBunA107wIy0gTQZ9mcw4hLAulb5qcRxITeSb5bOlMU=;
        b=CkCVsZX6AdvwzFFk2Eh1aeZrgnq3cqHl7DQZOAowZysjO1oohoQILIOHDxqY/erWWO
         XMT8Yyosi67oHyzb54KXyAQqNs9TDchT/EIDSBPtLZBksNk2U7HQxHb/csikT0Hym2vG
         ge3D59gX7vVj3GFhY/F9CZk75Ik4jjSQ0G6cT9Gh+CJVMwWypUSq/OUxjnAdhcZ9KdLS
         DHwYhSATPow8lFyZKAmckxwHD7ywrkMJuZ+d87YyCTDeqDvpiJO6Nlf+0wAhvewq6d67
         eNHBr4iF2km85EQarBJ95sKRSWB7U9CObvUWnwYzIE/iLjTY2BnKKgRMzNBKOeeT+lAi
         bEow==
X-Gm-Message-State: AOJu0YzBPD2HAc0yU85493IyRqefEI/Mk+kiDKRbM9jvV2i+3lWys0bC
	JcUqeBarI4x4m1uDgy/zWV4VTw==
X-Google-Smtp-Source: AGHT+IHWh7vexeswhBSa+NZnD1quO5YHXl14lhjYAO+B9XN7X8UReUM2pUVLg8dEN/INbktFffp5Qw==
X-Received: by 2002:a05:600c:17d0:b0:40c:2348:36db with SMTP id y16-20020a05600c17d000b0040c234836dbmr2152050wmo.239.1702382201118;
        Tue, 12 Dec 2023 03:56:41 -0800 (PST)
Date: Tue, 12 Dec 2023 11:56:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 2/3] create_build_jobs: Enable X86_GENERIC for
 i386 kernel pvops jobs.
Message-ID: <0fef2f6d-9211-4f0d-a261-e1b2e180813f@perard>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
 <20231208160226.14739-3-anthony.perard@citrix.com>
 <ZXgcBIAkmWrLvo-h@macbook>
 <6a175474-e6d4-4410-bde1-47c9895baeac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a175474-e6d4-4410-bde1-47c9895baeac@suse.com>

On Tue, Dec 12, 2023 at 09:48:46AM +0100, Juergen Gross wrote:
> On 12.12.23 09:38, Roger Pau Monné wrote:
> > On Fri, Dec 08, 2023 at 04:02:25PM +0000, Anthony PERARD wrote:
> > > This is following a failure to build "arch/x86/xen/enlighten.c" in
> > > build-i386-pvops jobs with linux 968f35f4ab1c ("Merge tag
> > > 'v6.7-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6")
> > > in linux-linus branch.
> > 
> > Could we expand a bit on why CONFIG_X86_GENERIC is required?  It would
> > seem to me that option should have been selected by default already?
> 
> No, the kernel's default for 32-bit x86 builds is still using the M686.
> 
> I guess this is for historical reasons.

If I add the following to the patch description, taken from Juergen
patch, would that be ok?

    Today the cpu type for a 32-bit x86 kernel is not specified in the
    used kernel config, resulting in the M686 to be used.

    Instead of using the M686 which isn't even a 64-bit cpu (thus not
    capable to run a Xen guest), use the X86_GENERIC variant which is
    more appropriate.

ref: https://lore.kernel.org/all/20231207080953.27976-1-jgross@suse.com/

I'm not sure what you mean Juergen with "not 64bit cpu -> can't run xen
guest", maybe it's because we can only run Xen on 64-bit cpus nowadays,
so if we can't run Xen, there's no Xen guest?

As for X86_GENERIC, I think I've read the description which says
something like distro should enable it, so I guess 32-bit distro would
usually have the config enabled, so it make sense that we test with it.

Cheers,

-- 
Anthony PERARD

