Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21625EB4D0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 00:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412122.655318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwxw-0007LO-AX; Mon, 26 Sep 2022 22:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412122.655318; Mon, 26 Sep 2022 22:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwxw-0007IJ-7V; Mon, 26 Sep 2022 22:52:44 +0000
Received: by outflank-mailman (input) for mailman id 412122;
 Mon, 26 Sep 2022 22:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HAa=Z5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ocwxu-0007ID-P7
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 22:52:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc90cca-3ded-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 00:52:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7603B614B9;
 Mon, 26 Sep 2022 22:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BA4C433C1;
 Mon, 26 Sep 2022 22:52:39 +0000 (UTC)
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
X-Inumbo-ID: ecc90cca-3ded-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664232760;
	bh=fPSz+eZ0UgnDmnf4P+rdq9P6v7OG2OJ2ZRH5P0e8sHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O9ZJuq3P8La+nNg42cELNEV8j5GLDMa7gaR9B54BPCyj+OR1QGRdxt5lEXLWFgzrQ
	 omTj5ed7BgiGDWxqinVEjcCXO288HFMBOL//R/rEZWSmx4U0hiv7FiF7l3xcSbG/pI
	 S+MMl+k3VasjLX4chNAz0vi1mZHXS+BIRcf0YnCD1udpinxRh3VrCd+0hIqCdCTcx9
	 WmzQ+/+P843aIZOQUE32HJLjrMYhRH3FkiKO2ladb3L0pNs0m/pDruxtsd4X84YHzh
	 v0yTJg8oNhRXv72DBHA6AKVVcrEqDz/7eDZtIguEgLNj0WP/I+tOlSL31pkf+9gY0o
	 hIYJq9PJp2HSA==
Date: Mon, 26 Sep 2022 15:52:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stewart Hildebrand <stewart@stew.dk>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script
 to use ImageBuilder
In-Reply-To: <495c6147-17ac-ab4e-27ec-1cab394c57c3@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209261551040.922084@ubuntu-linux-20-04-desktop>
References: <20220926110423.26030-1-michal.orzel@amd.com> <20220926110423.26030-7-michal.orzel@amd.com> <2abd4de9-5382-3ca3-5d2e-81ddc79d3b95@stew.dk> <495c6147-17ac-ab4e-27ec-1cab394c57c3@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Sep 2022, Michal Orzel wrote:
> Hi Stewart,
> 
> On 26/09/2022 16:46, Stewart Hildebrand wrote:
> > 
> > 
> > On 9/26/22 07:04, Michal Orzel wrote:
> >> Take an example from arm64 qemu test scripts and use ImageBuilder
> >> to generate u-boot script automatically. Calculating the addresses
> >> manually is quite error prone and also we will be able to benefit
> >> from using ImageBuilder when adding domUs to this test in the future.
> >>
> >> Install and use u-boot from the debian package.
> >> Modify the script so that binaries are loaded from u-boot via tftp.
> >> Remove dtuart=/pl011@9000000 because stdout-path in QEMU dtb is always
> >> set to pl011 node path.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >> Changes in v2:
> >> - add explanation in commit msg why we remove dtuart path
> >> ---
> >>   automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
> >>   1 file changed, 27 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> >> index 530f3892fdd3..765facbe4d66 100755
> >> --- a/automation/scripts/qemu-smoke-arm32.sh
> >> +++ b/automation/scripts/qemu-smoke-arm32.sh
> >> @@ -4,7 +4,9 @@ set -ex
> >>
> >>   export DEBIAN_FRONTENT=noninteractive
> > 
> > While you are here, there's a typo. s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/
> 
> This is a good catch. Thanks!
> It looks like all the Arm scripts use FRONTENT instead of FRONTEND. This is clearly incorrect.
> I will need to fix all the occurrences as part of this cleanup series.

For this specific patch, given that it is not changing DEBIAN_FRONTENT:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Please send a separate patch to address the DEBIAN_FRONTENT issue, and I
think that should target 4.17 (so it should be the first patch of the
series next time.)

