Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460632C19AB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35269.66712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLmr-0001kM-NE; Tue, 24 Nov 2020 00:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35269.66712; Tue, 24 Nov 2020 00:02:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLmr-0001jx-Iq; Tue, 24 Nov 2020 00:02:25 +0000
Received: by outflank-mailman (input) for mailman id 35269;
 Tue, 24 Nov 2020 00:02:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khLmp-0001js-Mf
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:02:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80521caf-2d02-437e-ab3c-bf7d9f048533;
 Tue, 24 Nov 2020 00:02:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D51720728;
 Tue, 24 Nov 2020 00:02:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khLmp-0001js-Mf
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:02:23 +0000
X-Inumbo-ID: 80521caf-2d02-437e-ab3c-bf7d9f048533
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 80521caf-2d02-437e-ab3c-bf7d9f048533;
	Tue, 24 Nov 2020 00:02:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7D51720728;
	Tue, 24 Nov 2020 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606176142;
	bh=AcOJif3NNxO7h1CzhhcsAQ9DmGfREJcUX6jhbBVffpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=0DMH828VJD4L9WZsaV70fy/B+qvE04fY8Yj88bRPYYVEJiaqiBjlBGyW2VaY7QYAa
	 VSX74SeKvGPJ6G43DsLXePk8vEzrnwzXPecAujn6LuadI4OlX5rb3xGXOPZ1mMLaRQ
	 HaTME881tU0AL/2gmsFHTbcnIwdxeEwZlA1zEqLc=
Date: Mon, 23 Nov 2020 16:02:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 1/3] ns16550: move PCI arrays next to the function
 using them
