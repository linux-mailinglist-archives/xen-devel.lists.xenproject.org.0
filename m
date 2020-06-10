Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9B1F5747
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 17:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj2KC-0001D8-SL; Wed, 10 Jun 2020 15:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h/9h=7X=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jj2KB-0001Cp-IV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 15:07:31 +0000
X-Inumbo-ID: 17b3199e-ab2c-11ea-8496-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17b3199e-ab2c-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 15:07:25 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id CF65B122804;
 Wed, 10 Jun 2020 17:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1591801644;
 bh=brXaipuMVaItSAA9lBzHtWeUBGANdyih+K9IC1ATdDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDBHv/lnU3FUIX/xeH+d8DqZSMpA8Tuo1pH7FxD7yNBYPDqAL1GtTYHSk/sccOQoO
 ddW0tqXnir1v93kE5+8Fcazxckas96m1g6uZ/FCXkqPJDUwWMHBMCHZQEuexFBIaZe
 95eST6L+95KBJcgbLzJoJq6+OfbpGR2EnGdFQS+tb+bjd5AYQcVmQKrz0M8wzhQW3n
 8c3/DWrV6Rn2S/h7Q+ORDlgXF1ja/zbnC0GI7VPC5b7eWibVw2yw++9bJ6JlVXcoWT
 WSg4xmCc2Lb77M0KGmW4/m1zXiNk55vT6K09AuSVwi3WNrCZu7wsDYexP/ToKNoOIV
 UuWjXeiSX2zjQ==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id B6720265E722; Wed, 10 Jun 2020 17:07:24 +0200 (CEST)
Date: Wed, 10 Jun 2020 17:07:24 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
Message-ID: <20200610150724.GC16839@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
 <20200610132225.GA16839@nodbug.lucina.net>
 <46e87834-bf47-4003-1f32-89a47255155d@citrix.com>
 <20200610135601.GB16839@nodbug.lucina.net>
 <6b2a0091-2c56-895c-762d-719e5796985d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b2a0091-2c56-895c-762d-719e5796985d@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wednesday, 10.06.2020 at 15:21, Andrew Cooper wrote:
> > I don't need v2 at all, I was just going by the comments in grant_table.h,
> > which read: "Version 1 of the grant table entry structure is maintained
> > purely for backwards compatibility.  New guests should use version 2."
> 
> Ha...
> 
> That comment wasn't written with the benefit of hindsight.
> 
> IMO, grant v2 is not worth the astounding quantity of XSAs its
> implementation actually gave us, or the complexity of the resulting code.
> 
> > Grant status frames are a v2-only thing, right?
> 
> Correct.
> 
> The split status frames was new in v2, in an attempt to reduce cacheline
> ping-pong.
> 
> The downside is that the guest needs an unbounded loop trying to make a
> change to the grant table while ensuring that the flags in the status
> frame don't change asynchronously.
> 
> ~Andrew
> 
> P.S. In some theoretical world, I was hoping to have something to live
> in https://xenbits.xen.org/docs/latest/guest-guide/index.html on this
> subject.  Do you mind if I use you as a retroactive guineapig if/when
> some documentation were to appear?

No problem, sure, go for it.

-mato

