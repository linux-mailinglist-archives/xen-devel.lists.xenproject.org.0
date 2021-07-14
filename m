Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BBE3C7AFB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 03:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155873.287685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3TY7-00075Y-Qf; Wed, 14 Jul 2021 01:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155873.287685; Wed, 14 Jul 2021 01:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3TY7-00073j-NV; Wed, 14 Jul 2021 01:18:55 +0000
Received: by outflank-mailman (input) for mailman id 155873;
 Wed, 14 Jul 2021 01:18:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3TY6-00073d-P3
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 01:18:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 740a1f40-e441-11eb-87c8-12813bfff9fa;
 Wed, 14 Jul 2021 01:18:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0E0661370;
 Wed, 14 Jul 2021 01:18:52 +0000 (UTC)
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
X-Inumbo-ID: 740a1f40-e441-11eb-87c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626225533;
	bh=7wa2DuMHWoRvaO8YJmb9x6UGOjBbwzMweWdXxg7gtwk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HUWKEhybGVulmC9QVJ/pv2QJlnLXkHIli5DBkhRmDMmoZkaZMCUMbVwuLbvpjciAb
	 1GyGlkwbLASEB781C5R28WsH8jrzJ0uhA6gHNuc8uifMCT7tLLGEIiFShHRHF72/Gn
	 9e2PpmOclGAijdFiBwDVhLhU2nUBiTYRpVleqOfIs/BOvwrdpfoOxfls9mS3bocTPW
	 tb7R1CWZ92REPtCkdYKwfUOGBNgcu7B7A8pJc/uCnCwD7pUhd2s1C0rXf4WWMMRakb
	 bkBZQcEusuGHaWcnKmFtyOqjWM5e0BUhgdm3W71wA6H6i+wBz6GpAhsXsxLyujQFl9
	 zWtCF6+Gz6DwQ==
Date: Tue, 13 Jul 2021 18:18:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Julien Grall <julien.grall@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 4/4] xen/mm: Provide dummy M2P-related helpers when
 the M2P is not supported
In-Reply-To: <3ee1496f-aa3d-8784-3d8c-f152958dbfbc@suse.com>
Message-ID: <alpine.DEB.2.21.2107131818430.23286@sstabellini-ThinkPad-T480s>
References: <20210703171152.15874-1-julien@xen.org> <20210703171152.15874-5-julien@xen.org> <3ee1496f-aa3d-8784-3d8c-f152958dbfbc@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Jul 2021, Jan Beulich wrote:
> On 03.07.2021 19:11, Julien Grall wrote:
> > From: Julien Grall <julien.grall@arm.com>
> > 
> > At the moment, Arm is providing a dummy implementation for the M2P
> > helpers used in common code. However, they are quite isolated and could
> > be used by other architecture in the future. So move the helpers
> > necessary for compilation in xen/mm.h and gate them with a new config
> > !HAS_M2P. The other M2P related helpers are removed.
> > 
> > Take the opportunity to encode that CONFIG_MEM_SHARING requires
> > the M2P. It is done in the header rather than the Kconfig because
> > the option is not defined in the common Kconfig.
> > 
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> With the other Kconfig hunk moved here (from the earlier patch)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

