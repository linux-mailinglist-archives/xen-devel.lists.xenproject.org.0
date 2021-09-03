Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049C3FFCBB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 11:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177948.323745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM5C4-0004Fv-KV; Fri, 03 Sep 2021 09:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177948.323745; Fri, 03 Sep 2021 09:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM5C4-0004E4-HI; Fri, 03 Sep 2021 09:09:04 +0000
Received: by outflank-mailman (input) for mailman id 177948;
 Fri, 03 Sep 2021 09:09:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KfKZ=NZ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1mM5C2-0004Dy-7D
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 09:09:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9401bf88-0c96-11ec-aefe-12813bfff9fa;
 Fri, 03 Sep 2021 09:09:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22EDB60FA0;
 Fri,  3 Sep 2021 09:08:59 +0000 (UTC)
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
X-Inumbo-ID: 9401bf88-0c96-11ec-aefe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630660140;
	bh=DcjjJ2WAyz1ejKxh5caZx2UjPxskQXotN1KC+CVTphM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXVe52q+2qENaWaDMiNqezmL4BsUWssD8bJgO6b/o7VEIMHLNCgzHRygULaFTLwRR
	 oGz0JvrwOuCyWgZZPRJsgjb88aE0JCr9iBHnqDnHyutHvuocaJmuo0+o0dzEvLEmh3
	 rgQwV9xE7s8/DBL80QGApRESQeCjgwrWCZXPWS2g=
Date: Fri, 3 Sep 2021 11:08:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	"Rafael J. Wysocki" <rafael@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] PM: base: power: don't try to use non-existing RTC
 for storing data
Message-ID: <YTHmKvYz5j8ZT9Jt@kroah.com>
References: <20210903084937.19392-1-jgross@suse.com>
 <20210903084937.19392-2-jgross@suse.com>
 <YTHjPbklWVDVaBfK@kroah.com>
 <1b6a8f9c-2a5f-e97e-c89d-5983ceeb20e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b6a8f9c-2a5f-e97e-c89d-5983ceeb20e5@suse.com>

On Fri, Sep 03, 2021 at 11:01:58AM +0200, Juergen Gross wrote:
> On 03.09.21 10:56, Greg Kroah-Hartman wrote:
> > On Fri, Sep 03, 2021 at 10:49:36AM +0200, Juergen Gross wrote:
> > > In there is no legacy RTC device, don't try to use it for storing trace
> > > data across suspend/resume.
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/base/power/trace.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
> > > index a97f33d0c59f..b7c80849455c 100644
> > > --- a/drivers/base/power/trace.c
> > > +++ b/drivers/base/power/trace.c
> > > @@ -13,6 +13,7 @@
> > >   #include <linux/export.h>
> > >   #include <linux/rtc.h>
> > >   #include <linux/suspend.h>
> > > +#include <linux/init.h>
> > >   #include <linux/mc146818rtc.h>
> > > @@ -165,6 +166,9 @@ void generate_pm_trace(const void *tracedata, unsigned int user)
> > >   	const char *file = *(const char **)(tracedata + 2);
> > >   	unsigned int user_hash_value, file_hash_value;
> > > +	if (!x86_platform.legacy.rtc)
> > > +		return 0;
> > 
> > Why does the driver core code here care about a platform/arch-specific
> > thing at all?  Did you just break all other arches?
> 
> This file is only compiled for x86. It depends on CONFIG_PM_TRACE_RTC,
> which has a "depends on X86" attribute.

Odd, and not obvious at all :(

Ok, I'll let Rafael review this...

