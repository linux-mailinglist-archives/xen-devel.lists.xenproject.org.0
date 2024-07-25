Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3493C3B4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 16:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765010.1175555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWz6m-0007Vr-Gk; Thu, 25 Jul 2024 14:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765010.1175555; Thu, 25 Jul 2024 14:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWz6m-0007Ty-Dz; Thu, 25 Jul 2024 14:06:16 +0000
Received: by outflank-mailman (input) for mailman id 765010;
 Thu, 25 Jul 2024 14:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ByKr=OZ=bounce.vates.tech=bounce-md_30504962.66a25bcc.v1-d1ac2b5b40c04416823c65458f359e36@srs-se1.protection.inumbo.net>)
 id 1sWz6l-0007Ts-7J
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 14:06:15 +0000
Received: from mail145-27.atl61.mandrillapp.com
 (mail145-27.atl61.mandrillapp.com [198.2.145.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 099a319d-4a8f-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 16:06:08 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-27.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WVCND2Cd3z4f3qyF
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 14:06:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d1ac2b5b40c04416823c65458f359e36; Thu, 25 Jul 2024 14:06:04 +0000
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
X-Inumbo-ID: 099a319d-4a8f-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721916364; x=1722176864;
	bh=5JTCAEV+av8gxi1TGY+pjTD4pczARUjgtACVcScayik=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=o+CBtdthJku+YxxPPLFuR9DDfBejmlLveIt4EPFhHBzI9tWG+iWwKTYDQ3i59kfdx
	 /bIrWt1aDlIMDzMjcoYkPk7cCWGYkKrH6Z6nzlvLkHB8IN48sbVeF/iocDyClt9IdA
	 NO4lNoI64DfoeMLrH1xnkCS6D5aVuNWYpAWUuGkvdBCo/Req7ORdYbVN8jAxCv52vy
	 M605lMYdkn7HSmJKIe8aiucEqP9nx1/W9OiY3oYq03/bN2+FRAliPFjjWgZ+KHuQNg
	 E1VUT4twcnfGC6h+EwgaeXG6VWY5xVIXNV8+dd37GTdkEK/U/6K6Qamu4DDXeOzerm
	 8D8bJ3yHPNcIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721916364; x=1722176864; i=anthony.perard@vates.tech;
	bh=5JTCAEV+av8gxi1TGY+pjTD4pczARUjgtACVcScayik=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DDFGzYEzsWBO7q+6qVZmrgfOvmly/zuznAFgt5fwuLrBqt5JBwKxczv/DU1M0jgr0
	 nYau0C5I7vu+EHHN20SCkTa2O0u+LAO778yBA0lZ2YBIFUDR+tIOSDqXeDZcha0cDf
	 Hbd+oZxEvQRliqpbMNRU+ePGi2qxyBlpLwtxGYGkRYixOR5baLSJgDnKvrBPRl1eBV
	 hsAGZQu4LQiloPiX/3tvM4WFsov6IKSfGXBnTV3BxpcvNNAUzChGWQvX5Zpe+c8j8a
	 Fu55Inq8kwmCawHjPOrSl0F47QIo6/hzPlNk/ArEmRQhjiwVEA6CojlTzfeSXfF6Cr
	 9B0Wu97FdXnGg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2007/12]=20libxl:=20Allow=20stubdomain=20to=20control=20interupts=20of=20PCI=20device?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721916363568
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <ZqJby/TBLQOmzQPH@l14>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <aeba05a5ec7a0657217933f165ee0ac7e86e1b1b.1715867907.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <aeba05a5ec7a0657217933f165ee0ac7e86e1b1b.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d1ac2b5b40c04416823c65458f359e36?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240725:md
Date: Thu, 25 Jul 2024 14:06:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 03:58:28PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Especially allow it to control MSI/MSI-X enabling bits. This part only
> writes a flag to a sysfs, the actual implementation is on the kernel
> side.
> 
> This requires Linux >=3D 5.10 in dom0 (or relevant patch backported).

Does it not work before 5.10? Because the
Documentation/ABI/testing/sysfs-driver-pciback in linux tree say that
allow_interrupt_control is in 5.6.

> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..6f357b70b815 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1513,6 +1513,14 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc =3D ERROR_FAIL;
>              goto out;
>          }
> +    } else if (libxl_is_stubdom(ctx, domid, NULL)) {
> +        /* Allow acces to MSI enable flag in PCI config space for the st=
ubdom */

s/acces/access/

> +        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/allow_interrupt_c=
ontrol",
> +                             pci) < 0 ) {
> +            LOGD(ERROR, domainid, "Setting allow_interrupt_control for d=
evice");
> +            rc =3D ERROR_FAIL;
> +            goto out;

Is it possible to make this non-fatal for cases where the kernel is
older than the introduction of the new setting? Or does pci passthrough
doesn't work at all with a stubdom before the change in the kernel?

If making this new setting conditional is an option, you could
potentially improve the error code returned by sysfs_write_bdf() to
distinguish between an open() failure and write() failure, to avoid
checking the existance of the path ahead of the call. But maybe that
pointless because it doesn't appear possible to distinguish between
permission denied and not found.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


