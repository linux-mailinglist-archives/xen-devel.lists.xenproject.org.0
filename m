Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C12736BA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 01:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKVQy-0001hm-MK; Mon, 21 Sep 2020 23:41:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kKVQw-0001hd-ST
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 23:41:22 +0000
X-Inumbo-ID: fbd6be35-e3c4-42b0-8e31-1cde705125ac
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbd6be35-e3c4-42b0-8e31-1cde705125ac;
 Mon, 21 Sep 2020 23:41:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FF9523A60;
 Mon, 21 Sep 2020 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600731681;
 bh=/K7mQRZ0z9hOnnZb6MNZe7FvMtQe7QGFYqdcYaaxJXQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xxZQAvC5vNJQnyyGZcyLlrFlWSwkZLzBRNvYDa/8CsL18y9kMsz0OMOrftDDOPzcQ
 LBgtK46HrOgnI6/RrbmJbvrFOdWC6uMXfE5WttWUPxcLFpEPKys9UaKahTdWtdAHvR
 WlePqc+oNJcqmIOJUTn156CD4RrFT4xvAJpT3kCU=
Date: Mon, 21 Sep 2020 16:41:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Julien Grall <jgrall@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
Subject: Re: [PATCH] xen/arm: bootfdt: Ignore empty memory bank
In-Reply-To: <0AAD50BD-D247-4909-84E2-BB8D39089F0D@arm.com>
Message-ID: <alpine.DEB.2.21.2009211641020.1495@sstabellini-ThinkPad-T480s>
References: <20200918171116.29005-1-julien@xen.org>
 <0AAD50BD-D247-4909-84E2-BB8D39089F0D@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 21 Sep 2020, Bertrand Marquis wrote:
> > On 18 Sep 2020, at 18:11, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > At the moment, Xen will stop processing the Device Tree if a memory
> > bank is empty (size == 0).
> > 
> > Unfortunately, some of the Device Tree (such as on Colibri imx8qxp)
> > may contain such a bank. This means Xen will not be able to boot
> > properly.
> > 
> > Relax the check to just ignore the banks. FWIW this also seems to be the
> > behavior adopted by Linux.
> > 
> > Reported-by: Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > xen/arch/arm/bootfdt.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > index 08fb59f4e7a9..dcff512648a0 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -163,8 +163,9 @@ static int __init process_memory_node(const void *fdt, int node,
> >     for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> >     {
> >         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> > +        /* Some DT may describe empty bank, ignore them */
> >         if ( !size )
> > -            return -EINVAL;
> > +            continue;
> >         mem->bank[mem->nr_banks].start = start;
> >         mem->bank[mem->nr_banks].size = size;
> >         mem->nr_banks++;
> > -- 
> > 2.17.1
> > 
> > 
> 

