Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4C9F017B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 02:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856410.1269037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLu5c-00042k-4s; Fri, 13 Dec 2024 01:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856410.1269037; Fri, 13 Dec 2024 01:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLu5c-00040i-1W; Fri, 13 Dec 2024 01:03:32 +0000
Received: by outflank-mailman (input) for mailman id 856410;
 Fri, 13 Dec 2024 01:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLu5b-0003yQ-3o
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 01:03:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fcdfc7f-b8ee-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 02:03:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 04BA05C6837;
 Fri, 13 Dec 2024 01:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329D6C4CECE;
 Fri, 13 Dec 2024 01:03:26 +0000 (UTC)
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
X-Inumbo-ID: 0fcdfc7f-b8ee-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734051807;
	bh=3xPTfmKW4cdEXh1DvWzkX62caVcxgnWWlm2oAQ6TZLg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ak9DOEZhU6epsRWlcW9d2T9yahtHl0rUhpXk3kTIrfhKFT5ccuRiKHbOW5sPSeHMY
	 Hc9d1Ql1FlW9RetF0EJAdQXNfSMOyjERAXbbN99eCoHqaYNOrkvsfj3q5BXY4j7kHr
	 WiZj7nAmu9MBgqV3DPyQARSKJl61n+7tKi6W7gr7O0FTbrrsLoTprelT4oZNkJEo8A
	 3dTC8V44oFznZX7o2sM0mV74wmyU4W93RCXZWZfwSpuZGX+D+Pn/ABxp5jla1wOkRa
	 ZSt+AKV8zNeQeXSmiUg4+bs/MhAa2H8JtPod7HVO4+boc7Bl08Mync19hiGeVX2AFn
	 nXFk4KFfL4a2g==
Date: Thu, 12 Dec 2024 17:03:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
In-Reply-To: <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com>
Message-ID: <alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com> <Z1qpk55qKBywx26R@macbook.local> <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com> <Z1rT3lsr9B0dy-Jr@macbook.local>
 <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1813960475-1734051411=:463523"
Content-ID: <alpine.DEB.2.22.394.2412121659550.463523@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1813960475-1734051411=:463523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2412121659551.463523@ubuntu-linux-20-04-desktop>

On Thu, 12 Dec 2024, Jan Beulich wrote:
> On 12.12.2024 13:15, Roger Pau Monné wrote:
> > On Thu, Dec 12, 2024 at 12:57:25PM +0100, Jan Beulich wrote:
> >> On 12.12.2024 10:14, Roger Pau Monné wrote:
> >>> On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
> >>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> Introduce new printk() variant for convenient printouts which skip '(XEN)'
> >>>> prefix on xen console. This is needed for the case when physical console is
> >>>> owned by a domain w/ in-hypervisor UART emulation enabled.
> >>>
> >>> IIRC the ns8250 can only send or receive one byte (character) at a
> >>> time, so you should likely put that on the console as soon as it's
> >>> received?
> >>>
> >>> For the hardware domain we explicitly don't buffer writes to the
> >>> console (see guest_console_write() hardware domain special handling).
> >>>
> >>> I wonder however how you deal with domains that don't have the console
> >>> focus (ie: != console_rx), as for those I think you still want to use
> >>> the (d<domid>) prefix?
> >>
> >> Imo no matter what domain has the focus, the (d<domid>) prefix should
> >> always be logged. Just to avoid possible confusion.
> > 
> > WE don't do that currently for the hardware domain, because we avoid
> > doing any kind of line processing, as characters from the hardware
> > domain are send straight to the console without waiting for the
> > newline terminator (like we do for other domains).
> 
> Right, and that's kind of special, and aiui intentionally so. These are
> the only un-prefixed lines logged.

I think we should provide a consistent behavior across architectures.
The current behavior with vpl011 and dom0less on ARM is the following:

- no prefix for Dom0 output
- DOM$NUM for DomUs when not in focus, otherwise no prefix

It is OK to change this behavior, but in that case I would ask that we
change it consistently also for ARM.


> > Are you suggesting that in case of the console input being shared
> > between multiple domains they should all be treated as plain domUs and
> > thus lines should be buffered?
> 
> No, I'm actually not suggesting anything here beyond perhaps reducing
> the scope of this series to just what the equivalent of vpl011 would be
> for the 8250 / 16550 case.

I agree with this
--8323329-1813960475-1734051411=:463523--

