Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B2B4680B
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 03:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112941.1461055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuhwf-0007WH-PZ; Sat, 06 Sep 2025 01:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112941.1461055; Sat, 06 Sep 2025 01:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuhwf-0007Tp-MH; Sat, 06 Sep 2025 01:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1112941;
 Sat, 06 Sep 2025 01:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuhwe-0007Tj-8H
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 01:42:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82dd12f-8ac2-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 03:42:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D91F943F10;
 Sat,  6 Sep 2025 01:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AB8C4CEF1;
 Sat,  6 Sep 2025 01:42:14 +0000 (UTC)
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
X-Inumbo-ID: b82dd12f-8ac2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757122935;
	bh=ZhGYbmi2VEH/v5eVOEwAtGTcOpfqj9aGKUpfVmDVoeI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IdfwKahc0WeteXHCiOIx4WTo04uQbYOO2f9gr5EaMCbMaHx1Qc/YUTrcBSxN87bEY
	 S2GJg91ZttBbo6h9xi4hgGPGjg+JuQeXMgZ9YkZjhXvT8RMnN7RTi7mWJmBn2HJnz9
	 96nQi9ts19QdtFcZ3tYFMIZwAm0s3AFhVka3Wde9rxKsOOCN73A4+FbB4O66q0naqT
	 o9RQhL7hAWYWGlTRXbtyPdu6OIxn2PZkqYPtB2fkMYrweSv7wzpfloF7tmQwlUiJ0K
	 l/LOq7+BhtN48eiMZUbDexjL9+UYCQ6C1/zLX4HUXNQS9Zj4tc6kwFBZ+PbVLSOlqi
	 F8Lt9kvAL8MzQ==
Date: Fri, 5 Sep 2025 18:42:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 06/15] emul/ns16x50: implement IER/IIR registers
In-Reply-To: <20250905232715.440758-7-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051828050.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-7-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> +/*
> + * Get the interrupt identity reason.
> + *
> + * IIR is re-calculated once called, because ns16x50 always reports high
> + * priority events first.
> + * regs[NS16X50_REGS_NUM + UART_IIR] is used to store THR reason only.
> + */
> +static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
> +{
> +    /*
> +     * Interrupt identity reasons by priority.
> +     * NB: high priority are at lower indexes below.
> +     */
> +    static const struct {
> +        bool (*check)(const struct vuart_ns16x50 *vdev);
> +        uint8_t ier;
> +        uint8_t iir;
> +    } iir_by_prio[] = {
> +        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
> +        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
> +        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
> +        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
> +    };
> +    const uint8_t *regs = vdev->regs;
> +    uint8_t iir = 0;
> +    unsigned int i;
> +
> +    /*
> +     * NB: every interaction w/ ns16x50 registers (except DLAB=1) goes
> +     * through that call.
> +     */
> +    ASSERT(spin_is_locked(&vdev->lock));
> +
> +    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> +    {
> +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> +             iir_by_prio[i].check(vdev) )
> +            break;
> +
> +    }
> +    if ( i == ARRAY_SIZE(iir_by_prio) )
> +        iir |= UART_IIR_NOINT;
> +    else
> +        iir |= iir_by_prio[i].iir;
> +
> +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> +        iir |= UART_IIR_FE;
> +
> +    return iir;
> +}
> +
> +static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +    const struct vuart_info *info = vdev->info;
> +    int vector;
> +
> +    if ( has_vpic(d) )
> +        vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
> +    else
> +        ASSERT_UNREACHABLE();

This seems dangerous as there are guests without vpic


> +    ns16x50_debug(vdev, "IRQ#%d vector %d assert\n", info->irq, vector);
> +}
> +
> +static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +    const struct vuart_info *info = vdev->info;
> +
> +    if ( has_vpic(d) )
> +        hvm_isa_irq_deassert(d, info->irq);
> +    else
> +        ASSERT_UNREACHABLE();

also here


> +    ns16x50_debug(vdev, "IRQ#%d deassert\n", info->irq);
> +}


