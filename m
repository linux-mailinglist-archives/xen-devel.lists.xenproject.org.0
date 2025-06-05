Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE7ACED5F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006520.1385711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7eT-0000ke-34; Thu, 05 Jun 2025 10:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006520.1385711; Thu, 05 Jun 2025 10:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7eS-0000hj-Ut; Thu, 05 Jun 2025 10:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1006520;
 Thu, 05 Jun 2025 10:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN7eR-0000bz-6a
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:16:47 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2a90b5-41f6-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:16:42 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451e24dfe1aso6520445e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:16:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb1698acsm14044195e9.3.2025.06.05.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:41 -0700 (PDT)
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
X-Inumbo-ID: 2d2a90b5-41f6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749118602; x=1749723402; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3GxvxBRsmWqiepq7gu93Re1Z2R4+OHqreQ8ElaKrJ0=;
        b=jLSmrfrQyIvvTC3zkpw/YZIALWPTAr8Hm4w4B/nhVguqsH1NzIrge0f4VFBeFfix1J
         MBj189Koa5LOqnnDIZSODuuNlTczCF5Spdyk/6aM0yC9hRr5fYBjkwn+B8NVa4uU/Q3A
         /jxnucueS6tPeAtREhIct0nNN+9c815SQ7zD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118602; x=1749723402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3GxvxBRsmWqiepq7gu93Re1Z2R4+OHqreQ8ElaKrJ0=;
        b=ZMsJJQUWGXme7tlvuWK6aXYzkRzqFycyPV4MJ17Jo/aGAxqcRaHjtrrAamIUckAFUq
         jfm+NmXKMiRl6uPd/WJ/1SJJHI8V3JN9t9lk9efxMGocaCk2DlBqLiSkvsgFXHE9C2rD
         c0qd09PfZDKga6bhqGLDTPwth3XHBKF3NwA8oSOgAZKkfPkzWs7Tsb1Cec+fMGjsPh0k
         4ENfjFHzIR3ugwR9f+UmrbSvfULvAmJSqGRQcu54+X52a+zAvoJlgujRI0OfyNARF1Tt
         cEyOrdsnSDNgWiqXaTxzUABUahecbCKjx5dy7Jv2XjrM5LvSM3aIEVD372sTHGXcj3ji
         uexA==
X-Gm-Message-State: AOJu0Ywxe1fjX+k4BfZXbi+JD9gIJw+pfo2WSI+SkLCVgs/d5H0JsS0V
	3TZHW7jaU0y8T5AcZCNl6+MI0t0/NvR09DROCKEzwAB+p4al17Q2N0JafWDFA/Lqz1uAzliYRFL
	vcvvz
X-Gm-Gg: ASbGncufPgF21/QP661wb3HsVp1/lCoHGGl9MEEJUM6ZCSOj+AcP40Pp+6/lLPlzpgp
	PKxTycNjXiCnzvAmuym3v+GTn1wJLJaD05pZE0HO0Ulhb8RUdrjb7dPLLqrnJ7AMwaTSabeakM6
	xxASOouByJ/JiKFT1EL21bF3qYEKYry26H7hENJAELcf2sZDc7IIZRtnYJFXLDFWfaN+9OUdIJX
	23QaYyPGL8c0I8wpNAyySN65ZFX1Dr1RPidFSdZ7lnlOfBhA2ezzv9ZvAXg4OgrNR8o86yJzwK3
	UH8EN/0beG/E3aDZlpDla4c0YttYgKNoSiccwUEmyHA8LCd4VKhncpg/s/DBu3T6qQ+/vBaW+MW
	Dy/FrcEiUjMEg5cf40WE=
X-Google-Smtp-Source: AGHT+IHIG9aDx0qOxX+5jggInU+cm2rquprNr0DSjTshmXcWCr/HMJsQ3Iht78hST2uHWFwY7o/DnQ==
X-Received: by 2002:a05:600c:c4a8:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-451f3be8839mr55289855e9.18.1749118601831;
        Thu, 05 Jun 2025 03:16:41 -0700 (PDT)
Date: Thu, 5 Jun 2025 12:16:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/5] vpci: introduce map_bars()
Message-ID: <aEFuiGq5KjrdNUE7@macbook.local>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-4-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531125405.268984-4-stewart.hildebrand@amd.com>

On Sat, May 31, 2025 at 08:54:01AM -0400, Stewart Hildebrand wrote:
> Move some logic to a new function to enable code reuse.

Like with the previous changes, it's helpful if you explicitly note
that no functional change is intended in the commit message (which I
think it's the case here).

> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  xen/drivers/vpci/header.c | 56 ++++++++++++++++++++++++---------------
>  1 file changed, 35 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index c1463d2ce076..b09ccc5e6be6 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -173,11 +173,38 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
>  
> +static int map_bars(struct vpci_header *header, struct domain *d, bool map)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = {
> +            .d = d,
> +            .map = map,
> +            .bar = bar,
> +        };
> +        int rc;
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
>  bool vpci_process_pending(struct vcpu *v)
>  {
>      const struct pci_dev *pdev = v->vpci.pdev;
>      struct vpci_header *header = NULL;
>      unsigned int i;

Maybe I'm missing something, but don't you get complains from the
compiler here about i being unused after this change?

Thanks, Roger.

