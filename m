Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873F7EF208
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635080.990817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xH6-0005H9-5u; Fri, 17 Nov 2023 11:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635080.990817; Fri, 17 Nov 2023 11:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xH6-0005FF-3L; Fri, 17 Nov 2023 11:44:40 +0000
Received: by outflank-mailman (input) for mailman id 635080;
 Fri, 17 Nov 2023 11:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3xH4-0005F9-M3
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:44:38 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeafc375-853e-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 12:44:36 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso24620511fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 03:44:36 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c500d00b004083996dad8sm6919097wmr.18.2023.11.17.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 03:44:35 -0800 (PST)
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
X-Inumbo-ID: aeafc375-853e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700221475; x=1700826275; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6acT+zOE4DVW55AXMKMPraaarh0Wr+IxcAkBMw7xQYk=;
        b=gthb8S14/kzMHOuCJQ3I5uh6qh0iNsHoGj+IM7w4fJxnTkolU3XzYUD+w6d7r5yFiP
         kRDs5/3m1w8JkOlGY0BmgeJSdavdLZ/SlHJqSf7eaW4l/sEgjooCt7IiwSgxAoTMlaFu
         +oBRwmANZx/fK8xmbFhpUtf1SnpUYnXmtRmX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700221475; x=1700826275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6acT+zOE4DVW55AXMKMPraaarh0Wr+IxcAkBMw7xQYk=;
        b=dwd25gZJKdv1I3iPk/ru9CajteBR4dRIQXfE6pxQE9Q/GxNrg6RCgJEsdMM0/WCOg9
         pWTE9KMkq4uwTMKc0ohbuJIaf9XeKYT9Op0dKhjW/XyrMyn34RkWTzb1pzfcjvj+3TnZ
         48XmYQYQUZlAF+/bKu4wsmHPOjmJYzDzOxhE3EVnEAbAbNStXzvncaoqA4EliyTBDcoS
         FDqa3X36a5ekr74HnfDL2SL+O7sQwHdMsLcnBykkSM1lj2kKTkhINtL4TrY76X0iWIpZ
         ELJCgh2vH81jT33iG0PsDyTT2TBaPOF1xLCd6r8alctpFFgYQ3u/UHsZMW/rZVr6K1Ze
         PiXA==
X-Gm-Message-State: AOJu0YzewxSmnyO6Sslei0uJRoZy5/AriKDuxfqRv0/kvzh4CQoRfqTv
	vPzM8NalqtPzju7uEUglPBrd7w==
X-Google-Smtp-Source: AGHT+IGWzO6rzG5SSttMgmhDr0NNqPHWG5JVjfVEnBJ6K61otFJ0lokTV1VATssH4PYPokePCd6fLg==
X-Received: by 2002:a2e:9b13:0:b0:2c5:2813:5534 with SMTP id u19-20020a2e9b13000000b002c528135534mr9234699lji.51.1700221475597;
        Fri, 17 Nov 2023 03:44:35 -0800 (PST)
Date: Fri, 17 Nov 2023 12:44:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 2/2] xen/vpci: header: filter PCI capabilities
Message-ID: <ZVdSIUSDA5den3a3@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913143550.14565-3-stewart.hildebrand@amd.com>

