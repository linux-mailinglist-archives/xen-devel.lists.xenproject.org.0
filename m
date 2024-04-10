Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5389FFA4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703532.1099185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rucXK-0006Az-9y; Wed, 10 Apr 2024 18:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703532.1099185; Wed, 10 Apr 2024 18:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rucXK-00069D-6U; Wed, 10 Apr 2024 18:19:06 +0000
Received: by outflank-mailman (input) for mailman id 703532;
 Wed, 10 Apr 2024 18:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rucXI-000697-Fj
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:19:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceb5e805-f766-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 20:19:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEA6E61D9A;
 Wed, 10 Apr 2024 18:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4BBC433F1;
 Wed, 10 Apr 2024 18:19:00 +0000 (UTC)
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
X-Inumbo-ID: ceb5e805-f766-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712773141;
	bh=Vm43bTEM0qzUTEhGgdHrHm5bejC1NNkZjXNFX2N0feE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CpLj/4jcj23xTIjpgL4Qxkyi1DUz3C5vQQcbv++rJvl+KVXAwX++0758eTJZA0+13
	 FM1t7RlE6mYUhzCdo/0ZkOg2wCZVeLiZG5vXFU2guHYixfw+jM/DCB9dkx75uAjGcK
	 hu60iX40cV+L2B3ErLzHpGgL6ix5wU7s8+HfUXbXZhvAZK6eckXrNij85gWOQnMLXS
	 ySwOTcokBLqmMig34m82BBQJdIm28bc82VLKcgaCrU7YL61G9WqqLbXa25J1nSWzCg
	 umIQsx6k3sZ1Hqz5IW9k8Awq+vrW4iS+4wvFIsG8fUjrk2ASfDIg2lXDBdsJBO/su/
	 kTPSwTEVKNLUg==
Date: Wed, 10 Apr 2024 11:18:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
In-Reply-To: <Zha_hXU3zRwVzFZN@macbook>
Message-ID: <alpine.DEB.2.22.394.2404101118420.711344@ubuntu-linux-20-04-desktop>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com> <20231026205539.3261811-3-andrew.cooper3@citrix.com> <Zhas4MQdL3hQ6Uww@macbook> <2fd969ef-8326-4ae8-a568-4256f00542f0@citrix.com> <Zha_hXU3zRwVzFZN@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-213840694-1712773141=:711344"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-213840694-1712773141=:711344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Apr 2024, Roger Pau Monné wrote:
> On Wed, Apr 10, 2024 at 05:21:37PM +0100, Andrew Cooper wrote:
> > On 10/04/2024 4:14 pm, Roger Pau Monné wrote:
> > > On Thu, Oct 26, 2023 at 09:55:39PM +0100, Andrew Cooper wrote:
> > >> +
> > >> +config AMD
> > >> +	bool "AMD"
> > >> +        default y
> > >> +        help
> > >> +          Detection, tunings and quirks for AMD platforms.
> > >> +
> > >> +	  May be turned off in builds targetting other vendors.  Otherwise,
> > >> +	  must be enabled for Xen to work suitably on AMD platforms.
> > >> +
> > >> +config INTEL
> > >> +	bool "Intel"
> > >> +        default y
> > >> +        help
> > >> +          Detection, tunings and quirks for Intel platforms.
> > >> +
> > >> +	  May be turned off in builds targetting other vendors.  Otherwise,
> > >> +	  must be enabled for Xen to work suitably on Intel platforms.
> > > There seems to be a weird mix between hard tabs and spaces above.
> > > Naming is OK for me.
> > 
> > Yeah.  I already fixed those locally.
> 
> With that fixed:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

This is fine for me too

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-213840694-1712773141=:711344--

