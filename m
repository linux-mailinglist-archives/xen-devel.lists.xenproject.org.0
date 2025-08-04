Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C529B1A3EC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069420.1433280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivfS-000717-Mk; Mon, 04 Aug 2025 13:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069420.1433280; Mon, 04 Aug 2025 13:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivfS-0006zG-JH; Mon, 04 Aug 2025 13:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1069420;
 Mon, 04 Aug 2025 13:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uivfR-0006ys-DF
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:55:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6763ab-713a-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 15:55:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so2875853f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:55:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458953cfd10sm222481905e9.21.2025.08.04.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:55:55 -0700 (PDT)
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
X-Inumbo-ID: be6763ab-713a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754315756; x=1754920556; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsI3gFn30N/s06axQ4heKlfLhQn0gveUpkn83xDaLI0=;
        b=dPkS0k4ugv1VN+H/9GBIrjG6NCLcs5q2hVdgeH5UZ3ortI7TqI/ZShdwbYPKMooEwy
         DZPqDMHLwu/TLO8i9XMu+oxz9z6ND/WBmJrdIxKWrWCCYilXDZa3gSxMrpSnJgUXYaRJ
         DDDnrAb5pV0719TNUh1H0V3TCQ5alCgFcmGnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315756; x=1754920556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsI3gFn30N/s06axQ4heKlfLhQn0gveUpkn83xDaLI0=;
        b=bMhKnDvJAS51+cbpxs1WJF+DAhGplGjT/UvlqZgAjnnVE0ipyjQzzC2wCMeZZO3ZB6
         7A7EPB3hbqySy7YXaOtUVPK6vjOOQwvJn5RhkCevpUV8eL3vDqgQKlVWo1XpK87JPgu0
         UQ1XGx9rtcURtRvZpFWQMu/1+jsdHzAM5MsYIDhrJU66H7W+1+DxukdOCLCF8iepP20i
         Dn3/JYKUo8vSe/I0BW/8KaKBNln/8sDu17fGlqmi4pJfcs6r4ZNO0QTUKA/wBiAKqRdT
         5OsH6UDLLt/N5gJYOiKrZPYONc6twZWWE0Sq3M9iCAEJK7TTcAoJjaSezXdwbwLkdqcU
         j6pg==
X-Gm-Message-State: AOJu0Yy67pD7oEt/V/v7PyviqKrygqRXMkBiX7wbBMORyf6IOe4vW6f6
	2G7f9WOoop0a58yuuDgT2ZBuP8kc/YkdmDX8loC0AezS+Yq3jDcppCJ+7NpiajqmOW0=
X-Gm-Gg: ASbGncv8NzIycVMpMQD3KM9ht0R7P56qW8V9wgeBW5e/IFegd0HR+U34vQBWOjAqux1
	67ks/I4lRhp1oSRbUpPgAjz3VgNWE3175Nd0ji6wrbp08/qUc0SdXyyAyEh3p8NRysaHSmwOq/R
	u6rDBUcqf4QY4oMkw3Ur0i2ZsPYK7wbeuM8qHALtVo5rNIAjk2Kq+Jv/sdY6rrMRQ66R0X5mylo
	I7wKJ1tQKPG8JQC9Xemcuw7Wwdrt0An2UtQjuOmzs9fH8uXtucM6bDktiIyzA1LaAq+rKWN+A2L
	QKVm4IpQ/SalQayXAx98kYI2haSW0sTkDPxsrEt6RiL2s7xpqFgcG7YfLdQCznvTI2AiwySp+EX
	UPp9YHwVdWkjlzoCxLI+s9bHS2Zk3RlV7yBHEFpfMXjPLg1XjqA7u77YUAFnmrc2NypJBY4f/1k
	fi
X-Google-Smtp-Source: AGHT+IEn+3uWNjTtUCcggdKwlvKJZOdQh/qZ63hFIt0q/8twa97oI/n10Ogs/fDgjZLQJYokAp8GfQ==
X-Received: by 2002:a05:6000:26ca:b0:3b7:dd87:d73f with SMTP id ffacd0b85a97d-3b8d94c6708mr7064860f8f.43.1754315755964;
        Mon, 04 Aug 2025 06:55:55 -0700 (PDT)
Date: Mon, 4 Aug 2025 15:55:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aJC76twnBXNQnA3d@macbook.local>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
 <aIJi8E2BC-dzAIz8@macbook.local>
 <aIM5IR-d4_u19JVe@macbook.local>
 <6d5545a2-bbf0-4cf9-9820-5eaf6d8530f8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d5545a2-bbf0-4cf9-9820-5eaf6d8530f8@amd.com>

