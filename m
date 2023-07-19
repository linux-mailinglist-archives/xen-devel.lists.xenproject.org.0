Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55175A2D9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 01:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566231.884771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGeA-0006fy-67; Wed, 19 Jul 2023 23:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566231.884771; Wed, 19 Jul 2023 23:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGeA-0006d6-3J; Wed, 19 Jul 2023 23:31:54 +0000
Received: by outflank-mailman (input) for mailman id 566231;
 Wed, 19 Jul 2023 23:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D1l=DF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMGe8-0006d0-BT
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 23:31:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd377e0-268c-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 01:31:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09EEE61877;
 Wed, 19 Jul 2023 23:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56228C433C7;
 Wed, 19 Jul 2023 23:31:43 +0000 (UTC)
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
X-Inumbo-ID: 6dd377e0-268c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689809504;
	bh=DVA0e9kIvNDQy2uop6SmFT0yIwQ/xiM+n9Fdm/b0yQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=acdgQPeJzJFJ1/WUoxMbKDME256jdw4NYoJaokU+6hvdOKcD5PnSGSLQLQ6Uzm0in
	 sySowoHJght6Anhre5bLZOjfR3ta34+oRvEokNMiZGJ5U/T+pjq/0EQKuJoKhcfhe3
	 HTWN82G8RewRKeom1FSCv7hC+ZXjiQEKIkMA66y/TRfYdeNpwPZubzDAyvSdMX3Gj3
	 3D9VZCF3adMHulH0qBzS4DbV7q57sw3Jh2NIwRLBCi6p5H7yAAObFziMKh96+Y9CEL
	 7vhHf9wFgX89dEd41UmSAYAGUQ5TJvrb/w6ShI6IVPL05lDjeE9tY7l9kbPZuDUlw2
	 iZR3hzZhy4xCA==
Date: Wed, 19 Jul 2023 16:31:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Experiments with clang-format and exclude-list.json
In-Reply-To: <040fef3e-9a7f-61bc-13f5-c34f6ffdcb09@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307191630380.3118466@ubuntu-linux-20-04-desktop>
References: <505E6BDD-823F-4337-8FB9-C3294D180E74@arm.com> <040fef3e-9a7f-61bc-13f5-c34f6ffdcb09@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2025689580-1689809503=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2025689580-1689809503=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 18 Jul 2023, Jan Beulich wrote:
> On 18.07.2023 11:13, Luca Fancellu wrote:
> > I’ve done some experiment with clang-format and the hypervisor code (xen/xen/**), I had the need to exclude some files from the tool
> > and I thought to use the exclude-list.json, but since it was intended for MISRA, I’m now asking your feedback about that.
> > 
> > In my opinion it could make sense, because with that list we are excluding everything that is external and not adopting the Xen
> > coding style.
> > 
> > Do you have an opinion on that? Can it be one file? Or should it be a separate file only for the coding style exclusion?
> 
> It feels like back when the file was introduced I already commented on
> the potential for it to be multi-use, so long as it's actually dealing
> with the slightly separate needs. IOW I think it can be one file, but
> it needs to allow for files that want excluding from rule checkers, but
> not from style ones, and vice versa. Whether specific "comment" wording
> would be suitable, or whether instead separate attributes would want
> introducing is TBD.

I agree
--8323329-2025689580-1689809503=:3118466--

