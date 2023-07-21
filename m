Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055375BEC9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567351.886279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjYf-00018Q-Pc; Fri, 21 Jul 2023 06:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567351.886279; Fri, 21 Jul 2023 06:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjYf-00015g-Lf; Fri, 21 Jul 2023 06:24:09 +0000
Received: by outflank-mailman (input) for mailman id 567351;
 Fri, 21 Jul 2023 06:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2N6Z=DH=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qMjYe-00015X-C7
 for xen-devel@lists.xen.org; Fri, 21 Jul 2023 06:24:08 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 318757f1-278f-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:24:07 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-263374f2f17so754919a91.0
 for <xen-devel@lists.xen.org>; Thu, 20 Jul 2023 23:24:06 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 gw15-20020a17090b0a4f00b00267bb769652sm1864958pjb.6.2023.07.20.23.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 23:24:04 -0700 (PDT)
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
X-Inumbo-ID: 318757f1-278f-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689920645; x=1690525445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Az5kk1wz6TEQ8ZYux94QCIBg5jaoSQ3XyOK3pt/uVU=;
        b=ErfbSFGxBRdKfJZZB0PxrB9pJNGQ1ZOQoUV1ThNTT8E03dbZIMlGEbWw1+f9HOLniz
         T0wkAD09y3Et76iMldpGq4YuwAds4R4ZnLHjFidjAnVHHnCykJ0dDvo0hApKCyLNjfnb
         LSCiXEN1fCbsJsnDJ932XVj8kii0QqV7lxIWevsAtpkTO+8uKxCwd5Q/uJcVP7z8kxLQ
         gVCV/69ieJON4pGAiZCLWbkIhvAZRZcmcvCGRcpVtBr7Brp/C9FUWIUmZNmlyOT0avZM
         sQ4JLA6Pck2H8hUpwD7RbR9rEz2hXdUhNkvzQnQ/H4k9YdX2Tlfup5MSFC0hKmo4WLqp
         N6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689920645; x=1690525445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Az5kk1wz6TEQ8ZYux94QCIBg5jaoSQ3XyOK3pt/uVU=;
        b=Vj0MeqkVyZAwhM8DZE9gX1TJRM71HZeWO3qMHG65hA/RSh1gp74u8+eQHAppISOAhG
         bcHjm9twQpQsOCUA384dLESgnhkVUy1tNtmZnYLVUvp4tSj4gdbvkZ8R8vGUnEpYtOIk
         C3FbTqY6qYMA5/NseYzebv09JP1uPNMuXxPFRYX9+u8rXprn3iK7X9/tJ5zFJJ7alOPK
         9+LsaU9JWLmI0YnotMiBDSWbW+FqeMPUS7GQWAECu+a97Q9tAp/E2dbGOjM8XY2byKps
         APtWIXOnjcrac2qJiN6MBrpKtEVpMicckaF7MG7vuyz5+0Pa6el9wLIbbJcfUNdN9Onx
         tFSA==
X-Gm-Message-State: ABy/qLb8H8WaYFsgBBDNB7xwK53spTPvVmIlm1ycA9zPtvhIFcgQQeV6
	NZJuVR3pCHn2JZDoNk2VnAbcBtq1sS8R1CH9tu4=
X-Google-Smtp-Source: APBJJlHvhwk8tK0AJfNOv37UPaKnGAsHdDsahuxcbUWOxbHjeFEO3/f/69W9xZNLuNfkFFfYQp1imQ==
X-Received: by 2002:a17:90a:474e:b0:262:fc42:c7bc with SMTP id y14-20020a17090a474e00b00262fc42c7bcmr617434pjg.32.1689920645384;
        Thu, 20 Jul 2023 23:24:05 -0700 (PDT)
Date: Fri, 21 Jul 2023 11:54:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH V4] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <20230721062402.bgu3hzcd33yrlfdg@vireshk-i7>
References: <144a57807d6f3e6c1e9b45215cb4fa5fa4535f10.1688628006.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <144a57807d6f3e6c1e9b45215cb4fa5fa4535f10.1688628006.git.viresh.kumar@linaro.org>

On 06-07-23, 12:59, Viresh Kumar wrote:
> Currently, the grant mapping related device tree properties are added if
> the backend domain is not Dom0. While Dom0 is privileged and can do
> foreign mapping for the entire guest memory, it is still desired for
> Dom0 to access guest's memory via grant mappings and hence map only what
> is required.
> 
> This commit adds the "grant_usage" parameter for virtio devices, which
> provides better control over the functionality.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> V3.1->V4:
> - Added Reviewed-by tags.
> - Other patches from the series are already applied.
> - No code changes.

Hi George / Nick,

Can you guys please review / ack this patch ?

-- 
viresh

