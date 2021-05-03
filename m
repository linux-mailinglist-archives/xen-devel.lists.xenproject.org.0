Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A483716C0
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121655.229439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZin-0003nA-I4; Mon, 03 May 2021 14:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121655.229439; Mon, 03 May 2021 14:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZin-0003mn-EY; Mon, 03 May 2021 14:38:53 +0000
Received: by outflank-mailman (input) for mailman id 121655;
 Mon, 03 May 2021 14:38:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldZim-0003mi-Iz
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:38:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13357f0e-b62f-41b8-befb-bed81e559c3f;
 Mon, 03 May 2021 14:38:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B12FB154;
 Mon,  3 May 2021 14:38:50 +0000 (UTC)
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
X-Inumbo-ID: 13357f0e-b62f-41b8-befb-bed81e559c3f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620052730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI0/5AZAJ0srZZhXeydEjwnccgoJ4Y6/d/4/L9xJUeU=;
	b=ms0MGcdcfMhSPzt9WJ1HFCIJgRFRWABiTCNVYc0AMImCutqT07ZwHrggz9frmm8sYGQ9rD
	ktCs7asBWa4h45KuaHiu/Rj/T21ZQMYpYQy5G2xs8mCjsO7wXoxVi3AbuK8wvwOQt4Q+Jk
	miyhReHo8WxpsyrzMF/Jza8+E4ILvgY=
Subject: Re: [PATCH v4 2/3] xen/pci: Refactor PCI MSI intercept related code
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1619707144.git.rahul.singh@arm.com>
 <07cb9f45a91a283af1991c42266555bb0bfe3b71.1619707144.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65539f2a-8b0c-7f1a-6de1-4032140a4e0e@suse.com>
Date: Mon, 3 May 2021 16:38:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <07cb9f45a91a283af1991c42266555bb0bfe3b71.1619707144.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 16:46, Rahul Singh wrote:
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi-intercept.c
> @@ -0,0 +1,53 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.
> + *
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
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/msi.h>
> +#include <asm/hvm/io.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc = pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_dump_msi(const struct pci_dev *pdev)
> +{
> +    const struct msi_desc *msi;
> +
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("- MSIs < %d >", msi->irq);

Only the %d and a blank should be part of the format string inside the
loop body; the rest wants printing exactly once.

> +static inline size_t vmsix_table_size(const struct vpci *vpci, unsigned int nr)
> +{
> +    return
> +        (nr == VPCI_MSIX_TABLE) ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
> +                                : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries,
> +                                                       8), 8);

I'm afraid I don't view this as an acceptable way of wrapping lines.
How about

    return (nr == VPCI_MSIX_TABLE)
           ? vpci->msix->max_entries * PCI_MSIX_ENTRY_SIZE
           : ROUNDUP(DIV_ROUND_UP(vpci->msix->max_entries, 8), 8);

> @@ -428,6 +458,31 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +int vpci_remove_msix_regions(const struct vpci *vpci, struct rangeset *mem)
> +{
> +    const struct vpci_msix *msix = vpci->msix;
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        unsigned long start = PFN_DOWN(vmsix_table_addr(vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_table_addr(vpci, i) +
> +                vmsix_table_size(vpci, i) - 1);
> +
> +        rc = rangeset_remove_range(mem, start, end);
> +        if ( rc )
> +        {
> +            printk(XENLOG_G_WARNING
> +                    "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                    start, end, rc);

Indentation looks to be off by one space on the last two lines.

> --- /dev/null
> +++ b/xen/include/xen/msi-intercept.h
> @@ -0,0 +1,49 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.
> + *
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
> +#ifndef __XEN_MSI_INTERCEPT_H_
> +#define __XEN_MSI_INTERCEPT_H_
> +
> +#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT
> +
> +#include <asm/msi.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
> +void pdev_dump_msi(const struct pci_dev *pdev);
> +
> +#else /* !CONFIG_HAS_PCI_MSI_INTERCEPT */
> +
> +static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}

I don't think this last one is intercept related (and hence doesn't belong
here)?

> @@ -148,6 +150,7 @@ struct vpci_vcpu {
>  };
>  
>  #ifdef __XEN__
> +#ifdef CONFIG_HAS_PCI_MSI_INTERCEPT

Since both start and ...

> +static inline void vpci_msi_free(struct vpci *vpci) {}
> +#endif /* CONFIG_HAS_PCI_MSI_INTERCEPT */
>  #endif /* __XEN__ */

... end look to match, may I suggest to simply replace the __XEN__ ones,
as the test harness isn't supposed to (randomly) define CONFIG_*? Or
alternatively at least combine both #ifdef-s?

Jan

