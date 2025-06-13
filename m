Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03263AD975D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 23:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014949.1392958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQBzZ-0002DX-Oa; Fri, 13 Jun 2025 21:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014949.1392958; Fri, 13 Jun 2025 21:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQBzZ-0002C6-Kp; Fri, 13 Jun 2025 21:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1014949;
 Fri, 13 Jun 2025 21:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQBzY-0002C0-Gh
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 21:31:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b621f1ba-489d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 23:31:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D7A043A5F;
 Fri, 13 Jun 2025 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F651C4CEE3;
 Fri, 13 Jun 2025 21:31:03 +0000 (UTC)
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
X-Inumbo-ID: b621f1ba-489d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749850264;
	bh=TCTvJZPfNya2wmawUjIhBjizU6uMiRdystFvzNwHQxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fjkF5Ch11BoMQz8usTpv5JcnStEWSXHgxE9GggQDtDVmT3344fAYwvY5tNjmKDX2r
	 2QDO3fr5549bgyUjxZLRVkJmv6bDouxgQXB+wDGk8Q1vV5FvZP7XlMYlY23/y67/Yw
	 OVqkJ3Da81j2nIzWm+V8Nj8turlQg03AUh7H0fnYMn8rpVj+HH42E0bwpw8rbH3DIZ
	 Dx8kN6xGdyiGbXJ3H+8TBKI2Lavnm/mWSGpQY7InIA5orceVmKMHtMO5hjlfFFKT9P
	 QUjFkeeX6qQ4dyRrHBY2k9JRjByx+inG8O1Gkwnqn4qPElEtwFpJDFaSt8QpGtWuPz
	 TdphKy5Kukfsg==
Date: Fri, 13 Jun 2025 14:31:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, sstabellini@kernel.org
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
In-Reply-To: <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506131424480.8480@ubuntu-linux-20-04-desktop>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com> <20250605111638.2869914-2-andrew.cooper3@citrix.com> <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com> <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com> <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com> <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1885957098-1749850095=:8480"
Content-ID: <alpine.DEB.2.22.394.2506131429260.8480@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1885957098-1749850095=:8480
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506131429261.8480@ubuntu-linux-20-04-desktop>

On Fri, 6 Jun 2025, Jan Beulich wrote:
> > But the argument I'm going to make this this:  Why do you want a check,
> > even if you can find a correct one (and as said before, I cannot)?
> > 
> > This function is run exactly once.  We've excluded "nothing given by the
> > toolchain", and excluded "what the toolchain gave us was not the
> > expected ELF note".  The only thing left (modulo toolchain bugs) is the
> > CodeView region, and if it's not a valid CodeView region then we've
> > wasted a handful of cycles.
> 
> Two reasons: Having code which cannot possibly do anything useful isn't
> good. Misra calls the latest the body of the inner if() "unreachable code"
> and objects to the presence of such in a build. (I'm pretty sure Eclair
> wouldn't spot it, but that doesn't eliminate this being a violation of
> the respective rule.)

As far as I can tell this code can be reachable simply by having an
appropriate test with Xen booted via a non-EFI method and a CodeView
record being present. No code changes to Xen needed.


> And then, based on your reasoning above, why don't you also drop the
> #ifdef CONFIG_X86?

Because while theoretically possible, today there is not a single test
that would allow us to trigger this code on ARM. We would need to change
Xen to do it first.
--8323329-1885957098-1749850095=:8480--

