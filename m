Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D587F620
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695209.1084801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQK0-0007wu-8L; Tue, 19 Mar 2024 03:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695209.1084801; Tue, 19 Mar 2024 03:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQK0-0007ux-4t; Tue, 19 Mar 2024 03:39:28 +0000
Received: by outflank-mailman (input) for mailman id 695209;
 Tue, 19 Mar 2024 03:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQJy-0007tZ-Ca
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:39:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 462dd0d3-e5a2-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 04:39:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1C5ECE0AAF;
 Tue, 19 Mar 2024 03:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6A0C433C7;
 Tue, 19 Mar 2024 03:39:18 +0000 (UTC)
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
X-Inumbo-ID: 462dd0d3-e5a2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819560;
	bh=ipxwmoYe3sUV/2+U7vcS9yuguFs4t7xBD6cS3jUqb/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hGTFaWOJGcxb/eEFT1cKauscJr67gg+c5TFm3NmKgf4xP0WLUfqpaaaxiPyf365xV
	 PvZiiAyjLdYR8+OJefBn1Buw25Ah2ZWhkE+yYFHcYgfdns//Qzy6woXV38vnoq33nY
	 cm9LAae3GEvfn2UF/pGhuFURMTqQ/ZMsV0cAj7mb0rgsFEtUQgAQx4ZGDd/WWhlcjc
	 0lOwSXrONSsWMI6+eeaQz7xfVtqIxtvqm8OURPFDvnZDN/EnmPOKy0jZvhGu5QJLnx
	 pUHzJJrjIuTM/+t5G+GK8ELwtpRcOI9oVtvExULJkxGHzvuMS9b0OHsIzTCjWtYkEJ
	 vPFMO1g6wuMMw==
Date: Mon, 18 Mar 2024 21:39:16 -0600 (MDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: George Dunlap <george.dunlap@cloud.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
In-Reply-To: <5128255f-fe52-4425-b168-34946c0c901e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403181752370.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop> <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop> <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop> <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com> <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com> <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com> <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com> <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org> <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
 <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com> <5128255f-fe52-4425-b168-34946c0c901e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Jan Beulich wrote:
> The named reasons simply aren't convincing to me, at all. There's no
> loss towards the "end goals" when "unsigned int" is used instead of
> "uint32_t". Plus I recall Andrew putting under question use of
> "unsigned int" for various hypercall parameter declarations, indicating
> his belief that "unsigned long" ought to be used. That's, to me, quite
> the opposite of using fixed-width types here, as there's no uniformly
> correct fixed-width type to use in that case.
> 
> So to me, besides there not having been technical arguments towards
> the need to use fixed width types here, there's actually added
> confusion about what's actually wanted. Imo if we started using fixed-
> width types for hypercall handler parameter declarations, (almost?) all
> non-handle ones would likely want to be converted. Consistency, after
> all, is part of the "easy to maintain code" goal. Plus without
> consistency how would one determine when to use what kind of types.

[...]

> The main use of fixed width types, to me, is in interface structure
> definitions - between Xen and hardware / firmware, or in hypercall
> structures. I'm afraid I have a hard time seeing good uses outside of
> that. Even in inline assembly, types of variables used for inputs or
> outputs don't strictly need to be fixed-width; I can somewhat accept
> their use there for documentation purposes.


Non-ABI interfaces are OK with native types.

Our ABI interfaces are, for better or for worse, described using C
header files. Looking at these header files, it should be clear the size
and alignment of all integer parameters.

To that end, I think we should use fixed-width types in all ABIs,
including hypercall entry points. In my opinion, C hypercall entry
points are part of the ABI and should match the integer types used in
the public header files. I don't consider the little assembly code on
hypercall entry as important. I think we should avoid having one
description of the hypercall types in sched.h and different types used
in do_sched_op.

Sometimes, we might have parameters that vary in size depending on the
architecture. For instance, a parameter could be 32-bit for 32-bit
architectures and 64-bit for 64-bit architectures.

For these cases, using "unsigned long", together with a document like
the one I submitted recently to xen-devel, is a good way forward: it
is semantically correct on all architectures, and it still comes with a
precise size and alignment as described in the document. In this
context, "unsigned long" means "register size" (on ARM we have
register_t). This is the one case where it makes sense not to use a
fixed-width type. Alternatively we would have to use #ifdefs.

