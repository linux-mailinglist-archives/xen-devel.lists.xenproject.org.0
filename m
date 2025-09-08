Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B8B48754
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114797.1461606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXMZ-0000Nq-90; Mon, 08 Sep 2025 08:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114797.1461606; Mon, 08 Sep 2025 08:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXMZ-0000L0-64; Mon, 08 Sep 2025 08:36:35 +0000
Received: by outflank-mailman (input) for mailman id 1114797;
 Mon, 08 Sep 2025 08:36:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvXMX-0000Ku-Oq
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:36:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvXMW-00DBmK-1t;
 Mon, 08 Sep 2025 08:36:32 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvXMW-003ORt-1N;
 Mon, 08 Sep 2025 08:36:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=CuKI6tX4kCuN5h4cZY0A4GhYdrc3+o5Tvu+0C27UWg0=; b=d34zrKecFBTg5To9z/s1tHX21/
	Ir1YStfm7BDHYVTcceoLeeHAEq5/NPSWJ43oiyCCsbc2HZ2ielxcWm0AV+eoD0AMZ9RwuFCYspjx7
	8BPIGRgaCnoBpt4XogdKTXpgcPlePaa4TzdI6HERknkNkG3ysNoEYRj4PifYrpS8F3J0=;
From: dmukhin@xen.org
Date: Mon, 8 Sep 2025 01:36:31 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 02/15] xen/8250-uart: update definitions
Message-ID: <aL6Vj0rQjQU4ApvS@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-3-dmukhin@ford.com>
 <CAGeoDV8Q5i_KAmU9Sdu7e06vC72O97ZmdcmJpGNe=AxbE+3jeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV8Q5i_KAmU9Sdu7e06vC72O97ZmdcmJpGNe=AxbE+3jeg@mail.gmail.com>

On Sat, Sep 06, 2025 at 05:57:02PM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> On Sat, Sep 6, 2025 at 2:27 AM <dmukhin@xen.org> wrote:
[..]
> >  /* FIFO Control Register */
> > -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> > -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> > -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> > -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> > +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> > +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> > +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> > +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
> > +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> > +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
> > +#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
> > +#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
> > +#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)
> 
> Thanks for the patch. I noticed that in this changeset some bit
> definitions (e.g. UART_FCR_*) were rewritten using the BIT(n, U)
> macro, while others (e.g. UART_IER_* and rest of UART_FCR_*) are
> still left as plain hex values (0x01, 0x02, etc.), even though they
> are also powers of two.
> 
> Could you clarify the reasoning behind this choice? From a reader’s
> perspective it looks inconsistent. Would it make sense to either:
> 
>   - update all of them to use BIT() for consistency, or
>   - keep the existing style unchanged in this patch and move a full
>     conversion to BIT() into a separate cleanup patch?
> 
> This would make the codebase easier to follow.

I find BIT() notation is more readable than raw bitmasks.
But I agree that definitions should be consistently updated.

Will update to the raw masks instead of BIT() in v7.

