Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D98FB30A08
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 02:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089390.1446990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upFLo-00022Z-9v; Fri, 22 Aug 2025 00:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089390.1446990; Fri, 22 Aug 2025 00:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upFLo-000216-6O; Fri, 22 Aug 2025 00:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1089390;
 Fri, 22 Aug 2025 00:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMUB=3C=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upFLm-000210-Bj
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 00:09:46 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf9c983-7eec-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 02:09:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E7D3B6020A;
 Fri, 22 Aug 2025 00:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEFFC4CEEB;
 Fri, 22 Aug 2025 00:09:39 +0000 (UTC)
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
X-Inumbo-ID: 4cf9c983-7eec-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755821380;
	bh=qkR/4vvHzWcJvGddiFZAZtqkv8jjSXlDiu/axZp1pqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LeSC4mtpp25cSU5Nn8U8LHxwEYfewmasuf2wZUfqeds87S6ae/T10FC6c9x7hV26I
	 Q61SEd6MKfKp/71G/373MppkqvtG5s8uX+zZjxwhULPdDMSEcbsoRNGv9qpizjKOsH
	 BmXb5bpHXIcjdjTzMia3mqMHUA2m2XtgeEKo1YXj8tGN+x4szn7b4AHh9jAqwUeoiw
	 mLCaBa9xn2DtnXU1X8eiFH4zHcN/WkQdIliOIGg9MyDrPROhKJjoTA1RX13ZfwAvCN
	 A8x38NqK4zp5LX7wPThD9oRQSQ6HXrBrusXe0nCDucg7xZsCbKWlMdY3oef0sn3Xc1
	 4+uvP8cKfG0og==
Date: Thu, 21 Aug 2025 17:09:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <JBeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Use 'watchdog' for x86 hardware
In-Reply-To: <aKcPVSFVxKJJFHrF@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2508211709270.2743087@ubuntu-linux-20-04-desktop>
References: <20250821120652.3910926-1-andrew.cooper3@citrix.com> <aKcPVSFVxKJJFHrF@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1136081158-1755821381=:2743087"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1136081158-1755821381=:2743087
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Aug 2025, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 21, 2025 at 01:06:52PM +0100, Andrew Cooper wrote:
> > This detects various hangs and turns them into a crash with backtrace.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Should it also apply to in-QEMU tests?
> 
> Anyway:
> 
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1136081158-1755821381=:2743087--

