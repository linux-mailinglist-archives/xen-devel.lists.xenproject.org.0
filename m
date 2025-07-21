Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E4B0C87F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051653.1420026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtGd-0004Ps-DH; Mon, 21 Jul 2025 16:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051653.1420026; Mon, 21 Jul 2025 16:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtGd-0004NC-9n; Mon, 21 Jul 2025 16:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1051653;
 Mon, 21 Jul 2025 16:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udtGc-0004N6-4T
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:21:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0bec9c3-664e-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 18:21:27 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso46962295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:21:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b5a4e40sm107671655e9.6.2025.07.21.09.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 09:21:26 -0700 (PDT)
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
X-Inumbo-ID: c0bec9c3-664e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753114887; x=1753719687; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7zZkUesyQs1SqO2FF1AzEl1q1TanVfzpIuhvardXhs=;
        b=OolJCGHfch6pP39VKyOE1NwTA8AVbEX8vfcWeTduED6lOKzxjsn0G60dZYbpN24DsG
         6UUfg6YvgBtb+HpnkrSY+mRK80Vk3qOt0UDVhSZ+cILyLw4GhC2qvbeMt/nLcDuTJ3Ha
         KAylcSxg38Mu64P+8/mu62KFWLZGW8n7Cdeqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114887; x=1753719687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7zZkUesyQs1SqO2FF1AzEl1q1TanVfzpIuhvardXhs=;
        b=sFdM5ijbc7hJ+hibCTewMyHnm8F5bzDriRQoD2wUSlez8i0GXzYv4yAxnhlWA9sK26
         8htMb9B3EB6RNSttvEGtB7LVCwM2MS1Dvg2HDBEnZtOKFHanoOsuvxxLLqTjzLdTJZyU
         jT356dkyXgQdL2AC0xB5Plfz/jUbgyIsaeg3ua3ATBcqHiW7JFsLS4JPxp/KzD6p8Ujo
         wY/sYwCRvrgvOgR+cvH89eKErk3WMP9+0XTkHCHU2gZXeW0sw2haWFSmd8EZScJqB1Ec
         4LT7o2uoGidQAk5OqWAlPpVxg41bsHdhg2o/3IaJiNqX/pBUbLhGxprwTuBnWF07AvBy
         B9uw==
X-Gm-Message-State: AOJu0YzDnwfaVAEPEvlcTVJOrHmOvxgoVXeuI9NEtSAnakEOlW7vEcs/
	JpuA74Vzwu+mdMlL1QZRf05RPTFFwR27E3CfzGHuOB7mB0PpZVXrJA468X4cTrn8Iv4=
X-Gm-Gg: ASbGnctZHIvDZS0mLT4S2nJwNYPn0pHblMbTt25lnw+3YPmD0PfuLRMrWfqfunscJSm
	ltyf84hpJHlGG0XNWdcleiTX7Sls2c09tfXK9Zwceq4gcxY8U2Qx6NiPxBYVOG5YqfRt9UYgFpn
	mAs5hZrFr/O2XinuOWzFnl1VvX9oN5HgWAby8bpMOK5crNDKtrIkT6KVDjL8DZQeqIR8FIRzvNS
	B05AjFB9KieG4pdnYI7Al6MIkMddpW/gMPB2ogtRT5Fcv8Hz+kkUYNWkpTss5fQQgR0Q+Z5kV6o
	uXE7Q7ZYKtcW79iF4+YUFzeRXMT0oVZuKUqwiNGW1CYNh0u1L5McPLEC2wrCJCtnKmlDvCQVFKD
	qiqVqaRuI9nYAETodfPongKxL1T62Zy0eASyJv8gkAMt0zMbeEvmrGLCWS048QJhUCg==
X-Google-Smtp-Source: AGHT+IFq1wDfEurTffQgEODPHVPr1qsEAGsbna9uPJsdd0OTQEqYFVDSyLzcCbUjv5THGEIScF679Q==
X-Received: by 2002:a05:600c:3b1e:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4562e321debmr218880485e9.0.1753114886929;
        Mon, 21 Jul 2025 09:21:26 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:21:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi() fails
