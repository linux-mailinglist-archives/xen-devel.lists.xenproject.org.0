Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E129F91E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 00:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15337.38280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYHPP-00040O-M2; Thu, 29 Oct 2020 23:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15337.38280; Thu, 29 Oct 2020 23:32:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYHPP-0003zz-In; Thu, 29 Oct 2020 23:32:43 +0000
Received: by outflank-mailman (input) for mailman id 15337;
 Thu, 29 Oct 2020 23:32:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYHPO-0003zu-GR
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 23:32:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 646fc09c-371c-48be-ae42-72376af5c5c3;
 Thu, 29 Oct 2020 23:32:41 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA0D720739;
 Thu, 29 Oct 2020 23:32:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYHPO-0003zu-GR
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 23:32:42 +0000
X-Inumbo-ID: 646fc09c-371c-48be-ae42-72376af5c5c3
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 646fc09c-371c-48be-ae42-72376af5c5c3;
	Thu, 29 Oct 2020 23:32:41 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DA0D720739;
	Thu, 29 Oct 2020 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604014360;
	bh=UmFbTMDHbkNkOi+5Y3xlBOkHjjr+XUT+ze9jmPRI6r4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KYfTGz0GMgkZNtE5eBNAabccZQtmN4E4dj6MggqoB3DizcuBKFfNQIXqiaWhLW00L
	 00VXze7QlMcX+wLQv+gnQLT+MkXnQl1AhtSf/X7v6AC2uBQYU7D7CTEt7GQr0pFtLd
	 llXouzwByJnj3ZKftWlYZRL2XjHDNPdwqDWk3GX8=
Date: Thu, 29 Oct 2020 16:32:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
In-Reply-To: <DFD994CA-C456-468C-8442-0F63CE661E78@arm.com>
Message-ID: <alpine.DEB.2.21.2010291632130.12247@sstabellini-ThinkPad-T480s>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com> <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com> <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
 <DFD994CA-C456-468C-8442-0F63CE661E78@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Oct 2020, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 28 Oct 2020, at 18:39, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > On 26/10/2020 16:21, Bertrand Marquis wrote:
> >> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> >> not implementing the workaround for it could deadlock the system.
> >> Add a warning during boot informing the user that only trusted guests
> >> should be executed on the system.
> >> An equivalent warning is already given to the user by KVM on cores
> >> affected by this errata.
> >> Also taint the hypervisor as unsecure when this errata applies and
> >> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks
> 
> > 
> > If you don't need to resend the series, then I would be happy to fix the typo pointed out by George on commit.
> 
> There is only the condensing from Stefano.
> If you can handle that on commit to great but if you need me to send a v3 to make your life easier do not hesitate to tell me

I have just done the committing

