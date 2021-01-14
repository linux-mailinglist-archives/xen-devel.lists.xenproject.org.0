Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9A2F6F00
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 00:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67549.120653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0CB0-0005Bf-MO; Thu, 14 Jan 2021 23:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67549.120653; Thu, 14 Jan 2021 23:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0CB0-0005BF-J3; Thu, 14 Jan 2021 23:37:14 +0000
Received: by outflank-mailman (input) for mailman id 67549;
 Thu, 14 Jan 2021 23:37:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3an=GR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0CAy-0005BA-FP
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 23:37:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f68bf3af-9d0a-447d-b7ca-2f39e6bb4736;
 Thu, 14 Jan 2021 23:37:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB99923107;
 Thu, 14 Jan 2021 23:37:10 +0000 (UTC)
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
X-Inumbo-ID: f68bf3af-9d0a-447d-b7ca-2f39e6bb4736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610667431;
	bh=9EM1q9u+kEjW53/DwEKAo9KjiRSZ68CiNJGu5zX6Asc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kVidsDc1iT0M+D1mE+gCNhGpd1FkzyYhwMLxDjU+IDjpw30s5hw60yHEDHW2dPwVC
	 KYQQhTGZS7Xpjg5ewUkOll5FUg6TbdDphD9YedBP5Imhlwk9yW3v+SKQ7U7HfyK2BB
	 YtErXyAPVsggXx4hisYB6eUzMsR4P0Od2pzn6MEeSq/BDWf5u0nJv080N1Mq4bXgXR
	 uXyj7KDLKzBIU6oYsEXjqknPyfXPH328Xnmr52L/4P7X9+R4XCg7MEPz1b5e5hjkas
	 oyyvo2Z9ORTMvQBEVR4qb/rQ4gVmecpQP5MFr87tUM9pQhq3+85M8F1/1hizSqE97X
	 R/CgNwHiajAnw==
Date: Thu, 14 Jan 2021 15:37:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] Arm: don't hard-code grant table limits in
 create_domUs()
In-Reply-To: <90ddf638-500f-0697-dcf7-6e8026af6e02@suse.com>
Message-ID: <alpine.DEB.2.21.2101141537030.31265@sstabellini-ThinkPad-T480s>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com> <90ddf638-500f-0697-dcf7-6e8026af6e02@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Jan 2021, Jan Beulich wrote:
> I can only assume that f2ae59bc4b9b ("Rationalize max_grant_frames and
> max_maptrack_frames handling") unintentionally left Arm's create_domUs()
> set limits to explicit values, as at least some of the same constraints
> apply here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2480,8 +2480,8 @@ void __init create_domUs(void)
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>              .max_evtchn_port = -1,
> -            .max_grant_frames = 64,
> -            .max_maptrack_frames = 1024,
> +            .max_grant_frames = -1,
> +            .max_maptrack_frames = -1,
>          };
>  
>          if ( !dt_device_is_compatible(node, "xen,domain") )
> 

