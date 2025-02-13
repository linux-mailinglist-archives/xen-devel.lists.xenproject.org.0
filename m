Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179DA34E35
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 20:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887961.1297384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tieaU-00009B-GZ; Thu, 13 Feb 2025 19:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887961.1297384; Thu, 13 Feb 2025 19:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tieaU-00007C-Dg; Thu, 13 Feb 2025 19:09:26 +0000
Received: by outflank-mailman (input) for mailman id 887961;
 Thu, 13 Feb 2025 19:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tieaT-000076-8j
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 19:09:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 088eace2-ea3e-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 20:09:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87666A4288A;
 Thu, 13 Feb 2025 19:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDADC4CED1;
 Thu, 13 Feb 2025 19:09:20 +0000 (UTC)
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
X-Inumbo-ID: 088eace2-ea3e-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739473761;
	bh=eJyQSi4LwTe4ZfmmybeMGf2JNJMRCJJIq0lG+Am6ybY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RaP2jIit6zh9H+C/uYf3qQJ6XItmetepNlm+ViRsWZNm81d0ti0IzMyt5bDB8GRC5
	 G+yijUmtAC7KVJyaVuY+R9b/MK56hhfhFMv954liOkUjC+R1AQlb58IcsFV3NBET5r
	 okL4sb8qlYHYWm+HjZ4xLB2nDG83qGKYfhkQBczyGnDSwnF8x9SmvJ7L5LXmtWW97B
	 WEmVG9lnYc/2Nt6gPM1250D7oa97gsNfT60SJi1rGaZpfFLw2fltvutsIWgKOFMqL2
	 O+ykVC8r/Voe52VFrCw1Q3spy1e7h3spGsNieW29RTEbHCGAmaySYM5HQrRi9QlESb
	 JAcNi4mvj0awQ==
Date: Thu, 13 Feb 2025 11:09:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [BUG?] Wrong RC reported during 'make install'
In-Reply-To: <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502131103300.619090@ubuntu-linux-20-04-desktop>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com> <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop> <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com> <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1937910790-1739473669=:619090"
Content-ID: <alpine.DEB.2.22.394.2502131107580.619090@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1937910790-1739473669=:619090
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502131107581.619090@ubuntu-linux-20-04-desktop>

On Thu, 13 Feb 2025, Jan Beulich wrote:
> On 13.02.2025 01:51, Andrew Cooper wrote:
> > On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
> >> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
> >>> Hello everyone,
> >>>
> >>> During the installation of Xen on an ARM server machine from the source code,
> >>> I found that the wrong release candidate (rc) is being used:
> >>>   $ make install  
> >>>     install -m0644 -p xen //boot/xen-4.20-rc  
> >>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
> >>>     make[1]: *** [Makefile:507: _install] Error 1
> >>> My expectation is that it should be xen-4.20-rc4.
> >>>
> >>> I'm not sure if this behavior is intentional or if users are expected to set
> >>> the XEN_VENDORVERSION variable manually to ensure the correct release
> >>> candidate number.
> >>>
> >>> In my opinion, we should set the proper release candidate number after
> >>> "xen-4.20-rc" automatically.
> >>>
> >>> Does anyone have any thoughts or suggestions on how to resolve this issue?
> >> Hi Oleksii,
> >>
> >> I did a quick test and I see exactly the same on x86 as well. This patch
> >> fixes it, but then it would need someone to update the RC number in
> >> xen/Makefile every time a new RC is made.
> >>
> >> ---
> >> xen: add RC version number to xen filename
> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > This is a direct consequence of the request to keep XEN_EXTRAVERSION at
> > "-rc" throughout the release cycle.
> > 
> > I'm having to manually edit that simply to create the tarballs
> > correctly, which in turn means that the tarball isn't a byte-for-byte
> > identical `git archive` of the tag it purports to be.
> 
> Just for my understanding - may I ask why this editing is necessary?
> Other release technicians never mentioned the (indeed undesirable)
> need to do so.

This is not an answer to Jan's question, more me highlighting
priorities.

While having the appropriate RC version in the Xen name during the RC
phase of the release process would be nice, I do not believe it is
mandatory. We do need it in the official release tarballs though.

So the most important consideration for me is making the release
technician's job easier and less error-prone. Therefore, I believe we
should follow Andrew and Julien's recommendation on this.

Andrew, just to be clear, are you recommending to go with a patch
similar to the one I posted, and then update the XEN_VENDORVERSION
with a new commit every time there is a new RC? Or are you suggesting
something else? I wasn't certain reading your reply.
--8323329-1937910790-1739473669=:619090--

