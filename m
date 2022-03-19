Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A94DE4CA
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 01:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292279.496466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMkT-0004c8-48; Sat, 19 Mar 2022 00:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292279.496466; Sat, 19 Mar 2022 00:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMkT-0004Yg-13; Sat, 19 Mar 2022 00:15:13 +0000
Received: by outflank-mailman (input) for mailman id 292279;
 Sat, 19 Mar 2022 00:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVMkS-0004Ya-4J
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 00:15:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3427734-a719-11ec-8fbc-03012f2f19d4;
 Sat, 19 Mar 2022 01:15:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF4061714;
 Sat, 19 Mar 2022 00:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F206C340E8;
 Sat, 19 Mar 2022 00:15:06 +0000 (UTC)
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
X-Inumbo-ID: a3427734-a719-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647648908;
	bh=P+KCV/jCdV5b32Ntpf7tb3mbpn62TBuJkCAGYio9kNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HyaAGrpCqBM21611BBi41PGzrAhfX5+w5pO37jvH+uCQ+GR1u8pPjwcxBeR+5Ra4i
	 ixdulQEBTPi7SoDVWpsDX4dBwoTgVZ4uyaJKiaRCHHdpH8r0S0X9M8UfTQ7P8jCFPK
	 U5AnZnFFC8glXbwYO8EGT9rknRhyi33SuXiTW7T5AEp9pRQNlB0KtyrCnrOITuzwOo
	 LdlpOZAKUgU5a9AE2yFVcRoQLcrIssadkn0n0MXITuQ4MOpd7Hl7eVRZq0dRccnJ3G
	 YP7q8HMhbZxSQbsQTvD1WHbw/pQM1ct8tqBAOWlVBE2BLo9shptYU49hgRNnkJQhCo
	 1n8uvU2gwv/YQ==
Date: Fri, 18 Mar 2022 17:15:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    bertrand.marquis@arm.com
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke
 test
In-Reply-To: <YjSfPtUwWrqhDsW2@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2203181713000.2910984@ubuntu-linux-20-04-desktop>
References: <20210714004854.31135-2-sstabellini@kernel.org> <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org> <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop> <YjSfPtUwWrqhDsW2@perard.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Anthony PERARD wrote:
> On Wed, Mar 16, 2022 at 06:38:53PM -0700, Stefano Stabellini wrote:
> > Also considering the recent arm32 xen breakage, which could have been
> > caught by gitlab-ci before commit,
> 
> I'm not sure that's true. I think the commits you are speaking about
> also break the build on x86, which was caught by the gitlab ci.
> 
> Anyway, some arm32 smoke tests on gitlab should be useful.

I think we are probably talking about different breakages :-)

Ayan recently broke Xen on ARM32 (run-time not build-time) with the
commit 9e5a68a66 and fef5531fd. I verified that the QEMU32 test in this
series actually catches the failure.

Can I get an ack on this? :-)

