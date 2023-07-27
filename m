Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA2765C32
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 21:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571256.894665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6mS-00012l-JN; Thu, 27 Jul 2023 19:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571256.894665; Thu, 27 Jul 2023 19:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6mS-0000zz-G4; Thu, 27 Jul 2023 19:36:12 +0000
Received: by outflank-mailman (input) for mailman id 571256;
 Thu, 27 Jul 2023 19:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qP6mQ-0000zt-Ui
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 19:36:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08b128f-2cb4-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 21:36:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89AA361F11;
 Thu, 27 Jul 2023 19:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BACC433C7;
 Thu, 27 Jul 2023 19:35:55 +0000 (UTC)
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
X-Inumbo-ID: d08b128f-2cb4-11ee-b24a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690486557;
	bh=3qvRh7cwqzBHecLGo637MwATyP7GklmeWopJXnjiK8o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ng1FJiie7ASG/zHslkVjzVg0NoqZNZdXIm2+e1slASubsNhis6xS78okTiJgyjHUw
	 eK5BclNlym0BWriChl8+aSvvOjTs3ERECZnrkryjNXs1c1rVtQRXFutjFI5gTYxL/N
	 rZx0IrqxCD0sQ9sxKtppopQgbbzebMAIDhRtKERmi87voROrHUUpYQG3uSnZ2pRnoa
	 9E/E11GDlBJr1EpAlfHtFJI85a7fqdIal5ZvI2RyHIQzYGFcCoqbANTREErA+os2Cb
	 LBlBrqSmtv7D+1opgTxI3PANrjtr1TBhOJtoLMuVkOr/fKq6PWpf+K650opyITxbq1
	 YM0MENBOhcQKQ==
Date: Thu, 27 Jul 2023 12:35:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
In-Reply-To: <d099b736-22cf-0502-df37-9ae7b14d048a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307271233480.3118466@ubuntu-linux-20-04-desktop>
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com> <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com> <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com> <8914bf47-c4ca-4a14-6a92-b5b23ee739a0@suse.com>
 <alpine.DEB.2.22.394.2307261448010.3118466@ubuntu-linux-20-04-desktop> <d099b736-22cf-0502-df37-9ae7b14d048a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jul 2023, Jan Beulich wrote:
> On 26.07.2023 23:49, Stefano Stabellini wrote:
> > On Wed, 26 Jul 2023, Jan Beulich wrote:
> >> On 26.07.2023 08:42, Nicola Vetrini wrote:
> >>> On 26/07/23 08:34, Jan Beulich wrote:
> >>>> On 25.07.2023 22:45, Nicola Vetrini wrote:
> >>>>> Rule 5.3 has the following headline:
> >>>>> "An identifier declared in an inner scope shall not hide an
> >>>>> identifier declared in an outer scope"
> >>>>>
> >>>>> To avoid any confusion resulting from the parameter 'debug'
> >>>>> hiding the homonymous function declared at
> >>>>> 'xen/arch/x86/include/asm/processor.h:428'
> >>>>> the rename of parameters s/debug/lkdbg/ is performed.
> >>>>>
> >>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - s/dbg/lkdbg/
> >>>>> Changes in v3:
> >>>>> - Added missing renames for consistency
> >>>>
> >>>> Hmm, you asked whether to send v3, but then you didn't wait for an
> >>>> answer. So to repeat what I said there: I'd prefer if we could first
> >>>> settle whether to rename the conflicting x86 symbol.
> >>>>
> >>>
> >>> Stefano replied asking for a v3 [1] before I had a chance to read your 
> >>> message this morning.
> >>
> >> Right, sorry, I spotted his reply only after seeing the v3.
> > 
> > For what is worth I prefer the current implementation compared to
> > renaming debug()
> 
> I don't. My replacement name suggestions were only "just in case"; I
> don't really like them.

Understood :-)

How would you like to proceed?

1. we commit this patch as is
2. we wait for a third opinion from another maintainer
3. we find a new name for the variable
4. we change debug() instead

?

