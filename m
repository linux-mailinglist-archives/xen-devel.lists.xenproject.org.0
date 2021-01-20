Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE62FCCF5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 09:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71257.127459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29CN-00041G-8Y; Wed, 20 Jan 2021 08:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71257.127459; Wed, 20 Jan 2021 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29CN-00040t-4y; Wed, 20 Jan 2021 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 71257;
 Wed, 20 Jan 2021 08:50:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l29CL-00040o-HL
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:50:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fce69ced-2a64-4e82-9918-48573af26e12;
 Wed, 20 Jan 2021 08:50:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6009FADA2;
 Wed, 20 Jan 2021 08:50:38 +0000 (UTC)
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
X-Inumbo-ID: fce69ced-2a64-4e82-9918-48573af26e12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611132638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mEg8jOhABGGSMZP0cbPaGtMCxb7AHEGZaDSbWAvqWo=;
	b=TqG8s0JDqvAh/GsFskdJUzBbOHwbPbI8jGOuaGVy3w7La6eM5y0+zvpW48xem52du/W48H
	Bo8ZyaFK74biMk0i04g957frEV2Cua5UlSnResJmo62UAY3WNzsfZY42aDN8ksBd9xiCDb
	nZz+LDCpMr6iePDjnW+oHc4z/heaY4k=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
Date: Wed, 20 Jan 2021 09:50:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.01.2021 20:36, Claudemir Todo Bom wrote:
> I do not have serial output on this setup, so I recorded a video with
> boot_delay=50 in order to be able to get all the kernel messages:
> https://youtu.be/y95h6vqoF7Y

This doesn't show any badness afaics.

> This is running 4.14 from debian bullseye (testing).
> 
> I'm also attaching the dmesg output when booting xen 4.8 with  the same
> kernel version and same parameters.
> 
> I visually compared all the messages, and the only thing I noticed was that
> 4.14 used tsc as clocksource and 4.8 used xen. I tried to boot the kernel
> with "clocksource=xen" and the problem is happening with that also.

There's some confusion here I suppose: The clock source you talk
about is the kernel's, not Xen's. I didn't think this would
change for the same kernel version with different Xen underneath,
but the Linux maintainers of the Xen code there may know better.
Cc-ing them.

> The "start" of the problem is that when the kernel gets to the "Freeing
> unused kernel image (initmem) memory: 2380K" it hangs and stays there for a
> while. After a few minutes it shows that a process (swapper) is blocked for
> sometime (image attached)

Now that's pretty unusual - the call trace seen in the screen
shot you had attached indicates the kernel didn't even make it
past its own initialization just yet. Just to have explored that
possibility - could you enable Xen's NMI watchdog (simply
"watchdog" on the Xen command line)? Among the boot messages
there ought to be one indicating whether it actually works on
your system. Without a serial console you wouldn't see anything
if it triggers, but the system would then never make it to the
kernel side issue.

As far as making sure we at least see all kernel messages -
are you having "ignore_loglevel" in place? I don't think I've
been able to spot the kernel command line anywhere in the video.

I'm afraid there's no real way around seeing the full Xen
messages, i.e. including possible ones while Dom0 already boots
(and allowing some debug keys to be issued, as the rcu_barrier
on the stack may suggest there's an issue with one of the
secondary CPUs). You could try whether "vag=keep" on the Xen
command line allows you to see more, but this option may have
quite severe an effect on the timing of Dom0's booting, which
may make an already bad situation worse.

Alternatively the kernel may need instrumenting to figure what
exactly it is that prevent forward progress.

There's one other wild guess you may want to try: "cpuidle=no"
on the Xen command line.

Jan

