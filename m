Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC83776A13
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581333.909984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTptk-0006lr-EQ; Wed, 09 Aug 2023 20:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581333.909984; Wed, 09 Aug 2023 20:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTptk-0006ja-BE; Wed, 09 Aug 2023 20:35:16 +0000
Received: by outflank-mailman (input) for mailman id 581333;
 Wed, 09 Aug 2023 20:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpti-0006jU-6B
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:35:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cf908bb-36f4-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:35:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CC2D648CA;
 Wed,  9 Aug 2023 20:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B551C433C7;
 Wed,  9 Aug 2023 20:35:09 +0000 (UTC)
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
X-Inumbo-ID: 3cf908bb-36f4-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691613310;
	bh=d8m+bEzzXs7EYuIc1E122NeHbdYRXYN5o9QCFt3vJS0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EQbgfblMcF2TYFdiO3C6iuq51jWa8J2U0BkGP0QOKlVpVHj4jLBxjMYaoDTl2ZlPu
	 v5kYhxxLNOdWP4FqYCYIXkRUfPp8nWd4eSEh4k919CUr15yVScx7v0tQHrHcyFOjv3
	 GU+YiGu9OtvqTR6nheS/K9q6KRlmhHDM8h0QfmAcpNMBXyaRY6b0uQxjVj7dB2q53i
	 4KNAPeKzP9KG593s1lldePddwpBtKghlsHoJy9BRnBcm3hrpKZXoOqSKFtTfZ4lAbt
	 LG8u5Ict6gs8E68PfDRHkHnpbsq0uWqOvE+gBa1Cnh7O38xQyslGvm8BjTm1ANbZwf
	 OFI8nZFTVYw1Q==
Date: Wed, 9 Aug 2023 13:35:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: MISRA violations in hypercall-defs
In-Reply-To: <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com> <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com> <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop> <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Jan Beulich wrote:
> On 09.08.2023 01:22, Stefano Stabellini wrote:
> > On Tue, 8 Aug 2023, Jan Beulich wrote:
> >> On 08.08.2023 10:47, Federico Serafini wrote:
> >>> Hello everyone.
> >>>
> >>> I would like to to ask your opinion about the auto-generated file
> >>> xen/include/xen/hypercall-defs.h which contains some violations of
> >>> MISRA C:2012 Rule 8.3:
> >>> "All declarations of an object or function shall use the same names and
> >>> type qualifiers".
> >>>
> >>> Such violations can be seen at the following links
> >>> (copy and paste the link on you browser, including also the characters
> >>> after the '#'):
> >>>
> >>> - arm
> >>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> >>>
> >>> - x86
> >>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> >>>
> >>> Some of the violations are due to mismatches on the return types
> >>> and the use of `ret_t`.
> >>
> >> We already said that ret_t will need deviating. For parameter names
> >> it ought to be possible to suitably rename, like done elsewhere. Whether
> >> that means renaming in the generator script or in the definitions likely
> >> again needs judging on a case-by-case basis.
> > 
> > Is it the case that ret_t is purposedly defined as 'long' for 64-bit x86
> > guests and 'int' for 32-bit x86 guests?
> 
> Yes.
> 
> > I am asking because it looks like we don't use ret_t at all on ARM and
> > on the public interfaces.
> 
> And I wonder how you get away with this. Aiui hypercall return values are
> 32-bit on Arm32, so I'd expect you to be at risk of truncation issues in
> a limited set of cases (see in particular the bottom of compat_memory_op(),
> where out-of-range values are saturated rather than truncated). But maybe
> in practice this can't happen?

Yes I think that must be it. Also consider that mixing 32/64
environments on ARM is rare: the arm32 version of Xen is mostly to
run on arm32 targets with only 32-bit guests. The arm64 version of Xen
is to run on arm64 targets with mostly (only?) 64-bit guests. Which is a
different situation compared to x86.

So the ret_t deviation would only affect the x86 version of the
hypervisor.


P.S.
Julien, Bertrand, do you think we should unsupport (in SUPPORT.md, today
it is not clarified) 32-bit guests on a 64-bit ARM hypervisor?

