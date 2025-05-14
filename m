Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9AAB77C0
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 23:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984627.1370692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFJTu-0001Xu-1j; Wed, 14 May 2025 21:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984627.1370692; Wed, 14 May 2025 21:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFJTt-0001Ve-V7; Wed, 14 May 2025 21:17:37 +0000
Received: by outflank-mailman (input) for mailman id 984627;
 Wed, 14 May 2025 21:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXN3=X6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uFJTt-0001VY-5L
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 21:17:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3a0319-3108-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 23:17:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDB775C688D;
 Wed, 14 May 2025 21:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D29C4CEE3;
 Wed, 14 May 2025 21:17:31 +0000 (UTC)
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
X-Inumbo-ID: da3a0319-3108-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747257452;
	bh=gD2MfOwcb20uzAPPjK9S+mJGWOBbAOo1BETu6Sl594c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VE2a1TaP9sWrpRd4/5crwFRDW5CCT/j/IcFPJPzfkEoxuwSRjboZy0h/z8733FSL9
	 HLaLCE8UnOjzucx65mymFB9GLFmFYgS83Ohpm3uWW/2zn5kUaj0czMBTXDZ9hwZhDh
	 Z04QKIQgn5V+j+aIz9llBj3Ggy8faKGKxxFU0QpCyshTP/GRTGQzCErHflyztColMR
	 vAZCE2yAHpzL84QF9RhlmiMKE9F85i8GfqT+4VvMpPxGO5TScl6bCIQfEsvc5geX8V
	 0eYAtE/0E2zST4TTqY0lav76Q6DIBU6Lpb86wTqVGZi2XvyKADMZ/p6QlbJgro8/0K
	 h2ITgFw17Yh1w==
Date: Wed, 14 May 2025 14:17:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 05/16] xen/asm-generic: introduce
 asm-generic/irq-dt.h
In-Reply-To: <74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505141417240.145034@ubuntu-linux-20-04-desktop>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com> <35c68e57e5348c6610e030890802e967f6be4230.1746530883.git.oleksii.kurochko@gmail.com> <74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 May 2025, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
> > Introduce defintions of IRQ_TYPE_* which correspond to the Xen internal
> > representation of the IRQ types and make them the same asthe existing
> > device tree defintions for convenience.
> > 
> > These defines are going to be re-used, at least, by RISC-V architecture.
> > 
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Assuming an Arm ack would arrive, this looks like it's independent of the
> earlier patches, and hence could go in right away?

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

