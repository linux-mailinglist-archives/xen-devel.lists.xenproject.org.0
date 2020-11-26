Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4EC2C4BBD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 01:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38177.70875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki4hq-0001rm-EX; Thu, 26 Nov 2020 00:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38177.70875; Thu, 26 Nov 2020 00:00:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki4hq-0001rN-BD; Thu, 26 Nov 2020 00:00:14 +0000
Received: by outflank-mailman (input) for mailman id 38177;
 Thu, 26 Nov 2020 00:00:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aPbE=FA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ki4ho-0001rI-0s
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 00:00:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c45a2d0-4e66-4b8b-badb-8016e347a3e2;
 Thu, 26 Nov 2020 00:00:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C55520B1F;
 Thu, 26 Nov 2020 00:00:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aPbE=FA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ki4ho-0001rI-0s
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 00:00:12 +0000
X-Inumbo-ID: 0c45a2d0-4e66-4b8b-badb-8016e347a3e2
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c45a2d0-4e66-4b8b-badb-8016e347a3e2;
	Thu, 26 Nov 2020 00:00:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2C55520B1F;
	Thu, 26 Nov 2020 00:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606348810;
	bh=s6UNnrvgotCQH11T/faRa6XXhOPUDjwt92Z2nqFk6IA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Snd9j7kpREGUTJT/AWkI1ARQ8hx28eFhePdpO0aPEsjTOnIed5Q8wL64jtyjmynmH
	 0QShDqKUiWoa7vzSFz24EZ+Iuztzfg/7/wHti84QML9+BifIqEPQwymRUp40S/Sr8w
	 2/mkZ+EHzc0Q1erRXE2YWVnhWtfceDWNlXswaPlw=
Date: Wed, 25 Nov 2020 16:00:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, 
    nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
In-Reply-To: <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
References: <20201109082110.1133996-1-penny.zheng@arm.com> <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org> <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Resuming this old thread.

On Fri, 13 Nov 2020, Wei Chen wrote:
> > Hi,
> > 
> > On 09/11/2020 08:21, Penny Zheng wrote:
> > > CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
> > > might return a wrong value when the counter crosses a 32bit boundary.
> > >
> > > Until now, there is no case for Xen itself to access CNTVCT_EL0,
> > > and it also should be the Guest OS's responsibility to deal with
> > > this part.
> > >
> > > But for CNTPCT, there exists several cases in Xen involving reading
> > > CNTPCT, so a possible workaround is that performing the read twice,
> > > and to return one or the other depending on whether a transition has
> > > taken place.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > 
> > Acked-by: Julien Grall <jgrall@amazon.com>
> > 
> > On a related topic, do we need a fix similar to Linux commit
> > 75a19a0202db "arm64: arch_timer: Ensure counter register reads occur
> > with seqlock held"?
> > 
> 
> I take a look at this Linux commit, it seems to prevent the seq-lock to be
> speculated.  Using an enforce ordering instead of ISB after the read counter
> operation seems to be for performance reasons.
> 
> I have found that you had placed an ISB before read counter in get_cycles
> to prevent counter value to be speculated. But you haven't placed the second
> ISB after reading. Is it because we haven't used the get_cycles in seq lock
> critical context (Maybe I didn't find the right place)? So should we need to fix it
> now, or you prefer to fix it now for future usage?

Looking at the call sites, it doesn't look like we need any ISB after
get_cycles as it is not used in any critical context. There is also a
data dependency with the value returned by it.

So I am thinking we don't need any fix. At most we need an in-code comment?

