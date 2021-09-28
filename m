Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4D41A9E6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197705.350909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7gs-0005p0-Gz; Tue, 28 Sep 2021 07:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197705.350909; Tue, 28 Sep 2021 07:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7gs-0005nE-DW; Tue, 28 Sep 2021 07:38:14 +0000
Received: by outflank-mailman (input) for mailman id 197705;
 Tue, 28 Sep 2021 07:38:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mV7gr-0005n2-QT
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:38:13 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 08ec92cd-202f-11ec-bc6f-12813bfff9fa;
 Tue, 28 Sep 2021 07:38:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65D68D6E;
 Tue, 28 Sep 2021 00:38:12 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D2C3F7B4;
 Tue, 28 Sep 2021 00:38:09 -0700 (PDT)
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
X-Inumbo-ID: 08ec92cd-202f-11ec-bc6f-12813bfff9fa
Subject: Re: [PATCH v2 09/11] vpci/header: Reset the command register when
 adding devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-10-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <f55e0c0f-5843-ba5f-aad7-95cecf5003f8@arm.com>
Date: Tue, 28 Sep 2021 09:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125501.234252-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when passing through a PCI device:
> it is possible that when passing through a PCI device its memory
> decoding bits in the command register are already set. Thus, a
> guest OS may not write to the command register to update memory
> decoding, so guest mappings (guest's view of the BARs) are
> left not updated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - do not write 0 to the command register, but respect host settings.
> ---
>  xen/drivers/vpci/header.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Michal Orzel <michal.orzel@arm.com>


