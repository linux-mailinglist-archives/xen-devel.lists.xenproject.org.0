Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E0C70A2E1
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 00:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537283.836291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q08qK-0003rz-Ql; Fri, 19 May 2023 22:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537283.836291; Fri, 19 May 2023 22:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q08qK-0003pL-O5; Fri, 19 May 2023 22:45:00 +0000
Received: by outflank-mailman (input) for mailman id 537283;
 Fri, 19 May 2023 22:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sk0S=BI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q08qJ-0003pD-0f
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 22:44:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c64b8cd6-f696-11ed-8611-37d641c3527e;
 Sat, 20 May 2023 00:44:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFCCB65AF5;
 Fri, 19 May 2023 22:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D8AC433EF;
 Fri, 19 May 2023 22:44:53 +0000 (UTC)
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
X-Inumbo-ID: c64b8cd6-f696-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684536294;
	bh=avhqWAzTLQYSC2CKBntCFG/I4IQPsOmgng9uuN2d9F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Oib71LM9fOYGGzo9wCebmTL9hEST8mTMhZPd5EAqerSU11GzTJdGgpJR84IKJfHt5
	 Lv0Ddq2gGEK62d7lr85dPNQS2YSro7yDMhAVpRkQZULALX1kqGP7hJRA4WgMh6XP7X
	 DlMziPqCCJX6sRrMwz9kBwRfDURQD2xH0R4vFkhebjAwoBhkU6FzlonIBqqMo650dt
	 M/eHumRWxbigcbbAIqCFD/iYFwAObtf3faDQWCexY7TB/GRfY5XPhztEjyirYICssw
	 L2snwxsieRzpng3RdJgrMIdS2zrEtSfj8ca9Ah1IkWE9/9BJwTYsbXYkuCKCHWflpm
	 MYrg9DEwhnEng==
Date: Fri, 19 May 2023 15:44:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com, 
    xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
In-Reply-To: <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305191544420.815658@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop> <ZGX/Pvgy3+onJOJZ@Air-de-Roger> <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-464613732-1684536293=:815658"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-464613732-1684536293=:815658
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 19 May 2023, Jan Beulich wrote:
> On 18.05.2023 12:34, Roger Pau Monné wrote:
> > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> >> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> >> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> >> Zen3 system and we already have a few successful tests with it, see
> >> automation/gitlab-ci/test.yaml.
> >>
> >> We managed to narrow down the issue to a console problem. We are
> >> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> >> options, it works with PV Dom0 and it is using a PCI UART card.
> >>
> >> In the case of Dom0 PVH:
> >> - it works without console=com1
> >> - it works with console=com1 and with the patch appended below
> >> - it doesn't work otherwise and crashes with this error:
> >> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > 
> > Jan also noticed this, and we have a ticket for it in gitlab:
> > 
> > https://gitlab.com/xen-project/xen/-/issues/85
> > 
> >> What is the right way to fix it?
> > 
> > I think the right fix is to simply avoid hidden devices from being
> > handled by vPCI, in any case such devices won't work propewrly with
> > vPCI because they are in use by Xen, and so any cached information by
> > vPCI is likely to become stable as Xen can modify the device without
> > vPCI noticing.
> > 
> > I think the chunk below should help.  It's not clear to me however how
> > hidden devices should be handled, is the intention to completely hide
> > such devices from dom0?
> 
> No, Dom0 should still be able to see them in a (mostly) r/o fashion.

But why? If something is in-use by Xen (e.g. IOMMU, a serial PCI device,
etc.) ideally Dom0 shouldn't even know of its existence because the
device is not exposed to Dom0. Dom0 is not meant to use it. Why let Dom0
know it exists if Dom0 should not use it?

In Xen on ARM, initially we didn't expose devices used by Xen to Dom0
at all.  However to hide them completely we had to make complex device
tree manipulations. Now instead we leave the device nodes in device tree
as is, but we change the "status" property to "disabled".

The idea is still that we completely hide Xen devices from Dom0, but
because of implementation complexity, instead of completing taking away
the corresponding nodes from device tree, we change them to disabled,
which still leads to the same result: the guest OS will skip them.

I am saying this without being familiar with the x86 PVH implementation,
so pardon my ignorance here, but it seems to me that as we are moving
toward an better architecture with PVH, once that allows any OS to be
Dom0, not just Linux, we would want to also completely hide devices
owned by Xen from Dom0.

That way we don't need any workaround in the guest OS for it not to use
them.
--8323329-464613732-1684536293=:815658--

