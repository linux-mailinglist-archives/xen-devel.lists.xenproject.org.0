Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BF4AA4CF
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 00:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265857.459418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG8Ty-0007ki-1N; Fri, 04 Feb 2022 23:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265857.459418; Fri, 04 Feb 2022 23:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG8Tx-0007hQ-TI; Fri, 04 Feb 2022 23:59:13 +0000
Received: by outflank-mailman (input) for mailman id 265857;
 Fri, 04 Feb 2022 23:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wnvI=ST=walle.cc=michael@srs-se1.protection.inumbo.net>)
 id 1nG8Tw-0007hI-7p
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 23:59:12 +0000
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7205f1de-8616-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 00:59:10 +0100 (CET)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7DF3F2223A;
 Sat,  5 Feb 2022 00:59:08 +0100 (CET)
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
X-Inumbo-ID: 7205f1de-8616-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1644019149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmWPFjjYyqYzUUzH0cXKRlvYTCQ/CsSJIfo38qefcGk=;
	b=o8nP1K9+6doIrTXqyPHp9V61cIWRIXY6T/povkEi+FJJBS5vHD9e9eB9S+t3VMncNzMN5N
	iPe2dZ6MrmtuuO/SmyUngVKnwThVc2qd10OunD0cOaFD+1qg+VqAnxqw4nVUKJndpy8UJY
	KQ5YsOe3OmeguVhD772NHTVCcZqVHC4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 05 Feb 2022 00:59:08 +0100
From: Michael Walle <michael@walle.cc>
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Zhiqiang.Hou@nxp.com, brucea@xilinx.com,
 cornelia.bruelhart@zal.aero, leo.krueger@zal.aero, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Peng Fan <peng.fan@nxp.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: Xen data from meta-virtualization layer
In-Reply-To: <CAJ=z9a0GX31E-yQRO3BpOujOCX09yOeeROkC57PzAUTUm3HV6g@mail.gmail.com>
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
 <20220204135814.1033356-1-michael@walle.cc>
 <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
 <faa7864d4df6d9373a3c6b489d3e4469@walle.cc>
 <CAJ=z9a0GX31E-yQRO3BpOujOCX09yOeeROkC57PzAUTUm3HV6g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <93c22ab5739616843584d73fe4dd0a3a@walle.cc>
X-Sender: michael@walle.cc

Hi Julien,

Am 2022-02-05 00:29, schrieb Julien Grall:
[..]
>> But not a very user friendly one, though. I guess the first UART
>> is disabled/removed by Xen? I haven't looked at how it is handled.
>> 
>> Can't we search for other uarts with the same interrupt and disable
>> these, too? Maybe conditionally by the SoC compatible?
> 
> The problem sounds quite similar to the one we had on sunxi. Although
> the UART was on the same page rather than sharing interrupts.
> 
> Xen has per-platform hook to prevent a device been assigned
> to dom0. For an example, you could look at:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/platforms/sunxi.c

Nice. At least, this is working now ;) I'll send a patch in
the next few days.

I guess it's safe to assume that we can always remove both UARTs
on the LS1028A (probably on most layerscapes). The most common
use case is to use the first UART for Xen. You could run Xen
without console (?), then you'd miss the possibility to map
the DUART. Or there could be a new driver for the LPUART on the
LS1028A. In this case, the DUART wouldn't be used by Xen either.

But I think we should start simple and just remove the DUART
altogether via that hook.

-michael

