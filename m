Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C2A7325D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929187.1331807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmUp-0004E9-SX; Thu, 27 Mar 2025 12:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929187.1331807; Thu, 27 Mar 2025 12:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmUp-0004By-OK; Thu, 27 Mar 2025 12:38:07 +0000
Received: by outflank-mailman (input) for mailman id 929187;
 Thu, 27 Mar 2025 12:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txmUo-0004Bs-Hy
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:38:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d72c3f-0b08-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 13:38:04 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so1549901a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:38:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5ebcd0c77edsm10978496a12.54.2025.03.27.05.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 05:38:03 -0700 (PDT)
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
X-Inumbo-ID: 53d72c3f-0b08-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743079084; x=1743683884; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VJYxFHeg1VCRZzfLOwIFLprBScMkKlp2x4DCw50CXs=;
        b=qL9HrYUHuarHpVYHDBcSaHB/5OcQARUzAzPbTqEmXLyHJQo6ClbNcYWkSnNC2LP1QU
         /ldYzn6YcouMRkD+bpGNoBh+J7NVofQT/aZYrGVaAp4UgZdGHKeNPi11ZhDOomJgywgy
         JlC8OXXDsxuG+mX8FraE4OPdO64bGAXYJCBOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079084; x=1743683884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VJYxFHeg1VCRZzfLOwIFLprBScMkKlp2x4DCw50CXs=;
        b=ifd0X7coFlMfADAPJsr32L8T9OJoETCJRx6ygtojz989MXzmTjbag/NBTAfEDtezKM
         MhOnaiHHvsOxH79FCaJqbgfIGwwhlSpt7P8sMnnSG1FuFuNFBOzAX2vrqaEnklFzl579
         V8MRvkQ/6rjCwVYdYqbs8HEhGtLN25hVQJTLEix7cos4owOWdDMHyBqQ+ExD8mdB4LPZ
         9rPjQIYGyfs+/+uzKiuCU39GFzug2IJUR0vImOHk+gulqLXU4LQTa+pLAbgGm5wO2QVh
         uXFJFQifenAOqoRhFcHR/uSzBa9ryvZQFDzxvmlNujH7avHWThy2tWC/aMMrgJzh8och
         IWiQ==
X-Gm-Message-State: AOJu0YzidFqJEnX6eIWfNsBJjk5rutt6E7lQ/ToAAjN8rheee5otJ9YU
	gFBS6IN/ujlgfJFr+X+M3jg1xO0rc8WcoaffShOgQnwtm3VfehgB1kMPGmKO/cA=
X-Gm-Gg: ASbGncs/HIM6uw4wFEsNiV2x33uHtIgWxRctoVZVNzoyMhxUzr8SF1PGf35nMUEFtDJ
	NItPegoFZyCbRTrmTz81hj69WZ0xlOtHc60pmCeOPXi8J+Yf1/zHUrPtf0GJnTo/vGZMSpV3toi
	eszvxMY8TJfyfuWW1RUeZCBxxOieJ70gRw6gvLd6qexXSm7cCECXoQXUKVOzFzacea474RzlE5M
	rHN+XwoI3iIkVzqRVBgUNg6YMN/LfA4Ti38Pm6goh4XJ+r12p1NPMCe/5Mjtr8BhwP83tn/WkwB
	/6LHlTvzEhiH1f8YzBbGzLSxr+/SfR5+7FhMcZGmJyQS5gLJIA==
X-Google-Smtp-Source: AGHT+IEe9GW4m9OdgCdh/aiB4Cr6WL4UQiQeYU2ArCrjIZ6HLxm3189YjEy/Y5Avxl3eJEUUjLHKig==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr2771178a12.2.1743079083663;
        Thu, 27 Mar 2025 05:38:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:38:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v1 2/3] vpci/rebar: Remove registers when init_rebar()
 fails
Message-ID: <Z-VGqlvcimLkVkwL@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327073214.158210-2-Jiqian.Chen@amd.com>

