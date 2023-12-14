Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCC8124E8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 03:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654275.1020998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb6E-0007f0-W1; Thu, 14 Dec 2023 02:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654275.1020998; Thu, 14 Dec 2023 02:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb6E-0007cF-Sp; Thu, 14 Dec 2023 02:05:18 +0000
Received: by outflank-mailman (input) for mailman id 654275;
 Thu, 14 Dec 2023 02:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDb6D-0007c7-PD
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 02:05:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37bd9f2d-9a25-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 03:05:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 327A3CE2223;
 Thu, 14 Dec 2023 02:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E8EC433C8;
 Thu, 14 Dec 2023 02:05:09 +0000 (UTC)
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
X-Inumbo-ID: 37bd9f2d-9a25-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702519511;
	bh=x0klhS8WaEHpzPlcz8EuF+4DGqTRpAbaamDlZDSXqHU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uMMP4n13YecW0IjMfPCTSQQFyhCitL8HsSWjDRQxxzo/mTpJzOgAqiJlf7Q/qtE6C
	 F0J4mqIUwBGJHesN+mIv6tTY1kVLrjPxemMQnRJQV/HBsDqKgcnWgGtY0tfE29hw72
	 S2ZVXlDvEap+GcdrAsCod5Lwx0mVzVDlYVkFc6d7+8RFt7qLyHHsQsEdwt2i/1GXVG
	 KcdaPnJxj69uLQ/FSIZ28XG8F4R89OLE/D2AbhffLEIi5mOwyrPEdWWx7bCV9+gDXC
	 IU75zo8LR/f7GhkpND7O8Aqie5tDGD6c1OjR0/OCruIKjqlHER939qp1ixieta/Z+S
	 VKwoiPwLA+u3Q==
Date: Wed, 13 Dec 2023 18:05:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com> <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com> <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Dec 2023, Jan Beulich wrote:
> On 11.12.2023 10:14, Nicola Vetrini wrote:
> > --- a/xen/arch/arm/include/asm/numa.h
> > +++ b/xen/arch/arm/include/asm/numa.h
> > @@ -2,8 +2,9 @@
> >  #define __ARCH_ARM_NUMA_H
> >  
> >  #include <xen/mm.h>
> 
> With this, ...
> 
> > +#include <xen/types.h>
> >  
> > -typedef u8 nodeid_t;
> > +typedef uint8_t nodeid_t;
> >  
> >  #ifndef CONFIG_NUMA
> >  
> > @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
> >  #define node_to_cpumask(node)   (cpu_online_map)
> >  
> >  /*
> > - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> > - * is required because the dummy helpers are using it.
> > + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
> > + * this is required because the dummy helpers are using it.
> >   */
> > -extern mfn_t first_valid_mfn;
> 
> ... and this declaration moved to xen/mm.h, how is it going to be possible
> to do as the adjusted comment says? The compiler will choke on the static
> after having seen the extern.

Hi Jan,

Nicola was just following a review comment by Julien. NUMA has been
pending for a while and I wouldn't hold this patch back because of it.
I suggest we go with Julien's request (this version of the patch).

If you feel strongly about it, please suggest an alternative.


> I also firmly disagree with the entirely unrelated u8 -> uint8_t change
> above. Such tidying can be done when somewhat related to what a patch is
> doing anyway, but here there's (imo) not even a vague connection.

Can be removed on commit

