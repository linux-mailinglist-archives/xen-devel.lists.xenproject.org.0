Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C484AAF762
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979178.1365866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCy6u-0004Zl-Vi; Thu, 08 May 2025 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979178.1365866; Thu, 08 May 2025 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCy6u-0004Y3-Sh; Thu, 08 May 2025 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 979178;
 Thu, 08 May 2025 10:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCy6t-0004Xx-IP
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:04:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97a3c15-2bf3-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 12:04:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a0b308856fso523389f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 03:04:10 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae3bc0sm20145797f8f.35.2025.05.08.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 03:04:09 -0700 (PDT)
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
X-Inumbo-ID: c97a3c15-2bf3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746698650; x=1747303450; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kgXgZ0DXWJxaajJr81bMwa02w9aWXCTuR1n0s3IJLJM=;
        b=epo+Fx7pciLQoZjisRqKodbnRBx5d9Rfh57krckhYyAk8+Kwnf/LqnLSIb7ag/VcEh
         HVRXu+CwjGAUJ+91vC+GWVm6ng6B2uMWrRxeKupvIrnbnbGS2XFlHBst1JaXGUztFNiN
         W25QVq8FRk9ySBryuoeAXLHL3+7u4Skv9YQtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698650; x=1747303450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgXgZ0DXWJxaajJr81bMwa02w9aWXCTuR1n0s3IJLJM=;
        b=ic7OBh8qWq4zjkcLoydildnuJGQqAUz6+JTcy04qXBlD17k57qTr+bcQGa+UCqFZ4I
         gZrvbhA9o1b+Y5scK7o/Ys5kOTKCQSBJ05PBAtZGNJ1boc3tqwA6JzZGSG+k1pD/yP/T
         FaTgg5IM17Fy3wNqP+ODyJzIeq5zTV9dXN/ry2gpWGjmvxagvqn5hCquF1uI/q239Q7s
         OCPZ40/hCYxsZdjheNRS6xeifg+212ym0MNKaUBlyyijHRqCWUQcA/kvGsnToSS4CV/8
         X23vEHkXvZPuapV2hXrImdLeVQmjM7BMfH6cu5xAWMB5b/zNZiMqBrO0H4xcSCc5vxGs
         GNLQ==
X-Gm-Message-State: AOJu0Yzf3hXGQBR7tSnY2YvxjbBMKBcmkjrYRHYNoITqUlkbfbZKorEe
	WsoSv4guGMiW/34Exqris9KUbvhgGcLqfqvVVcWzO6bmBbn80re49+k/hJULTxI=
X-Gm-Gg: ASbGncvn1t0qGSQyDU0nfRxNKEIixww023jttKTtjNpr3FfwJvsxhz1UAQ3Rmf/qG5n
	oosQKbhZYsLUs9K5W+Kw1tpHjuxeXa7OiFZKwvzVhINH/ND1r2scFEhdODs/U6SbR7btKYk+zZq
	KAtV1JzG/7CkYMHumC8QNM2+94P1LzxbOqsxKnc1E5/WiyNtXIeq7WqAv1hOYLR6X3X+y0EZuva
	TxjUGMS0PdqOBGwYN84CtIVPS84HhbyB/W+fZZiTnsKkTK7WAjaK/sgR8Mupxr2D29phql+0v6L
	DoFyJiamayAO+EeWchLQJE+rQ7/lduVe0lENB57uGhbkUg==
X-Google-Smtp-Source: AGHT+IGbDQ0/Wqwhd5EVuJhdT5BBr1UIYsMnp09zDFBU75xIjLjjGqNZWe2xVrNHBJIO8y8vYdLTKQ==
X-Received: by 2002:a5d:5c84:0:b0:391:2932:e67b with SMTP id ffacd0b85a97d-3a0ba0b6da1mr1729572f8f.35.1746698650094;
        Thu, 08 May 2025 03:04:10 -0700 (PDT)
Date: Thu, 8 May 2025 12:04:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 11/11] vpci/msix: Add function to clean MSIX resources
Message-ID: <aByBmNc8s2yZigZZ@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-12-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-12-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:19:03PM +0800, Jiqian Chen wrote:
> When init_msix() fails, it needs to clean all MSIX resources.
> So, add a new function to do that.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v2->v3 changes:
> * Remove unnecessary clean operations in fini_msix().
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msix.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 0228ffd9fda9..e322c260f6bc 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -703,6 +703,25 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static void fini_msix(struct pci_dev *pdev)
> +{
> +    struct vpci *vpci = pdev->vpci;
> +    unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( !msix_pos || !vpci->msix )

That's not fully correct here.  See how in init_msix() vpci->msix is
set at the tail of the function, after having added the register
handlers.

I think you instead want:

if ( !msix_pos )
    return;

vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);

if ( !(vpci->msix )
    return;

list_del(&vpci->msix->next);
...

> +        return;
> +
> +    list_del(&vpci->msix->next);
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +        if ( vpci->msix->table[i] )
> +            iounmap(vpci->msix->table[i]);
> +

Since you have added to all previous cleanup functions, do you also
need a comment here to mention the capability header is not handled?

TBH I'm not sure whether that's relevant in the context here (and
other cleanup functions), as the capability header traps are not added
by the REGISTER_VPCI_{LEGACY,EXTENDED}_CAP() init hooks either, so it
would seem asymmetric for the cleanup hook to attempt to remove those
in the first place.

> +    vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> +    xfree(vpci->msix);
> +    vpci->msix = NULL;

XFREE();

Thanks, Roger.