Message-ID: <aH5pBWm0xhQR_-XN@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-8-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-8-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:08:02PM +0800, Jiqian Chen wrote:
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
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msi() to be const.
> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>   directly, instead try to free msi and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>   init_msi() since we need that every handler realize that msi is NULL
>   when msi is free but handlers are still in there.
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
>   since cleanup hook is changed to be int.
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
> * Added a new function fini_msi to free all MSI resources instead of using an array
>   to record registered registers.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msi.c | 111 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 94 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index c3eba4e14870..09b91a685df5 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -25,7 +25,11 @@
>  static uint32_t cf_check control_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return pci_conf_read16(pdev->sbdf, reg);
>  
>      return MASK_INSR(fls(pdev->msi_maxvec) - 1, PCI_MSI_FLAGS_QMASK) |
>             MASK_INSR(fls(msi->vectors) - 1, PCI_MSI_FLAGS_QSIZE) |
> @@ -37,12 +41,16 @@ static uint32_t cf_check control_read(
>  static void cf_check control_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> +    struct vpci *vpci = data;
> +    struct vpci_msi *msi = vpci->msi;
>      unsigned int vectors = min_t(uint8_t,
>                                   1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
>                                   pdev->msi_maxvec);
>      bool new_enabled = val & PCI_MSI_FLAGS_ENABLE;
>  
> +    if ( !msi )
> +        return;
> +
>      /*
>       * No change if the enable field and the number of vectors is
>       * the same or the device is not enabled, in which case the
> @@ -101,7 +109,11 @@ static void update_msi(const struct pci_dev *pdev, struct vpci_msi *msi)
>  static uint32_t cf_check address_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return ~(uint32_t)0;
>  
>      return msi->address;
>  }
> @@ -109,7 +121,11 @@ static uint32_t cf_check address_read(
>  static void cf_check address_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> +    struct vpci *vpci = data;
> +    struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return;
>  
>      /* Clear low part. */
>      msi->address &= ~0xffffffffULL;
> @@ -122,7 +138,11 @@ static void cf_check address_write(
>  static uint32_t cf_check address_hi_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return ~(uint32_t)0;
>  
>      return msi->address >> 32;
>  }
> @@ -130,7 +150,11 @@ static uint32_t cf_check address_hi_read(
>  static void cf_check address_hi_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> +    struct vpci *vpci = data;
> +    struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return;
>  
>      /* Clear and update high part. */
>      msi->address  = (uint32_t)msi->address;
> @@ -143,7 +167,11 @@ static void cf_check address_hi_write(
>  static uint32_t cf_check data_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return ~(uint32_t)0;
>  
>      return msi->data;
>  }
> @@ -151,7 +179,11 @@ static uint32_t cf_check data_read(
>  static void cf_check data_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> +    struct vpci *vpci = data;
> +    struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return;
>  
>      msi->data = val;
>  
> @@ -162,7 +194,11 @@ static void cf_check data_write(
>  static uint32_t cf_check mask_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msi *msi = vpci->msi;
> +
> +    if ( !msi )
> +        return ~(uint32_t)0;
>  
>      return msi->mask;
>  }
> @@ -170,9 +206,14 @@ static uint32_t cf_check mask_read(
>  static void cf_check mask_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> -    uint32_t dmask = msi->mask ^ val;
> +    struct vpci *vpci = data;
> +    struct vpci_msi *msi = vpci->msi;
> +    uint32_t dmask;
> +
> +    if ( !msi )
> +        return;
>  
> +    dmask = msi->mask ^ val;
>      if ( !dmask )
>          return;
>  
> @@ -193,6 +234,42 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(const struct pci_dev *pdev)
> +{
> +    int rc;
> +    unsigned int end;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return 0;
> +
> +    if ( vpci->msi->masking )
> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> +    else
> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> +
> +    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
> +    if ( rc )
> +        printk(XENLOG_WARNING "%pd %pp: fail to remove MSI handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

I think you could possibly do this as:

if ( rc )
{
    printk(...);
    ASSERT_UNREACHABLE();
    return rc;
}

Given the code in vpci_remove_registers() an error in the removal of
registers would likely imply memory corruption, at which point it's
best to fully disable the device.  That would allow you having to
modify all the handlers to pass vpci instead of msi structs.

That will avoid a lot of the extra code churn of having to change the
handler parameters.

Thanks, Roger.

