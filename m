Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66EB4A951
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116118.1462525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvEV-0008SD-Qw; Tue, 09 Sep 2025 10:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116118.1462525; Tue, 09 Sep 2025 10:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvEV-0008PO-Nw; Tue, 09 Sep 2025 10:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1116118;
 Tue, 09 Sep 2025 10:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvvEU-0008PI-5H
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:05:50 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0381c6-8d64-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:05:43 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b0472bd218bso830162866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 03:05:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0432937e0esm2083736266b.3.2025.09.09.03.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 03:05:42 -0700 (PDT)
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
X-Inumbo-ID: 8c0381c6-8d64-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757412343; x=1758017143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/XrMut+D9Cnm8FPw8vJFLH7cwvrmfge3Zwb3BCxQQQ=;
        b=MW/tSMvnuBqX4V3h18tWEvPiQTpCta0gnc80oTg+LfNRDwJ/aD7u47EWFhqKnooq92
         SokHCFS47mSiXvmNZA7yCrMm3qXF0Nuq5FPOjYmlP1wm+XWLyQmU9W7OFLFJAXHzZ/4F
         ho5UIHHGopuPfLNtHb23qsRDFWNbY5NAyllnLMiZ5JwAeUooEBzoIx1aLd9GcPVCwvid
         q8Igh5MV3WF1KiKuzJlc5qCW/v77ykDtcyGiXSwG553gYG9i5B/ZUBlIVBp+WNuy36pj
         el/avODtEdSDTD0VJTPoeKVW7pe5YxA+ho6T6d07BU7xV2gBSr2Wmemj74k/f8vakub5
         p2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412343; x=1758017143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/XrMut+D9Cnm8FPw8vJFLH7cwvrmfge3Zwb3BCxQQQ=;
        b=YZZ3RzvKFdMgH9KtttX60a9grXwgog5aNE+mcq9EmMlNPXsIQHyDcLGsjUcWae9wF3
         Ce0uOlBeGeU+M/w2ykWFHyhfz7iYqINj69HzAN7BhzJiKfJ5pdb/96Iphh3tCICeqxE0
         hxqcEcLBLCYmaIBOwLEpz3xmzoE22mYPKqD8OQgs6/Hvg/ZX5ErNdc6hTeQoJ3q+Bgoj
         58Lx+LG4tHNsYp8SLtU1wefQNSxGRnFukqgtDQlmOK3wVPq3miANa9qOX6vfOJIdCGFN
         oGLbceA9aC+AbzOp4MlZZDgyOfFzuQq71wXC+EemiXpQExVe8stJBYujTlfPGaDHQzRl
         P+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUYHE0W3zmtr8r8XYwDZAFDLdYzXakrBA14l+SdP5XxkNWjLa2a1bYkBPabK0+/Q7MP35nQv5DCeaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJvp+ef6nEiBNUMVzi7PMrq0fgHjsDnmjkL+mAclYmCPqD9R1a
	w5AuTfI0mK5NX4rq1Xcz4rWFfqSfa6RsfSJO6VIb/S113amwTIAyNw24zPvHzEIXeK/XAOvGatR
	hfMs=
X-Gm-Gg: ASbGncuABwyRQ5zuvdBRw0jO6d+DlRPxdcjNL8sZqQWMtQuPi1NAp/gLo6qzQS29nyr
	83/XrrIlp+3tHW/qhqNNIE0weAsYA1PQzHA95zXPRIkdSVXkorNQXD1J17XRYyVUtSNEmmPQuWH
	QE5SSMqRb6aGNe2N89PotuaQe1w/L5xzQKF4kPoPN5Wx6MCHIVNw4hYfpuUOXOsynYJe7fM2/8t
	RxnKzq6c0IoYEugjo6/XLnTOBDooZMZ4cXmJaBr+pPyjfgxPMLf1R9xw1S3Px/jB77W1zsTPGTj
	MPmTb/Pqwj/EYxDvZk3HdvZztpTGdUo5d4PpNA407bNYg0JYMWHTzuse+j/XFA63mPDpsXjESZQ
	WrTSuE+9W3x6bJbtIyPpc8TgqVIoMbEnPA+KPK0TxXgvoKc5g1+d5b1sHlxgtUWbfXvoRzu+9Tx
	a6ZpPWV5L+fwz6r+cP2Q==
X-Google-Smtp-Source: AGHT+IE8Z8B1/P6kZmUQ5rgQHyA0SCZQ8fmLRLC9cnkVDCx1q1e9H8NkRKepTEdhpHGDqV1am71PWQ==
X-Received: by 2002:a17:907:9955:b0:b07:6537:264c with SMTP id a640c23a62f3a-b076537276cmr242371966b.37.1757412342768;
        Tue, 09 Sep 2025 03:05:42 -0700 (PDT)
Message-ID: <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>
Date: Tue, 9 Sep 2025 12:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/16] xen/8250-uart: update definitions
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250908211149.279143-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.2025 23:11, dmukhin@xen.org wrote:
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,6 +32,7 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
> @@ -42,6 +43,8 @@
>  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>  #define UART_IER_ELSI     0x04    /* rx line status       */
>  #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_MASK \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)

Here, aiui, ..._MASK covers all known bits. No #define-s for reserved
ones.

> @@ -51,12 +54,19 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
>  
>  /* FIFO Control Register */
>  #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
>  #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
>  #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_DMA      0x08    /* enter DMA mode       */

Question is whether we can actually use the source you indicate as
reference. TL16C550C may already be too different from what a "standard"
16550 is (where admittedly it also looks unclear what "standard" would be,
as I'm unaware of a "canonical" spec).

The source I'm looking at says something entirely different. Maybe we're
better off simply omitting this #define?

> +#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
> +#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */
> +#define UART_FCR_RTB0     0x40    /* receiver trigger bit #0 */
> +#define UART_FCR_RTB1     0x80    /* receiver trigger bit #1 */
> +#define UART_FCR_TRG_MASK (UART_FCR_RTB0 | UART_FCR_RTB1)

Continuing from the top comment - here, with the TRG infix, the scope is
clear, too.

> @@ -98,9 +108,30 @@
>  /* Modem Control Register */
>  #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
>  #define UART_MCR_RTS      0x02    /* Request to Send      */
> -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> +#define UART_MCR_OUT1     0x04    /* Output #1 */
> +#define UART_MCR_OUT2     0x08    /* Output #2 */
>  #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> +#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
>  #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> +#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */
> +#define UART_MCR_MASK \
> +    (UART_MCR_DTR | UART_MCR_RTS | \
> +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> +     UART_MCR_LOOP | UART_MCR_TCRTLR)

Here it's again all non-reserved bits. Yet why do we need #define-s for
the two reserved ones here? (Same question for FCR, even if there's no
UART_FCR_MASK.)

> +/* Modem Status Register */
> +#define UART_MSR_DCTS     0x01    /* Change in CTS */
> +#define UART_MSR_DDSR     0x02    /* Change in DSR */
> +#define UART_MSR_TERI     0x04    /* Change in RI */
> +#define UART_MSR_DDCD     0x08    /* Change in DCD */
> +#define UART_MSR_CTS      0x10
> +#define UART_MSR_DSR      0x20
> +#define UART_MSR_RI       0x40
> +#define UART_MSR_DCD      0x80
> +#define UART_MSR_CHANGE \
> +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> +#define UART_MSR_STATUS \
> +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)

Here it's properly two subsets.

> @@ -111,6 +142,7 @@
>  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
>  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
>  #define UART_LSR_ERR      0x80    /* Error                */
> +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)

But what's the deal here? Why would only two of the bits be covered?

Jan

