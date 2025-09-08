Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27AB48451
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 08:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114575.1461425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvVZF-0003x1-Tx; Mon, 08 Sep 2025 06:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114575.1461425; Mon, 08 Sep 2025 06:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvVZF-0003vV-Qe; Mon, 08 Sep 2025 06:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1114575;
 Mon, 08 Sep 2025 06:41:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvVZD-0003u7-Qe
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 06:41:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvVZC-00D8eL-16;
 Mon, 08 Sep 2025 06:41:30 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvVZC-003G39-0b;
 Mon, 08 Sep 2025 06:41:30 +0000
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
	bh=Hcilh4XarxLGkR/XmXPgpiioSEjlcB8Ro1sgkDWwIVI=; b=M1IA2GHV9JuhBaXm0r//r18t1Z
	uiegjch7DzIf6FzfC/UP0nUlWqtabjhAmbxTh/N0tBT5TFhYZ0y9hQt7bxivdvVvi04YxF1Rt38I/
	8D03EmvficKxDAe0nyqjYp365Mtqj1Po0ikVDHv/8SdDUxqOLT1enkLlmZt6WsqpLWh0=;
From: dmukhin@xen.org
Date: Sun, 7 Sep 2025 23:41:29 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 04/15] emul/ns16x50: implement DLL/DLM registers
Message-ID: <aL56mf3H4/TohRFZ@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-5-dmukhin@ford.com>
 <CAGeoDV9wbhkDr7MSOVCZoiu8xqzmtwPY4hUdBtmeZiNKqj8=-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV9wbhkDr7MSOVCZoiu8xqzmtwPY4hUdBtmeZiNKqj8=-w@mail.gmail.com>

On Sun, Sep 07, 2025 at 12:12:08AM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> On Sat, Sep 6, 2025 at 3:11 AM <dmukhin@xen.org> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add DLL/DLM registers emulation.
> >
> > DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.
> >
> > Add stub for ns16x50_dlab_get() helper.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v5:
> > - dropped ns16x50_dlab_get() hunk (moved to emulator stub)
> > - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-5-dmukhin@ford.com/
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index 0462a961e785..7f479a5be4a2 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -97,8 +97,13 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
> >  static int ns16x50_io_write8(
> >      struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> >  {
> > +    uint8_t *regs = vdev->regs;
> > +    uint8_t val = *data;
> >      int rc = 0;
> >
> > +    if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> > +        regs[NS16X50_REGS_NUM + reg] = val;
> 
> Some documentation (e.g., DesignWare DW_apb_uart Databook, v3.04a)
> notes that if the Divisor Latch Registers (DLL and DLH) are set to
> zero, the baud clock is disabled and no serial communications occur.
> 
> Should we handle the zero-divisor case to emulate this behavior more
> accurately?

Good idea, thanks!
I will plumb zero-divisor logic into RBR/THR handling.

> 
> > +
> >      return rc;
> >  }
> >
> > @@ -109,8 +114,16 @@ static int ns16x50_io_write8(
> >  static int ns16x50_io_write16(
> >      struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
> >  {
> > +    uint16_t val = *data;
> >      int rc = -EINVAL;
> >
> > +    if ( ns16x50_dlab_get(vdev) && reg == UART_DLL )
> > +    {
> > +        vdev->regs[NS16X50_REGS_NUM + UART_DLL] = val & 0xff;
> > +        vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (val >> 8) & 0xff;
> 
> Instead of hardcoding 0xff here (and in similar lines below), consider
> using UINT8_MAX. This makes it explicit that the value is the maximum
> for a uint8_t and avoids magic numbers.

Thanks for suggestion!
Will update.

