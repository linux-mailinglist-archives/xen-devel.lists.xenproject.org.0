Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A143B014DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 09:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040593.1411993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua8Nh-0001mY-BX; Fri, 11 Jul 2025 07:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040593.1411993; Fri, 11 Jul 2025 07:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua8Nh-0001kZ-8j; Fri, 11 Jul 2025 07:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1040593;
 Fri, 11 Jul 2025 07:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EURg=ZY=bounce.vates.tech=bounce-md_30504962.6870c00e.v1-c0c98627b45b480b8fbd2a839ca5d463@srs-se1.protection.inumbo.net>)
 id 1ua8Nf-0001kS-N1
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 07:41:15 +0000
Received: from mail179-35.suw41.mandrillapp.com
 (mail179-35.suw41.mandrillapp.com [198.2.179.35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655c82a9-5e2a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 09:41:03 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-35.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4bdkCy39MPzDRJnHS
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 07:41:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c0c98627b45b480b8fbd2a839ca5d463; Fri, 11 Jul 2025 07:41:02 +0000
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
X-Inumbo-ID: 655c82a9-5e2a-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752219662; x=1752489662;
	bh=HWTYzQJa/AfE0/PYzIww/Vdcho/R6E1wlPo0cGaFq1U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QTfSaoO6DXcrQnuP/vxhtAH+TT3dtX7qkNJ4jfhxtkJXioKIJDr/95xAVVRaTO500
	 gJtMmhTjKBqKKOHG20totsJ9Wai8NYsxJFeWeSGI70bpKINpwztOdIB1WnXQCN9iTJ
	 PKG6+XBAam/Z1pHcjAEwE0Vox5gbXpcMTNWPXtvTFNK6l8wBojhIm/YCYbUCZQQOq+
	 ZTFN/lrjgmGvTerDDz7Ef3hy0Wm44SiaPk4seVM42kiVvXm/4VovDr6RBqjVZmsT1N
	 c3eLJMfhphDtTa/9IBwEbeJgB8M3QqbdyJUoq9Ts/Rhpq5SZYP5AT1dEEvNZXpip4a
	 1wqdvlx+KuHoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752219662; x=1752480162; i=anthoine.bourgeois@vates.tech;
	bh=HWTYzQJa/AfE0/PYzIww/Vdcho/R6E1wlPo0cGaFq1U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RobnsXtAJOcQ+Mx2lNgcUINqdc9fy3iJLlL1EXzh24pU0Nk9x0AIn+OB6WSy9QLWM
	 ljBX9Tz1qKUDVq3Yjz6h4OCyrtwiAOcIdc+i+PtpHatmzKtXRnZVnEaQPjOYmSOUEe
	 BprBzj4gjE+ouj122RSbYCPNDHJyYk/nyHBptlvHS9SfIYm67yaXVPLGH3kD1BiXwP
	 dp4jJ6YC3aR5SzDHjW0HrKFl69OtgYRDuouZIFdSpZk0lCKHi2P8smY2TCjfYttJtY
	 PJEydk3IldbtP1D26/S6GfFEZtZXJGVRhWUnRkgoBDsrtpEM6HeB43pU4HPnu6yf6B
	 Pil2rZART5LIA==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752219661292
To: "Elliott Mitchell" <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrei Semenov" <andrei.semenov@vates.tech>
Message-Id: <aHDAC3mvysH-0vit@mail.vates.tech>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech> <aHAdG-vhZqdLeOpg@mattapan.m5p.com>
In-Reply-To: <aHAdG-vhZqdLeOpg@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c0c98627b45b480b8fbd2a839ca5d463?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250711:md
Date: Fri, 11 Jul 2025 07:41:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 10, 2025 at 01:05:47PM -0700, Elliott Mitchell wrote:
>On Thu, Jul 10, 2025 at 04:11:15PM +0000, Anthoine Bourgeois wrote:
>> We found at Vates that there are lot of spurious interrupts when
>> benchmarking the PV drivers of Xen. This issue appeared with a patch
>> that addresses security issue XSA-391 (see Fixes below). On an iperf
>> benchmark, spurious interrupts can represent up to 50% of the
>> interrupts.
>
>If this is the correct fix, near-identical fixes are needed for *all*
>of the Xen front-ends.  Xen virtual block-devices and Xen PCI-passthrough
>devices are also effected by a similar issue.
>
blkfront doesn't call the response handle from multiple places. It
doesn't seem to be affected by this problem.
And pcifront neither.

>Thanks for finding a candidate fix, this effects many other people who
>have been troubled by this performance issue.
>
>FreeBSD will also need a similar fix.

In FreeBSD, netfront may also be affected.
xn_assemble_tx_request calls xn_txeof.
blkfront and pcifront seems good.

Regards,
Anthoine


Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


