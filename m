Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742AA069EE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 01:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867776.1279336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVgQV-0006sZ-U9; Thu, 09 Jan 2025 00:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867776.1279336; Thu, 09 Jan 2025 00:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVgQV-0006pQ-Rf; Thu, 09 Jan 2025 00:29:31 +0000
Received: by outflank-mailman (input) for mailman id 867776;
 Thu, 09 Jan 2025 00:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVgQU-0006pK-27
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 00:29:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91ea98d-ce20-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 01:29:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01653A41BFE;
 Thu,  9 Jan 2025 00:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C2EC4CED3;
 Thu,  9 Jan 2025 00:29:25 +0000 (UTC)
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
X-Inumbo-ID: c91ea98d-ce20-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736382567;
	bh=IIqr0lHZ77ykQRBHLyibMtNl34jVLEAjKiUPfwxxQSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kufbni08r2/VvD6QfrFueMrZJ8iTVIkprKXA8l4w6I5n/IKUBTuKoOpsAPSrHZfsc
	 9EfqEc5c9pzVAHZUi6/eGBW2NFL0cawviKERo4HrJ3hqKBL5OameIw89tzOMRxq+uP
	 bBKKFgtF79xM1KcF3OkHzYzPNensBpSwg27UJjsWWahNgU+AfRXBZYqkoz/ScV9kpZ
	 86JvhH2/VucOb6oDpTxluj1NgSFn8l+IlJBrzfHBMk4J4raeoB3lJ/TVE6zHDJ3I9M
	 AVSDaM3jr7Galq0vf0sQkuNqdOUm+OWcQZ9tLW4wCvW8ARyNnLub3Tc0FVpNjFNRhL
	 3u0c5PqyKPOfg==
