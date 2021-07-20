Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24B3D0251
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 21:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158954.292471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5vjT-0000Du-JR; Tue, 20 Jul 2021 19:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158954.292471; Tue, 20 Jul 2021 19:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5vjT-0000C5-G6; Tue, 20 Jul 2021 19:48:47 +0000
Received: by outflank-mailman (input) for mailman id 158954;
 Tue, 20 Jul 2021 19:48:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr4l=MM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m5vjS-0000By-2r
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 19:48:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f569d6e-fea7-4dcd-ae07-d999b6523dd4;
 Tue, 20 Jul 2021 19:48:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 408E56100C;
 Tue, 20 Jul 2021 19:48:44 +0000 (UTC)
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
X-Inumbo-ID: 7f569d6e-fea7-4dcd-ae07-d999b6523dd4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626810524;
	bh=nRnRDOzj2U5UbVreQhBy7At5zCIxFheC04IbuYdv4cc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b44FeWRONm0+4GMcUp6XPLZ6f6s+FnGTftedBBVm4XH1lMXU3Mhzw6Ae1kgHo7V+P
	 viozUewhIgr4aTC7tBYkeEIe89u7V57ctn76WN5fhJIlADMXRB/NBXtXfenQNtnWU+
	 a1hhf9hgZiC+yOzhNtpDDPNOFI8AjQeR9n8P41WoGiuIlk5xLazGHXjUWaz4iokIUX
	 N1NXe8HP/D/M8aQgh7ftn5WJPHYRVz8t4gbRrS9GhEFYmrZk0hodtOk+g0B66qY6yK
	 LOPlcfYoeegGx51NEV9Omdt0XrAUoxzWrrjPYYXu+TOzAfxujNc1W4I3cDpTaw6VFb
	 5JVjpuIizEV5g==
Date: Tue, 20 Jul 2021 12:48:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND 0/2] gitlab-ci: add a qemu-based arm32 test
In-Reply-To: <alpine.DEB.2.21.2107131747070.23286@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2107201248360.3916@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107131747070.23286@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Re-ping?


On Tue, 13 Jul 2021, Stefano Stabellini wrote:
> Hi all,
> 
> This short series adds a minimal ARM32 test based on QEMU. It just runs
> Xen and Dom0 up to a Busybox prompt.
> 
> Cheers,
> 
> Stefano
> 
> 
> Stefano Stabellini (2):
>       Add qemu-system-arm to the existing tests-artifacts container
>       Add an ARM32 qemu-based smoke test
> 
>  automation/gitlab-ci/build.yaml                    | 14 ++++-
>  automation/gitlab-ci/test.yaml                     | 27 +++++++-
>  automation/scripts/qemu-smoke-arm32.sh             | 72 ++++++++++++++++++++++
>  ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
>  4 files changed, 112 insertions(+), 6 deletions(-)
>  create mode 100755 automation/scripts/qemu-smoke-arm32.sh
>  rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)
> 

