Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFE770AC0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577343.904422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Gf-0000fg-Hf; Fri, 04 Aug 2023 21:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577343.904422; Fri, 04 Aug 2023 21:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Gf-0000dm-El; Fri, 04 Aug 2023 21:23:29 +0000
Received: by outflank-mailman (input) for mailman id 577343;
 Fri, 04 Aug 2023 21:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2Ge-0000dc-Oc
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:23:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25fcf4a0-330d-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 23:23:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AED59620AE;
 Fri,  4 Aug 2023 21:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C72AC433C8;
 Fri,  4 Aug 2023 21:23:23 +0000 (UTC)
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
X-Inumbo-ID: 25fcf4a0-330d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691184205;
	bh=UdKLTfqblCjD85IT+yl6LbHf1z3bNJwVbW7ktIu2UA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=izkCYWBT42tIibcusdX0lK374FJVVxnUxwHd+5On6qBatNTLqdqSMQN7AMSauA2FC
	 pnlEeEToduxeBXAeaeNgRUu1z00XH5lKR5Up3nJ+nxE0dQ0uoSLrpVP1y+Q2Dw6Gwt
	 eFVvKy4XdCoN8nwSMjHqJtYIXkxwYpbAHQFYVg+y4ixRiVKy0yrevwHJCOA8PdYm/j
	 /bYpz3K9y92iZ2dtup2tjNMd/B6qYo4V7sR/360InkLpxbsuxBGjgtnDb0AVr6Imlg
	 6n0zrlNzAArEpUbKYS1zhYjAyWaPqw6zRJ8jTdoHOkH5onLhENt+GTY5MaZdy446P7
	 6RmCIW7y4aHbg==
Date: Fri, 4 Aug 2023 14:23:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
In-Reply-To: <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041422210.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> The variable 'msec' shadows the local variable in
> 'ehci_dbgp_bios_handoff', but to prevent any future clashes, the one in
> the macro gains a suffix.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

