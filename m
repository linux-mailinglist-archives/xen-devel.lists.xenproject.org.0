Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976B2E08EF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57744.101149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfD8-0003H8-3M; Tue, 22 Dec 2020 10:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57744.101149; Tue, 22 Dec 2020 10:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfD8-0003Gl-0T; Tue, 22 Dec 2020 10:48:10 +0000
Received: by outflank-mailman (input) for mailman id 57744;
 Tue, 22 Dec 2020 10:48:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krfD6-0003Gg-6x
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:48:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id badf59dd-fb57-4e9c-ae4b-352a362a3bb1;
 Tue, 22 Dec 2020 10:48:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C896EACF5;
 Tue, 22 Dec 2020 10:48:05 +0000 (UTC)
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
X-Inumbo-ID: badf59dd-fb57-4e9c-ae4b-352a362a3bb1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608634085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZoL2rsTifyl5gcYQ924cRQHepySA47J03hS6iIRqvD8=;
	b=GOBLt7dLjfmVwj4/FQwTDbmcNZcMtuydfl8OF1HN/lRw6fWdrwcvbaA4/WtyKU9POSAbg1
	Vo/bETsq402PS+fy6ftk+u5UhaQmVIoy7KYTSDSP/aEWOjC7cLG9Wh4AYp22umYPhWwpWs
	Gz4EedAMDPx5CVw5sU0Cn7Tx/w7t+vw=
Subject: Re: [PATCH 3/3] xen/evtchn: Clean up teardown handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
Date: Tue, 22 Dec 2020 11:48:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221181446.7791-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.12.2020 19:14, Andrew Cooper wrote:
> First of all, rename the evtchn APIs:
>  * evtchn_destroy       => evtchn_teardown
>  * evtchn_destroy_final => evtchn_destroy

I wonder in how far this is going to cause confusion with backports
down the road. May I suggest to do only the first of the two renames,
at least until in a couple of year's time? Or make the second rename
to e.g. evtchn_cleanup() or evtchn_deinit()?

> RFC.  While testing this, I observed this, after faking up an -ENOMEM in
> dom0's construction:
> 
>   (XEN) [2020-12-21 16:31:20] NX (Execute Disable) protection active
>   (XEN) [2020-12-21 16:33:04]
>   (XEN) [2020-12-21 16:33:04] ****************************************
>   (XEN) [2020-12-21 16:33:04] Panic on CPU 0:
>   (XEN) [2020-12-21 16:33:04] Error creating domain 0
>   (XEN) [2020-12-21 16:33:04] ****************************************
> 
> XSA-344 appears to have added nearly 2 minutes of wallclock time into the
> domain_create() error path, which isn't ok.
> 
> Considering that event channels haven't even been initialised in this
> particular scenario, it ought to take ~0 time.  Even if event channels have
> been initalised, none can be active as the domain isn't visible to the system.

evtchn_init() sets d->valid_evtchns to EVTCHNS_PER_BUCKET. Are you
suggesting cleaning up one bucket's worth of unused event channels
takes two minutes? If this is really the case, and considering there
could at most be unbound Xen channels, perhaps we could avoid
calling evtchn_teardown() from domain_create()'s error path? We'd
need to take care of the then missing accounting (->active_evtchns
and ->xen_evtchns), but this should be doable.

Jan

