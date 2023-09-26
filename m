Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF337AEB1F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 13:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608405.946871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql607-0002rh-PY; Tue, 26 Sep 2023 11:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608405.946871; Tue, 26 Sep 2023 11:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql607-0002pQ-Mt; Tue, 26 Sep 2023 11:13:11 +0000
Received: by outflank-mailman (input) for mailman id 608405;
 Tue, 26 Sep 2023 11:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PA3Q=FK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1ql606-0002pK-Ai
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 11:13:10 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abed1d82-5c5d-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 13:13:09 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c61bde0b4bso32123155ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 04:13:08 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.34])
 by smtp.gmail.com with ESMTPSA id
 ju18-20020a170903429200b001b89536974bsm3923816plb.202.2023.09.26.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 04:13:06 -0700 (PDT)
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
X-Inumbo-ID: abed1d82-5c5d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695726787; x=1696331587; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oEwJeD1rxPjSlNlpKh4wSmhAj6u5KqyizWcE7yh2BW0=;
        b=m2rJNZqwONEBKFwCCmw5GfsEkPzuQ2N5pBHjJ1cXFwpm5oNHXxgoJ4QLJ9/kWb6Xr6
         sFQevX91S+mrchqWwHfzBSvKFwVbKjY5AHmdXZM62SHgqT2TSsJXCGnReZ4+l7nO2e8l
         RTPcDJ+46YJBLv62cRfDzfo2L43ukvwFuxORNwQqfHJjn1TYoufVmFOlcjMmvPzL6mSc
         iP65fblF1K9J9T8f62yTAj8MV0yr0TLNgCytk+f2Q9a4DEzcUVvcGS3Y1ExyN1VWaCnq
         RYfZ8SWOkfMhrJGX6fhzf+NYHxzYwVOiW+aD7zyVgbIRGIefVLOv8ayAjHnAmAiFUoqd
         OaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695726787; x=1696331587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEwJeD1rxPjSlNlpKh4wSmhAj6u5KqyizWcE7yh2BW0=;
        b=wjfXciNKJPSx8WbxWM1nbtCS7osRCdD7WC7wxN73RjY77Dvdf3e0LD71/qASW5LDZb
         PcNQCI+0v8YfrJpojROjygC/JNTScgnRCjfx9A3SzF3YQnUy1hcs5oJ9Q7DmOYPSwyKo
         fBrtSqWLqDM1k1BfpR/7QgkIGeXUPb+lMqRCv51q030HlMGwCkrJnXkUMyu7C3mpDej8
         87ane9O3ZUEnXSb2zXi3DFDDt6stC+NbdOUt+/57cJdYnfnmQtMl2i97s2CqBTWumV0T
         EwWq++hnHiqFAmCUEGKUYzW860OrCRiW1BHp9Wv20xr7cZMuWIxkBCn523bQBg+xh4tA
         lZCw==
X-Gm-Message-State: AOJu0Yw/8lo/DgAPYMHn8wVivpaee5gUxyAk0TiouOAx9qRfYXmIjGfZ
	fSkFikz3m5E9dqv4ij8H/GoKNA==
X-Google-Smtp-Source: AGHT+IG3weiNcYT4GDoFH2KfHTm0Xh3g7+UsHn5XyzffC3rJq16hmKQnD0L75XBg/l8qnlCTpaiI3g==
X-Received: by 2002:a17:902:704c:b0:1bd:bbc3:c87b with SMTP id h12-20020a170902704c00b001bdbbc3c87bmr7594000plt.41.1695726787438;
        Tue, 26 Sep 2023 04:13:07 -0700 (PDT)
Date: Tue, 26 Sep 2023 19:13:02 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Message-ID: <20230926111302.GB11115@leoy-yangtze.lan>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>

Hi Michal,

On Tue, Sep 26, 2023 at 10:36:04AM +0200, Michal Orzel wrote:

[...]

> > Essentially, this issue is caused by the Xen hypervisor which misses to
> > handle the status for the memory nodes (for both the normal memory nodes
> > and the reserved memory nodes) and transfers them to the Linux kernel.
> > 
> > This patch introduces a function memory_node_is_available(). If it
> > detects a memory node is not enabled, the hypervisor will not add the
> > memory region into the memory lists. In the end, this avoids to generate
> > the memory nodes from the memory lists sent to the kernel and the kernel
> > cannot use the disabled memory nodes any longer.
> 
> Interesting. So FWICS, we have 2 issues that have a common ground:
>
> 1) If the reserved memory node has a status "disabled", it implies that this region
> is no longer reserved and can be used which is not handled today by Xen and leads
> to the above mentioned problem.

Correct.

> 2) If the memory node has a status "disabled" it implies that it should not be used
> which is not the case in current Xen. This means that at the moment, Xen would try
> to use such a memory region which is incorrect.

Exactly.

> I think the commit msg should be more generic and focus on these two issues.
> Summary:
> Xen does not handle the status property of memory nodes and ends up using them.
> Xen does not handle the status property of reserved memory nodes. If status is disabled
> it means the reserved region shall no longer be treated as reserved. Xen passes the reserved
> memory nodes untouched to dom0 fdt and creates a memory node to cover reserved regions.
> Disabled reserved memory nodes are ignored by the guest which leaves us with the exposed
> memory nodes. Guest can access such a region but it is excluded from the page management in Xen
> which results in Xen being unable to obtain the corresponding MFN.

Yes, thanks a lot for good summary!

In theory, a good practice should use two separate patches to fix two
issues respectively. Given we can use simple change to fix these two
issues in one patch, I will amend the patch's commit log with your
summary for better recording these issues.

> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > index 2673ad17a1..b46dde06a9 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -206,11 +206,27 @@ int __init device_tree_for_each_node(const void *fdt, int node,
> >      return 0;
> >  }
> > 
> > +static bool __init memory_node_is_available(const void *fdt, unsigned long node)
>
> This function is not strictly related to memory node so it would be better to call it e.g. device_tree_node_is_available.
> This way it can be used in the future for other nodes if needed. Also, I would move it somewhere near the top of the file
> next to other helpers.

Will do.

> Also, node should be of type 'int'

Will fix.

> > +{
> > +    const char *status = fdt_getprop(fdt, node, "status", NULL);
> > +
> > +    if (!status)
> white spaces between brackets and condition
> if ( !status )

Will fix.

> > +        return true;
> > +
> > +    if (!strcmp(status, "ok") || !strcmp(status, "okay"))
> white spaces between brackets and condition
> if ( !strcmp(status, "ok") || !strcmp(status, "okay") )

Will fix.

> > +        return true;
> > +
> > +    return false;
> > +}
> > +
> >  static int __init process_memory_node(const void *fdt, int node,
> >                                        const char *name, int depth,
> >                                        u32 address_cells, u32 size_cells,
> >                                        void *data)
> >  {
> > +    if (!memory_node_is_available(fdt, node))
> > +        return 0;
>
> I would move this check to device_tree_get_meminfo()

Okay, I will do it.

> > +
> >      return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
> >                                     data, MEMBANK_DEFAULT);
> >  }
> > --
> > 2.39.2
> > 
> > 
> 
> Also, I think it would be nice to add ASSERT(bootinfo.mem.nr_banks); e.g. in boot_fdt_info().
> Otherwise the panic from Xen when there is no memory bank:
> The frametable cannot cover the physical region ...
> is not really meaningful for normal users.

I'd like to use a separate patch to validate the memory banks.
> 
> This is just my suggestion (@Julien ?)

Thank you a lot for review.

Leo

