Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C3B21994
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 01:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078169.1439169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcKQ-0006Y9-DE; Mon, 11 Aug 2025 23:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078169.1439169; Mon, 11 Aug 2025 23:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcKQ-0006Wh-AT; Mon, 11 Aug 2025 23:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1078169;
 Mon, 11 Aug 2025 23:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EhVm=2X=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulcKO-0006Wb-MU
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 23:53:20 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ae07da1-770e-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 01:53:18 +0200 (CEST)
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
X-Inumbo-ID: 5ae07da1-770e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754956397; x=1755215597;
	bh=AiEfhqHt8LlpVdl2kedBT0JPe40tAhgVeXVYs+s/y/Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SSR9pDnXPwQmV8cbVxcz73osFR56udVcASFQNABKABqqnjykRUjbn1B0VYc+PNKfF
	 BFUdrSkETm5KUCHxy4JKeS+S9ZFOwqGIP2XCCzoXQzFSaqwIvCP8cYDF06b8Tbseo7
	 nZC56l27qaQvFNVJaPwVOl0IOvRcO6HgLyCkL4gN698gdGgo8aO4Z9UGCjtmj+c6VZ
	 8KnOcqJtZIibwEgbBDLeS7maXthkKLwblU6455eZI35RbOXdq7BXYCz4PLfMk/nQ1y
	 9EWn/WkYE5W9NOTPhV6YKaBcwcWSa1z5zMibKqnRPV4PDsrqX3npPkKlm2Nf2YrtXq
	 Z58z+MZupsUWQ==
Date: Mon, 11 Aug 2025 23:53:13 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v15 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <aJqCZWSLJ24Fsn+T@kraken>
In-Reply-To: <0089146c-fe86-42b5-afa7-72dffb08c3b7@suse.com>
References: <20250809170747.1836880-1-dmukhin@ford.com> <20250809170747.1836880-4-dmukhin@ford.com> <0089146c-fe86-42b5-afa7-72dffb08c3b7@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d32a83b1c7b4ad6d14e07f210bb62af999a0fede
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 09:58:24AM +0200, Jan Beulich wrote:
> On 09.08.2025 19:08, dmkhn@proton.me wrote:
> > diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid=
/include/xen/domain.h
> > new file mode 120000
> > index 000000000000..2eda9aed088e
> > --- /dev/null
> > +++ b/tools/tests/domid/include/xen/domain.h
> > @@ -0,0 +1 @@
> > +../../harness.h
> > \ No newline at end of file
>=20
> In the tests we generally generate symlinks as necessary, rather than hav=
ing them be
> present in git. Furthermore it's not quite clear why a file of this name =
is needed
> in a test harness anyway. Elsewhere we adjust hypervisor sources to make =
respective
> #include-s conditional.

I'll fix the makefile for the test so dependencies are resolved on the fly
and no need for code adjustment.

>=20
> Jan


