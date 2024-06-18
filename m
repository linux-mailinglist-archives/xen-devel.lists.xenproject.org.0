Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3390DFB1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 01:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743327.1150210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJhzU-0001Cb-IW; Tue, 18 Jun 2024 23:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743327.1150210; Tue, 18 Jun 2024 23:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJhzU-0001B5-FJ; Tue, 18 Jun 2024 23:11:52 +0000
Received: by outflank-mailman (input) for mailman id 743327;
 Tue, 18 Jun 2024 23:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCZ4=NU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sJhzS-0001Ax-4b
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 23:11:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217383e7-2dc8-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 01:11:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0291BCE1BD2;
 Tue, 18 Jun 2024 23:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA36DC3277B;
 Tue, 18 Jun 2024 23:11:41 +0000 (UTC)
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
X-Inumbo-ID: 217383e7-2dc8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718752303;
	bh=7USpFt4OqIKRqBf2KY/DprGxHV1VmAEb2Wjbt9eDtu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QF61WvPE15eKCUr5MxuyhW1yMo6/xt/0E5yrDha/IkiyHRbDGEBBhAjVD/2szTLSs
	 rEhiO3ukYHbO+DO4hAJRl6cW4MkPl+xEozQMDvwRuqiQ+xGX9fu5AKtg8+45Vyw278
	 WK3fWWLNavAuX1WSL3mVvghxCNp78t/WsQANUI5lBxlcDy3gV/ccJnCJ48UAC1wxut
	 TneH+9mPxwy8FWlRNLhPEH0bLvftNPsUmjLKXilBQTpdzqEdHHMO52M/Gk0+U0IFgE
	 l280Wn0H0hf3JssyDBNjsIK4icuZZ9hv/xj5vJCiEUal7zc6FX7qK1sltzaBXrs055
	 ZPZ2u/ayyy6qQ==
Date: Tue, 18 Jun 2024 16:11:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
In-Reply-To: <ZmxKxob_5LZHvCaa@macbook>
Message-ID: <alpine.DEB.2.22.394.2406181611190.2572888@ubuntu-linux-20-04-desktop>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com> <ZmxKxob_5LZHvCaa@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1100158092-1718752303=:2572888"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1100158092-1718752303=:2572888
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Jun 2024, Roger Pau Monné wrote:
> On Fri, Jun 14, 2024 at 01:49:50PM +0100, Andrew Cooper wrote:
> > These being in cache.h is inherited from Linux, but is an inappropriate
> > location to live.
> > 
> > __read_mostly is an optimisation related to data placement in order to avoid
> > having shared data in cachelines that are likely to be written to, but it
> > really is just a section of the linked image separating data by usage
> > patterns; it has nothing to do with cache sizes or flushing logic.
> > 
> > Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
> > arch/cache.h, and has literally nothing whatsoever to do with caches.
> > 
> > Move the definitions into xen/sections.h, which in paritcular means that
> > RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
> > to provide a short descriptions of what these are used for.
> > 
> > For now, leave TODO comments next to the other identical definitions.  It
> > turns out that unpicking cache.h is more complicated than it appears because a
> > number of files use it for transitive dependencies.
> 
> I assume that including sections.h from cache.h (in the meantime)
> creates a circular header dependency?

Assuming this patch doesn't introduce ECLAIR regressions:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1100158092-1718752303=:2572888--

