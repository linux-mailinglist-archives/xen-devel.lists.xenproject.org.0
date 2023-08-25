Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57297891A9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Aug 2023 00:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591027.923416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZfBP-0000KG-Pj; Fri, 25 Aug 2023 22:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591027.923416; Fri, 25 Aug 2023 22:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZfBP-0000HO-N4; Fri, 25 Aug 2023 22:21:35 +0000
Received: by outflank-mailman (input) for mailman id 591027;
 Fri, 25 Aug 2023 22:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZfBO-0000HI-Ok
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 22:21:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdea1297-4395-11ee-9b0c-b553b5be7939;
 Sat, 26 Aug 2023 00:21:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A7AB61811;
 Fri, 25 Aug 2023 22:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E432C433C8;
 Fri, 25 Aug 2023 22:21:28 +0000 (UTC)
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
X-Inumbo-ID: bdea1297-4395-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693002089;
	bh=NkuKHUGj4TtGeJzfx53QvUj3Cx/JbV4+OboJzil12HM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kgPmq+gz/+qwRgsoX+r2Ijsr8TzshrUHS/7nXDgp2JZumenM+wOxDrDkCnaJmOIlN
	 8Msd3xD0TSmfnwJ53lcg2NkyIooszLTyG42zd+LSB4BKOS2FTdAXi/ZWclYRgkwUll
	 l99QoBjn2Sp/H8dYT9AId8dCZykjS5JKGEGxLt6Ule1T/fAwXX4uzd4g/PJUW0i6Hl
	 wQ9BdJw90vfj1cGWLn8rWx/nC/AffKkaMIkBFBVNB62riwOxX15tVJDrhjbg7tSW6O
	 aqrm/HuHQkCvTE/OxlWMntwuKr4Wp84qQtIvphdNhEJEC2Iz/nIA4Kuz7Ntr9RXux2
	 FhvszA3i4tUEQ==
Date: Fri, 25 Aug 2023 15:21:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop>
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com> <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com> <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-331260619-1693001040=:6458"
Content-ID: <alpine.DEB.2.22.394.2308251504050.6458@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-331260619-1693001040=:6458
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308251504051.6458@ubuntu-linux-20-04-desktop>

On Wed, 23 Aug 2023, Jan Beulich wrote:
> On 23.08.2023 09:28, Andrew Cooper wrote:
> > On 23/08/2023 8:04 am, Federico Serafini wrote:
> >> Make function declarations and definitions consistent to address
> >> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> >> function shall use the same names and type qualifiers").
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >> ---
> >> Changes in v2:
> >> - change compat_grant_table_op() definition instead of the declaration;
> >> - use unsigned int for multicall()'s parameter in accordance with XEN coding
> >>   style.
> > 
> > Nack.
> 
> Oh, I'm sorry, I committed this just before seeing your reply. I'll
> revert right away, until we can settle the discussion.
> 
> > You were correct in v1, and the request to change it was erroneous.
> > 
> >> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> >> index 6d361ddfce..d1892fd14f 100644
> >> --- a/xen/include/hypercall-defs.c
> >> +++ b/xen/include/hypercall-defs.c
> >> @@ -135,8 +135,8 @@ xenoprof_op(int op, void *arg)
> >>  #ifdef CONFIG_COMPAT
> >>  prefix: compat
> >>  set_timer_op(uint32_t lo, int32_t hi)
> >> -multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
> >> -memory_op(unsigned int cmd, void *arg)
> >> +multicall(multicall_entry_compat_t *call_list, unsigned int nr_calls)
> > 
> > This, unfortunately for many reasons, is an ABI with guests.
> > 
> > It is buggy that the entire file doesn't use unsigned long (i.e. one
> > full GPR width) to begin with.  It these types alone which cause
> > explicit truncation of the guest-provided hypercall parameter values.
> > 
> > But it is even more buggy to take something that at least truncates to a
> > fixed width, and replace it with something that explicitly does not have
> > a fixed width.
> 
> I disagree on all the points you make. Handling compat guests is quite
> fine to use unsigned int in hypercall prototypes. Fixed width isn't
> needed (just like you don't demand uint64_t, but suggest unsigned long),
> and wider than 32 bits (i.e. long) isn't needed either because can't
> pass in wider values anyway.

There are two points that Andrew made:
1) uint32_t should have been register-width (AKA register_t on ARM)
2) unsigned int is worse than uint32_t because is not fixed-width

As a general rule I would say that it is better not to introduce any ABI
changes as part of a clean-up patch for MISRA. (ABI changes could be
done but separately.)

In regard to 1) I don't think it is a good idea to change nr_calls to a
type of different size. Even if it is the right thing to do. If it is,
let's discuss it as a separate patch: you wouldn't want this type of
change to be hidden inside a innocuous MISRA C patch anyway.

In regard to 2), assuming "unsigned int" is exactly equivalent to
uint32_t on all supported arches, then I am in two minds here. Just one
year ago I would have agreed with Andrew and strongly requested an
explicitly-sized type as argument. Then I discovered that all the RISC-V
APIs are based on long, int and similar, and it seems to be working
quite well for them.  See for instance:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.pdf

Looking at Xen public headers, we have many instances of unsigned long
and unsigned int in use. So now I think both explicitly-sized and
non-explicitly-sized types can work well as long as we are clear on what
they mean, their sizes on all supported arches, and we use them
consistently. (For sure all of the above could be improved in Xen.)

Coming to unsigned int, it should be 32-bit on all supported arches, so
it is down to consistency, which is a bit arbitrary. We have quite a
good mix of unsigned int and uint32_t in hypercall-defs.c, specifically:
10 uint32_t
32 unsigned int

By popular vote, I would go with unsigned int. So, I would keep the
patch as is.
--8323329-331260619-1693001040=:6458--

