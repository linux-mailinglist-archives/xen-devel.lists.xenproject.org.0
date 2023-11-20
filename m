Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24797F16B8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 16:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637031.992721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55rd-0004vm-8G; Mon, 20 Nov 2023 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637031.992721; Mon, 20 Nov 2023 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55rd-0004sV-5a; Mon, 20 Nov 2023 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 637031;
 Mon, 20 Nov 2023 15:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r55rb-0004sN-5l
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 15:07:03 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 753b2297-87b6-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 16:07:01 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so3352281f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 07:07:01 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b0040a4835d2b2sm18559042wms.37.2023.11.20.07.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 07:07:00 -0800 (PST)
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
X-Inumbo-ID: 753b2297-87b6-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700492821; x=1701097621; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYbNEj6nnd8wC2KXw22FbWZHbNjLNWL/PTFK924pEe0=;
        b=XRxQ1zgf2KNiV/zWE/QLsdMS2PY3spNEVis/kqbu5Ez9IV+CXOHXkOduLEgKIk0qfX
         I0/AaE1nwc3fb1ExaCpV+AO2DjxeGlrH7u2zGX43AP6RUhG1lGBaE38VcPYFCvgw4DG/
         j3kXTH/POA1LgLHiN6KKaG48PpduAFs+7zTII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492821; x=1701097621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYbNEj6nnd8wC2KXw22FbWZHbNjLNWL/PTFK924pEe0=;
        b=QdbxR/xn86Cc/trKhrHscPLPbyZ1hEcqHR1p2YiAyoyx7LyIyBSUVYy8o5FxOY3TT1
         PrT/FOXdnnuiyoitGYV7w+M89M1lwKihRWxhEySsIyJ5JNVBkkuHqrUP8Py4pYvOIq2C
         NMkugu2FLhnjYTwsBn5d6q0e3nqNm1QIQyJxBvFRBtQ9p2snOtlaBC4GSnQ+vt54WFvK
         ka8rsaFwyafwk2ovh6IlL3ApMBDGFxHtQ3HNnA+v8l3mL3weaJlqlLdVP+hKjA2Gd3vM
         cYj1ozMDilbQYNQ6mGrbVNzlA895ccWKysBiOwuUDPURdTnJppEG1scIhms92bPcwhov
         t8Aw==
X-Gm-Message-State: AOJu0Yycu5t2juL8P+hWkhkl9Vbxy1wWxz8VIdxcKL7h9GLqsHWAN5A+
	OCNEjisACaG2MzWJJSjzcExcCCoBahIM+Pb6FHw=
X-Google-Smtp-Source: AGHT+IHZGdbt+R4UWBAaTlZLOmcD6YmBCeVqIhtTu3zxvwt6CLwRA0wLsXXC3dut9jMwQTVQCgR/4w==
X-Received: by 2002:a05:6000:1445:b0:332:cb0e:73b6 with SMTP id v5-20020a056000144500b00332cb0e73b6mr1579470wrx.2.1700492821154;
        Mon, 20 Nov 2023 07:07:01 -0800 (PST)
Date: Mon, 20 Nov 2023 16:07:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v10 06/17] vpci/header: rework exit path in init_bars
Message-ID: <ZVt2FHPtfxXHzMtq@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-7-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012220854.2736994-7-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:16PM +0000, Volodymyr Babchuk wrote:
> Introduce "fail" label in init_bars() function to have the centralized
> error return path. This is the pre-requirement for the future changes
> in this function.
> 
> This patch does not introduce functional changes.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> --
> In v10:
> - Added Roger's A-b tag.
> In v9:
> - New in v9
> ---
>  xen/drivers/vpci/header.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 176fe16b9f..33db58580c 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -581,11 +581,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>              rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
>                                     4, &bars[i]);
>              if ( rc )
> -            {
> -                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -                return rc;
> -            }
> -
> +                goto fail;

One nit that can be fixed at commit IMO, could you please avoid
removing the empty line between goto fail; and continue;?

Thanks, Roger.

