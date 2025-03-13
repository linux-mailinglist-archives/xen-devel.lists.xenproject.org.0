Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC62A603AB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 22:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913516.1319526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsqRT-0002lV-LV; Thu, 13 Mar 2025 21:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913516.1319526; Thu, 13 Mar 2025 21:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsqRT-0002j2-IQ; Thu, 13 Mar 2025 21:50:15 +0000
Received: by outflank-mailman (input) for mailman id 913516;
 Thu, 13 Mar 2025 21:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsqRS-0002ik-ED
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 21:50:14 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20fbec89-0055-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 22:50:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20397A474DA;
 Thu, 13 Mar 2025 21:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623E2C4CEDD;
 Thu, 13 Mar 2025 21:50:05 +0000 (UTC)
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
X-Inumbo-ID: 20fbec89-0055-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741902606;
	bh=s5cLNJyEF71YwOacS0m5LRQE8gUPryZNQhMoG87OCFM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p2GXscTfcfUFBcCZjJLRELah6baM1iZLfJBkUa738KDBZxzYn/pSEzAKye6gL70Pl
	 CBABnND2BwTEMYpGFO9+C3vZn9CGA46aj3wCEOlQ5F7FnKv1X5jWyccFc63UxfEgon
	 +QNqeGA8+g0ndzPXmHaYQY/I70D8rJFY1I8p9uLNcpVbzgYZk/rECGrllMVsZc5n6F
	 0MqgK6SQXZa8jIWkmivKp6h2OJOHhU+jsflvIqoVFvc+L2frp9TVbjsZ82oXF5u4Pq
	 6gpxq0brd9O7fqmmclVQKECuQx/4XO0T+OSurBqEypa/DFr1vWvlE3s1Xl2dHy320O
	 UKZqoKQjj3AYg==
Date: Thu, 13 Mar 2025 14:50:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH v1 06/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
In-Reply-To: <9e16ecd8-97e1-4633-9961-183d053f5f00@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503131449590.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-7-Penny.Zheng@amd.com> <alpine.DEB.2.22.394.2503121610510.3477110@ubuntu-linux-20-04-desktop> <9e16ecd8-97e1-4633-9961-183d053f5f00@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Jan Beulich wrote:
> On 13.03.2025 00:12, Stefano Stabellini wrote:
> > On Wed, 12 Mar 2025, Penny Zheng wrote:
> >> perfc_control() and perfc_copy_info() are responsible for providing control
> >> of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
> >> be wrapped.
> >>
> >> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >> ---
> >>  xen/common/perfc.c      | 2 ++
> >>  xen/include/xen/perfc.h | 8 ++++++++
> >>  2 files changed, 10 insertions(+)
> >>
> >> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> >> index 8302b7cf6d..0f3b89af2c 100644
> >> --- a/xen/common/perfc.c
> >> +++ b/xen/common/perfc.c
> >> @@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
> >>      }
> >>  }
> >>  
> >> +#ifdef CONFIG_SYSCTL
> > 
> > I think in this case it would be best to make CONFIG_PERF_COUNTERS
> > depending on CONFIG_SYSCTL. The consequence is that without
> > CONFIG_SYSCTL, xen/common/perfc.c will be disabled in the build.
> 
> But perf counters can be used without sysctl, via the dedicated debug
> keys.

I checked the code, and you are right, please ignore my comment here,
and also the similar comment to the next patch


