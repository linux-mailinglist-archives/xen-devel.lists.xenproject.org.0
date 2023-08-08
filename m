Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAB774CF4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580482.908711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU9v-0006pY-OJ; Tue, 08 Aug 2023 21:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580482.908711; Tue, 08 Aug 2023 21:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU9v-0006nB-LZ; Tue, 08 Aug 2023 21:22:31 +0000
Received: by outflank-mailman (input) for mailman id 580482;
 Tue, 08 Aug 2023 21:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTU9u-0006DO-E2
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:22:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adac6596-3631-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 23:22:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B632761B0B;
 Tue,  8 Aug 2023 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63886C433C7;
 Tue,  8 Aug 2023 21:22:27 +0000 (UTC)
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
X-Inumbo-ID: adac6596-3631-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691529748;
	bh=m+MGQspKxTlbfsdEbp86EmmhwiZxUDaiH6labh1c8ms=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DEo9B6E13L2Dlv53vyzgHr8B8gL5EbJOEsOriFZ6M9egl2WK+vo0GiP4f83PSAeL5
	 QZ+yjKSTdoEQnqL3CfXnzr+h+BYEErY5jMcFile6PZf3MMqunbm87VJU9ckRVqmyQb
	 8+ZrbuauE5oe/oJAVLZ9LTS/Jxr19/dy/uxi6Gqquk0W8/AtESbut8S7cMd8XzJuUp
	 V6vGWyNs8rffP+0IziIugtAYwoav6EOVQEjXP4jh9B43CwhMvnjrbVbvvVZDK2/4wu
	 z7fY/+4tijlvF2oEJd2IXpwKzk7Pup/JV3+qxPG04yBRa6J8377VymDVBTba2Z6YEc
	 D3GfzckVWdbRQ==
Date: Tue, 8 Aug 2023 14:22:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Fix missing smoke.serial in artifacts of
 qemu arm32 jobs
In-Reply-To: <7B3BFA6D-5BC3-4ECA-B897-07996D0E9883@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308081422180.2127516@ubuntu-linux-20-04-desktop>
References: <20230808085059.13112-1-michal.orzel@amd.com> <7B3BFA6D-5BC3-4ECA-B897-07996D0E9883@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Luca Fancellu wrote:
> > On 8 Aug 2023, at 09:50, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > It was observed that smoke.serial file (used to store boot logs) is
> > missing in artifacts of qemu based arm32 jobs. This is because the
> > artifacts:paths listing smoke.serial specifies paths relative to the
> > project directory but the qemu-smoke-dom0{less}-arm32.sh scripts create
> > this file under binaries/. Fix it so that smoke.serial gets created in
> > project directory just like for every other test job.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

