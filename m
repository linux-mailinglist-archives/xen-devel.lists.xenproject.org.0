Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC1618583
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436931.691170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdZh-0008P4-7F; Thu, 03 Nov 2022 17:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436931.691170; Thu, 03 Nov 2022 17:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdZh-0008Mc-3q; Thu, 03 Nov 2022 17:00:17 +0000
Received: by outflank-mailman (input) for mailman id 436931;
 Thu, 03 Nov 2022 17:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBna=3D=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1oqdZg-0008MW-EN
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:00:16 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with SMTP
 id fc43d110-5b98-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 18:00:14 +0100 (CET)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:42450 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S2156408AbiKCQjb (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Thu, 3 Nov 2022 17:39:31 +0100
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
X-Inumbo-ID: fc43d110-5b98-11ed-91b5-6bf2151ebd3b
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Thu, 3 Nov 2022 17:39:25 +0100
From:	Daniel Kiper <dkiper@net-space.pl>
To:	grub-devel@gnu.org, Denton Liu <liu.denton@gmail.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221103163925.kmisraj4l2d5inbr@tomti.i.net-space.pl>
References: <20221024104642.251016-1-liu.denton@gmail.com>
 <Y1dWNXeWlLUdxbFm@dj3ntoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1dWNXeWlLUdxbFm@dj3ntoo>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Oct 24, 2022 at 10:21:25PM -0500, Oskari Pirhonen wrote:
> On Mon, Oct 24, 2022 at 03:46:42 -0700, Denton Liu wrote:
> > A user may wish to use an image that is not sorted as the "latest"
> > version as the top-level entry. For example, in Arch Linux, if a user
> > has the LTS and regular kernels installed, `/boot/vmlinuz-linux-lts`
> > gets sorted as the "latest" compared to `/boot/vmlinuz-linux`, meaning
> > the LTS kernel becomes the top-level entry. However, a user may wish to
> > use the regular kernel as the top-level default with the LTS only
> > existing as a backup.
> >
> > This need can be seen in Arch Linux's AUR with two user-submitted
> > packages[0][1] providing an update hook which patches
> > /etc/grub.d/10_linux to move the desired kernel to the top-level. This
> > patch serves to solve this in a more generic way.
> >
> > Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
> > GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
> > top-level entry.
> >
> > Create grub_move_to_front() as a helper function which moves entries to
> > the front of a list. This function does the heavy lifting of moving
> > the menu entry to the front in each script.
> >
> > In 10_netbsd, since there isn't an explicit list variable, extract the
> > items that are being iterated through into a list so that we can
> > optionally apply grub_move_to_front() to the list before the loop.
> >
> > [0]: https://aur.archlinux.org/packages/grub-linux-default-hook
> > [1]: https://aur.archlinux.org/packages/grub-linux-rt-default-hook
> >
> > Signed-off-by: Denton Liu <liu.denton@gmail.com>
>
> Reviewed-by: Oskari Pirhonen <xxc3ncoredxx@gmail.com>

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

If I do not hear any objections in a week or so I will merge this patch.

Daniel

