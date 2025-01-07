Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA609A04DBB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 00:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866818.1278177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJBy-0005a6-95; Tue, 07 Jan 2025 23:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866818.1278177; Tue, 07 Jan 2025 23:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJBy-0005Yk-63; Tue, 07 Jan 2025 23:40:58 +0000
Received: by outflank-mailman (input) for mailman id 866818;
 Tue, 07 Jan 2025 23:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVJBw-0005Ye-Mf
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 23:40:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d7e695-cd50-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 00:40:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD42B5C5642;
 Tue,  7 Jan 2025 23:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DADC4CED6;
 Tue,  7 Jan 2025 23:40:49 +0000 (UTC)
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
X-Inumbo-ID: d5d7e695-cd50-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736293251;
	bh=LbGXxHUlQV4fABGUwIoXOaBJigx3BRZt6winh1i3e1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LrHnNdHCy6HSQqbd1xYOGckXA74MhiGNRUj7Y3olnAADdWlG2gbJ8QBg2D20Er5JM
	 XQOgWbbzXT8lhjENl0EkBWby112MwwP9WPVlpR7yvhcGnwF3DaT4ZRrUsdLSm/rKL5
	 SLl09fZC2xF4+K0nfW1rRBK+zCzcNjJl80F970b5hlKvqpzg5Q5Ntxb/oVBRcv1oqk
	 Kr+WlqXa82gMOOyP73+6AzDLEenhAGIw5eYhEij9bcGXZEfu5UpEF9Iz0cEKCjJZqn
	 kxSXB1fXActDq+NiEdSm7Y/dscM+Raox01co58f0B42nYgM3UjM1JLhHFdZvD1hGD6
	 EHeN7aW11KKlw==
Date: Tue, 7 Jan 2025 15:40:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
In-Reply-To: <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com> <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com> <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop> <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jan 2025, Jan Beulich wrote:
> On 06.01.2025 19:48, Stefano Stabellini wrote:
> > On Mon, 6 Jan 2025, Jan Beulich wrote:
> >> On 04.01.2025 05:15, Denis Mukhin wrote:
> >>>
> >>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
> >>>
> >>>>
> >>>>
> >>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> >>>>
> >>>>> From: Denis Mukhin dmukhin@ford.com
> >>>>>
> >>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> >>>>>
> >>>>> The call is used in NS8250 emulator to identify the case when physical xen
> >>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
> >>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
> >>>>
> >>>>
> >>>> Such messages ought to be processed through guest_printk(), which wants a
> >>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
> >>>> current->domain anyway at the callsite, eliminating the need for such a
> >>>>
> >>>> helper altogether?
> >>>
> >>> If the current domain is owning the physical console and printing, say, Linux
> >>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> >>> can be disabled from Xen command line.
> >>
> >> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> >> which domain a message came from. As long as only Dom0 messages are left un-
> >> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> >> messages (and have console "focus") I think the prefix needs to be there.
> > 
> > It looks like we are aligned on the desired behavior,
> 
> Hmm, no, I don't think we are. I don't ...
> 
> > but for clarity,
> > see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> > here:
> > 
> > I think we should provide a consistent behavior across architectures.
> > The current behavior with vpl011 and dom0less on ARM is the following:
> > 
> > - no prefix for Dom0 output
> > - DOM$NUM for DomUs when not in focus, otherwise no prefix
> 
> ... view this model as a desirable one. It leaves room for ambiguity.

Adding a few more people in CC for feedback.

My priority is to keep the architectures aligned. It might be OK to
change output format, but then let's do it uniformly on ARM as well.

Jan, please clarify what you think would be better than the above. Is it
the following? I don't think I understood your preference.

- DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix

