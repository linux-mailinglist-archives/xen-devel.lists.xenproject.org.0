Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DA991127
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810644.1223386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpW7-0005XP-H0; Fri, 04 Oct 2024 21:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810644.1223386; Fri, 04 Oct 2024 21:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpW7-0005Vk-EH; Fri, 04 Oct 2024 21:07:15 +0000
Received: by outflank-mailman (input) for mailman id 810644;
 Fri, 04 Oct 2024 21:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swpW5-0005CM-Rf
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:07:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fe45f49-8294-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 23:07:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2CD65C5AA7;
 Fri,  4 Oct 2024 21:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91A0C4CEC6;
 Fri,  4 Oct 2024 21:07:10 +0000 (UTC)
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
X-Inumbo-ID: 9fe45f49-8294-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728076031;
	bh=2tF0GEJP2TJ1/pu3tvTaFoFp1nZ/tVUvuarVzMfzeVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ttFIiuv7asFL3XMB2BXy+4U3u5FGkUogbjLk0FcurIfRubyNAJ3tbypy4EM7fEMrr
	 HJqp9dYTrP14n7BAcJMakrq91jQYqOlRS5Fvf2/Yq6/ne8sKI8KEI5CTUlxeKHuJlm
	 zFXw0TvpzabE97JZ6JxXh+K2vvq65hkB1pICt1qzlH2ep9VsmUc8dx8BLJSoVcaTTc
	 A5t1Hnyo+BS73IwgPvHb+maGu+t+gFzQt0p1RY4PiWDEMn8oCGDNQUeDk/rsKWNcOs
	 SLEbZSBQlRNX9pfCgYxFodqJQt8W/mo8T39os4RSRXMVVbYCkD4UNzYQMvcnJcr9AH
	 w7apHiGmfUoLg==
Date: Fri, 4 Oct 2024 14:07:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [XEN PATCH v1 1/3] x86/hvm: introduce config option for ACPI PM
 timer
In-Reply-To: <36069df2-64ec-4f0e-908e-d0128630daea@suse.com>
Message-ID: <alpine.DEB.2.22.394.2410041404430.1138574@ubuntu-linux-20-04-desktop>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com> <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com> <Zv_pHR8gUrcHQU5I@macbook.local> <36069df2-64ec-4f0e-908e-d0128630daea@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-452468995-1728076031=:1138574"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-452468995-1728076031=:1138574
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 4 Oct 2024, Jan Beulich wrote:
> On 04.10.2024 15:09, Roger Pau Monné wrote:
> > On Fri, Oct 04, 2024 at 12:31:50PM +0300, Sergiy Kibrik wrote:
> >> --- a/xen/arch/x86/include/asm/domain.h
> >> +++ b/xen/arch/x86/include/asm/domain.h
> >> @@ -496,7 +496,8 @@ struct arch_domain
> >>  
> >>  #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
> >>  #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> >> -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
> >> +#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
> >> +                            !!((d)->arch.emulation_flags & X86_EMU_PM))
> > 
> > Do you really need the IS_ENABLED() here?  If you modify
> > emulation_flags_ok() to reject the flag if not available it won't be
> > possible for any domain to have it set.
> 
> With the IS_ENABLED() the only other approach to have the compiler DCE any
> code left unreachable would be to #define X86_EMU_PM to 0 in that case. I
> guess I'd slightly prefer that alternative, but otherwise the approach used
> here would still be wanted imo.

The compiler DCE is important, either the approach in this patch or
Jan's suggestion would work fine as far as I can tell.
--8323329-452468995-1728076031=:1138574--

