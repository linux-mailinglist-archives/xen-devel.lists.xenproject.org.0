Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2D675A87
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 17:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482009.747293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIueF-0007gP-Jh; Fri, 20 Jan 2023 16:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482009.747293; Fri, 20 Jan 2023 16:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIueF-0007e6-GV; Fri, 20 Jan 2023 16:53:51 +0000
Received: by outflank-mailman (input) for mailman id 482009;
 Fri, 20 Jan 2023 16:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIueE-0007e0-AF
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 16:53:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0147c130-98e3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 17:53:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B45B61FC5;
 Fri, 20 Jan 2023 16:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8147C433EF;
 Fri, 20 Jan 2023 16:53:44 +0000 (UTC)
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
X-Inumbo-ID: 0147c130-98e3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674233626;
	bh=/ZTGcC6OrH01JRw2wdYJEThHDa4K6dER1no9buA1bHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r+Cb/yQr9nPdDs/nby1frdhjelxc1pMnMn9JEHxlbbJIuFF0ATbfpGf0Pt5NmO/zZ
	 4JQFFP99pet7ooHmr6sQ4Fk4yhqFrb8faim5JKP2lk7VtnJ9gJTF1DGbgN588ZgH0G
	 VKVsfBcEtaJ41ccv2wlx2Ac5n2y4M1no/14VcM80cKH2j3yw+QAV1Lx2ykHzdBljNU
	 uL1+dcfmNY6VN95KrWxztv4He0LjXYdjV4RfHeoySatOgwAnSHMaclK9nELzRbp0C1
	 2yw/adVBSEyyFZseyxOwDhJXOA5otF5zfjO4T124DW/PgPLHyBmw+6lexxsMq+2XA7
	 z+XqJX25sD7VA==
Date: Fri, 20 Jan 2023 08:53:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v2 10/11] xen/arm: Restrict zeroeth_table_offset for
 ARM_64
In-Reply-To: <6743ca84-e54e-23be-575f-899a8770d523@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301200853330.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-11-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2301191553570.731018@ubuntu-linux-20-04-desktop> <6743ca84-e54e-23be-575f-899a8770d523@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jan 2023, Julien Grall wrote:
> > >   #define zeroeth_table_offset(va)
> > > TABLE_OFFSET(zeroeth_linear_offset(va))
> > > +#else
> > > +#define zeroeth_table_offset(va)  0
> > 
> > Rather than 0 it might be better to have 32, hence zeroing the input
> > address
> I don't understand why you suggest 32. The macro is meant to return the index
> in the 0th table. So return 0 is correct here.

This suggestion was a mistake, 0 is fine.

