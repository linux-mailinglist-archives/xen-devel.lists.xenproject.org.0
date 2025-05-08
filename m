Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7474AAF741
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979167.1365856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCy01-0002aB-AG; Thu, 08 May 2025 09:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979167.1365856; Thu, 08 May 2025 09:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCy01-0002Y3-7N; Thu, 08 May 2025 09:57:05 +0000
Received: by outflank-mailman (input) for mailman id 979167;
 Thu, 08 May 2025 09:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCxzz-0002Xu-KA
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:57:03 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca5670be-2bf2-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 11:57:02 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso4998625e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 02:57:02 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd3aeb26sm31854645e9.29.2025.05.08.02.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:57:01 -0700 (PDT)
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
X-Inumbo-ID: ca5670be-2bf2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746698222; x=1747303022; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9J6AapbB5p8N5JWDeXHjhdLLqIsTHgOEjGtuldf41eE=;
        b=m2Gq7Mr1yd/LCGeB8rW4bJtcznF8+ds2IRE8EygyEfK0188KwDPCv3qVrK8rCtH0zZ
         4gtA+s1zOtf5/WSxIi9YJJfAOphSa5tzBrc2eE+8nY516xVIaC62gbobr+mF77IZQMtp
         SFZo/mROkwu98Ll1Queplfpdj4TS4QqDo6TnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698222; x=1747303022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9J6AapbB5p8N5JWDeXHjhdLLqIsTHgOEjGtuldf41eE=;
        b=Q/KGkvgXbpRHhEzki7zJHUPd5qL+ygf3qp7L6fir9rLlx0UqjXlLsE6Y0dkhc1yUIY
         NeRNDf3lhq3kqmCMDzkIUG8iUyrwZ/IpFA6hNCOHu0ZQpBSPhtSNUsLQVIprmz//iz2j
         M1VDh0cBTlL2NqWYt4Duo61xKJva4W658G3Js90+YlzpWxsmHX1l8bDJHOp4463zOvlx
         poUmJp+3B+At3gcDImznTUdygPTRZajxpplyMga5gcXL7wO/3lKwgtERLiQ6xsA8crpR
         7wVy5K0J+TtBiDUAboFKMvms0vLoTkmOwXgqWM6DaERvohbM2O6Y/+QP3/cpTJzw++Na
         dBww==
X-Gm-Message-State: AOJu0YxUmfmPqMp1BpJCRiSzwWIjBXNIPrBA4CP4XI4GWBBaYt5L1Z0F
	DW+iYzCgnCrH64aBa1UOF/2zf5FcIadjyRhpP9ehgD9eHWNjIVyPOr0QKJdHZnhv6twDRSINh9k
	7
X-Gm-Gg: ASbGncv6dB5nPq/n/oSBO1svsuslUsy5HHtdnYVdk8H50CHHuErAX4o21Ln/RUcKPgW
	HJrdOq7qURToidsgJbmot8qHDyAAUIjZGWkaDk649WobDPhqBWbDUOhqDPLZiJV+UsfXFWAJ79S
	jJmGV5wvXo1XVPshPa8xIrTxHD1SLv/jt3Vg6a7xGbVqkMwheza4vEsW6szTw1sS7GpsOoZufa0
	2ZJ5vuz8PmUjmgcu2Xlc0LnB3Lx70gYBiLWJSHslAH85xHyXcAhGpzh751+W1nKXFl74+3IIvZJ
	GV5geIG3/n4T4wCs5GGoa5dF97sxvdlrzCm5B1FPCch0uw==
X-Google-Smtp-Source: AGHT+IFFDzCXLJ4mIqALaM/bWqd/AxEMPWtd+Ja0S/+1NXtvXDYhfo5KF4zy5V1sXbhwy03p5rTIZw==
X-Received: by 2002:a05:600c:154e:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-441d44dd248mr48529085e9.26.1746698222056;
        Thu, 08 May 2025 02:57:02 -0700 (PDT)
Date: Thu, 8 May 2025 11:57:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 10/11] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aBx_7GwcFa5kLjKH@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-11-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-11-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:19:02PM +0800, Jiqian Chen wrote:
> When init_msi() fails, the previous new changes will hide MSI
> capability, it can't rely on vpci_deassign_device() to remove
> all MSI related resources anymore, those resources must be
> cleaned up in failure path of init_msi.
> 
> To do that, add a new function to free MSI resources.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v2->v3 changes:
> * Remove all fail path, and use fini_msi() hook instead.
> * Change the method to calculating the size of msi registers.
> 
> v1->v2 changes:
> * Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msi.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index ea7dc0c060ea..18b06b789827 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,32 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static void fini_msi(struct pci_dev *pdev)
> +{
> +    unsigned int end, size;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return;
> +
> +    if ( vpci->msi->masking )
> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> +    else
> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> +
> +    size = end - msi_control_reg(msi_pos);
> +
> +    /*
> +     * Remove all possible registered registers except capability ID
> +     * register if guest and next capability pointer register, which
> +     * will be removed in mask function.

The above text seems very convoluted.  I prefer re-using the same
comment that you had in the ReBAR cleanup helper:

    /*
     * Remove all possible registered registers except header.
     * Header register will be removed in mask function.
     */

> +     */
> +    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
> +    xfree(vpci->msi);
> +    vpci->msi = NULL;

XFREE(vpci->msi);

Will be more compact.

Thanks, Roger.

