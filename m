Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A81962DCD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 18:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785014.1194432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLgU-0003SX-W8; Wed, 28 Aug 2024 16:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785014.1194432; Wed, 28 Aug 2024 16:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLgU-0003PL-ST; Wed, 28 Aug 2024 16:38:14 +0000
Received: by outflank-mailman (input) for mailman id 785014;
 Wed, 28 Aug 2024 16:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=up7O=P3=bounce.vates.tech=bounce-md_30504962.66cf5270.v1-b859026ae7614831888f2940ed2e1c80@srs-se1.protection.inumbo.net>)
 id 1sjLgT-0003PF-44
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 16:38:13 +0000
Received: from mail137-25.atl71.mandrillapp.com
 (mail137-25.atl71.mandrillapp.com [198.2.137.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e90eeb62-655b-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 18:38:10 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-25.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Wv9810SqMz35hTny
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 16:38:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b859026ae7614831888f2940ed2e1c80; Wed, 28 Aug 2024 16:38:08 +0000
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
X-Inumbo-ID: e90eeb62-655b-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724863089; x=1725123589;
	bh=UOStic/LZX6XVX/sSEGr44o+pPQAQeLXe2Il6UL0+vM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UAu51CzXB0hCoVPRGkliY6rRNVWQK6KeP72alXFA6eS8rBxsP/zlFDBJAQQ3eTtg2
	 gTlM/b+AUjTcilFH2yeNRWI0cGxeGYZYCWwRYK36natSbEHWbsDEWEdj/YHAsS9JMC
	 4cj/0DzygeY6faILgBWvHaVixlRYnaZnxzLZRPD2WHR4ejpxbfOtmEm/APbOIi44iD
	 Fi7ah+4nGiABHOG9YmFM9tUAj147+u7eiex7TSl9GuKErJZi1lqtKuXoWJ8/8ZG61A
	 /Ly3GKsIhzFdXYApkokiCu0360HZegiMHRNGGxVv624hR3Ee1QNVb4AoXTeo9zFDjv
	 DyWTK50+nVGOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724863089; x=1725123589; i=anthony.perard@vates.tech;
	bh=UOStic/LZX6XVX/sSEGr44o+pPQAQeLXe2Il6UL0+vM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pbhfuglFbv8T7mTCzTtHhEHykIICvSqqsKNZlhASW+DQ0wFArm0ysrKQixKsEnr2x
	 g357jbv1r7SaZs7vSkbMdRRMeLXCE5TsaSeLb6yUrHc2YajWD9iQhHsdr8xFjWoupv
	 5GBjnVjNE1LP8lAZUhBd7Gl9LVmr0UfpCE85Y9T4FGNdW5AzD5cLkVCyztEIP/Qulp
	 ioSmtqvJ/ly5sWuYoKWK4HoCytQh9bSh+nd8eFVARm/+DYO02W12YMRynpkwPo5l3a
	 gUacZYkcdk/B4LkeyngUQhWiBlSZG/2GatQysef7kTB3deYi5KUYXxO1oUNltqa8B6
	 5xYopAMObB1JQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=201/3]=20hw/xen/xen=5Fpt:=20Save=20back=20data=20only=20for=20declared=20registers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724863087792
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Message-Id: <Zs9SbXAJ++8mj/uR@l14>
References: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com> <aa391652c33c8a4a64db8f27ad50ccb65600b293.1714955598.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <aa391652c33c8a4a64db8f27ad50ccb65600b293.1714955598.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b859026ae7614831888f2940ed2e1c80?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240828:md
Date: Wed, 28 Aug 2024 16:38:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 02:33:20AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Call pci_default_write_config() only after resolving any handlers from
> XenPTRegInfo structures, and only with a value updated with those
> handlers. This is important for two reasons:
> 1. XenPTRegInfo has ro_mask which needs to be enforced - Xen-specific
>    hooks do that on their own (especially xen_pt_*_reg_write()).
> 2. Not setting value early allows hooks to see the old value too.
> 
> If it would be only about the first point, setting PCIDevice.wmask would
> probably be sufficient, but given the second point, change those
> writes.
> 
> Relevant handlers already save data back to the emulated registers
> space, call the pci_default_write_config() only for its side effects.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
> v3:
>  - use emulated register value for pci_default_write_config() call, not
>    the one for writting back to the hardware
>  - greatly simplify the patch by calling pci_default_write_config() on
>    the whole value
> v2:
>  - rewrite commit message, previous one was very misleading
>  - fix loop saving register values
>  - fix int overflow when calculating write mask

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


