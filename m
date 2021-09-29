Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A472441C19A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198923.352672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVsZ-0007XK-OV; Wed, 29 Sep 2021 09:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198923.352672; Wed, 29 Sep 2021 09:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVsZ-0007VX-LM; Wed, 29 Sep 2021 09:27:55 +0000
Received: by outflank-mailman (input) for mailman id 198923;
 Wed, 29 Sep 2021 09:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpj4=OT=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVVsY-0007VR-FE
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:27:54 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id efab97b2-9884-4b70-83c1-07140577f68b;
 Wed, 29 Sep 2021 09:27:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADC6D6E;
 Wed, 29 Sep 2021 02:27:52 -0700 (PDT)
Received: from [10.57.23.68] (unknown [10.57.23.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D1073F793;
 Wed, 29 Sep 2021 02:27:49 -0700 (PDT)
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
X-Inumbo-ID: efab97b2-9884-4b70-83c1-07140577f68b
Subject: Re: [PATCH v2 05/11] vpci/header: Implement guest BAR register
 handlers
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-6-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <4ab8c8fb-7821-fcc1-acb5-1d8cec49e4c0@arm.com>
Date: Wed, 29 Sep 2021 11:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125501.234252-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM is x86 only, so it
> might not be used by other architectures without emulating x86. Other
> use-cases may include using that expansion ROM before Xen boots, hence
> no emulation is needed in Xen itself. Or when a guest wants to use the
> ROM code which seems to be rare.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 30 +++++++++++++++++++++++++++++-
>  xen/include/xen/vpci.h    |  3 +++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
FWICS you addressed all Jan's comments from v1 so:

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

