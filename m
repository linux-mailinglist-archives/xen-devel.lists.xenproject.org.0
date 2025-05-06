Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A97CAACAFA
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977556.1364535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLAb-00077G-NJ; Tue, 06 May 2025 16:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977556.1364535; Tue, 06 May 2025 16:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLAb-00075U-KA; Tue, 06 May 2025 16:29:25 +0000
Received: by outflank-mailman (input) for mailman id 977556;
 Tue, 06 May 2025 16:29:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCLAa-00075O-M8
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:29:24 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 447d6efc-2a97-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:29:22 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so228495e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:29:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2aed5e8sm219314395e9.16.2025.05.06.09.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:29:21 -0700 (PDT)
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
X-Inumbo-ID: 447d6efc-2a97-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746548962; x=1747153762; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gLEmCeRhHkfWsc5rFKS7lzRxbqkLvJ9nzlxOV4xFa40=;
        b=uZMO/DNw1XNb+FCnSdXvh0tottZMxb9D4p0bpJ//vqBbYWL2sPZgpLmXdM8Z/dib7T
         y4SZ/Aca04pByDuMphaVGRajoYSKOkbeQhNNusLWdLxH7r7YQ+lgA/dLI1FLIB4Zb08c
         RpElBmma4piZd43jLQ8aHDjdf2q5yCGvuCGq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548962; x=1747153762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLEmCeRhHkfWsc5rFKS7lzRxbqkLvJ9nzlxOV4xFa40=;
        b=vAaKHzYSnVnyuhYhef4WtmXFta6py98hhGzyv0pDnHb6K+PpWqOTslr22O6K4rmWWs
         NQ/6P0SCUkKne0ZWmhMLL9ClOciRPSr3e7oC98Wel0CBLPFSPNCak9eYID0ihhJLQee4
         kgOQkWCpddaSuGMQspwODeihMzdxEXCw0hvpRsBmV853iu7QPQFPxEhbEeP+plc4JR1S
         l2T5i6KTIDF6wsc0d0RZDYC1o93j4pq3hDQ8QJEJO8eEMQxIuWfQeja/UXVzWDWHlcWI
         wP3rk2eV8hQN2nwPfBDvK0gPVqhcm8Je+IOh7eY3teUVw3oRxmudSFwgnOL9sG8yTDI8
         sBtw==
X-Gm-Message-State: AOJu0YzJvxT/AfmJypEseZcwEcK4CgMOPuiVVX136QwseUlKhYsgldiA
	7iUyj91qUJwUdIoNnEM5W/3l/QTnObdJjVNjNs8ltxm3EGXC7QBqVslbvr+Yk6M=
X-Gm-Gg: ASbGncsEiaEWKCfTNv1ogmD8h+yf0vJSbXpgyUuFFZhbAiZXArc0j0XjXAaQGmp3bu3
	ebnbqVvEcYS5aQVSQQI6nVR9RO1y1hLDrvqdZaVraxJghf95hgqxBKPvYiJD0ED7acvppCNbNDQ
	6EQPZgQqttMD+sD/xAubGYip5n/tIPQlrIvT2f3xWqq6RjtVM+1ZIS1w5LQE8s2r/pmniEaDJ4c
	AXU5HmQiK3juB4Ji2Ofx1AeBAEg+sKjLpLy9uG5WPCw1mOi6bTeHJCovGkSHx3NRKm4a5U2IcFl
	12ZUzr+P5BxC9h8NUA1gPb4uRqhxcJ4dmSNZywgmmcMzF0l4mxNhgiBC
X-Google-Smtp-Source: AGHT+IFAj+pA4ZSXGfXmmIHdthc3X6R1zWY8RdfnPGnwRrBr46HvSIS2MJb6Y12Q2lCUaJBRzPh5wQ==
X-Received: by 2002:a05:600c:c1c8:20b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-441d3a91a78mr2650365e9.0.1746548962193;
        Tue, 06 May 2025 09:29:22 -0700 (PDT)
Date: Tue, 6 May 2025 18:29:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 08/11] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <aBo44G-DuEFO4_7S@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-9-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:19:00PM +0800, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a
> range. And vpci_remove_register() is only used for test currently.
> So, refactor it to support removing all matched registers in a
> calling time.
> 
> And it is no matter to remove a non exist register, so remove the
> __must_check prefix.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> ---
> v2->v3 changes:
> * Add new check to return error if registers overlap but not inside range.
> 
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  tools/tests/vpci/main.c |  4 ++--
>  xen/drivers/vpci/vpci.c | 34 ++++++++++++++++++++--------------
>  xen/include/xen/vpci.h  |  4 ++--
>  3 files changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
> index 33223db3eb77..ca72877d60cd 100644
> --- a/tools/tests/vpci/main.c
> +++ b/tools/tests/vpci/main.c
> @@ -132,10 +132,10 @@ static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
>                                    rsvdz_mask))
>  
>  #define VPCI_REMOVE_REG(off, size)                                          \
> -    assert(!vpci_remove_register(test_pdev.vpci, off, size))
> +    assert(!vpci_remove_registers(test_pdev.vpci, off, size))
>  
>  #define VPCI_REMOVE_INVALID_REG(off, size)                                  \
> -    assert(vpci_remove_register(test_pdev.vpci, off, size))
> +    assert(vpci_remove_registers(test_pdev.vpci, off, size))
>  
>  /* Read a 32b register using all possible sizes. */
>  void multiread4_check(unsigned int reg, uint32_t val)
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 8ff5169bdd18..904770628a2a 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -497,34 +497,40 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
>      return 0;
>  }
>  
> -int vpci_remove_register(struct vpci *vpci, unsigned int offset,
> -                         unsigned int size)
> +int vpci_remove_registers(struct vpci *vpci, unsigned int start,
> +                          unsigned int size)
>  {
> -    const struct vpci_register r = { .offset = offset, .size = size };
>      struct vpci_register *rm;
> +    unsigned int end = start + size;
>  
>      spin_lock(&vpci->lock);
>      list_for_each_entry ( rm, &vpci->handlers, node )

You might want to use list_for_each_entry_safe ( ) so that...

>      {
> -        int cmp = vpci_register_cmp(&r, rm);
> -
> -        /*
> -         * NB: do not use a switch so that we can use break to
> -         * get out of the list loop earlier if required.
> -         */
> -        if ( !cmp && rm->offset == offset && rm->size == size )
> +        /* Remove rm if rm is inside the range. */
> +        if ( rm->offset >= start && rm->offset + rm->size <= end )
>          {
> +            struct vpci_register *prev =
> +                list_entry(rm->node.prev, struct vpci_register, node);

... you don't need to find prev here.

>              list_del(&rm->node);
> -            spin_unlock(&vpci->lock);
>              xfree(rm);
> -            return 0;
> +            rm = prev;
> +            continue;
>          }
> -        if ( cmp <= 0 )
> +
> +        /* Return error if registers overlap but not inside. */
> +        if ( rm->offset + rm->size > start && rm->offset < end )
> +        {
> +            spin_unlock(&vpci->lock);
> +            return -EINVAL;

-ERANGE might be more descriptive here.

Thanks, Roger.

