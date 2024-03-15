Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA387C6BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 01:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693595.1081931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkvKf-00083w-Ns; Fri, 15 Mar 2024 00:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693595.1081931; Fri, 15 Mar 2024 00:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkvKf-00081Y-L3; Fri, 15 Mar 2024 00:21:57 +0000
Received: by outflank-mailman (input) for mailman id 693595;
 Fri, 15 Mar 2024 00:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nznT=KV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkvKd-00081K-UL
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 00:21:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ac73f9-e262-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 01:21:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6120C61569;
 Fri, 15 Mar 2024 00:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE163C433F1;
 Fri, 15 Mar 2024 00:21:48 +0000 (UTC)
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
X-Inumbo-ID: 04ac73f9-e262-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710462110;
	bh=Y+B7WoTj0l9eRXufxNLznT/NkIcc3pWkJu4toqxmkVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gd/MwbfHG9qhXLyUyKunmCrZaDdBK0UF93pgWe9ZvF+XbsaMlH/XEcMf/kjAYiOM3
	 V8zU+B4TrBECTpMaE2PzzFdcajS2TSyi7pBLUGgNANMwEoHkWcJip/BUCZbKHlAurv
	 inr4nXjJamoig68hde6UQASNvXxDL/QxdWC2VaDq9l3Kq2BkvN/m1pDjyC2GrQZjr7
	 xVEH8HAC36FYqpRRT9WIZvFbQj7sTdDMJxeRAQBW3Q8glv4KRI6B1yHOmS4EeyBSAD
	 BWZMhhOuXK0scxRm3vFpP4ePTY0jsgBjGSAJkBhgebOPgBq0WKQRywjm2CiPDLTpn8
	 uoOOg08kRDtrA==
Date: Thu, 14 Mar 2024 17:21:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com
cc: George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, julien@xen.org
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
In-Reply-To: <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
Message-ID: <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop> <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop> <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1508082843-1710461585=:853156"
Content-ID: <alpine.DEB.2.22.394.2403141713100.853156@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1508082843-1710461585=:853156
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2403141713101.853156@ubuntu-linux-20-04-desktop>

On Mon, 11 Mar 2024, Julien Grall wrote:
> On 11/03/2024 11:32, George Dunlap wrote:
> > On Sat, Mar 9, 2024 at 1:59 AM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > > 
> > > I would like to resurrect this thread and ask other opinions.
> > > 
> > > 
> > > On Thu, 23 Nov 2023, Jan Beulich wrote:
> > > > On 22.11.2023 22:46, Stefano Stabellini wrote:
> > > > > Two out of three do_multicall definitions/declarations use uint32_t as
> > > > > type for the "nr_calls" parameters. Change the third one to be
> > > > > consistent with the other two.
> > > > > 
> > > > > Link:
> > > > > https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
> > > > > Link:
> > > > > https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
> > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > ---
> > > > > Note that a previous discussion showed disagreement between
> > > > > maintainers
> > > > > on this topic. The source of disagreements are that we don't want to
> > > > > change a guest-visible ABI and we haven't properly documented how to
> > > > > use
> > > > > types for guest ABIs.
> > > > > 
> > > > > As an example, fixed-width types have the advantage of being explicit
> > > > > about their size but sometimes register-size types are required (e.g.
> > > > > unsigned long). The C specification says little about the size of
> > > > > unsigned long and today, and we even use unsigned int in guest ABIs
> > > > > without specifying the expected width of unsigned int on the various
> > > > > arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
> > > > > that's not written anywhere as far as I can tell.
> > > > > 
> > > > > I think the appropriate solution would be to document properly our
> > > > > expectations of both fixed-width and non-fixed-width types, and how to
> > > > > use them for guest-visible ABIs.
> > > > > 
> > > > > In this patch I used uint32_t for a couple of reasons:
> > > > > - until we have better documentation, I feel more confident in using
> > > > >    explicitly-sized integers in guest-visible ABIs
> > > > 
> > > > I disagree with this way of looking at it. Guests don't invoke these
> > > > functions directly, and our assembly code sitting in between already is
> > > > expected to (and does) guarantee that (in the case here) unsigned int
> > > > would be okay to use (as would be unsigned long, but at least on x86
> > > > that's slightly less efficient), in line with what ./CODING_STYLE says.
> > > > 
> > > > Otoh structure definitions in the public interface of course need to
> > > > use fixed with types (and still doesn't properly do so in a few cases).
> > 
> > You didn't address the other argument, which was that all the other
> > definitions have uint32_t; in particular,
> > common/multicall.c:do_multicall() takes uint32_t.  Surely that should
> > match the non-compat definition in include/hypercall-defs.c?
> > 
> > Whether they should both be `unsigned int` or `uint32_t` I don't
> > really feel like I have a good enough grasp of the situation to form a
> > strong opinion.
> 
> FWIW +1. We at least need some consistency.

Consistency is my top concern. Let's put the "unsigned int" vs
"uint32_t" argument aside.

do_multicall is not consistent with itself. We need
hypercall-defs.c:do_multicall and multicall.c:do_multicall to match.

Option1) We can change hypercall-defs.c:do_multicall to use uint32_t.

Option2) Or we can change multicall.c:do_multicall to use unsigned int.

I went with Option1. Andrew expressed his strong preference toward
Option1 in the past. George seems to prefer Option1.

Jan, can you accept Option1 and move on?
--8323329-1508082843-1710461585=:853156--

