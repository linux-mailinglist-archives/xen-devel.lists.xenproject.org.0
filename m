Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE28C6FA6
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722743.1127024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PLO-0003wp-RK; Thu, 16 May 2024 00:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722743.1127024; Thu, 16 May 2024 00:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PLO-0003uw-Op; Thu, 16 May 2024 00:51:38 +0000
Received: by outflank-mailman (input) for mailman id 722743;
 Thu, 16 May 2024 00:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PLO-0003g4-1l
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:51:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71f45764-131e-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 02:51:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7DA9615F7;
 Thu, 16 May 2024 00:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1CEC116B1;
 Thu, 16 May 2024 00:51:32 +0000 (UTC)
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
X-Inumbo-ID: 71f45764-131e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820694;
	bh=ZYfQX7cCFHwsa34Np2fSwh5Cvagy23Ynk+cwVLEA6Xo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iKQTMCVPkvCYZ4a0n+LBjQbuyipNZ2cIbuiVV+qjD3+RIAwdRIM0+2G/0mhT8xoYg
	 jQnoBSfUwMbA9xDWBoRBi59zmgeNdA9DsMFvJQzy6nx+IXIZf3wfhIIBlhz+sBnbq+
	 QuLFsxxdsFcKAEhkR9Qlhg4VFgj+xXbEn1ALoQhT25Ib6dVnd+JtwPEhHS7mOMHpnG
	 keuqRfPA60sxPN6JerkTw6/p2N6rhQkSkdZP0cQFr2kAYhiofs6jQuKVErgHZV+Q6g
	 Wnw3vYq15KatMJ6SMP8/sghGFuMp4L6qXsrf+jmnxFdZ4Tt5QHkFV+cubdzbkMELZb
	 YIh1/TSY/8G6g==
Date: Wed, 15 May 2024 17:51:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 13/15] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
In-Reply-To: <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151751230.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> VIO_realmode_completion is specific to vmx realmode, so guard the completion
> handling code with CONFIG_VMX. Also, guard VIO_realmode_completion itself by
> CONFIG_VMX, instead of generic CONFIG_X86.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


