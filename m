Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A7523E81
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327268.550043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosgI-0000QP-PM; Wed, 11 May 2022 20:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327268.550043; Wed, 11 May 2022 20:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosgI-0000Mx-M4; Wed, 11 May 2022 20:11:34 +0000
Received: by outflank-mailman (input) for mailman id 327268;
 Wed, 11 May 2022 20:11:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfEy=VT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nosb9-0006lp-RI
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:06:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee9d81e-d165-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 22:06:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01C8061A14;
 Wed, 11 May 2022 20:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55959C340EE;
 Wed, 11 May 2022 20:06:11 +0000 (UTC)
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
X-Inumbo-ID: cee9d81e-d165-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652299572;
	bh=oeCZ0vTTOTH1KbY27j1I9n9AJlgXD9xSXE4rv86FJpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ef6XfNTiqyQhJ6q02mxt7NwtbOVlgMMT30mxCxSyV4pgzHy4DddWm/ictGWuu4WtK
	 xc4Lqu1+SQ8R7haPLzcwPhsQ6n5HVMDy1N5A//jgsS4UwDzK81IzgKFH8AHzxCm9aP
	 rHFrqHO8u3UIjSw55ErjujYOlOBL1KcbQk34Pas2R0Ysg2P9ggDR+vs4yLxISIEhUj
	 yVwGDBh2I2jONWQcoiELYoyOLhTt+BS5a3ri41WaLGmUVwKTsBXT0Ba3JoOhA2XZrY
	 i3wXgNmQPGNmLw83TEMWYpEXr8hVg6pKP2cK5mh8AG378lG31GVyuUto01cyLsu23X
	 pDeX40Bq7ojBw==
Date: Wed, 11 May 2022 13:06:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
In-Reply-To: <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205111247030.43560@ubuntu-linux-20-04-desktop>
References: <cover.1651570561.git.bertrand.marquis@arm.com> <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com> <a05b426c-1800-a365-5b02-f82f0a391306@xen.org> <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org> <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com> <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org> <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop> <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
 <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org> <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Bertrand Marquis wrote:
> > I understand the patch is already written, so I was OK if you simply list of the commits with the authors/tags for this time.
> 
> I would like to understand where this requirement is coming from.
> 
> @George: is there some kind of legal reason for something like that ?

I am not George but I'll answer the legal question. Our "legal" document
is the DCO:

https://developercertificate.org/

This falls under case (b):

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

So from the legal point of view only your Signed-off-by line is
required.

I remember this well because I was confused about this a few years ago
in another case of taking code from Linux.


> > If both Stefano and you agree to not keep the authorships, then I will
> > not stand against it. However, I will not get involved in
> > committing and adding my ack.

I am fine either way. My only request is to mention the Linux commit-id
that Bertrand used as a base and Bertrand has already done that.


> I want first to clear up this process and understand why you are
> requesting this to know how I should do anything like that in the
> future.

It looks like our process docs are not very good on this point and might
benefit from a clarification. I hope you are volunteering :-)

Origin is defined as "it specifies the source of the patch" but it
doesn't say what actually is considered a "source".

I suggest to distinguish between the case where commits are ported
individually from the case where code is copied over (like when we
introduced SMMUv3.) If commits are copied individually, I think we
probably want an Origin tag for each of them and the source is the
original commit-id. If the code is copied from Linux (like the SMMUv3
case) then we probably only want to request a single Origin tag (or a
new tag?) with the base Linux version (5.18-rc3) rather than the
commit-id being backported. In that case the source would be the
repository baseline.

Cheers,

Stefano