On Fri, Aug 01, 2025 at 05:06:32PM -0400, Stewart Hildebrand wrote:
> On 7/25/25 03:58, Roger Pau Monné wrote:
> > On Thu, Jul 24, 2025 at 06:44:32PM +0200, Roger Pau Monné wrote:
> >> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> >>> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >>>      return rc;
> >>>  }
> >>>  
> >>> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> >>> +                                            uint16_t cmd, bool rom_only)
> >>> +{
> >>> +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
> >>
> >> xvzalloc() preferably.
> >>
> >> This however introduces run-time allocations as a result of guest
> >> actions, which is not ideal IMO.  It would be preferable to do those
> >> allocations as part of the header initialization, and re-use them.
> > 
> > I've been thinking over this, as I've realized that while commenting
> > on it, I didn't provide any alternatives.
> > 
> > The usage of rangesets to figure out the regions to map is already not
> > optimal, as adding/removing from a rangeset can lead to memory
> > allocations.  It would be good if we could create rangesets with a
> > pre-allocated number of ranges (iow: a pool of struct ranges), but
> > that's for another patchset.  I think Jan already commented on this
> > aspect long time ago.
> 
> +1
> 
> > I'm considering whether to allocate the deferred mapping structures
> > per-vCPU instead of per-device.  That would for example mean moving
> > the current vpci_bar->mem rangeset so it's allocated in vpci_vcpu
> > struct instead.  The point would be to not have the rangesets per
> > device (because there can be a lot of devices, specially for the
> > hardware domain), but instead have those per-vCPU.  This should work
> > because a vCPU can only queue a single vPCI operation, from a single
> > device.
> > 
> > It should then be possible to allocate the deferred mapping structures
> > at vCPU creation.  I also ponder if we really need a linked list to
> > queue them; AFAIK there can only ever be an unmapping and a mapping
> > operation pending (so 2 operations at most).  Hence we could use a
> > more "fixed" structure like an array.  For example in struct vpci_vcpu
> > you could introduce a struct vpci_map_task task[2] field?
> > 
> > Sorry, I know this is not a minor change to request.  It shouldn't
> > change the overall logic much, but it would inevitably affect the
> > code.  Let me know what you think.
> 
> Thanks for the feedback and suggestion. Yeah, I'll give this a try.
> Here's roughly what I'm thinking so far. I'll keep playing with it.
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629eeb..942c9fe7d364 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -387,6 +387,16 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>   */
>  static int vcpu_teardown(struct vcpu *v)
>  {
> +#ifdef CONFIG_HAS_VPCI
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
> +    {
> +        struct vpci_map_task *task = &v->vpci.task[i];
> +
> +        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
> +            rangeset_destroy(task->bars[j].mem);

You might want to additionally do:

task->bars[j].mem = NULL;

> +    }
> +#endif
> +
>      vmtrace_free_buffer(v);
>  
>      return 0;
> @@ -467,6 +477,26 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>          d->vcpu[prev_id]->next_in_list = v;
>      }
>  
> +#ifdef CONFIG_HAS_VPCI
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
> +    {
> +        struct vpci_map_task *task = &v->vpci.task[i];
> +
> +        for ( unsigned int j = 0; j < ARRAY_SIZE(task->bars); j++ )
> +        {
> +            struct vpci_bar_map *bar = &task->bars[j];
> +            char str[32];
> +
> +            snprintf(str, sizeof(str), "PCI map vcpu %u task %u BAR %u", vcpu_id, i, j);
> +
> +            bar->mem = rangeset_new(v->domain, str, RANGESETF_no_print);

Not sure there's much point in naming those with that much detail -
those are scratch space for mapping calculations.  You already pass
RANGESETF_no_print, which means the contents of the rangeset won't be
dumped, and hence the name is kind of meaningless.  I shouldn't have
named those either when allocated in bar_add_rangeset().

> +
> +            if ( !bar->mem )
> +                goto fail_sched;
> +        }
> +    }
> +#endif
> +
>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
>      vcpu_check_shutdown(v);
>  
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 17cfecb0aabf..afe78b00ffc9 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -116,7 +116,6 @@ struct vpci {
>              uint64_t guest_addr;
>              uint64_t size;
>              uint64_t resizable_sizes;
> -            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -207,14 +206,23 @@ struct vpci {
>  #endif
>  };
>  
> +#ifdef __XEN__
>  struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
>      const struct pci_dev *pdev;
> -    uint16_t cmd;
> -    bool rom_only : 1;
> +    struct domain *domain;
> +    unsigned int nr_pending_ops;

Not sure you really need a pending ops counter?  Hard to tell without
seeing the code that makes use of it.

> +    struct vpci_map_task {
> +        struct vpci_bar_map {
> +            uint64_t addr;
> +            uint64_t guest_addr;
> +            struct rangeset *mem;
> +        } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
> +        uint16_t cmd;
> +        bool rom_only : 1;
> +    } task[2];

Don't you need a way to differentiate between map/unmap operations?
Do you plan to use slot 0 as unmap and slot 1 as map?  Or would you
rather introduce a boolean field to signal it in struct vpci_map_task?

Overall seems OK, but obviously it all needs to fit together with the
current code :).

Thanks, Roger.

