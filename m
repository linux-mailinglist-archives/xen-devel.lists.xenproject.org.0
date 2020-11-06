Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA92A9222
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20510.46439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxk3-0006JJ-3i; Fri, 06 Nov 2020 09:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20510.46439; Fri, 06 Nov 2020 09:09:07 +0000
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
	id 1kaxk3-0006Iu-0Z; Fri, 06 Nov 2020 09:09:07 +0000
Received: by outflank-mailman (input) for mailman id 20510;
 Fri, 06 Nov 2020 09:09:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaxk1-0006Ip-QG
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:09:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cce111b2-c1c0-4b01-8244-8c8b76aa5996;
 Fri, 06 Nov 2020 09:09:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0B21AB8F;
 Fri,  6 Nov 2020 09:09:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaxk1-0006Ip-QG
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:09:05 +0000
X-Inumbo-ID: cce111b2-c1c0-4b01-8244-8c8b76aa5996
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cce111b2-c1c0-4b01-8244-8c8b76aa5996;
	Fri, 06 Nov 2020 09:09:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604653742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anT098hY0iHyYy/U3eo5egMoauESDK4ppoA7DCQR5Jc=;
	b=f10fN1k0FBeS0VDbbl8piuInASDjdNNkfK0KZuWR12SL2i5eMMe51bolsWmeMKYBnTnL9/
	eOmBoZ10aj39paGNyPOHf9C1JJODyL6d/5n2Zaseuv3grL6+BxzIYB3WKxNExwJZOyajwP
	ZOkvrsUAfYPAb4ROq8c4qmFu+Pcyh+o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F0B21AB8F;
	Fri,  6 Nov 2020 09:09:01 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
To: Rahul Singh <rahul.singh@arm.com>
Cc: Bertrand.Marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1604417224.git.rahul.singh@arm.com>
 <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c49bf07f-3d39-b8e8-a3ed-a620aa5de5df@suse.com>
Date: Fri, 6 Nov 2020 10:09:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 16:59, Rahul Singh wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -14,7 +14,6 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include <xen/sched.h>
>  #include <xen/pci.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>

I think this hunk wants dropping - struct domain continues to be used
in this file, for example.

> @@ -847,71 +845,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> -static int pci_clean_dpci_irq(struct domain *d,
> -                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
> -{
> -    struct dev_intx_gsi_link *digl, *tmp;
> -
> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> -
> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
> -        kill_timer(&pirq_dpci->timer);
> -
> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> -    {
> -        list_del(&digl->list);
> -        xfree(digl);
> -    }
> -
> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> -
> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
> -        return 0;
> -
> -    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
> -
> -    return -ERESTART;
> -}
> -
> -static int pci_clean_dpci_irqs(struct domain *d)
> -{
> -    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
> -
> -    if ( !is_iommu_enabled(d) )
> -        return 0;
> -
> -    if ( !is_hvm_domain(d) )
> -        return 0;
> -
> -    spin_lock(&d->event_lock);
> -    hvm_irq_dpci = domain_get_irq_dpci(d);
> -    if ( hvm_irq_dpci != NULL )
> -    {
> -        int ret = 0;
> -
> -        if ( hvm_irq_dpci->pending_pirq_dpci )
> -        {
> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
> -                 ret = -ERESTART;
> -            else
> -                 hvm_irq_dpci->pending_pirq_dpci = NULL;
> -        }
> -
> -        if ( !ret )
> -            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> -        if ( ret )
> -        {
> -            spin_unlock(&d->event_lock);
> -            return ret;
> -        }
> -
> -        hvm_domain_irq(d)->dpci = NULL;
> -        free_hvm_irq_dpci(hvm_irq_dpci);
> -    }
> -    spin_unlock(&d->event_lock);
> -    return 0;
> -}

If this code gets moved, I think it ought to move into
xen/drivers/passthrough/io.c, as that's where all the companion code
sits. (The file as a whole, getting built for x86/HVM only, may want
moving to xen/drivers/passthrough/x86/ if the underlying model isn't
suitable for Arm. Then it probably also would want to be named hvm.c,
to express its limited purpose.)

Jan

