Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466C63839A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 06:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448067.704893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyRWl-0008Eh-8G; Fri, 25 Nov 2022 05:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448067.704893; Fri, 25 Nov 2022 05:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyRWl-0008BN-5M; Fri, 25 Nov 2022 05:45:31 +0000
Received: by outflank-mailman (input) for mailman id 448067;
 Fri, 25 Nov 2022 05:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nyqr=3Z=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oyRWi-0008BG-UZ
 for xen-devel@lists.xen.org; Fri, 25 Nov 2022 05:45:28 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cacda09-6c84-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 06:45:27 +0100 (CET)
Received: by mail-pf1-x42d.google.com with SMTP id z26so3254267pff.1
 for <xen-devel@lists.xen.org>; Thu, 24 Nov 2022 21:45:27 -0800 (PST)
Received: from localhost ([122.172.85.60]) by smtp.gmail.com with ESMTPSA id
 b5-20020a170902650500b0018869119e37sm2328119plk.142.2022.11.24.21.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 21:45:24 -0800 (PST)
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
X-Inumbo-ID: 5cacda09-6c84-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HZ8OUJUAq25bYOAIiGC3xhCTFKen4gp0/1QuhpI3ug=;
        b=vJXbU7afS6b52El5psHWXltrmjmnpXo50qDyOJ4aXP70VwW+DGoxRAdnyDIION2Joy
         NCqSRs+wDhWnE0Z/c64UI1dFQUqjYSjFSHdk5/JA6m/rSmtQN6mkkQT4SMRWm7yr2+BQ
         OGbFrNAf/j5wAuLtoquFn//dVBOZQDLGjdkaiQxwYxZkg/bkRP6+Qi1tVKu/YQnwCeVu
         W0EYqyx3Sgc/c813Q4eN69V1pIfxHaBdMxu4bu1cPuUux3fnsm5zqmzz+sx7DqT+ChC4
         HyJ08lAUCnoKZbzIjAIVIc8gCb2Ro88ciunLPW+uubVlfwMO2wst3bi/NsIGs34B8tT4
         0UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HZ8OUJUAq25bYOAIiGC3xhCTFKen4gp0/1QuhpI3ug=;
        b=F/rp28axO3+eWmdmakd1th/4NStEwfNypF25FMQESarqCB40bUz6q6HmBCV7MiHiQV
         CSYJA73o4W93gqlOhGMM2dcmGpzauYEjP25sWqG4xwooXmgMIPhSIR5mrTWr2rxlWmfa
         87IQ8xQUclxY3PtDmCdooLQGaw1WHoWKPd/etJpUdpvkOOb+4rgPxgCdIaSWyABjyMWM
         SMSgrKNDMhpqb6+DLvFXFocT0zvUA3DHGEnZgDwgv8B8YgVKeGWWEuBZRQM5MVxQM3+W
         Y6Qh4CqJTPjuTtMITAYbz5D/aSmyb5oPDpHA2P0ZfBZWvvqc+Xfbsuu0li1cC9XtmeOk
         fmkA==
X-Gm-Message-State: ANoB5pnrXmGUwICOTUJFQ+FU6MPAbB6MNcJYmQ3hqikC8cGonj/9tcVB
	wsdd198XFXwQO6KxAax6iesEEg==
X-Google-Smtp-Source: AA0mqf4ymq5C33EZdr6vCJxDT/zQ7MTjvkv4t47ZDCpH7FHl4DrCIgNxPI2e1gulAK+aORL8EMn2ig==
X-Received: by 2002:a65:6c11:0:b0:477:2bc0:f1b with SMTP id y17-20020a656c11000000b004772bc00f1bmr14735885pgu.566.1669355125810;
        Thu, 24 Nov 2022 21:45:25 -0800 (PST)
Date: Fri, 25 Nov 2022 11:15:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xen.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Message-ID: <20221125054522.wjsv3lcb5tdk2dd5@vireshk-i7>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
 <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>
 <20220920102915.p55lt4ee5hbxiun2@vireshk-i7>
 <a4907928-d3a2-f555-c30d-66aee18b2a62@xen.org>
 <4bb29058-3133-bc66-ea33-8077f91a473b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb29058-3133-bc66-ea33-8077f91a473b@xen.org>

On 24-11-22, 20:19, Julien Grall wrote:
> Unfortunately, we had some delay for releasing 4.17. So I have pushed this
> series in a branch for-next/4.18.

Thanks.

> This will be applied to staging once the
> tree has re-opened.

I don't see the branch here though. Is it not public yet ? Or should I be
looking at a different tree ?

https://github.com/xen-project/xen

-- 
viresh

