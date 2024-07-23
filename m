Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B997D93A967
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763622.1173902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOBE-0005ID-CP; Tue, 23 Jul 2024 22:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763622.1173902; Tue, 23 Jul 2024 22:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOBE-0005Fs-9n; Tue, 23 Jul 2024 22:40:24 +0000
Received: by outflank-mailman (input) for mailman id 763622;
 Tue, 23 Jul 2024 22:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWOBC-0005Fm-CM
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:40:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a995d09-4944-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 00:40:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 927BA60DC0;
 Tue, 23 Jul 2024 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD60C4AF09;
 Tue, 23 Jul 2024 22:40:18 +0000 (UTC)
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
X-Inumbo-ID: 8a995d09-4944-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721774419;
	bh=baRk6FXpdaeiYW9PQTpKLhh4T/aESrBnGph3BVYHVHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rAZZgpDVG+aaW1duaLbEXz66mlDQpbfzHG9IJHr10MYv/ApA1KY9cxo0BELJpAyRD
	 CdEBj/+8S9XWWh4HVr1JbRZ6RqLlihuBglJZ4/ffv/z6WVdEeKAH+6y1ABL+5dAAWK
	 sCGzyONawA9/6FKuDKOjXdksg1hB0d1I5vvW5vUtNZOMS7hH5+QY9SGEqd4wYqZBi6
	 LvcnXKrPv2HMr8cIEMssNIOnjU5Vm2fkwBf4UJLWcVRnDbXaEj3GF2f/eNGTeleE7g
	 UM6kP6FUqlcbTl7sqAGRHGENO7pA40YdOcEYZTs/cNXYgMzCspkMWBnkxjfYmokIP1
	 qc4zW6H0bd3zQ==
Date: Tue, 23 Jul 2024 15:40:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v5 16/17] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <9ceeedb1-31c6-4701-849c-e4f32fc07409@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407231539570.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com> <14a663eaab02a78e688e1d260e1a4eb1799b13c5.1721720583.git.alessandro.zucchelli@bugseng.com> <9ceeedb1-31c6-4701-849c-e4f32fc07409@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Jan Beulich wrote:
> On 23.07.2024 10:15, Alessandro Zucchelli wrote:
> > This section explains which format should be followed by header
> > inclusion guards via a drop-down list of rules.
> > 
> > No functional change.
> > 
> > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> As indicated in reply to v4, this wants (imo needs) to move to the very start
> of the series. No changes following the new scheme should be made without the
> new scheme actually having been committed.
> 
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -159,6 +159,27 @@ Emacs local variables
> >  A comment block containing local variables for emacs is permitted at
> >  the end of files.  It should be:
> >  
> > +Header inclusion guards
> > +-----------------------
> > +
> > +Unless differently specified all header files should have proper inclusion
> > +guards in order to avoid being included multiple times.
> > +The following naming conventions have been devised:
> > +
> > +- private headers -> <dir>__<filename>_H
> > +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> > +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> > +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> > +
> > +- asm-generic headers -> ASM_GENERIC__<filename>_H
> > +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> > +
> > +- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM__<architecture>__<subdir>__<filename>_H
> > +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> > +
> > +- include/xen -> XEN__<filename>_H
> > +    - include/xen/something.h -> XEN__SOMETHING_H
> 
> While I think this expresses what we have settled on, it lack details. For
> example, when to use single vs double underscores is left for the reader
> to derive from the examples, which leaves room for interpretation.

I think so too. Here is my improved version, what do you think:


Header inclusion guards
-----------------------

Unless otherwise specified, all header files should include proper
guards to prevent multiple inclusions. The following naming conventions
apply:

- Private headers: <dir>__<filename>_H
    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H

- asm-generic headers: ASM_GENERIC__<filename>_H
    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H

- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H

- Xen headers: XEN__<filename>_H
    - include/xen/something.h -> XEN__SOMETHING_H

Notes:

- Filenames and directories are converted to uppercase.
- Dashes are converted to underscores.
- Directories, subdirectories, and filenames are separated by double
  underscores.


