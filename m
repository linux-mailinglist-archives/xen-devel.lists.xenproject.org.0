Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8045ED20E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 02:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413073.656565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxq-00043k-Qf; Wed, 28 Sep 2022 00:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413073.656565; Wed, 28 Sep 2022 00:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxq-000414-NH; Wed, 28 Sep 2022 00:30:14 +0000
Received: by outflank-mailman (input) for mailman id 413073;
 Wed, 28 Sep 2022 00:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odKxp-000402-Jj
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 00:30:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65a935d-3ec4-11ed-9648-05401a9f4f97;
 Wed, 28 Sep 2022 02:30:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3FABB81E5E;
 Wed, 28 Sep 2022 00:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC45C433C1;
 Wed, 28 Sep 2022 00:30:08 +0000 (UTC)
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
X-Inumbo-ID: b65a935d-3ec4-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664325009;
	bh=Kz1u6W41ONKpo4gKhBwKXkVb6c02chGyNhjn77IIkFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TUz/594gZKhGIvS6hWk+N4FZzW2kfBaYY3ba0AssqpU5VD1FZnEjjNb9x3IFkkC9G
	 r2owhI5bt8ZVd1ZmvL2ibsawi5MywjH/0omB/6OxO/QpOsNybVz1BjqxXvsV0JUO6d
	 LxjPUg/7Uv7PBGyVJFLWr1q3xOUkkCRZdKsv0yfApGHWTHuBa1UeV2joYxqHY94JpK
	 WwZbTeWxIRqDhhxP7HN8LywIWknRrSQvaD2TsJ4bAkDKuz27y6oUi0M+LR/iCI7zQf
	 RZj+FZqXMoprOZh8QpDIKnV5dxj+qamXAG/LyhR4I8RBssxhq3ci/pb+qLUckoBMXQ
	 tfPHgBebit8BA==
Date: Tue, 27 Sep 2022 17:30:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
In-Reply-To: <29effece-f467-0763-9b88-85d0eba076a1@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2209271658490.922084@ubuntu-linux-20-04-desktop>
References: <20220926130213.28274-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2209271545110.922084@ubuntu-linux-20-04-desktop> <29effece-f467-0763-9b88-85d0eba076a1@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Sep 2022, Andrew Cooper wrote:
> On 27/09/2022 23:47, Stefano Stabellini wrote:
> > On Mon, 26 Sep 2022, Andrew Cooper wrote:
> >> buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler patch
> >> which is relevant to CONFIG_XEN_IBT in 4.17 and later.
> >>
> >> Force it on, rather than having 50% of the jobs not testing what they're
> >> supposed to be testing.
> >>
> >> Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Doug Goldstein <cardoe@cardoe.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Henry Wang <Henry.Wang@arm.com>
> >>
> >> For 4.17: This is bugfix to CI only, to avoid it producing a false negative.
> >> Currently, the test intermittently fails to spot the error it was intended to
> >> identify.  It is very low risk as far as the 4.17 release goes.
> > Thanks for the patch! Very recently Michal has added a similar
> > EXTRA_XEN_CONFIG option.
> 
> I know - that's where I sto^W borrowed the idea from.
> 
> > If you are OK with it, I'll rename
> > EXTRA_FIXED_RANDCONFIG to EXTRA_XEN_CONFIG in this patch for
> > consistency. I can do it on commit.
> 
> No, that will break the fix.
> 
> These are not options to be inserted into a regular .config.
> 
> These are options passed to `make randconfig` via a sidedoor (the
> KCONFIG_ALLCONFIG= variable) causing them to be handled specially while
> the regular .config file is has it's contents randomised.

OK. I committed your original plus a minor code style fix.

