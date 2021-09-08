Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F47403895
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 13:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181779.329077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvXl-0004cV-JD; Wed, 08 Sep 2021 11:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181779.329077; Wed, 08 Sep 2021 11:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvXl-0004Zu-G2; Wed, 08 Sep 2021 11:15:05 +0000
Received: by outflank-mailman (input) for mailman id 181779;
 Wed, 08 Sep 2021 11:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUO+=N6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNvXj-0004Zo-OK
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:15:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c82d6b71-a64b-4306-b480-d3964c41194f;
 Wed, 08 Sep 2021 11:15:02 +0000 (UTC)
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
X-Inumbo-ID: c82d6b71-a64b-4306-b480-d3964c41194f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631099702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofIWEMY5+EK+JKgsmrzt8FZLnZlMtaCP0HWNgorTbrs=;
  b=iMQ/ITT9nEUILEFnucIHsxOsDvIPaG2IkBujcXG/oRl8JGGAzkITyTDr
   N/xcFgGQlcXFclwt4YD0uZB4Evsowq0vIqXc0kTsOYSduR7D0rV57Ltml
   GOzLLyXbRNA86R2uqaFW4DiKPS+GDrDlU7dqkJdLQbMk4Z7CM3mJYwyWh
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yu7wkN9+I7fVB+84sgevwm/Fcn1zI3OrEoXq/wC/7jI6xgO1bfOpqdAEb204briH+nN7MPbXEA
 Ayj3yk1pjMBDs1Qbvk/8Mdq9O8AxNu1Ftgv1oMCgprFWZI8RPkhFnbou0CHCJt2cbk04xnChtW
 b0Os76oZbM00MnPZFLyFKC/U4IJSJctxEvCkjNqK1hAr4/j9svpOHS2F9gam3sUiwVFYQNF2an
 YkUdl008MgR7OXXxu22u6yKlq10r6AEEqeE2cfVBIqr1x1hSSWdQUVUjRgcbPtbGkETki7ZX2c
 jo7GIGMHCJhozx+J8Cck7q09
X-SBRS: 5.1
X-MesageID: 52251320
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mZRoAak58A2M27MqqKZ5KJyQSMDpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="52251320"
Date: Wed, 8 Sep 2021 12:14:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
Message-ID: <YTibMaayiWlJwcZ/@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-6-anthony.perard@citrix.com>
 <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com>

On Tue, Sep 07, 2021 at 08:14:14AM +0200, Jan Beulich wrote:
> On 24.08.2021 12:49, Anthony PERARD wrote:
> > This replace the use of a single .c file use for multiple .o file by
> > creating multiple .c file including the first one.
> > 
> > There's quite a few issues with trying to build more than one object
> > file from a single source file: there's is a duplication of the make
> > rules to generate those targets; there is an additional ".file" symbol
> > added in order to differentiate between the object files; and the
> > tools/symbols have an heuristic to try to pick up the right ".file".
> > 
> > This patch adds new .c source file which avoid the need to add a
> > second ".file" symbol and thus avoid the need to deal with those
> > issues.
> > 
> > Also remove __OBJECT_FILE__ from $(CC) command line as it isn't used
> > anywhere anymore. And remove the macro "build-intermediate" since the
> > generic rules for single targets can be used.
> > 
> > And rename the objects in mm/hap/ to remove the extra "level".
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Hmm, when replying to 00/51 I didn't recall I gave an R-b for this one
> already. I'd like to restrict it some: It should be taken to stand for
> the technical correctness of the change. Nevertheless I'm not really
> happy with the introduction of the various tiny source files. I've
> meanwhile been wondering: Can't these be generated (in the build tree,
> as soon as that's possible to be separate) rather than getting put in
> the repo?

Do we really need to generated those never to be change tiny source
file? Do we really need to make the build system a lot more complicated?

With those tiny source file in a different directory to the main source
file, we need to add "-I" to CFLAGS. (source tree vs build tree.)

I don't like preparation phase, I'd rather do just-in-time generation of
those tiny file (if we really have too...) as to let make organize
itself on when to do things. That mean, extra targets on how to generate
the files, and telling make that those would be intermediate target
shouldn't be deleted to avoid the final object from been regenerated
over and over again (I'm not sure why the rebuild of tiny source file
happen when they are intermediate, maybe because FORCE prerequisite on
%.o).

Can't we commit this patch as is? What kind of issue is there with those
tiny source files? Should we add a warning in those tiny source files,
something like "No modification of this file allowed, it's part of the
build system." ?

Thanks,

-- 
Anthony PERARD

