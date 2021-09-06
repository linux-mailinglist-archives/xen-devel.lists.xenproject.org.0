Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB547401EE9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 19:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180126.326630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNI64-0004Er-Is; Mon, 06 Sep 2021 17:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180126.326630; Mon, 06 Sep 2021 17:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNI64-0004CC-Ej; Mon, 06 Sep 2021 17:07:52 +0000
Received: by outflank-mailman (input) for mailman id 180126;
 Mon, 06 Sep 2021 17:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYSO=N4=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1mNI62-0004C6-MP
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 17:07:50 +0000
Received: from mail-ot1-f45.google.com (unknown [209.85.210.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6eb9e84-0f34-11ec-b0b0-12813bfff9fa;
 Mon, 06 Sep 2021 17:07:49 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so9471479otf.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Sep 2021 10:07:49 -0700 (PDT)
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
X-Inumbo-ID: f6eb9e84-0f34-11ec-b0b0-12813bfff9fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++LIn4BzMT/yfmvrIHegIKxrKLsnvbzGkInouRJvYyc=;
        b=CokLebOuvCoJE4SwzVfhnpNJLez5olRg6cY8guhMYST2+xtcuOhn9gOrGTmKNBiXYq
         2lIUy1t3Qpr9lujq2Ux5CDSV6l/07ylN7DaD8pStMUBwZySwCq38+9pEWKfwtZgZ9Btq
         LCGiCkOOXozqkUbyH69kTt4wHrQYYuejV2YYvJpT6ZS8K2yfBY8w/BsDaYe0rVngEQAb
         OlzNE0BpEb0OXqHtUZ0Rgb4Ye56PyvfwUyZlzQEzHyLCSqVPHZUGgxMaVr6ophtvRpyT
         Ct0LPhOvI3Yasw7bTp2gxAgsybNm9pY5O1RxX8dzFu0GSX27wVSC46bmRqBQzV8Xqn4W
         1Gmg==
X-Gm-Message-State: AOAM533/DDBU4FFnz44WAx6aYHbFFwl3uPsfBxoUXZRC7T9XxDKH9LVa
	DDgZJOiNjpkPI8GFk9eOhuyUoG86/bOimuszkps=
X-Google-Smtp-Source: ABdhPJxFe+shqvt53iInVBtVbEwgHxwTsvQqM7BZ8tlMMEWr+cag6cxnMCqsopLy1hSSKR9VzP0DVY4VLq48C4xu4fg=
X-Received: by 2002:a9d:4d93:: with SMTP id u19mr11579566otk.86.1630948068687;
 Mon, 06 Sep 2021 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210903084937.19392-1-jgross@suse.com> <20210903084937.19392-2-jgross@suse.com>
 <YTHjPbklWVDVaBfK@kroah.com> <1b6a8f9c-2a5f-e97e-c89d-5983ceeb20e5@suse.com>
In-Reply-To: <1b6a8f9c-2a5f-e97e-c89d-5983ceeb20e5@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 Sep 2021 19:07:37 +0200
Message-ID: <CAJZ5v0g_WVFqDKCBYnoPtqR5VzH-eBMk+7M1bAmgGsyX0XGpgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM: base: power: don't try to use non-existing RTC
 for storing data
To: Juergen Gross <jgross@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, xen-devel@lists.xenproject.org, 
	Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 11:02 AM Juergen Gross <jgross@suse.com> wrote:
>
> On 03.09.21 10:56, Greg Kroah-Hartman wrote:
> > On Fri, Sep 03, 2021 at 10:49:36AM +0200, Juergen Gross wrote:
> >> In there is no legacy RTC device, don't try to use it for storing trace
> >> data across suspend/resume.
> >>
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   drivers/base/power/trace.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
> >> index a97f33d0c59f..b7c80849455c 100644
> >> --- a/drivers/base/power/trace.c
> >> +++ b/drivers/base/power/trace.c
> >> @@ -13,6 +13,7 @@
> >>   #include <linux/export.h>
> >>   #include <linux/rtc.h>
> >>   #include <linux/suspend.h>
> >> +#include <linux/init.h>
> >>
> >>   #include <linux/mc146818rtc.h>
> >>
> >> @@ -165,6 +166,9 @@ void generate_pm_trace(const void *tracedata, unsigned int user)
> >>      const char *file = *(const char **)(tracedata + 2);
> >>      unsigned int user_hash_value, file_hash_value;
> >>
> >> +    if (!x86_platform.legacy.rtc)
> >> +            return 0;
> >
> > Why does the driver core code here care about a platform/arch-specific
> > thing at all?  Did you just break all other arches?
>
> This file is only compiled for x86. It depends on CONFIG_PM_TRACE_RTC,
> which has a "depends on X86" attribute.

This feature uses the CMOS RTC memory to store data, so if that memory
is not present, it's better to avoid using it.

Please feel free to add

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

to this patch or let me know if you want me to take it.

