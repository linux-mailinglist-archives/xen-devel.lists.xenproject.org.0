Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F77EA74E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 01:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632085.986054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h3h-0001fa-7F; Tue, 14 Nov 2023 00:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632085.986054; Tue, 14 Nov 2023 00:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h3h-0001cv-4d; Tue, 14 Nov 2023 00:13:37 +0000
Received: by outflank-mailman (input) for mailman id 632085;
 Tue, 14 Nov 2023 00:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2h3g-0001cp-81
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 00:13:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5091c78-8282-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 01:13:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E196CE1905;
 Tue, 14 Nov 2023 00:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6479AC433C8;
 Tue, 14 Nov 2023 00:13:29 +0000 (UTC)
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
X-Inumbo-ID: a5091c78-8282-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699920810;
	bh=5KM0x95TdJ3B67+OgAv+E0t/DodwxIkAF6D4nX3zT4E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qzqisg9nWRRgUWeRz5K55VH5v0atbe3myFsyf1mqkHaqP1iXPoGcpQDym6YGwMVm4
	 doASUnyeNmFgqv4w5Xvg3tQsiSONtC+7Xi02Txa1zBjz7vcq3PLbCDeEvnNR/xuV39
	 RV9/izG0gTwYdB5cDiA76bY6X34SJieB76SUaWTE+8Vm6vSJVBBNBBxP1h74NueW7a
	 MZhjhlbfiW5O/YBNG4mg7tRHIqaqPSIZhF3cqFGzewTc8cSaezBN8O46rHlKr8cAb7
	 YO86inC4IG5ZB0R3dkOWA6JjGD+DIOuSMEGwiBdAHwZwAI63gqCMNrTiyK9UqwAp5C
	 7QeE+wgH5KGcA==
Date: Mon, 13 Nov 2023 16:13:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Artem_Mygaiev@epam.com, 
    Oleksandr_Tyshchenko@epam.com
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
In-Reply-To: <a12642cc-0b2a-42fe-9eff-a5a8642d3373@perard>
Message-ID: <alpine.DEB.2.22.394.2311131612460.160649@ubuntu-linux-20-04-desktop>
References: <20231109154922.49118-1-anthony.perard@citrix.com> <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com> <alpine.DEB.2.22.394.2311091657150.3478774@ubuntu-linux-20-04-desktop> <a12642cc-0b2a-42fe-9eff-a5a8642d3373@perard>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Artem, Oleksandr

On Mon, 13 Nov 2023, Anthony PERARD wrote:
> On Thu, Nov 09, 2023 at 05:02:08PM -0800, Stefano Stabellini wrote:
> > ### qemu_key.sh is using "expect", see below. I think we should be able
> > ### to achieve the same by using expect to close on the expected string
> > ### (instead of waiting for eof)
> 
> So, `expect` is just a different kind of language than shell is?
> Also, `grep -q` doesn't wait for EOF, and just exit as soon as it found
> the pattern.


