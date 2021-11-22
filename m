Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9F4595D9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 21:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229052.396416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpFTd-0006JB-9Z; Mon, 22 Nov 2021 19:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229052.396416; Mon, 22 Nov 2021 19:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpFTd-0006G8-6U; Mon, 22 Nov 2021 19:59:45 +0000
Received: by outflank-mailman (input) for mailman id 229052;
 Mon, 22 Nov 2021 19:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpFTb-0006G2-62
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 19:59:43 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b871d5-4bce-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 20:59:40 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70DBB60F70;
 Mon, 22 Nov 2021 19:59:38 +0000 (UTC)
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
X-Inumbo-ID: b9b871d5-4bce-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637611178;
	bh=wm1tzJiEzZW/9Ix/qvj/CPYV5ys+QJiya+3Pex4Et98=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VTEeifsNRkjVlW6JxmgFs8RTEhtCQDYjNw3MgUaU8XIvthSB8jTaodvMuFGuYEFf4
	 c+MZvsYqfuMVmLH+Mao7hFEh5FIZpQexg1AfHHBfQ4AReOM5MJPYYyE5vV8UJ0W/Ym
	 tQ6eIRbcPaSxv+0sxDqefb0BiG8pPDc9ECAzwUqH99XvPGPq/jSoWvE+ZPzNm0CVnT
	 K8yxMp/rNPHyE04qyMDtA5MtUw/ybFh07pdeVddBZe7fyL6mfvphSIjLD5KA4mfnJr
	 87iNDH+ShNX/a1J2iiNbQRXzgLs54Ul5tNW4aLBFvkpOArptWsM30jdWb9RJojAn9y
	 RcLvFgPuixsog==
Date: Mon, 22 Nov 2021 11:59:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, stefano.stabellini@xilinx.com, sstabellini@kernel.org, 
    jbeulich@suse.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str post-indexing
 instructions
In-Reply-To: <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
References: <20211119165202.42442-1-ayankuma@xilinx.com> <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org> <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Nov 2021, Ayan Kumar Halder wrote:
> Stefano > It doesn't look like we are setting dabt->write anywhere.
> 
> Ayan > Yes, this is a miss. Depending on the opc, this should be upadeted
> accordingly in decode_64bit_loadstore_postindexing().
> 
> Stefano > Also, is info.gpa in try_handle_mmio already updated in the
> pre-index
> case? If not, do we need to apply the offset manually here?
> 
> Ayan > Sorry, I did not understand you. This patch is only related to the post
> indexing ldr/str issue. Why do we need to check for pre-indexing ?

I thought you were trying to handle both post-indexing and pre-indexing.
It is OK if you intend to only handle post-indexing but considering that
most of the code is shared between the two, we might as well also make
pre-indexing work (unless it turns out it is more difficult).

In the pre-indexing case, I would imagine we need to update the base
address before taking any other actions.

