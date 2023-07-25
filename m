Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7A760C30
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569490.890308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCgc-0000FV-Ap; Tue, 25 Jul 2023 07:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569490.890308; Tue, 25 Jul 2023 07:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCgc-0000Cw-8A; Tue, 25 Jul 2023 07:42:26 +0000
Received: by outflank-mailman (input) for mailman id 569490;
 Tue, 25 Jul 2023 07:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXT9=DL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qOCga-0000Cq-Uw
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:42:25 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c36b04-2abe-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 09:42:17 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b8ad8383faso39858095ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 00:42:22 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 l20-20020a170903005400b001b8a85489a3sm10254527pla.262.2023.07.25.00.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 00:42:20 -0700 (PDT)
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
X-Inumbo-ID: c6c36b04-2abe-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270941; x=1690875741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kewmDoSwKZcyBAfVPaIo9+Biv1FObKhjKX+FUtEeF3k=;
        b=PA+fK6qXbHqYwEPVsLMv/2Ju1Mxrp9vScm/JmrJ7HPHfkOnZsCfnzfbxllwJPkxjV1
         Hk+IVr0kEUHskUZVuUq0VBT5mNuJxc96HduKH0ezuRL7do8qgxgB5SJUIfF82pObwC+h
         DXogbpdgn4C88+PsK3UNW0ZRNiXMoH9yh1/8x+wkMS5HtFRThUCrNALaEnu6+1tC3zjg
         oljAojsu5/XpZUccb55Q7m1LgEJwQk8oQLqFk4Gtsd0p8otmccReDMDX0k/dXvdfJYN+
         1LRWKACoE9ytjmLGfZfsjzn8+flAvCFYSQ/A1/Xt8FrfiBLsq+M0dwuZn/P5E3gUNYnN
         GI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270941; x=1690875741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kewmDoSwKZcyBAfVPaIo9+Biv1FObKhjKX+FUtEeF3k=;
        b=LJJhh8yc7HGeLql0kdqrQd9Cb4muObHHDn5ihhAg5dgXFtdCQTUUev1ehTixn4uOqK
         yE8FWAHibu8tx7wDvBIAOaBGZj4gbSegI3uwBPIQHn4MO1rF3D6USJAhsIiqMSyHaa7b
         VamQsceiUMe/QMqrlqs6mFkloREFt1b3Mp8kLJoJludZGu9Wat5yoL1O3OXnE5xF/JRp
         2SLyBQbBja5heQBGimQkA8VW74LEkF+RdreU2bkupYqqvirx/8SUYWmbNkfy1Fd0UrjE
         wlwX9mecTLA5yBzM0lYS16081NAzEVfgEnU/O2KR3xAT7wwXOdEXs7Z2yOnT2Rq2lr2V
         EIdg==
X-Gm-Message-State: ABy/qLbex5FyhFa6vZetdIfZfgF/cg3ulyUyR7GrfWE8Aimh03ArCTby
	OZtnaAKatytcVuaHreD+pgjHUA==
X-Google-Smtp-Source: APBJJlHHSoNX8d5INhseTullEgrqBEXbHGAfAD9IQElyfVzOxJEv7mdJAxFRTer6Win8HqYFlgHQew==
X-Received: by 2002:a17:903:2341:b0:1b8:a31b:ac85 with SMTP id c1-20020a170903234100b001b8a31bac85mr15445663plh.41.1690270941395;
        Tue, 25 Jul 2023 00:42:21 -0700 (PDT)
Date: Tue, 25 Jul 2023 13:12:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 1/2] xen: Update dm_op.h from Xen public header
Message-ID: <20230725074218.zcgbkkx5pfgszimu@vireshk-i7>
References: <ffae9d7021829fea19fd93fda3c30b52b0af923e.1690190453.git.viresh.kumar@linaro.org>
 <1498bef6-ded0-1b1f-a5ca-e8755800b489@suse.com>
 <20230725070914.m3dxlokedrgjlgcu@vireshk-i7>
 <3770f13f-0621-48af-4c79-880a0ffaa8a6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3770f13f-0621-48af-4c79-880a0ffaa8a6@suse.com>

On 25-07-23, 09:18, Jan Beulich wrote:
> I question that use, btw, but it is not up to me to decide whether to
> accept such a layering violation in Linux. dm-op is, as its name says,
> for device models to use. Your intended use doesn't fall in that
> category, aiui. Imo the present contents of dm_op.h in Linux is indeed
> all a kernel is supposed to know about, unless it was to gain in-kernel
> device models.

Is there any other way by which an interrupt can be raised for the
guest VM ? I was only aware of this method and so implemented it like
this.

I am open to suggestions on this.

-- 
viresh

