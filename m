Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFA1B2383
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 12:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQpj8-0004xD-Gj; Tue, 21 Apr 2020 10:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQpj6-0004x8-UZ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 10:02:00 +0000
X-Inumbo-ID: 23b89896-83b7-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23b89896-83b7-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 10:01:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B11D7ABF4;
 Tue, 21 Apr 2020 10:01:57 +0000 (UTC)
Subject: Re: [PATCH 1/1] x86/vtd: Mask DMAR faults for IGD devices
To: Brendan Kerrigan <brendank310@gmail.com>
References: <20200417133626.72302-1-brendank310@gmail.com>
 <20200417133626.72302-2-brendank310@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2738a150-89b4-0ffa-aa25-4e6a99bd3be8@suse.com>
Date: Tue, 21 Apr 2020 12:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417133626.72302-2-brendank310@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, kevin.tian@intel.com,
 Brendan Kerrigan <kerriganb@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 15:36, Brendan Kerrigan wrote:
> The Intel graphics device records DMAR faults regardless
> of the Fault Process Disable bit being set.

I can't seem to be able to find a place where we would set FPD.
Why do we need the workaround then, or what am I missing?

> When this fault
> occurs, enable the Interrupt Mask (IM) bit in the Fault
> Event Control (FECTL) register to prevent the continued
> recording of the fault.

This should mention the underlying erratum in one way or another.

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -41,6 +41,8 @@
>  #include "vtd.h"
>  #include "../ats.h"
>  
> +#define IS_IGD(seg, id) (0 == seg && 0 == PCI_BUS(id) && 2 == PCI_SLOT(id) && 0 == PCI_FUNC(id))
> +
>  struct mapped_rmrr {
>      struct list_head list;
>      u64 base, end;
> @@ -872,6 +874,13 @@ static int iommu_page_fault_do_one(struct vtd_iommu *iommu, int type,
>      printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s\n",
>             kind, fault_reason, reason);
>  
> +    if ( DMA_REMAP == fault_type && type && IS_IGD(seg, source_id) ) {

Using existing infrastructure would be at least some improvement, in
particular to avoid this workaround triggering on unaffected
hardware (including such where there's something else at 0000:00:02.0).
See e.g. is_igd_drhd(), and note that most uses of it are currently
further qualified to limit what hardware quirk workarounds get applied
to. In any event you'll want to clarify in the description that this
won't ever be done on hardware not having this issue, at least as long
as this isn't obvious from the code.

Also - why the "type" part of the conditional? The erratum text
doesn't talk about only DMA reads being affected.

Finally, style-wise the brace belongs on its own line.

> +        u32 fectl = dmar_readl(iommu->reg, DMAR_FECTL_REG);
> +        fectl |= DMA_FECTL_IM;

While this is the recommended workaround, I don't see you undoing
the masking anywhere later, and I'm also unconvinced this should be
done upon seeing the first fault. One option might be to do so on the
the first fault when FPD is set for the offending device. Or else,
following the title, it might want/need doing unconditionally at
initialization time.

> +        dmar_writel(iommu->reg, DMAR_FECTL_REG, fectl);
> +        printk(XENLOG_G_WARNING VTDPREFIX "Disabling DMAR faults for IGD\n");

If, as suggested above, IM will get cleared again at some point,
this printk() should imo not be issued more than once.

Jan

