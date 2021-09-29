Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426341C1B1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198944.352698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW07-0001GB-W6; Wed, 29 Sep 2021 09:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198944.352698; Wed, 29 Sep 2021 09:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW07-0001EC-Sy; Wed, 29 Sep 2021 09:35:43 +0000
Received: by outflank-mailman (input) for mailman id 198944;
 Wed, 29 Sep 2021 09:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpj4=OT=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVW07-0001E6-4X
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:35:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0488ef5b-c184-44d5-8f03-5836a7de54ea;
 Wed, 29 Sep 2021 09:35:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97677D6E;
 Wed, 29 Sep 2021 02:35:41 -0700 (PDT)
Received: from [10.57.23.68] (unknown [10.57.23.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DECE3F793;
 Wed, 29 Sep 2021 02:35:39 -0700 (PDT)
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
X-Inumbo-ID: 0488ef5b-c184-44d5-8f03-5836a7de54ea
Subject: Re: [PATCH v2 02/11] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-3-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <974e0546-545d-633b-08be-5a331e689ef3@arm.com>
Date: Wed, 29 Sep 2021 11:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125501.234252-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned some work on vPCI side needs
> to be done for that device. Introduce a pair of hooks so vPCI can handle
> that.
> 
> Please note, that in the current design the error path is handled by
> the toolstack via XEN_DOMCTL_assign_device/XEN_DOMCTL_deassign_device,
> so this is why it is acceptable not to de-assign devices if vPCI's
> assign fails, e.g. the roll back will be handled on deassign_device when
> it is called by the toolstack.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
Reviewed-by: Michal Orzel <michal.orzel@arm.com>


