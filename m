Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444F459AF9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 05:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229113.396525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpNBd-0006yq-KV; Tue, 23 Nov 2021 04:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229113.396525; Tue, 23 Nov 2021 04:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpNBd-0006vv-HD; Tue, 23 Nov 2021 04:13:41 +0000
Received: by outflank-mailman (input) for mailman id 229113;
 Tue, 23 Nov 2021 04:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpNBb-0006vp-Rn
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 04:13:39 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb64cc9c-4c13-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 05:13:38 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E0CD61056;
 Tue, 23 Nov 2021 04:13:36 +0000 (UTC)
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
X-Inumbo-ID: bb64cc9c-4c13-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637640816;
	bh=Ve01jzpnj8vwVW9CQ9UGVcsXQ2S3MX8ZrjLBcqNMJv4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EYrwXAO9OnvvOIWKHm5M/hDv5S6Gumus7TY0ldR9X0opxFlCl4GAkumWu+RWBjlFN
	 5gC03BP4ymU5JMKWVg18BcZeLzIT++WN+BWljZS906XS5GPiK5Vq8g83j5slYJwchq
	 4k7qDdlUMS77Iv6zQ5n7opVGbglENF0I4XS5MMbogDAL0IWFCzPULHoJcF1dqDv36r
	 ckYw2o67aAVB38vStyHVQuqbjmEEYyfvgLC8tbd2T3YpYjxNs3Og+1iV/+X9syT8iQ
	 XixXesycfpOMbKJ02h12jaggRzZyobQ59w38Za9zxpbnHCK2pvrwUuBpTOgFtAcBM+
	 w/qJLoqpZWkpQ==
Date: Mon, 22 Nov 2021 20:13:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str post-indexing
 instructions
In-Reply-To: <CAJ=z9a1L5v2+wC7-aaA2PjV2FzrFXjT-5t_0ijznGKvwywvd5A@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111221241450.1412361@ubuntu-linux-20-04-desktop>
References: <20211119165202.42442-1-ayankuma@xilinx.com> <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org> <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com> <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1L5v2+wC7-aaA2PjV2FzrFXjT-5t_0ijznGKvwywvd5A@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Nov 2021, Julien Grall wrote:
> On Mon, 22 Nov 2021 at 19:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Mon, 22 Nov 2021, Ayan Kumar Halder wrote:
> > > Stefano > It doesn't look like we are setting dabt->write anywhere.
> > >
> > > Ayan > Yes, this is a miss. Depending on the opc, this should be upadeted
> > > accordingly in decode_64bit_loadstore_postindexing().
> > >
> > > Stefano > Also, is info.gpa in try_handle_mmio already updated in the
> > > pre-index
> > > case? If not, do we need to apply the offset manually here?
> > >
> > > Ayan > Sorry, I did not understand you. This patch is only related to the post
> > > indexing ldr/str issue. Why do we need to check for pre-indexing ?
> >
> > I thought you were trying to handle both post-indexing and pre-indexing.
> > It is OK if you intend to only handle post-indexing but considering that
> > most of the code is shared between the two, we might as well also make
> > pre-indexing work (unless it turns out it is more difficult).
> 
> Wouldn't this effectively be dead code?
> 
> >
> > In the pre-indexing case, I would imagine we need to update the base
> > address before taking any other actions.
> 
> >From my understanding, this would have already been performed by the
> HW when the syndrome is valid. This may also be the case for
> the non-valid case, but I haven't checked the Arm Arm.

It is not clear to me either, that's why I wrote "I would imagine"... I
was guessing that it is not done by the HW in the non-valid case but I
don't know.

Of course, if it is already done by the HW, that's all the better: no
need for us to do anything.