Date: Wed, 8 Jan 2025 16:29:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
In-Reply-To: <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
Message-ID: <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com> <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop> <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop> <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com> <Z34xhkNu5YLyEzut@macbook.local> <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com> <Z344xgqtpNZIDxHD@macbook.local>
 <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-610742799-1736382567=:133435"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-610742799-1736382567=:133435
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Jan 2025, Denis Mukhin wrote:
> On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
> > > On 08.01.2025 09:04, Roger Pau Monné wrote:
> > > > On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
> > > > > On 08.01.2025 00:40, Stefano Stabellini wrote:
> > > > > > On Tue, 7 Jan 2025, Jan Beulich wrote:
> > > > > > > On 06.01.2025 19:48, Stefano Stabellini wrote:
> > > > > > > > On Mon, 6 Jan 2025, Jan Beulich wrote:
> > > > > > > > > On 04.01.2025 05:15, Denis Mukhin wrote:
> > > > > > > > > > On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich jbeulich@suse.com wrote:
> > > > > > > > > > > On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> > > > > > > > > > > 
> > > > > > > > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > > > > > > > > 
> > > > > > > > > > > > console_owner_domid() is introduced to obtain the "console owner" domain ID.
> > > > > > > > > > > > 
> > > > > > > > > > > > The call is used in NS8250 emulator to identify the case when physical xen
> > > > > > > > > > > > console focus is owned by the domain w/ NS8250 emulator, in which case,
> > > > > > > > > > > > messages from guest OS are formatted w/o '(XEN)' prefix.
> > > > > > > > > > > 
> > > > > > > > > > > Such messages ought to be processed through guest_printk(), which wants a
> > > > > > > > > > > domain pointer, not a domid_t anyway. Plus isn't that going to be
> > > > > > > > > > > current->domain anyway at the callsite, eliminating the need for such a
> > > > > > > > > > > 
> > > > > > > > > > > helper altogether?
> > > > > > > > > > 
> > > > > > > > > > If the current domain is owning the physical console and printing, say, Linux
> > > > > > > > > > login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> > > > > > > > > > can be disabled from Xen command line.
> > > > > > > > > 
> > > > > > > > > Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> > > > > > > > > which domain a message came from. As long as only Dom0 messages are left un-
> > > > > > > > > prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> > > > > > > > > messages (and have console "focus") I think the prefix needs to be there.
> > > > > > > > 
> > > > > > > > It looks like we are aligned on the desired behavior,
> > > > > > > 
> > > > > > > Hmm, no, I don't think we are. I don't ...
> > > > > > > 
> > > > > > > > but for clarity,
> > > > > > > > see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> > > > > > > > here:
> > > > > > > > 
> > > > > > > > I think we should provide a consistent behavior across architectures.
> > > > > > > > The current behavior with vpl011 and dom0less on ARM is the following:
> > > > > > > > 
> > > > > > > > - no prefix for Dom0 output
> > > > > > > > - DOM$NUM for DomUs when not in focus, otherwise no prefix
> > > > > > > 
> > > > > > > ... view this model as a desirable one. It leaves room for ambiguity.
> > > > > > 
> > > > > > Adding a few more people in CC for feedback.
> > > > > > 
> > > > > > My priority is to keep the architectures aligned. It might be OK to
> > > > > > change output format, but then let's do it uniformly on ARM as well.
> > > > > > 
> > > > > > Jan, please clarify what you think would be better than the above. Is it
> > > > > > the following? I don't think I understood your preference.
> > > > > > 
> > > > > > - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
> > > > > 
> > > > > No, I mean like we have it with guest_printk() today. (XEN) for Xen's
> > > > > own messages, (d<N>) for ordinary domains' ones, and no prefix
> > > > > exclusively for the hardware/control domain. What is best to do when
> > > > > hardware and control domains are distinct I'm uncertain - I'd be
> > > > > inclined to suggest that the hardware domain then stay the one without
> > > > > any prefix.
> > > > 
> > > > One concern I have with this approach is whether the addition of the
> > > > (d<N>) prefixes will skew output of interactive applications. So far
> > > > the prefix is added to output from all domains different than dom0
> > > > because the console is not interactive for them, and hence no input
> > > > can be consumed.
> > > 
> > > Hmm, that's an aspect I have to admit I didn't think of.
> > > 
> > > > If that changes however, and domains different than dom0 can get input
> > > > from the Xen console then I wonder how much the added prefix will skew
> > > > output. Another possible option would be to not print the prefix for
> > > > the domain that has the console input assigned (current target), and
> > > > print it for all other domains (even for dom0 when not in focus).
> > > 
> > > That's largely what aiui was proposed. My extra requirement there would
> > > then be that we make sure a log message is always emitted when console
> > > focus shifts, so it's possible to identify the owner for any part of
> > > the log.
> > 
> > 
> > Indeed, printing console input shifting should be a requirement
> > regardless of how we decide to print the prefix.
> 
> Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
> [[
> ...
> (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch input)
> (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switch input)
> (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switch input)
> ...
> ]]


Roger, Jan, you should use Xen Dom0less more :-) This is the way it
already works on ARM. Let me expand on my earlier message that was too
terse.

At boot time, Xen prints messages with the (XEN) prefix as usual:

(XEN) Brought up 4 CPUs

When Dom0 starts, it has not prefix (and has input by default):

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]

When a DomU starts, it has the following prefix (and doesn't have
input):

(XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]


Eventually, both Linuxes finish booting, you can login into Dom0 as
usual. Messages from Dom1, if any, are still printed with (XEN) DOM1 as
prefix.

You can switch input to Dom1 with Ctrx-aaa, the same way that you do
today to switch between Xen and Dom0. Xen prints a message:

(XEN) *** Serial input to DOM1 (type 'CTRL-a' three times to switch input)

Now, as you type, you send characters to Dom1. And Dom1 doesn't have the
DOM1 prefix any longer, while it is still has (XEN) because the message
is printed by Xen on behalf of the domain:

(XEN) / # echo hello world
(XEN) hello world

If Dom0 prints anything in the backgrounds, it shows without prefixes:

hello world from dom0

If another domain, dom2, prints anything in the background, it shows
with (XEN) DOM2 prefix:

(XEN) DOM2: hello from dom2

I think it makes sense to be consistent across architectures and we
should default to the same behavior on x86 too. If we want to make
improvements, the one thing I could potentially see changing is adding a
DOM0 prefix to Dom0 messages when Dom0 does not have input. If we do
that, let's do it on both ARM and x86 architectures.

Cheers,
Stefano
--8323329-610742799-1736382567=:133435--

