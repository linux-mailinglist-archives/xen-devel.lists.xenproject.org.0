Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA1876EA9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690466.1076496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilzm-0007u2-Oy; Sat, 09 Mar 2024 01:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690466.1076496; Sat, 09 Mar 2024 01:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilzm-0007s1-MN; Sat, 09 Mar 2024 01:59:30 +0000
Received: by outflank-mailman (input) for mailman id 690466;
 Sat, 09 Mar 2024 01:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilzl-0007jS-2X
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:59:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a82acc80-ddb8-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 02:59:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA0A3611AB;
 Sat,  9 Mar 2024 01:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C820AC433F1;
 Sat,  9 Mar 2024 01:59:23 +0000 (UTC)
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
X-Inumbo-ID: a82acc80-ddb8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709949565;
	bh=EYg93nlU33GjOu7UC4cTWsN0LpqrP9c+Suy0F97oH2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HV9SIEQ8XMYEFZMzTn2Anit8mFpGz8l9+ViMvsaKTgESmfJu1VSdEN7NFxcNdWRcf
	 /aJmjVUzeyT1QEvuXtztuGPkH6CKlF/ZTzhwyypfuEVtL7PT5VaPkHiKen4U01m4eF
	 jcGFW7fj9bpUGvhSrjGw9QZYoj3ub2iFF9A6+uSJnOfMADe3CnMKk/Vo3Zi8UOqH+r
	 MQmk+Lc78+FXRdDsCxHYjemWOFowJ1egSd2Idq3rEjCp897V1KupmVGI7d4DG/w1tH
	 0aNkOWkwUtUu4+V3EA7VX7PJ6QHsg0UWzebbXecnuChXCq2q2m+sSW05+9MuNVufm0
	 Y8jEI8AkpvSoQ==
Date: Fri, 8 Mar 2024 17:59:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    george.dunlap@cloud.com
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
In-Reply-To: <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop> <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I would like to resurrect this thread and ask other opinions.


On Thu, 23 Nov 2023, Jan Beulich wrote:
> On 22.11.2023 22:46, Stefano Stabellini wrote:
> > Two out of three do_multicall definitions/declarations use uint32_t as
> > type for the "nr_calls" parameters. Change the third one to be
> > consistent with the other two. 
> > 
> > Link: https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
> > Link: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Note that a previous discussion showed disagreement between maintainers
> > on this topic. The source of disagreements are that we don't want to
> > change a guest-visible ABI and we haven't properly documented how to use
> > types for guest ABIs.
> > 
> > As an example, fixed-width types have the advantage of being explicit
> > about their size but sometimes register-size types are required (e.g.
> > unsigned long). The C specification says little about the size of
> > unsigned long and today, and we even use unsigned int in guest ABIs
> > without specifying the expected width of unsigned int on the various
> > arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
> > that's not written anywhere as far as I can tell.
> > 
> > I think the appropriate solution would be to document properly our
> > expectations of both fixed-width and non-fixed-width types, and how to
> > use them for guest-visible ABIs.
> > 
> > In this patch I used uint32_t for a couple of reasons:
> > - until we have better documentation, I feel more confident in using
> >   explicitly-sized integers in guest-visible ABIs
> 
> I disagree with this way of looking at it. Guests don't invoke these
> functions directly, and our assembly code sitting in between already is
> expected to (and does) guarantee that (in the case here) unsigned int
> would be okay to use (as would be unsigned long, but at least on x86
> that's slightly less efficient), in line with what ./CODING_STYLE says.
> 
> Otoh structure definitions in the public interface of course need to
> use fixed with types (and still doesn't properly do so in a few cases).
> 
> Jan
> 

