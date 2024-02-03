Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23B84841A
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 07:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675320.1050693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW9si-0007HF-Kq; Sat, 03 Feb 2024 06:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675320.1050693; Sat, 03 Feb 2024 06:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW9si-0007Ey-I0; Sat, 03 Feb 2024 06:52:04 +0000
Received: by outflank-mailman (input) for mailman id 675320;
 Sat, 03 Feb 2024 06:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=do4w=JM=proton.me=oxjo@srs-se1.protection.inumbo.net>)
 id 1rW9sg-0007EZ-AY
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 06:52:03 +0000
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab46c43-c260-11ee-8a45-1f161083a0e0;
 Sat, 03 Feb 2024 07:52:00 +0100 (CET)
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
X-Inumbo-ID: bab46c43-c260-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pnaxooauwbbdxks7bzwswiseja.protonmail; t=1706943119; x=1707202319;
	bh=EobaSJc23ddaVAh9q16q+fP0pU/dKKyhVwROBXbwYbQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=G4sTtgcyEFdrcTTVQEAQHoNzOP/SJHdhZ9e+U1XC/IrCA+yXUz3Vr+GXLy1baMb2H
	 s6pGN8l3eWUIU3EmubBltDw6ZXV//uP3YPFTt4KTbkmI0hyK7Wrh5j88D06CSCjrs7
	 5T8Ua7zPmKWIFyuNsBEAh19+UOfVzmNI89lBjXpeEFVQyMO4AqVzSZIQtFhwJ0f41q
	 smIkWZvOiMz6+srMeR9mihuQcFpOFdwR5lySedoCJXJs9omjFK5NorzLKL6q2vi/LD
	 X+sHdApDAIkD+5MpkiPir67g5bAemc+m6KjLTWULlr9la4FTi5waMM9wD9dfWq9TFh
	 NNLlF+sDCBYYw==
Date: Sat, 03 Feb 2024 06:51:40 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
From: oxjo@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] amd-vi: fix IVMD memory type checks
Message-ID: <3aNB4uE4wIvluDR2_B44k-NdgLmDwQJ5HDZJ5VioTNW0erk7v8LOvQSIhhy2d82r8aj7FtVFznD2fLVwn2fHmNN9uMUa-UVNUPeVV1kondI=@proton.me>
In-Reply-To: <20240201170159.66330-2-roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com> <20240201170159.66330-2-roger.pau@citrix.com>
Feedback-ID: 99814252:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, February 1st, 2024 at 18:01, Roger Pau Monne <roger.pau@citrix=
.com> wrote:

> The current code that parses the IVMD blocks is relaxed with regard to th=
e
> restriction that such unity regions should always fall into memory ranges
> marked as reserved in the memory map.
>
> However the type checks for the IVMD addresses are inverted, and as a res=
ult
> IVMD ranges falling into RAM areas are accepted. Note that having such ra=
nges
> in the first place is a firmware bug, as IVMD should always fall into res=
erved
> ranges.
>
> Fixes: ed6c77ebf0c1 ('AMD/IOMMU: check / convert IVMD ranges for being / =
to be reserved')
> Signed-off-by: Roger Pau Monn=C3=A9 roger.pau@citrix.com
>
> ---
> Cc: oxjo@proton.me
> ---
> xen/drivers/passthrough/amd/iommu_acpi.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passt=
hrough/amd/iommu_acpi.c
> index 2e3b83014beb..ca70f4f3ae2c 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -426,9 +426,14 @@ static int __init parse_ivmd_block(const struct acpi=
_ivrs_memory ivmd_block)
> return -EIO;
> }
>
> - / Types which won't be handed out are considered good enough. /
> - if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
> - RAM_TYPE_UNUSABLE)) )
> + /
> + * Types which aren't RAM are considered good enough.
> + * Note that a page being partially RESERVED, ACPI or UNUSABLE will
> + * force Xen into assuming the whole page as having that type in
> + * practice.
> + */
> + if ( type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
> + RAM_TYPE_UNUSABLE) )
> continue;
>
> AMD_IOMMU_ERROR("IVMD: page at %lx can't be converted\n", addr);

I tested the patch and it resolves the issue.
It eliminates the boot IVMD error message.
AMD-Vi is enabled and pci passthrough works.


Tested-by: oxjo <oxjo@proton.me>

