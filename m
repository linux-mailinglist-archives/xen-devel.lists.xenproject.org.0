Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D25FF372
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 20:10:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423003.669462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojP88-0006Sx-SB; Fri, 14 Oct 2022 18:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423003.669462; Fri, 14 Oct 2022 18:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojP88-0006QE-Oz; Fri, 14 Oct 2022 18:09:56 +0000
Received: by outflank-mailman (input) for mailman id 423003;
 Fri, 14 Oct 2022 18:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdf0=2P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ojP87-0005eS-AS
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 18:09:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66709368-4beb-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 20:09:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19D1EB82356;
 Fri, 14 Oct 2022 18:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA21C433C1;
 Fri, 14 Oct 2022 18:09:49 +0000 (UTC)
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
X-Inumbo-ID: 66709368-4beb-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665770990;
	bh=XO5TiSWYMq7NjAj7dKmtww+z1k3itqzkGcU6pgxClM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mcZLStp+f1oQDQKV20TouypDs5gfaooqg4ttNIIEBpmryRcFS3xVYaziKcHZ/1elt
	 X+AYLkT4KDafNxSCFb/iEf9ehxLiXnCt9Qur2Atv6s4/MWf7a1lwYEpuQqOXyaTO/d
	 Gf29TDMld6XTW+3TVWZMZiZ+6L9imwMq9Xyn61VNrNqqC+QYM1oGfYlNyAPJmjBisM
	 A6O4Xqo15WIcB7S9vccgAEu7R+hxd85hbopzhouMfK1bGsRACjhJXWb/OhYJI/me/X
	 YrpUMLtiH/Tw5hsZA9ez3JmwqDZBGfVQXDI3uG9VIStPPmrklWXv/DXZ3Syzjdp9h4
	 UeZKyUY6XgFxQ==
Date: Fri, 14 Oct 2022 11:09:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Julien Grall <julien@xen.org>, 
    "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, 
    Jaxson Han <jaxson.han@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register)
 on Aarch32_v8r
In-Reply-To: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
> Hi Arm mantainers/Folks,
> 
> Please refer to the discussion
> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
> 
> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed virtual
> platform.
> 
> Zephyr is trying to read GICR_TYPER which is a 64 bit register using ldrd
> instruction.
> 
> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
> 0x9200000c.
> 
> As ISV is 0, so Xen cannot emulate this instruction.
> 
> The proposed solution is to use two sys_read32() on GICR_TYPER to return the
> lower and upper 32 bits.
> 
> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.

Hi all,

I wanted to take a step back on this issue before we jump into the
details.


Differently from other instructions we discussed in the past, strd and ldrd
are not deprecated and are not "unusual corner cases". There is no
statements such as "please don't use this" on the ARM ARM. If I were to
write an register read/write function in assembly for an RTOS, it would
be reasonable to use them.

So, I struggle to see how we'll be able to deal with all the possible
RTOSes out there that might have them in the code. We can fix Zephyr,
but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
etc.)?

Unless we can get ARM to issue a clear guidance that strd and ldrd are
deprecated, I think it would be better to attempt to decode them rather
than just fail. I don't like to have this kind of code in Xen, but I
don't see a way to support R52s without it.

That said, of course if Zephyr was to use two 32-bit reads instead of
one 64-bit read, it would be better for Xen. And we have more important
things to deal with right now in terms of R52 support (it is not even
upstream yet). So it is totally fine to change Zephyr and move forward
for now.

But medium term it doesn't seem to me that we can get away without a
solution in Xen for this (or a change in the ARM ARM).

