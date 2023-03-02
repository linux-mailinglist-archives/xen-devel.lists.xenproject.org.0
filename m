Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176B6A7C69
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 09:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504420.777057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXe9i-000684-E5; Thu, 02 Mar 2023 08:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504420.777057; Thu, 02 Mar 2023 08:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXe9i-00066D-BB; Thu, 02 Mar 2023 08:19:14 +0000
Received: by outflank-mailman (input) for mailman id 504420;
 Thu, 02 Mar 2023 08:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIcZ=62=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pXe9h-00065q-EE
 for xen-devel@lists.xen.org; Thu, 02 Mar 2023 08:19:13 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e42011-b8d2-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 09:19:12 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id d6so9317409pgu.2
 for <xen-devel@lists.xen.org>; Thu, 02 Mar 2023 00:19:11 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 y25-20020aa78559000000b00592543d7363sm9074120pfn.1.2023.03.02.00.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:19:09 -0800 (PST)
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
X-Inumbo-ID: e8e42011-b8d2-11ed-96a9-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677745150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsj4gw8eOT9LdA+6gyH7R3o0TvSBiMHhi7t9smJowvY=;
        b=IsclPXqWTvxt+u5b6NFskrmfGclkpWk4a/ZTYtCmxpRtx3zzHDwIFW4L3patPoUJpi
         qqi7aUVbGkX9rgYQUC3wVCt3DbZZtx5Iryp1Ef7e6fag9CGAf6Knt8dHDNdhvi4cVVfu
         xqZjtntaYWSvostbEOnvIGnFtLnMCpB9QufKEHaa2oS1t2YBuVhlfz4ZrpqgiNGxoDpD
         VVWAtbRJe6WuttJrG8/BN2s9IPObAFnKmywuTVldPCf+sxf1o4+wSdew/K2eLKEEtN8N
         ukT110CYb5jzUeLn5DWTbrkSlMS8EVQV3CUcnVqpocdKCSxNIYS0vrHa7S10r2JQ92kP
         tQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677745150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsj4gw8eOT9LdA+6gyH7R3o0TvSBiMHhi7t9smJowvY=;
        b=FdLlHnPPAaOyMg5aVPHO1JaNgxjiaJaM/IQPIkX3bsombn7IjjO9YSsbuWCscklJWD
         XPSH9o9H3ovuWBF9mkCd+YGCZURnwX3npnsozcva8jSmO/EQI65bqn9GbiB7iep62QAY
         OSnEl+xmRVX7UILQjw+xRglB04JZjICzj/4YRKcD9PDzMfOpxKB+HzJB8B10dtLZ6gfO
         wmuZdhqO5sudYBqF3sEgsLhrmkVDPaIBqXoNQfkF30Ji5bv1jISYGx/nQfJqdl43DIOj
         mZAMgbd8baj85b38Vs6VCAK22M52JfDhevxeRuow1GjWNgW9gk2ccHkxdCROlQTv3H5F
         Ed0g==
X-Gm-Message-State: AO0yUKW5lx0GARrAfyoTrI54VEYDdFzyQ/D4u6Bq0ZZ+ZGAba1V832Nh
	saukrhg8jLBCt3Hs/J0mckwA+g==
X-Google-Smtp-Source: AK7set/R/7m2YH2OxVBgHgIHB3sQI/WMTf6qYCSQuViRUx1uXw/vsbHB8XOHZu3eZC8ih4eXLUxj+Q==
X-Received: by 2002:a05:6a00:a81:b0:5a8:aa5e:4bc3 with SMTP id b1-20020a056a000a8100b005a8aa5e4bc3mr1878722pfl.1.1677745149672;
        Thu, 02 Mar 2023 00:19:09 -0800 (PST)
Date: Thu, 2 Mar 2023 13:49:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <20230302081907.pwt4nvz5buyt2dz3@vireshk-i7>
References: <Y/9zkDAS4odz93GM@fedora>
 <877cw0ctpr.fsf@linaro.org>
 <Y/+LdfF0rL3wEqfd@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/+LdfF0rL3wEqfd@fedora>

On 01-03-23, 12:29, Stefan Hajnoczi wrote:
> What is the advantage over defining separate messages? Separate messages
> are cleaner and more typesafe.

I thought we wanted to keep single message for one kind of functionality, which
is mmap related quirks here. And so it would be better if we can reuse the same
for next hypervisor which may need this.

The value parameter is not fixed and is hypervisor specific, for Xen this is the
domain id, for others it may mean something else.

> I don't have a concrete example, but was thinking of a guest that shares
> memory with other guests (like the experimental virtio-vhost-user
> device). Maybe there would be a scenario where some memory belongs to
> one domain and some belongs to another (but has been mapped into the
> first domain), and the vhost-user back-end needs to access both.

These look tricky (and real) and I am not sure how we would want to handle
these. Maybe wait until we have a real use-case ?

> The other thing that comes to mind is that the spec must clearly state
> which mmaps are affected by the Xen domain information. For example,
> just mem table memory regions and not the
> VHOST_USER_PROTOCOL_F_LOG_SHMFD feature?

Maybe we can mention that only the mmap's performed via /dev/xen/privcmd and
/dev/xen/gntdev files are affected by this ?

-- 
viresh

