Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4D7D7A16
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 03:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623391.971236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvp6V-0003Ap-2X; Thu, 26 Oct 2023 01:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623391.971236; Thu, 26 Oct 2023 01:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvp6U-00038f-WB; Thu, 26 Oct 2023 01:24:06 +0000
Received: by outflank-mailman (input) for mailman id 623391;
 Thu, 26 Oct 2023 01:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvp6T-00038Z-NH
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 01:24:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587ba16c-739e-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 03:24:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A202763222;
 Thu, 26 Oct 2023 01:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B387CC433C7;
 Thu, 26 Oct 2023 01:23:59 +0000 (UTC)
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
X-Inumbo-ID: 587ba16c-739e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698283441;
	bh=all9ALWnHwFg35t+Nzb4IOBThZZxdjcSuuRG1MGh/nA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZGy1wVdJq+gw9qO2UECqtP/WKDw+gvDihMdmnp0BSVZdPB/g90yTH3uHMZT8eTEmV
	 i3u2eUsC2lVvICMIx9vlyVYqdea82XOEvnm5BQnc9uxqEdy3tU8pvJDWJjkx+fLwDN
	 22ZcAutZ+yIqSlWpou1RJFyCrOE0uDa5+AgDnnWZe4iRWmgCL4bG0gERuVvWWrOYIF
	 0ld6Cch15Mng1DYc13vD4DVHQPyFC3ebcECoOdEkvx4K8Po8F7YUR72puweKyRA610
	 U/lTcKFaiHTyLf1/ZBOerFYDRaU+QKYlqrnjKmoW8/C84xbzpWH1CdkgdgVF4uLry8
	 EqmW8IhtQM8Eg==
Date: Wed, 25 Oct 2023 18:23:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Woodhouse <dwmw2@infradead.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
    sstabellini@kernel.org, jgross@suse.com, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCHv2 1/8] xen: when unplugging emulated devices skip
 virtio devices
In-Reply-To: <f8d6eaf9b5f57184a5f6ec5b6103189b77364e3a.camel@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2310251820510.271731@ubuntu-linux-20-04-desktop>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>  <20231025212422.30371-2-vikram.garhwal@amd.com> <f8d6eaf9b5f57184a5f6ec5b6103189b77364e3a.camel@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, David Woodhouse wrote:
> On Wed, 2023-10-25 at 14:24 -0700, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> > 
> > Virtio devices should never be unplugged at boot time, as they are
> > similar to pci passthrough devices.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> Hm, do your virtio NICs still actually *work* after that? Or are they
> all disconnected from their netdev peers? 
> 
> I suspect you're going to want a variant of
> https://lore.kernel.org/qemu-devel/20231025145042.627381-19-dwmw2@infradead.org/T/#u
> which also leave the peers of your virtio devices intact?

Hi David, device unplug is an x86-only thing (see the definition of
xen_emul_unplug in Linux under arch/x86/xen/platform-pci-unplug.c) I
suspect Vikram who is working on ARM hasn't tested it.

Vikram, a simple option is to drop this patch if you don't need it.

