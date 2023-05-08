Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E96F9E96
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 06:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531234.826788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvsBq-00007a-RO; Mon, 08 May 2023 04:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531234.826788; Mon, 08 May 2023 04:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvsBq-00004s-Ns; Mon, 08 May 2023 04:09:34 +0000
Received: by outflank-mailman (input) for mailman id 531234;
 Mon, 08 May 2023 04:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Frh6=A5=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pvsBq-0008WS-4O
 for xen-devel@lists.xen.org; Mon, 08 May 2023 04:09:34 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2235c1b5-ed56-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 06:09:32 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-24e4e23f378so2820130a91.3
 for <xen-devel@lists.xen.org>; Sun, 07 May 2023 21:09:32 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 y22-20020a17090abd1600b00246b7b8b43asm16729893pjr.49.2023.05.07.21.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:09:30 -0700 (PDT)
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
X-Inumbo-ID: 2235c1b5-ed56-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683518971; x=1686110971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2IiV5e2VeZOoaD5QZ3Kdrzs73EZjFRQz5WCvDTUYTQ=;
        b=L7ROSK+H7ZSYsOSTbYcv7GKTQOIjgRDDWt0LF9LyA7zPvb1jjZYcG37nzKo4rmxnPQ
         hNPYJIx/4bYOZB6CBKybMKdZcSFh6O1mWZy4O+/oWnHS1YaUySWNhJg2V0DvGZwMN2RU
         iW3byJVF5+dOtacAdUcY14b5aSDamahwbgEK5szN7BXvu37jYc25H7LXqUK6uMmvctxJ
         56u0RSz1aOeykvTTSFZuChNR7+8fcO7PpJj81P9qHRjgxIh/C1eSmmwIu5DqZUb4E8dY
         zlZBTnjNF5QZl3HY/PK6ldU697nWVGDoB9Qv1tuF0VVDl73npG3LubwZYH19WQP4X5av
         YTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683518971; x=1686110971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2IiV5e2VeZOoaD5QZ3Kdrzs73EZjFRQz5WCvDTUYTQ=;
        b=dKSGgHTeXu2YZRCPFaVYXb0zItSmiO6mPFxcW9KPps9/K1hroI7d5IMsdq6u+1gM/x
         83MAlo5t8YY+L0WpixLFVVRyYRIJGEhfD4K1CbcFtOKwKshnCcl0SA601kEt4/IvU144
         1KzSjgNXZkLvYiqS9Hi+o950Vdkdcl0/oqrJ6Atd2b8n1h3/t5TZtD53KBsU9+RcYouD
         ZaZCTcsI7r7q4M0DQdMrZPGI8it02u8Da/h6323b2lBjzxyCHDKk3/ryxFrwKhaMftu1
         unQHlbdqeV3Gdc59bZ3/+IDwWe8xGm46WJjuG0Vq+gPSY9Tdh+0fVr4xEJZjTZMW7TKm
         ZZLg==
X-Gm-Message-State: AC+VfDwFKH4b81FZptpgcQniuithMkhvZSS9r31HuDZQClHK2JjyBfqa
	wmxzurrpOlUNl7I9ZiOHvxYVFg==
X-Google-Smtp-Source: ACHHUZ58x2dVjYWbAJEc7OvaS/dGnIyhye24/cjjOgFWN2/xdIp+Ti0FF7hm+UNLovjV+LqfHUE7pg==
X-Received: by 2002:a17:90a:5581:b0:24d:f159:d28b with SMTP id c1-20020a17090a558100b0024df159d28bmr8905534pji.47.1683518970803;
        Sun, 07 May 2023 21:09:30 -0700 (PDT)
Date: Mon, 8 May 2023 09:39:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
	stratos-dev@op-lists.linaro.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <20230508040927.uhgwfkhknwyvsowu@vireshk-i7>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
 <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
 <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
 <CAPD2p-nvLXdxkwik-UPjS1JAjz6z2FNuxb1JYrj4bNwusEZpPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-nvLXdxkwik-UPjS1JAjz6z2FNuxb1JYrj4bNwusEZpPg@mail.gmail.com>

On 05-05-23, 16:11, Oleksandr Tyshchenko wrote:
> I was going to propose an idea, but I have just realized that you already
> voiced it here [1] ))
> So what you proposed there sounds reasonable to me.
> 
> I will just rephrase it according to my understanding:
> 
> We probably need to consider transforming your "forced_grant" to something
> three-state, for example
> "grant_usage" (or "use_grant" as you suggested) which could be "default
> behaviour" or "always disabled", or "always enabled".
> 
> With "grant_usage=default" we will get exact what we have at the moment
> (only create iommu nodes if backend-domid != 0)
> With "grant_usage=disabled" we will force grants to be always disabled
> (don't create iommu nodes irrespective of the domain)
> With "grant_usage=enabled" we will force grants to be always enabled
> (always create iommu nodes irrespective of the domain)

I was wondering if "grant_usage=default" can be interpreted by the
absence of the grant_usage parameter. So just grant_usage=1 or 0,
which would mean enabled or disabled and if grant_usage isn't passed,
we would switch back to default.

-- 
viresh

