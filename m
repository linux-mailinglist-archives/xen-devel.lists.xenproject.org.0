Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711058B9FFA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716097.1118164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2alT-000383-6W; Thu, 02 May 2024 18:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716097.1118164; Thu, 02 May 2024 18:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2alT-00036A-3U; Thu, 02 May 2024 18:02:39 +0000
Received: by outflank-mailman (input) for mailman id 716097;
 Thu, 02 May 2024 18:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2alR-000364-Rd
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:02:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26f126d0-08ae-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 20:02:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D50AD61A1D;
 Thu,  2 May 2024 18:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89341C113CC;
 Thu,  2 May 2024 18:02:31 +0000 (UTC)
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
X-Inumbo-ID: 26f126d0-08ae-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714672953;
	bh=/ZteNs6x9OubUJqG1B50uqZmMsB3ugNtVG566Vfz8sY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SVu7/9084mtuCkBHG7NyEZnlldSwDsUHWHJxe4sKxla7k1M4lKwB0EPZiJMOURKtd
	 iFeHG0+mb2q6U2ZMW2qp1JxqckPBzcX6h0l+iyp1uCf1foMqfNOmPuj+gvkeexoq5t
	 /V5+Tox5R+9v5oSqQ8sPH/HtdrGoVoC4zNNDVfZAH7uYq1+Nkq0mu6LEj1QXPHUaWQ
	 DY6ij8f5hgdnO0nEyR3I0z6SnkbPhdBjGQ/yuhyFOQbxhtSRT/ReEHmPHZUrQmTXOb
	 VtGbJ1PN6uSp+qGg15/IBBKSQincxMlVB+O+Eu9yjk+gd/WxX7AHOM4HOMihxMQbaT
	 eT9ai3vYLUVuQ==
Date: Thu, 2 May 2024 11:02:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
In-Reply-To: <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405021101200.624854@ubuntu-linux-20-04-desktop>
References: <20240424033449.168398-1-xin.wang2@amd.com> <20240424033449.168398-8-xin.wang2@amd.com> <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com> <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com> <128c7e68-0431-44e9-b4fc-96cc46e158ad@xen.org>
 <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-878510409-1714672954=:624854"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-878510409-1714672954=:624854
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 30 Apr 2024, Henry Wang wrote:
> Hi Julien,
> 
> On 4/30/2024 1:34 AM, Julien Grall wrote:
> > On 29/04/2024 04:36, Henry Wang wrote:
> > > Hi Jan, Julien, Stefano,
> > 
> > Hi Henry,
> > 
> > > On 4/24/2024 2:05 PM, Jan Beulich wrote:
> > > > On 24.04.2024 05:34, Henry Wang wrote:
> > > > > --- a/xen/include/public/sysctl.h
> > > > > +++ b/xen/include/public/sysctl.h
> > > > > @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
> > > > >   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> > > > >   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> > > > >       uint8_t overlay_op;                     /* IN: Add or remove. */
> > > > > -    uint8_t pad[3];                         /* IN: Must be zero. */
> > > > > +    bool domain_mapping;                    /* IN: True of False. */
> > > > > +    uint8_t pad[2];                         /* IN: Must be zero. */
> > > > > +    uint32_t domain_id;
> > > > >   };
> > > > If you merely re-purposed padding fields, all would be fine without
> > > > bumping the interface version. Yet you don't, albeit for an unclear
> > > > reason: Why uint32_t rather than domid_t? And on top of that - why a
> > > > separate boolean when you could use e.g. DOMID_INVALID to indicate
> > > > "no domain mapping"?
> > > 
> > > I think both of your suggestion make great sense. I will follow the
> > > suggestion in v2.
> > > 
> > > > That said - anything taking a domain ID is certainly suspicious in a
> > > > sysctl. Judging from the description you really mean this to be a
> > > > domctl. Anything else will require extra justification.
> > > 
> > > I also think a domctl is better. I had a look at the history of the
> > > already merged series, it looks like in the first version of merged part 1
> > > [1], the hypercall was implemented as the domctl in the beginning but
> > > later in v2 changed to sysctl. I think this makes sense as the scope of
> > > that time is just to make Xen aware of the device tree node via Xen device
> > > tree.
> > > 
> > > However this is now a problem for the current part where the scope (and
> > > the end goal) is extended to assign the added device to Linux Dom0/DomU
> > > via device tree overlays. I am not sure which way is better, should we
> > > repurposing the sysctl to domctl or maybe add another domctl (I am
> > > worrying about the duplication because basically we need the same sysctl
> > > functionality but now with a domid in it)? What do you think?
> > 
> > I am not entirely sure this is a good idea to try to add the device in Xen
> > and attach it to the guests at the same time. Imagine the following
> > situation:
> > 
> > 1) Add and attach devices
> > 2) The domain is rebooted
> > 3) Detach and remove devices
> > 
> > After step 2, you technically have a new domain. You could have also a case
> > where this is a completely different guest. So the flow would look a little
> > bit weird (you create the DT overlay with domain A but remove with domain
> > B).
> > 
> > So, at the moment, it feels like the add/attach (resp detech/remove)
> > operations should happen separately.
> > 
> > Can you clarify why you want to add devices to Xen and attach to a guest
> > within a single hypercall?
> 
> Sorry I don't know if there is any specific thoughts on the design of using a
> single hypercall to do both add devices to Xen device tree and assign the
> device to the guest. In fact seeing your above comments, I think separating
> these two functionality to two xl commands using separated hypercalls would
> indeed be a better idea. Thank you for the suggestion!
> 
> To make sure I understand correctly, would you mind confirming if below
> actions for v2 make sense to you? Thanks!
> - Only use the XEN_SYSCTL_DT_OVERLAY_{ADD, REMOVE} sysctls to add/remove
> overlay to Xen device tree
> - Introduce the xl dt-overlay attach <domid> command and respective domctls to
> do the device assignment for the overlay to domain.

I think two hypercalls is OK. The original idea was to have a single xl
command to do the operation for user convenience (even that is not a
hard requirement) but that can result easily in two hypercalls.
--8323329-878510409-1714672954=:624854--

