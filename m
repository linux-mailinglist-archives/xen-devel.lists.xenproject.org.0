Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D223765B6F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 20:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571249.894635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP5qk-0001hk-O5; Thu, 27 Jul 2023 18:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571249.894635; Thu, 27 Jul 2023 18:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP5qk-0001fJ-LO; Thu, 27 Jul 2023 18:36:34 +0000
Received: by outflank-mailman (input) for mailman id 571249;
 Thu, 27 Jul 2023 18:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qP5qj-0001fD-Bf
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 18:36:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fe023db-2cac-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 20:36:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AC1961F13;
 Thu, 27 Jul 2023 18:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF7CC433C7;
 Thu, 27 Jul 2023 18:36:25 +0000 (UTC)
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
X-Inumbo-ID: 7fe023db-2cac-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690482987;
	bh=No3djdeVz0NhVjxZu0khsrWk+l+jqgp9s0LgkMVGdXc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aScCDkSt8a6sQg5A213lanZCiOa9v5Yb65m+Q4yvS1a06O0YB0vO1BIMGNGT3DQQR
	 g27DdIqjmpztVXWvYhSNnDS+GdNmw/0qgSs/rQ1H8L0IxJ4Rwv3/iyCmb+eZar+KpW
	 D+7AZQhxOaj4NGoZLp7ZwCX5BCuOjDwB9ymsrNNXzkUrs+MaZsjAFy8gMsDyOuIFW8
	 hXIs581dYQm/izYBVrbeKnHy/U2B2cHHbyDwi0n/5gHM9Z/nqKtAvLLU9G0L9yLNyO
	 RrvEqzi/G2cERPMSMEMSJrHChEfXoOCRidqqmUSDj6V3GzxqrpfSw4kUExTgTZNYsf
	 TDU/J1U1kGqWQ==
Date: Thu, 27 Jul 2023 11:36:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
In-Reply-To: <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307271133180.3118466@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-4-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop> <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com> <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com> <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com> <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com> <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
 <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com> <19bb355f-576c-b8d7-b6da-fa2dd8ff2228@apertussolutions.com> <63979074-42c3-83dd-cf0a-8f0cd0294a5d@suse.com> <CA+zSX=ZFjWWnzx8vt3afywaiJiju1N5hNJqKzVkg956T-t-kwg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-807081471-1690482850=:3118466"
Content-ID: <alpine.DEB.2.22.394.2307271134250.3118466@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-807081471-1690482850=:3118466
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307271134251.3118466@ubuntu-linux-20-04-desktop>

On Thu, 27 Jul 2023, George Dunlap wrote:
> On Thu, Jul 27, 2023 at 3:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>       On 27.07.2023 15:26, Daniel P. Smith wrote:
>       > Let's bring this back to the actual implementation instead of the
>       > theoretical. Your position is that Xen's paddr_t is desired because it
>       > can store larger values than that of size_t. Now if you look in Xen
>       > proper (main 64bit code on x86), paddr_t is a typedef for a 64bit
>       > unsigned integer. And if you look at size_t, it is also a typedef to a
>       > 64bit unsigned integer, they are literally a couple of lines apart in
>       > types.h. Thus they are the same size and can only represent the same
>       > maximum size.
> 
>       What about 32-bit Arm, or any other 32-bit architecture that we might
>       see Xen ported to, with wider than 32-bit physical address space?
> 
> 
> To be more concrete here:
> 
> Suppose that you had a machine with 32-bit virtual address spaces (i.e., going up to 4GiB), and 36-bit physical address spaces (i.e., going
> up to 64GiB).  And suppose you had a system with 16GiB of physical ram.  And you wanted to use Hyperlaunch to create VMs using some sort of
> memory image that was 5GiB (presumably of some kind of static data, not, say, a kernel or initramfs).  You wouldn't be able to do it if the
> "size" parameter of the boot modules was limited to 4GiB (without some kind of hack where you string multiple boot modules together).

Yes exactly.

I would like this code to be common across ARM and x86. On arm32 size_t
wouldn't work, with size_t as it is defined today. One option is to use
paddr_t on all arches, or at least on arm32. Another option is to change
the definition of size_t on arm32.

My suggestion it to move the existing equivalent dom0less interface
defined here:
xen/arch/arm/include/asm/setup.c:struct bootmodule
to common code and base this work on top of it. struct bootmodule uses
paddr_t for both start and size to solve the arm32 issue today. 
--8323329-807081471-1690482850=:3118466--

