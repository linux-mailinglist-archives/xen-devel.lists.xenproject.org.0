Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326759EE8D0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 15:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856071.1268808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkCW-0006rI-RR; Thu, 12 Dec 2024 14:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856071.1268808; Thu, 12 Dec 2024 14:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkCW-0006p0-Op; Thu, 12 Dec 2024 14:30:00 +0000
Received: by outflank-mailman (input) for mailman id 856071;
 Thu, 12 Dec 2024 14:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLkCV-0006ou-2a
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 14:29:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90265fae-b895-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 15:29:58 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso93505566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 06:29:58 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa663334906sm787320766b.72.2024.12.12.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 06:29:57 -0800 (PST)
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
X-Inumbo-ID: 90265fae-b895-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734013797; x=1734618597; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MFmPhYMWCD3uVwM5ZNOxirq5yWYQNSc8mUC050yNHo=;
        b=beoLKilw/B6ITPSVcm5IQcmFLKwFpC4imia4SKGO5z7e9gOKjdPBJRegZgAIQvk6lk
         3pvXgwsDiPRrf2l0LVf3VvWClEc7YHMzabwlqH0h14qxo0tsba8GE24xRmM8TVOrfW6/
         p90rArm7lzkDARpy1wgLPLwY/TR1ZocA4mzQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734013797; x=1734618597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MFmPhYMWCD3uVwM5ZNOxirq5yWYQNSc8mUC050yNHo=;
        b=gjnl3XuxxTeDfNIJJpQm1owTzC44eq31bv2yF25dZmAqVVBF40N7JDk9ypZVWsMWMI
         pUf3S7IXU6F8w5eabJCSRqv82YtIVF08g/Et7GTouOq2OcLIj+LWxrNVSFEjXWVpn5Ro
         I1xxOI8KLfCtw6EtESoabO1x0JUDoPe+rF5rSMOBBin4drgp/6sQMoYL38cZe8ZaxxXN
         M23V++02gGa2w6Z88AZZRYoctRQMEOMg+C5+mLoiCfinQCNszSsEN5E1rnZeEiGrQXJp
         DAJe7X5wEUlj9HqHV6igBsouz3oa77pJyn5DkPO5CWqyS/ESFqbwhbUkp7j2oeSQFOIM
         hB7A==
X-Gm-Message-State: AOJu0YxhlKFi+S+osK8WituJh/qitw1FWFPYSPl0La4dLAMbKBElP2jn
	oPO9UZSxIDAPJxyyhBpQXs91BcUeL6MCoYcZjnmoUS6d8VHQ8sJsMJgAXDmWU40=
X-Gm-Gg: ASbGncvb6VJiUMDDsskfgEuo980702nIWAkMzX6uA28wfumJJpYC/gG1TBCd1IDnDuK
	iTMrmwILRhX9GuRJRfmKi16ueBXesY2Cwr3avjij3jbfTV3A5pGueB5mJe0SmVakzcuGaDzFNsp
	SeCC8IkXMKxut62X0qmP7bBrHHVcQ5KzD2x6sBN65wr4DRqbU6XRBNQT9lIussG9Sm2SBco8KjM
	9BMmiREmSg1zCD8hRjOBXWtes1OsM/iqFx0t/zU4miTm4/9VTR/hr3zMgBdEA6WSA==
X-Google-Smtp-Source: AGHT+IEEbO10q1B4Rvd1iwyZlTjjDIpOLsX6RxDwNalK7SqCsecOkRQ8nR2f6pgUcc0ligQwyriHjQ==
X-Received: by 2002:a17:906:328d:b0:aa6:ac19:b579 with SMTP id a640c23a62f3a-aa6c1b0a7d0mr409383966b.26.1734013797599;
        Thu, 12 Dec 2024 06:29:57 -0800 (PST)
Date: Thu, 12 Dec 2024 15:29:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 28/35] xen/8250-uart: add missing definitions
Message-ID: <Z1rzZGef5SusIkN-@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:58PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Added missing definitions needed for NS8250 UART emulator.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/include/xen/8250-uart.h | 81 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 60 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c13c50bac17d4cdf2f3bf584380776a..4a69b2b225140efda287bdf96fa0caa4aa70074f 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,16 +32,22 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
>  #define UART_XR_EFR       0x09    /* Enhanced function register (Exar) */
>  
> +/* ns8250 emulator: range of emulated registers [0..UART_MAX-1] */
> +#define UART_MAX          (UART_SCR + 1)
> +
>  /* Interrupt Enable Register */
>  #define UART_IER_ERDAI    0x01    /* rx data recv'd       */
>  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>  #define UART_IER_ELSI     0x04    /* rx line status       */
>  #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_MASK \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>  
>  /* Interrupt Identification Register */
>  #define UART_IIR_NOINT    0x01    /* no interrupt pending */
> @@ -51,12 +57,21 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE0      BIT(6, U) /* FIFO enable #0 */
> +#define UART_IIR_FE1      BIT(7, U) /* FIFO enable #1 */
> +#define UART_IIR_FE_MASK  (UART_IIR_FE0 | UART_IIR_FE1)
>  
>  /* FIFO Control Register */
> -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
> +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */

We don't usually define reserved bits I think, as I assume those won't
be used by the code?

Maybe a reserved mask for the hole register, to ensure the access to
the register doesn't attempt to set reserved bits?  But even then the
best we can do when emulating is print a warning message.

Thanks, Roger.

