Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE92B31CCF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090270.1447606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upT9b-00038b-Db; Fri, 22 Aug 2025 14:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090270.1447606; Fri, 22 Aug 2025 14:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upT9b-000378-Ai; Fri, 22 Aug 2025 14:54:07 +0000
Received: by outflank-mailman (input) for mailman id 1090270;
 Fri, 22 Aug 2025 14:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMUB=3C=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upT9Z-000372-LR
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:54:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d82dda1c-7f67-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 16:54:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B46D5C6AB0;
 Fri, 22 Aug 2025 14:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C352C4CEED;
 Fri, 22 Aug 2025 14:54:00 +0000 (UTC)
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
X-Inumbo-ID: d82dda1c-7f67-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874442;
	bh=PGUtv7joyI3NcEGG7DwKAzX2OlG/Z4dlVaDk/uPYiuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tpr6ICPkpdFXRhvJyuT9ON7sRIiMiwwPI5TeRKAhUc7td3Kvve8wRi3nITf/ddF3Y
	 fUzNJafUblNb4oC4vxrscX22WjQlOQO1QQjYKO5rl6b3kwsCKHbX8rFLBjYIY1urMs
	 2bKoNfApadCXo/mDrhp2v0w6gQN3jHNDvnntHGY1um+ZqcDCMfstD1UqB/IMCVkNuh
	 CvwjrXtYN2U3KfCzA0J3gDLFmGU8kBA1+YkEtoTYT/xJfEuw3vDQ7YeRRAMCAwmuCd
	 g3OmeSN4OdoVLX/2uyfEeT67UXzYb7PtPSm5iksP51OAxGUvyhO5CohS6qQbrREFIZ
	 wEzLCHC2s7YtA==
Date: Fri, 22 Aug 2025 07:53:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Penny, Zheng" <penny.zheng@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <e93eab09-0467-4fff-875b-c6cf2cf754a6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508220753540.2743087@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <DM4PR12MB84519FE74D66604440827EA9E133A@DM4PR12MB8451.namprd12.prod.outlook.com> <43f0c9a6-a4f3-44e0-959f-a021ae3b0466@suse.com>
 <alpine.DEB.2.22.394.2508211710060.2743087@ubuntu-linux-20-04-desktop> <e93eab09-0467-4fff-875b-c6cf2cf754a6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Aug 2025, Jan Beulich wrote:
> >> I'm sorry if my request was unclear, but with "full round of testing" I in particular
> >> meant a full CI pipeline, plus (given the issue that's being fixed) some extra
> >> randconfig testing.
> > 
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1997431361
> > 
> > I ran a few tests myself changing config options on purpose trying to
> > break it, and so far they were all successful.
> 
> Should I translate this to Tested-by: then?

Yes

