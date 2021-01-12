Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80C2F3C8F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 00:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66184.117461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzT7x-0006H5-0F; Tue, 12 Jan 2021 23:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66184.117461; Tue, 12 Jan 2021 23:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzT7w-0006Gg-TH; Tue, 12 Jan 2021 23:31:04 +0000
Received: by outflank-mailman (input) for mailman id 66184;
 Tue, 12 Jan 2021 23:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kzT7w-0006Gb-0f
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 23:31:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa085463-33e2-48ce-82bc-2f3dece13d01;
 Tue, 12 Jan 2021 23:31:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78C1E2312F;
 Tue, 12 Jan 2021 23:31:00 +0000 (UTC)
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
X-Inumbo-ID: aa085463-33e2-48ce-82bc-2f3dece13d01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610494261;
	bh=WgSl7SvUQ46mARfasBpoefqPtup5TRsCb2seV1n/73k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WrP/oPR8mLhN54ZLD80MaE5Oo+r/A4WLkBRSQqxvK5pnmkFub7UVMAKbtDhDdyBb/
	 U3c0+shFuKV2/jBa7bGy4kjOLm/m6ha5Gp9iDC/uhrBUyY2/WDkzGQ6hSDqA67RCyh
	 G5po7wCaxiYXPYTi+op+uHZvChIA557G4HH4GHuXsoTeV217dq/BKmhh6l/RdinlcI
	 2gpCuEHHA9+CmlkBTYwmZRKB8OcK882LXuejqpMCXIomy6IojYcPwzyn/AFiUOWM90
	 wpNyQWfymHDgnFvJ6MtMGp3zHV+xzuHnLoRAQtpk491YJy+953mSwOXZjeMts4q6mk
	 tCRo4/yNj6e2Q==
Date: Tue, 12 Jan 2021 15:30:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Rahul Singh <rahul.singh@arm.com>, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
In-Reply-To: <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
Message-ID: <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com> <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Jan Beulich wrote:
> On 08.01.2021 15:46, Rahul Singh wrote:
> > -Wimplicit-fallthrough warns when a switch case falls through. Warning
> > can be suppress by either adding a /* fallthrough */ comment, or by
> > using a null statement: __attribute__ ((fallthrough))
> 
> Why is the comment variant (which we use in many places already,
> albeit with varying wording) not the route of choice?

See previous discussion:

https://marc.info/?l=xen-devel&m=160707274517270
https://marc.info/?l=xen-devel&m=160733742810605
https://marc.info/?l=xen-devel&m=160733852011023

We thought it would be best to introduce "fallthrough" and only resort
to comments as a plan B. The usage of the keyword should allow GCC to do
better checks.


> > Define the pseudo keyword 'fallthrough' for the ability to convert the
> > various case block /* fallthrough */ style comments to null statement
> > "__attribute__((__fallthrough__))"
> > 
> > In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> > the same time the warning and the comment parsing were introduced.
> > 
> > fallthrough devolves to an empty "do {} while (0)" if the compiler
> > version (any version less than gcc 7) does not support the attribute.
> 
> What about Coverity? It would be nice if we wouldn't need to add
> two separate constructs everywhere to make both compiler and static
> code checker happy.

I don't think I fully understand your reply here: Coverity doesn't come
into the picture. Given that GCC provides a special keyword to implement
fallthrough, it makes sense to use it when available. When it is not
available (e.g. clang or older GCC) we need to have an alternative to
suppress the compiler warnings. Hence the need for this check:

  #if (!defined(__clang__) && (__GNUC__ >= 7))


