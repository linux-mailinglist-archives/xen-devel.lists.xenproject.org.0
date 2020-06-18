Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA71FFDFC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 00:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm2zg-0002wk-KK; Thu, 18 Jun 2020 22:26:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dWRf=77=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jm2zf-0002wf-L0
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 22:26:47 +0000
X-Inumbo-ID: cbb601d6-b1b2-11ea-bb01-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbb601d6-b1b2-11ea-bb01-12813bfff9fa;
 Thu, 18 Jun 2020 22:26:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BB5420732;
 Thu, 18 Jun 2020 22:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592519206;
 bh=6hEaxs3Os3Ntt1eEip0VCSuElqgUOpWvSOqLbFxpfPk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XEwN85c3hFei1VZBeZQedt8vsKczlLKSVb6tRL+pOkwVihSqqYvuxgo8DNqzRFbDw
 fe/My2II6vSM9ZeFV0aFJEWfGt1+jHtBojJdzSl43F2HQaMSLHUlqUOFBVSXwhawED
 Zv1WvcU88dUlppBPjg8o5J+lvArPnjV5jLJLdtyI=
Date: Thu, 18 Jun 2020 15:26:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xadimgnik@gmail.com, paul@xen.org, pdurrant@amazon.com
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
In-Reply-To: <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
Message-ID: <alpine.DEB.2.21.2006181523070.14005@sstabellini-ThinkPad-T480s>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: julien@xen.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul, Julien, Volodymyr,

This is another bug fix that I would like to get in 4.14. It doesn't
look like we need any changes to this patch, assuming that it is
accurate to the spec.

It would be nice if Volodymyr could provide more info on the spec side,
but honestly I trust his experience on this.

Paul, are you OK with this going into 4.14?



On Sat, 6 Jun 2020, Julien Grall wrote:
> (+Paul)
> 
> Hi,
> 
> On 18/05/2020 02:53, Volodymyr Babchuk wrote:
> > Trusted Applications use popular approach to determine required size
> > of buffer: client provides a memory reference with the NULL pointer to
> > a buffer. This is so called "Null memory reference".  TA updates the
> 
> NIT: You use double space after '.' here but all the others use a single
> space.
> 
> > reference with the required size and returns it back to client. Then
> > client allocates buffer of needed size and repeats the operation.
> > 
> > This behavior is described in TEE Client API Specification, paragraph
> > 3.2.5. Memory References.
> 
> From the spec, it is not a clear cut that NULL will always used as fetching
> the required size of an output buffer. In particular, they suggest to refer to
> the protocol.
> 
> In your commit message you indirectly point to an example where 0/NULL would
> have a different meaning depending on the flags. This is not explained in the
> TEE Client API Specification. Do you have some pointer I could use to check
> the behavior?
> 
> > 
> > OP-TEE represents this null memory reference as a TMEM parameter with
> > buf_ptr == NULL. This is the only case when we should allow TMEM
> > buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
> 
> IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer at
> address 0" but with the flag cleared, it would mean "return the size". Am I
> correct?
> 
> > 
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> The code looks to match your commit message, but I wasn't able to match it
> with the spec. Do you have other pointer I could use to check the behavior?
> 
> I assume this wants to be part of Xen 4.14. The change is only for OP-TEE
> which is a tech preview feature. So the risk is very limited.

