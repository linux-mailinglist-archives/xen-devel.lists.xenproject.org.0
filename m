Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566A455159
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 00:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227043.392562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUnr-0006Xa-Cm; Wed, 17 Nov 2021 23:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227043.392562; Wed, 17 Nov 2021 23:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUnr-0006V5-9U; Wed, 17 Nov 2021 23:57:23 +0000
Received: by outflank-mailman (input) for mailman id 227043;
 Wed, 17 Nov 2021 23:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnUnp-0006Ug-Ro
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 23:57:21 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18748871-4802-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 00:57:19 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87B55619E5;
 Wed, 17 Nov 2021 23:57:17 +0000 (UTC)
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
X-Inumbo-ID: 18748871-4802-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637193437;
	bh=NrBsKGhaDZIw8SoTyBJoF3nIK0DO8mVjl4O1X5Zl62c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PuSX3k4UyxjCaBHnsyxUPAg3Vr8boxvf1zvTFiDdwGyEB2dSQU/T4h7I5oX1wWL/G
	 W4fdbeaHH7YQTVd/9GCHMGMPFy/7k0Ng1TRrcrK5y+ntyJiIIsd8LtL3MSBvnPm8fN
	 /DmjV06DOVS5HTf7WlzKTudMvNoXmkEX0CY6fRYpJ/EQq3tv/YcvYfweRYucU1ydb2
	 H90TEVQCpGJYR9QtBzjfPaZw3d6Fi0Mv4XNk1CMrZuJj49ZlMvn9jSUZtB24xtymjV
	 /Xg9YTqPquX6maj2oC1TvsyNajJXhLLznvqK4472xY4oeQj33yD1X+txcudbuDg+um
	 Q+Y16YG/gWrYA==
Date: Wed, 17 Nov 2021 15:57:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, wei.chen@arm.com, iwj@xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH-4.16] arm/efi: Improve performance requesting filesystem
 handle
In-Reply-To: <9fbc1b5f-67e1-cf1d-0d03-463fd5de3209@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111171553380.1412361@ubuntu-linux-20-04-desktop>
References: <20211116150624.7720-1-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2111161235260.1412361@ubuntu-linux-20-04-desktop> <9fbc1b5f-67e1-cf1d-0d03-463fd5de3209@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Nov 2021, Julien Grall wrote:
> On 16/11/2021 20:38, Stefano Stabellini wrote:
> > On Tue, 16 Nov 2021, Luca Fancellu wrote:
> > So I think we can queue it in the Xen on ARM temporary for-next branch.
> 
> I have pushed it to for-next/4.17 on both my repo and gitlab (hopefully this
> triggered a CI run).

Thanks, and yes it triggered the following run:
https://gitlab.com/xen-project/fusa/xen-integration/-/pipelines/411093550

which passed.

FYI if you want a quick link to check the latest runs for
xen-integration, this is what I use:
https://gitlab.com/xen-project/fusa/xen-integration/-/pipelines

(I really prefer the pipeline view because it is too easy to get lost
with the full list of individual jobs.)

