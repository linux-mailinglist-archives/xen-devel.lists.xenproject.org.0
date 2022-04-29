Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE56514124
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 05:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316939.536035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkHmt-0007RX-Bf; Fri, 29 Apr 2022 03:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316939.536035; Fri, 29 Apr 2022 03:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkHmt-0007Pa-7O; Fri, 29 Apr 2022 03:59:23 +0000
Received: by outflank-mailman (input) for mailman id 316939;
 Fri, 29 Apr 2022 03:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FbCp=VH=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nkHms-0007PU-9A
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 03:59:22 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf652929-c770-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 05:59:21 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so6214650pjm.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 20:59:21 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 gw20-20020a17090b0a5400b001cd4989fee5sm12178852pjb.49.2022.04.28.20.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 20:59:19 -0700 (PDT)
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
X-Inumbo-ID: bf652929-c770-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oCrSxnAZqQfOSqNt8oa74aLKF77ckW2txQTjvHW0lrY=;
        b=AjXUwFFcgo5WGPbVJYlIQupUvT7GbE6qbJXvsfDu4z+iwKoBsPFC07vOXjK/Qb/auN
         o/VY5FcJ3xcuMHMfRvJTZHqQhGf6D9OW7y3JZ5Wj1/I+PKUkwZFusoSy83btxj36x+P4
         TI0l9duk7kQORW9hXSok50CEDc7pEGZmop+ZN2yNerlCv5BmreZxqKZ2U8inyylr3M4+
         BrYiJ2O97OTbQMPD8zIidYk+NSkukDHib1pof9uWSn7TJiWeVaydhP6mmE9U5CGtXYEm
         NuDmG1K/nlXNyEHvznp7T1q6Wx9nrbbeRhole3J3s09wh6+g0hoZTcBQw6WozWt7SY9R
         Kt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oCrSxnAZqQfOSqNt8oa74aLKF77ckW2txQTjvHW0lrY=;
        b=QAp8MR7j77rSlsAFcHwvkRwI+bOzYe9Nl4kfY23URqx7KXv83iuLy2qjMbPwmqSni9
         NUGl0OjOm1R+JyNH/uMRL8G4jQqPtTt9DrNYtWmFnAAM7avK7RsDcZRaZTwy7kMrf6f3
         ZblPfBkk4xKYBJ0I8ohygJwou3Mtulh0YyDKunMse4Da+lLdWvToFfuaw5Z9KZiXU5dR
         QWH5fLzfBYCdJUK5Pm2aUXihWwdanvWPLdyvv+ZHCXQoGSOJHhgP3s1IIE/rMOGLP0gw
         A49R2xn/D2aW5rO2TvbayH6sXTwRv0RCIBOVfLuazcs1nxIpT6xZGI6s2DQ7gHn/fuKV
         lFdw==
X-Gm-Message-State: AOAM531ey6ZJSt1wlGBYZsA9BxRxbgw7zdy2QDwSaajFwydEwKy1/t/g
	becwpsqXA7ZZRCx8YoE2ro9mHg==
X-Google-Smtp-Source: ABdhPJyxxC3NG5a2FYFCVGTGEgZPjpgalWTx3Y9qSFmR/nMhSP/S6O3tbgUkTL1IvLUTN22eRP1rkA==
X-Received: by 2002:a17:90b:3ec3:b0:1c7:24c4:e28f with SMTP id rm3-20020a17090b3ec300b001c724c4e28fmr1755466pjb.191.1651204759772;
        Thu, 28 Apr 2022 20:59:19 -0700 (PDT)
Date: Fri, 29 Apr 2022 09:29:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220429035917.xu5ecgldwzfnxbos@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220429034808.dr647727dphnx6zk@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429034808.dr647727dphnx6zk@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52

On 29-04-22, 09:18, Viresh Kumar wrote:
> Now, it was just yesterday that I started looking into MMIO modern stuff as the
> GPIO device needs it and you sent me working code to look how to do it as well.
> You saved at least 1-2 days of my time :)

One question though, do we need to support Legacy mode at all in the work we are
doing ?

-- 
viresh

