Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBBA3CED3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 02:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893458.1302334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvWW-0006IO-1q; Thu, 20 Feb 2025 01:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893458.1302334; Thu, 20 Feb 2025 01:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvWV-0006FU-VC; Thu, 20 Feb 2025 01:38:43 +0000
Received: by outflank-mailman (input) for mailman id 893458;
 Thu, 20 Feb 2025 01:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkvWT-0006FM-SG
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 01:38:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68521147-ef2b-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 02:38:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01E845C5BDE;
 Thu, 20 Feb 2025 01:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A83C4CED1;
 Thu, 20 Feb 2025 01:38:34 +0000 (UTC)
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
X-Inumbo-ID: 68521147-ef2b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740015515;
	bh=UXIhz1GFcyNbQICDGTzhODiS+aMqma8vumlX7sg8/Z8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cY6Z2zEIqGz4irXjdjfVTsKaucTEPbVKEm5+QtCUHA557mtCxso/Sb/uSF6kN80sp
	 AI0D9aZnxhK7xYp5eEcjjYH0qmVU2h6/jfJdjEjLpaPMycSOA6steOTW9JKUuqom+v
	 3n7iYLGz76m8eb2WwF4oOGRVmeulRiJHFMSRZ7jD7G9j4K9FpDv0igKPQJvbU1HcWc
	 OxF41La9VYmWCxZjn8ne6iLGFWoebo3W245HG68H6YkBTqOy+WVk8xONdWEEHTRyRs
	 B7DIYSAyh8VrzIhZ0+CIZDYuErFUaU+jYokRp7iVLum15N1A7TcjwN7KOlkcrvryfz
	 qcoo3dQtMHjOw==
Date: Wed, 19 Feb 2025 17:38:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/list: avoid UB in list iterators
In-Reply-To: <ec9c4937-f39f-47cb-a436-ca2250bc7679@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502191736270.1791669@ubuntu-linux-20-04-desktop>
References: <20250219141818.8789-1-jgross@suse.com> <20250219141818.8789-2-jgross@suse.com> <ec9c4937-f39f-47cb-a436-ca2250bc7679@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-178652350-1740015515=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-178652350-1740015515=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Feb 2025, Andrew Cooper wrote:
> On 19/02/2025 2:18 pm, Juergen Gross wrote:
> > The list_for_each_entry*() iterators are testing for having reached the
> > end of the list in a way which relies on undefined behavior: the
> > iterator (being a pointer to the struct of a list element) is advanced
> > and only then tested to have reached not the next element, but the list
> > head. This results in the list head being addressed via a list element
> > pointer, which is undefined, in case the list elements have a higher
> > alignment than the list head.
> >
> > Avoid that by testing for the end of the list before advancing the
> > iterator. In case of having reached the end of the list, set the
> > iterator to NULL and use that for stopping the loop. This has the
> > additional advantage of not leaking the iterator pointing to something
> > which isn't a list element past the loop.
> >
> > There is one case in the Xen code where the iterator is used after
> > the loop: it is tested to be non-NULL to indicate the loop has run
> > until reaching the end of the list. This case is modified to use the
> > iterator being NULL for indicating the end of the list has been
> > reached.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I agree there's an issue here, but as said before, I do not agree with
> this patch.
> 
> For starters, bloat-o-meter on a random top-of-tree build says
> 
>     add/remove: 8/1 grow/shrink: 112/68 up/down: 4314/-2855 (1459)
> 
> which is a horrible overhead for a case where the sequence of
> instructions are correct (only the C level types are a problem) and ...
> 
> > ---
> > No proper Fixes: tag, as this bug predates Xen's git and mercurial
> > history.
> > V2:
> > - fix one use case (Jan Beulich)
> > - let list_is_first() return bool, rename parameter (Jan Beulich)
> > - paranthesize iterator when used as non-NULL test (Jan Beulich)
> > - avoid dereferencing NULL in the safe iterators (Jan Beulich)
> > ---
> >  xen/drivers/passthrough/x86/hvm.c |   3 +-
> 
> ... the need for this adjustment being discovered after-the-fact means
> it's a very risky change at this juncture in the release.

I have not reviewed the patch in enough detail to form an opinion on the
approach yet. However, I want to note that I also don't think that this
series should be committed at this stage of the release process. It
would be better to wait for the 4.21 release cycle.
--8323329-178652350-1740015515=:1791669--

