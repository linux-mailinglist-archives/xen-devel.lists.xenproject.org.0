Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD6728B2C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 00:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545460.851906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7OHx-0005VB-I7; Thu, 08 Jun 2023 22:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545460.851906; Thu, 08 Jun 2023 22:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7OHx-0005Sa-FE; Thu, 08 Jun 2023 22:39:29 +0000
Received: by outflank-mailman (input) for mailman id 545460;
 Thu, 08 Jun 2023 22:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZIE=B4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q7OHx-0005SU-13
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 22:39:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53028c5b-064d-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 00:39:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52A1161560;
 Thu,  8 Jun 2023 22:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6270C433D2;
 Thu,  8 Jun 2023 22:39:24 +0000 (UTC)
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
X-Inumbo-ID: 53028c5b-064d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686263965;
	bh=t98gCWRtymUpoZf2mA9dWX7sG7VwReFqVahHJeFbYJg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QhDX1EeauvALW/A0C4QysHEPgUnWgcw6UiH80gFVGkqq0l9NGBnz2ahZdJo1TalIO
	 kS5st9OEDQvWUyjhVc1tGC0xCWHIs4Xu1X6MgHpUrEEeUvaEeAEeyx5hTaf9SVZgE3
	 M/d7JTbuq88EAgNDYmGBClVjQeMWYuwQ374R7QcLgSFf6WG+hQuluJ8xNqmDFvZmyM
	 vUzaBe3PDm7KLaIUtjWHzWj++n6jkSk89s2eILJI3xdTJdgSQKmN3K9YA3fdkqHE9K
	 fO16cGQNQJflbRz+qdFyxeDCVaaVoc+0KztbeX22jp8Ft430wdLZvFlFD1wgXcfaQF
	 2sBIYKdnv8ChQ==
Date: Thu, 8 Jun 2023 15:39:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiatong Shen <yshxxsjt715@gmail.com>
cc: xen-users@lists.xenproject.org, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
In-Reply-To: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1331518572-1686263885=:3803068"
Content-ID: <alpine.DEB.2.22.394.2306081538220.3803068@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1331518572-1686263885=:3803068
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2306081538221.3803068@ubuntu-linux-20-04-desktop>

Hi Jiatong,

Do you have access to the serial? If so, it is possible that the boot
is actually successful and it is only the screen initialization the
problem.

If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues
with screen initialization.

Cheers,

Stefano

On Fri, 9 Jun 2023, Jiatong Shen wrote:
> Hello community,
>    
> I need help for debugging XEN on aarch64 architecture. The machine I am working on is a kunpeng 920 armv8 compatible CPU. I use debian 11
> as operating system and installed xen-system-arm64 without any problem. But when I boot into xen hypervisor mode, the machine screen is
> black out without any output or any helpful debugging message. 
> 
>   Could you generously provide some hints for debugging the issue?  Thank you very much in advance and looking forward to hearing from you.
> 
> --
> 
> Best Regards,
> 
> Jiatong Shen
> 
> 
--8323329-1331518572-1686263885=:3803068--

