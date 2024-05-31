Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D68D57AA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 03:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733198.1139336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqsF-0000Rw-Vy; Fri, 31 May 2024 01:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733198.1139336; Fri, 31 May 2024 01:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqsF-0000Q6-Rl; Fri, 31 May 2024 01:16:03 +0000
Received: by outflank-mailman (input) for mailman id 733198;
 Fri, 31 May 2024 01:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCqsE-0000Pt-1e
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 01:16:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573df8b7-1eeb-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 03:16:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8BE261628;
 Fri, 31 May 2024 01:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C59C2BBFC;
 Fri, 31 May 2024 01:15:57 +0000 (UTC)
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
X-Inumbo-ID: 573df8b7-1eeb-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717118159;
	bh=0ciOzSyMXNlpzwdsYHjf2865CDzJmea3wO2lRnTSFYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dja9Cx0xNZm/b9dEn2JRfpB45TmKRkjKzR0lwMZ5RVYfaoLQa7ASqTMYM75V0orLz
	 oM/V+OR2Jb5gC1gLg/iYZBpqRdQ1sGgf8au+NiDpKASCyr58vv202CbmeWqShahNHi
	 +ybKtpo9K1Pk4Ka76pv9UGkJY6n6NoovubiRbn2PzQkiC0jYDPO2oMs45Wuxpaifm2
	 XdlrDksV8T6CtOmVSeD/V1CgGg83IWng0hY2NJNojzRs6U0Pc04quJxm0a1chckT6O
	 xGY7Q8UFj7ihC8RCZkanZ1wufBzHFNiOSjLczeMYVwEVXVCkgEvnhiluKwlM9Src4E
	 cS15RVWvdzq0A==
Date: Thu, 30 May 2024 18:15:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 08/13] xen/bitops: Implement ffsl() in common logic
In-Reply-To: <db5f4449-e333-426f-bbe8-e5b77daba16d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405301815490.2557291@ubuntu-linux-20-04-desktop>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com> <20240524200338.1232391-9-andrew.cooper3@citrix.com> <db5f4449-e333-426f-bbe8-e5b77daba16d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 May 2024, Jan Beulich wrote:
> On 24.05.2024 22:03, Andrew Cooper wrote:
> > Just like ffs() in the previous changes.  Express the upper bound of the
> > testing in terms of BITS_PER_LONG as it varies between architectures.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

