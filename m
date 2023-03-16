Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BCC6BC264
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 01:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510270.787620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbOa-0001IS-6W; Thu, 16 Mar 2023 00:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510270.787620; Thu, 16 Mar 2023 00:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbOa-0001G5-3C; Thu, 16 Mar 2023 00:23:04 +0000
Received: by outflank-mailman (input) for mailman id 510270;
 Thu, 16 Mar 2023 00:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcbOY-0001Fz-Eu
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 00:23:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f1e53d-c390-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 01:22:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 475B461EDB;
 Thu, 16 Mar 2023 00:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB36C433D2;
 Thu, 16 Mar 2023 00:22:54 +0000 (UTC)
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
X-Inumbo-ID: b3f1e53d-c390-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678926176;
	bh=mdjnrNokCY8JtbyIxzs9EgXqv3UGeewhbf2Za9U5xGc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iXc7Bb5M9S5+Ha8NDe7Df9+IO3eeECcO6ZiL/XtlUq3yBDs1URE0CJEJduq2uqemt
	 zKb3DgenHrXgzTqE1pCPt7mnY6bgJ0v4qRR4maxYxltLO0vz698EATyCeoY309W92I
	 2ZFtMYRrbt0RScUWUlYbAiZz9ZjHBiz2AL9VxtusiWLqc4UrYSLBJ8TU6jBn0HBt/F
	 e/K7e8a+QsiIu+lwifPSTxIHkRNrYdaVsHFMqrpbHVE5aQMgbANNqNRVn7lFGH5VkX
	 NxQINpM/YVLg8xHUREjA8ikFeX0ip62dupebJPLmuDz/pTWabp2V+ruRkhkQLRX5zC
	 7ygH6hqr+9Jag==
Date: Wed, 15 Mar 2023 17:22:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Huang Rui <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map
 pirq in PVH
In-Reply-To: <ZBHq+UeK/lBj3s8l@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2303151722040.3462@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-4-ray.huang@amd.com> <ZBHq+UeK/lBj3s8l@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-589186721-1678926176=:3462"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-589186721-1678926176=:3462
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Mar 2023, Roger Pau Monné wrote:
> On Sun, Mar 12, 2023 at 03:54:52PM +0800, Huang Rui wrote:
> > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > 
> > PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
> > flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
> > will fail at check has_pirq();
> > 
> > Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >  xen/arch/x86/hvm/hypercall.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> > index 405d0a95af..16a2f5c0b3 100644
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >      case PHYSDEVOP_eoi:
> >      case PHYSDEVOP_irq_status_query:
> >      case PHYSDEVOP_get_free_pirq:
> > -        if ( !has_pirq(currd) )
> > -            return -ENOSYS;
> 
> Since I've taken a look at the Linux side of this, it seems like you
> need PHYSDEVOP_map_pirq and PHYSDEVOP_setup_gsi, but the later is not
> in this list because has never been available to HVM type guests.
> 
> I would like to better understand the usage by PVH dom0 for GSI
> passthrough before deciding on what to do here.  IIRC QEMU also uses
> PHYSDEVOP_{un,}map_pirq in order to allocate MSI(-X) interrupts.

I'll let Ray reply here, but I think you are right:
HYSDEVOP_{un,}map_pirq are needed so that QEMU can run in PVH Dom0 to
support HVM guests.
--8323329-589186721-1678926176=:3462--

