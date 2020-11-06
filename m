Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334112A9266
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20516.46452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxwZ-0007yG-AV; Fri, 06 Nov 2020 09:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20516.46452; Fri, 06 Nov 2020 09:22:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxwZ-0007xr-7Q; Fri, 06 Nov 2020 09:22:03 +0000
Received: by outflank-mailman (input) for mailman id 20516;
 Fri, 06 Nov 2020 09:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaxwX-0007xm-4W
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:22:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddffdeba-9bfa-4819-9dfe-392daac43a81;
 Fri, 06 Nov 2020 09:21:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41F80ACD5;
 Fri,  6 Nov 2020 09:21:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaxwX-0007xm-4W
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:22:01 +0000
X-Inumbo-ID: ddffdeba-9bfa-4819-9dfe-392daac43a81
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ddffdeba-9bfa-4819-9dfe-392daac43a81;
	Fri, 06 Nov 2020 09:21:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604654516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7dntEEjArwnHoSUb3deA3LDODtxOhxCvIj10IA1iUc=;
	b=XEiFtXc0ZyF+Uf7UrJyJhPGV1WApJzWEdzzP46RsRSREfTZ/PgYpITsx9fQFuKYCIhmpE0
	/d9IXhpP+55pjuCCoKb1FPPftghtV+jqVano181904L6ocNvMI8XLFZ58xMpHQyW3wy13+
	ILJa/nqQp2aCPGFftk7QuwufNDIOjdQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41F80ACD5;
	Fri,  6 Nov 2020 09:21:56 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
To: Rahul Singh <rahul.singh@arm.com>
Cc: Bertrand.Marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1604417224.git.rahul.singh@arm.com>
 <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c3c43c3-241d-4cea-cbad-4184523450c3@suse.com>
Date: Fri, 6 Nov 2020 10:21:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 16:59, Rahul Singh wrote:
> If mem-sharing, mem-paging and log-dirty functionality is not enabled
> for architecture when HAS_PCI is enabled, compiler will throw an error.

Nit: Is it really "and", not "or"?

> @@ -1418,12 +1417,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> -    /* Prevent device assign if mem paging or mem sharing have been 
> -     * enabled for this domain */
> -    if ( d != dom_io &&
> -         unlikely(mem_sharing_enabled(d) ||
> -                  vm_event_check_ring(d->vm_event_paging) ||
> -                  p2m_get_hostp2m(d)->global_logdirty) )
> +    if( !arch_iommu_usable(d) )
>          return -EXDEV;

While iirc I did suggest this name, seeing it used here leaves me
somewhat unhappy with the name, albeit I also can't think of any
better alternative right now. Maybe arch_iommu_use_permitted()?

> @@ -315,6 +316,18 @@ int iommu_update_ire_from_msi(
>             ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>  }
>  
> +bool_t arch_iommu_usable(struct domain *d)

Just bool please and I very much hope the parameter can be const.

> +{
> +
> +    /* Prevent device assign if mem paging or mem sharing have been
> +     * enabled for this domain */

Please correct comment style as you move it.

> +    if ( d != dom_io && unlikely(mem_sharing_enabled(d) ||
> +                        vm_event_check_ring(d->vm_event_paging) ||
> +                        p2m_get_hostp2m(d)->global_logdirty) )

You've screwed up indentation, and I don't see why ...

> +        return false;
> +    else
> +        return true;
> +}

... this can't be a simple single return statement anyway:

    return d == dom_io ||
           likely(!mem_sharing_enabled(d) &&
                  !vm_event_check_ring(d->vm_event_paging) &&
                  !p2m_get_hostp2m(d)->global_logdirty);

In the course of moving I'd also suggest dropping the use of
likely() here: The way it's used (on an && expression) isn't
normally having much effect anyway. If anything it should imo
be

    return d == dom_io ||
           (likely(!mem_sharing_enabled(d)) &&
            likely(!vm_event_check_ring(d->vm_event_paging)) &&
            likely(!p2m_get_hostp2m(d)->global_logdirty));

Any transformation to this effect wants mentioning in the
description, though.

Jan

