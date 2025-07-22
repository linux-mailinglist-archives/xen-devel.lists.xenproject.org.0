Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE4B0E73C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053098.1421863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMUA-0004fb-DM; Tue, 22 Jul 2025 23:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053098.1421863; Tue, 22 Jul 2025 23:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMUA-0004dk-A6; Tue, 22 Jul 2025 23:33:26 +0000
Received: by outflank-mailman (input) for mailman id 1053098;
 Tue, 22 Jul 2025 23:33:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMU8-0004dY-Li
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:33:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 421809a9-6754-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 01:33:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F611A564E3;
 Tue, 22 Jul 2025 23:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E7BC4CEEB;
 Tue, 22 Jul 2025 23:33:21 +0000 (UTC)
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
X-Inumbo-ID: 421809a9-6754-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753227202;
	bh=uVvA6N2p4js40k+v+v/8z95zTGwRBEMK/yNmf0hh6BM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ljt7UA2x6ENNuMQ8DAXDutZkJsyUVY0Tl4V1LJvgmGG3M5P9BYnxAG5Bcz+LnbatP
	 OY3WmT2Dxk0hhR6Wy2ej52TmAAOFRzs+hUblhANayPPVoDXC9P9vIcAzToBft4/fCQ
	 ORC3Zt6RQabMKRp6/l8Ls/NalIAMUr/oTzjOfm6F1na96J6ZEB+ssacxHHoaUSi8r8
	 9KjMIBHIt+2t/Bnq72M/Km83h+dtXVVV4Y+Wl8okoldUZeP2VyY5XrdEWoh/8OWV51
	 84OoziEXmLJFJ7fOxT3wdtGdBD3GietivAchB3DPRNVDwqvYaG+3W1LEmpcFbpBi4Y
	 cpznmzDg4vbvg==
Date: Tue, 22 Jul 2025 16:33:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 07/10] dom0less: Turn arch_create_domUs into
 arch_parse_dom0less_node()
In-Reply-To: <20250722115955.57167-8-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221633140.7043@ubuntu-linux-20-04-desktop>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com> <20250722115955.57167-8-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> It deals with a single domain, and will be called on a later patch
> by a new function parse_dom0less_node(), so the new name is apt.
> 
> Also, pass parameters using boot_domain instead as the plan is to use it
> as dumping gound for all the extracted information from the bindings.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

