Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD34567A9C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 01:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361685.591338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rqw-0005vk-Q4; Tue, 05 Jul 2022 23:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361685.591338; Tue, 05 Jul 2022 23:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rqw-0005sw-My; Tue, 05 Jul 2022 23:21:10 +0000
Received: by outflank-mailman (input) for mailman id 361685;
 Tue, 05 Jul 2022 23:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIdu=XK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o8rqw-0005sq-1R
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 23:21:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ca9a02-fcb9-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 01:21:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B765561D7F;
 Tue,  5 Jul 2022 23:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEBEC341C7;
 Tue,  5 Jul 2022 23:21:05 +0000 (UTC)
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
X-Inumbo-ID: 25ca9a02-fcb9-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657063266;
	bh=ihfTApSWQHrFN+uuv6Fc17WWuJi4GyHi8okPvF2awvQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rh8n3OiAYCZ4BP5sLuyEuzJU3bzrZ56jtQhQVNf7RTboqKZBLgcwk0BMdQy43li8+
	 L6Ld6OlKGaPchSOOMLQba8tSOv3UUXlAaXTy+Tsi//PAGXRfjc5l/6/8QVTU8rrjnQ
	 tn5bv5/u8Ag+zXFK75Q6qZMR1TdvefPOUdovUz962hT6MrB0ylcPDf14tlOtgMyifk
	 G9lylUDA8xkR87lwJXLxskebwWooeGlo6CvQL0A8p9ZuBOXnwaHUfPBZEVvy7gEFFE
	 S54izoLknXf8tP7moiAa+AaT32Pq2iquHXdXRiq7FTtxtDficEWlt099fPeiKmqIuS
	 kKGGWuxbmD/HQ==
Date: Tue, 5 Jul 2022 16:21:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <721ef265-7b3f-80cc-3d26-bd88b9971d26@xen.org>
Message-ID: <alpine.DEB.2.22.394.2207051617280.2354836@ubuntu-linux-20-04-desktop>
References: <20220620051114.210118-1-Penny.Zheng@arm.com> <20220620051114.210118-8-Penny.Zheng@arm.com> <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org> <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com> <721ef265-7b3f-80cc-3d26-bd88b9971d26@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Jul 2022, Julien Grall wrote:
> On 04/07/2022 08:45, Penny Zheng wrote:
> > Hi Stefano and Julien
> 
> Hi Penny,
> 
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> > > > 
> > > > Looking at the Linux binding, "xen,id" is meant to be a string. But
> > > > here you are writing it as an integer.
> > > 
> > > Good catch!
> > > 
> > > 
> > > > Given that the Linux binding is already merged, I think the Xen
> > > > binding should be changed.
> > > 
> > > We would be compliant with both bindings (xen and linux) just by writing
> > > shm_id as string here, but if it is not too difficult we might as well
> > > harmonize
> > > the two bindings and also define xen,shm-id as a string.
> > > 
> > > On the Xen side, I would suggest to put a clear size limit so that the
> > > string is
> > > easier to handle.
> > 
> > I've already made the xen,shm-id parsed as a string too, seeing the below
> > code:
> > "
> >      prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
> >      if ( !prop_id )
> >          return -ENOENT;
> >      shm_id = simple_strtoul(prop_id->data, NULL, 10);
> 
> Why do you want to convert the string to a number?
> 
> 
> >      if ( shm_id >= NR_MEM_BANKS )
> 
> IIRC, you are not using "shm_id" to index any bank. So why do you want to
> check against NR_MEM_BANKS?
> 
> >      {
> >          printk("fdt: invalid `xen,shm-id` %lu for static shared memory
> > node.\n",
> >                 shm_id);
> >          return -EINVAL;
> >      }
> > "
> > The size limit is smaller than 256, just as stated in doc:
> > "
> > - xen,shm-id
> > 
> >      A string that represents the unique identifier of the shared memory
> >      region. The maximum identifier shall be "xen,shm-id = 255".
> 
> The first sentence reads as the xen,shm-id can a free form string. But then
> the second sentence suggests a number (not a string).
> 
> In any case, it is still unclear why you want to convert the string to an ID.
> From my understanding, Stefano was suggested a limit on the characters rather
> than a limit on the number.

Just confirming that yes, I was suggesting a strict limit on the number
of characters, assuming we accept a freeform string.

I think a freeform string is more convenient and flexible for the user.
But it is not required: our only requirement is that the Linux device
tree Xen generates has "xen,id" in the form of a string, but that could
be a string representing a number, e.g. "255".


> If the latter is desirable, then the documentation should be a bit clearer and
> you need to validate the input provided by the user.

