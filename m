Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37B79DDFC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600930.936777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgF3o-0007Yd-9C; Wed, 13 Sep 2023 01:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600930.936777; Wed, 13 Sep 2023 01:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgF3o-0007W6-50; Wed, 13 Sep 2023 01:52:56 +0000
Received: by outflank-mailman (input) for mailman id 600930;
 Wed, 13 Sep 2023 01:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgF3m-0007W0-Ov
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:52:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea26582-51d8-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 03:52:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D6A96179B;
 Wed, 13 Sep 2023 01:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95974C433C8;
 Wed, 13 Sep 2023 01:52:47 +0000 (UTC)
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
X-Inumbo-ID: 3ea26582-51d8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694569968;
	bh=EmouGUNtMN2J3PrOjj+twY4alh7OqbNy/fvyLC9gcv4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ScEDAIY8oRhXqNkG+CZtaw30aZVOrtU09z4D/z6feuyUtNtc68ptL+4bP0e1j2PfL
	 qohkG6eBLB8iA+NILqVu1IZdT9dha/Zr2HE9+hbWRf12t8TsyP39SuX+Xt/XgvpMJw
	 1nLmIv9+2C6qmA/BRsk4yN5rrXzPfHbaKdAulL2kwms+qKf7ywP974E+sd5U0xNZoa
	 JAXGZP4amVwdw4+gPIDr5RubK4tFHyaAMdxjnGpMkYTr+RxYxnnOUtZGRsoZjabSys
	 Pt4zHYcvkgBflWY1mGx1TidtD/5gZ0a2YMyKrPhSl4cQnarldtH1ac5IxaI9Az4j+6
	 AiPmfib1NQNbg==
Date: Tue, 12 Sep 2023 18:52:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v6 5/7] xen/x86: address violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <33185adc43014dff090ea6832a5a88e15caf5f38.1694532795.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121848140.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694532795.git.simone.ballarin@bugseng.com> <33185adc43014dff090ea6832a5a88e15caf5f38.1694532795.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add the 'U' suffix to switch cases in 'cpuid.c'

Missing signed-off-by

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

