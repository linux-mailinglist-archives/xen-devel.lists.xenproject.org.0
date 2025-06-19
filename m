Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9DBAE0E4D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 21:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020360.1396653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSLMy-0001nA-9E; Thu, 19 Jun 2025 19:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020360.1396653; Thu, 19 Jun 2025 19:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSLMy-0001km-6a; Thu, 19 Jun 2025 19:56:20 +0000
Received: by outflank-mailman (input) for mailman id 1020360;
 Thu, 19 Jun 2025 19:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSLMw-0001kg-PL
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 19:56:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 758dc98b-4d47-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 21:56:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 583A161132;
 Thu, 19 Jun 2025 19:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2501C4CEEA;
 Thu, 19 Jun 2025 19:56:12 +0000 (UTC)
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
X-Inumbo-ID: 758dc98b-4d47-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362975;
	bh=I4WpJOSXLuM/a+zlpTdJgDBH7ww+V9/bs5xZ0+Ebs+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NJSnlbPlXWerqM6C9sPPLCLJJqMD85W4mtrIrpruG9Vb+QzNAvfFuCqh9Ogwy8zRS
	 3IZMIG80ifa0AvuWfIWblQ34rSB2uvVCq2vcfr4hFGuXDOyVJGlgchtrMuoq4DU3ih
	 TR1H3tiLTGOB2wGDVnWBOb4vaCgQ2Jxx/Tv6yes5oRRh8h6ey0+Jy7LDCQDUa3W47P
	 PFAEyVGx1uDaAiwfxZxaf5Z2DxWocozcOvqKvSPAX/yxtnlm+UqD2HdZ9uzUQ9TKk5
	 idrNrFqYhBVpdaGYX7uYXmv8NuG88Jogxz5xvTLMxrZUlWzhJsnoHDCH2gzPp5hxyv
	 z6aXsIcLuvorQ==
Date: Thu, 19 Jun 2025 12:56:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Ross Lagerwall <ross.lagerwall@cloud.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, security@xen.org, 
    Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>, 
    Frediano Ziglio <frediano.ziglio@cloud.com>, 
    Gerald Elder-Vass <gerald.elder-vass@cloud.com>, 
    Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
In-Reply-To: <aFQgd1uSWlAcgFrr@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2506191254240.1780597@ubuntu-linux-20-04-desktop>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com> <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com> <aFQgd1uSWlAcgFrr@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-492911436-1750362975=:1780597"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-492911436-1750362975=:1780597
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Jun 2025, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 19, 2025 at 03:16:51PM +0100, Ross Lagerwall wrote:
> > I think a section on PCI passthrough is also warranted. i.e. preventing misuse
> > of a device to exploit Secure Boot.
> 
> While I agree it makes sense, I wonder if it's in scope for UEFI
> Secure Boot as defined by Microsoft? It may have implication for example
> on PCI passthrough to a PV domains.

If we bring DomUs into the discussion, then I think we need to make a
distinction between predefined DomUs, which could have signatures
verified by Secure Boot (such as Dom0 and hyperlaunch/dom0less guests),
and other dynamically created DomUs which could be fetched from the
network and potentially started without signature verification or prior
knowledge.
--8323329-492911436-1750362975=:1780597--