In-Reply-To: <b47b5557-ad67-5bf4-45ce-c305ee5da977@suse.com>
Message-ID: <alpine.DEB.2.21.2011231602071.7979@sstabellini-ThinkPad-T480s>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com> <b47b5557-ad67-5bf4-45ce-c305ee5da977@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2020, Jan Beulich wrote:
> Pure code motion; no functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2: New.
> 
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -153,312 +153,6 @@ struct ns16550_config_param {
>      unsigned int uart_offset;
>      unsigned int first_offset;
>  };
> -
> -/*
> - * Create lookup tables for specific devices. It is assumed that if
> - * the device found is MMIO, then you have indexed it here. Else, the
> - * driver does nothing for MMIO based devices.
> - */
> -static const struct ns16550_config_param __initconst uart_param[] = {
> -    [param_default] = {
> -        .reg_width = 1,
> -        .lsr_mask = UART_LSR_THRE,
> -        .max_ports = 1,
> -    },
> -    [param_trumanage] = {
> -        .reg_shift = 2,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
> -        .mmio = 1,
> -        .max_ports = 1,
> -    },
> -    [param_oxford] = {
> -        .base_baud = 4000000,
> -        .uart_offset = 0x200,
> -        .first_offset = 0x1000,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .mmio = 1,
> -        .max_ports = 1, /* It can do more, but we would need more custom code.*/
> -    },
> -    [param_oxford_2port] = {
> -        .base_baud = 4000000,
> -        .uart_offset = 0x200,
> -        .first_offset = 0x1000,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .mmio = 1,
> -        .max_ports = 2,
> -    },
> -    [param_pericom_1port] = {
> -        .base_baud = 921600,
> -        .uart_offset = 8,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .max_ports = 1,
> -    },
> -    [param_pericom_2port] = {
> -        .base_baud = 921600,
> -        .uart_offset = 8,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .max_ports = 2,
> -    },
> -    /*
> -     * Of the two following ones, we can't really use all of their ports,
> -     * unless ns16550_com[] would get grown.
> -     */
> -    [param_pericom_4port] = {
> -        .base_baud = 921600,
> -        .uart_offset = 8,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .max_ports = 4,
> -    },
> -    [param_pericom_8port] = {
> -        .base_baud = 921600,
> -        .uart_offset = 8,
> -        .reg_width = 1,
> -        .fifo_size = 16,
> -        .lsr_mask = UART_LSR_THRE,
> -        .bar0 = 1,
> -        .max_ports = 8,
> -    }
> -};
> -static const struct ns16550_config __initconst uart_config[] =
> -{
> -    /* Broadcom TruManage device */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_BROADCOM,
> -        .dev_id = 0x160a,
> -        .param = param_trumanage,
> -    },
> -    /* OXPCIe952 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc11b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe952 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc11f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe952 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc138,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe952 2 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc158,
> -        .param = param_oxford_2port,
> -    },
> -    /* OXPCIe952 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc13d,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe952 2 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc15d,
> -        .param = param_oxford_2port,
> -    },
> -    /* OXPCIe952 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc40b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc40f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc41b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc41f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc42b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc42f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc43b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc43f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc44b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc44f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc45b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc45f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc46b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc46f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc47b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc47f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc48b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc48f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc49b,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc49f,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4ab,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4af,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4bb,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4bf,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4cb,
> -        .param = param_oxford,
> -    },
> -    /* OXPCIe200 1 Native UART  */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> -        .dev_id = 0xc4cf,
> -        .param = param_oxford,
> -    },
> -    /* Pericom PI7C9X7951 Uno UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_PERICOM,
> -        .dev_id = 0x7951,
> -        .param = param_pericom_1port
> -    },
> -    /* Pericom PI7C9X7952 Duo UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_PERICOM,
> -        .dev_id = 0x7952,
> -        .param = param_pericom_2port
> -    },
> -    /* Pericom PI7C9X7954 Quad UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_PERICOM,
> -        .dev_id = 0x7954,
> -        .param = param_pericom_4port
> -    },
> -    /* Pericom PI7C9X7958 Octal UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_PERICOM,
> -        .dev_id = 0x7958,
> -        .param = param_pericom_8port
> -    }
> -};
>  #endif
>  
>  static void ns16550_delayed_resume(void *data);
> @@ -1045,6 +739,314 @@ static int __init check_existence(struct
>  }
>  
>  #ifdef CONFIG_HAS_PCI
> +
> +/*
> + * Create lookup tables for specific devices. It is assumed that if
> + * the device found is MMIO, then you have indexed it here. Else, the
> + * driver does nothing for MMIO based devices.
> + */
> +static const struct ns16550_config_param __initconst uart_param[] = {
> +    [param_default] = {
> +        .reg_width = 1,
> +        .lsr_mask = UART_LSR_THRE,
> +        .max_ports = 1,
> +    },
> +    [param_trumanage] = {
> +        .reg_shift = 2,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
> +        .mmio = 1,
> +        .max_ports = 1,
> +    },
> +    [param_oxford] = {
> +        .base_baud = 4000000,
> +        .uart_offset = 0x200,
> +        .first_offset = 0x1000,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .mmio = 1,
> +        .max_ports = 1, /* It can do more, but we would need more custom code.*/
> +    },
> +    [param_oxford_2port] = {
> +        .base_baud = 4000000,
> +        .uart_offset = 0x200,
> +        .first_offset = 0x1000,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .mmio = 1,
> +        .max_ports = 2,
> +    },
> +    [param_pericom_1port] = {
> +        .base_baud = 921600,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 1,
> +    },
> +    [param_pericom_2port] = {
> +        .base_baud = 921600,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 2,
> +    },
> +    /*
> +     * Of the two following ones, we can't really use all of their ports,
> +     * unless ns16550_com[] would get grown.
> +     */
> +    [param_pericom_4port] = {
> +        .base_baud = 921600,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 4,
> +    },
> +    [param_pericom_8port] = {
> +        .base_baud = 921600,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 16,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 8,
> +    }
> +};
> +
> +static const struct ns16550_config __initconst uart_config[] =
> +{
> +    /* Broadcom TruManage device */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_BROADCOM,
> +        .dev_id = 0x160a,
> +        .param = param_trumanage,
> +    },
> +    /* OXPCIe952 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc11b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe952 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc11f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe952 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc138,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe952 2 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc158,
> +        .param = param_oxford_2port,
> +    },
> +    /* OXPCIe952 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc13d,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe952 2 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc15d,
> +        .param = param_oxford_2port,
> +    },
> +    /* OXPCIe952 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc40b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc40f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc41b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc41f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc42b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc42f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc43b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc43f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc44b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc44f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc45b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc45f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc46b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc46f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc47b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc47f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc48b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc48f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc49b,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc49f,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4ab,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4af,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4bb,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4bf,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4cb,
> +        .param = param_oxford,
> +    },
> +    /* OXPCIe200 1 Native UART  */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_OXSEMI,
> +        .dev_id = 0xc4cf,
> +        .param = param_oxford,
> +    },
> +    /* Pericom PI7C9X7951 Uno UART */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_PERICOM,
> +        .dev_id = 0x7951,
> +        .param = param_pericom_1port
> +    },
> +    /* Pericom PI7C9X7952 Duo UART */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_PERICOM,
> +        .dev_id = 0x7952,
> +        .param = param_pericom_2port
> +    },
> +    /* Pericom PI7C9X7954 Quad UART */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_PERICOM,
> +        .dev_id = 0x7954,
> +        .param = param_pericom_4port
> +    },
> +    /* Pericom PI7C9X7958 Octal UART */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_PERICOM,
> +        .dev_id = 0x7958,
> +        .param = param_pericom_8port
> +    }
> +};
> +
>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>  {
> @@ -1211,7 +1213,8 @@ pci_uart_config(struct ns16550 *uart, bo
>  
>      return 0;
>  }
> -#endif
> +
> +#endif /* CONFIG_HAS_PCI */
>  
>  /*
>   * Used to parse name value pairs and return which value it is along with
> 

