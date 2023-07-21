Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5275D721
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567711.887119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyIg-0004qK-51; Fri, 21 Jul 2023 22:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567711.887119; Fri, 21 Jul 2023 22:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyIg-0004nu-0y; Fri, 21 Jul 2023 22:08:38 +0000
Received: by outflank-mailman (input) for mailman id 567711;
 Fri, 21 Jul 2023 22:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMyIe-0004nm-Pj
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:08:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ca63c5-2813-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 00:08:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8557E61DA1;
 Fri, 21 Jul 2023 22:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C47C433C7;
 Fri, 21 Jul 2023 22:08:32 +0000 (UTC)
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
X-Inumbo-ID: 22ca63c5-2813-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689977313;
	bh=2Yfxm2WOf3M1EbeVbgbkDQ78sxZNDLOYz+SBvFVQZMQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rkqv3915ew2KW/NF2bvscQo7ZVwrl4yQ/y6DKYW1Lgxyv1asnblSR6oCbPuq6BpAa
	 yrj4v55/6d5cAi6kZqI14Z6lOQOQU6a2TPaOzAv9AOpZkGB2EzEC3xgz6CASu8rVjN
	 p2L1hUvWbXi7VfbJ5Wfe8HeRCN7f9+9ASWZQuOv1hrUanRVa6hwEsezsYtaAIHrh/c
	 yFAOPO1Qf40HfKGJRhXnx2LgMlcNFr13JhUMw65QCey6iEEzvRhSstxxdUM93rcIf7
	 kBAsZLv5O/Mpe+MK4RsJk6ALt6WWKGPXs3CucNVUuhiml0gJfbuYQrzkDPbXaDLeBn
	 NcFkQKom+HNRw==
Date: Fri, 21 Jul 2023 15:08:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Christopher Clark <christopher.w.clark@gmail.com>, 
    xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
In-Reply-To: <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307211507530.3118466@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-4-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop> <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com> <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-16792519-1689977313=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-16792519-1689977313=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 21 Jul 2023, Jan Beulich wrote:
> On 21.07.2023 00:12, Christopher Clark wrote:
> > On Thu, Jul 13, 2023 at 11:51 PM Christopher Clark <
> > christopher.w.clark@gmail.com> wrote:
> > 
> >>
> >>
> >> On Sat, Jul 8, 2023 at 11:47 AM Stefano Stabellini <sstabellini@kernel.org>
> >> wrote:
> >>
> >>> On Sat, 1 Jul 2023, Christopher Clark wrote:
> >>>> To convert the x86 boot logic from multiboot to boot module structures,
> >>>> change the bootstrap map function to accept a boot module parameter.
> >>>>
> >>>> To allow incremental change from multiboot to boot modules across all
> >>>> x86 setup logic, provide a temporary inline wrapper that still accepts a
> >>>> multiboot module parameter and use it where necessary. The wrapper is
> >>>> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
> >>>> inline function into an existing header that has no such functions
> >>>> already. This new header will be expanded with additional functions in
> >>>> subsequent patches in this series.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >>>>
> >>>
> >>> [...]
> >>>
> >>>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> >>>> index b72ae31a66..eb93cc3439 100644
> >>>> --- a/xen/include/xen/bootinfo.h
> >>>> +++ b/xen/include/xen/bootinfo.h
> >>>> @@ -10,6 +10,9 @@
> >>>>  #endif
> >>>>
> >>>>  struct boot_module {
> >>>> +    paddr_t start;
> >>>> +    size_t size;
> >>>
> >>> I think size should be paddr_t (instead of size_t) to make sure it is
> >>> the right size on both 64-bit and 32-bit architectures that support
> >>> 64-bit addresses.
> >>>
> >>
> >> Thanks, that explanation does make sense - ack.
> >>
> > 
> > I've come back to reconsider this as it doesn't seem right to me to store a
> > non-address value (which this will always be) in a type explicitly defined
> > to hold an address: addresses may have architectural alignment requirements
> > whereas a size value is just a number of bytes so will not. The point of a
> > size_t value is that size_t is defined to be large enough to hold the size
> > of any valid object in memory, so I think this was right as-is.
> 
> "Any object in memory" implies virtual addresses (or more generally addresses
> which can be used for accessing objects). This isn't the case when considering
> physical addresses - there may be far more memory in a system than can be made
> accessible all in one go.

Right. And I think size_t is defined as 32-bit in Xen which is a
problem.
--8323329-16792519-1689977313=:3118466--

