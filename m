Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE837F5076
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 20:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639092.996051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5slq-0000VM-Gh; Wed, 22 Nov 2023 19:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639092.996051; Wed, 22 Nov 2023 19:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5slq-0000S1-Cj; Wed, 22 Nov 2023 19:20:22 +0000
Received: by outflank-mailman (input) for mailman id 639092;
 Wed, 22 Nov 2023 19:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5slo-0000Rm-9e
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 19:20:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b89c597-896c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 20:20:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAB2C61F15;
 Wed, 22 Nov 2023 19:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4DAC433C7;
 Wed, 22 Nov 2023 19:20:14 +0000 (UTC)
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
X-Inumbo-ID: 2b89c597-896c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700680816;
	bh=jJTDm6D0sEdrDOknMXFrQ1138SbaCgdI4zrMGwOu82U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SXWzGZAjYS4ULOd3T5y99BQqV73KN9lHg0tGygUWkfzwbh/JWCbhu0OJh+0emffcN
	 yT8Zq5lxfKNi9ZwgUnvD9z7VcMHVjyi+XFf71EXN6gfWKTH1Q3Onz4xabo57rCFZZ7
	 s0tReXhAUk0L5QiQymHwpAKPJb/Y/tvNnbTLkPLDxPRYZdRCAKF0q72BjqDwVcrSoC
	 VWshpsI4X4S3NoxELad3ddN50SGW8zoV/Y6cjCwocTINqQqNZgS6dD+VcakJOhBSpb
	 xfiDvxpUVcHxB6zY8cHrgBQ4eFtB4e3AbdjLX61E81caEopSMBYM3vDN7Ob3vMoPZG
	 jipZb2JRGTleA==
Date: Wed, 22 Nov 2023 11:20:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
In-Reply-To: <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311221118500.2053963@ubuntu-linux-20-04-desktop>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com> <20231121201540.1528161-5-andrew.cooper3@citrix.com> <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com> <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com> <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
 <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1705390966-1700680816=:2053963"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1705390966-1700680816=:2053963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, Andrew Cooper wrote:
> On 22/11/2023 3:49 pm, Luca Fancellu wrote:
> >
> >> On 21 Nov 2023, at 20:41, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>
> >> On 21/11/2023 8:33 pm, Luca Fancellu wrote:
> >>> + CC henry
> >>>
> >>>> On 21 Nov 2023, at 20:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>>
> >>>> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
> >>>> logic looks incorrect.  It was inherited from the x86 side, where the logic
> >>>> was redundant and has now been removed.
> >>>>
> >>>> In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
> >>>> no logic at all to strip this before parsing it as the command line.
> >>>>
> >>>> The absence of any logic to strip an image name suggests that it shouldn't
> >>>> exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
> >>>> is going to lead to some unexpected behaviour on boot.
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> ---
> >>>> CC: Jan Beulich <JBeulich@suse.com>
> >>>> CC: Roger Pau Monné <roger.pau@citrix.com>
> >>>> CC: Wei Liu <wl@xen.org>
> >>>> CC: Stefano Stabellini <sstabellini@kernel.org>
> >>>> CC: Julien Grall <julien@xen.org>
> >>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> >>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>
> >>>> v2:
> >>>> * New.
> >>>>
> >>>> I'm afraid that all of this reasoning is based on reading the source code.  I
> >>>> don't have any way to try this out in a real ARM UEFI environment.
> >>> I will test this one tomorrow on an arm board
> > I confirm that booting though UEFI on an arm board works
> >
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Thanks, and you confirmed that the first cmdline parameter is still usable?

Assuming Luca or Henry come back with a confirmation that the first
command line parameter is still passed through correctly:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1705390966-1700680816=:2053963--

