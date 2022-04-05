Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498294F3D54
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 21:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299252.509798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbokK-0006jO-5f; Tue, 05 Apr 2022 19:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299252.509798; Tue, 05 Apr 2022 19:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbokK-0006gz-2Q; Tue, 05 Apr 2022 19:21:44 +0000
Received: by outflank-mailman (input) for mailman id 299252;
 Tue, 05 Apr 2022 19:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbokI-0006gt-QB
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 19:21:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f436e27-b515-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 21:21:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC768B81FA4;
 Tue,  5 Apr 2022 19:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D378EC385A0;
 Tue,  5 Apr 2022 19:21:38 +0000 (UTC)
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
X-Inumbo-ID: 9f436e27-b515-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649186499;
	bh=+BQlMhmNIxB5jfqt9yCYdR6Te72Gk+tVq/m/oJL0ALc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KNDiTQNQQPGltZvPjliz0BE/K7r6fUiTjV/RsltQPNpQkEw+bZ2WTtGcU7eDodaIy
	 T17Aq9EPBnjl8PSmRIs0HNMBPkJO7Sim5CkrjjcziQFZKfaRm0/iDWlBFD82U0pLZm
	 ef+G6PKvh7q1wsaryDzRHeXLJFkxMS+mLCtjInQ/SutWG+zxxi/GbRDdJKeSo5d64h
	 fRLCSKUAzo2DyqlK2iHR/hGiOCem6lN+yAyrCdZUEiIlJHsKCG9Suqmof7MV2O8DKN
	 imKqzn8CpUUgjE3CK1AieDEPdT2lN6XL7BKTmwKzgKci6Me+r+H1H/hlzzcEM6omXb
	 Y3euxe6en5egg==
Date: Tue, 5 Apr 2022 12:21:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Demi Marie Obenour <demi@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
In-Reply-To: <989D1F80-2CAA-4432-8780-E0104B28A634@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204051220520.2910984@ubuntu-linux-20-04-desktop>
References: <YkeHXFvgB3MwXnuR@itl-email> <989D1F80-2CAA-4432-8780-E0104B28A634@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2059889231-1649186499=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2059889231-1649186499=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Apr 2022, Luca Fancellu wrote:
> > On 2 Apr 2022, at 00:14, Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
> > 
> > The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> > firmware updates to install.  According to the UEFI specification §23.4,
> > the table shall be stored in memory of type EfiBootServicesData.
> > Therefore, Xen must avoid reusing that memory for other purposes, so
> > that Linux can access the ESRT.  Additionally, Xen must mark the memory
> > as reserved, so that Linux knows accessing it is safe.
> > 
> > See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> > for details.
> > 
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> Hi,
> 
> I’ve tested the patch on an arm machine booting Xen+Dom0 through EFI, unfortunately
> I could not test the functionality.

I understand you couldn't test ESRT but did the basic Xen+Dom0 boot via
EFI on ARM work?
--8323329-2059889231-1649186499=:2910984--

