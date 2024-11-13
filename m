Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15C9C67A4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 04:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835045.1250878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3r0-0008AY-7c; Wed, 13 Nov 2024 03:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835045.1250878; Wed, 13 Nov 2024 03:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3r0-00087O-4w; Wed, 13 Nov 2024 03:15:38 +0000
Received: by outflank-mailman (input) for mailman id 835045;
 Wed, 13 Nov 2024 03:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tB3qy-00087I-9X
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 03:15:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a1e7df2-a16d-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 04:15:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4845E5C5ABE;
 Wed, 13 Nov 2024 03:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BCBC4CECD;
 Wed, 13 Nov 2024 03:15:28 +0000 (UTC)
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
X-Inumbo-ID: 8a1e7df2-a16d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjhhMWU3ZGYyLWExNmQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDY3NzMyLjUxODY1OSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731467730;
	bh=sePCaGzEb4L9S+L6uMDS8P0WotGTwl9tc0aTKLM94J4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JKAXLjOGGykMY8bcBHYeXTz2ZkCFNBZrgyHnXe7iBM1SpJIObIW7p1EU6yy1j9J7k
	 cgVXt2HY1Sgbx+gKQ5RFEaTW6x7I9cPG1VTTbLelNY7ViLubg5gSmaIYoa9Tz7C9uI
	 zqQU9aUQiugv5SHeshflCBsxtQW3i7LHVPgpa8HAu7ceJboUnveo4TQjntdvfa86DR
	 9dBkIzcQsL62D5iuFzhJEOGUFiYEcbiTFyC9CgWtpeBWHuWHcMSHBLJT/7NRiehhKr
	 rf04m7aUQJ7PWivDuqP/Cmm8dsHfVchACDniUQDpY5SQ8EqY1D1237Eje3KDNuaK7l
	 VFnD+Upj+kyuQ==
Date: Tue, 12 Nov 2024 19:15:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
In-Reply-To: <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411121912400.222505@ubuntu-linux-20-04-desktop>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com> <20240621205800.329230-3-andrew.cooper3@citrix.com> <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Jan,

It is challenging to create a solution that satisfies everyone for this
patch. However, we should add R8.3 to the clean list as soon as possible
to enable rule blocking in GitLab-CI. Failing to do so risks introducing
regressions, as recently occurred, undoing the significant efforts made
by Bugseng and the community over the past year.

Unless there is a specific counterproposal, let us proceed with
committing this patch.

Cheers,
Stefano

On Mon, 24 Jun 2024, Jan Beulich wrote:
> On 21.06.2024 22:58, Andrew Cooper wrote:
> > Right now, the non-compat declaration and definition of do_multicall()
> > differing types for the nr_calls parameter.
> > 
> > This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
> > first 128bit architecture (RISC-V looks as if it might get there first).
> > 
> > Worse, the type chosen here has a side effect of truncating the guest
> > parameter, because Xen still doesn't have a clean hypercall ABI definition.
> > 
> > Switch uniformly to using unsigned long.
> 
> And re-raising all the same question again: Why not uniformly unsigned int?
> Or uint32_t?
> 
> > This addresses the MISRA violation, and while it is a guest-visible ABI
> > change, it's only in the corner case where the guest kernel passed a
> > bogus-but-correct-when-truncated value.  I can't find any any users of
> > mutilcall which pass a bad size to begin with, so this should have no
> > practical effect on guests.
> > 
> > In fact, this brings the behaviour of multicalls more in line with the header
> > description of how it behaves.
> 
> Which description? If you mean ...
> 
> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -623,7 +623,7 @@ DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
> >  /*
> >   * ` enum neg_errnoval
> >   * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
> > - * `                      uint32_t nr_calls);
> > + * `                      unsigned long nr_calls);
> >   *
> >   * NB. The fields are logically the natural register size for this
> >   * architecture. In cases where xen_ulong_t is larger than this then
> 
> ... this comment here, note how is says "fields", i.e. talks about the
> subsequent struct.
> 
> What you're doing is effectively an ABI change: All of the sudden the
> upper bits of the incoming argument would be respected. Yes, it is
> overwhelmingly likely that no-one would ever pass such a value. Yet
> iirc on other similar hypercall handler adjustments in the past you
> did raise a similar concern.
> 
> Jan
> 

