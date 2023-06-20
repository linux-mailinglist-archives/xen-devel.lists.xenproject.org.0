Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E773761B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552288.862279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBi2B-0002MS-PX; Tue, 20 Jun 2023 20:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552288.862279; Tue, 20 Jun 2023 20:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBi2B-0002KL-LK; Tue, 20 Jun 2023 20:33:03 +0000
Received: by outflank-mailman (input) for mailman id 552288;
 Tue, 20 Jun 2023 20:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBi29-0002Ix-Vy
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:33:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59ae416-0fa9-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 22:33:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57BD3611B2;
 Tue, 20 Jun 2023 20:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3583C433C0;
 Tue, 20 Jun 2023 20:32:56 +0000 (UTC)
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
X-Inumbo-ID: a59ae416-0fa9-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687293178;
	bh=fKEN0zP0l28bTF0vofHECl8YGwBBSG/g2hqAXbl9yGQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GVIkMEAYBhZYlsfxU7/OtZMAnNCGOovbrsqDSj5MV8/R5nOZBll1D7mPhM1yiJEUX
	 Lnd54EhoqixsiTR9bzvHgiADA1XgfVqalVJz8Mxktg4rovmiP09wSBZnfaUaL7UZrY
	 x3IerklWzRshITs5imFuWxGUULTfdqJnPue6gr+Y3tu6A0vjwgoQ702XR9P1iTH+JO
	 Q2viDROWJhdcz43v2hzFwqtpA/1Qc1F8zsRMWAbyA9TF1pYqHUVo4FzBHcT97UclY0
	 G5mHBQ/yvZkxsaP7jOBSt6Xc2PfaArR8XfgLJzJmeh+l1R8XHq5tVdDY6U/5aKydsr
	 kDvBTndjyL9cw==
Date: Tue, 20 Jun 2023 13:32:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, xenia.ragiadakou@amd.com, 
    ayan.kumar.halder@amd.com, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
In-Reply-To: <807743af-c1fe-45d0-1919-a7eb4d244a21@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306201332040.897208@ubuntu-linux-20-04-desktop>
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com> <807743af-c1fe-45d0-1919-a7eb4d244a21@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Jan Beulich wrote:
> On 20.06.2023 14:10, Roberto Bagnara wrote:
> > +   * - Non-standard tokens
> > +     - ARM64, X86_64
> > +     - _Static_assert:
> > +          see Section "2.1 C Language" of GCC_MANUAL.
> > +       asm, __asm__:
> > +          see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
> > +       __volatile__:
> > +          see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
> > +       __const__, __inline__, __inline:
> > +          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
> > +       typeof, __typeof__:
> > +          see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
> > +       __alignof__, __alignof:
> > +          see Sections "6.48 Alternate Keywords" and "6.44 Determining the Alignment of Functions, Types or Variables" of GCC_MANUAL.
> > +       __attribute__:
> > +          see Section "6.39 Attribute Syntax" of GCC_MANUAL.
> > +       __builtin_types_compatible_p:
> > +          see Section "6.59 Other Built-in Functions Provided by GCC" of GCC_MANUAL.
> > +       __builtin_va_arg:
> > +          non-documented GCC extension.
> > +       __builtin_offsetof:
> > +          see Section "6.53 Support for offsetof" of GCC_MANUAL.
> > +       __signed__:
> > +          non-documented GCC extension.
> 
> I'd like to note that there is a patch [1] pending which removes all uses
> of this extension. Hopefully in Prague we can settle on how to progress
> this ...
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2023-02/msg00445.html

I would keep __signed__ in this document for now and remove __signed__
on commit if [1] gets committed first

