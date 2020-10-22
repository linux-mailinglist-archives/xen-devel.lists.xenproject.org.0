Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182F296348
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10591.28232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdxi-0001sh-Rz; Thu, 22 Oct 2020 17:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10591.28232; Thu, 22 Oct 2020 17:01:14 +0000
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
	id 1kVdxi-0001sI-Og; Thu, 22 Oct 2020 17:01:14 +0000
Received: by outflank-mailman (input) for mailman id 10591;
 Thu, 22 Oct 2020 17:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oPFL=D5=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1kVdxh-0001sB-TQ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:01:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c64d2098-81d4-4015-962f-0d2c855766f7;
 Thu, 22 Oct 2020 17:01:06 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVdxY-0005ie-II; Thu, 22 Oct 2020 17:01:04 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVdxY-0004Sg-5W; Thu, 22 Oct 2020 17:01:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oPFL=D5=xen.org=hx242@srs-us1.protection.inumbo.net>)
	id 1kVdxh-0001sB-TQ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:01:13 +0000
X-Inumbo-ID: c64d2098-81d4-4015-962f-0d2c855766f7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c64d2098-81d4-4015-962f-0d2c855766f7;
	Thu, 22 Oct 2020 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID;
	bh=FGFjykp3RtKn11ymLf3GRpJEUYfHOM80hAw8IsNtoqY=; b=vSjTIpob+IlDsFaU0hrx00/U34
	hQ8cA0dJ78HriNVM3IVNGHsRBN03ITCX5t0A0G/Dy4LFW25ezQFhrxSgTw+7K0md+XPl9MQz46SBK
	jL6iUab/O5ztp6jKrTGpi6IBDEhEA6jPJ1DhaPPnlqHYhLmtpMTy8CO7QBRmqpZX8ffU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVdxY-0005ie-II; Thu, 22 Oct 2020 17:01:04 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=u1bbd043a57dd5a.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVdxY-0004Sg-5W; Thu, 22 Oct 2020 17:01:04 +0000
Message-ID: <48816c69ab2551a34c57a87392bb7f08ca6482ee.camel@xen.org>
Subject: Re: XSM and the idle domain
From: Hongyan Xia <hx242@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>, jbeulich@suse.com, jandryuk@gmail.com, 
	dgdegra@tycho.nsa.gov
Date: Thu, 22 Oct 2020 18:01:00 +0100
In-Reply-To: <f8f5f354-aa8d-4bd0-9c0e-ef37702e80c5@citrix.com>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
	 <f8f5f354-aa8d-4bd0-9c0e-ef37702e80c5@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 13:51 +0100, Andrew Cooper wrote:
> On 21/10/2020 15:34, Hongyan Xia wrote:
> > The first question came up during ongoing work in LiveUpdate. After
> > an
> > LU, the next Xen needs to restore all domains. To do that, some
> > hypercalls need to be issued from the idle domain context and
> > apparently XSM does not like it.
> 
> There is no such thing as issuing hypercalls from the idle domain
> (context or otherwise), because the idle domain does not have enough
> associated guest state for anything to make the requisite
> SYSCALL/INT80/VMCALL/VMMCALL invocation.
> 
> I presume from this comment that what you mean is that you're calling
> the plain hypercall functions, context checks and everything, from
> the
> idle context?

Yep, the restore code just calls the hypercall functions from idle
context.

> If so, this is buggy for more reasons than just XSM objecting to its
> calling context, and that XSM is merely the first thing to explode. 
> Therefore, I don't think modifications to XSM are applicable to
> solving
> the problem.
> 
> (Of course, this is all speculation because there's no concrete
> implementation to look at.)

Another explosion is the inability to create hypercall preemption,
which for now is disabled when the calling context is the idle domain. 
Apart from XSM and preemption, the LU prototype works fine. We only
reuse a limited number of hypercall functions and are not trying to be
able to call all possible hypercalls from idle.

Having a dedicated domLU just like domB (or reusing domB) sounds like a
viable option. If the overhead can be made low enough then we won't
need to work around XSM and hypercall preemption.

Although the question was whether XSM should interact with the idle
domain. With a good design LU should be able to sidestep this though.

Hongyan


