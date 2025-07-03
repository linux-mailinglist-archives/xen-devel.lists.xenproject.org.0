Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B1AF7F88
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 20:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032405.1406080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXOIx-000219-4O; Thu, 03 Jul 2025 18:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032405.1406080; Thu, 03 Jul 2025 18:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXOIx-0001zK-1D; Thu, 03 Jul 2025 18:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1032405;
 Thu, 03 Jul 2025 18:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uXOIv-0001zE-QE
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 18:05:01 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 396a07e1-5838-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 20:04:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E1AA61446;
 Thu,  3 Jul 2025 18:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC4C4CEE3;
 Thu,  3 Jul 2025 18:04:52 +0000 (UTC)
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
X-Inumbo-ID: 396a07e1-5838-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751565894;
	bh=K8Qe3m0I5WGzYs8KNwq3HzjXHJf8gI3K2o5M01fibtk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F6gbsmhcLixc09BqkiVQZ3p3+tRbfmw34oaRemWBlmCqdbJYX1hX2lwgLVb7ixAnz
	 W5cYEB4EzrdJBO3xnVX4sSowdQt+yCFh6btDRDK8Lxvea9WUo8lT9EX6s1UKI7oT/H
	 q629eL3Qqdg0l0rxnKEEPLM236QdIGTXta7vgP9vfo5tVaSxvLIAClJWfEXrTAYNFN
	 s2G9MKZlfyxlUH0yFpIbV8h6kAW42Ru13zXdUM7bj0Pb5+iI8UGsiRy+HDUlJ2+2bS
	 Uc6rOM63IqTxOjhC5+/67aJUbnY70B5GpYJhlqOYDAqGEVb5nsOl1+tnhaltP+djW1
	 ZwdYsy08VqgHA==
Date: Thu, 3 Jul 2025 11:04:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <aGZCYvaH6j80cmAO@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2507031103360.605088@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGZCYvaH6j80cmAO@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-661476635-1751565894=:605088"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-661476635-1751565894=:605088
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Jul 2025, Roger Pau Monné wrote:
> On Fri, Jun 27, 2025 at 07:08:29PM -0700, Stefano Stabellini wrote:
> > Hi Roger,
> > 
> > We have an ARM board with the following memory layout:
> > 
> > 0x0-0x80000000, 0, 2G
> > 0x800000000,0x880000000, 32GB, 2G
> > 0x50000000000-0x50080000000 5T, 2GB 
> > 0x60000000000-0x60080000000 6T, 2GB 
> > 0x70000000000-0x70080000000 7T, 2GB 
> 
> I would like to add this memory map to the PDX unit testing, do you
> have a name I could use as a reference?  For example for the Intel
> sparse map I'm using: "Real memory map from a 4s Intel GNR.".  I
> currently have yours listed as: "Stefano's ARM board.", but that's not
> a very descriptive naming :).

The name of the board is AMD "Versal Gen 2"
--8323329-661476635-1751565894=:605088--

