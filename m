Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1E303C04
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74896.134677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Mpu-0005lm-7s; Tue, 26 Jan 2021 11:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74896.134677; Tue, 26 Jan 2021 11:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Mpu-0005lN-4A; Tue, 26 Jan 2021 11:48:42 +0000
Received: by outflank-mailman (input) for mailman id 74896;
 Tue, 26 Jan 2021 11:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Mps-0005lF-Mi
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:48:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0062c2a-5f0d-4553-89f4-d103ce073abe;
 Tue, 26 Jan 2021 11:48:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0186BAD26;
 Tue, 26 Jan 2021 11:48:39 +0000 (UTC)
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
X-Inumbo-ID: f0062c2a-5f0d-4553-89f4-d103ce073abe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611661719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oz7g8qoZY8PrhZnJSxXOsLFZUOCx5zKaGygUcbErUQ=;
	b=pYwyR7IdCP86CVuH/wiJNXbcjyfA6F6r8hNGFadNRleMm0T8YUvbA7KfTt4dxcK4b4mxOC
	LMfS/JXRZGf+pBFM7FG6T3wIsh+Ix1wbPiUY3bs5o72jGA26TS4WXogEplFxCCPiiwnIpK
	UDdmUgfuB0PsX26O/BE/9oEcQ9VRpnY=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
Date: Tue, 26 Jan 2021 12:48:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:37, Claudemir Todo Bom wrote:
> I've managed to get the debug messages on the screen using
> vga=text-80x50,keep and disabling all messages from the kernel. Two
> images are attached with the output running the debug patch.

And the 1st of them (161303) was taken at the time of the hang of
the kernel (or entire system), not any earlier? I ask because one
part of the reason for the patch was to understand whether the
rendezvousing itself would fail in some way (like one of the CPUs
not calling in).

Were new log messages (from the debugging patch) still issued at
this point, showing Xen itself was still alive?

The 2nd of the pictures (162313) at least clarifies that indeed
the commit in question had a functional effect on this system,
because of

(XEN) TSC warp detected, disabling TSC_RELIABLE

I still can't figure though why the change in rendezvous handling
(from "std" to "tsc") would have broken your system.

> About the version I've used to test: since the 4.14 shows that other
> bug with the detection of cpu features I mentioned on the other
> subthread, I chose to work on 4.11 that doesn't shows that behaviour.
> 
> Calling with clocksource on the xen command line changed nothing.

Oh, right, because the specific feature that causes the change
of rendezvous functions for you also is a prereq for that mode
of operation.

> I don't know if this part of code is intended to execute a lot of
> times, but when starting with dom0_max_vcpus=1, the system boots up
> and keeps showing the messages.

When there's just one CPU, there's no CPU to rendezvous with.

Iirc you did say that you observe the hang even with as little
as 2 CPUs? The problem the above quoted message is supposed to
address is normally coming into play only on multi-socket
systems. Yet from your initial report I deduce this is a
single socket system. So in the end I suppose there are two
problems - one is the hang, and the other is that your system
gets diagnosed as having an unreliable TSC (at least I didn't
think Xeon E5 v2 should have a problem there).

I will want to extend the debugging patch, but I'd like to
have clarification on some of the points above first.

Jan

