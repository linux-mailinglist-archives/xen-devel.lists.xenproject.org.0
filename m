Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6229CFCF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 12:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13571.34244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXjzp-0002yY-6p; Wed, 28 Oct 2020 11:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13571.34244; Wed, 28 Oct 2020 11:52:05 +0000
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
	id 1kXjzp-0002yD-3P; Wed, 28 Oct 2020 11:52:05 +0000
Received: by outflank-mailman (input) for mailman id 13571;
 Wed, 28 Oct 2020 11:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXjzn-0002y7-Hk
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:52:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9936a26f-734a-4594-90c6-d643d55aebff;
 Wed, 28 Oct 2020 11:52:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B008AC97;
 Wed, 28 Oct 2020 11:52:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXjzn-0002y7-Hk
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:52:03 +0000
X-Inumbo-ID: 9936a26f-734a-4594-90c6-d643d55aebff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9936a26f-734a-4594-90c6-d643d55aebff;
	Wed, 28 Oct 2020 11:52:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603885921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iuwYJfNBzBhzAi3pieRVMFr8JOzItk4j7lHBl/TIFt8=;
	b=q3ypEUzjndjDgCBPG82CESf82vsxNElJdsssdcsyc83wPDxfpU83gSciog72DHeO6Z4mHN
	Yul1ZcQ0lSqrbm6jfyS80Cee6gyvmZ+k/6Jwj5CRwv758ReFhOqH1iqNWQ8bRZEq6kdVUv
	S/wgNwxsZrHGGE4pSO6WzjM4kC2t/Ak=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B008AC97;
	Wed, 28 Oct 2020 11:52:01 +0000 (UTC)
Subject: Re: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86 directory.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1603731279.git.rahul.singh@arm.com>
 <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
Date: Wed, 28 Oct 2020 12:51:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:17, Rahul Singh wrote:
> passthrough/pci.c file is common for all architecture, but there is x86
> sepcific code in this file.

The code you move doesn't look to be x86 specific in the sense that
it makes no sense on other architectures, but just because certain
pieces are missing on Arm. With this I question whether is it really
appropriate to move this code. I do realize that in similar earlier
cases my questioning was mostly ignored ...

> --- /dev/null
> +++ b/xen/drivers/passthrough/x86/pci.c
> @@ -0,0 +1,97 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <xen/pci.h>
> +#include <xen/pci_regs.h>
> +
> +static int pci_clean_dpci_irq(struct domain *d,
> +                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
> +{
> +    struct dev_intx_gsi_link *digl, *tmp;
> +
> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> +
> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
> +        kill_timer(&pirq_dpci->timer);
> +
> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> +    {
> +        list_del(&digl->list);
> +        xfree(digl);
> +    }
> +
> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> +
> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
> +        return 0;
> +
> +    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
> +
> +    return -ERESTART;
> +}
> +
> +static int pci_clean_dpci_irqs(struct domain *d)
> +{
> +    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
> +
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    if ( !is_hvm_domain(d) )
> +        return 0;
> +
> +    spin_lock(&d->event_lock);
> +    hvm_irq_dpci = domain_get_irq_dpci(d);
> +    if ( hvm_irq_dpci != NULL )
> +    {
> +        int ret = 0;
> +
> +        if ( hvm_irq_dpci->pending_pirq_dpci )
> +        {
> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
> +                 ret = -ERESTART;
> +            else
> +                 hvm_irq_dpci->pending_pirq_dpci = NULL;
> +        }
> +
> +        if ( !ret )
> +            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> +        if ( ret )
> +        {
> +            spin_unlock(&d->event_lock);
> +            return ret;
> +        }
> +
> +        hvm_domain_irq(d)->dpci = NULL;
> +        free_hvm_irq_dpci(hvm_irq_dpci);
> +    }
> +    spin_unlock(&d->event_lock);
> +    return 0;

While moving please add the missing blank line before the main
return statement of the function.

> +}
> +
> +int arch_pci_release_devices(struct domain *d)
> +{
> +    return pci_clean_dpci_irqs(d);
> +}

Why the extra function layer?

Jan

