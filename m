Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389297A803
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 21:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799668.1209632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqHqe-0001IR-2D; Mon, 16 Sep 2024 19:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799668.1209632; Mon, 16 Sep 2024 19:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqHqd-0001Fk-VH; Mon, 16 Sep 2024 19:57:23 +0000
Received: by outflank-mailman (input) for mailman id 799668;
 Mon, 16 Sep 2024 19:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqHqc-0001Fe-9I
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 19:57:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1062cea-7465-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 21:57:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6D297A41FE7;
 Mon, 16 Sep 2024 19:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C01C4CEC4;
 Mon, 16 Sep 2024 19:57:16 +0000 (UTC)
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
X-Inumbo-ID: e1062cea-7465-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726516637;
	bh=niYYyfgzByocnylGii80fVD/vIhV37FgTtJzmxkgTb0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Oj2Umh9NKiXejHdoxokK61mloMzHba9DW1T9lYT1Wc0ey+7749svCDheQLGAhEykq
	 X81m1Q/QJ7JD1K5Zky9i/cNUDymwASqyWT8KmZ1aiHfpfp1vcSJ8hyTNRxteJGxtRE
	 V+qvd3Shl6PD8dAet+uAuPbK3eUX9QKjp9oeu396o6MrhFvSk+X414NaggPi9qspJ1
	 M22hbfsaRYfKAFhmHVanb6+d2hAVLi2dVIjA18goCak67+POOUbiLjsW2DVxduTLs/
	 U6jNJzW4vpM2sih1iP/Ueos1FWwytveeHE0pDfwTaW4z/osvkIdevvRkjtWhBsfjyA
	 RLK+Fok+jZGrQ==
Date: Mon, 16 Sep 2024 12:57:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
In-Reply-To: <Zufh7DOSCwzhrpZG@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com> <Zufh7DOSCwzhrpZG@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-324846098-1726516389=:1417852"
Content-ID: <alpine.DEB.2.22.394.2409161253250.1417852@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-324846098-1726516389=:1417852
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409161253251.1417852@ubuntu-linux-20-04-desktop>

On Mon, 16 Sep 2024, Roger Pau Monné wrote:
> On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
> > Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
> > systems that don't need it.
> 
> Same comment as in the VGA patch, you need to handle the user passing
> X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
> built without ACPI PM timer support.

I also think that the flag should not be ignored. I think that Xen
should return error if a user is passing a domain feature not supported
by a particular version of the Xen build. I don't think that libxl needs
to be changed as part of this patch necessarily.
--8323329-324846098-1726516389=:1417852--

