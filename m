Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1EF3FFC6A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177928.323712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4zz-0001FB-Sc; Fri, 03 Sep 2021 08:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177928.323712; Fri, 03 Sep 2021 08:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4zz-0001D0-PG; Fri, 03 Sep 2021 08:56:35 +0000
Received: by outflank-mailman (input) for mailman id 177928;
 Fri, 03 Sep 2021 08:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KfKZ=NZ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1mM4zy-0001Cu-43
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:56:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d610c1c8-0c94-11ec-aefe-12813bfff9fa;
 Fri, 03 Sep 2021 08:56:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1B3161051;
 Fri,  3 Sep 2021 08:56:31 +0000 (UTC)
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
X-Inumbo-ID: d610c1c8-0c94-11ec-aefe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630659392;
	bh=SsjjbztlEwoQ2/FB20kOEWlK/4U11FZMfaPIS5UzwPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIACXt/YT6pWCqM1ZXgIK14DP/a+8b2wZJAtH533JTB7bHiNh5hQjPgWr4l844+Hp
	 fsqjfJdlFyq4d5jAQMavIFBifH1me5UlrWLbbRy3fBUFxN2leYC9fYTFblIYrARotV
	 Weq2nXrRWULvKRmXB2e4DIi5A9/LS26+/JVxSY+U=
Date: Fri, 3 Sep 2021 10:56:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	"Rafael J. Wysocki" <rafael@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] PM: base: power: don't try to use non-existing RTC
 for storing data
Message-ID: <YTHjPbklWVDVaBfK@kroah.com>
References: <20210903084937.19392-1-jgross@suse.com>
 <20210903084937.19392-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903084937.19392-2-jgross@suse.com>

On Fri, Sep 03, 2021 at 10:49:36AM +0200, Juergen Gross wrote:
> In there is no legacy RTC device, don't try to use it for storing trace
> data across suspend/resume.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/base/power/trace.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
> index a97f33d0c59f..b7c80849455c 100644
> --- a/drivers/base/power/trace.c
> +++ b/drivers/base/power/trace.c
> @@ -13,6 +13,7 @@
>  #include <linux/export.h>
>  #include <linux/rtc.h>
>  #include <linux/suspend.h>
> +#include <linux/init.h>
>  
>  #include <linux/mc146818rtc.h>
>  
> @@ -165,6 +166,9 @@ void generate_pm_trace(const void *tracedata, unsigned int user)
>  	const char *file = *(const char **)(tracedata + 2);
>  	unsigned int user_hash_value, file_hash_value;
>  
> +	if (!x86_platform.legacy.rtc)
> +		return 0;

Why does the driver core code here care about a platform/arch-specific
thing at all?  Did you just break all other arches?

thanks,

greg k-h

