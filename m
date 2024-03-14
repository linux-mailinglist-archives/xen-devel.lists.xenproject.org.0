Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1287C4EC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 22:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693506.1081655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkt5J-00058q-Jc; Thu, 14 Mar 2024 21:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693506.1081655; Thu, 14 Mar 2024 21:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkt5J-00056J-Gw; Thu, 14 Mar 2024 21:57:57 +0000
Received: by outflank-mailman (input) for mailman id 693506;
 Thu, 14 Mar 2024 21:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkt5H-00056D-MS
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 21:57:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e05e18-e24d-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 22:57:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DD39614FE;
 Thu, 14 Mar 2024 21:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D33C433C7;
 Thu, 14 Mar 2024 21:57:50 +0000 (UTC)
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
X-Inumbo-ID: e7e05e18-e24d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710453471;
	bh=1iSKslSc1yjNNdzyH2kxNZp9kY4NxfqAixi70qK2K90=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CwvWkcvjHp9ZbJOaaf6nbL9sVpKqY694eoBwt/tiCLtDWMrOLGAJmZv9foPvsf2PJ
	 YjVmxS5nHlPUdlAX92ydvhO1uAhxtO2QpKUzQ+ZiDY0RGFT68DKuoA7B1fNajLA0r1
	 hSlXk80WDBbjSDOU5J2W4KzF0m17ZDjVAumxAqKadhof0iZMs5K8RFY3NFaeaddC1z
	 dg5sBP5Eqm4j2i/J+HLDCAnVJ1iyMhrdabkiCgW61Q88PrsnBvs07AODTnh3acJHbd
	 XPtncVYWLRhvs0wLH1/Zsk6fZAs8GWnH0H8ExynCojTwfN93/v7jM7G9ObeGn5BtPw
	 sMkfE/DuN29gg==
Date: Thu, 14 Mar 2024 14:57:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, michal.orzel@amd.com, 
    roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <CA+zSX=bg-SPbiVCorGZUR=esMk_zviV6e0LcN9XHfzQzM9N5tw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403141455530.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403131622020.853156@ubuntu-linux-20-04-desktop> <5bfd2a8e-afa9-4630-ae75-382edc943bc6@suse.com> <CA+zSX=bg-SPbiVCorGZUR=esMk_zviV6e0LcN9XHfzQzM9N5tw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1009727898-1710453471=:853156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1009727898-1710453471=:853156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 14 Mar 2024, George Dunlap wrote:
> On Thu, Mar 14, 2024 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 14.03.2024 00:23, Stefano Stabellini wrote:
> > > Xen makes assumptions about the size of integer types on the various
> > > architectures. Document these assumptions.
> >
> > This all reads as if we required exact widths. Is that really the case?
> 
> At least one thing here is that *all compilers on the architecture*
> need to have the same idea.  If not, we absolutely need to change
> "unsigned int" to "uint32_t" in any public interface.

Minor NIT to say "all compilers we intend to support on the
architecture". I am sure there are compilers that don't respect these
assumptions out there but we won't support them.


> A second thing is not only assumptions about minimum number of bits,
> but about storage size and alignment.  Again, if we don't assume that
> "unsigned int" is exactly 4 bytes, then we should go through and
> change it to "uint32_t" anywhere that the size or alignment matter.

Yes, exactly.

Actually I forgot to add the alignment information. I'll do that in the
next version of the patch.
--8323329-1009727898-1710453471=:853156--

