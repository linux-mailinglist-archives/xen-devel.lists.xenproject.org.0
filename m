Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979C2F3C98
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 00:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66193.117485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTGw-0007Lz-5E; Tue, 12 Jan 2021 23:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66193.117485; Tue, 12 Jan 2021 23:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTGw-0007La-1M; Tue, 12 Jan 2021 23:40:22 +0000
Received: by outflank-mailman (input) for mailman id 66193;
 Tue, 12 Jan 2021 23:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kzTGu-0007LU-3f
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 23:40:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad65b43f-ab46-4739-9d7b-fe56def4aef9;
 Tue, 12 Jan 2021 23:40:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02C4723120;
 Tue, 12 Jan 2021 23:40:17 +0000 (UTC)
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
X-Inumbo-ID: ad65b43f-ab46-4739-9d7b-fe56def4aef9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610494818;
	bh=m3dFvRxblzM0MXFdKaZmlMtPRm7Sa/kNOPsRgxbFbMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ssiBonakPxh/2aE+fv4oNeE0JCr3vJQ8i47cevxvSY8aa5L+x2BS60bLtbIIDnPYI
	 CopQgqJJ7i2yC5hKq680AM1+/RxSOXPSqedz1jOTxnRaucjRDB04zc7ftfaVXgItT0
	 LX+ENtz2TnxTHxMkE0tk9MO7nRhT2uqa2HvY+mv3CNgdMnHFfbyEARfz9oqqyZ6/EH
	 scqNhoNgvntAXD2Jt/1ON55cqByhr/3lmC5QW1JsXU0pJ4Q6010O8nHLICtr771twm
	 +xjzYOWM1vpbwUMIhsSeg3Y5zllwxDImtqon84oV/9PeNHX7CaGgovwVo6OmZ512kY
	 UXVEz+4/CIixA==
Date: Tue, 12 Jan 2021 15:40:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>, 
    bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
In-Reply-To: <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2101121538501.2495@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com> <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com> <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Stefano Stabellini wrote:
> On Tue, 12 Jan 2021, Jan Beulich wrote:
> > On 08.01.2021 15:46, Rahul Singh wrote:
> > > -Wimplicit-fallthrough warns when a switch case falls through. Warning
> > > can be suppress by either adding a /* fallthrough */ comment, or by
> > > using a null statement: __attribute__ ((fallthrough))
> > 
> > Why is the comment variant (which we use in many places already,
> > albeit with varying wording) not the route of choice?
> 
> See previous discussion:
> 
> https://marc.info/?l=xen-devel&m=160707274517270
> https://marc.info/?l=xen-devel&m=160733742810605
> https://marc.info/?l=xen-devel&m=160733852011023
> 
> We thought it would be best to introduce "fallthrough" and only resort
> to comments as a plan B. The usage of the keyword should allow GCC to do
> better checks.
> 
> 
> > > Define the pseudo keyword 'fallthrough' for the ability to convert the
> > > various case block /* fallthrough */ style comments to null statement
> > > "__attribute__((__fallthrough__))"
> > > 
> > > In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> > > the same time the warning and the comment parsing were introduced.
> > > 
> > > fallthrough devolves to an empty "do {} while (0)" if the compiler
> > > version (any version less than gcc 7) does not support the attribute.
> > 
> > What about Coverity? It would be nice if we wouldn't need to add
> > two separate constructs everywhere to make both compiler and static
> > code checker happy.
> 
> I don't think I fully understand your reply here: Coverity doesn't come
> into the picture. Given that GCC provides a special keyword to implement
> fallthrough, it makes sense to use it when available. When it is not
> available (e.g. clang or older GCC) we need to have an alternative to
> suppress the compiler warnings. Hence the need for this check:
> 
>   #if (!defined(__clang__) && (__GNUC__ >= 7))

I forgot to mention that it matches the implementation in Linux, see
include/linux/compiler_attributes.h and 294f69e662d15.

