Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689194392E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 01:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769171.1180062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZIPH-0002NT-PI; Wed, 31 Jul 2024 23:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769171.1180062; Wed, 31 Jul 2024 23:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZIPH-0002Ln-La; Wed, 31 Jul 2024 23:06:55 +0000
Received: by outflank-mailman (input) for mailman id 769171;
 Wed, 31 Jul 2024 23:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZIPG-0002Lh-N6
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 23:06:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92e72a6e-4f91-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 01:06:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 372A162610;
 Wed, 31 Jul 2024 23:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF27DC116B1;
 Wed, 31 Jul 2024 23:06:50 +0000 (UTC)
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
X-Inumbo-ID: 92e72a6e-4f91-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722467211;
	bh=PkOc8I9izLpcBJQqDY2qVZGR8u1EN713/KAElmBIXJA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZnnT0Fy5hLQfGzorz4XufywR9RfUZELWb01UvzobzpZ387wAwvSvhYjy+WlJFkDTh
	 rjs50dLlxTUdqAhs4XeqEbs0R5KcUojnF1LScHsvkCLQDvvzG+NdNgL91UGYbXOZQV
	 FSwktlemCCH0e6XgSxTTrmAQ7dF9I3yKe6QFAaLM+tBHbOHH/+vlcljmKY3rsXusdy
	 MdpSWszMz9+8qPKBqNiF9VHV/BtMzQH5+CnVU3j/j+gpTk1BFHL4Yeexw0za8qi0kI
	 Qj2CdEOvWMtGzhKLv7yw10j4fjIbHRX/nQKEOQyZ07eBLd7c6nl17F9td9O0EmV6BJ
	 Zoa7y3gxHyieg==
Date: Wed, 31 Jul 2024 16:06:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [PATCH 2/3] xen/event: address violation of MISRA C Rule 13.6
In-Reply-To: <560a1207-2721-42cd-bd39-c83edca42c17@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407311603500.4857@ubuntu-linux-20-04-desktop>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com> <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com> <6e4b7711-5017-49a8-9f7d-e20c497f2561@suse.com> <560a1207-2721-42cd-bd39-c83edca42c17@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Jan Beulich wrote:
> On 01.07.2024 10:16, Jan Beulich wrote:
> > On 25.06.2024 12:14, Alessandro Zucchelli wrote:
> >> --- a/xen/include/xen/event.h
> >> +++ b/xen/include/xen/event.h
> >> @@ -183,13 +183,14 @@ static bool evtchn_usable(const struct evtchn *evtchn)
> >>  /* Wait on a Xen-attached event channel. */
> >>  #define wait_on_xen_event_channel(port, condition)                      \
> >>      do {                                                                \
> >> +        struct vcpu *v = current;                                       \
> > 
> > First: As recently indicated elsewhere, any new latching of "current" into
> > a local var should use "curr" or something derived from it (see below), not
> > "v".
> > 
> > Second: Macro local variables are at (certain) risk of colliding with outer
> > scope variables. Therefore the common thing we do is add an underscore.
> > Disagreement continues to exist for whether to prefix them or have them be
> > suffixes. An affirmative statement as to Misra's take on underscore-prefixed
> > variables in situations like these would be appreciated. Sadly what the C
> > standard has is somewhat tied to the C library, and hence leaves room for
> > interpretation (and hence for disagreement).
> 
> Why was this patch committed unchanged, considering the comments above?

Sorry, Jan. I didn't do it on purpose. Due to the code freeze, I added
this patch to my for-4.19 queue after acking it. Later, when you
provided your review comments, I forgot to remove the patch from my
for-4.19 queue.

If you want it can be reverted but it is easier if you send a small
incremental patch with your suggestion and I'll ack it straight away.

