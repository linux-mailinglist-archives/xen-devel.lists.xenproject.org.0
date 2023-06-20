Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E8737673
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552348.862380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBidc-0003Wf-UI; Tue, 20 Jun 2023 21:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552348.862380; Tue, 20 Jun 2023 21:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBidc-0003Tx-QP; Tue, 20 Jun 2023 21:11:44 +0000
Received: by outflank-mailman (input) for mailman id 552348;
 Tue, 20 Jun 2023 21:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBidb-0003Tr-C6
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:11:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cfbd0dd-0faf-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 23:11:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34291611C1;
 Tue, 20 Jun 2023 21:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C088C433C8;
 Tue, 20 Jun 2023 21:11:38 +0000 (UTC)
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
X-Inumbo-ID: 0cfbd0dd-0faf-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687295499;
	bh=wWe4D6zWLnxGrZULW8iFrQdJxQFzwxlWnkQwIsuz9XE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YRiVJpXQaG5fj0EHZiv6qkh+FMY/5yuwwwlTk7V+6HjporLeesvevWt/lc8odEACA
	 /OAIVMvV0P4sfgBHByp54vn/FPsE9pc4dj5JmXwNjYI42UWVN5Xw8RK9HZ/vRceLH7
	 u4ZUaOqno21e+eYXkneUiazI0RQWdGJ1TN+0Sq4yyGILhueTZ65qrKli3MbbijDD3v
	 yi95k1KQI6lrIQgQI1A1LmChFMI13YqWT9EF3cRfeoosAICEh1qU6uuOG1VKDAXZld
	 vl2moUG3oMH+Euze2yjKV0H4ziusbWPDaKYp0li5WURISvqbw3XtQpuVrWr144P7rU
	 qbaj1MIdWM7cw==
Date: Tue, 20 Jun 2023 14:11:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 09/13] xen/public: fixed violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <97d41c7e-94d1-928c-6619-adc25ffba106@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306201402420.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <2214598125081ccfb324555288bee0340f8b1024.1687250177.git.gianluca.luparini@bugseng.com> <97d41c7e-94d1-928c-6619-adc25ffba106@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Jan Beulich wrote:
> On 20.06.2023 12:35, Simone Ballarin wrote:
> > --- a/xen/include/public/io/ring.h
> > +++ b/xen/include/public/io/ring.h
> > @@ -36,11 +36,11 @@
> >  typedef unsigned int RING_IDX;
> >  
> >  /* Round a 32-bit unsigned constant down to the nearest power of two. */
> > -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
> > -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
> > -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
> > -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
> > -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
> > +#define __RD2(_x)  (((_x) & 0x00000002U) ? 0x2                  : ((_x) & 0x1))
> > +#define __RD4(_x)  (((_x) & 0x0000000cU) ? __RD2((_x)>>2)<<2    : __RD2(_x))
> > +#define __RD8(_x)  (((_x) & 0x000000f0U) ? __RD4((_x)>>4)<<4    : __RD4(_x))
> > +#define __RD16(_x) (((_x) & 0x0000ff00U) ? __RD8((_x)>>8)<<8    : __RD8(_x))
> > +#define __RD32(_x) (((_x) & 0xffff0000U) ? __RD16((_x)>>16)<<16 : __RD16(_x))
> 
> While I don't mind the suffixes being added, I'm wondering how
> the tool would have spotted the single violation here. Iirc we
> don't use this header anywhere in the hypervisor.
> 
> If this block is to be touched, I think it wants correcting for
> style at the same time: There are numerous blanks missing, and
> especially in a public header we shouldn't use underscore-
> prefixed names outside of their spec permitted purpose. (This is
> about _x; I'm not convinced we can change the various __RD<n>.)
> 
> Furthermore, if I recall correctly Misra also mandates single
> evaluation of macro arguments. While I don't immediately see how
> to address that without resorting to compiler extensions, I don't
> think it makes sense to address one violation here but not he
> other (the more when the code in question doesn't affect the
> hypervisor build).

I am not sure about this one because it is nice to have simple
mechanical changes to review where as a reviewer you are basically only
checking for one thing only.

I think it would be far less effort for reviewers to review additional
MISRA fixes separately. I could understand code style fixes, those could
go either way in my opinion (although I would probably prefer even those
to be done in separate patches if they are non-trivial like the ones
here).

To help Simone, given that our code style is not super-well-documented,
this would be the code style:

#define __RD4(x)  (((x) & 0x0000000cU) ? __RD2((x) >> 2) << 2    : __RD2(x))

