Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EC7709E2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577311.904343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1be-0000bm-I4; Fri, 04 Aug 2023 20:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577311.904343; Fri, 04 Aug 2023 20:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1be-0000YQ-Et; Fri, 04 Aug 2023 20:41:06 +0000
Received: by outflank-mailman (input) for mailman id 577311;
 Fri, 04 Aug 2023 20:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1bc-0000YK-VZ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:41:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 394c9368-3307-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 22:41:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5B77620A7;
 Fri,  4 Aug 2023 20:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3DEC433C8;
 Fri,  4 Aug 2023 20:40:58 +0000 (UTC)
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
X-Inumbo-ID: 394c9368-3307-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691181660;
	bh=Q2MFQONWqVMXPNZghgIWxXFH2+6xxlzM8Y2/O5b+18M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gY9xMlOar7UfdCABbNoKCLWMeB2QO7HhCDx+Zu1/ycT+Ti9/smjVTt1o0Mjhi8k3N
	 7mx/FpMtdI3jG80LYDjG/0MP9EmG59NWxYc60UBspDC6tKph3/NhhliTy+g3JPXM8I
	 Ab0OH0YV1ujyewo41H/hnMjrppao0195Q1f6ev/XVne4CB4vUEQ7wlrIgKF1Em+F3W
	 VCa13T2qOJJpKWEpf2GVS+lIfdJZ2moivFpt7cCJwMAk8YFWdEiSvsR8Tf1QeNWOfP
	 Opr1z/eT2ykoAi9nHXXqIYouqSnTGKQ72Mu+8fEtb/QAb12lBMd+MR5StUboQF1Q/W
	 TrIT7sK3unLXw==
Date: Fri, 4 Aug 2023 13:40:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, 
    Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Address MISRA C:2012 Rule 8.4
In-Reply-To: <95a6d085-cbb9-ecb6-134d-6e4d994bfd35@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308041331260.2127516@ubuntu-linux-20-04-desktop>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com> <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop> <00fb1a58849ec08534465df2f8ca2284@bugseng.com> <95a6d085-cbb9-ecb6-134d-6e4d994bfd35@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 11:47, Nicola Vetrini wrote:
> > Upon further examination, I identified the following patterns:
> > 
> > 1. Functions defined in .c called only from asm code (e.g., the already 
> > mentioned __start_xen)
> > 2. Functions/variables declared in a .h, defined in a .c that does not 
> > include the .h with the declaration
> > (e.g., 'fill_console_start_info' is defined in 'xen/drivers/vga.c', 
> > declared in 'xen/include/xen/console.h' which is not visible when 
> > compiling the .c).
> > 3. Variables that are either extern or not, such as 'acpi_gbl_FADT' in 
> > 'xen/include/acpi/acglobal.h', depending on
> >     DEFINE_ACPI_GLOBALS
> > 
> > Below are the proposed resolution strategies:
> > 
> > 1. I would advise to add the declaration in the relative .h, to support 
> > automatic consistency checks with the
> >     implementation and a quick reference when touching the asm.
> 
> That'll need discussing first.

My take is that it would be nicer if they were declared in .h files. It
would also be useful for ourselves as documentation/reference. So I
would be OK accepting patches like that. But at the same time I don't
see it as a must-have requirement for safety (the .h declaration would
not be actually used).


> > 2. To comply with the rule, the header with the declaration should be 
> > included. Also note that there are some
> >     corner cases, such as 'get_sec', which is used in 'cper.h' without 
> > including 'time.h' (which should gain a
> >     declaration for it).
> 
> This one of course wants fixing wherever found.

+1


> > 3. One possible resolution pattern is including 'acglobal.h' twice 
> > (either directly or indirectly trough acpi.h, if
> >     the latter does not cause other issues) like so:
> > 
> >     (assuming DEFINE_ACPI_GLOBALS is undefined here)
> >     #include "acglobal.h"
> >     #define DEFINE_ACPI_GLOBALS
> >     #include  "acglobal.h"
> > 
> >    this way, the rule is followed properly, though it's not the prettiest 
> > pattern and also clashes with the objectives
> >    of D4.10 ("Precautions shall be taken in order to prevent the contents 
> > of a header file being included
> >    more than once"), but then a motivated exception is allowed there.
> 
> Not really sure about this one.
 
I would leave these alone because it was clearly done on purpose "to
simplify maintenance of the code" as the in-code comment claims. Also
this is very old code, probably inherited from somewhere else and never
changed.

