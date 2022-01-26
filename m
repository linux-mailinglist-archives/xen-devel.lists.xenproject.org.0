Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50A49D238
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 20:05:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261076.451667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnbC-0005K3-1I; Wed, 26 Jan 2022 19:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261076.451667; Wed, 26 Jan 2022 19:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnbB-0005Hl-U6; Wed, 26 Jan 2022 19:04:53 +0000
Received: by outflank-mailman (input) for mailman id 261076;
 Wed, 26 Jan 2022 19:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCnbA-0005Hf-3X
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 19:04:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d666e4bc-7eda-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 20:04:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41D5FB81FBD;
 Wed, 26 Jan 2022 19:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A58C340E3;
 Wed, 26 Jan 2022 19:04:48 +0000 (UTC)
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
X-Inumbo-ID: d666e4bc-7eda-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643223889;
	bh=AbCp5mwrBDR9VHhaIdzIZliqrhYy6rOnnklzhxgxMws=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O6XrI+aT7Umrb2OfavxYnWtOo70D4J6lcGjFMqk8Vp5+AV3O9xfhJEpmlsv6TciHY
	 Zx9huJMp5FKHJd3iqJNrJanPTbI7s3z342UZNTJbQ0h7mMrVanZl6gRNHLUz9AgQtd
	 RrDx6w7QKR3rTnK4QUnwqFpCCVjwM38ApMyAWIumXNCSIFvFKijEY+EmU76+tn+lO0
	 fCPD8TrtmqmfDiRi+Q/y74zf/J37KmNG2GscVpnAThSkj29IxpXo++aUoqNVasxpQE
	 2Hwd/cG0YMEcR0g6814HMbov1XDTPifHaai1S5ZHZejvrnn50moxht8FbJMDwekgeS
	 SV/x3C8PjHg0A==
Date: Wed, 26 Jan 2022 11:04:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, jbeulich@suse.com, 
    wei.chen@arm.com
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing
 instructions
In-Reply-To: <eebecd4f-1656-7488-b35c-d4778e9788c5@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2201261104290.27308@ubuntu-linux-20-04-desktop>
References: <20220125211808.23810-1-ayankuma@xilinx.com> <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org> <eebecd4f-1656-7488-b35c-d4778e9788c5@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jan 2022, Ayan Kumar Halder wrote:
> > Furthermore, decode.c should only contain code to update the syndrome and in
> > theory Arm could decide to provide an valid syndrome in future revision. So
> > I would move this code in io.c (or maybe traps.c).
> @Stefano/Julien - Can we all agree on traps.c ?

Fine by me

