Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F82DFA38
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 10:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57336.100328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krH47-0001dy-3s; Mon, 21 Dec 2020 09:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57336.100328; Mon, 21 Dec 2020 09:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krH47-0001dZ-08; Mon, 21 Dec 2020 09:01:15 +0000
Received: by outflank-mailman (input) for mailman id 57336;
 Mon, 21 Dec 2020 09:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krH46-0001dU-4Y
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 09:01:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4360ffe8-ca25-412a-b9ea-642194376e0a;
 Mon, 21 Dec 2020 09:01:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 871DDACF5;
 Mon, 21 Dec 2020 09:01:11 +0000 (UTC)
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
X-Inumbo-ID: 4360ffe8-ca25-412a-b9ea-642194376e0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608541271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPJmhEHMAFHj5aIX4oFLhaRuz2/VupPkpipNhRSKeEo=;
	b=dqcdiHWAQB3eAuvYHupI6q2I/NgW1YRXzn6+UtNtFh9gNnYiPgZqYNzgNV85o0Buvg32ET
	vox9Z6u4cCSTSMl0aqdLVs7jnvC7aMXd+0ZxnSMCx4Eud+tszZ8nPDY14dJFPgYAbf+TVx
	zTx+/Qe4SQkjSGRkYdUNt6FYN6FgfvQ=
Subject: Re: [XEN PATCH 3/3] docs: set date to SOURCE_DATE_EPOCH if available
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1608319634.git.maxi@daemonizer.de>
 <23352f4835ae58c5cae6f425d5a8378f3d694055.1608319634.git.maxi@daemonizer.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c3edc91-7d22-289f-575b-9fd3c2ec4bc8@suse.com>
Date: Mon, 21 Dec 2020 10:01:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <23352f4835ae58c5cae6f425d5a8378f3d694055.1608319634.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.12.2020 21:42, Maximilian Engelhardt wrote:
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
>  -include $(XEN_ROOT)/config/Docs.mk
>  
>  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
> -DATE		:= $(shell date +%Y-%m-%d)
> +
> +DATE_FMT	:= +%Y-%m-%d
> +ifdef SOURCE_DATE_EPOCH
> +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u "$(DATE_FMT)")

Looking at the doc for a (deliberately) old "date", I can't find
any mention of the -d "@..." syntax. I take it the command would
fail on that system. It would then go on to try the -r variant,
which has entirely different meaning on GNU (Linux) systems.

docs/ being subject to configuring, why don't you determine the
capabilities of "date" there and invoke just the one command
that was found suitable for the system?

Jan

