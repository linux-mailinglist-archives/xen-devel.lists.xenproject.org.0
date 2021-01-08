Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBB2EEB1C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 02:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63165.112167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxguc-0007hY-LP; Fri, 08 Jan 2021 01:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63165.112167; Fri, 08 Jan 2021 01:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxguc-0007hB-I5; Fri, 08 Jan 2021 01:49:58 +0000
Received: by outflank-mailman (input) for mailman id 63165;
 Fri, 08 Jan 2021 01:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxgua-0007h6-LR
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 01:49:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 645fb9a5-0695-4c44-92c5-e9ce637e206e;
 Fri, 08 Jan 2021 01:49:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8583723435;
 Fri,  8 Jan 2021 01:49:54 +0000 (UTC)
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
X-Inumbo-ID: 645fb9a5-0695-4c44-92c5-e9ce637e206e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610070595;
	bh=c//G4/JeheFGqwfhAaIOF1BRXynRCOB+vWwQTT/INpI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nHyS2UZ6li2j82jBfylpWqF49owZxkWnUTkFTl2zLXBMzsvn+GiSuI7k1a6ToZEKa
	 dd9S5cZHBnoQEsSsHYosNGvRi7HEJxPdzZZU1EQUa7JHUefAMFEbMHCM2j20bOjYKY
	 V7Nz1el5A/MFzaLjLheWgdA0sBvOcRpm1c4kp1A947IDu1TIG3Xa6HPK8pPTqWO7Ky
	 USIW+lIXqkowC1KVmRC3R5qlIbAH5GQeD4zntvFiPYk67v1wiMOJFnxzTCKxVkTmZi
	 467jqiJ9H38mUNN5/ZBL5RcRSwutZS28oedMPzQJR1fSx0oS5mi4S70rBZae2LTOAS
	 f7G19LFjPuu4g==
Date: Thu, 7 Jan 2021 17:49:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault
 injection
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.21.2101071630480.7075@sstabellini-ThinkPad-T480s>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Dec 2020, Andrew Cooper wrote:
> This was not the christmas hacking project that I was planning to do, but it
> has had some exciting results.
> 
> After some discussion on an earlier thread, Tamas has successfully got fuzzing
> of Xen working via kfx, and this series is a prototype for providing better
> testing infrastructure.
> 
> And to prove a point, this series has already found a memory leak in ARM's
> dom0less smoke test.
> 
> >From https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/929518792
> 
>   (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>   (XEN) Freed 328kB init memory.
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
>   (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>   (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
>   (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>   (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) d1 has 2 outstanding heap allocations
>   (XEN) ****************************************
>   (XEN)
>   (XEN) Reboot in five seconds...
> 
> For some reason, neither of the evtchn default memory allocations are freed,
> but it's not clear why d1 shut down to being with.  Stefano - any ideas?

Right, this is confusing. It is not hard to believe that memory leaks
exist on the dom0less shutdown path because dom0less domains are not
really shutdown today. I imagine there could be issues.

But I don't understand why _domain_destroy gets called in the first
place for d1. Maybe a domain_create failure leads to goto fail and
_domain_destroy(). I wanted to run a test but ran out of time.