On Thu, Mar 27, 2025 at 03:32:13PM +0800, Jiqian Chen wrote:
> When init_rebar() fails, the new codes will try to hide Rebar
> capability, so it can't rely on vpci_deassign_device() to remove
> all Rebar related registers anymore, those registers must be
> cleaned up in failure path of init_rebar.
> 
> To do that, use a vpci_register array to record all Rebar registers
> and call vpci_remove_register() to remove registers.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/drivers/vpci/rebar.c | 33 ++++++++++++++++++++-------------
>  xen/drivers/vpci/vpci.c  | 14 --------------
>  xen/include/xen/vpci.h   | 15 +++++++++++++++
>  3 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 7c53ee031887..5f2f9978feb9 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -51,8 +51,11 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>  
>  static int cf_check init_rebar(struct pci_dev *pdev)
>  {
> +    int rc = 0;
>      uint32_t ctrl;
>      unsigned int nbars;
> +    unsigned int reg_index = 0;
> +    struct vpci_register registers[VPCI_CAP_MAX_REGISTER];

I'm not sure I like this approach much, as it seems to be quite
cumbersome.  Iff we really want to go that route I would recommend
that you use a much lighter structure here, struct vpci_register has a
bunch of fields that are not used at all by the purposes here.  You
just want a struct with and offset and a size fields.

>      unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
>                                                          PCI_EXT_CAP_ID_REBAR);
>  
> @@ -70,17 +73,17 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>      nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>      for ( unsigned int i = 0; i < nbars; i++ )
>      {
> -        int rc;
> +        const unsigned int offset = rebar_offset + PCI_REBAR_CTRL(i);
>          struct vpci_bar *bar;
>          unsigned int index;
>  
> -        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> +        ctrl = pci_conf_read32(pdev->sbdf, offset);
>          index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
>          if ( index >= PCI_HEADER_NORMAL_NR_BARS )
>          {
>              printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            goto fail;
>          }
>  
>          bar = &pdev->vpci->header.bars[index];
> @@ -88,24 +91,19 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            goto fail;
>          }
>  
>          rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> -                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> +                               offset, 4, bar);
>          if ( rc )
>          {
>              printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
>                     pdev->domain, &pdev->sbdf, index, rc);
> -            /*
> -             * Ideally we would hide the ReBar capability on error, but code
> -             * for doing so still needs to be written. Use continue instead
> -             * to keep any already setup register hooks, as returning an
> -             * error will cause the hardware domain to get unmediated access
> -             * to all device registers.
> -             */
> -            continue;
> +            goto fail;
>          }
> +        registers[reg_index].offset = offset;
> +        registers[reg_index++].size = 4;
>  
>          bar->resizable_sizes =
>              MASK_EXTR(pci_conf_read32(pdev->sbdf,
> @@ -117,6 +115,15 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>      }
>  
>      return 0;
> +
> + fail:
> +    for ( unsigned int i = 0; i < reg_index; i++ )
> +        if ( vpci_remove_register(pdev->vpci,
> +                                  registers[i].offset,
> +                                  registers[i].size) )
> +            continue;

Keep in mind it's fine to remove registers that are not there, iow you
could possibly do:

for ( unsigned int i = 0; i < nbars; i++ )
    if ( vpci_remove_register(pdev->vpci, rebar_offset + PCI_REBAR_CTRL(i),
                              4) )
        continue;

And it would be fine IMO, without the need to store exactly which
registers have been added.  It's not like there's much that can be
done from vpci_remove_register() failing in this context.

In fact you can remove the __must_check from vpci_remove_register(), I
don't think it's helpful at all.

> +
> +    return rc;
>  }
>  REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, VPCI_PRIORITY_LOW);
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a8362e46e097..ea81d8cc9604 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -21,20 +21,6 @@
>  #include <xen/vpci.h>
>  #include <xen/vmap.h>
>  
> -/* Internal struct to store the emulated PCI registers. */
> -struct vpci_register {
> -    vpci_read_t *read;
> -    vpci_write_t *write;
> -    unsigned int size;
> -    unsigned int offset;
> -    void *private;
> -    struct list_head node;
> -    uint32_t ro_mask;
> -    uint32_t rw1c_mask;
> -    uint32_t rsvdp_mask;
> -    uint32_t rsvdz_mask;
> -};
> -
>  #ifdef __XEN__
>  extern vpci_capability_t *const __start_vpci_array[];
>  extern vpci_capability_t *const __end_vpci_array[];
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index fa13397ae409..19a036c22165 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -214,6 +214,21 @@ struct vpci_vcpu {
>      bool rom_only : 1;
>  };
>  
> +#define VPCI_CAP_MAX_REGISTER 10

That 10 is kind of arbitrary...

Thanks, Roger.

