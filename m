Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECB7433A6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 06:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557264.870458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF5w3-0007ea-By; Fri, 30 Jun 2023 04:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557264.870458; Fri, 30 Jun 2023 04:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF5w3-0007bI-96; Fri, 30 Jun 2023 04:40:43 +0000
Received: by outflank-mailman (input) for mailman id 557264;
 Fri, 30 Jun 2023 04:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqRh=CS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qF5w1-0007b7-Gm
 for xen-devel@lists.xen.org; Fri, 30 Jun 2023 04:40:41 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41fc59c1-1700-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 06:40:38 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b6824141b4so8732995ad.1
 for <xen-devel@lists.xen.org>; Thu, 29 Jun 2023 21:40:37 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 h18-20020a63f912000000b0051b36aee4f6sm9578389pgi.83.2023.06.29.21.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 21:40:35 -0700 (PDT)
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
X-Inumbo-ID: 41fc59c1-1700-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688100036; x=1690692036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmit/twBMrzWwi7L3OpjitdhPWaDSjPsJTJfNb+d58k=;
        b=y6ZL3thjcaG4ajVS/+wOgya21yT/YbEwEDKpG1ykVcm3j69SysPKs/3id2TY1j17kc
         s3SYa4prY1VFf6yHtr6jFIvub+o5SweVA6PE1V922hS3gVwT7bafamZ7QI3baDetARIq
         OhRaTVd1edasKX6QqH1aV21WzcyZiDBomtgzZH3RetPX8u6/LKpYeZAgKCX0IqKWOfxv
         CCtXhon/eobWpOAMyWEVxCxOt9TInzp3SvtI2HJ6ABIPvq6kgunHI4x9OqFMLQGHWabe
         H3LD2JS97DOeHjBRois8vlDO4QnarNvjxMue8PdYxvFO2eRSgIyqtSEvmRwSVjm327mN
         QvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688100036; x=1690692036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmit/twBMrzWwi7L3OpjitdhPWaDSjPsJTJfNb+d58k=;
        b=O59MLA0rfjrG96Wthyp+j64bOTNlJ/ytq/71eQlp9lYyVeCG02go3cuyytHHWV1CPV
         YvNhCsAXizNeQuWBnXQO0OdTnfU+/Klk5BgkB3x6t1kuTULg2Onj0K8Aflq/3OZg0Ob1
         V83cC3o429aTITr6d4m+haGP7OljOhjkjxz8ECfJDiC5hRwVvqk+dRUImUN3hYcJ7va0
         mJM23jYAAfFtfyIJcdMiYQS/PTVi4aitZii13H27nba6N5GCgtpFqzJaF5DR0wZNzmiQ
         6Jh4KYjI9Mlm+HUYY/rhMY4O1Aq/Bt7+a7kKobe0GIryXBVjdEQe5xG+8pDg4/3nt54h
         Zs5Q==
X-Gm-Message-State: ABy/qLb9cdWwG2NY2oYZ8JwaoYSe7VanqsdEy030HHlEXJYBrErfT3ch
	pTqawPwW9E0EqCjpJBubk0iq1Q==
X-Google-Smtp-Source: APBJJlGv8w3ciRMXHJvtBmHFO/36mp7Iucp6FvgADARZGWm0Z700GpZe8M0KdI2MGV8h0pbD2/kahA==
X-Received: by 2002:a17:902:d48c:b0:1b8:6984:f5e5 with SMTP id c12-20020a170902d48c00b001b86984f5e5mr2314410plg.12.1688100036273;
        Thu, 29 Jun 2023 21:40:36 -0700 (PDT)
Date: Fri, 30 Jun 2023 10:10:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH V3.1] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <20230630044032.khorme7rnlgzvl2u@vireshk-i7>
References: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
 <7a0afe5aebba4c0b5be43a517dedf41d4e4ddd57.1686636036.git.viresh.kumar@linaro.org>
 <ecf753b0-3ccd-461a-925a-f3bac49dd269@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf753b0-3ccd-461a-925a-f3bac49dd269@perard>

On 13-06-23, 11:48, Anthony PERARD wrote:
> On Tue, Jun 13, 2023 at 11:32:16AM +0530, Viresh Kumar wrote:
> > Currently, the grant mapping related device tree properties are added if
> > the backend domain is not Dom0. While Dom0 is privileged and can do
> > foreign mapping for the entire guest memory, it is still desired for
> > Dom0 to access guest's memory via grant mappings and hence map only what
> > is required.
> > 
> > This commit adds the "grant_usage" parameter for virtio devices, which
> > provides better control over the functionality.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V3->V3.1:
> > - Print "0" or "1" in xenstore instead of "True" or "False" for grant_usage.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Hi,

I still don't see this patch pushed upstream. Are we waiting for some
release to happen ?

Thanks.

-- 
viresh

