Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E54438BE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 23:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220495.381778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi2ZZ-0005Tc-A8; Tue, 02 Nov 2021 22:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220495.381778; Tue, 02 Nov 2021 22:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi2ZZ-0005Rq-7C; Tue, 02 Nov 2021 22:48:05 +0000
Received: by outflank-mailman (input) for mailman id 220495;
 Tue, 02 Nov 2021 22:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8t6=PV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mi2ZX-0005Rk-Ek
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 22:48:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeb80d3e-3c2e-11ec-855d-12813bfff9fa;
 Tue, 02 Nov 2021 22:48:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B39D461051;
 Tue,  2 Nov 2021 22:48:00 +0000 (UTC)
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
X-Inumbo-ID: eeb80d3e-3c2e-11ec-855d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635893281;
	bh=pAeJaHQe5+rHr3JUhZrARj9BOIVQjkoZXCqHHaksyn4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MX5Zfps0Jkv2wdtTKBf3cYGDjHha7kT3ttEv9ekU2ahs0de9uogGhD0BhW5cC0I/a
	 o37X2Xalpw02DDWplGHV+zPDUSjni98jlQ09sRhpvz93xCHw52MhJpOcYNb88ntj8o
	 JnqBUJAE2vW/EioPP/8qfyOI4+6vcaiuagRFuCYOBAQQNxVeMiCEUFhrnHGDtf0Rxp
	 OT6LBRm5CqPaxd8iJoxIGaKLPpyg0hV4xI9rwH5k9XJRI3GXu6mn5R2GA7dKn0CmmZ
	 4P/BH5PVvyC18WYbpDMz8W+r5GKyYSMAlXi/piN1jOBIYPof6Hv/I0z5tSijVbsN9+
	 cW1LBNPC2hdDw==
Date: Tue, 2 Nov 2021 15:47:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    iwj@xenproject.org, bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
In-Reply-To: <20211102112041.551369-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2111021545130.18170@sstabellini-ThinkPad-T480s>
References: <20211102112041.551369-1-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Nov 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> the base address may not be aligned in the way that the translation
> always work. If not adjusted with respect to the base address it may not be
> able to properly convert SBDF.
> Fix this by adjusting the gpa with respect to the host bridge base address
> in a way as it is done for x86.
> 
> Please note, that this change is not strictly required given the current
> value of GUEST_VPCI_ECAM_BASE which has bits 0 to 27 clear, but could cause
> issues if such value is changed, or when handlers for dom0 ECAM
> regions are added as those will be mapped over existing hardware
> regions that could use non-aligned base addresses.
> 
> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Also, Ian already gave his release-ack.


> ---
> Since v1:
>  - updated commit message (Roger)
> 
> This patch aims for 4.16 release.
> Benefits:
> Fix potential bug and clear the way for further PCI passthrough
> development.
> Risks:
> None as the change doesn't change the behaviour of the current code,
> but brings clarity into SBDF calculation.
> ---
>  xen/arch/arm/vpci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 8f40a0dec6d2..23f45386f4b3 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -24,7 +24,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      unsigned long data;
>  
>      /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
>  
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
> @@ -44,7 +44,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      pci_sbdf_t sbdf;
>  
>      /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
>  
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
> -- 
> 2.25.1
> 

