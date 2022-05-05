Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B851CA90
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 22:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322384.543664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi4u-00024p-1D; Thu, 05 May 2022 20:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322384.543664; Thu, 05 May 2022 20:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi4t-00022g-UI; Thu, 05 May 2022 20:27:59 +0000
Received: by outflank-mailman (input) for mailman id 322384;
 Thu, 05 May 2022 20:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmi4s-00022U-DS
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:27:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d92095b2-ccb1-11ec-a406-831a346695d4;
 Thu, 05 May 2022 22:27:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 376A161EDD;
 Thu,  5 May 2022 20:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DEFC385A8;
 Thu,  5 May 2022 20:27:54 +0000 (UTC)
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
X-Inumbo-ID: d92095b2-ccb1-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651782475;
	bh=18u9jwbvpZ9hsPowDF62MYRvrao/q6fzZrVBaERoLnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l9UG74LFNCb7114sUqTlgnr42rzVJxuTrmoxIS2wVWEu6pAQDomM23m11SyXx91II
	 vff91T56Oew4OoqrFZTwXXCRTEjS4JvSwWBXFvN31HQB6r5xejCPTrSRunemoM9q7A
	 IghvpySFfHCKX7256H490YVJO5WM6bG9oraner24+poRa0WOcwOnaVZ+7Ua2RfuWLV
	 ziPkc5cKWuJiTIEL1NAB1p52yFIXB+FgAG1wvQfetSnekvr0NoV3kHROpL2r+mbY4X
	 6FT2mzdO0Q7CWoakeNstXFwa/eAG7Gmu+WQoSEr+uyz83wKSoFsdlvqLUIkjsmqIFc
	 1Sg1nULfIaHMQ==
Date: Thu, 5 May 2022 13:27:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 2/2] xen: add support for initializing xenstore later
 as HVM domain
In-Reply-To: <5f7e5a83-0944-8464-564a-51d7a4d19c55@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205051327390.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop> <20220505002304.401417-2-sstabellini@kernel.org> <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com> <b19b0e49-d89b-7f94-0206-e85909fdc149@suse.com>
 <5f7e5a83-0944-8464-564a-51d7a4d19c55@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-763135260-1651782475=:43560"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-763135260-1651782475=:43560
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 May 2022, Michal Orzel wrote:
> On 05.05.2022 14:29, Juergen Gross wrote:
> >>> -        /* Avoid truncation on 32-bit. */
> >>> +        if (v == ~0ULL) {
> >> No need for brackets for a single instruction.
> > 
> > The coding style says otherwise:
> > 
> >   This does not apply if only one branch of a conditional statement is a single
> >   statement; in the latter case use braces in both branches:
> > 
> >   .. code-block:: c
> > 
> >         if (condition) {
> >                 do_this();
> >                 do_that();
> >         } else {
> >                 otherwise();
> >         }
> > 
> > 
> Good to know. So Luca, you can omit this comment.

Thanks Michal, I addressed the other two comments.
--8323329-763135260-1651782475=:43560--

