Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F090F0B5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 16:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743855.1150855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJwNK-0003cx-Ga; Wed, 19 Jun 2024 14:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743855.1150855; Wed, 19 Jun 2024 14:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJwNK-0003a9-Dh; Wed, 19 Jun 2024 14:33:26 +0000
Received: by outflank-mailman (input) for mailman id 743855;
 Wed, 19 Jun 2024 14:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMzu=NV=bounce.vates.tech=bounce-md_30504962.6672ec31.v1-db5fcd6941aa43b2ac53c0d0b3e3427f@srs-se1.protection.inumbo.net>)
 id 1sJwNJ-0003Zi-41
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 14:33:25 +0000
Received: from mail187-11.suw11.mandrillapp.com
 (mail187-11.suw11.mandrillapp.com [198.2.187.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e197545d-2e48-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 16:33:23 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-11.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W45hK710SzLfHHmf
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 14:33:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 db5fcd6941aa43b2ac53c0d0b3e3427f; Wed, 19 Jun 2024 14:33:21 +0000
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
X-Inumbo-ID: e197545d-2e48-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718807602; x=1719068102;
	bh=dhkIawe/P1gt74JqwmytP5ttHEZSPuBPJ9PBNk5H03E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=axTUdQ0IP/1hAyNT/eSXYTwYMckNXZRwBzc044DtL56XKUHNcpliOWSp5Xm6E5qlB
	 QYiYHzqjGxcIfwrlzbbzlPVa20j+QEYTp/ggCHyL9n17QN7sg43B1PZIpm5TmKW/qG
	 +hjNaMcmaaIis3i8VialnYSUmQyqmC4nBGuqzP3tDf8TteLJKGcr0zbLWMHrTiZqDO
	 ahbWhjxwH112V84epMaFOKP5QStHr7K1m1GzPcqB3Lj5N6DRmI4RT9eC22NWD/KNzA
	 68/IMlxKPc2vK77st2FmHupqzoUYX7i5MAIVUxe887mtLb6pRw7lIP7216v5E6d3YD
	 yJV8nABZgrp2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718807602; x=1719068102; i=anthony.perard@vates.tech;
	bh=dhkIawe/P1gt74JqwmytP5ttHEZSPuBPJ9PBNk5H03E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZNe8OFMfBKO4L3/gmD9sXRiEr3BUYl35tjAg8lD08H0pWnRsz7OqyrsGaPSeUyQ5m
	 /I5hfivaxPSh/ZFs3h/v9Vk0AJ3dzV8O7FRef/xLYSCoaApi3MOxSxIdOx8wpnD8JO
	 2XF+5v+iFktBEauHXl3HKfzwrsc8JlZ7H8kGO6a/Tz2b2Bw5f7w+Yf8be23YEeqGcM
	 LJBHjXGz+zgvdN5ZLNEBWECf9Lk3mhpXwFx9E871vKpu8LLgP4lkyzN/hb4On5YLlC
	 F+xT9YbWC7U3dP31sli/Yv1sYBCmimrw+vnka1TL1MUleXkLxetWUdK6nV8jmjxUJf
	 Ve8tzA8Q3P69A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19]=20hotplug:=20Restore=20block-tap=20phy=20compatibility?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718807600709
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>, Jason Andryuk <jandryuk@gmail.com>
Message-Id: <ZnLsMOQ3zt4W855q@l14>
References: <20240516022212.5034-1-jandryuk@gmail.com> <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com> <9678073f-82d5-4402-b5a0-e24985c1446b@amd.com> <7de20763-b9bc-4dfc-b250-8f83c42e9e16@suse.com>
In-Reply-To: <7de20763-b9bc-4dfc-b250-8f83c42e9e16@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.db5fcd6941aa43b2ac53c0d0b3e3427f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240619:md
Date: Wed, 19 Jun 2024 14:33:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jun 19, 2024 at 02:07:04PM +0200, Jan Beulich wrote:
> On 16.05.2024 15:52, Jason Andryuk wrote:
> > On 2024-05-16 03:41, Jan Beulich wrote:
> >> On 16.05.2024 04:22, Jason Andryuk wrote:
> >>> From: Jason Andryuk <jason.andryuk@amd.com>
> >>>
> >>> From: Jason Andryuk <jason.andryuk@amd.com>
> >>
> >> Two identical From: (also in another patch of yours, while in yet another one
> >> you have two _different_ ones, when only one will survive into the eventual
> >> commit anyway)?
> > 
> > Sorry about that.  Since I was sending from my gmail account, I thought 
> > I needed explicit From: lines to ensure the authorship was listed w/ 
> > amd.com.  I generated the patches with `git format-patch --from`, to get 
> > the explicit From: lines, and then sent with `git send-email`.  The 
> > send-email step then inserted the additional lines.  I guess it added 
> >  From amd.com since I had changed to that address in .gitconfig.
> > 
> >>> backendtype=phy using the blktap kernel module needs to use write_dev,
> >>> but tapback can't support that.  tapback should perform better, but make
> >>> the script compatible with the old kernel module again.
> >>>
> >>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >>
> >> Should there be a Fixes: tag here?
> > 
> > That makes sense.
> > 
> > Fixes: 76a484193d ("hotplug: Update block-tap")
> 
> Surely this wants going into 4.19? Thus - Anthony, Oleksii?

Yes, I think so.

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

