Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01656A8D27
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 00:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505477.778287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXsYS-0000De-8g; Thu, 02 Mar 2023 23:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505477.778287; Thu, 02 Mar 2023 23:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXsYS-0000Bu-4Q; Thu, 02 Mar 2023 23:41:44 +0000
Received: by outflank-mailman (input) for mailman id 505477;
 Thu, 02 Mar 2023 23:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXsYQ-0000Bh-6S
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 23:41:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c793076b-b953-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 00:41:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AD9FB815BD;
 Thu,  2 Mar 2023 23:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49695C433EF;
 Thu,  2 Mar 2023 23:41:37 +0000 (UTC)
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
X-Inumbo-ID: c793076b-b953-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677800498;
	bh=tICNt+q9KXZ2OIugH3VT/dAcX/kAn2T75eWiwJuY8w4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UR1trgwtE9tE0rAgKwS0jquRfV85xKTdt9G6g20T42VMkjNjdRf591jNisA6lCCUO
	 ugYoUDyyUoMU2jZAZG6bzJbs98fd312NvDjjFvCg+7NNLSCrTIHiZg5vcePXmE78jt
	 D0W0LkWz0vuaK6476nGiSKn8rt2rms7qeNCxtcemidFrzYkC5rdv7EHCOe09WhL/ic
	 1YKYYHr5sImejlMVIZJGNYgtP7LCN7Ul43cxiZIWyy0HzgSi58whbffSuOf3yrsYCJ
	 bdn6/NCXblFM1y3VDdwAfdquQWlQYjLe4HEITHANtQdhaECIYCYMEbC7J1PTOoHFDX
	 7Wqc2wBfXyCxQ==
Date: Thu, 2 Mar 2023 15:41:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: "jiamei.xie" <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for
 static heap
In-Reply-To: <f480d3c5-e18a-7863-b2a0-9ba95f7e678b@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303021541090.863724@ubuntu-linux-20-04-desktop>
References: <20230302044606.136130-1-jiamei.xie@arm.com> <20230302044606.136130-2-jiamei.xie@arm.com> <f480d3c5-e18a-7863-b2a0-9ba95f7e678b@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2023, Michal Orzel wrote:
> Hi Jiamei,
> 
> Patch looks good apart from minor comments down below.

Just wanted to add that the patch looks OK to me too and don't have any
further comments beyond the ones Michal's already made


> On 02/03/2023 05:46, jiamei.xie wrote:
> > 
> > 
> > From: jiamei Xie <jiamei.xie@arm.com>
> > 
> > Add a new config parameter to configure static heap.
> > STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> > if specified, indicates the host physical address regions
> > [baseaddr, baseaddr + size) to be reserved as static heap.
> > 
> > For instance, STATIC_HEAP="0x50000000 0x30000000", if specified,
> > indicates the host memory region starting from paddr 0x50000000
> > with a size of 0x30000000 to be reserved as static heap.
> > 
> > Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
> > ---
> >  README.md                |  4 ++++
> >  scripts/uboot-script-gen | 20 ++++++++++++++++++++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/README.md b/README.md
> > index 814a004..787f413 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -256,6 +256,10 @@ Where:
> > 
> >  - NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
> > 
> > +- STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> > +  if specified, indicates the host physical address regions
> > +  [baseaddr, baseaddr + size) to be reserved as static heap.
> As this option impacts Xen and not domUs, please call it XEN_STATIC_HEAP and move
> it right after XEN_CMD documentation.
> 
> > +
> >  Then you can invoke uboot-script-gen as follows:
> > 
> >  ```
> > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > index f07e334..4775293 100755
> > --- a/scripts/uboot-script-gen
> > +++ b/scripts/uboot-script-gen
> > @@ -189,6 +189,21 @@ function add_device_tree_static_mem()
> >      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
> >  }
> > 
> > +function add_device_tree_static_heap()
> > +{
> > +    local path=$1
> > +    local regions=$2
> > +    local cells=()
> > +    local val
> > +
> > +    for val in ${regions[@]}
> > +    do
> > +        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
> Please use split_value function instead of opencoding it.
> It will then become:
> cells+=("$(split_value $val)")
> 
> ~Michal
> 