On Wed, Sep 13, 2023 at 10:35:47AM -0400, Stewart Hildebrand wrote:
> Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
> Hide all other PCI capabilities (including extended capabilities) from domUs for
> now, even though there may be certain devices/drivers that depend on being able
> to discover certain capabilities.
> 
> We parse the physical PCI capabilities linked list and add vPCI register
> handlers for the next elements, inserting our own next value, thus presenting a
> modified linked list to the domU.
> 
> Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
> helper function returns a fixed value, which may be used for RAZ registers, or
> registers whose value doesn't change.
> 
> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
> pci_find_next_cap() to suit our needs, and implement the existing
> pci_find_next_cap() in terms of the new helper.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6->v7:
> * no change
> 
> v5->v6:
> * add register handlers before status register handler in init_bars()
> * s/header->mask_cap_list/mask_cap_list/
> 
> v4->v5:
> * use more appropriate types, continued
> * get rid of unnecessary hook function
> * add Jan's R-b
> 
> v3->v4:
> * move mask_cap_list setting to this patch
> * leave pci_find_next_cap signature alone
> * use more appropriate types
> 
> v2->v3:
> * get rid of > 0 in loop condition
> * implement pci_find_next_cap in terms of new pci_find_next_cap_ttl function so
>   that hypothetical future callers wouldn't be required to pass &ttl.
> * change NULL to (void *)0 for RAZ value passed to vpci_read_val
> * change type of ttl to unsigned int
> * remember to mask off the low 2 bits of next in the initial loop iteration
> * change return type of pci_find_next_cap and pci_find_next_cap_ttl
> * avoid wrapping the PCI_STATUS_CAP_LIST condition by using ! instead of == 0
> 
> v1->v2:
> * change type of ttl to int
> * use switch statement instead of if/else
> * adapt existing pci_find_next_cap helper instead of rolling our own
> * pass ttl as in/out
> * "pass through" the lower 2 bits of the next pointer
> * squash helper functions into this patch to avoid transient dead code situation
> * extended capabilities RAZ/WI
> ---
>  xen/drivers/pci/pci.c     | 26 +++++++++-----
>  xen/drivers/vpci/header.c | 76 +++++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c   | 12 +++++++
>  xen/include/xen/pci.h     |  3 ++
>  xen/include/xen/vpci.h    |  5 +++
>  5 files changed, 113 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> index 3569ccb24e9e..8799d60c2156 100644
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,31 +39,39 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>      return 0;
>  }
>  
> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> -                               unsigned int cap)
> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> +                                   bool (*is_match)(unsigned int),
> +                                   unsigned int cap, unsigned int *ttl)

Maybe this has been discussed in previous patch versions, but why
pass a match function instead of expanding the cap parameter to
be an array of capabilities to search for?

I find it kind of weird to be able to pass both a specific capability
to match against and also a match function.

What the expected behavior if the caller provides both a match
function and a cap value?

>  {
> -    u8 id;
> -    int ttl = 48;
> +    unsigned int id;
>  
> -    while ( ttl-- )
> +    while ( (*ttl)-- )
>      {
>          pos = pci_conf_read8(sbdf, pos);
>          if ( pos < 0x40 )
>              break;
>  
> -        pos &= ~3;
> -        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>  
>          if ( id == 0xff )
>              break;
> -        if ( id == cap )
> +        if ( (is_match && is_match(id)) || (!is_match && id == cap) )
>              return pos;
>  
> -        pos += PCI_CAP_LIST_NEXT;
> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>      }
> +
>      return 0;
>  }
>  
> +unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> +                               unsigned int cap)
> +{
> +    unsigned int ttl = 48;
> +
> +    return pci_find_next_cap_ttl(sbdf, pos, NULL, cap, &ttl) & ~3;
> +}
> +
>  /**
>   * pci_find_ext_capability - Find an extended capability
>   * @sbdf: PCI device to query
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index af267b75ac31..1e7dfe668ccf 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -513,6 +513,18 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static bool cf_check vpci_cap_supported(unsigned int id)
> +{
> +    switch ( id )
> +    {
> +    case PCI_CAP_ID_MSI:
> +    case PCI_CAP_ID_MSIX:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
>  static int cf_check init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -545,6 +557,70 @@ static int cf_check init_bars(struct pci_dev *pdev)

We might have to rename this to init_header() now :).

>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
> +        {
> +            /* RAZ/WI */

That RAZ/WI acronym seems very Arm specific (TBH I had to search for
it).

FWIW, it's my understanding that if the status register doesn't report
the capability list support, the register is unimplemented, and hence
would be fine to return ~0 from reads of PCI_CAPABILITY_LIST?

IOW: I'm not sure we need to add this handler for PCI_CAPABILITY_LIST
if it's not supported.

Thanks, Roger.

