Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCA36481D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 18:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113105.215530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWe7-0004Bu-4c; Mon, 19 Apr 2021 16:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113105.215530; Mon, 19 Apr 2021 16:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWe7-0004BV-1N; Mon, 19 Apr 2021 16:21:11 +0000
Received: by outflank-mailman (input) for mailman id 113105;
 Mon, 19 Apr 2021 16:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lYWe4-0004BQ-Ob
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 16:21:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9db34f7d-4839-434d-89a0-16044daa4a19;
 Mon, 19 Apr 2021 16:21:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAF9361246;
 Mon, 19 Apr 2021 16:21:06 +0000 (UTC)
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
X-Inumbo-ID: 9db34f7d-4839-434d-89a0-16044daa4a19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618849267;
	bh=WI3RkHdr+OBEgjLchokCSMN8ZQnV3hwStpgM65Af574=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gOGs4cC0yJeXPqlvNYDgblnFl7FRIXwC3Z4MmvV01xgysRGWXF4mi0HpivgUh4EPw
	 04jMX1NipOnFy5LwZMcZZ0W34unH3M+mbnvFVau4KT4fQalb/b6cC2W2/mdpcW/va+
	 H9lwy1jCh4YAY98IsU5zUXPScNSkov6F86cpA0ah948gd9b1j16XZT7NexfaIrN3Qm
	 zAmotymzUfNfbzW4B/qcNTuVmCL/Pn13ZcO7uKjsufRxGAAd+OTvOygkqm+SSzmsT+
	 uUpII/UUvLeYEWnLPO8UJPhQambQegEybu/kIzLheNiIhM7htOIjsRdrVRR7W6Yeey
	 o38ig5Qtbc7wg==
Date: Mon, 19 Apr 2021 09:21:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
In-Reply-To: <279F74CA-647D-458B-97C0-968E1795E494@arm.com>
Message-ID: <alpine.DEB.2.21.2104190920160.4885@sstabellini-ThinkPad-T480s>
References: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com> <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org> <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com> <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org> <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org> <348C921E-1150-4247-A693-1D81933FC3F7@arm.com> <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org> <279F74CA-647D-458B-97C0-968E1795E494@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1474068950-1618849267=:4885"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1474068950-1618849267=:4885
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 Apr 2021, Rahul Singh wrote:
> Hi Julien,
> 
> > On 18 Apr 2021, at 6:48 pm, Julien Grall <julien@xen.org> wrote:
> > 
> > 
> > 
> > On 16/04/2021 17:41, Rahul Singh wrote:
> >> Hi Julien
> > 
> > Hi Rahul,
> > 
> >>> On 16 Apr 2021, at 5:08 pm, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> 
> >>> 
> >>> On 16/04/2021 17:05, Rahul Singh wrote:
> >>>>> On 16 Apr 2021, at 4:23 pm, Julien Grall <julien@xen.org> wrote:
> >>>>> 
> >>>>> 
> >>>>> 
> >>>>> On 16/04/2021 16:01, Rahul Singh wrote:
> >>>>>> Hi Julien,
> >>>>> 
> >>>>> Hi Rahul,
> >>>>> 
> >>>>>>> On 16 Apr 2021, at 3:35 pm, Julien Grall <julien@xen.org> wrote:
> >>>>>>> 
> >>>>>>> Hi,
> >>>>>>> 
> >>>>>>> On 16/04/2021 12:25, Rahul Singh wrote:
> >>>>>>>> Revert the code that associates the group pointer with the S2CR as this
> >>>>>>>> code causing an issue when the SMMU device has more than one master
> >>>>>>>> device.
> >>>>>>> 
> >>>>>>> It is not clear to me why this change was first added. Are we missing any feature when reverting it?
> >>>>>> This feature was added when we backported the code from Linux to fix the stream match conflict issue
> >>>>>> as part of commit "xen/arm: smmuv1: Intelligent SMR allocation”.
> >>>>>> This is an extra feature added to allocate IOMMU group based on stream-id. If two device has the
> >>>>>> same stream-id then we assign those devices to the same group.
> >>>>> 
> >>>>> If we revert the patch, then it would not be possible to use the SMMU if two devices use the same stream-id. Is that correct?
> >>>> No. If we revert the patch we can use the SMMU if two devices use the same stream-id without any issue but each device will be in a separate group.This is same behaviour before the code is merged.
> >>> 
> >>> Ok. So there is no change in behavior. Good. Can you propose a commit message clarifying that?
> >> Please have a look if it make sense.
> >> xen/arm: smmuv1: Revert associating the group pointer with the S2CR
> >> Revert the code that associates the group pointer with the S2CR as this
> >> code causing an issue when the SMMU device has more than one master
> >> device with same stream-id. This issue is introduced by the below commit:
> >> “0435784cc75dcfef3b5f59c29deb1dbb84265ddb:xen/arm: smmuv1: Intelligent SMR allocation”
> >>  Reverting the code will not impact to use of SMMU if two devices use the
> >> same stream-id but each device will be in a separate group. This is the same
> >> behaviour before the code is merged.
> > 
> > Look good to me. Is this patch to be applied on top of Stefano's series? If not, is there going to be more clash?
> > 
> 
> As per Stefano's mail he already tested his patch series on top of this patch. I think this patch has to merged before Stefano’s patch series 
> Let Stefano also confirm that.
> 
> I think there will be no more clashes.

Yes, this patch is to be committed *before* my series and I have already
tested this patch alone and with my series on top. Both cases work fine.
--8323329-1474068950-1618849267=:4885--

