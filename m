Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE5A89B6A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953536.1348081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4e7H-0001xL-T3; Tue, 15 Apr 2025 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953536.1348081; Tue, 15 Apr 2025 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4e7H-0001w5-PT; Tue, 15 Apr 2025 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 953536;
 Tue, 15 Apr 2025 11:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4e7G-0001uT-98
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:06:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1524cac-19e9-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 13:06:07 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso1040331566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 04:06:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1ccd293sm1069872766b.150.2025.04.15.04.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 04:06:07 -0700 (PDT)
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
X-Inumbo-ID: a1524cac-19e9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744715167; x=1745319967; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AjQLZblPzPrKpRkeBz0nnZ5xA2VMF9dphkm+mAAG5SM=;
        b=aE/wiLVFYQNSemHeLfrgm3sbwH/Qn2Pov7BZK7ZkohL638r9t8g8lOoqzbtP0TAEXA
         YyARl+JfJAVAO7T4e3GXkW1YtLhOFHGPncjVvEA4DeBRy/aET2gLEgz6MjaTBRp1ztmN
         /63FTwTRcr4AC652AoFVGRHzyJ1OYXQeKV7o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715167; x=1745319967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjQLZblPzPrKpRkeBz0nnZ5xA2VMF9dphkm+mAAG5SM=;
        b=bgUJOn6eHKLH79LfvAhn3uNTXPYy56Ihunb2J8ATT3F24PGWgIPqM9FOZTGp8zLM63
         w/Pz7AE1sU/4qpznV3yMxrZ9E/tcpxl5hY15Z3KKq4H0PuDSopjyhNJwXHs+QnJMl7Pi
         TKaH+Py6RVtj8GFBYVDqT2dcjDhPoQ5cwwWuiTyycsRPEffmQP4VyH64QfbcV3RCMs1v
         poaIeKoRdWeYuJGRMdnFI28PeumdIXmBRAtVRx3+9yjWI/DysQ/rWTGwaL5Nw6b5YVzY
         lBgpoUjiTB+gS2eoGztvtsPaFaViV1N9eDQ4/h1g99iuII+tNZ9kxGv7VfAiJi5093s7
         SATw==
X-Gm-Message-State: AOJu0YxLmUcQoBVPBhO0MTaElVA04/BLqQVl4hsfu2GryNRcnc11kTzQ
	pFu7VjXgYcmOf3CYrQ0Bqzj0BqTojQ0hTMpI13Wzw/GdNSQnXeSy+oy/3ZdcECk=
X-Gm-Gg: ASbGnctaAb1OP8ivVJxYUscauWtu4dltkNIrfRLcsyYVwkfD1jlqNbuOZY5qBXg+x6o
	x1OS/bx+ItCwi9uLXahUTFzbtn8GxutvsyKimCvxQsc9AtzR3SW+WUqmaDUdFtBTNg1qlQ+lODb
	SqJFN7b7HEUb5e7sX3fFT2DFKoBl3Un79zS23OdKZbHtzHU/FrOEC8R/tBXVxokwWmF2bo1gvAk
	13S224ehwFcS0uPe1wNpph6LrB1oPUluCfg1lJ7jNezZfuG+h1SMqvVyt8z1RrmsaAHmsh37ELZ
	HPo4rdf93r6JkrBPmTqaoCvZ9f7nDfwtaAQvIgYJUP/7JA==
X-Google-Smtp-Source: AGHT+IFEAj2eQ15rAWd1H6HaL9qN6aRmvUWltjNWFfsmNbvfapiX3oIP0Xtov1RQbY/b2S5Qm6wktg==
X-Received: by 2002:a17:907:9624:b0:ac3:773:62a7 with SMTP id a640c23a62f3a-acad34d94camr1400018466b.31.1744715167573;
        Tue, 15 Apr 2025 04:06:07 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:06:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 5/8] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <Z_49nsZbVU6F2tu0@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-6-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:25PM +0800, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a
> range. And it is only used for test. So, refactor it to support
> removing all matched registers in a calling time.
> 
> And it is no matter to remove a non exist register, so remove the
> __must_check prefix.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> ---
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  tools/tests/vpci/main.c |  4 ++--
>  xen/drivers/vpci/vpci.c | 23 ++++++++++++-----------
>  xen/include/xen/vpci.h  |  4 ++--
>  3 files changed, 16 insertions(+), 15 deletions(-)
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
> index f1f125bfdab1..115d3c5f0c84 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -418,34 +418,35 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
>      return 0;
>  }
>  
> -int vpci_remove_register(struct vpci *vpci, unsigned int offset,
> -                         unsigned int size)
> +int vpci_remove_registers(struct vpci *vpci, unsigned int offset,
> +                          unsigned int size)
>  {
>      const struct vpci_register r = { .offset = offset, .size = size };
>      struct vpci_register *rm;
> +    int rc = -ENOENT;

Thinking about this, not sure returning ENOENT makes much sense now,
as the (new) purpose of the function is to zap all handlers from a
range, without possibly prior knowledge whether there are any
handlers in the range.

>  
>      spin_lock(&vpci->lock);
>      list_for_each_entry ( rm, &vpci->handlers, node )
>      {
>          int cmp = vpci_register_cmp(&r, rm);
>  
> -        /*
> -         * NB: do not use a switch so that we can use break to
> -         * get out of the list loop earlier if required.
> -         */
> -        if ( !cmp && rm->offset == offset && rm->size == size )
> +        if ( !cmp )
>          {
> +            struct vpci_register *prev =
> +                list_entry(rm->node.prev, struct vpci_register, node);
> +
>              list_del(&rm->node);
> -            spin_unlock(&vpci->lock);
>              xfree(rm);
> -            return 0;
> +            rm = prev;
> +            rc = 0;

I think you want some extra checks here to ensure you are not removing
partially overlapping registers.  IOW, you need to assert the register
in rm is fully contained inside the range to zap.

It might be best to simply not use vpci_register_cmp(), and instead
open code the comparison here to ensure "rm" is fuly contained inside
the [offset, offset + size - 1] range.  You will need to return an
error if there's a partially overlapping register.

Thanks, Roger.

