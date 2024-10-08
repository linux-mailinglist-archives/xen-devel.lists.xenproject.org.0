Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007599573E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 20:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813434.1226373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFMA-0004BU-2t; Tue, 08 Oct 2024 18:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813434.1226373; Tue, 08 Oct 2024 18:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFM9-00048N-Vy; Tue, 08 Oct 2024 18:54:49 +0000
Received: by outflank-mailman (input) for mailman id 813434;
 Tue, 08 Oct 2024 18:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrDf=RE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syFM8-00048H-FX
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 18:54:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9804429-85a6-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 20:54:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69B6D5C3F3B;
 Tue,  8 Oct 2024 18:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D157C4CEC7;
 Tue,  8 Oct 2024 18:54:44 +0000 (UTC)
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
X-Inumbo-ID: c9804429-85a6-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728413685;
	bh=uBjc82l4IMi5lAJ6YgwgY4es9xV/efMXZpwntdWirwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YHJb0/m8fOoq2oFGASAGMprvDaGC4mfe+Uxa8Sb7CcrzOkM/0uh6hJuhNaANqQQqU
	 rJtIYsWdnu/5RaNHLY/o78sTsjTD54UEImoiQ5ezLTSoKE4tfyO9mIQ1zc1XOM7Woy
	 +1SjGKT4V6+5bwbUkOUIIgFcDcy7WRL86ZXJOj4cuBn2VD2FRZw8Bclf2PYyyvhd3I
	 7yU87AcbVhV6l1C4lqrzYYaTqd7KESUZawRUv05kjI277WedjPhZXJOXnQ0r2b+Mbl
	 lN3eyec6YtZEfDd0JzBbWn9C9q2CepPjnf5C6cQ55Ic/rbJL+2QHEk0CjZX9bdxnPM
	 cwOLVC4qYfUyg==
Date: Tue, 8 Oct 2024 11:54:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Stop building QEMU in general
In-Reply-To: <056fbcc4-71f1-4ce1-aae6-bb3a7192aefb@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410081151240.12382@ubuntu-linux-20-04-desktop>
References: <20241008155023.2571517-1-andrew.cooper3@citrix.com> <ZwVddI62BTAtMUls@l14> <056fbcc4-71f1-4ce1-aae6-bb3a7192aefb@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Oct 2024, Andrew Cooper wrote:
> On 08/10/2024 5:27 pm, Anthony PERARD wrote:
> > On Tue, Oct 08, 2024 at 04:50:23PM +0100, Andrew Cooper wrote:
> >> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> >> index c668736bdc2f..c83e0bdbe119 100644
> >> --- a/automation/gitlab-ci/build.yaml
> >> +++ b/automation/gitlab-ci/build.yaml
> >> @@ -339,6 +339,7 @@ alpine-3.18-gcc-debug:
> >>    extends: .gcc-x86-64-build-debug
> >>    variables:
> >>      CONTAINER: alpine:3.18
> >> +    QEMU: y
> > Could you use a different name for the variable? This is exposed as an
> > environment variable, it could easily be used in a build system already,
> > like used to store a path to a QEMU to use.
> >
> > We don't really have a name space for CI variable, but maybe
> > BUILD_QEMU or BUILD_QEMU_XEN would be less likely to clash with other
> > usages.
> >
> > Otherwise patch looks fine.
> 
> A can switch to BUILD_QEMU, but I don't plan to repost just for that.

The patch is fine.

BUILD_QEMU is a bit better. BUILD_QEMU_XEN or BUILD_QEMU_DM would be
even better to clarify we are building a QEMU version to serve as device
model. It is a pity that typically we call qemu-dm the ancient QEMU
fork because "qemu device model" is more meaningful than "qemu xen".

Anyway, pick your preference and feel free to change the variable name
on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

