Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3B3838E7
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 18:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128407.241074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifjQ-0007Wm-RS; Mon, 17 May 2021 16:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128407.241074; Mon, 17 May 2021 16:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifjQ-0007UX-Ny; Mon, 17 May 2021 16:04:36 +0000
Received: by outflank-mailman (input) for mailman id 128407;
 Mon, 17 May 2021 16:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lifjP-0007UK-8T
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 16:04:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a491ef-dc0d-4fe9-8afe-f8fdb702ceb0;
 Mon, 17 May 2021 16:04:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91CBDAE93;
 Mon, 17 May 2021 16:04:33 +0000 (UTC)
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
X-Inumbo-ID: 59a491ef-dc0d-4fe9-8afe-f8fdb702ceb0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621267473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2udeP0s/0Phpi1/aYfpqyEl1NJS8a8IWCFR+P5vLWA=;
	b=EOEyGU8fjmXayF7AlDefARVbsi+00SC4LzmSFjXYqqEtw9bmtfghNkj3oJRDXek1SWiMnW
	4wHJFHcWNeUTo1gnYJ+I9Q9sueezBVTYBw8zHSFScPQha9tX0m9Y+YMXwyFs8PR/30UXHW
	VMM3qqq51yBvD1NBxKgEHmeOHBTJYFU=
Subject: Re: [PATCH v5 1/2] xen/pci: Refactor PCI MSI intercept related code
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1620661205.git.rahul.singh@arm.com>
 <73305c5cb5b805618ec24405c1848d240a786a89.1620661205.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c049229-8a5e-3100-f27d-c8eaa4914a55@suse.com>
Date: Mon, 17 May 2021 18:04:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <73305c5cb5b805618ec24405c1848d240a786a89.1620661205.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.05.2021 17:47, Rahul Singh wrote:
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi-intercept.c
> @@ -0,0 +1,55 @@
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
> +    printk("- MSIs < ");
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +    printk(">");
> +}

I guess I didn't look closely enough in earlier versions: I don't
see how either of the two functions is intercept related. If they
need separating out, they want to go into a file named msi.c (and,
as said before on other similar changes in the following patch,
not be keyed to HAS_PCI_MSI_INTERCEPT).

I'm sorry for noticing this only now.

Jan

