Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46024AFD69E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037181.1409851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDJA-000444-UB; Tue, 08 Jul 2025 18:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037181.1409851; Tue, 08 Jul 2025 18:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDJA-00042d-RA; Tue, 08 Jul 2025 18:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1037181;
 Tue, 08 Jul 2025 18:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZDJ9-00042Q-Kv
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:44:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfee228-5c2b-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:44:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EA395C62B3;
 Tue,  8 Jul 2025 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3733C4CEED;
 Tue,  8 Jul 2025 18:44:40 +0000 (UTC)
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
X-Inumbo-ID: 9dfee228-5c2b-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752000284;
	bh=IsicILkK8WrM7YJT+lbO9HzZ2I+sfUU3enfhol9/Jho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OhfaKNjx8n2Bv4CUV6LDN4yVsMeqpghmtX1w1bKrXa/p+GKX86pyV13VDFMiiNNSX
	 34lC2Bv2LY2P2eX2TalLd4Pc0ALYQkXQ7/koPJO/wfl6ukVdGkkWQ3VzcR05Bw73rh
	 W/3m+lRjnJvwrw4FfMUZ2hH4/ld+q73wZiloT5YZQV0NEB1OK43ap2fPaAG2LkEzds
	 xFXCyUckpgFx+k927l7aepJQs/R1DCwKT4FL5PpdhYa/o2XUKctxYMuvJrRgNAGzmG
	 BACZXgIC5sFv/2gGoROmUD2jUuKLyCw6aOOXS5f+FWRh7rEToXJy7YzsJIa0kyHXnG
	 Y8SE0T0XMubQw==
Date: Tue, 8 Jul 2025 11:44:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v6 09/11] xen: Split HAS_DEVICE_TREE in two
In-Reply-To: <20250708180721.2338036-10-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507081139470.605088@ubuntu-linux-20-04-desktop>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com> <20250708180721.2338036-10-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Jul 2025, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
> 
> Moving forward the idea is for there to be:
> 
>   1. Basic DT support: used by dom0less/hyperlaunch.
>   2. Full DT support: used for device discovery and HW setup.
> 
> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
> create a new DEVICE_TREE_PARSE to describe (1).
> 
> Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
> DOM0LESS_BOOT.
> 
> Add a dependency on STATIC_MEMORY for discovery, as it relies on
> the memory map itself being described on the DTB.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

I know it took a few revisions to get here but I have to say that this
version is so much better! Thanks Alejandro and the reviewers for all
your work on this.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

