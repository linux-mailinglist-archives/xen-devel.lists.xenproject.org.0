Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B0ACF2E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007037.1386315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCNe-0007vi-O7; Thu, 05 Jun 2025 15:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007037.1386315; Thu, 05 Jun 2025 15:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCNe-0007t8-LD; Thu, 05 Jun 2025 15:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1007037;
 Thu, 05 Jun 2025 15:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNCNd-0007t2-GB
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:19:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8298e3eb-4220-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 17:19:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so12809055e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:19:44 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f97f797bsm29144615e9.1.2025.06.05.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:19:43 -0700 (PDT)
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
X-Inumbo-ID: 8298e3eb-4220-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749136784; x=1749741584; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZsVi9mFdE9OELkvO8XwzTUIVclaZPprJgsLHYTAHtCo=;
        b=NIcYfn0Cjqu6hyeitzs1pWasbtB+wYF7NO27CCZLl0M2Qrzk6PfeVksrUQx4i1+P7j
         xcUEStZWIW70ClPFl5KbQp/YZ7r9dCCzp1WptGdWR4sOO/UtnNbWHgllhb0dbeM93RTF
         sJk61XOgfb3NC9vFsOnf1lIyR7bcPs5rirMik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136784; x=1749741584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsVi9mFdE9OELkvO8XwzTUIVclaZPprJgsLHYTAHtCo=;
        b=cat0p7d7XviWX1LpdbBSZg30DdGzee3Rj6kfJvxP2x7TU7F/o6Mqj9uL4w0BLZz8AA
         /KyWxcimhyJiF9BZiuIOOiL6D1sINl3YO4G/5furxzR1n4V0h/HylHMxS//lw7tS/khh
         Mte9AS/FwGV5td7DR9DA/XdJKdxXwTCbWsIq1l/vjamlChHP732ejkFNdJpzTE9tvRHh
         ocyTXhwQqEDkBuIBRDL9ZK5CMuyS3PJrVunnL8rJYLqoLU4LMDTRkfELLvPZ3RtIIbkl
         tz8Teu+cIjpfBl1tOwE8k+2pkQK9cB//CuxZiysW0UilWm0n50cRxEkoKb805vdca8kU
         W0Sg==
X-Gm-Message-State: AOJu0Yw5cTAu6tZHpOXQJu/CN+3yRDEz6NuSNF+qToito+nQXJeqaoe5
	UxF5CyrzcEra3IGq8DC/8FHJfXslH651WASoicA5EN++8f7cJf+AFOwqjrPH0P8j7Kg=
X-Gm-Gg: ASbGnctT2/X1ae0AtO29P0/CF2O1Mj2NwqQ59h0p+y3cW4RgJcs6ybfpnXSdgdMD07s
	bhxfUwgmObjv6SmvjGm6ZzU3OW4xK2h55q8F1WZzfsA3W5NBiTngjbJOaEmFN61mHa3s6rpbNDT
	Im4/T3ZhJDHrUGJBGpiUUtG2zkAsOWNOu3GTFSpkhDxVJkaPuLRCZ3plJh3WvnjH1OYyyZf1Au1
	vPKwd+yeHM1YYWMVnl/5V+lgBcwv+dXyWzf8xcXKGsc6oimk4QT4szzYURcvp7Qfried6uCLvif
	d6lSTRd9gPlbFKdnmmAjU43SwRxEk2CkjoCRdbdub0ZGluniZmC5Lm2qXGPZXi7puQoivZa6KH6
	vp1NZWYx2/Q9rCgI1diNC9Abhaqi0BA==
X-Google-Smtp-Source: AGHT+IEkbeKljRtN+ExWUey35MAcaufZT76wMhPkdP1lxGimX8xCjmOBuX+YWDBe+mhWjN7cXhhKaw==
X-Received: by 2002:a05:600c:1c94:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-451f0b0cfc6mr65476455e9.19.1749136783911;
        Thu, 05 Jun 2025 08:19:43 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:19:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aEG1jgbVJGF7HxzI@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-10-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-10-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:58PM +0800, Jiqian Chen wrote:
> When init_msi() fails, current logic return fail and free MSI-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide MSI capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of MSI.
> 
> To do that, implement cleanup function for MSI.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v4->v5 changes:
> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi" since cleanup hook is changed to be int.
> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
> 
> v3->v4 changes:
> * Change function name from fini_msi() to cleanup_msi().
> * Remove unnecessary comment.
> * Change to use XFREE to free vpci->msi.
> 
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
>  xen/drivers/vpci/msi.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 2d45c7867de7..4e106c39efae 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(struct pci_dev *pdev)
> +{
> +    int rc;
> +    unsigned int end, size;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )

Possibly same request as the previous patch, msi_pos should be after
the PCI standard header.

Thanks, Roger.

