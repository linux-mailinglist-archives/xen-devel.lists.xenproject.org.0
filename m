Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A63331BA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 23:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95826.180893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJl5H-0000Q1-Ha; Tue, 09 Mar 2021 22:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95826.180893; Tue, 09 Mar 2021 22:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJl5H-0000Pg-ES; Tue, 09 Mar 2021 22:44:11 +0000
Received: by outflank-mailman (input) for mailman id 95826;
 Tue, 09 Mar 2021 22:44:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJl5G-0000Pb-Kv
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 22:44:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1739289-9f18-4739-8eed-45cf74165beb;
 Tue, 09 Mar 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF9F5650FD;
 Tue,  9 Mar 2021 22:44:08 +0000 (UTC)
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
X-Inumbo-ID: f1739289-9f18-4739-8eed-45cf74165beb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615329849;
	bh=d8xIRX0RtCjsSAfrzN3mwsU8YemgIC4uP3zO6GCviMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nnT+x7HVDzEFqQS3Io8TUhH9vpJSIn/8YlliOCLGN5/8+CMcjfY35AZ3cIqmJYdYN
	 oKdV68FcbkL2FgoIrR6Qe2rcyNe3SpJyRuokget2gFB2gqpiHIWxDTUaIOWTYJGH/T
	 WDmgFWNpkkLgu4/hm4D/JxPN0YllmUt8VVNan2aBMHzWeYtweTyzS3y4HNlROtL4Uz
	 sbkBj4pIdPlg8Mk68cL1gv/Lk3MMLQekSAyIHdqyo8InvNCNgtfXZx/64Cc4dhcFFx
	 zaFUFkbJKnLuP9rKDwEsMYhDW9odo/9inM8tqzkkzgFDizXUjWyaj50rklVUAWEK7u
	 dfjD3JGLZK+Hg==
Date: Tue, 9 Mar 2021 14:44:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
In-Reply-To: <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
Message-ID: <alpine.DEB.2.21.2103091443220.16374@sstabellini-ThinkPad-T480s>
References: <202103092114.129LEgZp059925@m5p.com> <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Mar 2021, Andrew Cooper wrote:
> On 08/03/2021 13:36, Elliott Mitchell wrote:
> > typeof() is available in Xen's build environment, which uses Xen's
> > compiler.  As these headers are public, they need strict standards
> > conformance.  Only __typeof__() is officially standardized.
> >
> > A compiler in standards conformance mode should report:
> >
> > warning: implicit declaration of function 'typeof' is invalid in C99
> > [-Wimplicit-function-declaration]
> >
> > (this has been observed with FreeBSD's kernel build environment)
> >
> > Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015 +0100
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> s!arm!xen/public! in the subject seeing as two thirds of the
> modifications are in non-ARM headers.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> This wants backporting as a build fix, so should be considered for 4.15
> at this point.

+1

