Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C6728C59
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 02:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545527.851980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Pug-0003ro-SL; Fri, 09 Jun 2023 00:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545527.851980; Fri, 09 Jun 2023 00:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Pug-0003pp-PY; Fri, 09 Jun 2023 00:23:34 +0000
Received: by outflank-mailman (input) for mailman id 545527;
 Fri, 09 Jun 2023 00:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=464j=B5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q7Puf-0003ox-SO
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 00:23:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd4ce4d6-065b-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 02:23:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 885BC6518B;
 Fri,  9 Jun 2023 00:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE13C433EF;
 Fri,  9 Jun 2023 00:23:28 +0000 (UTC)
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
X-Inumbo-ID: dd4ce4d6-065b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686270211;
	bh=OpDb7/RjL4XjYjMeFWJxEnsOXV1XjZsBrKHObfFQFHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GAksM/2LKgQhmQ5t7bcwMGoXUW1k6MVBTMBTbGIDCeezK/OFO3GwRa9+AdRzo98RL
	 vn6dwF1UEGwZKihgMa7nrKTN0vxkV8Och6SWdUPATQ5vyh6V5zfrQ8Zd4cpS8D4WDr
	 4OKarCpBJ98D9nuIBKtdOqy8n8rHInt3JKl9jOG8WVOyQbdDR0HOXu+iuqFmhsSnM6
	 AQxrF2vDExEatQFht6UQhexEJWZD+1lVvcO/seAeY/z2z9WMGEzNj2hKR8BAXY29qZ
	 zjtwOeR1SjHFuWvb6v8lBT+AX7hXjrPnXbkKdmB45WemON5wpd68fHCtgcyxNxTkNk
	 Y6WEvrDc2vF7g==
Date: Thu, 8 Jun 2023 17:23:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Bernhard Beschow <shentey@gmail.com>, mst@redhat.com, 
    qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>, 
    Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>, 
    =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
    Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <alpine.DEB.2.22.394.2306081542170.3803068@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2306081722330.3803068@ubuntu-linux-20-04-desktop>
References: <20230403074124.3925-1-shentey@gmail.com> <20230421033757-mutt-send-email-mst@kernel.org> <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com> <alpine.DEB.2.22.394.2305151350180.4125828@ubuntu-linux-20-04-desktop> <EB3E61EB-B543-4B15-94A9-C16A66437601@gmail.com>
 <ADD39905-0305-477A-8801-C1F561E0DFD4@gmail.com> <alpine.DEB.2.22.394.2306081542170.3803068@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Jun 2023, Stefano Stabellini wrote:
> On Mon, 5 Jun 2023, Bernhard Beschow wrote:
> > Am 22. Mai 2023 15:42:03 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> > >
> > >
> > >Am 15. Mai 2023 20:52:40 UTC schrieb Stefano Stabellini <sstabellini@kernel.org>:
> > >>On Sat, 13 May 2023, Bernhard Beschow wrote:
> > >>> Am 21. April 2023 07:38:10 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> > >>> >On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
> > >>> >> There is currently a dedicated PIIX3 device model for use under Xen. By reusing
> > >>> >> existing PCI API during initialization this device model can be eliminated and
> > >>> >> the plain PIIX3 device model can be used instead.
> > >>> >> 
> > >>> >> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen
> > >>> >> agnostic towards the precise south bridge being used in the PC machine. The
> > >>> >> latter might become particularily interesting once PIIX4 becomes usable in the
> > >>> >> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> > >>> >
> > >>> >xen stuff so I assume that tree?
> > >>> 
> > >>> Ping
> > >>
> > >>I am OK either way. Michael, what do you prefer?
> > >>
> > >>Normally I would suggest for you to pick up the patches. But as it
> > >>happens I'll have to likely send another pull request in a week or two
> > >>and I can add these patches to it.
> > >>
> > >>Let me know your preference and I am happy to follow it.
> > >
> > >Hi Stefano,
> > >
> > >Michael's PR was merged last week. How about including this series into your PR then?
> > 
> > Ping
> 
> Sorry for the late reply, it looks like patch #3 breaks the build:

I noticed now that this patch series got committed (the right version
without the build failure), thanks Anthony for sending the pull request!

