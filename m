Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C91AF668E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 02:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031633.1405439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX7gF-0001jU-AW; Thu, 03 Jul 2025 00:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031633.1405439; Thu, 03 Jul 2025 00:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX7gF-0001hc-7l; Thu, 03 Jul 2025 00:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1031633;
 Thu, 03 Jul 2025 00:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uX7gE-0001hW-6L
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 00:19:58 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69174121-57a3-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 02:19:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84965456FD;
 Thu,  3 Jul 2025 00:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4A7C4CEE7;
 Thu,  3 Jul 2025 00:19:37 +0000 (UTC)
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
X-Inumbo-ID: 69174121-57a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751501979;
	bh=WaUNJ7vyK+9f6FAeo2H8gSwfXPxCJHmO6PKRHf/W978=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PPaH8y1g+9mTI5kwM3jcso4ojhUgWYnrRCUJ1z1Qdq2ShD9cEQEQeuZttn5YehnE0
	 kkBuZiIVX5QogcY4ZP3hAk56OrHorpPcxjj5gjHOMUr/JRUqgITnsZ3uvW6/6ummCr
	 PtFAtdcJHi81dDqebOeNlgWIyTaXkRlPFkdPi1O3AwSC/nq1kWTjdBpDyBDkqdR6s2
	 +DemTPjRxQ8QQ7o/2WEgB5vkw6lGi3VFesUMqFb/6FFlObk7ZcD0JTrDH78IUjxJga
	 whWDeZ+8r0cgjXhr4tSZQh8PawEO8SA5pwG+HV49urf5krwgwDDcZXWPNGXdBxk/lt
	 gNCK9+gS4I6rg==
Date: Wed, 2 Jul 2025 17:19:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <adc8f96c-6aad-4d67-9e78-118a29a58bce@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507021719300.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGKnDHtRD5OLGaYj@macbook.local> <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop> <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop> <aGTZK0YmBTvGmNQr@macbook.local> <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com> <aGTtJTTbEkYvnMq6@macbook.local> <adc8f96c-6aad-4d67-9e78-118a29a58bce@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Jul 2025, Orzel, Michal wrote:
> > Hm, that's up to the ARM folks, but my opinion is that you should
> > simply ignore memory above the threshold.  Panicking should IMO be a
> > last resort option when there's no way to workaround the issue.
> On Arm we handle user errors and suspicious behavior usually as panics as oppose
> to x86 which is more liberal in that regard. We want to fail as soon as possible.

If we think about it, this is natural because Xen on ARM was mostly
aimed at embedded developers configuring an embedded system. Embedded
developers might not be Xen experts but they are typically engineers.
These people would definitely want to know if part of the memory was
ignored, and might be able to write a fix.

On the other hand Xen on x86 was aimed at non-expert users -- people
apt-get'ing Xen on a Debian system. These people wouldn't know how to
read a panic so we would certainly want to boot anyway even with only
partial resources.

This has worked well so far, but now we are getting x86 in embedded and
ARM on servers, so I think we should discuss and agree on a common
pattern or a configurable pattern to handle this kind of situations.

